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





public partial class Shipping_ReadXml : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 設定檔案讀取位置...
        string searchPattern = "*";
        string InitDirectory = @"D:\XML\";    // 原始目錄
        
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

                    // 沒資料就新增資料 ~ 如有這筆就更新資料
                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("SELECT * FROM Forwarder WHERE INV_Num ='" + INV_Num[0].InnerXml + "'");
                        if (!rs.EOF)
                        {
                            rs["FileName"] = s.Replace("D:\\XML\\", "");
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
                            rs["Cdate"] = Cdate[0].InnerXml;
                            rs["IsUpload"] = 0;
                            rs["Udate"] = System.DateTime.Now.ToString();
                            rs.Update();
                        }
                        else
                        {
                            rs.Add();
                            rs["FileName"] = s.Replace("D:\\XML\\", "");
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
                    // 新增資料


                    if (System.IO.File.Exists(s.Replace("\\XML\\", "\\Forwarder\\ERP_XML\\")))  //判斷在Bxml資料夾裡, 檔案是否存在
                    {
                        File.Delete(s.Replace("\\XML\\", "\\Forwarder\\ERP_XML\\"));           //存在的話先刪除該檔案再存入新檔案
                        File.Move(s, s.Replace("\\XML\\", "\\Forwarder\\ERP_XML\\"));
                    }
                    else
                    {
                        File.Move(s, s.Replace("\\XML\\", "\\Forwarder\\ERP_XML\\"));         //不存在直接存入新檔案
                    }
                }



                
            }
            catch (Exception ex)
            {
                string strTime = DateTime.Now.ToString("yyyy-MM-dd_hhmmss");
                MailAddress from = new MailAddress("eip@minaik.com.tw", "Forwarder(錯誤訊息)");
                MailAddress to = new MailAddress("rick.chen@minaik.com.tw");
                MailMessage message = new MailMessage(from, to);
                message.Subject = "Forwarder(錯誤訊息)";
                string ques = "";
                ques = "您好:" + "<br>" +
                       "<br>" +
                       "Forwarder 系統發生錯誤~<br>" +
                       "<br>" +
                       "產生檔案錯誤時間：" + strTime + "<br>" +
                       "錯誤檔案：" + s + "<br>" +
                       "錯誤訊息：" + ex + "<br><br>" +
                       "因本信件為系統自動發送,請勿直接以此郵件回覆。";
                message.IsBodyHtml = true;
                message.Body = ques;
                SmtpClient client = new SmtpClient("192.168.0.12");
                client.Send(message);
            }
        }




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
                else
                {
                    SPKey = SPKey + "," + rs1["PKey"].ToString() ;
                }

                Upload("D:\\Forwarder\\ToSupplerFile\\" + rs1["FileName"].ToString().Trim(), "ftp://ftp.minaik.com.tw/ToSupplerFile/" + rs1["FileName"].ToString().Trim(), rs1["account"].ToString().Trim(), rs1["password"].ToString().Trim());
                rs1.MoveNext();
            }
            rs1.Close();

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
                }
            //把上傳過的更改狀態

        }
        catch (Exception ex)
        {
            string strTime = DateTime.Now.ToString("yyyy-MM-dd_hhmmss");
            MailAddress from = new MailAddress("eip@minaik.com.tw", "Forwarder(錯誤訊息)");
            MailAddress to = new MailAddress("rick.chen@minaik.com.tw");
            MailMessage message = new MailMessage(from, to);
            message.Subject = "Forwarder(錯誤訊息)";
            string ques = "";
            ques = "您好:" + "<br>" +
                   "<br>" +
                   "Forwarder 檔案發生錯誤~<br><br>" +
                   "產生檔案錯誤時間：" + strTime + "<br>" +
                   "檔案名稱：" + TFileName + "<br><br>" +
                   "錯誤訊息：" + ex + "<br><br>" +
                   "因本信件為系統自動發送,請勿直接以此郵件回覆。";
            message.IsBodyHtml = true;
            message.Body = ques;
            SmtpClient client = new SmtpClient("192.168.0.12");
            client.Send(message);
        }
        Response.End();


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
