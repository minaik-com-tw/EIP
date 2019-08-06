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
using System.Text;



public partial class Shipping_ReadFtpXml_Agi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Errmsg = "";
        string FileRoute = @"D:\Forwarder\FTP_Download\";
        string tInitDirectory = @"D:\4GL\";  //原始目錄
        string sql1 = "Select * From ForwarderData";
        string sFileName = "";
        string sINV_Num = "";
        ArrayList FtpList;
        
         FtpList = List("ftp://ftp.minaik.com.tw//ToMinaik//", "Agilitylogistics", "agi315708");

        System.Threading.Thread.Sleep(3000);

       foreach (string FileName in FtpList)
        {
            if (FileName.IndexOf(".xml") != -1)
            {
                //將目前FTP的XML抓下來
                Download("ftp://ftp.minaik.com.tw//ToMinaik//" + FileName, FileRoute, "Agilitylogistics", "agi315708");
                System.Threading.Thread.Sleep(3000);

                //FTP的XML抓下來後刪除FTP上XML檔案
                DeleteFileOnServer("ftp://ftp.minaik.com.tw//ToMinaik//" + FileName, "Agilitylogistics", "agi315708");
                System.Threading.Thread.Sleep(3000);
            }
        }
        

        // 設定檔案讀取位置...
        string searchPattern = "*";

        string InitDirectory = @"D:\Forwarder\FTP_Download\";  //原始目錄
        ArrayList MyFiles = new ArrayList();
        DirectoryInfo di = new DirectoryInfo(InitDirectory);
        GetFiles(di, searchPattern, ref MyFiles);

        foreach (string s in MyFiles)
        {
            try
            {
                //找到當天的檔名!
                if (s.IndexOf("_axmt610") != -1 || s.IndexOf("_axmt850") != -1)
                {
                    System.Diagnostics.Debug.Write(s);
                    XmlDocument xDoc = new XmlDocument();
                    xDoc.Load(s);

                    XmlNodeList PlantID = xDoc.GetElementsByTagName("PlantID");
                    XmlNodeList ProgramID = xDoc.GetElementsByTagName("ProgramID");
                    XmlNodeList INV_Num = xDoc.GetElementsByTagName("oga27");
                    XmlNodeList Cdate = xDoc.GetElementsByTagName("oga02");
                    XmlNodeList SHIPPING_to = xDoc.GetElementsByTagName("addr");
                    XmlNodeList SHIPPING_No = xDoc.GetElementsByTagName("oga31");
                    XmlNodeList SHIPPING_Dec = xDoc.GetElementsByTagName("oah02");
                    XmlNodeList SHIPPING_Mode = xDoc.GetElementsByTagName("oga43");
                    XmlNodeList SHIPPING_ModeDec = xDoc.GetElementsByTagName("ged02");
                    XmlNodeList FORWARDER_Num = xDoc.GetElementsByTagName("ta_oga20");
                    XmlNodeList FORWARDER_Dec = xDoc.GetElementsByTagName("pmc03");
                    XmlNodeList HawbNo = xDoc.GetElementsByTagName("ta_oga26");
                    XmlNodeList FitNo = xDoc.GetElementsByTagName("oga48");
                    XmlNodeList ETD = xDoc.GetElementsByTagName("ta_oga22");
                    XmlNodeList ATD = xDoc.GetElementsByTagName("ta_oga24");
                    XmlNodeList ETA = xDoc.GetElementsByTagName("ta_oga21");
                    XmlNodeList ATAAS = xDoc.GetElementsByTagName("ta_oga23");
                    XmlNodeList ATAC = xDoc.GetElementsByTagName("ta_oga25");

                    xDoc.Clone();

                    bool isChange = false;
                    bool isError = false;

                    string isDiff = "";
                    string IsStatus = "";

                    string TempID = "";
                    string warstring = "";
                    string ERPKey = "";


                    DateTime dtResult;
                    DateTime datetime;

                    string logETD = "";
                    string logATD = "";
                    string logETA = "";
                    string logATAAS = "";
                    string logATAC = "";
                    string TempFileName = "";
                    string SHIPPINGDec = "";

                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("SELECT * FROM Forwarder WHERE INV_Num ='" + INV_Num[0].InnerXml + "'");
                        if (!rs.EOF)
                        {
                            TempFileName = rs["FileName"].ToString();
                            ERPKey = rs["ERP_Key"].ToString();
                            IsStatus = rs["IsStatus"].ToString();
                            TempID = rs["id"].ToString();
                            SHIPPINGDec = rs["SHIPPING_Dec"].ToString();

                            //  Hawbno Update ------------

                                if (HawbNo.Count != 0)
                                {
                                    if (rs["HawbNo"].ToString() != HawbNo[0].InnerXml)
                                    {
                                        isChange = true;
                                        isDiff = isDiff + " 提貨單號更動 (" + rs["HawbNo"].ToString() + " --> " + HawbNo[0].InnerXml + ")<BR/>";
                                        rs["HawbNo"] = HawbNo[0].InnerXml;
                                    }
                                }
                                else
                                {
                                    isError = true;
                                    warstring = warstring + "提貨單號空值!!<BR/>";
                                }

                            //  Hawbno Update -----------



                            //  FitNo Update ----------

                                if (FitNo.Count != 0)
                                {
                                    if (rs["FitNo"].ToString() != FitNo[0].InnerXml)
                                    {
                                        isChange = true;
                                        isDiff = isDiff + "班機號碼/航班更動(" + rs["FitNo"].ToString() + " --> " + FitNo[0].InnerXml + ")<BR/>";
                                        rs["FitNo"] = FitNo[0].InnerXml;
                                    }
                                }
                                else
                                {
                                    isError = true;
                                    warstring = warstring + "班機號碼/船名航次未填寫!!<BR/>";
                                }

                            //  FitNo Update ----------



                            
                            //  ETD Update ----------
                            if (ETD.Count != 0)
                            {
                                // 記錄 ETD 時間
                                logETD = ETD[0].InnerXml;

                                if (DateTime.TryParse(ETD[0].InnerXml, out dtResult))
                                {
                                    if (rs["ETD"] != System.DBNull.Value)
                                    {
                                        datetime = Convert.ToDateTime(rs["ETD"].ToString());
                                        if (datetime.ToString("yyyy/MM/dd HH:mm") != ETD[0].InnerXml)
                                        {
                                            isChange = true;
                                            isDiff = isDiff + "ETD 更動(" + rs["ETD"].ToString() + " --> " + ETD[0].InnerXml + ")<BR/>";
                                            rs["ETD"] = ETD[0].InnerXml;
                                        }
                                    }
                                    else
                                    {
                                        isChange = true;
                                        isDiff = isDiff + "ETD 更動( Null  --> " + ETD[0].InnerXml + ")<BR/>";
                                        rs["ETD"] = ETD[0].InnerXml;
                                    }
                                }
                                else
                                {
                                    isError = true;
                                    warstring = warstring + "ETD 時間格式異常!(" + ETD[0].InnerXml + ")<BR/>";
                                }
                            }
                            //  ETD Update ----------


                            //  ATD Update ----------
                                if (ATD.Count != 0)
                                {
                                    // 記錄 ATD 時間
                                    logATD = ATD[0].InnerXml;

                                    if (DateTime.TryParse(ATD[0].InnerXml, out dtResult))
                                    {
                                        if (rs["ATD"] != System.DBNull.Value)
                                        {
                                            datetime = Convert.ToDateTime(rs["ATD"].ToString());
                                            if (datetime.ToString("yyyy/MM/dd HH:mm") != ATD[0].InnerXml)
                                            {
                                                isChange = true;
                                                isDiff = isDiff + "ATD 更動(" + rs["ATD"].ToString() + " --> " + ATD[0].InnerXml + ")<BR/>";
                                                rs["ATD"] = ATD[0].InnerXml;
                                            }
                                        }
                                        else
                                        {
                                            isChange = true;
                                            isDiff = isDiff + "ATD 更動( Null  --> " + ATD[0].InnerXml + ")<BR/>";
                                            rs["ATD"] = ATD[0].InnerXml;
                                        }
                                    }
                                    else
                                    {
                                        isError = true;
                                        warstring = warstring + "ATD 時間格式異常!(" + ATD[0].InnerXml + ")<BR/>";
                                    }
                                }
                            //  ATD Update ----------



                            //  ETA Update ----------
                                if (ETA.Count != 0)
                                {
                                    // 記錄 ETA 時間
                                    logETA = ETA[0].InnerXml;

                                    if (DateTime.TryParse(ETA[0].InnerXml, out dtResult))
                                    {

                                        if (rs["ETA"] != System.DBNull.Value)
                                        {
                                            datetime = Convert.ToDateTime(rs["ETA"].ToString());
                                            if (datetime.ToString("yyyy/MM/dd HH:mm") != ETA[0].InnerXml)
                                            {
                                                isChange = true;
                                                isDiff = isDiff + "ETA 更動(" + rs["ETA"].ToString() + " --> " + ETA[0].InnerXml + ")<BR/>";
                                                rs["ETA"] = ETA[0].InnerXml;
                                            }
                                        }
                                        else
                                        {
                                            isChange = true;
                                            isDiff = isDiff + "ETA 更動( Null  --> " + ETA[0].InnerXml + ")<BR/>";
                                            rs["ETA"] = ETA[0].InnerXml;
                                        }
                                    }
                                    else
                                    {
                                        isError = true;
                                        warstring = warstring + "ETA 時間格式異常!(" + ETA[0].InnerXml + ")<BR/>";
                                    }
                                }
                             //  ETA Update ----------


                             //  ATAAS Update ----------
                                if (ATAAS.Count != 0)
                                {
                                    // 記錄 ATAAS 時間
                                    logATAAS = ATAAS[0].InnerXml;


                                    if (DateTime.TryParse(ATAAS[0].InnerXml, out dtResult))
                                    {
                                        if (rs["ATAAS"] != System.DBNull.Value)
                                        {
                                            datetime = Convert.ToDateTime(rs["ATAAS"].ToString());
                                            if (datetime.ToString("yyyy/MM/dd HH:mm") != ATAAS[0].InnerXml)
                                            {
                                                isChange = true;
                                                isDiff = isDiff + "ATAAS 更動(" + rs["ATAAS"].ToString() + " --> " + ATAAS[0].InnerXml + ")<BR/>";
                                                rs["ATAAS"] = ATAAS[0].InnerXml;
                                            }
                                        }
                                        else
                                        {
                                            isChange = true;
                                            isDiff = isDiff + "ATAAS 更動( Null --> " + ATAAS[0].InnerXml + ")<BR/>";
                                            rs["ATAAS"] = ATAAS[0].InnerXml;
                                        }
                                    }
                                    else
                                    {
                                        isError = true;
                                        warstring = warstring + "ATAAS 時間格式異常!(" + ATAAS[0].InnerXml + ")<BR/>";
                                    }
                                }
                             //  ATAAS Update ----------



                             //  ATAC Update ----------
                              if (ATAC.Count != 0)
                                {
                                    // 記錄 ATAC 時間
                                    logATAC = ATAC[0].InnerXml;


                                    if (DateTime.TryParse(ATAC[0].InnerXml, out dtResult))
                                    {
                                        if (rs["ATAC"] != System.DBNull.Value)
                                        {
                                            datetime = Convert.ToDateTime(rs["ATAC"].ToString());
                                            if (datetime.ToString("yyyy/MM/dd HH:mm") != ATAC[0].InnerXml)
                                            {
                                                isChange = true;
                                                isDiff = isDiff + "ATAC 更動(" + rs["ATAC"].ToString() + " --> " + ATAC[0].InnerXml + ")<BR/>";
                                                rs["ATAC"] = ATAC[0].InnerXml;
                                            }
                                        }
                                        else
                                        {
                                            isChange = true;
                                            isDiff = isDiff + "ATAC 更動( Null  --> " + ATAC[0].InnerXml + ")<BR/>";
                                            rs["ATAC"] = ATAC[0].InnerXml;
                                        }
                                    }
                                    else
                                    {
                                        isError = true;
                                        warstring = warstring + "ATAC 時間格式異常!(" + ATAC[0].InnerXml + ")<BR/>";
                                    }
                                }
                                //  ATAC Update ----------

                                
                                if (isChange)
                                {
                                    rs["Udate"] = System.DateTime.Now.ToString();
                                    rs["IsStatus"] = "isSend";
                                    rs.Update();
                                }
                                
                            
                            rs.Close();
                        }
                        else
                        {
                            isError = true;

                            
                            //發現資料庫沒此資料 OR 已審核完畢
                            Errmsg = "您好:" + "<br>" +
                                   "<br>" +
                                   "時間：" + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss") + "<br><br>" +
                                   "出通單號：" + ERPKey + "<br>" +
                                   "發票編號：" + INV_Num[0].InnerXml + "<br>" +
                                   "錯誤情形：查無此單據資料，無法更新!!<br>" +
                                   "<br>" +
                                   "錯誤檔案：" + s + "<br>" +
                                   "廠商名稱：" + FORWARDER_Dec[0].InnerXml + "<br><br>" +
                                   "因本信件為系統自動發送,請勿直接以此郵件回覆。";

                            rs.Close();

                        }


                        if (isChange)
                        {

                            this.FlowClient1.RequestURL = "/Shipping/ForwarderEdit?id=" + TempID;
                            this.FlowClient1.StopRequest(this.FlowClient1.RequestURL);

                            this.FlowClient1.Flow.DefaultNode().ReviewerURL = "/Shipping/ForwarderView.aspx";
                            this.FlowClient1.RequestURL = "/Shipping/ForwarderEdit.aspx?id=" + TempID;
                            this.FlowClient1.AddParameter("USER", "1d933141-e015-47fe-a6f2-846231264ac0");
                            this.FlowClient1.SendRequest(new System.Guid("1d933141-e015-47fe-a6f2-846231264ac0"));

                            MailAddress from = new MailAddress("eip@minaik.com.tw", "Forwarder(審核通知-" + ERPKey + ")");
                            MailAddress to = new MailAddress("cindy.lin@minaik.com.tw");
                            MailAddress bcc = new MailAddress("herzog.lin@minaik.com.tw");
                            MailMessage message = new MailMessage(from, to);
                            message.Bcc.Add(bcc);
                            message.Subject = "Forwarder(Agi審核通知)";
                                Errmsg = "您好:" + "<br>" +
                                       "<br>" +
                                       "時間：" + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss") + "<br><br>" +
                                       "出通單號：" + ERPKey + "<br>" +
                                       "發票編號：" + INV_Num[0].InnerXml + "<br>" +
                                       "價格條件：" + SHIPPING_No[0].InnerXml + "<br>" +
                                       "價格描述：" + SHIPPINGDec + "<br>" +
                                       "Forwarder 價格條件異常~<br>" + warstring +
                                       "<br>" +
                                       "錯誤檔案：" + s + "<br>" +
                                       "廠商名稱：" + FORWARDER_Dec[0].InnerXml + "<br><br>" +
                                       "===================== 明  細  異  動 =====================<br>" + isDiff +
                                       "====================================================<br>" +
                                       "點選下列連結進行審核!!<br>" +
                                       "<a href=http://eip.minaik.com.tw/Shipping/ForwarderView.aspx?ID=" + TempID + ">http://eip.minaik.com.tw/Shipping/ForwarderView.aspx?ID=" + TempID + "</a><br>" +
                                       "因本信件為系統自動發送,請勿直接以此郵件回覆。";
                            message.IsBodyHtml = true;
                            message.Body = Errmsg;
                            SmtpClient client = new SmtpClient("192.168.0.12");
                            client.Send(message);

                            isError = false;
                        }


                        if (isError)
                        {
                            MailAddress from = new MailAddress("eip@minaik.com.tw", "Forwarder(資料錯誤)");
                            MailAddress to = new MailAddress("herzog.lin@minaik.com.tw");
                            MailMessage message = new MailMessage(from, to);
                            message.Subject = "Forwarder(資料錯誤)";

                            if (Errmsg == "")
                            {
                                Errmsg = "您好:" + "<br>" +
                                       "<br>" +
                                       "時間：" + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss") + "<br><br>" +
                                       "出通單號：" + ERPKey + "<br>" +
                                       "發票編號：" + INV_Num[0].InnerXml + "<br>" +
                                       "價格條件：" + SHIPPING_No[0].InnerXml + "<br>" +
                                       "價格描述：" + SHIPPINGDec + "<br>" +
                                       "<br>" +
                                       "檔案名稱：" + s + "<br>" +
                                       "廠商名稱：" + FORWARDER_Dec[0].InnerXml + "<br><br>" +
                                       "================== 錯  誤  明  細 ==================<br>" + warstring +
                                       "====================================================<br>" +
                                       "因本信件為系統自動發送,請勿直接以此郵件回覆。";
                            }
                            message.IsBodyHtml = true;
                            message.Body = Errmsg;
                            SmtpClient client = new SmtpClient("192.168.0.12");
                            client.Send(message);
                        }


                        string ReFileName = "";

                        if (System.IO.File.Exists(s.Replace("\\FTP_Download\\", "\\FTP_XML\\")))  //判斷在 FTP_BXML 資料夾裡, 檔案是否存在
                        {
                            File.Delete(s.Replace("\\FTP_Download\\", "\\FTP_XML\\"));            //存在的話先刪除該檔案再存入新檔案

                            ReFileName = DateTime.Now.ToString("yyyy-MM-dd_HHmmss");
                            File.Move(s, s.Replace("\\FTP_Download\\", "\\FTP_XML\\").Replace(".xml", "_" + ReFileName + ".xml"));
                        }
                        else
                        {
                            ReFileName = DateTime.Now.ToString("yyyy-MM-dd_HHmmss");
                            File.Move(s, s.Replace("\\FTP_Download\\", "\\FTP_XML\\").Replace(".xml", "_" + ReFileName + ".xml"));
                        }

                        SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs2.Open("SELECT * FROM Forwarder_log WHERE INV_Num ='" + INV_Num[0].InnerXml + "'");
                        if (rs2.EOF)
                        {
                            Response.Write(TempFileName.Replace(".xml", "_" + ReFileName + ".xml"));
                            rs2.Add();
                            rs2["INV_Num"] = INV_Num[0].InnerXml;
                            rs2["logETD"] = logETD;
                            rs2["logATD"] = logATD;
                            rs2["logETA"] = logETA;
                            rs2["logATAAS"] = logATAAS;
                            rs2["logATAC"] = logATAC;
                            rs2["DataFileName"] = TempFileName.Replace(".xml", "_" + ReFileName + ".xml");
                            rs2["DataUpdate"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm"); ;
                            rs2.Update();
                        }
                        else
                        {
                            Response.Write(TempFileName.Replace(".xml", "_" + ReFileName + ".xml"));
                            rs2["INV_Num"] = INV_Num[0].InnerXml;
                            rs2["logETD"] = logETD;
                            rs2["logATD"] = logATD;
                            rs2["logETA"] = logETA;
                            rs2["logATAAS"] = logATAAS;
                            rs2["logATAC"] = logATAC;
                            rs2["DataFileName"] = TempFileName.Replace(".xml", "_" + ReFileName + ".xml");
                            rs2["DataUpdate"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm"); ;
                            rs2.Update();
                        }
                        xDoc.Clone();
                        rs2.Close();

                }
            }
            catch (Exception ex)
            {
                MailAddress from = new MailAddress("eip@minaik.com.tw", "Forwarder(錯誤訊息)_Shipping_ReadFtpXml_Agi");
                MailAddress to = new MailAddress("herzog.lin@minaik.com.tw");
                MailMessage message = new MailMessage(from, to);
                message.Subject = "Forwarder(錯誤訊息)-Shipping_ReadFtpXml_Agi";
                string ques = "";
                ques = "您好:" + "<br>" +
                       "<br>" +
                       "Forwarder 系統發生錯誤~<br>" +
                       "<br>" +
                       "錯誤檔案：" + s + "<br>" +
                       "錯誤訊息：" + ex + "<br><br>" +
                       "因本信件為系統自動發送,請勿直接以此郵件回覆。";
                message.IsBodyHtml = true;
                message.Body = ques;
                SmtpClient client = new SmtpClient("192.168.0.12");
                client.Send(message);
            }
        }
    }


    // FTP 列出檔案名稱
    protected ArrayList List(string listUrl, string UserName, string Password)
    {
        StreamReader reader = null;
        ArrayList FileNameList = new ArrayList();

        try
        {
            FtpWebRequest listRequest = (FtpWebRequest)WebRequest.Create(listUrl);

            listRequest.Method = WebRequestMethods.Ftp.ListDirectory;
            listRequest.Credentials = new NetworkCredential(UserName, Password);

            FtpWebResponse listResponse = (FtpWebResponse)listRequest.GetResponse();
            reader = new StreamReader(listResponse.GetResponseStream());

            string line = reader.ReadLine();
            Response.Write(line);

            while (line != null)
            {
                FileNameList.Add(line);
                line = reader.ReadLine();
            }

            reader.Close();
            listResponse.Close();

        }
        catch (System.Exception oEx)
        {
            Response.Write(oEx.Message);
            if (oEx.GetType() == typeof(System.Net.WebException))
            {

            }
            else
            {

            }

        }

        return FileNameList;
        //回傳目前清單
    }




    // FTP 下載
    private bool Download(string downloadUrl, string TargetPath, string UserName, string Password)
    {
        // downloadUrl下載FTP的目錄ex : 
        // ftp//127.0.0.1/abc.xml 
        // TargetPath本機存檔目錄
        // UserName使用者FTP登入帳號 
        // Password使用者登入密碼

        Stream responseStream = null;
        FileStream fileStream = null;
        StreamReader reader = null;

        FtpWebRequest downloadRequest = (FtpWebRequest)WebRequest.Create(downloadUrl);
        downloadRequest.Method = WebRequestMethods.Ftp.DownloadFile;
        downloadRequest.Credentials = new NetworkCredential(UserName, Password);
        FtpWebResponse downloadResponse = (FtpWebResponse)downloadRequest.GetResponse();
        responseStream = downloadResponse.GetResponseStream();
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
            fileStream.Close();
        }
        downloadResponse.Close();
        return true;
    }


    // FTP 刪除檔案
    private static bool DeleteFileOnServer(string DeleteUrl, string UserName, string Password)
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

}
