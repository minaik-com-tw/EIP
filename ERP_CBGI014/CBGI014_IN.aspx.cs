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


public partial class APMI610_IN : SmoothEnterprise.Web.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

       // mailprocess("201-1550001", "MATE02");

        /*   ================= 抓 ERP 資料進 EIP =================  */
        // FileRoute 設定..暫存的目錄位置
        string InitDirectory = @"D:\CBGI014_XML\ERP_Download\";

        // 先抓 FTP  的資料
        ArrayList FtpList = List("ftp://192.168.0.250/", "xmluser", "(XmlUser)");

        foreach (string s in FtpList)
        {
            //Response.Write("AAA");
            Response.Write(s.ToString());
            //找到 自己要的檔名!
            if (s.ToUpper().IndexOf("CBGI014") != -1)
            {
                Response.Write("Go<br>");
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

            string sno = "";
            int  ver=1;
            Guid rowid = Guid.NewGuid();

            DBTransfer fs = new DBTransfer();
             //try
             //{
            if (s.IndexOf("CBGI014") != -1)
                {
                    Response.Write("yes");


                    Response.Write("---------" + s.IndexOf("_") + "<br>");
                    System.Diagnostics.Debug.Write(s);
                    //this.textBox3.AppendText(s + "\n");
                    Response.Write(s + "\n");
                    XmlDocument xDoc = new XmlDocument();
                    xDoc.Load((s));
                    XmlNodeList plantid = xDoc.GetElementsByTagName("PlantID");
                    XmlNodeList tc_cba00 = xDoc.GetElementsByTagName("tc_cba00");
                    XmlNodeList tc_cba01 = xDoc.GetElementsByTagName("tc_cba01");
                    XmlNodeList gem02_0 = xDoc.GetElementsByTagName("gem02-0");
                    XmlNodeList tc_cba02 = xDoc.GetElementsByTagName("tc_cba02");
                    XmlNodeList tc_cbauser = xDoc.GetElementsByTagName("tc_cbauser");
                    XmlNodeList gen02_1 = xDoc.GetElementsByTagName("gen02-1");
                    XmlNodeList tc_cbagrup = xDoc.GetElementsByTagName("tc_cbagrup");

                    #region  讀取XML 資料
                 
                   




                    XmlNodeList tc_cbb03 = xDoc.GetElementsByTagName("tc_cbb03");
                   XmlNodeList faj31 = xDoc.GetElementsByTagName("faj31");

                    XmlNodeList fajowner = xDoc.GetElementsByTagName("fajowner");
                    XmlNodeList tc_cbb04 = xDoc.GetElementsByTagName("tc_cbb04");
                    XmlNodeList tc_cbb05 = xDoc.GetElementsByTagName("tc_cbb05");

                    XmlNodeList aag02 = xDoc.GetElementsByTagName("aag02");
                    XmlNodeList tc_cbb22 = xDoc.GetElementsByTagName("tc_cbb22");
                    XmlNodeList tc_cbb06 = xDoc.GetElementsByTagName("tc_cbb06");
                    XmlNodeList tc_bgx02 = xDoc.GetElementsByTagName("tc_bgx02");


                    XmlNodeList tc_cbb07 = xDoc.GetElementsByTagName("tc_cbb07");
                    XmlNodeList tc_bgy02 = xDoc.GetElementsByTagName("tc_bgy02");
                    XmlNodeList tc_cbb08 = xDoc.GetElementsByTagName("tc_cbb08");
                    XmlNodeList fac02 = xDoc.GetElementsByTagName("fac02");
                    

                    XmlNodeList tc_cbb18 = xDoc.GetElementsByTagName("tc_cbb18");
                    XmlNodeList tc_cbb09 = xDoc.GetElementsByTagName("tc_cbb09");
                    XmlNodeList tc_cbb091 = xDoc.GetElementsByTagName("tc_cbb091");
                    XmlNodeList tc_cbb10 = xDoc.GetElementsByTagName("tc_cbb10");

                    XmlNodeList tc_cbb11 = xDoc.GetElementsByTagName("tc_cbb11");
                    XmlNodeList tc_cbb12 = xDoc.GetElementsByTagName("tc_cbb12");
                    XmlNodeList tc_cbb13f = xDoc.GetElementsByTagName("tc_cbb13f");
                    XmlNodeList tc_cbb13 = xDoc.GetElementsByTagName("tc_cbb13");

                    XmlNodeList tc_cbb14f = xDoc.GetElementsByTagName("tc_cbb14f");
                    XmlNodeList tc_cbb14 = xDoc.GetElementsByTagName("tc_cbb14");
                    XmlNodeList tc_cbb19 = xDoc.GetElementsByTagName("tc_cbb19");
                    XmlNodeList tc_cbb15 = xDoc.GetElementsByTagName("tc_cbb15");

                    XmlNodeList azf03 = xDoc.GetElementsByTagName("azf03");
                    XmlNodeList tc_cbb16 = xDoc.GetElementsByTagName("tc_cbb16");
                    XmlNodeList tc_cbb21 = xDoc.GetElementsByTagName("tc_cbb21");
                    XmlNodeList tc_cbb17 = xDoc.GetElementsByTagName("tc_cbb17");

                    XmlNodeList tc_cbb171 = xDoc.GetElementsByTagName("tc_cbb171");

                    XmlNodeList faj26 = xDoc.GetElementsByTagName("faj26");

                    #endregion

                    string titlesn = tc_cba00[0].InnerXml + "-" + gem02_0[0].InnerXml;

                    Response.Write("---"+tc_cbb03.Count.ToString()+"----");
                    #region  CBGI014_Head 單號不相同,將資料全數新增
                    //  Response.Write("select * from eipb.dbo.APMI610_IN  where pmk01 = '" + pmk01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
                    SmoothEnterprise.Database.DataSet hs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    hs.Open("select top 1 * from eipb.dbo.CBGI014_Head  where File_sn = '" + s + "' order by ver desc" );//檢查單頭是否有重覆單據號碼
                  
                   
                        
                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("select * from eipb.dbo.CBGI014_Head WHERE 1=0");
                        rs.Add();
                        //同一份預算檔案存在
                        if (!hs.EOF)
                        {
                            //取出舊單號
                            sno=hs["sn"].ToString();   
                            //版次加1
                            ver=Int32.Parse(hs["ver"].ToString())+1;
                        }else{
                            EIPSysSha UseSha = new EIPSysSha();
                            sno = UseSha.GetNewSn("A501", DateTime.Now.ToString("yyMM"));
                        }
                            //rs["pmcano"] = pmcano[0].InnerXml;
                            rs["rowid"] = rowid;

                            rs["sn"] = sno;
                            rs["ver"] = ver;
                            rs["inidate"] = DateTime.Now.ToShortDateString();
                            //系統只有版本概念

                

                            //}
                            //else
                            //{
                            //    rs.Open("select * from eipb.dbo.CBGI014_Head  where File_sn = '" + s + "'");//檢查單頭是否有重覆單據號碼
                            //    rs["moddate"] = DateTime.Now.ToShortDateString();

                            //    //取出sno
                            //    sno = fs.GetTopfile("select sn from eipb.dbo.CBGI014_Head  where File_sn = '" + s + "'");


                            //}

                            string ftstr = plantid[0].InnerXml + "_cbgi014_" + tc_cba00[0].InnerXml + "_" + tc_cba01[0].InnerXml + "_" + tc_cba02[0].InnerXml.Substring(0, 1);
                            if (plantid[0].InnerXml != "") rs["plantID"] = plantid[0].InnerXml;
                            if (tc_cba00[0].InnerXml != "") rs["tc_cba00"] = tc_cba00[0].InnerXml;
                            if (tc_cba01[0].InnerXml != "") rs["tc_cba01"] = tc_cba01[0].InnerXml;
                            if (gem02_0[0].InnerXml != "") rs["gem02_0"] = gem02_0[0].InnerXml;

                            if (tc_cba02[0].InnerXml != "") rs["tc_cba02"] = tc_cba02[0].InnerXml;
                            if (tc_cbauser[0].InnerXml != "") rs["tc_cbauser"] = tc_cbauser[0].InnerXml.Substring(0,6);
                            if (tc_cbagrup[0].InnerXml != "") rs["tc_cbagrup"] = tc_cbagrup[0].InnerXml;

                            if (gen02_1[0].InnerXml != "") rs["gen02_1"] = gen02_1[0].InnerXml;



                            rs["File_sn"] = s;
                            rs["Status"] = "N";

                            rs.Update();
                            rs.Close();

                            hs.Close();
                          
                        #endregion

                    

                    #region  CBGI014_Body 單號不相同,將資料全數新增
                        // Response.Write(tc_cbb03.Count.ToString() + "---");
                        for (int i = 0; i < tc_cbb03.Count; i++)
                        {
                            //SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                             
                                rs.Open("select * from eipb.dbo.CBGI014_Body WHERE 1=0");
                                rs.Add();


                                rs["sn"] = sno;
                                rs["rowid"] = rowid;



                                if (tc_cbb03[i].InnerXml != "") rs["tc_cbb03"] = tc_cbb03[i].InnerXml;
                                if (faj31[i].InnerXml != "") rs["faj31"] = faj31[i].InnerXml.Trim();
                               if (fajowner[i].InnerXml != "") rs["fajowner"] = fajowner[i].InnerXml;
                                if (tc_cbb04[i].InnerXml != "") rs["tc_cbb04"] = tc_cbb04[i].InnerXml;
                                if (tc_cbb05[i].InnerXml != "") rs["tc_cbb05"] = tc_cbb05[i].InnerXml;

                                if (tc_cbb22[i].InnerXml != "") rs["tc_cbb22"] = tc_cbb22[i].InnerXml;
                                if (tc_cbb06[i].InnerXml != "") rs["tc_cbb06"] = tc_cbb06[i].InnerXml;
                                if (tc_bgx02[i].InnerXml != "") rs["tc_bgx02"] = tc_bgx02[i].InnerXml;

                                if (tc_cbb07[i].InnerXml != "") rs["tc_cbb07"] = tc_cbb07[i].InnerXml;
                                if (tc_bgy02[i].InnerXml != "") rs["tc_bgy02"] = tc_bgy02[i].InnerXml;
                                if (tc_cbb08[i].InnerXml != "") rs["tc_cbb08"] = tc_cbb08[i].InnerXml;
                                if (fac02[i].InnerXml != "") rs["fac02"] = fac02[i].InnerXml;
                                if (aag02[i].InnerXml != "") rs["aag02"] = aag02[i].InnerXml;

                                if (tc_cbb18[i].InnerXml != "") rs["tc_cbb18"] = tc_cbb18[i].InnerXml;
                                if (tc_cbb09[i].InnerXml != "") rs["tc_cbb09"] = tc_cbb09[i].InnerXml;

                                if (tc_cbb091[i].InnerXml != "") rs["tc_cbb091"] = tc_cbb091[i].InnerXml;
                                if (tc_cbb10[i].InnerXml != "") rs["tc_cbb10"] = tc_cbb10[i].InnerXml;

                                if (tc_cbb11[i].InnerXml != "") rs["tc_cbb11"] = tc_cbb11[i].InnerXml;
                                if (tc_cbb12[i].InnerXml != "") rs["tc_cbb12"] = tc_cbb12[i].InnerXml;
                                if (tc_cbb13[i].InnerXml != "") rs["tc_cbb13"] = tc_cbb13[i].InnerXml;
                                if (tc_cbb13f[i].InnerXml != "") rs["tc_cbb13f"] = tc_cbb13f[i].InnerXml;
                                if (tc_cbb14[i].InnerXml != "") rs["tc_cbb14"] = tc_cbb14[i].InnerXml;
                                if (tc_cbb14f[i].InnerXml != "") rs["tc_cbb14f"] = tc_cbb14f[i].InnerXml;

                                if (tc_cbb19[i].InnerXml != "") rs["tc_cbb19"] = tc_cbb19[i].InnerXml;
                                if (tc_cbb15[i].InnerXml != "") rs["tc_cbb15"] = tc_cbb15[i].InnerXml;

                                if (azf03[i].InnerXml != "") rs["azf03"] = azf03[i].InnerXml;

                                if (tc_cbb16[i].InnerXml != "") rs["tc_cbb16"] = tc_cbb16[i].InnerXml;
                                if (tc_cbb21[i].InnerXml != "") rs["tc_cbb21"] = tc_cbb21[i].InnerXml;
                             
                                if (tc_cbb17[i].InnerXml != "") rs["tc_cbb17"] = tc_cbb17[i].InnerXml;
                                if (tc_cbb171[i].InnerXml != "") rs["tc_cbb171"] = tc_cbb171[i].InnerXml;
                                if (faj26[i].InnerXml != "") rs["faj26"] = faj26[i].InnerXml;
                                
                                rs.Update();
                                rs.Close();

                             
                        }
                        #endregion
                        string sumSql = "";

                     #region  匯總明細資料to CBGI014_SUM
                        hs.Open("  SELECT  tc_cbb06,tc_cbb07,tc_cbb13,convert(int, substring(tc_cbb091,5,2)) math,SUM(tc_cbb10) total " +
                            "   FROM [EIPB].[dbo].[CBGI014_Body]  where  rowid='" + rowid + "'" +
                            "   group by tc_cbb06,tc_cbb07,tc_cbb13,tc_cbb091 ");
                        while (!hs.EOF)
                        {
                            string Ma = "M" + hs["math"].ToString();
                            string sumcount = fs.GetTopfile("select COUNT(*) from  EIPB.dbo.CBGI014_sum "+
                                "   where rowid='" + rowid + "'  and tc_cbb06='" + hs["tc_cbb06"].ToString() +
                                "' and tc_cbb07='" + hs["tc_cbb07"].ToString() + "' and unp='" + hs["tc_cbb13"].ToString() + "'");
                            if (sumcount != "0")
                            {
                                sumSql = "update EIPB.dbo.CBGI014_sum set " + Ma + "='" + hs["total"].ToString() + "' where " +
                                    "rowid='" + rowid + "'  and tc_cbb06='" + hs["tc_cbb06"].ToString() + 
                                    "' and tc_cbb07='" + hs["tc_cbb07"].ToString()+
                                    "' and unp='" + hs["tc_cbb13"].ToString() + "'";
                            }
                            else
                            {


                                sumSql = "insert into EIPB.dbo.CBGI014_sum(rowid,tc_cbb06,tc_cbb07,unp," + Ma + ")values " +
                                    "  ('" + rowid + "','" + hs["tc_cbb06"].ToString() + "','" +
                                    hs["tc_cbb07"].ToString() + "','" + hs["tc_cbb13"].ToString() + "','" + hs["total"].ToString() + "')";
                                //Response.Write(sumSql + "<br>");
                            }

                            fs.RunIUSql(sumSql);

                            hs.MoveNext();
                        }
                     
                    #endregion

 
                      mailprocess(titlesn, plantid[0].InnerXml,sno,ver.ToString());
            
            
                 if (System.IO.File.Exists(s.Replace("Download", "XML")))  //判斷在OUT資料夾裡, 檔案是否存在
                        {
                            File.Delete(s.Replace("Download", "XML"));  //存在的話先刪除該檔案再存入新檔案
                            File.Move(s, s.Replace("Download", "XML"));
                        }
                        else
                        {
                            File.Move(s, s.Replace("Download", "XML"));  //不存在直接存入新檔案
                        }

                        Upload("D:\\CBGI014_XML\\ERP_XML\\" + ftstr + ".xml", "ftp://192.168.0.250/" + ftstr + ".xml", "xmlback", "xmlback");

            
            
            
            }



                        
             

                    //發mail---------------------------------------------------------------------------------------------------------------------------


                        fs.RunIUSql("insert into [EIPB].[dbo].[CBGI014_Base] " +
" select tc_cbb06,tc_bgx02 from  [EIPB].[dbo].[CBGI014_body]  " +
" left join  [EIPB].[dbo].[CBGI014_Base] b on tc_cbb06=b.id " +
"  where tc_cbb06 is not null and b.id is  null  " +
" group by tc_cbb06,tc_bgx02  ");

                        fs.RunIUSql("insert into [EIPB].[dbo].[CBGI014_Base]  " +
                        "select tc_cbb07,tc_bgy02 from  [EIPB].[dbo].[CBGI014_body]  " +
                        "left join  [EIPB].[dbo].[CBGI014_Base] b on tc_cbb07=b.id " +
                        " where tc_cbb07 is not null and b.id is  null      " +
                        "group by tc_cbb07,tc_bgy02  ");
                     
                    
                    
                    
                    //---------------------------------------------------------------------------------------------------------------------------
                 
                   
                }
            //}
            // catch (Exception ex)
            //{
                #region
               


                //herzog remark
               /*  string s1 = s.Replace(".xml", "");
               s1 = s1.Replace("D:\\APMI610_XML\\ERP_Download\\", "");
                int sone = s1.IndexOf("_");
                int stwo = s1.LastIndexOf("_");
                stwo = stwo + 1;
                FileStream fs = new FileStream(@"D:\APMI610_XML\4GL\" + s1 + ".txt", FileMode.Create, FileAccess.Write);
                StreamWriter sw = new StreamWriter(fs);
                sw.WriteLine("\"" + s1.Substring(0, sone) + "\",\"APMI610\",\"" + s1.Substring(stwo, 10) + "\",\"E\",\"\"");
                sw.Close();
                fs.Close();
                Upload(fs.ToString(), "ftp://192.168.0.250/" + s1.ToString() + ".txt", "4gl", "4gl");

 
                //發mail---------------------------------------------------------------------------------------------------------------------------
                String ques;

                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                MailAddress to = new MailAddress("herzog.lin@minaik.com.tw");

                MailAddress bcc = new MailAddress("herzog.lin@minaik.com.tw");

                MailMessage message = new MailMessage(from, to);
                message.Bcc.Add(bcc);

                ques = "有問題";

                message.Subject = "ERP廠商代號有問題";
                message.IsBodyHtml = true;
                message.Body = ques;

                SmtpClient client = new SmtpClient("192.168.0.12");

                client.Send(message);

                Response.Write("ERP廠商代號有問題" + "<br>");

                 */
                #endregion

                //---------------------------------------------------------------------------------------------------------------------------

 
           // }
     
             
        
    }

    private void mailprocess(string title,string plant,string sn,string ver)
    {
        String ques;
        SmoothEnterprise.Database.DataSet es = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        es.Open("select email,name,rowid from eipb.dbo.CBGI014_Head a left join dguser b " +
            " on tc_cbauser=b.erpid  where sn='" + sn + "' and ver='"+ver+"'   and PlantID='" + plant + "'");
       // Response.Write("<br>select email,name,rowid from eipb.dbo.APMI610_IN left join dguser b " +
        //      " on pmcauser=b.erpid  where pmcano='" + sn + "' and PlantID='" + plant + "'<br>");


        if (!es.EOF)
        {
            Response.Write(es["email"].ToString() + "<br>");
            MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
            MailAddress to = new MailAddress(es["email"].ToString());
            //MailAddress to = new MailAddress("herzog.lin@minaik.com.tw");
            MailAddress bcc = new MailAddress("herzog.lin@minaik.com.tw");

            MailMessage message = new MailMessage(from, to);
            message.Bcc.Add(bcc);

            ques = "您好:" + "<br>" +
                   "<br>" +
                   "固定資產預算申請，正等待您的處理:" + "<br>" +
                   "<br>" +
                   "申請單號 : " + sn + "<br>" +
                   "申請日期 : " + DateTime.Now.ToString() + "<br>" +
                   "申請人員 : " + es["name"].ToString() + "<br>" +
                   "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_CBGI014/CBGI014Edit.aspx?rowid=" + es["rowid"].ToString() + "\" >至軟硬體預算申請電子簽核系統檢視並編輯內容</a>" +
                   "<br>" +
                   "<br>" +
                   "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                   "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                   "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

            message.Subject = "軟硬體預算申請 - " + sn + " 等待您的處理";
            message.IsBodyHtml = true;
            message.Body = ques;

            SmtpClient client = new SmtpClient("192.168.0.12");

            client.Send(message);

            Response.Write("Mail傳送完畢" + "<br>");


            // }
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


    protected void Button1_Click(object sender, EventArgs e)
    {
       // mailprocess("201-1570002", "MATE02");
    }
}