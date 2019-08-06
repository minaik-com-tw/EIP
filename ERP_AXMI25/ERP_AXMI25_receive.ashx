<%@ WebHandler Language="C#" Debug="true" Class="CNE_receive" %>

using System;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.IO;
using System.Xml;
using System.Data;
using System.Diagnostics;
/// <summary>
/// 代替ERP 送簽，將資料寫入ERP_AXMI25 並送審
/// </summary>
/* Mark       Date         Author             Reason                           
* ---------------------------------------------------------------------------------------------------
* V1.0.1  2019/01/07   Carol          Modify   新增君洋 加入廠別
* V1.0.2  2019/01/08   Carol          Modify   避免單號重覆，刪除資料，若有重覆資料，Exception 寄給MIS
*/

public class CNE_receive : IHttpHandler
{

    private string con = "";
    private string path = "";
    private string fullfilename = "";
    private byte[] fileBytes;
    private string rowno = "";
    private string subject = "";
    private string isFail = "";
    private string cust = "";
    private string erp_no = "";
    private string plantid = "";
    private HttpContext cont;

    private bool isNullcontext(HttpContext context)
    {



        try
        {
            string s = context.Request.QueryString["test"].ToString();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }
    public void ProcessRequest(HttpContext context)
    {

        try
        {
            cont = context;
            string path = @"\\192.168.0.250\xml";
            string des_folder = @"\\192.168.0.250\xml_back";
            string source_folder = @"\\192.168.0.250\xml";
            rowno = Guid.NewGuid().ToString();
            con = context.Request.QueryString["file"].ToString(); //filename


            fullfilename = Path.Combine(path, con);
           // context.Response.Write("fullfilename:" + fullfilename + "<br>");
            fileBytes = System.IO.File.ReadAllBytes(fullfilename);

            //hpf.InputStream.Read(fileBytes, 0, hpf.ContentLength);
            if (fileBytes.Length > 0)
            {
                //uploadxmlfiletodatabase(fileBytes, con); //ERP　insert attached file to EIP 20180511不存入DB
                readxmltoinsert(fileBytes); //Insert EIP Data
                sendmail();

                FileInfo sourcepath = new FileInfo(fullfilename);

                FileInfo targetpath = new FileInfo(des_folder + con);

                //sourcepath.CopyTo(despath + con);

                // sourcepath.Delete();

                //sourcepath.MoveTo(despath + con);


                //System.IO.File.Copy(fullfilename, despath + con, true);
                //System.IO.File.Delete(fullfilename);
                CopytoBack(fullfilename);

                context.Response.Write(" OK ");

            }
        }
        catch (Exception ex)
        {
            context.Response.Write(ex.Message + Environment.UserName + "<BR/>" + ex.StackTrace);
            Utility.SendMail(Utility.MIS_Mail, "EIP(員工入口網站)", "ERP_AXMI25_receive.ashx Error", ex.Message + "<br>" + fullfilename + "<br>" + ex.StackTrace); //V1.0.2

        }
    }

    private void CopytoBack(string file)
    {
        string backDir = @"\\192.168.0.250\xml_back";
        string fileN = Path.GetFileName(file);
        string nf = DateTime.Now.ToString("yyMMdd_HHmm") + "_" + fileN; //2018/03/16加入timestamp
        File.Copy(file, Path.Combine(backDir, nf), true);
        File.Delete(file);

    }




    private void sendmail()
    {
        try
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            string command = "SELECT U.name , U.email,ER.occano , ER.ta_occa14 , ER.occa00 " +
                             " FROM EIPB.DBO.ERP_AXMI25 ER " +
                             " LEFT JOIN EIPA.DBO.dgusererpid e  ON e.erpid = er.occauser  " +
                             " LEFT JOIN EIPA.DBO.dguser U  ON e.id = U.id  " +
                             " WHERE 1=1 " +
                             " AND ER.ROWNO = '" + rowno + "'";
            rs.Open(command);

            if (!rs.EOF)
            {
                DBTransfer gd = new DBTransfer();
                //Response.Write("Enter Send Mail");
                string MId = "{4849B051-F909-481D-AA44-2624A881959B}";
                string PapCaption = "";
                if (rs["ta_occa14"].ToString().Contains("Y") && rs["occa00"].ToString().Contains("V"))
                    this.isFail = "原生效客戶改為失效";
                else
                    this.isFail = "原失效客戶改為有效";
                if (this.subject.Substring(0, 1) == "V")
                    PapCaption = "客戶代號申請單，" + this.isFail + "、ERP單號 " + this.erp_no + " 客戶簡稱 " + this.cust;
                else
                    PapCaption = "客戶代號申請單， " + this.subject + "、ERP單號 " + this.erp_no + " 客戶簡稱 " + this.cust;

                string PID = rs["occano"].ToString();//FIELD_pmcsn.Text + addmemo();
                string AppName = rs["name"].ToString();
                string purl = @"http://eip.minaik.com.tw/ERP_AXMI25/ERP_AXMI25Edit.aspx?ROWNO=" + rowno;
                string AppMail = rs["email"].ToString();
                string body = "";
                ShrFlowMail UseMail = new ShrFlowMail();
                UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, AppMail, body);
                //UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, "carol.yeh@minaik.com.tw", body);
            }
            else
            {
                    Utility.SendMail(Utility.MIS_Mail, "EIP(員工入口網站)", "ERP_AXMI25_receive.ashx Error","SQL="+command+"<br>找不到人 "); //V1.0.2
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message + "****** sendmail");
        }
    }
    private bool conple(string NodeName, DataColumnCollection Columns_name)
    {
        string sb = "";
        foreach (DataColumn dc in Columns_name)
        {

            if (NodeName == dc.ColumnName)
                return true;
        }


        return false;
    }

    private void readxmltoinsert(byte[] fileBytes)
    {
        string tempmessage = "";

        try
        {

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            //rs.Open("SELECT * FROM [EIPB].[dbo].[ERP_AXMI25] WHERE 1=0"); V1.0.2

            MemoryStream ms = new MemoryStream(fileBytes);
            XmlReader xmlr = XmlReader.Create(ms);
            XmlDataDocument xmldoc = new XmlDataDocument();
            xmldoc.Load(xmlr);
            XmlNamespaceManager nsmgr = new XmlNamespaceManager(xmldoc.NameTable);
            XmlNodeList xnl = xmldoc.SelectNodes("//NewDataSet/head", nsmgr);//PlantID
            XmlNodeList xnlPlantID = xmldoc.SelectNodes("//NewDataSet/PlantID", nsmgr);//PlantID
            XmlNodeList X_occano = xmldoc.SelectNodes("//NewDataSet/head/occano", nsmgr);//occano

            StringBuilder sb = new StringBuilder();

            string sql = string.Format("SELECT * FROM [EIPB].[dbo].[ERP_AXMI25] WHERE occano='{0}' and Plantid='{1}' and isState <>'isStop' ", X_occano[0].InnerText.Trim(), xnlPlantID[0].InnerText.Trim());//V1.0.2
            rs.Open(sql); //V1.0.2
            if (rs.EOF)
            { //空值

                if (rs.Add())
                {
                    rs["ROWNO"] = rowno;
                    rs["PlantID"] = xnlPlantID[0].InnerText.Trim();

                    plantid = xnlPlantID[0].InnerText.Trim();

                    foreach (XmlNode xn in xnl)
                    {
                        foreach (XmlNode xnc in xn.ChildNodes)
                        {
                            string colunmname = xnc.Name.Contains("-") ? xnc.Name.Replace("-", "_") : xnc.Name;
                            if (conple(colunmname, rs.Columns))
                            {

                                rs[colunmname] = xnc.InnerText.Trim();
                                if (colunmname == "occa00")
                                {
                                    switch (xnc.InnerText.Substring(0, 1))
                                    {
                                        case "I":
                                            this.subject = "新增";
                                            break;
                                        case "U":
                                            this.subject = "修改";
                                            break;
                                        default:
                                            this.subject = "V";
                                            break;
                                    }
                                }
                                if (colunmname == "ta_occa14" && (xnc.InnerText.Length != 0))
                                {
                                    //switch (xnc.InnerText.Substring(0, 1))
                                    //{
                                    //    case "Y":
                                    //        this.isFail = "原失效客戶改為有效";
                                    //        break;
                                    //    default:
                                    //        this.isFail = "原生效客戶改為失效";
                                    //        break;
                                    //}
                                }
                                if (colunmname == "occa02" && (xnc.InnerText.Length != 0))
                                {
                                    this.cust = xnc.InnerText.Trim();
                                }


                                if (colunmname == "occano" && (xnc.InnerText.Length != 0))
                                {
                                    this.erp_no = xnc.InnerText.Trim();

                                    searchthesameerpno();
                                }


                                //tempmessage += xnc.Name+" = "+ xnc.InnerText + " Length = "+rs.Columns[xnc.Name].+"<br/>";
                            }
                        }
                    }
                    //throw new Exception(tempmessage);
                    rs["updatetime"] = DateTime.Now;
                    rs["isState"] = "waiting";
                    rs.Update();
                    rs.Close();


                }
                else
                {
                    throw new Exception("not insert");
                }

            }
            else
            {
                //V1.0.2
                string msg = string.Format("資料重覆 ERP ID:{0} , PlantID:{1}<br>,SQL:{2}", X_occano[0].InnerText.Trim(), xnlPlantID[0].InnerText.Trim(),sql);
                throw new Exception(msg);
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message + "<br/>" + tempmessage + "readxml to insert");
        }
    }
    private void searchthesameerpno()
    {
        try
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            string command = "SELECT * " +
                             "    FROM EIPB.DBO.ERP_AXMI25  " +
                             "  WHERE OCCANO = '" + erp_no + "'" +
                             "  and PlantID = '" + plantid + "'" + //V1.0.1
                             "    AND ROWNO != '" + rowno + "'"; //以ERP NO為主， 一樣的刪掉 
            rs.Open(command);
            while (!rs.EOF)
            {
                SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs1.Open("DELETE EIPB.DBO.ERP_AXMI25 WHERE ROWNO = '" + rs["ROWNO"].ToString() + "'");
                //rs1.Open("DELETE EIPB.DBO.ERP_AXMI25_File WHERE ROWNO = '" + rs["ROWNO"].ToString() + "'"); delete by carol 20180515　xml 已留存為250內，DB 不留
                //rs1.Open("DELETE EIPB.DBO.ERP_AXMI25_TEMP WHERE ROWNO = '" + rs["ROWNO"].ToString() + "'"); delete by carol 20180515
                rs1.Open("DELETE EIPB.DBO.ERP_AXMI25_TEMP WHERE NO = '" + erp_no + "' and zone='" + plantid + "' "); //記錄客代最後一筆異動的資料，以ERP_NO 為 Key　by carol 20180515  //V1.0.1
                rs1.Open("DELETE EIPB.DBO.ERP_AXMI25_UpdateFile WHERE ROWNO = '" + rs["ROWNO"].ToString() + "'");
                rs1.Open("DELETE EIPA.DBO.dgflowqueue WHERE requestquerystring LIKE '%" + rs["ROWNO"].ToString() + "'");
                rs1.Close();
                rs1.Dispose();
                rs.MoveNext();
            }
            rs.Close();
            rs.Dispose();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }


    private bool uploadxmlfiletodatabase(byte[] fileBytes, string fullfilename)
    {
        bool result = false;
        try
        {
            SqlConnection sc = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ToString());
            sc.Open();
            string command = "INSERT INTO EIPB.DBO.ERP_AXMI25_File(rowno,FileName,FileBody,FileType,Updatetime) VALUES(@rowno,@FileName,@FileBody,@FileType,SYSDATETIME())";
            SqlCommand scmd = new SqlCommand(command, sc);
            scmd.Parameters.AddWithValue("@rowno", rowno);
            scmd.Parameters.AddWithValue("@FileName", System.IO.Path.GetFileName(con));
            scmd.Parameters.AddWithValue("@FileBody", fileBytes);
            scmd.Parameters.AddWithValue("@FileType", System.IO.Path.GetExtension(con));
            scmd.ExecuteNonQuery();
            sc.Close();
            sc.Dispose();
            result = true;
            return result;
        }
        catch (Exception ex)
        {
            return result;
            throw new Exception(ex.Message + "uploadxmlfiletodatabase");
        }
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}