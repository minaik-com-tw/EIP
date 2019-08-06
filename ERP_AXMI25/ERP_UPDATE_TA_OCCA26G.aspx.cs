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
using System.Net;

public partial class ERP_AXMI25_ERP_UPDATE_TA_OCCA26G : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT ERP.occano  ,  FileName , ERP.ROWNO " +
                        "  FROM EIPB.DBO.ERP_AXMI25_File AXMI , EIPB.DBO.ERP_AXMI25 ERP " +
                        " WHERE AXMI.rowno = ERP.ROWNO");
                while (!rs.EOF)
                {
                    SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs1.Open("SELECT F.* , HEAD.occano "+ 
                             " FROM EIPB.DBO.ERP_AXMI25_File F, EIPB.DBO.ERP_AXMI25 HEAD "+
                             "WHERE F.rowno = HEAD.ROWNO "+
                             "  AND F.rowno = '"+rs["rowno"].ToString()+"'");
                    if (!rs1.EOF)
                    {
                        XmlDocument doc = new XmlDocument();
                        Stream sr = new MemoryStream((byte[])rs1["FileBody"]);
                        doc.Load(sr);
                        XmlNode xn = doc.SelectSingleNode("//NewDataSet/head/ta_occa26g");
                        //Response.Write("MINAIK|ta_occa26g|" + xn.InnerText + "|" + rs1["occano"].ToString() + "|U" + "<br/>");

                        string filename = "MINAIK-U_axmi250_" + rs1["occano"].ToString() + ".txt";
                        string path = "D:\\ERP_AXMI250\\updatefile";//"D:\\test\\test_rage.txt";            
                        string fullfilename = path + "\\" + filename;
                        FileStream fn = new FileStream(fullfilename, FileMode.OpenOrCreate, FileAccess.ReadWrite);
                        StreamWriter file = new StreamWriter(fn, System.Text.Encoding.Unicode);
                        file.WriteLine("MINAIK|ta_occa26g|" + xn.InnerText + "|" + rs1["occano"].ToString() + "|U");
                        file.Close();
                        uploadtoFTP(fullfilename, @"ftp://192.168.0.250/" + filename, "4gl", "4gl");

                        File.Delete(fullfilename);


                    }
                    rs.MoveNext();
                }
                rs.Close();
                rs.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
    private bool uploadtoFTP(string fileName, string uploadUrl, string UserName, string Password)
    {
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
            //Response.Write("開始上傳資料流");
            while (true)
            {//開始上傳資料流
                bytesRead = fileStream.Read(buffer, 0, buffer.Length);
                if (bytesRead == 0)
                    break;
                requestStream.Write(buffer, 0, bytesRead);
            }
            //Response.Write("結束上傳資料流");
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
}
