using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Net;
using System.Threading;
using System.Net.Mail;
using System.Xml;





public partial class Shipping_SendXml : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 設定檔案讀取位置...
        string searchPattern = "*";
        string InitDirectory = @"D:\XML\";    // 原始目錄
        
        ArrayList MyFiles = new ArrayList();
        DirectoryInfo di = new DirectoryInfo(InitDirectory);

        try
        {

            if (Request.QueryString["ID"] != "")
            {

                SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs1.Open(" Select Forwarder.Pkey,PlantID,ProgramID,FileName,Cdate,INV_Num,SHIP_To,SHIPPING_No,SHIPPING_Dec,SHIPPING_Mode,SHIPPING_ModeDec,FORWARDER_Num,FORWARDER_Dec," +
                         " account,password From Forwarder,ForwarderData where  FORWARDER_Num = ForwarderData.ta_oga20 and Forwarder.id = '" + Request.QueryString["ID"] + "' order by Forwarder.Pkey");
                while (!rs1.EOF)
                {
                    XmlDocument xdoc = new XmlDocument();
                    xdoc.AppendChild(xdoc.CreateXmlDeclaration("1.0", "UTF-8", "yes"));
                    // 建立根節點物件並加入 XmlDocument 中 (第 0 層)
                    XmlElement rootElement = xdoc.CreateElement("NewDataSet");
                    xdoc.AppendChild(rootElement);

                    XmlElement eleChild1 = xdoc.CreateElement("NewDataSet");

                    XmlElement eleGrandChild1 = xdoc.CreateElement("PlantID");
                    eleGrandChild1.InnerText = rs1["PlantID"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild1);

                    XmlElement eleGrandChild11 = xdoc.CreateElement("ProgramID");
                    eleGrandChild11.InnerText = rs1["ProgramID"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild11);

                    XmlElement eleGrandChild2 = xdoc.CreateElement("FileName");
                    eleGrandChild2.InnerText = rs1["FileName"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild2);

                    XmlElement eleGrandChild12 = xdoc.CreateElement("oga02");
                    eleGrandChild12.InnerText = Convert.ToDateTime(rs1["Cdate"].ToString().Trim()).ToString("yy-MM-dd");
                    rootElement.AppendChild(eleGrandChild12);

                    XmlElement eleGrandChild3 = xdoc.CreateElement("oga27");
                    eleGrandChild3.InnerText = rs1["INV_Num"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild3);

                    XmlElement eleGrandChild4 = xdoc.CreateElement("addr");
                    eleGrandChild4.InnerText = rs1["SHIP_To"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild4);

                    XmlElement eleGrandChild5 = xdoc.CreateElement("oga31");
                    eleGrandChild5.InnerText = rs1["SHIPPING_No"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild5);

                    XmlElement eleGrandChild6 = xdoc.CreateElement("oah02");
                    eleGrandChild6.InnerText = rs1["SHIPPING_Dec"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild6);

                    XmlElement eleGrandChild7 = xdoc.CreateElement("oga43");
                    eleGrandChild7.InnerText = rs1["SHIPPING_Mode"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild7);

                    XmlElement eleGrandChild8 = xdoc.CreateElement("ged02");
                    eleGrandChild8.InnerText = rs1["SHIPPING_ModeDec"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild8);

                    XmlElement eleGrandChild9 = xdoc.CreateElement("ta_oga20");
                    eleGrandChild9.InnerText = rs1["FORWARDER_Num"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild9);

                    XmlElement eleGrandChild10 = xdoc.CreateElement("pmc03");
                    eleGrandChild10.InnerText = rs1["FORWARDER_Dec"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild10);

                    // 將建立的 XML 節點儲存為檔案
                    xdoc.Save(@"D:\Forwarder\ToSupplerFile\" + rs1["FileName"].ToString().Trim());
                    xdoc.Clone();


                    Upload("D:\\Forwarder\\ToSupplerFile\\" + rs1["FileName"].ToString().Trim(), "ftp://ftp.minaik.com.tw/ToSupplerFile/" + rs1["FileName"].ToString().Trim(), rs1["account"].ToString().Trim(), rs1["password"].ToString().Trim());
                    rs1.MoveNext();
                    //ToSupplerFile

                }
                rs1.Close();

                Response.Write("<script type=\"text/javascript\">");
                Response.Write("alert('重新上傳完畢!!');");
                Response.Write("location.href='Forwarder.aspx';");
                Response.Write("</script>");
            }

            

        }
        catch (Exception ex)
        {
            string strTime = DateTime.Now.ToString("yyyy-MM-dd_hhmmss");
            MailAddress from = new MailAddress("eip@minaik.com.tw", "Forwarder(錯誤訊息)");
            MailAddress to = new MailAddress("herzog.lin@minaik.com.tw");
            MailMessage message = new MailMessage(from, to);
            message.Subject = "Forwarder(錯誤訊息)";
            string ques = "";
            ques = "您好:" + "<br>" +
                   "<br>" +
                   "Forwarder 檔案發生錯誤~<br>" +
                   "<br>" +
                   "產生檔案錯誤時間：" + strTime + "<br>" +
                   "錯誤訊息：" + ex + "<br><br>" +
                   "因本信件為系統自動發送,請勿直接以此郵件回覆。";
            message.IsBodyHtml = true;
            message.Body = ques;
            SmtpClient client = new SmtpClient("192.168.0.12");
            client.Send(message);
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
}
