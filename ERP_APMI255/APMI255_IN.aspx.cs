using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.IO;
using System.Data.SqlClient;
using System.Text;
using System.Collections;
using System.Net.Mail;
using System.Net;

public partial class APMI255_IN : SmoothEnterprise.Web.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string db = "[EIPB].[dbo].";

        /*   ================= 抓 ERP 資料進 EIP =================  */
        // FileRoute 設定..暫存的目錄位置

        string InitDirectory = @"D:\APMI255_XML\ERP_Download\";
        //string InitDirectory = @"D:\AnnSmooth\ERP_APMI255\APMI255_XML\ERP_Download\";

        // 先抓 FTP  的資料
        ArrayList FtpList = List("ftp://192.168.0.250/", "xmluser", "(XmlUser)");

        foreach (string s in FtpList)
        {
            //Response.Write("AAA");
            Response.Write(s.ToString());
            //找到 自己要的檔名!
            if (s.IndexOf("apmi255") != -1)
            {
                //將目前FTP的XML抓下來
                Download("ftp://192.168.0.250/" + s, InitDirectory, "xmluser", "(XmlUser)");
                DeleteFileOnServer("ftp://192.168.0.250/" + s, "xmluser", "(XmlUser)");
            }

        }
        //-------------------------------------------------------------
        string searchPattern = "*";
        //可以指定目錄 或
        //string InitDirectory = @"C:\";
        // 取得目前工作目錄
        //string InitDirectory = @"D:\XML"; //原始目錄

        ArrayList MyFiles = new ArrayList();

        DirectoryInfo di = new DirectoryInfo(InitDirectory);

        // 呼叫上面的函式 Get Files
        GetFiles(di, searchPattern, ref MyFiles);

        //Print it

        foreach (string s in MyFiles)
        {
            try
            {
                if (s.IndexOf("apmi255") != -1)
                {
                    Response.Write("yes");


                    Response.Write("---------" + s.IndexOf("_") + "<br>");
                    System.Diagnostics.Debug.Write(s);
                    Response.Write(s + "\n");
                    XmlDocument xDoc = new XmlDocument();
                    xDoc.Load((s));
                    XmlNodeList plantid = xDoc.GetElementsByTagName("PlantID");
                    XmlNodeList pmi01 = xDoc.GetElementsByTagName("pmi01");
                    XmlNodeList pmi02 = xDoc.GetElementsByTagName("pmi02");
                    XmlNodeList pmi03 = xDoc.GetElementsByTagName("pmi03");
                    XmlNodeList pmc03_0 = xDoc.GetElementsByTagName("pmc03-0");
                    XmlNodeList pmi04 = xDoc.GetElementsByTagName("pmi04");
                    XmlNodeList pmi05 = xDoc.GetElementsByTagName("pmi05");
                    XmlNodeList pmi06 = xDoc.GetElementsByTagName("pmi06");
                    XmlNodeList pmi07 = xDoc.GetElementsByTagName("pmi07");
                    XmlNodeList pmi08 = xDoc.GetElementsByTagName("pmi08");
                    XmlNodeList pmi081 = xDoc.GetElementsByTagName("pmi081");
                    XmlNodeList pmiuser = xDoc.GetElementsByTagName("pmiuser");
                    XmlNodeList gen02_1 = xDoc.GetElementsByTagName("gen02-1");
                    XmlNodeList pmigrup = xDoc.GetElementsByTagName("pmigrup");
                    XmlNodeList gem02_2 = xDoc.GetElementsByTagName("gem02-2");
                    XmlNodeList ta_pmi01 = xDoc.GetElementsByTagName("ta_pmi01");
                    XmlNodeList CompanyName = xDoc.GetElementsByTagName("CompanyName");





                    Response.Write("select * from " + db + "apmi255_in_head  where pmi01 = '" + pmi01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
                    SmoothEnterprise.Database.DataSet hs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    hs.Open("select * from " + db + "apmi255_in_head  where pmi01 = '" + pmi01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");//檢查單頭是否有重覆單據號碼
                    if (!hs.EOF)
                    {
                        Response.Write("相同");
                        #region 若有相同單號, 單頭UPDATE,單身刪除後新增
                        SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet();
                        rsb.ExecuteNonQuery("delete  " + db + "apmi255_in_body where bno = '" + hs["no"].ToString() + "' and plantid='" + plantid[0].InnerXml + "'");

                        SmoothEnterprise.Database.DataSet rsc = new SmoothEnterprise.Database.DataSet();
                        rsc.ExecuteNonQuery("delete  " + db + "apmi255_in_pmr where cno = '" + hs["no"].ToString() + "' and plantid='" + plantid[0].InnerXml + "'");


                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("SELECT * FROM " + db + "apmi255_IN_HEAD  where pmi01 = '" + pmi01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
                        if (!rs.EOF)
                        {
                            //rs.Add();
                            if (plantid[0].InnerXml != "") rs["plantID"] = plantid[0].InnerXml;
                            if (pmi01[0].InnerXml != "") rs["pmi01"] = pmi01[0].InnerXml;
                            if (pmi02[0].InnerXml != "") rs["pmi02"] = pmi02[0].InnerXml;
                            if (pmi03[0].InnerXml != "") rs["pmi03"] = pmi03[0].InnerXml;
                            if (pmc03_0[0].InnerXml != "") rs["pmc03_0"] = pmc03_0[0].InnerXml;
                            if (pmi04[0].InnerXml != "") rs["pmi04"] = pmi04[0].InnerXml;
                            if (pmi05[0].InnerXml != "") rs["pmi05"] = pmi05[0].InnerXml;
                            if (pmi06[0].InnerXml != "") rs["pmi06"] = pmi06[0].InnerXml;
                            if (pmi07[0].InnerXml != "") rs["pmi07"] = pmi07[0].InnerXml;
                            if (pmi08[0].InnerXml != "") rs["pmi08"] = pmi08[0].InnerXml;
                            if (pmi081[0].InnerXml != "") rs["pmi081"] = pmi081[0].InnerXml;
                            if (pmiuser[0].InnerXml != "") rs["pmiuser"] = pmiuser[0].InnerXml;
                            if (gen02_1[0].InnerXml != "") rs["gen02_1"] = gen02_1[0].InnerXml;
                            if (pmigrup[0].InnerXml != "") rs["pmigrup"] = pmigrup[0].InnerXml;
                            if (gem02_2[0].InnerXml != "") rs["gem02_2"] = gem02_2[0].InnerXml;
                            if (ta_pmi01[0].InnerXml != "") rs["ta_pmi01"] = ta_pmi01[0].InnerXml;
                            if (plantid[0].InnerXml != "") rs["plantid"] = plantid[0].InnerXml;

                            if (pmi06[0].InnerXml == "9:作廢")
                            {
                                rs["status"] = "V";
                            }
                            else
                            {
                                rs["status"] = "N";
                            }
                            rs.Update();
                            rs.Close();
                        }

                        SmoothEnterprise.Database.DataSet aa = new SmoothEnterprise.Database.DataSet();
                        object objola = aa.ExecuteScalar("SELECT no FROM " + db + "apmi255_in_head where pmi01 = '" + pmi01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
                        string no = objola.ToString();


                        int cmicNodes = xDoc.GetElementsByTagName("record").Count;
                        Response.Write("record共" + cmicNodes);
                        for (int i = 0; i <= (cmicNodes - 1); i++)
                        {
                            XmlNodeList pmj02 = xDoc.GetElementsByTagName("pmj02");
                            XmlNodeList pmj03 = xDoc.GetElementsByTagName("pmj03");
                            XmlNodeList pmj031 = xDoc.GetElementsByTagName("pmj031");
                            XmlNodeList pmj032 = xDoc.GetElementsByTagName("pmj032");
                            XmlNodeList pmj04 = xDoc.GetElementsByTagName("pmj04");
                            XmlNodeList pmj05 = xDoc.GetElementsByTagName("pmj05");
                            XmlNodeList pmj06 = xDoc.GetElementsByTagName("pmj06");
                            XmlNodeList pmj06t = xDoc.GetElementsByTagName("pmj06t");
                            XmlNodeList pmj07 = xDoc.GetElementsByTagName("pmj07");
                            XmlNodeList pmj07t = xDoc.GetElementsByTagName("pmj07t");
                            XmlNodeList pmj08 = xDoc.GetElementsByTagName("pmj08");
                            XmlNodeList pmj09 = xDoc.GetElementsByTagName("pmj09");
                            XmlNodeList pmj10 = xDoc.GetElementsByTagName("pmj10");
                            XmlNodeList ta_pmj01 = xDoc.GetElementsByTagName("ta_pmj01");
                            XmlNodeList ima491 = xDoc.GetElementsByTagName("ima491");
                            XmlNodeList ima46 = xDoc.GetElementsByTagName("ima46");




                            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs2.Open("SELECT * FROM " + db + "apmi255_IN_BODY WHERE 1=0");
                            rs2.Add();


                            if (pmj02[0].InnerXml != "") rs2["pmj02"] = pmj02[i].InnerXml;
                            if (pmj03[0].InnerXml != "") rs2["pmj03"] = pmj03[i].InnerXml;
                            if (pmj031[0].InnerXml != "") rs2["pmj031"] = pmj031[i].InnerXml;
                            if (pmj032[0].InnerXml != "") rs2["pmj032"] = pmj032[i].InnerXml;
                            if (pmj04[0].InnerXml != "") rs2["pmj04"] = pmj04[i].InnerXml;
                            if (pmj05[0].InnerXml != "") rs2["pmj05"] = pmj05[i].InnerXml;
                            if (pmj06[0].InnerXml != "") rs2["pmj06"] = pmj06[i].InnerXml;
                            if (pmj06t[0].InnerXml != "") rs2["pmj06t"] = pmj06t[i].InnerXml;
                            if (pmj07[0].InnerXml != "") rs2["pmj07"] = pmj07[i].InnerXml;
                            if (pmj07t[0].InnerXml != "") rs2["pmj07t"] = pmj07t[i].InnerXml;
                            if (pmj08[i].InnerXml != "") rs2["pmj08"] = pmj08[i].InnerXml;
                            if (pmj09[i].InnerXml != "") rs2["pmj09"] = pmj09[i].InnerXml;
                            if (pmj10[0].InnerXml != "") rs2["pmj10"] = pmj10[i].InnerXml;
                            if (ta_pmj01[i].InnerXml != "") rs2["ta_pmj01"] = ta_pmj01[i].InnerXml;
                            if (ima491[0].InnerXml != "") rs2["ima491"] = ima491[i].InnerXml;
                            if (ima46[0].InnerXml != "") rs2["ima46"] = ima46[i].InnerXml;
                            if (plantid[0].InnerXml != "") rs2["plantid"] = plantid[0].InnerXml;



                            rs2["bno"] = no;
                            rs2.Update();
                            rs2.Close();





                        }

                        #region 單身的單身(單身對應的核價資訊)
                        if (pmi05[0].InnerXml == "Y")   //分量計價才有這個
                        {
                            int pmrNodes = xDoc.GetElementsByTagName("pmr").Count;

                            for (int i2 = 0; i2 <= (pmrNodes - 1); i2++)
                            {

                                XmlNodeList pmr02 = xDoc.GetElementsByTagName("pmr02");
                                XmlNodeList pmr03 = xDoc.GetElementsByTagName("pmr03");
                                XmlNodeList pmr04 = xDoc.GetElementsByTagName("pmr04");
                                XmlNodeList pmr05 = xDoc.GetElementsByTagName("pmr05");
                                XmlNodeList pmr05t = xDoc.GetElementsByTagName("pmr05t");

                                SmoothEnterprise.Database.DataSet rspmr = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                rspmr.Open("SELECT * FROM " + db + "apmi255_IN_PMR WHERE 1=0");
                                rspmr.Add();


                                if (pmr02[0].InnerXml != "") rspmr["pmr02"] = pmr02[i2].InnerXml;
                                if (pmr03[0].InnerXml != "") rspmr["pmr03"] = pmr03[i2].InnerXml;
                                if (pmr04[0].InnerXml != "") rspmr["pmr04"] = pmr04[i2].InnerXml;
                                if (pmr05[0].InnerXml != "") rspmr["pmr05"] = pmr05[i2].InnerXml;
                                if (pmr05t[0].InnerXml != "") rspmr["pmr05t"] = pmr05t[i2].InnerXml;
                                if (plantid[0].InnerXml != "") rspmr["plantid"] = plantid[0].InnerXml;



                                rspmr["cno"] = no;
                                rspmr.Update();
                                rspmr.Close();

                                Response.Write("<br>hahahaha");

                            }
                        }
                        #endregion

                        if (System.IO.File.Exists(s.Replace("Download", "XML")))  //判斷在OUT資料夾裡, 檔案是否存在
                        {
                            File.Delete(s.Replace("Download", "XML"));  //存在的話先刪除該檔案再存入新檔案
                            File.Move(s, s.Replace("Download", "XML"));
                        }
                        else
                        {
                            File.Move(s, s.Replace("Download", "XML"));  //不存在直接存入新檔案
                        }


                        #endregion
                    }
                    else
                    {
                        #region 單號不相同,將資料全數新增
                        //EIP單號-----------------------------------------
                        EIPSysSha UseSha = new EIPSysSha();
                        string OK_NO;
                        switch (plantid[0].InnerXml)
                        {
                            case "MAY":
                                OK_NO = UseSha.GetNewSn("P101", DateTime.Now.ToString("yyMM"));
                                break;

                            case "MINAIK":
                                OK_NO = UseSha.GetNewSn("P102", DateTime.Now.ToString("yyMM"));
                                break;

                            default:
                                OK_NO = UseSha.GetNewSn("P102", DateTime.Now.ToString("yyMM"));
                                break;

                        }
                        //-------------------------------------------------
                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("SELECT * FROM " + db + "apmi255_IN_HEAD WHERE 1=0");
                        rs.Add();
                        if (plantid[0].InnerXml != "") rs["plantID"] = plantid[0].InnerXml;
                        if (pmi01[0].InnerXml != "") rs["pmi01"] = pmi01[0].InnerXml;
                        if (pmi02[0].InnerXml != "") rs["pmi02"] = pmi02[0].InnerXml;
                        if (pmi03[0].InnerXml != "") rs["pmi03"] = pmi03[0].InnerXml;
                        if (pmc03_0[0].InnerXml != "") rs["pmc03_0"] = pmc03_0[0].InnerXml;
                        if (pmi04[0].InnerXml != "") rs["pmi04"] = pmi04[0].InnerXml;
                        if (pmi05[0].InnerXml != "") rs["pmi05"] = pmi05[0].InnerXml;
                        if (pmi06[0].InnerXml != "") rs["pmi06"] = pmi06[0].InnerXml;
                        if (pmi07[0].InnerXml != "") rs["pmi07"] = pmi07[0].InnerXml;
                        if (pmi08[0].InnerXml != "") rs["pmi08"] = pmi08[0].InnerXml;
                        if (pmi081[0].InnerXml != "") rs["pmi081"] = pmi081[0].InnerXml;
                        if (pmiuser[0].InnerXml != "") rs["pmiuser"] = pmiuser[0].InnerXml;
                        if (gen02_1[0].InnerXml != "") rs["gen02_1"] = gen02_1[0].InnerXml;
                        if (pmigrup[0].InnerXml != "") rs["pmigrup"] = pmigrup[0].InnerXml;
                        if (gem02_2[0].InnerXml != "") rs["gem02_2"] = gem02_2[0].InnerXml;
                        if (ta_pmi01[0].InnerXml != "") rs["ta_pmi01"] = ta_pmi01[0].InnerXml;
                        rs["CompanyName"] = CompanyName[0].InnerXml;
                        rs["status"] = "N";
                        rs["no"] = OK_NO;


                        rs.Update();
                        rs.Close();





                        int cmicNodes = xDoc.GetElementsByTagName("record").Count;
                        Response.Write("record共" + cmicNodes);
                        for (int i = 0; i <= (cmicNodes - 1); i++)
                        {
                            XmlNodeList pmj02 = xDoc.GetElementsByTagName("pmj02");
                            XmlNodeList pmj03 = xDoc.GetElementsByTagName("pmj03");
                            XmlNodeList pmj031 = xDoc.GetElementsByTagName("pmj031");
                            XmlNodeList pmj032 = xDoc.GetElementsByTagName("pmj032");
                            XmlNodeList pmj04 = xDoc.GetElementsByTagName("pmj04");
                            XmlNodeList pmj05 = xDoc.GetElementsByTagName("pmj05");
                            XmlNodeList pmj06 = xDoc.GetElementsByTagName("pmj06");
                            XmlNodeList pmj06t = xDoc.GetElementsByTagName("pmj06t");
                            XmlNodeList pmj07 = xDoc.GetElementsByTagName("pmj07");
                            XmlNodeList pmj07t = xDoc.GetElementsByTagName("pmj07t");
                            XmlNodeList pmj08 = xDoc.GetElementsByTagName("pmj08");
                            XmlNodeList pmj09 = xDoc.GetElementsByTagName("pmj09");
                            XmlNodeList pmj10 = xDoc.GetElementsByTagName("pmj10");
                            XmlNodeList ta_pmj01 = xDoc.GetElementsByTagName("ta_pmj01");
                            XmlNodeList ima491 = xDoc.GetElementsByTagName("ima491");
                            XmlNodeList ima46 = xDoc.GetElementsByTagName("ima46");

                            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs2.Open("SELECT * FROM " + db + "apmi255_IN_BODY WHERE 1=0");
                            rs2.Add();

                            if (pmj02[0].InnerXml != "") rs2["pmj02"] = pmj02[i].InnerXml;
                            if (pmj03[0].InnerXml != "") rs2["pmj03"] = pmj03[i].InnerXml;
                            if (pmj031[0].InnerXml != "") rs2["pmj031"] = pmj031[i].InnerXml;
                            if (pmj032[0].InnerXml != "") rs2["pmj032"] = pmj032[i].InnerXml;
                            if (pmj04[0].InnerXml != "") rs2["pmj04"] = pmj04[i].InnerXml;
                            if (pmj05[0].InnerXml != "") rs2["pmj05"] = pmj05[i].InnerXml;
                            if (pmj06[0].InnerXml != "") rs2["pmj06"] = pmj06[i].InnerXml;
                            if (pmj06t[0].InnerXml != "") rs2["pmj06t"] = pmj06t[i].InnerXml;
                            if (pmj07[0].InnerXml != "") rs2["pmj07"] = pmj07[i].InnerXml;
                            if (pmj07t[0].InnerXml != "") rs2["pmj07t"] = pmj07t[i].InnerXml;
                            if (pmj08[i].InnerXml != "") rs2["pmj08"] = pmj08[i].InnerXml;
                            if (pmj09[i].InnerXml != "") rs2["pmj09"] = pmj09[i].InnerXml;
                            if (pmj10[0].InnerXml != "") rs2["pmj10"] = pmj10[i].InnerXml;
                            if (ta_pmj01[i].InnerXml != "") rs2["ta_pmj01"] = ta_pmj01[i].InnerXml;
                            if (ima491[0].InnerXml != "") rs2["ima491"] = ima491[i].InnerXml;
                            if (ima46[0].InnerXml != "") rs2["ima46"] = ima46[i].InnerXml;
                            if (plantid[0].InnerXml != "") rs2["plantid"] = plantid[0].InnerXml;
                            rs2["bno"] = OK_NO;
                            rs2.Update();
                            rs2.Close();
                        }

                        #region 單身的單身(單身對應的核價資訊)
                        if (pmi05[0].InnerXml == "Y")   //分量計價才有這個
                        {
                            int pmrNodes = xDoc.GetElementsByTagName("pmr").Count;

                            for (int i2 = 0; i2 <= (pmrNodes - 1); i2++)
                            {

                                XmlNodeList pmr02 = xDoc.GetElementsByTagName("pmr02");
                                XmlNodeList pmr03 = xDoc.GetElementsByTagName("pmr03");
                                XmlNodeList pmr04 = xDoc.GetElementsByTagName("pmr04");
                                XmlNodeList pmr05 = xDoc.GetElementsByTagName("pmr05");
                                XmlNodeList pmr05t = xDoc.GetElementsByTagName("pmr05t");

                                SmoothEnterprise.Database.DataSet rspmr = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                rspmr.Open("SELECT * FROM " + db + "apmi255_IN_PMR WHERE 1=0");
                                rspmr.Add();


                                if (pmr02[0].InnerXml != "") rspmr["pmr02"] = pmr02[i2].InnerXml;
                                if (pmr03[0].InnerXml != "") rspmr["pmr03"] = pmr03[i2].InnerXml;
                                if (pmr04[0].InnerXml != "") rspmr["pmr04"] = pmr04[i2].InnerXml;
                                if (pmr05[0].InnerXml != "") rspmr["pmr05"] = pmr05[i2].InnerXml;
                                if (pmr05t[0].InnerXml != "") rspmr["pmr05t"] = pmr05t[i2].InnerXml;
                                if (plantid[0].InnerXml != "") rspmr["plantid"] = plantid[0].InnerXml;



                                rspmr["cno"] = OK_NO;
                                rspmr.Update();
                                rspmr.Close();

                                Response.Write("<br>hahahaha");

                            }
                        }
                        #endregion

                        if (System.IO.File.Exists(s.Replace("Download", "XML")))  //判斷在OUT資料夾裡, 檔案是否存在
                        {
                            File.Delete(s.Replace("Download", "XML"));  //存在的話先刪除該檔案再存入新檔案
                            File.Move(s, s.Replace("Download", "XML"));
                        }
                        else
                        {
                            File.Move(s, s.Replace("Download", "XML"));  //不存在直接存入新檔案
                        }


                        #endregion
                    }
                    //發mail---------------------------------------------------------------------------------------------------------------------------
                    
                    string pmi06_string = pmi06[0].InnerXml;
                    if (pmi06_string.ToString() != "9:作廢" && pmi06_string.ToString() != "R:送簽退回")
                    {
                        Response.Write("<br>====" + pmi06[0].InnerXml);

                        String ques;
                        SmoothEnterprise.Database.DataSet es = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        es.Open("select email," + db + "apmi255_in_head.id id  from " + db + "apmi255_in_head  LEFT JOIN dguser ON pmiuser=erpid where pmi01 = '" + pmi01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
                        if (!es.EOF)
                        {
                            MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                            MailAddress to = new MailAddress(es["email"].ToString());

                            MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                            MailMessage message = new MailMessage(from, to);
                            message.Bcc.Add(bcc);

                            ques = "您好:" + "<br>" +
                                   "<br>" +
                                   "ERP採購核價電子簽核申請單現有一筆，正等待您的處理:" + "<br>" +
                                   "<br>" +
                                   "申請單號 : " + pmi01[0].InnerXml + "<br>" +
                                   "申請日期 : " + pmi02[0].InnerXml + "<br>" +
                                   "申請人員 : " + gen02_1[0].InnerXml + "<br>" +
                                   "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_APMI255/ERP_APMI255Edit.aspx?id=" + es["id"].ToString() + "\" >至ERP採購核價電子簽核系統檢視並編輯內容</a>" +
                                   "<br>" +
                                   "<br>" +
                                   "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                   "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                   "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                            message.Subject = "核價單號 - " + pmi01[0].InnerXml + " 等待您的處理";
                            message.IsBodyHtml = true;
                            message.Body = ques;

                            SmtpClient client = new SmtpClient("192.168.0.12");

                            client.Send(message);

                            Response.Write("Mail傳送完畢" + "<br>");


                        }
                    }

                    Upload("D:\\APMI255_XML\\ERP_XML\\" + plantid[0].InnerXml + "_apmi255_" + pmi01[0].InnerXml + ".xml", "ftp://192.168.0.250/" + plantid[0].InnerXml + "_APMI255_" + pmi01[0].InnerXml + ".xml", "xmlback", "xmlback");

                    //---------------------------------------------------------------------------------------------------------------------------
                }
            }
            catch (Exception ex)
            {
                string s1 = s.Replace(".xml", "");
                s1 = s1.Replace("D:\\APMI255_XML\\ERP_Download\\", "");
                int sone = s1.IndexOf("_");
                int stwo = s1.LastIndexOf("_");
                stwo = stwo + 1;
                FileStream fs = new FileStream(@"D:\APMI255_XML\4GL\" + s1 + ".txt", FileMode.Create, FileAccess.Write);

                StreamWriter sw = new StreamWriter(fs);
                sw.WriteLine("\"" + s1.Substring(0, sone) + "\",\"apmi255\",\"" + s1.Substring(stwo, 10) + "\",\"E\",\"\"");
                sw.Close();
                fs.Close();
                Upload(fs.ToString(), "ftp://192.168.0.250/" + s1.ToString() + ".txt", "4gl", "4gl");


                //發mail---------------------------------------------------------------------------------------------------------------------------
                String ques;

                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                MailAddress to = new MailAddress("ann.lin@minaik.com.tw");

                MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                MailMessage message = new MailMessage(from, to);
                message.Bcc.Add(bcc);

                ques = "有問題";

                message.Subject = "ERP採購核價有問題";
                message.IsBodyHtml = true;
                message.Body = ques;

                SmtpClient client = new SmtpClient("192.168.0.12");

                client.Send(message);

                Response.Write("ERP採購核價有問題" + "<br>");

                

                
                //---------------------------------------------------------------------------------------------------------------------------

 
            }
        }
    }
    private void GetFiles(DirectoryInfo di, string searchPattern, ref ArrayList MyFiles)
    {
        //取得檔案
        foreach (FileInfo fi in di.GetFiles(searchPattern))
        {
            MyFiles.Add(fi.FullName);
        }

        // Search in subdirctories
        foreach (DirectoryInfo d in di.GetDirectories())
        {
            GetFiles(d, searchPattern, ref MyFiles); //遞迴方法
        }
    }



    //檔案上傳
    internal bool Upload(string fileName, string uploadUrl, string UserName, string Password)
    {
        // fileName上傳的檔案 ex : c:\abc.xml , 
        // uploadUrl上傳的FTP伺服器路徑 ftp://127.0.0.1/檔名
        // UserName使用者FTP登入帳號 , 
        // Password使用者登入密碼

        Stream requestStream = null;
        FileStream fileStream = null;
        FtpWebResponse uploadResponse = null;
        try
        {
            FtpWebRequest uploadRequest = (FtpWebRequest)WebRequest.Create(uploadUrl);
            uploadRequest.Method = WebRequestMethods.Ftp.UploadFile;//設定Method上傳檔案
            uploadRequest.Proxy = null;
            if (UserName.Length > 0)//如果需要帳號登入
            {
                NetworkCredential nc = new NetworkCredential(UserName, Password);
                uploadRequest.Credentials = nc; //設定帳號
            }
            requestStream = uploadRequest.GetRequestStream();
            fileStream = File.Open(fileName, FileMode.Open);
            byte[] buffer = new byte[1024];
            int bytesRead;
            while (true)
            {//開始上傳資料流
                bytesRead = fileStream.Read(buffer, 0, buffer.Length);
                if (bytesRead == 0)
                    break;
                requestStream.Write(buffer, 0, bytesRead);
            }
            requestStream.Close();
            uploadResponse = (FtpWebResponse)uploadRequest.GetResponse();
            return true;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            if (uploadResponse != null)
                uploadResponse.Close();
            if (fileStream != null)
                fileStream.Close();
            if (requestStream != null)
                requestStream.Close();
        }
    }
    //檔案上傳


    // FTP 列出檔案名稱
    protected ArrayList List(string listUrl, string UserName, string Password)
    {
        //  listUrl FTP伺服器路徑ftp://127.0.0.1
        //  UserName使用者FTP登入帳號 
        //  Password使用者登入密碼

        StreamReader reader = null;
        ArrayList FileNameList = new ArrayList();

        try
        {
            FtpWebRequest listRequest = (FtpWebRequest)WebRequest.Create(listUrl);

            if (UserName.Length > 0)//如果需要帳號登入
            {
                NetworkCredential nc = new NetworkCredential(UserName, Password);
                listRequest.Credentials = nc; //設定帳號
            }

            // //設定Method取得目錄資訊
            listRequest.Method = WebRequestMethods.Ftp.ListDirectory;
            FtpWebResponse listResponse = (FtpWebResponse)listRequest.GetResponse();
            reader = new StreamReader(listResponse.GetResponseStream());

            while (reader.Peek() >= 0)
            {//開始讀取回傳資訊
                FileNameList.Add(reader.ReadLine());
            }

            return FileNameList;//回傳目前清單
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

        finally
        {
            if (reader != null)
                reader.Close();
        }

    }


    // FTP 下載
    internal bool Download(string downloadUrl, string TargetPath, string UserName, string Password)
    {
        // downloadUrl下載FTP的目錄ex : 
        // ftp//127.0.0.1/abc.xml 
        // TargetPath本機存檔目錄
        // UserName使用者FTP登入帳號 
        // Password使用者登入密碼

        Stream responseStream = null;
        FileStream fileStream = null;
        StreamReader reader = null;

        try
        {

            FtpWebRequest downloadRequest = (FtpWebRequest)WebRequest.Create(downloadUrl);
            downloadRequest.Method = WebRequestMethods.Ftp.DownloadFile; //設定Method下載檔案

            if (UserName.Length > 0) //如果需要帳號登入
            {
                NetworkCredential nc = new NetworkCredential(UserName, Password);
                downloadRequest.Credentials = nc;//設定帳號
            }

            FtpWebResponse downloadResponse = (FtpWebResponse)downloadRequest.GetResponse();
            responseStream = downloadResponse.GetResponseStream(); //取得FTP伺服器回傳的資料流
            string fileName = Path.GetFileName(downloadRequest.RequestUri.AbsolutePath);

            if (fileName.Length == 0)
            {
                reader = new StreamReader(responseStream);
                throw new Exception(reader.ReadToEnd());
            }
            else
            {
                fileStream = File.Create(TargetPath + @"\" + fileName);
                byte[] buffer = new byte[1024];
                int bytesRead;
                while (true)
                {//開始將資料流寫入到本機

                    bytesRead = responseStream.Read(buffer, 0, buffer.Length);
                    if (bytesRead == 0)
                        break;
                    fileStream.Write(buffer, 0, bytesRead);

                }
            }
            return true;

        }
        catch (IOException ex)
        {

            throw new Exception(ex.Message);

        }

        finally
        {

            if (reader != null)

                reader.Close();

            else if (responseStream != null)

                responseStream.Close();

            if (fileStream != null)

                fileStream.Close();

        }

    }

    // FTP 刪除檔案
    public static bool DeleteFileOnServer(string DeleteUrl, string UserName, string Password)
    {
        // The serverUri parameter should use the ftp:// scheme.
        // It contains the name of the server file that is to be deleted.
        // Example: ftp://contoso.com/someFile.txt.
        // 

        FtpWebRequest request = (FtpWebRequest)WebRequest.Create(DeleteUrl);
        request.Method = WebRequestMethods.Ftp.DeleteFile;

        NetworkCredential nc = new NetworkCredential(UserName, Password);
        request.Credentials = nc; //設定帳號

        FtpWebResponse response = (FtpWebResponse)request.GetResponse();
        Console.WriteLine("Delete status: {0}", response.StatusDescription);
        response.Close();
        return true;
    }


}