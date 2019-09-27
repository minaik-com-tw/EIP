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



public partial class Shipping_ReadXml250 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*   ================= 抓 ERP 資料進 EIP =================  */
        try
        {
                
                // FileRoute 設定..暫存的目錄位置
                string InitDirectory = @"D:\Forwarder\ERP_Download\";

                // 先抓 FTP  的資料
                ArrayList FtpList = List("ftp://192.168.0.250", "xmluser","(XmlUser)");

                foreach (string s in FtpList)
                {
                        //找到 自己要的檔名!
                        if (s.IndexOf("_axmt610") != -1 || s.IndexOf("_axmt850") != -1)
                        {
                            //將目前FTP的XML抓下來
                            Download("ftp://192.168.0.250/" + s, InitDirectory, "xmluser", "(XmlUser)");
                            DeleteFileOnServer("ftp://192.168.0.250/" + s, "xmluser", "(XmlUser)");
                        }

                }


                // 讀取暫存位置中的所有檔案...
                string searchPattern = "*";
                ArrayList MyFiles = new ArrayList();
                DirectoryInfo di = new DirectoryInfo(InitDirectory);

                // 取得檔案列表
                GetFiles(di, searchPattern, ref MyFiles);

                foreach (string T in MyFiles)
                {
                    try
                    {
                        if (T.IndexOf("_axmt610") != -1 || T.IndexOf("_axmt850") != -1)
                        {
                            //讀取 XML 檔案
                            System.Diagnostics.Debug.Write(T);
                            XmlDocument xDoc = new XmlDocument();
                            xDoc.Load(T);
                            XmlNodeList PlantID = xDoc.GetElementsByTagName("PlantID");
                            XmlNodeList ProgramID = xDoc.GetElementsByTagName("ProgramID");
                            XmlNodeList ERP_Key = xDoc.GetElementsByTagName("oga01");
                            XmlNodeList ERP_Key2 = xDoc.GetElementsByTagName("oga011");
                            XmlNodeList INV_Num = xDoc.GetElementsByTagName("oga27");
                            XmlNodeList Cdate = xDoc.GetElementsByTagName("oga02");
                            XmlNodeList SHIPPING_to = xDoc.GetElementsByTagName("addr");
                            XmlNodeList SHIPPING_No = xDoc.GetElementsByTagName("oga31");
                            XmlNodeList SHIPPING_Dec = xDoc.GetElementsByTagName("oah02");
                            XmlNodeList SHIPPING_Mode = xDoc.GetElementsByTagName("oga43");
                            XmlNodeList SHIPPING_ModeDec = xDoc.GetElementsByTagName("ged02");
                            XmlNodeList FORWARDER_Num = xDoc.GetElementsByTagName("ta_oga20");
                            XmlNodeList FORWARDER_Dec = xDoc.GetElementsByTagName("pmc03");
                            xDoc.Clone();

                            // 判斷資料庫有沒有資料...無 -> 新增資料 ; 有 -> 更新資料
                            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs.Open("SELECT * FROM Forwarder WHERE INV_Num ='" + INV_Num[0].InnerXml + "'");
                            if (!rs.EOF)
                            {
                                //更新資料
                                rs["FileName"] = T.Replace("D:\\Forwarder\\ERP_Download\\", "");
                                rs["ERP_Key"] = ERP_Key[0].InnerXml;
                                rs["ERP_Key2"] = ERP_Key2[0].InnerXml;
                                rs["PlantID"] = PlantID[0].InnerXml;
                                rs["ProgramID"] = ProgramID[0].InnerXml;
                                rs["INV_Num"] = INV_Num[0].InnerXml;
                                rs["SHIP_To"] = SHIPPING_to[0].InnerXml;
                                rs["SHIPPING_No"] = SHIPPING_No[0].InnerXml;
                                rs["SHIPPING_Dec"] = SHIPPING_Dec[0].InnerXml;
                                rs["SHIPPING_Mode"] = SHIPPING_Mode[0].InnerXml;
                                rs["SHIPPING_ModeDec"] = SHIPPING_ModeDec[0].InnerXml;
                                rs["FORWARDER_Num"] = FORWARDER_Num[0].InnerXml;
                                rs["FORWARDER_Dec"] = FORWARDER_Dec[0].InnerXml;
                                rs["IsUpload"] = 0;
                                rs["Cdate"] = Cdate[0].InnerXml;
                                rs["Udate"] = System.DateTime.Now.ToString();
                                rs.Update();
                            }
                            else
                            {
                                // 新增資料
                                rs.Add();
                                rs["FileName"] = T.Replace("D:\\Forwarder\\ERP_Download\\", "");
                                rs["PlantID"] = PlantID[0].InnerXml;
                                rs["ERP_Key"] = ERP_Key[0].InnerXml;
                                rs["ERP_Key2"] = ERP_Key2[0].InnerXml;
                                rs["ProgramID"] = ProgramID[0].InnerXml;
                                rs["INV_Num"] = INV_Num[0].InnerXml;
                                rs["SHIP_To"] = SHIPPING_to[0].InnerXml;
                                rs["SHIPPING_No"] = SHIPPING_No[0].InnerXml;
                                rs["SHIPPING_Dec"] = SHIPPING_Dec[0].InnerXml;
                                rs["SHIPPING_Mode"] = SHIPPING_Mode[0].InnerXml;
                                rs["SHIPPING_ModeDec"] = SHIPPING_ModeDec[0].InnerXml;
                                rs["FORWARDER_Num"] = FORWARDER_Num[0].InnerXml;
                                rs["FORWARDER_Dec"] = FORWARDER_Dec[0].InnerXml;
                                rs["IsUpload"] = 0;
                                rs["Cdate"] = Cdate[0].InnerXml;
                                rs.Update();
                            }
                            rs.Close();
                            


                            //判斷在ERP_XML資料夾裡, 檔案是否存在

                            if (System.IO.File.Exists(T.Replace("\\Forwarder\\ERP_Download\\", "\\Forwarder\\ERP_XML\\")))  
                            {
                                //存在的話先刪除該檔案再存入新檔案
                                File.Delete(T.Replace("\\Forwarder\\ERP_Download\\", "\\Forwarder\\ERP_XML\\"));           
                                File.Move(T, T.Replace("\\Forwarder\\ERP_Download\\", "\\Forwarder\\ERP_XML\\"));
                            }
                            else
                            {
                                //不存在直接存入新檔案
                                File.Move(T, T.Replace("\\Forwarder\\ERP_Download\\", "\\Forwarder\\ERP_XML\\"));         
                            }

                            Upload(T.Replace("\\Forwarder\\ERP_Download\\", "\\Forwarder\\ERP_XML\\"), "ftp://192.168.0.250/" + T.Replace("D:\\Forwarder\\ERP_Download\\", ""), "xmlback", "xmlback");

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
                               "Forwarder 系統發生錯誤~<br>" +
                               "<br>" +
                               "產生檔案錯誤時間：" + strTime + "<br>" +
                               "錯誤檔案：" + T + "<br>" +
                               "錯誤訊息：" + ex + "<br><br>" +
                               "因本信件為系統自動發送,請勿直接以此郵件回覆。";
                        message.IsBodyHtml = true;
                        message.Body = ques;
                        SmtpClient client = new SmtpClient("192.168.0.12");
                        client.Send(message);
                    }
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
                       "Forwarder 系統發生錯誤~<br>" +
                       "<br>" +
                       "產生檔案錯誤時間：" + strTime + "<br>" +
                       "錯誤訊息：" + ex + "<br><br>" +
                       "因本信件為系統自動發送,請勿直接以此郵件回覆。";
                message.IsBodyHtml = true;
                message.Body = ques;
                SmtpClient client = new SmtpClient("192.168.0.12");
                client.Send(message);
            }

            /*   ================= 抓 ERP 資料進 EIP =================  */



            /*   ================= 上傳 EIP 資料到 Forwarder =================  */

            string SPKey = "";
            string TFileName = "";

            try
            {
                    SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs1.Open(" Select Forwarder.Pkey,PlantID,ProgramID,FileName,Cdate,INV_Num,SHIP_To,SHIPPING_No,SHIPPING_Dec,SHIPPING_Mode,SHIPPING_ModeDec,FORWARDER_Num,FORWARDER_Dec," +
                             " account,password From Forwarder,ForwarderData where  FORWARDER_Num = ForwarderData.ta_oga20 and isUpload = 0 order by Forwarder.Pkey");
                    while (!rs1.EOF)
                    {
                        TFileName = rs1["FileName"].ToString().Trim();

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

                        if (SPKey == "")
                        {
                            SPKey = rs1["PKey"].ToString();
                        }


                        //ToSupplerFile

                        Response.Write("D:\\Forwarder\\ToSupplerFile\\" + rs1["FileName"].ToString().Trim() + ",ftp://ftp.minaik.com.tw/ToSupplerFile/" + rs1["FileName"].ToString().Trim() + "," + rs1["account"].ToString().Trim() + " , " + rs1["password"].ToString().Trim() );
                        //Response.End();

                        Upload("D:\\Forwarder\\ToSupplerFile\\" + rs1["FileName"].ToString().Trim(), "ftp://ftp.minaik.com.tw/ToSupplerFile/" + rs1["FileName"].ToString().Trim(), rs1["account"].ToString().Trim(), rs1["password"].ToString().Trim());


                        //把上傳過的更改狀態
                        if (SPKey != "")
                        {
                            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs2.Open(" Select PKey,IsUpload From Forwarder Where PKey in (" + SPKey + ")  order by PKey");
                            while (!rs2.EOF)
                            {
                                rs2["IsUpload"] = 1;
                                rs2.Update();
                                rs2.MoveNext();
                            }
                            rs2.Close();
                            SPKey = "";
                        }
                        //把上傳過的更改狀態


                        rs1.MoveNext();                     
                    }
                    rs1.Close();




        
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
                           "檔案名稱：" + TFileName + "<br><br>" +
                           "錯誤訊息：" + ex + "<br><br>" +
                           "因本信件為系統自動發送,請勿直接以此郵件回覆。";
                    message.IsBodyHtml = true;
                    message.Body = ques;
                    SmtpClient client = new SmtpClient("192.168.0.12");
                    client.Send(message);
                }
        
                /*   ================= 上傳 EIP 資料到 Forwarder =================  */
    }


    //取得檔案
    private void GetFiles(DirectoryInfo di, string searchPattern, ref ArrayList MyFiles)
    {
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
    //取得檔案


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
        //try
        //{
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
        /*}
        catch (Exception ex)
        {
            //throw new Exception(ex.Message);
        }
        */
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
