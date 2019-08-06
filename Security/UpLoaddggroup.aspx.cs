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
using System.IO;
using System.Xml;
using System.Net;
using System.Threading;
public partial class UpLoaddggroup : SmoothEnterprise.Web.Page 
{
    private string ftpip = "ftp.minaik.com.tw";
    private string username="maeipmanager";
    private string password = "administrator";

    protected void Page_Load(object sender, EventArgs e)
    {
    	
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        CreateXML(TextBox1.Text);
    }


    private void CreateXML(string requid)
    {
        DateTime currentDate = DateTime.Now;
        long elapsedTicks = currentDate.Ticks;


        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rs1.Open("select *  from dggroup where id='" + requid + "'");
        string filename;
        int DTotal = 0;
        while (!rs1.EOF)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.AppendChild(xdoc.CreateXmlDeclaration("1.0", "UTF-8", "yes"));
            // 建立根節點物件並加入 XmlDocument 中 (第 0 層)
            XmlElement rootElement = xdoc.CreateElement("NewDataSet");
            xdoc.AppendChild(rootElement);

            XmlElement eleChild1 = xdoc.CreateElement("NewDataSet");

            /*

                          ,utype,,,,
          ,,,,,,effectdate,expiredate,dsn,gid
          ,ucategory,userpath,authcode,sid,optname1,optvalue1,optsyscontrol1
          ,optname2,optvalue2,optsyscontrol2,optname3,optvalue3,optsyscontrol3,inituid
          ,initdate,modifydate,modifyuid,comid,empid,levid,erpid*/
            XmlElement eleGrandChilds = xdoc.CreateElement("FileType");
            eleGrandChilds.InnerText = "ADD";
            rootElement.AppendChild(eleGrandChilds);

            XmlElement eleGrandChild1 = xdoc.CreateElement("id");
            eleGrandChild1.InnerText = rs1["id"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild1);

            XmlElement eleGrandChild2 = xdoc.CreateElement("code");
            eleGrandChild2.InnerText = rs1["code"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild2);

            XmlElement eleGrandChild3 = xdoc.CreateElement("name");
            eleGrandChild3.InnerText = rs1["name"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild3);

            XmlElement eleGrandChild4 = xdoc.CreateElement("icon");
            eleGrandChild4.InnerText = rs1["icon"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild4);

            XmlElement eleGrandChild5 = xdoc.CreateElement("remark");
            eleGrandChild5.InnerText = rs1["remark"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild5);


            XmlElement eleGrandChild6 = xdoc.CreateElement("pid");
            eleGrandChild6.InnerText = rs1["pid"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild6);


            XmlElement eleGrandChild7 = xdoc.CreateElement("pids");
            eleGrandChild7.InnerText = rs1["pids"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild7);

            XmlElement eleGrandChild8 = xdoc.CreateElement("glid");
            eleGrandChild8.InnerText = rs1["glid"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild8);

            XmlElement eleGrandChild9 = xdoc.CreateElement("uid");
            eleGrandChild9.InnerText = rs1["uid"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild9);

            XmlElement eleGrandChild10 = xdoc.CreateElement("sid");
            eleGrandChild10.InnerText = rs1["sid"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild10);

            XmlElement eleGrandChild11 = xdoc.CreateElement("seq");
            eleGrandChild11.InnerText = rs1["seq"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild11);

            XmlElement eleGrandChild12 = xdoc.CreateElement("seq1");
            eleGrandChild12.InnerText = rs1["seq1"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild12);




            XmlElement eleGrandChild13 = xdoc.CreateElement("isdisplay");
            eleGrandChild13.InnerText = rs1["isdisplay"].ToString().Trim();
            rootElement.AppendChild(eleGrandChild13);

            filename = "To"+rs1["comid"].ToString().Trim() + "dggroup" + elapsedTicks.ToString();//rs1["empid"].ToString();

            // 將建立的 XML 節點儲存為檔案

            xdoc.Save(@"C:\\Admin\\" + filename);
            xdoc.Clone();


            Upload("C:\\Admin\\" + filename, "ftp://" + ftpip + "//" + filename, username, password);
            rs1.MoveNext();
        }
        rs1.Close();
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
            fileStream = System.IO.File.Open(fileName, FileMode.Open);
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