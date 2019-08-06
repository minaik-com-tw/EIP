/*
 *   程式功能:當各子廠若有發生修改密碼的狀況,會統一ftp 一個檔案到指定的Server
 * 之後再由本程式統一修正資料庫的資料 
 * 
 *    目前系統放置於MAT EIP 的排程中,每五分更新一次
 * 
 * 
 *    203.142.37.228 為 馬來西亞 (MAM 與 MATC 共用的區域)
 * 
 * 
 * **************************************************************************************************/
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
using System.Data.SqlClient;
using System.Net;
using System.Threading;
using System.Net.Mail;
using System.Xml;
using System.IO;
using System.Text;
 

public partial class TransDguser : SmoothEnterprise.Web.Page 
{
    private string ftpip = "ftp.minaik.com.tw";  //"ftp.minaik.com.tw";
    private string username = "maeipmanager";
    private string password = "administrator";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //建立目錄
        string activeDir = @"c:\";
        string newPath = System.IO.Path.Combine(activeDir, "sysxml");
        System.IO.Directory.CreateDirectory(newPath);
        //--------------------------------------------
        string[] files = GetFileList(ftpip, username, password);
        foreach (string file in files)
        {


            if (file.Substring(0, 6).ToUpper() == "MATPWD")
            {
                //Response.Write(file);
                //下載檔案
                Download(file, ftpip, "c:\\sysxml", username, password);
                //Delete File
                Response.Write(file + "<br>");

                DeleteFile(file, ftpip, username, password);

                //讀取檔案
                ReadFile(file, "c:\\sysxml");

            }
        }

 
    }

    private void DeleteFile(string file, string p, string p_3, string p_4)
    {
        FtpWebRequest requestFileDelete = (FtpWebRequest)WebRequest.Create("ftp://"+p+"//" + file);
        requestFileDelete.Credentials = new NetworkCredential(p_3, p_4);
        requestFileDelete.Method = WebRequestMethods.Ftp.DeleteFile;

        FtpWebResponse responseFileDelete = (FtpWebResponse)requestFileDelete.GetResponse();
    }

     

    private void ReadFile(string s, string p)
    {
         
        System.Diagnostics.Debug.Write(s);
        XmlDocument xDoc = new XmlDocument();
        
        xDoc.Load(p+"\\"+s);

        XmlNodeList FileType= xDoc.GetElementsByTagName("FileType");
        XmlNodeList id= xDoc.GetElementsByTagName("id");
       
        XmlNodeList pwd= xDoc.GetElementsByTagName("pwd");
        XmlNodeList pwdhintid= xDoc.GetElementsByTagName("pwdhintid");
       
        XmlNodeList pwdanswer= xDoc.GetElementsByTagName("pwdanswer");

        // ustatus 影響使用者是否為網域登入
        //XmlNodeList ustatus= xDoc.GetElementsByTagName("ustatus");   
         

        
        XmlNodeList modifyuid = xDoc.GetElementsByTagName("modifyuid");


        




        //------------------------------------------------------------------
       xDoc.Clone();

        Response.Write(FileType[0].InnerXml);

      
        UpdateModel(id[0].InnerXml, pwd[0].InnerXml,pwdhintid[0].InnerXml,pwdanswer[0].InnerXml,
             modifyuid[0].InnerXml);
        

        
    }

 //修改模式,中要注意到 管理者有可能是事後才增加 使用者群組,所以我們會delete 之前的 makemodel='A' 的資料
private void UpdateModel(string p,string p_2,string p_3,string p_4,string p_6)
{
 	SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rs.Open("SELECT * FROM dguser WHERE  id='"+p+"'");
      
   

      
        rs["id"] = p;
        rs["pwd"] = p_2;
        if (p_3 != "") { rs["pwdhintid"] = p_3; }

        
        rs["pwdanswer"] = p_4;
       
        rs["ustatus"] = "57DADAB8-44CF-4BAA-A40C-324F9F4533A9";
        rs["modifyuid"] = p_6;
        rs["modifydate"] = DateTime.Now;

        rs.Update();
        rs.Close();

}
    

    
   

  
   
     


    public void Download(string file, string ftpServerIP, string localDestnDir,string ftpUserID, string ftpPassword ){
                           
                string uri = "ftp://" + ftpServerIP + "/" + file;
                Uri serverUri = new Uri(uri);
                if (serverUri.Scheme != Uri.UriSchemeFtp)
                {
                    return;
                }       
                FtpWebRequest reqFTP;                
                reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://" + ftpServerIP +  "/" + file));                                
                reqFTP.Credentials = new NetworkCredential(ftpUserID, ftpPassword);                
                reqFTP.KeepAlive = false;
                reqFTP.Method = WebRequestMethods.Ftp.DownloadFile;                        
                reqFTP.UseBinary = true;
                reqFTP.Proxy = null;                 
                reqFTP.UsePassive = false;
                FtpWebResponse response = (FtpWebResponse)reqFTP.GetResponse();
                Stream responseStream = response.GetResponseStream();
                FileStream writeStream = new FileStream(localDestnDir + "\\" + file, FileMode.Create);                
                int Length = 2048;
                Byte[] buffer = new Byte[Length];
                int bytesRead = responseStream.Read(buffer, 0, Length);               
                while (bytesRead > 0)
                {
                    writeStream.Write(buffer, 0, bytesRead);
                    bytesRead = responseStream.Read(buffer, 0, Length);
                }                
                writeStream.Close();
                response.Close();

                reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://" + ftpServerIP + "/" + file));
                reqFTP.Credentials = new NetworkCredential(ftpUserID, ftpPassword);
                reqFTP.KeepAlive = false;
                reqFTP.Method = WebRequestMethods.Ftp.DeleteFile;
                    

             
        }

        //取得檔案
    public string[] GetFileList(string ftpServerIP,string ftpUserID, string ftpPassword )
    {
        string[] downloadFiles;
        StringBuilder result = new StringBuilder();
        WebResponse response = null;
        StreamReader reader = null;
        try
        {
            FtpWebRequest reqFTP;
            reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://" + ftpServerIP + "/"));
            reqFTP.UseBinary = true;
            reqFTP.Credentials = new NetworkCredential(ftpUserID, ftpPassword);
            reqFTP.Method = WebRequestMethods.Ftp.ListDirectory;
            reqFTP.Proxy = null;
            reqFTP.KeepAlive = false;
            reqFTP.UsePassive = false;
            response = reqFTP.GetResponse();
            reader = new StreamReader(response.GetResponseStream());
            string line = reader.ReadLine();
            while (line != null)
            {
                result.Append(line);
                result.Append("\n");
                line = reader.ReadLine();
            }
            // to remove the trailing '\n'
            result.Remove(result.ToString().LastIndexOf('\n'), 1);
            return result.ToString().Split('\n');
        }
        catch (Exception ex)
        {
            if (reader != null)
            {
                reader.Close();
            }
            if (response != null)
            {
                response.Close();
            }
            downloadFiles = null;
            return downloadFiles;
        }
    }



   


}