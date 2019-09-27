using System;
using System.Collections;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Xml;

public partial class APMT420_IN : SmoothEnterprise.Web.Page 
{
    string pnumber = string.Empty; //程式代號
    string OK_NO = string.Empty; //單號
    
    protected void Page_Load(object sender, EventArgs e)
    {
        /*   ================= 抓 ERP 資料進 EIP =================  */
        // FileRoute 設定..暫存的目錄位置
        string InitDirectory = @"D:\AXMT610_XML\ERP_Download\";

        // 先抓 FTP  的資料
        ArrayList FtpList = List("ftp://192.168.0.250/" , "xmluser", "(XmlUser)");

        foreach (string s in FtpList)
        {
            //Response.Write("AAA");
            Response.Write(s.ToString());
            //找到 自己要的檔名!
            if ((s.IndexOf("ovaxmt610") != -1) || (s.IndexOf("ovaxmt810") != -1) || (s.IndexOf("ovaxmt620") != -1) || (s.IndexOf("ovaxmt820") != -1) || (s.IndexOf("ovaxmt650") != -1) || (s.IndexOf("ovaxmt821") != -1))
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
        

        ArrayList MyFiles = new ArrayList();

        DirectoryInfo di = new DirectoryInfo(InitDirectory);

        // 呼叫上面的函式 Get Files
        GetFiles(di, searchPattern, ref MyFiles);

        //Print it

        foreach (string s in MyFiles)
        {
            try
            {
                if ((s.IndexOf("ovaxmt610") != -1) || (s.IndexOf("ovaxmt810") != -1) || (s.IndexOf("ovaxmt620") != -1) || (s.IndexOf("ovaxmt820") != -1) || (s.IndexOf("ovaxmt650") != -1) || (s.IndexOf("ovaxmt821") != -1))
                {
                    Response.Write(s + "<br>");


                    Response.Write("---------" + s.IndexOf("_") + "<br>");
                    System.Diagnostics.Debug.Write(s);
                    //this.textBox3.AppendText(s + "\n");
                    Response.Write(s + "\n");
                    XmlDocument xDoc = new XmlDocument();
                    xDoc.Load((s));
                    XmlNodeList PlantID = xDoc.GetElementsByTagName("PlantID");
                    XmlNodeList CompanyName = xDoc.GetElementsByTagName("CompanyName");
                    XmlNodeList ProgramID = xDoc.GetElementsByTagName("ProgramID");
                    XmlNodeList oga00 = xDoc.GetElementsByTagName("oga00");
                    XmlNodeList oga01 = xDoc.GetElementsByTagName("oga01");
                    XmlNodeList oga02 = xDoc.GetElementsByTagName("oga02");
                    XmlNodeList oga011 = xDoc.GetElementsByTagName("oga011");
                    XmlNodeList oga16 = xDoc.GetElementsByTagName("oga16");
                    XmlNodeList oga03 = xDoc.GetElementsByTagName("oga03");
                    XmlNodeList occ02_0 = xDoc.GetElementsByTagName("occ02-0");
                    XmlNodeList oga04 = xDoc.GetElementsByTagName("oga04");
                    XmlNodeList occ02_1 = xDoc.GetElementsByTagName("occ02-1");
                    XmlNodeList addr = xDoc.GetElementsByTagName("addr");
                    XmlNodeList oga18 = xDoc.GetElementsByTagName("oga18");
                    XmlNodeList occ02_2 = xDoc.GetElementsByTagName("occ02-2");
                    XmlNodeList oga15 = xDoc.GetElementsByTagName("oga15");
                    XmlNodeList gem02_3 = xDoc.GetElementsByTagName("gem02-3");
                    XmlNodeList oga14 = xDoc.GetElementsByTagName("oga14");
                    XmlNodeList gen02_4 = xDoc.GetElementsByTagName("gen02-4");
                    XmlNodeList oga902 = xDoc.GetElementsByTagName("oga902");
                    XmlNodeList oga21 = xDoc.GetElementsByTagName("oga21");
                    XmlNodeList oga211 = xDoc.GetElementsByTagName("oga211");
                    XmlNodeList oga23 = xDoc.GetElementsByTagName("oga23");
                    XmlNodeList oga24 = xDoc.GetElementsByTagName("oga24");
                    XmlNodeList oga50 = xDoc.GetElementsByTagName("oga50");
                    XmlNodeList oga55 = xDoc.GetElementsByTagName("oga55");
                    XmlNodeList l_gen01 = xDoc.GetElementsByTagName("l_gen01");
                    XmlNodeList oga27 = xDoc.GetElementsByTagName("oga27");
                    XmlNodeList ogauser = xDoc.GetElementsByTagName("ogauser");
                    XmlNodeList l_azp03 = xDoc.GetElementsByTagName("l_azp03");
                    XmlNodeList Curr = xDoc.GetElementsByTagName("Curr");
                    XmlNodeList tot = xDoc.GetElementsByTagName("tot");
                    XmlNodeList bal = xDoc.GetElementsByTagName("bal");
                    XmlNodeList l_amt01 = xDoc.GetElementsByTagName("l_amt01");
                    XmlNodeList l_amt02 = xDoc.GetElementsByTagName("l_amt02");
                    XmlNodeList l_amt03 = xDoc.GetElementsByTagName("l_amt03");

                    pnumber = PlantID[0].InnerXml;
                    //Response.Write(pnumber+"ooooooooo");
                    SmoothEnterprise.Database.DataSet hs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    Response.Write("select * from axmt610_in_head  where oga01 = '" + oga01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' ");
                    hs.Open("select * from axmt610_in_head  where oga01 = '" + oga01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' ");//檢查單頭是否有重覆單據號碼
                    if (!hs.EOF)
                    {
                        if (hs["status"].ToString() == "退回" || oga55[0].InnerXml == "9:作廢")
                        {
                            OK_NO = hs["no"].ToString();
                            #region 若有相同單號, 已被退回, 單頭UPDATE,單身刪除後新增
                            ////刪除
                            //SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet();
                            //rsa.ExecuteNonQuery("delete  apmt420_in_head where pmk01 = '" + pmk01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "'");
                            SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet();
                            rsb.ExecuteNonQuery("delete  axmt610_in_body where  bno='" + hs["no"].ToString() + "' and oga01 = '" + oga01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "'");
                            ////

                            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs.Open("SELECT * FROM axmt610_IN_HEAD  where no='" + hs["no"].ToString() + "' and oga01 = '" + oga01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' ");
                            if (!rs.EOF)
                            {

                                if (PlantID[0].InnerXml != "") rs["PlantID"] = PlantID[0].InnerXml;
                                if (CompanyName[0].InnerXml != "") rs["CompanyName"] = CompanyName[0].InnerXml;
                                if (ProgramID[0].InnerXml != "") rs["ProgramID"] = ProgramID[0].InnerXml;
                                if (oga00[0].InnerXml != "") rs["oga00"] = oga00[0].InnerXml;
                                if (oga01[0].InnerXml != "") rs["oga01"] = oga01[0].InnerXml;
                                if (oga02[0].InnerXml != "") rs["oga02"] = oga02[0].InnerXml;
                                if (oga011[0].InnerXml != "") rs["oga011"] = oga011[0].InnerXml;
                                if (oga16[0].InnerXml != "") rs["oga16"] = oga16[0].InnerXml;
                                if (oga03[0].InnerXml != "") rs["oga03"] = oga03[0].InnerXml;
                                if (occ02_0[0].InnerXml != "") rs["occ02_0"] = occ02_0[0].InnerXml;
                                if (oga04[0].InnerXml != "") rs["oga04"] = oga04[0].InnerXml;
                                if (occ02_1[0].InnerXml != "") rs["occ02_1"] = occ02_1[0].InnerXml;
                                if (addr[0].InnerXml != "") rs["addr"] = addr[0].InnerXml;
                                if (oga18[0].InnerXml != "") rs["oga18"] = oga18[0].InnerXml;
                                if (occ02_2[0].InnerXml != "") rs["occ02_2"] = occ02_2[0].InnerXml;
                                if (oga15[0].InnerXml != "") rs["oga15"] = oga15[0].InnerXml;
                                if (gem02_3[0].InnerXml != "") rs["gem02_3"] = gem02_3[0].InnerXml;
                                if (oga14[0].InnerXml != "") rs["oga14"] = oga14[0].InnerXml;
                                if (gen02_4[0].InnerXml != "") rs["gen02_4"] = gen02_4[0].InnerXml;
                                if (oga902[0].InnerXml != "") rs["oga902"] = oga902[0].InnerXml;
                                if (gen02_4[0].InnerXml != "") rs["gen02_4"] = gen02_4[0].InnerXml;
                                if (oga21[0].InnerXml != "") rs["oga21"] = oga21[0].InnerXml;
                                if (oga211[0].InnerXml != "") rs["oga211"] = oga211[0].InnerXml;
                                if (oga23[0].InnerXml != "") rs["oga23"] = oga23[0].InnerXml;
                                if (oga24[0].InnerXml != "") rs["oga24"] = oga24[0].InnerXml;
                                if (oga50[0].InnerXml != "") rs["oga50"] = oga50[0].InnerXml;
                                if (oga55[0].InnerXml != "") rs["oga55"] = oga55[0].InnerXml;
                                if (l_gen01[0].InnerXml != "") rs["l_gen01"] = l_gen01[0].InnerXml;
                                if (oga27[0].InnerXml != "") rs["oga27"] = oga27[0].InnerXml;
                                if (ogauser[0].InnerXml != "") rs["ogauser"] = ogauser[0].InnerXml;
                                if (l_azp03[0].InnerXml != "") rs["l_azp03"] = l_azp03[0].InnerXml;
                                if (Curr[0].InnerXml != "") rs["Curr"] = Curr[0].InnerXml;
                                if (tot[0].InnerXml != "") rs["tot"] = tot[0].InnerXml;
                                if (bal[0].InnerXml != "") rs["bal"] = bal[0].InnerXml;
                                if (l_amt01[0].InnerXml != "") rs["l_amt01"] = l_amt01[0].InnerXml;
                                if (l_amt02[0].InnerXml != "") rs["l_amt02"] = l_amt02[0].InnerXml;
                                if (l_amt03[0].InnerXml != "") rs["l_amt03"] = l_amt03[0].InnerXml;

                                //如果ERP傳來狀況為作廢, 則EIP STATUS UPDATE V
                                if (oga55[0].InnerXml == "9:作廢")
                                {
                                    rs["status"] = "V";
                                }



                                rs.Update();
                                rs.Close();

                            }

                            //SmoothEnterprise.Database.DataSet aa = new SmoothEnterprise.Database.DataSet();
                            //object objola = aa.ExecuteScalar("SELECT no FROM axmt610_in_head where oga01 = '" + oga01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' ");
                            //string no = objola.ToString();


                            int cmicNodes = xDoc.GetElementsByTagName("record").Count;
                            Response.Write("record共" + cmicNodes);
                            for (int i = 0; i <= (cmicNodes - 1); i++)
                            {
                                //XmlNodeList oga01 = xDoc.GetElementsByTagName("oga01");

                                XmlNodeList ogb03 = xDoc.GetElementsByTagName("ogb03");
                                XmlNodeList ogb31 = xDoc.GetElementsByTagName("ogb31");
                                XmlNodeList ogb04 = xDoc.GetElementsByTagName("ogb04");
                                XmlNodeList ogb32 = xDoc.GetElementsByTagName("ogb32");
                                XmlNodeList ogb06 = xDoc.GetElementsByTagName("ogb06");
                                XmlNodeList ima021 = xDoc.GetElementsByTagName("ima021");
                                XmlNodeList ogb05 = xDoc.GetElementsByTagName("ogb05");
                                XmlNodeList ogb12 = xDoc.GetElementsByTagName("ogb12");
                                XmlNodeList ogb17 = xDoc.GetElementsByTagName("ogb17");
                                XmlNodeList ogb09 = xDoc.GetElementsByTagName("ogb09");
                                XmlNodeList ogb092 = xDoc.GetElementsByTagName("ogb092");
                                XmlNodeList ogb908 = xDoc.GetElementsByTagName("ogb908");
                                //XmlNodeList oeb15 = xDoc.GetElementsByTagName("oeb15");



                                //Response.Write(i);
                                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                rs2.Open("SELECT * FROM axmt610_IN_BODY WHERE 1=0");
                                rs2.Add();

                                if (PlantID[0].InnerXml != "") rs2["PlantID"] = PlantID[0].InnerXml;
                                if (oga01[0].InnerXml != "") rs2["oga01"] = oga01[0].InnerXml;
                                if (ogb03[0].InnerXml != "") rs2["ogb03"] = ogb03[0].InnerXml;
                                if (ogb31[0].InnerXml != "") rs2["ogb31"] = ogb31[0].InnerXml;
                                if (ogb32[0].InnerXml != "") rs2["ogb32"] = ogb32[0].InnerXml;
                                if (ogb04[0].InnerXml != "") rs2["ogb04"] = ogb04[0].InnerXml;
                                if (ogb06[0].InnerXml != "") rs2["ogb06"] = ogb06[0].InnerXml;
                                if (ima021[0].InnerXml != "") rs2["ima021"] = ima021[0].InnerXml;
                                if (ogb05[0].InnerXml != "") rs2["ogb05"] = ogb05[0].InnerXml;
                                if (ogb12[0].InnerXml != "") rs2["ogb12"] = ogb12[0].InnerXml;
                                if (ogb17[0].InnerXml != "") rs2["ogb17"] = ogb17[0].InnerXml;
                                if (ogb09[0].InnerXml != "") rs2["ogb09"] = ogb09[0].InnerXml;
                                if (ogb092[0].InnerXml != "") rs2["ogb092"] = ogb092[0].InnerXml;
                                if (ogb908[0].InnerXml != "") rs2["ogb908"] = ogb908[0].InnerXml;
                                //if (oeb15[0].InnerXml != "") rs2["oeb15"] = oeb15[0].InnerXml;

                                rs2["bno"] = hs["no"].ToString();
                                rs2.Update();
                                rs2.Close();
                            }
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
                            //if (ogaconf[0].InnerXml != "X:作廢") 作廢的話不新增, update後即可
                            #region 單號相同,未被退回過,將資料全數新增,版次加1
                            //EIP單號-----------------------------------------
                            SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                            string now = DateTime.UtcNow.AddHours(6).ToString("yyyyMM");
                            object objola = onum.ExecuteScalar("SELECT ISNULL(MAX(substring(NO,8,11)),'00000')+1 FROM axmt610_in_head WHERE NO LIKE 'B" + now + "%' and PlantID='" + PlantID[0].InnerXml + "' ");
                            string maxnum = objola.ToString();
                            Int64 sidnum;
                            sidnum = Convert.ToInt64(maxnum);
                            OK_NO = "B" + now + sidnum.ToString("0000");
                            //-------------------------------------------------
                            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs.Open("SELECT * FROM axmt610_IN_HEAD WHERE 1=0");
                            rs.Add();

                            if (PlantID[0].InnerXml != "") rs["PlantID"] = PlantID[0].InnerXml;
                            if (CompanyName[0].InnerXml != "") rs["CompanyName"] = CompanyName[0].InnerXml;
                            if (ProgramID[0].InnerXml != "") rs["ProgramID"] = ProgramID[0].InnerXml;
                            if (oga00[0].InnerXml != "") rs["oga00"] = oga00[0].InnerXml;
                            if (oga01[0].InnerXml != "") rs["oga01"] = oga01[0].InnerXml;
                            if (oga02[0].InnerXml != "") rs["oga02"] = oga02[0].InnerXml;
                            if (oga011[0].InnerXml != "") rs["oga011"] = oga011[0].InnerXml;
                            if (oga16[0].InnerXml != "") rs["oga16"] = oga16[0].InnerXml;
                            if (oga03[0].InnerXml != "") rs["oga03"] = oga03[0].InnerXml;
                            if (occ02_0[0].InnerXml != "") rs["occ02_0"] = occ02_0[0].InnerXml;
                            if (oga04[0].InnerXml != "") rs["oga04"] = oga04[0].InnerXml;
                            if (occ02_1[0].InnerXml != "") rs["occ02_1"] = occ02_1[0].InnerXml;
                            if (addr[0].InnerXml != "") rs["addr"] = addr[0].InnerXml;
                            if (oga18[0].InnerXml != "") rs["oga18"] = oga18[0].InnerXml;
                            if (occ02_2[0].InnerXml != "") rs["occ02_2"] = occ02_2[0].InnerXml;
                            if (oga15[0].InnerXml != "") rs["oga15"] = oga15[0].InnerXml;
                            if (gem02_3[0].InnerXml != "") rs["gem02_3"] = gem02_3[0].InnerXml;
                            if (oga14[0].InnerXml != "") rs["oga14"] = oga14[0].InnerXml;
                            if (gen02_4[0].InnerXml != "") rs["gen02_4"] = gen02_4[0].InnerXml;
                            if (oga902[0].InnerXml != "") rs["oga902"] = oga902[0].InnerXml;
                            if (gen02_4[0].InnerXml != "") rs["gen02_4"] = gen02_4[0].InnerXml;
                            if (oga21[0].InnerXml != "") rs["oga21"] = oga21[0].InnerXml;
                            if (oga211[0].InnerXml != "") rs["oga211"] = oga211[0].InnerXml;
                            if (oga23[0].InnerXml != "") rs["oga23"] = oga23[0].InnerXml;
                            if (oga24[0].InnerXml != "") rs["oga24"] = oga24[0].InnerXml;
                            if (oga50[0].InnerXml != "") rs["oga50"] = oga50[0].InnerXml;
                            if (oga55[0].InnerXml != "") rs["oga55"] = oga55[0].InnerXml;
                            if (l_gen01[0].InnerXml != "") rs["l_gen01"] = l_gen01[0].InnerXml;
                            if (oga27[0].InnerXml != "") rs["oga27"] = oga27[0].InnerXml;
                            if (ogauser[0].InnerXml != "") rs["ogauser"] = ogauser[0].InnerXml;
                            if (l_azp03[0].InnerXml != "") rs["l_azp03"] = l_azp03[0].InnerXml;
                            if (Curr[0].InnerXml != "") rs["Curr"] = Curr[0].InnerXml;
                            if (tot[0].InnerXml != "") rs["tot"] = tot[0].InnerXml;
                            if (bal[0].InnerXml != "") rs["bal"] = bal[0].InnerXml;
                            if (l_amt01[0].InnerXml != "") rs["l_amt01"] = l_amt01[0].InnerXml;
                            if (l_amt02[0].InnerXml != "") rs["l_amt02"] = l_amt02[0].InnerXml;
                            if (l_amt03[0].InnerXml != "") rs["l_amt03"] = l_amt03[0].InnerXml;
                            rs["status"] = "N";
                            rs["no"] = OK_NO;
                            SmoothEnterprise.Database.DataSet ab = new SmoothEnterprise.Database.DataSet();
                            object objolab = ab.ExecuteScalar("SELECT max(no_order) no_order FROM axmt610_in_head where oga01 = '" + oga01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' ");
                            string ano_oroder = objolab.ToString();
                            rs["no_order"] = int.Parse(ano_oroder.ToString()) + 1;

                            rs.Update();
                            rs.Close();





                            int cmicNodes = xDoc.GetElementsByTagName("record").Count;
                            Response.Write("record共" + cmicNodes);
                            for (int i = 0; i <= (cmicNodes - 1); i++)
                            {
                                //XmlNodeList oga01 = xDoc.GetElementsByTagName("oga01");
                                XmlNodeList ogb03 = xDoc.GetElementsByTagName("ogb03");
                                XmlNodeList ogb31 = xDoc.GetElementsByTagName("ogb31");
                                XmlNodeList ogb32 = xDoc.GetElementsByTagName("ogb32");
                                XmlNodeList ogb04 = xDoc.GetElementsByTagName("ogb04");
                                XmlNodeList ogb06 = xDoc.GetElementsByTagName("ogb06");
                                XmlNodeList ima021 = xDoc.GetElementsByTagName("ima021");

                                XmlNodeList ogb05 = xDoc.GetElementsByTagName("ogb05");
                                XmlNodeList ogb12 = xDoc.GetElementsByTagName("ogb12");
                                XmlNodeList ogb17 = xDoc.GetElementsByTagName("ogb17");
                                XmlNodeList ogb09 = xDoc.GetElementsByTagName("ogb09");
                                XmlNodeList ogb092 = xDoc.GetElementsByTagName("ogb092");
                                XmlNodeList ogb908 = xDoc.GetElementsByTagName("ogb908");
                                //XmlNodeList oeb15 = xDoc.GetElementsByTagName("oeb15");


                                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                rs2.Open("SELECT * FROM axmt610_IN_BODY WHERE 1=0");
                                rs2.Add();
                                if (PlantID[0].InnerXml != "") rs2["PlantID"] = PlantID[0].InnerXml;
                                if (oga01[0].InnerXml != "") rs2["oga01"] = oga01[0].InnerXml;
                                if (ogb03[0].InnerXml != "") rs2["ogb03"] = ogb03[0].InnerXml;
                                if (ogb31[0].InnerXml != "") rs2["ogb31"] = ogb31[0].InnerXml;
                                if (ogb32[0].InnerXml != "") rs2["ogb32"] = ogb32[0].InnerXml;
                                if (ogb04[0].InnerXml != "") rs2["ogb04"] = ogb04[0].InnerXml;
                                if (ogb06[0].InnerXml != "") rs2["ogb06"] = ogb06[0].InnerXml;
                                if (ima021[0].InnerXml != "") rs2["ima021"] = ima021[0].InnerXml;
                                if (ogb05[0].InnerXml != "") rs2["ogb05"] = ogb05[0].InnerXml;
                                if (ogb12[0].InnerXml != "") rs2["ogb12"] = ogb12[0].InnerXml;
                                if (ogb17[0].InnerXml != "") rs2["ogb17"] = ogb17[0].InnerXml;
                                if (ogb09[0].InnerXml != "") rs2["ogb09"] = ogb09[0].InnerXml;
                                if (ogb092[0].InnerXml != "") rs2["ogb092"] = ogb092[0].InnerXml;
                                if (ogb908[0].InnerXml != "") rs2["ogb908"] = ogb908[0].InnerXml;
                                //if (oeb15[0].InnerXml != "") rs2["oeb15"] = oeb15[0].InnerXml;
                                rs2["bno"] = OK_NO;
                                rs2.Update();
                                rs2.Close();
                            }

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
                    }
                    else
                    {
                        Response.Write("<br>單號不相同,將資料全數新增<br>");
                        #region 單號不相同,將資料全數新增
                        ////EIP單號-----------------------------------------
                        SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                        string now = DateTime.UtcNow.AddHours(6).ToString("yyyyMM");
                        object objola = onum.ExecuteScalar("SELECT ISNULL(MAX(substring(NO,8,11)),'00000')+1 FROM axmt610_in_head WHERE NO LIKE 'B" + now + "%' and PlantID='" + PlantID[0].InnerXml + "' ");
                        string maxnum = objola.ToString();
                        Int64 sidnum;
                        sidnum = Convert.ToInt64(maxnum);
                        OK_NO = "B" + now + sidnum.ToString("0000");
                        //-------------------------------------------------
                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("SELECT * FROM axmt610_IN_HEAD WHERE 1=0");
                        rs.Add();

                        if (PlantID[0].InnerXml != "") rs["PlantID"] = PlantID[0].InnerXml;
                        if (CompanyName[0].InnerXml != "") rs["CompanyName"] = CompanyName[0].InnerXml;
                        if (ProgramID[0].InnerXml != "") rs["ProgramID"] = ProgramID[0].InnerXml;
                        if (oga00[0].InnerXml != "") rs["oga00"] = oga00[0].InnerXml;
                        if (oga01[0].InnerXml != "") rs["oga01"] = oga01[0].InnerXml;
                        if (oga02[0].InnerXml != "") rs["oga02"] = oga02[0].InnerXml;
                        if (oga011[0].InnerXml != "") rs["oga011"] = oga011[0].InnerXml;
                        if (oga16[0].InnerXml != "") rs["oga16"] = oga16[0].InnerXml;
                        if (oga03[0].InnerXml != "") rs["oga03"] = oga03[0].InnerXml;
                        if (occ02_0[0].InnerXml != "") rs["occ02_0"] = occ02_0[0].InnerXml;
                        if (oga04[0].InnerXml != "") rs["oga04"] = oga04[0].InnerXml;
                        if (occ02_1[0].InnerXml != "") rs["occ02_1"] = occ02_1[0].InnerXml;
                        if (addr[0].InnerXml != "") rs["addr"] = addr[0].InnerXml;
                        if (oga18[0].InnerXml != "") rs["oga18"] = oga18[0].InnerXml;
                        if (occ02_2[0].InnerXml != "") rs["occ02_2"] = occ02_2[0].InnerXml;
                        if (oga15[0].InnerXml != "") rs["oga15"] = oga15[0].InnerXml;
                        if (gem02_3[0].InnerXml != "") rs["gem02_3"] = gem02_3[0].InnerXml;
                        if (oga14[0].InnerXml != "") rs["oga14"] = oga14[0].InnerXml;
                        if (gen02_4[0].InnerXml != "") rs["gen02_4"] = gen02_4[0].InnerXml;
                        if (oga902[0].InnerXml != "") rs["oga902"] = oga902[0].InnerXml;
                        if (gen02_4[0].InnerXml != "") rs["gen02_4"] = gen02_4[0].InnerXml;
                        if (oga21[0].InnerXml != "") rs["oga21"] = oga21[0].InnerXml;
                        if (oga211[0].InnerXml != "") rs["oga211"] = oga211[0].InnerXml;
                        if (oga23[0].InnerXml != "") rs["oga23"] = oga23[0].InnerXml;
                        if (oga24[0].InnerXml != "") rs["oga24"] = oga24[0].InnerXml;
                        if (oga50[0].InnerXml != "") rs["oga50"] = oga50[0].InnerXml;
                        if (oga55[0].InnerXml != "") rs["oga55"] = oga55[0].InnerXml;
                        if (l_gen01[0].InnerXml != "") rs["l_gen01"] = l_gen01[0].InnerXml;
                        if (oga27[0].InnerXml != "") rs["oga27"] = oga27[0].InnerXml;
                        if (ogauser[0].InnerXml != "") rs["ogauser"] = ogauser[0].InnerXml;
                        if (l_azp03[0].InnerXml != "") rs["l_azp03"] = l_azp03[0].InnerXml;
                        if (Curr[0].InnerXml != "") rs["Curr"] = Curr[0].InnerXml;
                        if (tot[0].InnerXml != "") rs["tot"] = tot[0].InnerXml;
                        if (bal[0].InnerXml != "") rs["bal"] = bal[0].InnerXml;
                        if (l_amt01[0].InnerXml != "") rs["l_amt01"] = l_amt01[0].InnerXml;
                        if (l_amt02[0].InnerXml != "") rs["l_amt02"] = l_amt02[0].InnerXml;
                        if (l_amt03[0].InnerXml != "") rs["l_amt03"] = l_amt03[0].InnerXml;
                        rs["status"] = "N";
                        rs["no"] = OK_NO;
                        rs["no_order"] = "1";

                        rs.Update();
                        rs.Close();





                        int cmicNodes = xDoc.GetElementsByTagName("record").Count;
                        Response.Write("record共" + cmicNodes);
                        for (int i = 0; i <= (cmicNodes - 1); i++)
                        {
                            //XmlNodeList oga01 = xDoc.GetElementsByTagName("oga01");
                            XmlNodeList ogb03 = xDoc.GetElementsByTagName("ogb03");
                            XmlNodeList ogb31 = xDoc.GetElementsByTagName("ogb31");
                            XmlNodeList ogb32 = xDoc.GetElementsByTagName("ogb32");
                            XmlNodeList ogb04 = xDoc.GetElementsByTagName("ogb04");
                            XmlNodeList ogb06 = xDoc.GetElementsByTagName("ogb06");
                            XmlNodeList ima021 = xDoc.GetElementsByTagName("ima021");

                            XmlNodeList ogb05 = xDoc.GetElementsByTagName("ogb05");
                            XmlNodeList ogb12 = xDoc.GetElementsByTagName("ogb12");
                            XmlNodeList ogb17 = xDoc.GetElementsByTagName("ogb17");
                            XmlNodeList ogb09 = xDoc.GetElementsByTagName("ogb09");
                            XmlNodeList ogb092 = xDoc.GetElementsByTagName("ogb092");
                            XmlNodeList ogb908 = xDoc.GetElementsByTagName("ogb908");
                            //XmlNodeList oeb15 = xDoc.GetElementsByTagName("oeb15");


                            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs2.Open("SELECT * FROM axmt610_IN_BODY WHERE 1=0");
                            rs2.Add();
                            if (PlantID[0].InnerXml != "") rs2["PlantID"] = PlantID[0].InnerXml;
                            if (oga01[0].InnerXml != "") rs2["oga01"] = oga01[0].InnerXml;
                            if (ogb03[0].InnerXml != "") rs2["ogb03"] = ogb03[0].InnerXml;
                            if (ogb31[0].InnerXml != "") rs2["ogb31"] = ogb31[0].InnerXml;
                            if (ogb32[0].InnerXml != "") rs2["ogb32"] = ogb32[0].InnerXml;
                            if (ogb04[0].InnerXml != "") rs2["ogb04"] = ogb04[0].InnerXml;
                            if (ogb06[0].InnerXml != "") rs2["ogb06"] = ogb06[0].InnerXml;
                            if (ima021[0].InnerXml != "") rs2["ima021"] = ima021[0].InnerXml;
                            if (ogb05[0].InnerXml != "") rs2["ogb05"] = ogb05[0].InnerXml;
                            if (ogb12[0].InnerXml != "") rs2["ogb12"] = ogb12[0].InnerXml;
                            if (ogb17[0].InnerXml != "") rs2["ogb17"] = ogb17[0].InnerXml;
                            if (ogb09[0].InnerXml != "") rs2["ogb09"] = ogb09[0].InnerXml;
                            if (ogb092[0].InnerXml != "") rs2["ogb092"] = ogb092[0].InnerXml;
                            if (ogb908[0].InnerXml != "") rs2["ogb908"] = ogb908[0].InnerXml;
                            //if (oeb15[0].InnerXml != "") rs2["oeb15"] = oeb15[0].InnerXml;
                            rs2["bno"] = OK_NO;
                            rs2.Update();
                            rs2.Close();
                        }

                        File.Move(s, s.Replace("Download", "XML"));
                        //Response.Write(s + "---" + s.Replace("IN", "OUT") + "<br>");
                        //File.Delete(s); 

                        #endregion
                    }
                    //發mail---------------------------------------------------------------------------------------------------------------------------
                    if (oga55[0].InnerXml != "9:作廢")
                    {
                        Response.Write("select b.email email1,a.id,ogauser,c.email email2  from axmt610_in_head  a LEFT JOIN dguser b ON oga14=b.erpid left join dguser c on ogauser=c.erpid " +
                                "where oga01 = '" + oga01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' and no='" + OK_NO.ToString() + "' ");

                        String ques;
                        SmoothEnterprise.Database.DataSet es = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        es.Open("select b.email email1,a.id,ogauser,c.email email2  from axmt610_in_head  a LEFT JOIN dguser b ON oga14=b.erpid left join dguser c on ogauser=c.erpid " +
                                "where oga01 = '" + oga01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' and no='" + OK_NO.ToString() + "' ");

                        if (!es.EOF)
                        {
                            MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");

                            MailAddress to = new MailAddress(es["email1"].ToString());

                            MailAddress bcc = new MailAddress("carol.yeh@minaik.com.tw");
                           

                            MailMessage message = new MailMessage(from, to);
                            message.Bcc.Add(bcc);
                            

                            if (es["email1"].ToString() != es["email2"].ToString())
                            {
                                message.To.Add(es["email2"].ToString());
                            }
                            ques = "您好:" + "<br>" +
                                   "<br>" +
                                   "ERP信用放行電子簽核申請單現有一筆，正等待您的處理:" + "<br>" +
                                   "<br>" +
                                   "申請單號 : " + oga01[0].InnerXml + "<br>" +
                                   "申請日期 : " + oga02[0].InnerXml + "<br>" +
                                   "業務人員 : " + gen02_4[0].InnerXml + "<br>" +
                                   "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_AXMT610/AXMT610Edit.aspx?id=" + es["id"].ToString() + "\" >至ERP信用放行單號系統進行維護</a>" +
                                   "<br>" +
                                   "<br>" +
                                   "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                   "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                   "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                            message.Subject = "信用放行單號 - " + oga01[0].InnerXml + " 客戶-" + occ02_1[0].InnerXml + " 等待您的處理";
                            message.IsBodyHtml = true;
                            message.Body = ques;

                            SmtpClient client = new SmtpClient("192.168.0.12");

                            client.Send(message);

                            Response.Write("Mail傳送完畢" + "<br>");

                            //attch.MoveNext();
                            //Upload("D:\\AXMT610_XML\\ERP_XML\\" + pnumber.ToString() + "_oaxmt610_" + oga01[0].InnerXml + ".xml", "ftp://192.168.0.250/" + pnumber.ToString() + "_oaxmt610_" + oga01[0].InnerXml + ".xml", "xmlback", "xmlback");
                            Upload("D:\\AXMT610_XML\\ERP_XML\\" + PlantID[0].InnerXml + "_ovaxmt610_" + oga01[0].InnerXml + ".xml", "ftp://192.168.0.250/" + PlantID[0].InnerXml + "_ovaxmt610_" + oga01[0].InnerXml + ".xml", "xmlback", "xmlback");
                           



                        }

                    }
                    //---------------------------------------------------------------------------------------------------------------------------
                }
            }
            catch (Exception ex)
            {
                string s1 = s.Replace(".xml", "");
                s1 = s1.Replace("D:\\AXMT610_XML\\ERP_Download\\", "");
                int sone = s1.IndexOf("_");
                int stwo = s1.LastIndexOf("_");
                stwo = stwo + 1;
                FileStream fs = new FileStream(@"D:\AXMT610_XML\4GL\" + s1 + ".txt", FileMode.Create, FileAccess.Write);
                StreamWriter sw = new StreamWriter(fs);
                sw.WriteLine("\"" + s1.Substring(0, sone) + "\",\"" + pnumber + "\",\"" + s1.Substring(stwo, 10) + "\",\"E\"");
                sw.Close();
                fs.Close();
                Upload(fs.ToString(), "ftp://192.168.0.250/" + s1.ToString() + ".txt", "4gl", "4gl"); 
                //發mail---------------------------------------------------------------------------------------------------------------------------
         

                string  Subject = "ERP信用放行有問題";
                string Body = string.Format("{0}<br>{1}<br>{0}<br>", ex.Message.ToString(),ex.TargetSite.ToString(),Request.Url );
                Utility.MailFromEIP("carol.yeh@minaik.com.tw",Subject,Body,false ); 
                //attch.MoveNext();
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