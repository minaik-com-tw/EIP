using System;
using System.Collections;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Xml;

/* Mark       Date         Author             Reason                           
* ---------------------------------------------------------------------------------------------------
* 
* V1.0.1  2018/12/19   Carol          Modify  
* 因erp新增君洋…工號改Q開頭，以免與其他廠重覆……故新增對照表
*/
public partial class APMI610_IN : SmoothEnterprise.Web.Page
{
    string plant = "", ERP_No = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string filename = "";
        try
        {

            //string path = @"D:\xml";
            //string back = @"D:\xml_back";
            string path = @"\\192.168.0.250\xml";
            string back = @"\\192.168.0.250\xml_back";

            string[] tempFile = Directory.GetFiles(path, "*.xml");//取得資料夾下所有檔案

            foreach (string item in tempFile)
            {
                FileInfo info = new FileInfo(item);
                filename = info.Name.ToString();

                if (info.Name.ToUpper().Contains("APMI610"))
                {

                    setXML(info.FullName);
                    copyToBack(info.FullName);
                    mailprocess(plant, ERP_No);
                }

            }
        }
        catch (Exception ex)
        {
            //Utility.SendMail(Utility.MIS_Mail, "eip@minaik.com.tw", "APMI610_IN.aspx Error", "ex.Message:\r\n" + ex.Message.ToString() + "\r\n StackTrace:\r\n" + ex.StackTrace);
            Utility.log(ex.Message, ex.StackTrace);
        }


        //-----------------------------------------------------------------
        //20180730 改由網芳擷取ERP檔案 by carol.yeh
        //-----------------------------------------------------------------
        //// mailprocess("201-1550001", "MATE02");

        ///*   ================= 抓 ERP 資料進 EIP =================  */
        //// FileRoute 設定..暫存的目錄位置
        //string InitDirectory = @"D:\APMI610_XML\ERP_Download\";

        //// 先抓 FTP  的資料
        //ArrayList FtpList = List("ftp://192.168.0.250/", "xmluser", "(XmlUser)");

        //foreach (string s in FtpList)
        //{


        //    //找到 自己要的檔名!
        //    if (s.ToUpper().IndexOf("APMI610") != -1)
        //    {

        //        //將目前FTP的XML抓下來
        //        Download("ftp://192.168.0.250/" + s, InitDirectory, "xmluser", "(XmlUser)");
        //        DeleteFileOnServer("ftp://192.168.0.250/" + s, "xmluser", "(XmlUser)");
        //    }

        //}

        ////-------------------------------------------------------------
        //string searchPattern = "*";
        ////可以指定目錄 或
        ////string InitDirectory = @"C:\";
        //// 取得目前工作目錄
        ////string InitDirectory = @"D:\XML"; //原始目錄

        //ArrayList MyFiles = new ArrayList();

        //DirectoryInfo di = new DirectoryInfo(InitDirectory);

        //// 呼叫上面的函式 Get Files
        //GetFiles(di, searchPattern, ref MyFiles);

        ////Print it

        //foreach (string s in MyFiles)
        //{

        //    string fname = Path.GetFileName(s);
        //    Response.Write(fname);

        //    if (s.IndexOf("APMI610") != -1)
        //    {


        //        System.Diagnostics.Debug.Write(s);
        //        //this.textBox3.AppendText(s + "\n");

        //        XmlDocument xDoc = new XmlDocument();
        //        xDoc.Load((s));
        //        XmlNodeList plantid = xDoc.GetElementsByTagName("PlantID");
        //        XmlNodeList pmcano = xDoc.GetElementsByTagName("pmcano");
        //        XmlNodeList pmca00 = xDoc.GetElementsByTagName("pmca00");
        //        XmlNodeList pmca01 = xDoc.GetElementsByTagName("pmca01");
        //        XmlNodeList pmca02 = xDoc.GetElementsByTagName("pmca02");
        //        XmlNodeList pmy02_7 = xDoc.GetElementsByTagName("pmy02-7");


        //        XmlNodeList pmca03 = xDoc.GetElementsByTagName("pmca03");
        //        XmlNodeList pmca04 = xDoc.GetElementsByTagName("pmca04");
        //        XmlNodeList pmca06 = xDoc.GetElementsByTagName("pmca06");
        //        XmlNodeList pmca07 = xDoc.GetElementsByTagName("pmca07");
        //        XmlNodeList gea02_0 = xDoc.GetElementsByTagName("gea02-0");
        //        XmlNodeList pmca011 = xDoc.GetElementsByTagName("pmca011");
        //        XmlNodeList geb02_1 = xDoc.GetElementsByTagName("geb02-1");

        //        XmlNodeList pmca081 = xDoc.GetElementsByTagName("pmca081");
        //        XmlNodeList pmca082 = xDoc.GetElementsByTagName("pmca082");
        //        XmlNodeList pmca091 = xDoc.GetElementsByTagName("pmca091");
        //        XmlNodeList pmca092 = xDoc.GetElementsByTagName("pmca092");
        //        XmlNodeList pmca093 = xDoc.GetElementsByTagName("pmca093");
        //        XmlNodeList pmca094 = xDoc.GetElementsByTagName("pmca094");
        //        XmlNodeList pmca095 = xDoc.GetElementsByTagName("pmca095");
        //        XmlNodeList pmca10 = xDoc.GetElementsByTagName("pmca10");
        //        XmlNodeList pmca11 = xDoc.GetElementsByTagName("pmca11");
        //        XmlNodeList pmca12 = xDoc.GetElementsByTagName("pmca12");
        //        XmlNodeList pmca13 = xDoc.GetElementsByTagName("pmca13");
        //        XmlNodeList pmca14 = xDoc.GetElementsByTagName("pmca14");
        //        XmlNodeList pmca15 = xDoc.GetElementsByTagName("pmca15");
        //        XmlNodeList pmca16 = xDoc.GetElementsByTagName("pmca16");
        //        XmlNodeList pmca17 = xDoc.GetElementsByTagName("pmca17");


        //        XmlNodeList pma02_2 = xDoc.GetElementsByTagName("pma02-2");
        //        XmlNodeList pmca18 = xDoc.GetElementsByTagName("pmca18");
        //        XmlNodeList pmca19 = xDoc.GetElementsByTagName("pmca19");
        //        XmlNodeList pmca20 = xDoc.GetElementsByTagName("pmca20");
        //        XmlNodeList pmca21 = xDoc.GetElementsByTagName("pmca21");
        //        XmlNodeList pmca22 = xDoc.GetElementsByTagName("pmca22");


        //        XmlNodeList azi02_3 = xDoc.GetElementsByTagName("azi02-3");


        //        XmlNodeList pmca23 = xDoc.GetElementsByTagName("pmca23");
        //        XmlNodeList pmca24 = xDoc.GetElementsByTagName("pmca24");
        //        XmlNodeList pmca25 = xDoc.GetElementsByTagName("pmca25");
        //        XmlNodeList pmca26 = xDoc.GetElementsByTagName("pmca26");
        //        XmlNodeList pmca27 = xDoc.GetElementsByTagName("pmca27");
        //        XmlNodeList pmca28 = xDoc.GetElementsByTagName("pmca28");
        //        XmlNodeList pmca30 = xDoc.GetElementsByTagName("pmca30");
        //        XmlNodeList pmca47 = xDoc.GetElementsByTagName("pmca47");
        //        XmlNodeList gec02_4 = xDoc.GetElementsByTagName("gec02-4");
        //        XmlNodeList pmca48 = xDoc.GetElementsByTagName("pmca48");
        //        XmlNodeList pmca49 = xDoc.GetElementsByTagName("pmca49");
        //        XmlNodeList pmca50 = xDoc.GetElementsByTagName("pmca50");
        //        XmlNodeList pmca51 = xDoc.GetElementsByTagName("pmca51");
        //        XmlNodeList pmca52 = xDoc.GetElementsByTagName("pmca52");
        //        XmlNodeList pmca53 = xDoc.GetElementsByTagName("pmca53");
        //        XmlNodeList pmca54 = xDoc.GetElementsByTagName("pmca54");
        //        XmlNodeList pmca55 = xDoc.GetElementsByTagName("pmca55");
        //        XmlNodeList pmca56 = xDoc.GetElementsByTagName("pmca56");
        //        XmlNodeList oah02_5 = xDoc.GetElementsByTagName("oah02-5");

        //        XmlNodeList pmca901 = xDoc.GetElementsByTagName("pmca901");
        //        XmlNodeList pmca902 = xDoc.GetElementsByTagName("pmca902");
        //        XmlNodeList pmca903 = xDoc.GetElementsByTagName("pmca903");
        //        XmlNodeList pmca904 = xDoc.GetElementsByTagName("pmca904");
        //        XmlNodeList pmca905 = xDoc.GetElementsByTagName("pmca905");
        //        XmlNodeList pmca906 = xDoc.GetElementsByTagName("pmca906");
        //        XmlNodeList pmca907 = xDoc.GetElementsByTagName("pmca907");
        //        XmlNodeList pmca908 = xDoc.GetElementsByTagName("pmca908");
        //        XmlNodeList pmca911 = xDoc.GetElementsByTagName("pmca911");


        //        XmlNodeList pmcaacti = xDoc.GetElementsByTagName("pmcaacti");
        //        XmlNodeList pmcauser = xDoc.GetElementsByTagName("pmcauser");
        //        XmlNodeList pmcagrup = xDoc.GetElementsByTagName("pmcagrup");
        //        XmlNodeList gem02_6 = xDoc.GetElementsByTagName("gem02-6");


        //        XmlNodeList pmcamodu = xDoc.GetElementsByTagName("pmcamodu");
        //        XmlNodeList pmcadate = xDoc.GetElementsByTagName("pmcadate");
        //        XmlNodeList pmcaud01 = xDoc.GetElementsByTagName("pmcaud01");
        //        XmlNodeList pmcaud02 = xDoc.GetElementsByTagName("pmcaud02");

        //        XmlNodeList pmcaud03 = xDoc.GetElementsByTagName("pmcaud03");
        //        XmlNodeList pmcaud15 = xDoc.GetElementsByTagName("pmcaud15");


        //        XmlNodeList ta_pmca01 = xDoc.GetElementsByTagName("ta_pmca01");
        //        XmlNodeList ta_pmca02 = xDoc.GetElementsByTagName("ta_pmca02");
        //        XmlNodeList ta_pmca03 = xDoc.GetElementsByTagName("ta_pmca03");
        //        XmlNodeList ta_pmca04 = xDoc.GetElementsByTagName("ta_pmca04");
        //        XmlNodeList ta_pmca05 = xDoc.GetElementsByTagName("ta_pmca05");
        //        XmlNodeList ta_pmca06 = xDoc.GetElementsByTagName("ta_pmca06");
        //        XmlNodeList ta_pmca07 = xDoc.GetElementsByTagName("ta_pmca07");
        //        XmlNodeList ta_pmca08 = xDoc.GetElementsByTagName("ta_pmca08");
        //        XmlNodeList ta_pmca09 = xDoc.GetElementsByTagName("ta_pmca09");
        //        XmlNodeList ta_pmca10 = xDoc.GetElementsByTagName("ta_pmca10");
        //        XmlNodeList ta_pmca13 = xDoc.GetElementsByTagName("ta_pmca13");
        //        XmlNodeList ta_pmca14 = xDoc.GetElementsByTagName("ta_pmca14");
        //        XmlNodeList ta_pmca15 = xDoc.GetElementsByTagName("ta_pmca15");
        //        XmlNodeList ta_pmca37 = xDoc.GetElementsByTagName("ta_pmca37");
        //        XmlNodeList ta_pmca38 = xDoc.GetElementsByTagName("ta_pmca38");

        //        XmlNodeList ta_pmca40 = xDoc.GetElementsByTagName("ta_pmca40");
        //        XmlNodeList ta_pmca41 = xDoc.GetElementsByTagName("ta_pmca41");

        //        //產業別---------------
        //        XmlNodeList ta_pmca42 = xDoc.GetElementsByTagName("ta_pmca42");
        //        XmlNodeList tc_oah02_8 = xDoc.GetElementsByTagName("tc_oah02-8");
        //        //------------------
        //        //2015/0803 ADD  如果為Y則是小於90天原因必key
        //        XmlNodeList l_day = xDoc.GetElementsByTagName("l_day");
        //        //2016/1/26 ADD
        //        XmlNodeList ta_pmca43a = xDoc.GetElementsByTagName("ta_pmca43a");
        //        XmlNodeList ta_pmca43b = xDoc.GetElementsByTagName("ta_pmca43b");
        //        XmlNodeList ta_pmca43c = xDoc.GetElementsByTagName("ta_pmca43c");
        //        XmlNodeList ta_pmca44a = xDoc.GetElementsByTagName("ta_pmca44a");
        //        XmlNodeList ta_pmca44b = xDoc.GetElementsByTagName("ta_pmca44b");
        //        XmlNodeList ta_pmca44c = xDoc.GetElementsByTagName("ta_pmca44c");
        //        XmlNodeList ta_pmca45a = xDoc.GetElementsByTagName("ta_pmca45a");
        //        XmlNodeList ta_pmca45b = xDoc.GetElementsByTagName("ta_pmca45b");
        //        XmlNodeList ta_pmca45c = xDoc.GetElementsByTagName("ta_pmca45c");

        //        XmlNodeList ta_pmca46a = xDoc.GetElementsByTagName("ta_pmca46a");
        //        XmlNodeList ta_pmca46b = xDoc.GetElementsByTagName("ta_pmca46b");
        //        XmlNodeList ta_pmca46c = xDoc.GetElementsByTagName("ta_pmca46c");
        //        XmlNodeList ta_pmca46d = xDoc.GetElementsByTagName("ta_pmca46d");
        //        XmlNodeList ta_pmca46e = xDoc.GetElementsByTagName("ta_pmca46e");
        //        XmlNodeList ta_pmca46f = xDoc.GetElementsByTagName("ta_pmca46f");
        //        XmlNodeList ta_pmca46g = xDoc.GetElementsByTagName("ta_pmca46g");
        //        XmlNodeList ta_pmca47 = xDoc.GetElementsByTagName("ta_pmca47");
        //        XmlNodeList ta_pmca48 = xDoc.GetElementsByTagName("ta_pmca48");


        //        //End 2016/1/26 ADD

        //        string sno = "";

        //        //  Response.Write("select * from eipb.dbo.APMI610_IN  where pmk01 = '" + pmk01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
        //        SmoothEnterprise.Database.DataSet hs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //        hs.Open("select * from eipb.dbo.APMI610_IN  where pmcano = '" + pmcano[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");//檢查單頭是否有重覆單據號碼

        //        #region 單號不相同,將資料全數新增

        //        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);

        //        if (hs.EOF)
        //        {
        //            rs.Open("SELECT * FROM eipb.dbo.APMI610_IN WHERE 1=0");
        //            rs.Add();


        //            EIPSysSha UseSha = new EIPSysSha();
        //            sno = UseSha.GetNewSn("F501", DateTime.Now.ToString("yyMM"));

        //            rs["pmcano"] = pmcano[0].InnerXml.Trim();
        //            rs["pmcsn"] = sno;

        //        }
        //        else
        //        {
        //            sno = hs["pmcsn"].ToString();
        //            rs.Open("select * from eipb.dbo.APMI610_IN  where pmcano = '" + pmcano[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");//檢查單頭是否有重覆單據號碼

        //            rs["pmcano"] = pmcano[0].InnerXml.Trim();
        //        }


        //        if (plantid[0].InnerXml != "") rs["plantID"] = plantid[0].InnerXml.Trim();
        //        else rs["plantID"] = System.DBNull.Value;


        //        if (pmca00[0].InnerXml != "") rs["pmca00"] = pmca00[0].InnerXml.Trim();
        //        else rs["pmca00"] = System.DBNull.Value;

        //        if (pmca01[0].InnerXml != "") rs["pmca01"] = pmca01[0].InnerXml.Trim();
        //        else rs["pmca01"] = System.DBNull.Value;



        //        if (pmca02[0].InnerXml != "") rs["pmca02"] = pmca02[0].InnerXml.Trim();
        //        else rs["pmca02"] = System.DBNull.Value;


        //        if (pmca03[0].InnerXml != "") rs["pmca03"] = pmca03[0].InnerXml.Replace("&amp;", "&");
        //        else rs["pmca03"] = System.DBNull.Value;


        //        if (pmca04[0].InnerXml != "") rs["pmca04"] = pmca04[0].InnerXml.Trim();
        //        else rs["pmca04"] = System.DBNull.Value;

        //        if (pmca06[0].InnerXml != "") rs["pmca06"] = pmca06[0].InnerXml.Trim();
        //        else rs["pmca06"] = System.DBNull.Value;

        //        if (pmca07[0].InnerXml != "") rs["pmca07"] = pmca07[0].InnerXml.Trim();
        //        else rs["pmca07"] = System.DBNull.Value;




        //        if (gea02_0[0].InnerXml != "") rs["gea02_0"] = gea02_0[0].InnerXml.Trim();
        //        else rs["gea02_0"] = System.DBNull.Value;


        //        if (pmca11[0].InnerXml != "") rs["pmca11"] = pmca11[0].InnerXml.Trim();
        //        else rs["pmca11"] = System.DBNull.Value;

        //        if (geb02_1[0].InnerXml != "") rs["geb02_1"] = geb02_1[0].InnerXml.Trim();
        //        else rs["geb02_1"] = System.DBNull.Value;

        //        if (pmca081[0].InnerXml != "") rs["pmca081"] = pmca081[0].InnerXml.Replace("&amp;", "&");
        //        else rs["pmca081"] = System.DBNull.Value;

        //        if (pmca082[0].InnerXml != "") rs["pmca082"] = pmca082[0].InnerXml.Trim();
        //        else rs["pmca082"] = System.DBNull.Value;
        //        //--------------- 

        //        if (pmca091[0].InnerXml != "") rs["pmca091"] = pmca091[0].InnerXml.Replace("&amp;", "&");
        //        else rs["pmca091"] = System.DBNull.Value;

        //        if (pmca092[0].InnerXml != "") rs["pmca092"] = pmca092[0].InnerXml.Trim();
        //        else rs["pmca092"] = System.DBNull.Value;

        //        if (pmca093[0].InnerXml != "") rs["pmca093"] = pmca093[0].InnerXml.Trim();
        //        else rs["pmca093"] = System.DBNull.Value;

        //        if (pmca094[0].InnerXml != "") rs["pmca094"] = pmca094[0].InnerXml.Trim();
        //        else rs["pmca094"] = System.DBNull.Value;

        //        if (pmca095[0].InnerXml != "") rs["pmca095"] = pmca095[0].InnerXml.Trim();
        //        else rs["pmca095"] = System.DBNull.Value;
        //        //--

        //        if (pmca10[0].InnerXml != "") rs["pmca10"] = pmca10[0].InnerXml.Trim();
        //        else rs["pmca10"] = System.DBNull.Value;

        //        if (pmca11[0].InnerXml != "") rs["pmca11"] = pmca11[0].InnerXml.Trim();
        //        else rs["pmca11"] = System.DBNull.Value;
        //        if (pmca12[0].InnerXml != "") rs["pmca12"] = pmca12[0].InnerXml.Trim();
        //        else rs["pmca12"] = System.DBNull.Value;
        //        if (pmca13[0].InnerXml != "") rs["pmca13"] = pmca13[0].InnerXml.Trim();
        //        else rs["pmca13"] = System.DBNull.Value;
        //        if (pmca14[0].InnerXml != "") rs["pmca14"] = pmca14[0].InnerXml.Trim();
        //        else rs["pmca14"] = System.DBNull.Value;
        //        if (pmca15[0].InnerXml != "") rs["pmca15"] = pmca15[0].InnerXml.Trim();
        //        else rs["pmca15"] = System.DBNull.Value;
        //        if (pmca16[0].InnerXml != "") rs["pmca16"] = pmca16[0].InnerXml.Trim();
        //        else rs["pmca16"] = System.DBNull.Value;
        //        if (pmca17[0].InnerXml != "") rs["pmca17"] = pmca17[0].InnerXml.Trim();
        //        else rs["pmca17"] = System.DBNull.Value;

        //        if (pma02_2[0].InnerXml != "") rs["pma02_2"] = pma02_2[0].InnerXml.Trim();
        //        else rs["pma02_2"] = System.DBNull.Value;

        //        if (pmca18[0].InnerXml != "") rs["pmca18"] = pmca18[0].InnerXml.Trim();
        //        else rs["pmca18"] = System.DBNull.Value;


        //        if (pmca19[0].InnerXml != "") rs["pmca19"] = pmca19[0].InnerXml.Trim();
        //        else rs["pmca19"] = System.DBNull.Value;

        //        if (pmca20[0].InnerXml != "") rs["pmca20"] = pmca20[0].InnerXml.Trim();
        //        else rs["pmca20"] = System.DBNull.Value;

        //        if (pmca21[0].InnerXml != "") rs["pmca21"] = pmca21[0].InnerXml.Trim();
        //        else rs["pmca21"] = System.DBNull.Value;

        //        if (pmca22[0].InnerXml != "") rs["pmca22"] = pmca22[0].InnerXml.Trim();
        //        else rs["pmca22"] = System.DBNull.Value;


        //        if (azi02_3[0].InnerXml != "") rs["azi02_3"] = azi02_3[0].InnerXml.Trim();
        //        else rs["azi02_3"] = System.DBNull.Value;

        //        //--else rs["pmca18"] = System.DBNull.Value;

        //        if (pmca23[0].InnerXml != "") rs["pmca23"] = pmca23[0].InnerXml.Trim();
        //        else rs["pmca23"] = System.DBNull.Value;

        //        if (pmca24[0].InnerXml != "") rs["pmca24"] = pmca24[0].InnerXml.Trim();
        //        else rs["pmca24"] = System.DBNull.Value;

        //        if (pmca25[0].InnerXml != "") rs["pmca25"] = pmca25[0].InnerXml.Trim();
        //        else rs["pmca25"] = System.DBNull.Value;

        //        if (pmca26[0].InnerXml != "") rs["pmca26"] = pmca26[0].InnerXml.Trim();
        //        else rs["pmca26"] = System.DBNull.Value;

        //        if (pmca27[0].InnerXml != "") rs["pmca27"] = pmca27[0].InnerXml.Trim();
        //        else rs["pmca27"] = System.DBNull.Value;

        //        if (pmca28[0].InnerXml != "") rs["pmca28"] = pmca28[0].InnerXml.Trim();
        //        else rs["pmca28"] = System.DBNull.Value;

        //        if (pmca30[0].InnerXml != "") rs["pmca30"] = pmca30[0].InnerXml.Trim();
        //        else rs["pmca30"] = System.DBNull.Value;

        //        if (pmca47[0].InnerXml != "") rs["pmca47"] = pmca47[0].InnerXml.Trim();
        //        else rs["pmca47"] = System.DBNull.Value;

        //        if (gec02_4[0].InnerXml != "") rs["gec02_4"] = gec02_4[0].InnerXml.Trim();
        //        else rs["gec02_4"] = System.DBNull.Value;


        //        if (pmca48[0].InnerXml != "") rs["pmca48"] = pmca48[0].InnerXml.Trim();
        //        else rs["pmca48"] = System.DBNull.Value;

        //        if (pmca49[0].InnerXml != "") rs["pmca49"] = pmca49[0].InnerXml.Trim();
        //        else rs["pmca49"] = System.DBNull.Value;

        //        if (pmca50[0].InnerXml != "") rs["pmca50"] = pmca50[0].InnerXml.Trim();
        //        else rs["pmca50"] = System.DBNull.Value;


        //        if (pmca51[0].InnerXml != "") rs["pmca51"] = pmca51[0].InnerXml.Trim();
        //        else rs["pmca51"] = System.DBNull.Value;

        //        if (pmca52[0].InnerXml != "") rs["pmca52"] = pmca52[0].InnerXml.Replace("&amp;", "&");
        //        else rs["pmca52"] = System.DBNull.Value;


        //        if (pmca53[0].InnerXml != "") rs["pmca53"] = pmca53[0].InnerXml.Replace("&amp;", "&");
        //        else rs["pmca53"] = System.DBNull.Value;


        //        if (pmca54[0].InnerXml != "") rs["pmca54"] = pmca54[0].InnerXml.Trim();
        //        else rs["pmca54"] = System.DBNull.Value;

        //        if (pmca55[0].InnerXml != "") rs["pmca55"] = pmca55[0].InnerXml.Trim();
        //        else rs["pmca55"] = System.DBNull.Value;


        //        if (pmca56[0].InnerXml != "") rs["pmca56"] = pmca56[0].InnerXml.Trim();
        //        else rs["pmca56"] = System.DBNull.Value;

        //        if (oah02_5[0].InnerXml != "") rs["oah02_5"] = oah02_5[0].InnerXml.Trim();
        //        else rs["oah02_5"] = System.DBNull.Value;

        //        if (pmca901[0].InnerXml != "") rs["pmca901"] = pmca901[0].InnerXml.Trim();
        //        else rs["pmca901"] = System.DBNull.Value;

        //        if (pmca902[0].InnerXml != "") rs["pmca902"] = pmca902[0].InnerXml.Trim();
        //        else rs["pmca902"] = System.DBNull.Value;

        //        if (pmca903[0].InnerXml != "") rs["pmca903"] = pmca903[0].InnerXml.Trim();
        //        else rs["pmca903"] = System.DBNull.Value;

        //        if (pmca904[0].InnerXml != "") rs["pmca904"] = pmca904[0].InnerXml.Trim();
        //        else rs["pmca904"] = System.DBNull.Value;

        //        if (pmca905[0].InnerXml != "") rs["pmca905"] = pmca905[0].InnerXml.Trim();
        //        else rs["pmca905"] = System.DBNull.Value;

        //        if (pmca906[0].InnerXml != "") rs["pmca906"] = pmca906[0].InnerXml.Trim();
        //        else rs["pmca906"] = System.DBNull.Value;

        //        if (pmca907[0].InnerXml != "") rs["pmca907"] = pmca907[0].InnerXml.Trim();
        //        else rs["pmca907"] = System.DBNull.Value;

        //        if (pmca908[0].InnerXml != "") rs["pmca908"] = pmca908[0].InnerXml.Trim();
        //        else rs["pmca908"] = System.DBNull.Value;

        //        if (pmca911[0].InnerXml != "") rs["pmca911"] = pmca911[0].InnerXml.Trim();
        //        else rs["pmca911"] = System.DBNull.Value;

        //        if (pmcaacti[0].InnerXml != "") rs["pmcaacti"] = pmcaacti[0].InnerXml.Trim();
        //        else rs["pmcaacti"] = System.DBNull.Value;


        //        if (pmcauser[0].InnerXml != "") rs["pmcauser"] = pmcauser[0].InnerXml.Trim();
        //        else rs["pmcauser"] = System.DBNull.Value;
        //        if (pmcagrup[0].InnerXml != "") rs["pmcagrup"] = pmcagrup[0].InnerXml.Trim();
        //        else rs["pmcagrup"] = System.DBNull.Value;
        //        if (pmcamodu[0].InnerXml != "") rs["pmcamodu"] = pmcamodu[0].InnerXml.Trim();
        //        else rs["pmcamodu"] = System.DBNull.Value;
        //        if (pmcadate[0].InnerXml != "") rs["pmcadate"] = pmcadate[0].InnerXml.Trim();
        //        else rs["pmcadate"] = System.DBNull.Value;
        //        if (pmcaud01[0].InnerXml != "") rs["pmcaud01"] = pmcaud01[0].InnerXml.Trim();
        //        else rs["pmcaud01"] = System.DBNull.Value;

        //        if (pmcaud02[0].InnerXml != "") rs["pmcaud02"] = pmcaud02[0].InnerXml.Trim();
        //        else rs["pmcaud02"] = System.DBNull.Value;
        //        if (pmcaud03[0].InnerXml != "") rs["pmcaud03"] = pmcaud03[0].InnerXml.Trim();
        //        else rs["pmcaud03"] = System.DBNull.Value;
        //        if (pmcaud15[0].InnerXml != "") rs["pmcaud15"] = pmcaud15[0].InnerXml.Trim();
        //        else rs["pmcaud15"] = System.DBNull.Value;

        //        if (ta_pmca01[0].InnerXml != "") rs["ta_pmca01"] = ta_pmca01[0].InnerXml.Trim();
        //        else rs["ta_pmca01"] = System.DBNull.Value;
        //        if (ta_pmca02[0].InnerXml != "") rs["ta_pmca02"] = ta_pmca02[0].InnerXml.Trim();
        //        else rs["ta_pmca02"] = System.DBNull.Value;
        //        if (ta_pmca03[0].InnerXml != "") rs["ta_pmca03"] = ta_pmca03[0].InnerXml.Trim();
        //        else rs["ta_pmca03"] = System.DBNull.Value;
        //        if (ta_pmca04[0].InnerXml != "") rs["ta_pmca04"] = ta_pmca04[0].InnerXml.Trim();
        //        else rs["ta_pmca04"] = System.DBNull.Value;
        //        if (ta_pmca05[0].InnerXml != "") rs["ta_pmca05"] = ta_pmca05[0].InnerXml.Trim();
        //        else rs["ta_pmca05"] = System.DBNull.Value;
        //        if (ta_pmca06[0].InnerXml != "") rs["ta_pmca06"] = ta_pmca06[0].InnerXml.Trim();
        //        else rs["ta_pmca06"] = System.DBNull.Value;
        //        if (ta_pmca07[0].InnerXml != "") rs["ta_pmca07"] = ta_pmca07[0].InnerXml.Trim();
        //        else rs["ta_pmca07"] = System.DBNull.Value;
        //        if (ta_pmca08[0].InnerXml != "") rs["ta_pmca08"] = ta_pmca08[0].InnerXml.Trim();
        //        else rs["ta_pmca08"] = System.DBNull.Value;
        //        if (ta_pmca09[0].InnerXml != "") rs["ta_pmca09"] = ta_pmca09[0].InnerXml.Trim();
        //        else rs["ta_pmca09"] = System.DBNull.Value;
        //        //
        //        if (ta_pmca10[0].InnerXml != "") rs["ta_pmca10"] = ta_pmca10[0].InnerXml.Trim();
        //        else rs["ta_pmca10"] = System.DBNull.Value;
        //        if (ta_pmca13[0].InnerXml != "") rs["ta_pmca13"] = ta_pmca13[0].InnerXml.Trim();
        //        else rs["ta_pmca13"] = System.DBNull.Value;
        //        if (ta_pmca14[0].InnerXml != "") rs["ta_pmca14"] = ta_pmca14[0].InnerXml.Trim();
        //        else rs["ta_pmca14"] = System.DBNull.Value;
        //        if (ta_pmca15[0].InnerXml != "") rs["ta_pmca15"] = ta_pmca15[0].InnerXml.Trim();
        //        else rs["ta_pmca15"] = System.DBNull.Value;

        //        if (gem02_6[0].InnerXml != "") rs["gem02_6"] = gem02_6[0].InnerXml.Trim();
        //        else rs["gem02_6"] = System.DBNull.Value;

        //        if (pmy02_7[0].InnerXml != "") rs["pmy02_7"] = pmy02_7[0].InnerXml.Trim();
        //        else rs["pmy02_7"] = System.DBNull.Value;


        //        if (ta_pmca40[0].InnerXml != "") rs["ta_pmca40"] = ta_pmca40[0].InnerXml.Trim();
        //        else rs["ta_pmca40"] = System.DBNull.Value;
        //        if (ta_pmca41[0].InnerXml != "") rs["ta_pmca41"] = ta_pmca41[0].InnerXml.Trim();
        //        else rs["ta_pmca41"] = System.DBNull.Value;
        //        //2015/0803 ADD
        //        if (l_day[0].InnerXml != "") rs["l_day"] = l_day[0].InnerXml.Trim();


        //        if (ta_pmca42[0].InnerXml != "") rs["ta_pmca42"] = ta_pmca42[0].InnerXml.Trim();
        //        else rs["ta_pmca42"] = System.DBNull.Value;

        //        if (tc_oah02_8[0].InnerXml != "") rs["tc_oah02_8"] = tc_oah02_8[0].InnerXml.Trim();
        //        else rs["tc_oah02_8"] = System.DBNull.Value;

        //        //2016/1/26
        //        if (ta_pmca43a[0].InnerXml != "") rs["ta_pmca43a"] = ta_pmca43a[0].InnerXml.Trim();
        //        else rs["ta_pmca43a"] = System.DBNull.Value;
        //        if (ta_pmca43b[0].InnerXml != "") rs["ta_pmca43b"] = ta_pmca43b[0].InnerXml.Trim();
        //        else rs["ta_pmca43b"] = System.DBNull.Value;
        //        if (ta_pmca43c[0].InnerXml != "") rs["ta_pmca43c"] = ta_pmca43c[0].InnerXml.Trim();
        //        else rs["ta_pmca43c"] = System.DBNull.Value;

        //        if (ta_pmca44a[0].InnerXml != "") rs["ta_pmca44a"] = ta_pmca44a[0].InnerXml.Trim();
        //        else rs["ta_pmca44a"] = System.DBNull.Value;
        //        if (ta_pmca44b[0].InnerXml != "") rs["ta_pmca44b"] = ta_pmca44b[0].InnerXml.Trim();
        //        else rs["ta_pmca44b"] = System.DBNull.Value;
        //        if (ta_pmca44c[0].InnerXml != "") rs["ta_pmca44c"] = ta_pmca44c[0].InnerXml.Trim();
        //        else rs["ta_pmca44c"] = System.DBNull.Value;

        //        if (ta_pmca45a[0].InnerXml != "") rs["ta_pmca45a"] = ta_pmca45a[0].InnerXml.Trim();
        //        else rs["ta_pmca45a"] = System.DBNull.Value;
        //        if (ta_pmca45b[0].InnerXml != "") rs["ta_pmca45b"] = ta_pmca45b[0].InnerXml.Trim();
        //        else rs["ta_pmca45b"] = System.DBNull.Value;
        //        if (ta_pmca45c[0].InnerXml != "") rs["ta_pmca45c"] = ta_pmca45c[0].InnerXml.Trim();
        //        else rs["ta_pmca45c"] = System.DBNull.Value;

        //        if (ta_pmca46a[0].InnerXml != "") rs["ta_pmca46a"] = ta_pmca46a[0].InnerXml.Trim();
        //        else rs["ta_pmca46a"] = System.DBNull.Value;
        //        if (ta_pmca46b[0].InnerXml != "") rs["ta_pmca46b"] = ta_pmca46b[0].InnerXml.Trim();
        //        else rs["ta_pmca46b"] = System.DBNull.Value;
        //        if (ta_pmca46c[0].InnerXml != "") rs["ta_pmca46c"] = ta_pmca46c[0].InnerXml.Trim();
        //        else rs["ta_pmca46c"] = System.DBNull.Value;
        //        if (ta_pmca46d[0].InnerXml != "") rs["ta_pmca46d"] = ta_pmca46d[0].InnerXml.Trim();
        //        else rs["ta_pmca46d"] = System.DBNull.Value;
        //        if (ta_pmca46e[0].InnerXml != "") rs["ta_pmca46e"] = ta_pmca46e[0].InnerXml.Trim();
        //        else rs["ta_pmca46e"] = System.DBNull.Value;
        //        if (ta_pmca46f[0].InnerXml != "") rs["ta_pmca46f"] = ta_pmca46f[0].InnerXml.Trim();
        //        else rs["ta_pmca46f"] = System.DBNull.Value;
        //        if (ta_pmca46g[0].InnerXml != "") rs["ta_pmca46g"] = ta_pmca46g[0].InnerXml.Trim();
        //        else rs["ta_pmca46g"] = System.DBNull.Value;


        //        if (ta_pmca47[0].InnerXml != "") rs["ta_pmca47"] = ta_pmca47[0].InnerXml.Trim();
        //        else rs["ta_pmca47"] = System.DBNull.Value;
        //        if (ta_pmca48[0].InnerXml != "") rs["ta_pmca48"] = ta_pmca48[0].InnerXml.Trim();
        //        else rs["ta_pmca48"] = System.DBNull.Value;

        //        rs["status"] = "N";

        //        rs.Update();
        //        rs.Close();

        //        recheckvalues(sno);

        //        #endregion


        //        if (System.IO.File.Exists(s.Replace("Download", "XML")))  //判斷在OUT資料夾裡, 檔案是否存在
        //        {

        //            File.Delete(s.Replace("Download", "XML"));  //存在的話先刪除該檔案再存入新檔案
        //            File.Move(s, s.Replace("Download", "XML"));
        //        }
        //        else
        //        {　
        //            File.Move(s, s.Replace("Download", "XML"));  //不存在直接存入新檔案
        //        }

        //        //發mail---------------------------------------------------------------------------------------------------------------------------

        //        mailprocess(pmcano[0].InnerXml, plantid[0].InnerXml);

        //        //Upload("D:\\APMI610_XML\\ERP_XML\\"+ plantid[0].InnerXml + "_apmi610_" + pmcano[0].InnerXml + ".xml", "ftp://192.168.0.250/" + plantid[0].InnerXml + "_apmi610_" + pmcano[0].InnerXml + ".xml", "xmlback", "xmlback");
        //        Upload("D:\\APMI610_XML\\ERP_XML\\" + fname, "ftp://192.168.0.250/" + fname, "xmlback", "xmlback"); //update by carol 2018/07/26  與ERP 一致
        //        //---------------------------------------------------------------------------------------------------------------------------


        //    }


        //    //}
        //    // catch (Exception ex)
        //    // {
        //    #region
        //    //herzog remark
        //    /*  string s1 = s.Replace(".xml", "");
        //    s1 = s1.Replace("D:\\APMI610_XML\\ERP_Download\\", "");
        //     int sone = s1.IndexOf("_");
        //     int stwo = s1.LastIndexOf("_");
        //     stwo = stwo + 1;
        //     FileStream fs = new FileStream(@"D:\APMI610_XML\4GL\" + s1 + ".txt", FileMode.Create, FileAccess.Write);
        //     StreamWriter sw = new StreamWriter(fs);
        //     sw.WriteLine("\"" + s1.Substring(0, sone) + "\",\"APMI610\",\"" + s1.Substring(stwo, 10) + "\",\"E\",\"\"");
        //     sw.Close();
        //     fs.Close();
        //     Upload(fs.ToString(), "ftp://192.168.0.250/" + s1.ToString() + ".txt", "4gl", "4gl");


        //     //發mail---------------------------------------------------------------------------------------------------------------------------
        //     String ques;

        //     MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
        //     MailAddress to = new MailAddress("herzog.lin@minaik.com.tw");

        //     MailAddress bcc = new MailAddress("herzog.lin@minaik.com.tw");

        //     MailMessage message = new MailMessage(from, to);
        //     message.Bcc.Add(bcc);

        //     ques = "有問題";

        //     message.Subject = "ERP廠商代號有問題";
        //     message.IsBodyHtml = true;
        //     message.Body = ques;

        //     SmtpClient client = new SmtpClient("192.168.0.12");

        //     client.Send(message);

        //     Response.Write("ERP廠商代號有問題" + "<br>");

        //      */
        //    #endregion

        //    //---------------------------------------------------------------------------------------------------------------------------


        //    // }

        //}
        //----------------------------------------------------------------- by carol end

    }

    private void copyToBack(string soruce)
    {

        string back = soruce.Replace(@"\xml\", @"\xml_back\");
        //MINAIK-U_apmi610_202-1870007
        string dest = back.Replace(".xml", "_" + DateTime.Now.ToString("yyMMdd_HHmmss") + ".xml");
        File.Copy(soruce, dest);
        File.Delete(soruce);
    }

    private void recheckvalues(string sno)
    {
        string EIPColumn = "";
        string ERPColumn = "";
        string ERPvalue = "";
        string EIPvalue = "";
        string RowCunt = "0";
        string Sql = "";
        DBTransfer GS = new DBTransfer();
        SmoothEnterprise.Database.DataSet Ts = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        ds.Open("select   *  from eipb.dbo.apmi610_in where  ( (pmca00 like '%U%') " +
            " or (pmca00 like '%V%' and pmcaud01='N'))     and pmcsn='" + sno + "' ");
        if (!ds.EOF)
        {
            //del old data

            GS.RunIUSql("delete from  eipb.dbo.apmi610_mod where rowid='" + ds["rowid"].ToString() + "'");

            //檢查每個欄位
            Ts.Open("SELECT name,REPLACE(name,'ca','c') Fname,column_id " +
                "  from eipb.sys.columns " +
                "  where   Object_ID = Object_ID('eipb.dbo.APMI610_IN') " +
                "  and  name like '%pmca%'    and column_id not in ('4','5','64','68','84','85','86','87','119','120','121') ");
            while (!Ts.EOF)
            {
                EIPColumn = Ts[1].ToString();
                ERPColumn = EIPColumn.Replace("ca", "c");

                //if (ERPColumn.Substring(0, 1) == "t") ERPColumn = ERPColumn.Replace("t", "ta");

                //if (EIPColumn.Substring(0, 1) == "t")
                //{

                //}
                //else
                //{
                //    ERPColumn = EIPColumn.Replace('a', ' ');
                //}



                EIPvalue = ds[Ts[0].ToString()].ToString();
                ERPvalue = GS.GetTopfile("select " + ERPColumn + " from [IP185].[MINAIK].[dbo].[PMC_FILE] where pmc01='" + ds["pmca01"].ToString() + "'");
                //Response.Write("select " + ERPColumn + " from [IP185].[MINAIK].[dbo].[PMC_FILE] where pmc01='" + ds["pmca01"].ToString() + "'");
                if (EIPvalue.IndexOf(':').ToString() != "-1") EIPvalue = EIPvalue.Substring(0, EIPvalue.IndexOf(':'));

                if (EIPvalue != ERPvalue)
                {
                    Sql = "insert into eipb.dbo.apmi610_mod (rowid,Fnm,eipvalue,erpvalue)values('" + ds["rowid"].ToString() +
                        "','" + Ts[0].ToString() + "','" + EIPvalue + "','" + ERPvalue + "')";

                    GS.RunIUSql(Sql);

                }

                Ts.MoveNext();
            }

            RowCunt = GS.GetTopfile("select count(*) from eipb.dbo.apmi610_mod where rowid='" + ds["rowid"].ToString() + "'");
            if (RowCunt != "0")
            {
                Sql = " update   eipb.dbo.apmi610_in set ERPcheck='Y',Datadiff='Y' where rowid='" + ds["rowid"].ToString() + "'";

            }
            else Sql = " update   eipb.dbo.apmi610_in set ERPcheck='Y' where rowid='" + ds["rowid"].ToString() + "'";

            GS.RunIUSql(Sql);



        }
    }

    private void mailprocess(string sn, string plant)
    {
        String ques;
        SmoothEnterprise.Database.DataSet es = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);



        //v1.0.1
        if (plant == "GIT")
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" select u.email,u.name,a.rowid from eipb.dbo.APMI610_IN a ");
            sb.Append(" left join eipa.dbo.dgusererpid e on a.pmcauser = e.erpid ");
            sb.Append(" left join eipa.dbo.dguser u on e.id = u.id ");
            sb.AppendFormat(" where pmcano = '{0}' and PlantID = '{1}'  ", sn, plant);

            es.Open(sb.ToString());
        }
        else
        {


            es.Open("select email,name,rowid from eipb.dbo.APMI610_IN a left join eipa.dbo.dguser b " +
                " on pmcauser=b.erpid  where pmcano='" + sn + "' and PlantID='" + plant + "'");
        }
        ////v1.0.1

        if (!es.EOF)
        {

            MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
            MailAddress to = new MailAddress(es["email"].ToString());
            //MailAddress to = new MailAddress("herzog.lin@minaik.com.tw");
            //MailAddress bcc = new MailAddress("herzog.lin@minaik.com.tw");

            MailMessage message = new MailMessage(from, to);
            Utility.log(1, "APMI610_IN", "erp no:" + sn, "PlantID:" + plant, "Mail to :" + es["email"].ToString());

            ques = "您好:" + "<br>" +
                   "<br>" +
                   "供應商代號電子簽核申請單現有一筆，正等待您的處理:" + "<br>" +
                   "<br>" +
                   "申請單號 : " + sn + "<br>" +
                   "申請日期 : " + DateTime.Now.ToString() + "<br>" +
                   "申請人員 : " + es["name"].ToString() + "<br>" +
                   "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_APMI610/APMI610Edit.aspx?rowid=" + es["rowid"].ToString() + "\" >至供應商代號電子簽核系統檢視並編輯內容</a>" +
                   "<br>" +
                   "<br>" +
                   "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                   "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                   "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

            message.Subject = "供應商代號電子簽核 - " + sn + " 等待您的處理";
            message.IsBodyHtml = true;
            message.Body = ques;

            SmtpClient client = new SmtpClient("192.168.0.12");

            client.Send(message);




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
        if (!Utility.isEIP)
        {
            return null;
        }
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
        mailprocess("201-1570002", "MATE02");
    }

    protected void setXML(string s)
    {
        try
        {
            byte[] fileBytes = System.IO.File.ReadAllBytes(s);

            System.Diagnostics.Debug.Write(fileBytes);
            //this.textBox3.AppendText(s + "\n");

            XmlDocument xDoc = new XmlDocument();
            xDoc.Load((s));
            XmlNodeList plantid = xDoc.GetElementsByTagName("PlantID");
            XmlNodeList pmcano = xDoc.GetElementsByTagName("pmcano");
            XmlNodeList pmca00 = xDoc.GetElementsByTagName("pmca00");
            XmlNodeList pmca01 = xDoc.GetElementsByTagName("pmca01");
            XmlNodeList pmca02 = xDoc.GetElementsByTagName("pmca02");
            XmlNodeList pmy02_7 = xDoc.GetElementsByTagName("pmy02-7");


            XmlNodeList pmca03 = xDoc.GetElementsByTagName("pmca03");
            XmlNodeList pmca04 = xDoc.GetElementsByTagName("pmca04");
            XmlNodeList pmca06 = xDoc.GetElementsByTagName("pmca06");
            XmlNodeList pmca07 = xDoc.GetElementsByTagName("pmca07");
            XmlNodeList gea02_0 = xDoc.GetElementsByTagName("gea02-0");
            XmlNodeList pmca011 = xDoc.GetElementsByTagName("pmca011");
            XmlNodeList geb02_1 = xDoc.GetElementsByTagName("geb02-1");

            XmlNodeList pmca081 = xDoc.GetElementsByTagName("pmca081");
            XmlNodeList pmca082 = xDoc.GetElementsByTagName("pmca082");
            XmlNodeList pmca091 = xDoc.GetElementsByTagName("pmca091");
            XmlNodeList pmca092 = xDoc.GetElementsByTagName("pmca092");
            XmlNodeList pmca093 = xDoc.GetElementsByTagName("pmca093");
            XmlNodeList pmca094 = xDoc.GetElementsByTagName("pmca094");
            XmlNodeList pmca095 = xDoc.GetElementsByTagName("pmca095");
            XmlNodeList pmca10 = xDoc.GetElementsByTagName("pmca10");
            XmlNodeList pmca11 = xDoc.GetElementsByTagName("pmca11");
            XmlNodeList pmca12 = xDoc.GetElementsByTagName("pmca12");
            XmlNodeList pmca13 = xDoc.GetElementsByTagName("pmca13");
            XmlNodeList pmca14 = xDoc.GetElementsByTagName("pmca14");
            XmlNodeList pmca15 = xDoc.GetElementsByTagName("pmca15");
            XmlNodeList pmca16 = xDoc.GetElementsByTagName("pmca16");
            XmlNodeList pmca17 = xDoc.GetElementsByTagName("pmca17");


            XmlNodeList pma02_2 = xDoc.GetElementsByTagName("pma02-2");
            XmlNodeList pmca18 = xDoc.GetElementsByTagName("pmca18");
            XmlNodeList pmca19 = xDoc.GetElementsByTagName("pmca19");
            XmlNodeList pmca20 = xDoc.GetElementsByTagName("pmca20");
            XmlNodeList pmca21 = xDoc.GetElementsByTagName("pmca21");
            XmlNodeList pmca22 = xDoc.GetElementsByTagName("pmca22");


            XmlNodeList azi02_3 = xDoc.GetElementsByTagName("azi02-3");


            XmlNodeList pmca23 = xDoc.GetElementsByTagName("pmca23");
            XmlNodeList pmca24 = xDoc.GetElementsByTagName("pmca24");
            XmlNodeList pmca25 = xDoc.GetElementsByTagName("pmca25");
            XmlNodeList pmca26 = xDoc.GetElementsByTagName("pmca26");
            XmlNodeList pmca27 = xDoc.GetElementsByTagName("pmca27");
            XmlNodeList pmca28 = xDoc.GetElementsByTagName("pmca28");
            XmlNodeList pmca30 = xDoc.GetElementsByTagName("pmca30");
            XmlNodeList pmca47 = xDoc.GetElementsByTagName("pmca47");
            XmlNodeList gec02_4 = xDoc.GetElementsByTagName("gec02-4");
            XmlNodeList pmca48 = xDoc.GetElementsByTagName("pmca48");
            XmlNodeList pmca49 = xDoc.GetElementsByTagName("pmca49");
            XmlNodeList pmca50 = xDoc.GetElementsByTagName("pmca50");
            XmlNodeList pmca51 = xDoc.GetElementsByTagName("pmca51");
            XmlNodeList pmca52 = xDoc.GetElementsByTagName("pmca52");
            XmlNodeList pmca53 = xDoc.GetElementsByTagName("pmca53");
            XmlNodeList pmca54 = xDoc.GetElementsByTagName("pmca54");
            XmlNodeList pmca55 = xDoc.GetElementsByTagName("pmca55");
            XmlNodeList pmca56 = xDoc.GetElementsByTagName("pmca56");
            XmlNodeList oah02_5 = xDoc.GetElementsByTagName("oah02-5");

            XmlNodeList pmca901 = xDoc.GetElementsByTagName("pmca901");
            XmlNodeList pmca902 = xDoc.GetElementsByTagName("pmca902");
            XmlNodeList pmca903 = xDoc.GetElementsByTagName("pmca903");
            XmlNodeList pmca904 = xDoc.GetElementsByTagName("pmca904");
            XmlNodeList pmca905 = xDoc.GetElementsByTagName("pmca905");
            XmlNodeList pmca906 = xDoc.GetElementsByTagName("pmca906");
            XmlNodeList pmca907 = xDoc.GetElementsByTagName("pmca907");
            XmlNodeList pmca908 = xDoc.GetElementsByTagName("pmca908");
            XmlNodeList pmca911 = xDoc.GetElementsByTagName("pmca911");


            XmlNodeList pmcaacti = xDoc.GetElementsByTagName("pmcaacti");
            XmlNodeList pmcauser = xDoc.GetElementsByTagName("pmcauser");
            XmlNodeList pmcagrup = xDoc.GetElementsByTagName("pmcagrup");
            XmlNodeList gem02_6 = xDoc.GetElementsByTagName("gem02-6");


            XmlNodeList pmcamodu = xDoc.GetElementsByTagName("pmcamodu");
            XmlNodeList pmcadate = xDoc.GetElementsByTagName("pmcadate");
            XmlNodeList pmcaud01 = xDoc.GetElementsByTagName("pmcaud01");
            XmlNodeList pmcaud02 = xDoc.GetElementsByTagName("pmcaud02");

            XmlNodeList pmcaud03 = xDoc.GetElementsByTagName("pmcaud03");
            XmlNodeList pmcaud15 = xDoc.GetElementsByTagName("pmcaud15");


            XmlNodeList ta_pmca01 = xDoc.GetElementsByTagName("ta_pmca01");
            XmlNodeList ta_pmca02 = xDoc.GetElementsByTagName("ta_pmca02");
            XmlNodeList ta_pmca03 = xDoc.GetElementsByTagName("ta_pmca03");
            XmlNodeList ta_pmca04 = xDoc.GetElementsByTagName("ta_pmca04");
            XmlNodeList ta_pmca05 = xDoc.GetElementsByTagName("ta_pmca05");
            XmlNodeList ta_pmca06 = xDoc.GetElementsByTagName("ta_pmca06");
            XmlNodeList ta_pmca07 = xDoc.GetElementsByTagName("ta_pmca07");
            XmlNodeList ta_pmca08 = xDoc.GetElementsByTagName("ta_pmca08");
            XmlNodeList ta_pmca09 = xDoc.GetElementsByTagName("ta_pmca09");
            XmlNodeList ta_pmca10 = xDoc.GetElementsByTagName("ta_pmca10");
            XmlNodeList ta_pmca13 = xDoc.GetElementsByTagName("ta_pmca13");
            XmlNodeList ta_pmca14 = xDoc.GetElementsByTagName("ta_pmca14");
            XmlNodeList ta_pmca15 = xDoc.GetElementsByTagName("ta_pmca15");
            XmlNodeList ta_pmca37 = xDoc.GetElementsByTagName("ta_pmca37");
            XmlNodeList ta_pmca38 = xDoc.GetElementsByTagName("ta_pmca38");

            XmlNodeList ta_pmca40 = xDoc.GetElementsByTagName("ta_pmca40");
            XmlNodeList ta_pmca41 = xDoc.GetElementsByTagName("ta_pmca41");

            //產業別---------------
            XmlNodeList ta_pmca42 = xDoc.GetElementsByTagName("ta_pmca42");
            XmlNodeList tc_oah02_8 = xDoc.GetElementsByTagName("tc_oah02-8");
            //------------------
            //2015/0803 ADD  如果為Y則是小於90天原因必key
            XmlNodeList l_day = xDoc.GetElementsByTagName("l_day");
            //2016/1/26 ADD
            XmlNodeList ta_pmca43a = xDoc.GetElementsByTagName("ta_pmca43a");
            XmlNodeList ta_pmca43b = xDoc.GetElementsByTagName("ta_pmca43b");
            XmlNodeList ta_pmca43c = xDoc.GetElementsByTagName("ta_pmca43c");
            XmlNodeList ta_pmca44a = xDoc.GetElementsByTagName("ta_pmca44a");
            XmlNodeList ta_pmca44b = xDoc.GetElementsByTagName("ta_pmca44b");
            XmlNodeList ta_pmca44c = xDoc.GetElementsByTagName("ta_pmca44c");
            XmlNodeList ta_pmca45a = xDoc.GetElementsByTagName("ta_pmca45a");
            XmlNodeList ta_pmca45b = xDoc.GetElementsByTagName("ta_pmca45b");
            XmlNodeList ta_pmca45c = xDoc.GetElementsByTagName("ta_pmca45c");

            XmlNodeList ta_pmca46a = xDoc.GetElementsByTagName("ta_pmca46a");
            XmlNodeList ta_pmca46b = xDoc.GetElementsByTagName("ta_pmca46b");
            XmlNodeList ta_pmca46c = xDoc.GetElementsByTagName("ta_pmca46c");
            XmlNodeList ta_pmca46d = xDoc.GetElementsByTagName("ta_pmca46d");
            XmlNodeList ta_pmca46e = xDoc.GetElementsByTagName("ta_pmca46e");
            XmlNodeList ta_pmca46f = xDoc.GetElementsByTagName("ta_pmca46f");
            XmlNodeList ta_pmca46g = xDoc.GetElementsByTagName("ta_pmca46g");
            XmlNodeList ta_pmca47 = xDoc.GetElementsByTagName("ta_pmca47");
            XmlNodeList ta_pmca48 = xDoc.GetElementsByTagName("ta_pmca48");


            //End 2016/1/26 ADD

            string sno = "";

            //  Response.Write("select * from eipb.dbo.APMI610_IN  where pmk01 = '" + pmk01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
            SmoothEnterprise.Database.DataSet hs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            hs.Open("select * from eipb.dbo.APMI610_IN  where pmcano = '" + pmcano[0].InnerXml.Trim() + "' and plantid='" + plantid[0].InnerXml.Trim() + "' ");//檢查單頭是否有重覆單據號碼
            Utility.log(hs.SQL);
            #region 單號不相同,將資料全數新增

            StringBuilder colnum = new StringBuilder();
            StringBuilder value = new StringBuilder();
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            bool update = true;
            if (hs.EOF)
            {
                rs.Open("SELECT * FROM eipb.dbo.APMI610_IN WHERE 1=0");
                rs.Add();


                EIPSysSha UseSha = new EIPSysSha();
                sno = UseSha.GetNewSn("F501", DateTime.Now.ToString("yyMM"));

                rs["pmcano"] = pmcano[0].InnerXml.Trim();
                rs["pmcsn"] = sno;

            }
            else
            {
                sno = hs["pmcsn"].ToString();
                rs.Open("select * from eipb.dbo.APMI610_IN  where pmcano = '" + pmcano[0].InnerXml.Trim() + "' and plantid='" + plantid[0].InnerXml.Trim() + "' ");//檢查單頭是否有重覆單據號碼

                rs["pmcano"] = pmcano[0].InnerXml.Trim();

                if (rs.EOF)
                {
                    update = false;
                }
            }

            try
            {
                if (update)
                {

                    if (plantid[0].InnerXml != "") rs["plantID"] = plantid[0].InnerXml.Trim();
                    else rs["plantID"] = System.DBNull.Value;

                    colnum.Append("plantID ");
                    value.AppendFormat("'{0}'", plantid[0].InnerXml.Trim());

                    if (pmca00[0].InnerXml != "") rs["pmca00"] = pmca00[0].InnerXml.Trim();
                    else rs["pmca00"] = System.DBNull.Value;

                    colnum.Append(",pmca00 ");
                    value.AppendFormat(",'{0}'", pmca00[0].InnerXml.Trim());

                    if (pmca01[0].InnerXml != "") rs["pmca01"] = pmca01[0].InnerXml.Trim();
                    else rs["pmca01"] = System.DBNull.Value;

                    colnum.Append(",pmca01");
                    value.AppendFormat(",'{0}'", pmca01[0].InnerXml.Trim());

                    if (pmca02[0].InnerXml != "") rs["pmca02"] = pmca02[0].InnerXml.Trim();
                    else rs["pmca02"] = System.DBNull.Value;

                    colnum.Append(",pmca02");
                    value.AppendFormat(",'{0}'", pmca02[0].InnerXml.Trim());

                    if (pmca03[0].InnerXml != "") rs["pmca03"] = pmca03[0].InnerXml.Replace("&amp;", "&");
                    else rs["pmca03"] = System.DBNull.Value;

                    colnum.Append(",pmca03");
                    value.AppendFormat(",'{0}'", pmca03[0].InnerXml.Trim());

                    if (pmca04[0].InnerXml != "") rs["pmca04"] = pmca04[0].InnerXml.Trim();
                    else rs["pmca04"] = System.DBNull.Value;

                    colnum.Append(",pmca04");
                    value.AppendFormat(",'{0}'", pmca04[0].InnerXml.Trim());

                    if (pmca06[0].InnerXml != "") rs["pmca06"] = pmca06[0].InnerXml.Trim();
                    else rs["pmca06"] = System.DBNull.Value;

                    colnum.Append(",pmca06");
                    value.AppendFormat(",'{0}'", pmca06[0].InnerXml.Trim());

                    if (pmca07[0].InnerXml != "") rs["pmca07"] = pmca07[0].InnerXml.Trim();
                    else rs["pmca07"] = System.DBNull.Value;

                    colnum.Append(",pmca07");
                    value.AppendFormat(",'{0}'", pmca07[0].InnerXml.Trim());

                    if (gea02_0[0].InnerXml != "") rs["gea02_0"] = gea02_0[0].InnerXml.Trim();
                    else rs["gea02_0"] = System.DBNull.Value;

                    colnum.Append(",gea02_0");
                    value.AppendFormat(",'{0}'", gea02_0[0].InnerXml.Trim());

                    if (pmca11[0].InnerXml != "") rs["pmca11"] = pmca11[0].InnerXml.Trim();
                    else rs["pmca11"] = System.DBNull.Value;

                    colnum.Append(",pmca11");
                    value.AppendFormat(",'{0}'", pmca11[0].InnerXml.Trim());

                    if (geb02_1[0].InnerXml != "") rs["geb02_1"] = geb02_1[0].InnerXml.Trim();
                    else rs["geb02_1"] = System.DBNull.Value;

                    colnum.Append(",geb02_1");
                    value.AppendFormat(",'{0}'", geb02_1[0].InnerXml.Trim());

                    if (pmca081[0].InnerXml != "") rs["pmca081"] = pmca081[0].InnerXml.Replace("&amp;", "&");
                    else rs["pmca081"] = System.DBNull.Value;

                    colnum.Append(",pmca081");
                    value.AppendFormat(",'{0}'", pmca081[0].InnerXml.Trim());

                    if (pmca082[0].InnerXml != "") rs["pmca082"] = pmca082[0].InnerXml.Trim();
                    else rs["pmca082"] = System.DBNull.Value;
                    //---------------

                    colnum.Append(",pmca082");
                    value.AppendFormat(",'{0}'", pmca082[0].InnerXml.Trim());

                    if (pmca091[0].InnerXml != "") rs["pmca091"] = pmca091[0].InnerXml.Replace("&amp;", "&");
                    else rs["pmca091"] = System.DBNull.Value;

                    colnum.Append(",pmca091");
                    value.AppendFormat(",'{0}'", pmca091[0].InnerXml.Trim());

                    if (pmca092[0].InnerXml != "") rs["pmca092"] = pmca092[0].InnerXml.Trim();
                    else rs["pmca092"] = System.DBNull.Value;

                    colnum.Append(",pmca092");
                    value.AppendFormat(",'{0}'", pmca092[0].InnerXml.Trim());

                    if (pmca093[0].InnerXml != "") rs["pmca093"] = pmca093[0].InnerXml.Trim();
                    else rs["pmca093"] = System.DBNull.Value;

                    colnum.Append(",pmca093");
                    value.AppendFormat(",'{0}'", pmca093[0].InnerXml.Trim());

                    if (pmca094[0].InnerXml != "") rs["pmca094"] = pmca094[0].InnerXml.Trim();
                    else rs["pmca094"] = System.DBNull.Value;

                    colnum.Append(",pmca094");
                    value.AppendFormat(",'{0}'", pmca094[0].InnerXml.Trim());

                    if (pmca095[0].InnerXml != "") rs["pmca095"] = pmca095[0].InnerXml.Trim();
                    else rs["pmca095"] = System.DBNull.Value;
                    //--
                    colnum.Append(",pmca095");
                    value.AppendFormat(",'{0}'", pmca095[0].InnerXml.Trim());

                    if (pmca10[0].InnerXml != "") rs["pmca10"] = pmca10[0].InnerXml.Trim();
                    else rs["pmca10"] = System.DBNull.Value;

                    colnum.Append(",pmca10");
                    value.AppendFormat(",'{0}'", pmca10[0].InnerXml.Trim());

                    if (pmca11[0].InnerXml != "") rs["pmca11"] = pmca11[0].InnerXml.Trim();
                    else rs["pmca11"] = System.DBNull.Value;

                    colnum.Append(",pmca11");
                    value.AppendFormat(",'{0}'", pmca11[0].InnerXml.Trim());

                    if (pmca12[0].InnerXml != "") rs["pmca12"] = pmca12[0].InnerXml.Trim();
                    else rs["pmca12"] = System.DBNull.Value;

                    colnum.Append(",pmca12");
                    value.AppendFormat(",'{0}'", pmca12[0].InnerXml.Trim());

                    if (pmca13[0].InnerXml != "") rs["pmca13"] = pmca13[0].InnerXml.Trim();
                    else rs["pmca13"] = System.DBNull.Value;

                    colnum.Append(",pmca13");
                    value.AppendFormat(",'{0}'", pmca13[0].InnerXml.Trim());

                    if (pmca14[0].InnerXml != "") rs["pmca14"] = pmca14[0].InnerXml.Trim();
                    else rs["pmca14"] = System.DBNull.Value;

                    colnum.Append(",pmca14");
                    value.AppendFormat(",'{0}'", pmca14[0].InnerXml.Trim());

                    if (pmca15[0].InnerXml != "") rs["pmca15"] = pmca15[0].InnerXml.Trim();
                    else rs["pmca15"] = System.DBNull.Value;

                    colnum.Append(",pmca15");
                    value.AppendFormat(",'{0}'", pmca15[0].InnerXml.Trim());

                    if (pmca16[0].InnerXml != "") rs["pmca16"] = pmca16[0].InnerXml.Trim();
                    else rs["pmca16"] = System.DBNull.Value;

                    colnum.Append(",pmca16");
                    value.AppendFormat(",'{0}'", pmca16[0].InnerXml.Trim());

                    if (pmca17[0].InnerXml != "") rs["pmca17"] = pmca17[0].InnerXml.Trim();
                    else rs["pmca17"] = System.DBNull.Value;

                    colnum.Append(",pmca17");
                    value.AppendFormat(",'{0}'", pmca17[0].InnerXml.Trim());

                    if (pma02_2[0].InnerXml != "") rs["pma02_2"] = pma02_2[0].InnerXml.Trim();
                    else rs["pma02_2"] = System.DBNull.Value;

                    colnum.Append(",pma02_2");
                    value.AppendFormat(",'{0}'", pma02_2[0].InnerXml.Trim());

                    if (pmca18[0].InnerXml != "") rs["pmca18"] = pmca18[0].InnerXml.Trim();
                    else rs["pmca18"] = System.DBNull.Value;

                    colnum.Append(",pmca18");
                    value.AppendFormat(",'{0}'", pmca18[0].InnerXml.Trim());

                    if (pmca19[0].InnerXml != "") rs["pmca19"] = pmca19[0].InnerXml.Trim();
                    else rs["pmca19"] = System.DBNull.Value;

                    colnum.Append(",pmca19");
                    value.AppendFormat(",'{0}'", pmca19[0].InnerXml.Trim());

                    if (pmca20[0].InnerXml != "") rs["pmca20"] = pmca20[0].InnerXml.Trim();
                    else rs["pmca20"] = System.DBNull.Value;

                    colnum.Append(",pmca20");
                    value.AppendFormat(",'{0}'", pmca20[0].InnerXml.Trim());

                    if (pmca21[0].InnerXml != "") rs["pmca21"] = pmca21[0].InnerXml.Trim();
                    else rs["pmca21"] = System.DBNull.Value;

                    colnum.Append(",pmca21");
                    value.AppendFormat(",'{0}'", pmca21[0].InnerXml.Trim());

                    if (pmca22[0].InnerXml != "") rs["pmca22"] = pmca22[0].InnerXml.Trim();
                    else rs["pmca22"] = System.DBNull.Value;

                    colnum.Append(",pmca22");
                    value.AppendFormat(",'{0}'", pmca22[0].InnerXml.Trim());

                    if (azi02_3[0].InnerXml != "") rs["azi02_3"] = azi02_3[0].InnerXml.Trim();
                    else rs["azi02_3"] = System.DBNull.Value;

                    colnum.Append(",azi02_3");
                    value.AppendFormat(",'{0}'", azi02_3[0].InnerXml.Trim());

                    //--else rs["pmca18"] = System.DBNull.Value;

                    if (pmca23[0].InnerXml != "") rs["pmca23"] = pmca23[0].InnerXml.Trim();
                    else rs["pmca23"] = System.DBNull.Value;

                    colnum.Append(",pmca23");
                    value.AppendFormat(",'{0}'", pmca23[0].InnerXml.Trim());

                    if (pmca24[0].InnerXml != "") rs["pmca24"] = pmca24[0].InnerXml.Trim();
                    else rs["pmca24"] = System.DBNull.Value;

                    colnum.Append(",pmca24");
                    value.AppendFormat(",'{0}'", pmca24[0].InnerXml.Trim());

                    if (pmca25[0].InnerXml != "") rs["pmca25"] = pmca25[0].InnerXml.Trim();
                    else rs["pmca25"] = System.DBNull.Value;

                    colnum.Append(",pmca25");
                    value.AppendFormat(",'{0}'", pmca25[0].InnerXml.Trim());

                    if (pmca26[0].InnerXml != "") rs["pmca26"] = pmca26[0].InnerXml.Trim();
                    else rs["pmca26"] = System.DBNull.Value;

                    colnum.Append(",pmca26");
                    value.AppendFormat(",'{0}'", pmca26[0].InnerXml.Trim());

                    if (pmca27[0].InnerXml != "") rs["pmca27"] = pmca27[0].InnerXml.Trim();
                    else rs["pmca27"] = System.DBNull.Value;

                    colnum.Append(",pmca27");
                    value.AppendFormat(",'{0}'", pmca27[0].InnerXml.Trim());

                    if (pmca28[0].InnerXml != "") rs["pmca28"] = pmca28[0].InnerXml.Trim();
                    else rs["pmca28"] = System.DBNull.Value;

                    colnum.Append(",pmca28");
                    value.AppendFormat(",'{0}'", pmca28[0].InnerXml.Trim());

                    if (pmca30[0].InnerXml != "") rs["pmca30"] = pmca30[0].InnerXml.Trim();
                    else rs["pmca30"] = System.DBNull.Value;

                    colnum.Append(",pmca30");
                    value.AppendFormat(",'{0}'", pmca30[0].InnerXml.Trim());

                    if (pmca47[0].InnerXml != "") rs["pmca47"] = pmca47[0].InnerXml.Trim();
                    else rs["pmca47"] = System.DBNull.Value;

                    colnum.Append(",pmca47");
                    value.AppendFormat(",'{0}'", pmca47[0].InnerXml.Trim());

                    if (gec02_4[0].InnerXml != "") rs["gec02_4"] = gec02_4[0].InnerXml.Trim();
                    else rs["gec02_4"] = System.DBNull.Value;

                    colnum.Append(",gec02_4");
                    value.AppendFormat(",'{0}'", gec02_4[0].InnerXml.Trim());

                    if (pmca48[0].InnerXml != "") rs["pmca48"] = pmca48[0].InnerXml.Trim();
                    else rs["pmca48"] = System.DBNull.Value;

                    colnum.Append(",pmca48");
                    value.AppendFormat(",'{0}'", pmca48[0].InnerXml.Trim());

                    if (pmca49[0].InnerXml != "") rs["pmca49"] = pmca49[0].InnerXml.Trim();
                    else rs["pmca49"] = System.DBNull.Value;

                    colnum.Append(",pmca49");
                    value.AppendFormat(",'{0}'", pmca49[0].InnerXml.Trim());

                    if (pmca50[0].InnerXml != "") rs["pmca50"] = pmca50[0].InnerXml.Trim();
                    else rs["pmca50"] = System.DBNull.Value;

                    colnum.Append(",pmca50 ");
                    value.AppendFormat(",'{0}'", pmca50[0].InnerXml.Trim());

                    if (pmca51[0].InnerXml != "") rs["pmca51"] = pmca51[0].InnerXml.Trim();
                    else rs["pmca51"] = System.DBNull.Value;

                    colnum.Append(",pmca51 ");
                    value.AppendFormat(",'{0}'", pmca51[0].InnerXml.Trim());

                    if (pmca52[0].InnerXml != "") rs["pmca52"] = pmca52[0].InnerXml.Replace("&amp;", "&");
                    else rs["pmca52"] = System.DBNull.Value;


                    colnum.Append(",pmca52 ");
                    value.AppendFormat(",'{0}'", pmca52[0].InnerXml.Trim());

                    if (pmca53[0].InnerXml != "") rs["pmca53"] = pmca53[0].InnerXml.Replace("&amp;", "&");
                    else rs["pmca53"] = System.DBNull.Value;


                    colnum.Append(",pmca53 ");
                    value.AppendFormat(",'{0}'", pmca53[0].InnerXml.Trim());

                    if (pmca54[0].InnerXml != "") rs["pmca54"] = pmca54[0].InnerXml.Trim();
                    else rs["pmca54"] = System.DBNull.Value;


                    colnum.Append(",pmca54 ");
                    value.AppendFormat(",'{0}'", pmca54[0].InnerXml.Trim());

                    if (pmca55[0].InnerXml != "") rs["pmca55"] = pmca55[0].InnerXml.Trim();
                    else rs["pmca55"] = System.DBNull.Value;

                    colnum.Append(",pmca55 ");
                    value.AppendFormat(",'{0}'", pmca55[0].InnerXml.Trim());


                    if (pmca56[0].InnerXml != "") rs["pmca56"] = pmca56[0].InnerXml.Trim();
                    else rs["pmca56"] = System.DBNull.Value;

                    colnum.Append(",pmca56 ");
                    value.AppendFormat(",'{0}'", pmca56[0].InnerXml.Trim());

                    if (oah02_5[0].InnerXml != "") rs["oah02_5"] = oah02_5[0].InnerXml.Trim();
                    else rs["oah02_5"] = System.DBNull.Value;


                    colnum.Append(",oah02_5 ");
                    value.AppendFormat(",'{0}'", oah02_5[0].InnerXml.Trim());


                    if (pmca901[0].InnerXml != "") rs["pmca901"] = pmca901[0].InnerXml.Trim();
                    else rs["pmca901"] = System.DBNull.Value;

                    colnum.Append(",pmca901 ");
                    value.AppendFormat(",'{0}'", pmca901[0].InnerXml.Trim());

                    if (pmca902[0].InnerXml != "") rs["pmca902"] = pmca902[0].InnerXml.Trim();
                    else rs["pmca902"] = System.DBNull.Value;

                    colnum.Append(",pmca902 ");
                    value.AppendFormat(",'{0}'", pmca902[0].InnerXml.Trim());

                    if (pmca903[0].InnerXml != "") rs["pmca903"] = pmca903[0].InnerXml.Trim();
                    else rs["pmca903"] = System.DBNull.Value;

                    colnum.Append(",pmca903 ");
                    value.AppendFormat(",'{0}'", pmca903[0].InnerXml.Trim());

                    if (pmca904[0].InnerXml != "") rs["pmca904"] = pmca904[0].InnerXml.Trim();
                    else rs["pmca904"] = System.DBNull.Value;

                    colnum.Append(",pmca904 ");
                    value.AppendFormat(",'{0}'", pmca904[0].InnerXml.Trim());

                    if (pmca905[0].InnerXml != "") rs["pmca905"] = pmca905[0].InnerXml.Trim();
                    else rs["pmca905"] = System.DBNull.Value;

                    colnum.Append(",pmca905 ");
                    value.AppendFormat(",'{0}'", pmca905[0].InnerXml.Trim());

                    if (pmca906[0].InnerXml != "") rs["pmca906"] = pmca906[0].InnerXml.Trim();
                    else rs["pmca906"] = System.DBNull.Value;

                    colnum.Append(",pmca906 ");
                    value.AppendFormat(",'{0}'", pmca906[0].InnerXml.Trim());

                    if (pmca907[0].InnerXml != "") rs["pmca907"] = pmca907[0].InnerXml.Trim();
                    else rs["pmca907"] = System.DBNull.Value;

                    colnum.Append(",pmca907 ");
                    value.AppendFormat(",'{0}'", pmca907[0].InnerXml.Trim());

                    if (pmca908[0].InnerXml != "") rs["pmca908"] = pmca908[0].InnerXml.Trim();
                    else rs["pmca908"] = System.DBNull.Value;

                    colnum.Append(",pmca908 ");
                    value.AppendFormat(",'{0}'", pmca908[0].InnerXml.Trim());

                    if (pmca911[0].InnerXml != "") rs["pmca911"] = pmca911[0].InnerXml.Trim();
                    else rs["pmca911"] = System.DBNull.Value;

                    colnum.Append(",pmca911 ");
                    value.AppendFormat(",'{0}'", pmca911[0].InnerXml.Trim());

                    if (pmcaacti[0].InnerXml != "") rs["pmcaacti"] = pmcaacti[0].InnerXml.Trim();
                    else rs["pmcaacti"] = System.DBNull.Value;

                    colnum.Append(",pmcaacti ");
                    value.AppendFormat(",'{0}'", pmcaacti[0].InnerXml.Trim());


                    if (pmcauser[0].InnerXml != "") rs["pmcauser"] = pmcauser[0].InnerXml.Trim();
                    else rs["pmcauser"] = System.DBNull.Value;

                    colnum.Append(",pmcauser ");
                    value.AppendFormat(",'{0}'", pmcauser[0].InnerXml.Trim());

                    if (pmcagrup[0].InnerXml != "") rs["pmcagrup"] = pmcagrup[0].InnerXml.Trim();
                    else rs["pmcagrup"] = System.DBNull.Value;

                    colnum.Append(",pmcagrup ");
                    value.AppendFormat(",'{0}'", pmcagrup[0].InnerXml.Trim());

                    if (pmcamodu[0].InnerXml != "") rs["pmcamodu"] = pmcamodu[0].InnerXml.Trim();
                    else rs["pmcamodu"] = System.DBNull.Value;

                    colnum.Append(",pmcamodu ");
                    value.AppendFormat(",'{0}'", pmcamodu[0].InnerXml.Trim());

                    if (pmcadate[0].InnerXml != "") rs["pmcadate"] = pmcadate[0].InnerXml.Trim();
                    else rs["pmcadate"] = System.DBNull.Value;

                    colnum.Append(",pmcadate ");
                    value.AppendFormat(",'{0}'", pmcadate[0].InnerXml.Trim());

                    if (pmcaud01[0].InnerXml != "") rs["pmcaud01"] = pmcaud01[0].InnerXml.Trim();
                    else rs["pmcaud01"] = System.DBNull.Value;

                    colnum.Append(",pmcaud01 ");
                    value.AppendFormat(",'{0}'", pmcaud01[0].InnerXml.Trim());


                    if (pmcaud02[0].InnerXml != "") rs["pmcaud02"] = pmcaud02[0].InnerXml.Trim();
                    else rs["pmcaud02"] = System.DBNull.Value;

                    colnum.Append(",pmcaud02 ");
                    value.AppendFormat(",'{0}'", pmcaud02[0].InnerXml.Trim());

                    if (pmcaud03[0].InnerXml != "") rs["pmcaud03"] = pmcaud03[0].InnerXml.Trim();
                    else rs["pmcaud03"] = System.DBNull.Value;

                    colnum.Append(",pmcaud03 ");
                    value.AppendFormat(",'{0}'", pmcaud03[0].InnerXml.Trim());

                    if (pmcaud15[0].InnerXml != "") rs["pmcaud15"] = pmcaud15[0].InnerXml.Trim();
                    else rs["pmcaud15"] = System.DBNull.Value;

                    colnum.Append(",pmcaud15 ");
                    value.AppendFormat(",'{0}'", pmcaud15[0].InnerXml.Trim());


                    if (ta_pmca01[0].InnerXml != "") rs["ta_pmca01"] = ta_pmca01[0].InnerXml.Trim();
                    else rs["ta_pmca01"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca01 ");
                    value.AppendFormat(",'{0}'", ta_pmca01[0].InnerXml.Trim());

                    if (ta_pmca02[0].InnerXml != "") rs["ta_pmca02"] = ta_pmca02[0].InnerXml.Trim();
                    else rs["ta_pmca02"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca02 ");
                    value.AppendFormat(",'{0}'", ta_pmca02[0].InnerXml.Trim());

                    if (ta_pmca03[0].InnerXml != "") rs["ta_pmca03"] = ta_pmca03[0].InnerXml.Trim();
                    else rs["ta_pmca03"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca03 ");
                    value.AppendFormat(",'{0}'", ta_pmca03[0].InnerXml.Trim());

                    if (ta_pmca04[0].InnerXml != "") rs["ta_pmca04"] = ta_pmca04[0].InnerXml.Trim();
                    else rs["ta_pmca04"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca04 ");
                    value.AppendFormat(",'{0}'", ta_pmca04[0].InnerXml.Trim());

                    if (ta_pmca05[0].InnerXml != "") rs["ta_pmca05"] = ta_pmca05[0].InnerXml.Trim();
                    else rs["ta_pmca05"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca05 ");
                    value.AppendFormat(",'{0}'", ta_pmca05[0].InnerXml.Trim());

                    if (ta_pmca06[0].InnerXml != "") rs["ta_pmca06"] = ta_pmca06[0].InnerXml.Trim();
                    else rs["ta_pmca06"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca06 ");
                    value.AppendFormat(",'{0}'", ta_pmca06[0].InnerXml.Trim());

                    if (ta_pmca07[0].InnerXml != "") rs["ta_pmca07"] = ta_pmca07[0].InnerXml.Trim();
                    else rs["ta_pmca07"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca07 ");
                    value.AppendFormat(",'{0}'", ta_pmca07[0].InnerXml.Trim());

                    if (ta_pmca08[0].InnerXml != "") rs["ta_pmca08"] = ta_pmca08[0].InnerXml.Trim();
                    else rs["ta_pmca08"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca08 ");
                    value.AppendFormat(",'{0}'", ta_pmca08[0].InnerXml.Trim());

                    if (ta_pmca09[0].InnerXml != "") rs["ta_pmca09"] = ta_pmca09[0].InnerXml.Trim();
                    else rs["ta_pmca09"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca09 ");
                    value.AppendFormat(",'{0}'", ta_pmca09[0].InnerXml.Trim());

                    //
                    if (ta_pmca10[0].InnerXml != "") rs["ta_pmca10"] = ta_pmca10[0].InnerXml.Trim();
                    else rs["ta_pmca10"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca10 ");
                    value.AppendFormat(",'{0}'", ta_pmca10[0].InnerXml.Trim());

                    if (ta_pmca13[0].InnerXml != "") rs["ta_pmca13"] = ta_pmca13[0].InnerXml.Trim();
                    else rs["ta_pmca13"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca13 ");
                    value.AppendFormat(",'{0}'", ta_pmca13[0].InnerXml.Trim());

                    if (ta_pmca14[0].InnerXml != "") rs["ta_pmca14"] = ta_pmca14[0].InnerXml.Trim();
                    else rs["ta_pmca14"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca14 ");
                    value.AppendFormat(",'{0}'", ta_pmca14[0].InnerXml.Trim());

                    if (ta_pmca15[0].InnerXml != "") rs["ta_pmca15"] = ta_pmca15[0].InnerXml.Trim();
                    else rs["ta_pmca15"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca15 ");
                    value.AppendFormat(",'{0}'", ta_pmca15[0].InnerXml.Trim());

                    if (gem02_6[0].InnerXml != "") rs["gem02_6"] = gem02_6[0].InnerXml.Trim();
                    else rs["gem02_6"] = System.DBNull.Value;

                    colnum.Append(",gem02_6 ");
                    value.AppendFormat(",'{0}'", gem02_6[0].InnerXml.Trim());

                    if (pmy02_7[0].InnerXml != "") rs["pmy02_7"] = pmy02_7[0].InnerXml.Trim();
                    else rs["pmy02_7"] = System.DBNull.Value;

                    colnum.Append(",pmy02_7 ");
                    value.AppendFormat(",'{0}'", pmy02_7[0].InnerXml.Trim());

                    if (ta_pmca40[0].InnerXml != "") rs["ta_pmca40"] = ta_pmca40[0].InnerXml.Trim();
                    else rs["ta_pmca40"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca40 ");
                    value.AppendFormat(",'{0}'", ta_pmca40[0].InnerXml.Trim());

                    if (ta_pmca41[0].InnerXml != "") rs["ta_pmca41"] = ta_pmca41[0].InnerXml.Trim();
                    else rs["ta_pmca41"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca41 ");
                    value.AppendFormat(",'{0}'", ta_pmca41[0].InnerXml.Trim());

                    //2015/0803 ADD
                    if (l_day[0].InnerXml != "") rs["l_day"] = l_day[0].InnerXml.Trim();

                    colnum.Append(",l_day ");
                    value.AppendFormat(",'{0}'", l_day[0].InnerXml.Trim());


                    if (ta_pmca42[0].InnerXml != "") rs["ta_pmca42"] = ta_pmca42[0].InnerXml.Trim();
                    else rs["ta_pmca42"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca42 ");
                    value.AppendFormat(",'{0}'", ta_pmca42[0].InnerXml.Trim());

                    if (tc_oah02_8[0].InnerXml != "") rs["tc_oah02_8"] = tc_oah02_8[0].InnerXml.Trim();
                    else rs["tc_oah02_8"] = System.DBNull.Value;

                    colnum.Append(",tc_oah02_8 ");
                    value.AppendFormat(",'{0}'", tc_oah02_8[0].InnerXml.Trim());

                    //2016/1/26
                    if (ta_pmca43a[0].InnerXml != "") rs["ta_pmca43a"] = ta_pmca43a[0].InnerXml.Trim();
                    else rs["ta_pmca43a"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca43a ");
                    value.AppendFormat(",'{0}'", ta_pmca43a[0].InnerXml.Trim());

                    if (ta_pmca43b[0].InnerXml != "") rs["ta_pmca43b"] = ta_pmca43b[0].InnerXml.Trim();
                    else rs["ta_pmca43b"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca43b ");
                    value.AppendFormat(",'{0}'", ta_pmca43b[0].InnerXml.Trim());

                    if (ta_pmca43c[0].InnerXml != "") rs["ta_pmca43c"] = ta_pmca43c[0].InnerXml.Trim();
                    else rs["ta_pmca43c"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca43c ");
                    value.AppendFormat(",'{0}'", ta_pmca43c[0].InnerXml.Trim());

                    if (ta_pmca44a[0].InnerXml != "") rs["ta_pmca44a"] = ta_pmca44a[0].InnerXml.Trim();
                    else rs["ta_pmca44a"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca44a ");
                    value.AppendFormat(",'{0}'", ta_pmca44a[0].InnerXml.Trim());

                    if (ta_pmca44b[0].InnerXml != "") rs["ta_pmca44b"] = ta_pmca44b[0].InnerXml.Trim();
                    else rs["ta_pmca44b"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca44b ");
                    value.AppendFormat(",'{0}'", ta_pmca44b[0].InnerXml.Trim());

                    if (ta_pmca44c[0].InnerXml != "") rs["ta_pmca44c"] = ta_pmca44c[0].InnerXml.Trim();
                    else rs["ta_pmca44c"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca44c ");
                    value.AppendFormat(",'{0}'", ta_pmca44c[0].InnerXml.Trim());


                    if (ta_pmca45a[0].InnerXml != "") rs["ta_pmca45a"] = ta_pmca45a[0].InnerXml.Trim();
                    else rs["ta_pmca45a"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca45a ");
                    value.AppendFormat(",'{0}'", ta_pmca45a[0].InnerXml.Trim());

                    if (ta_pmca45b[0].InnerXml != "") rs["ta_pmca45b"] = ta_pmca45b[0].InnerXml.Trim();
                    else rs["ta_pmca45b"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca45b ");
                    value.AppendFormat(",'{0}'", ta_pmca45b[0].InnerXml.Trim());

                    if (ta_pmca45c[0].InnerXml != "") rs["ta_pmca45c"] = ta_pmca45c[0].InnerXml.Trim();
                    else rs["ta_pmca45c"] = System.DBNull.Value;


                    colnum.Append(",ta_pmca45c ");
                    value.AppendFormat(",'{0}'", ta_pmca45c[0].InnerXml.Trim());

                    if (ta_pmca46a[0].InnerXml != "") rs["ta_pmca46a"] = ta_pmca46a[0].InnerXml.Trim();
                    else rs["ta_pmca46a"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca46a ");
                    value.AppendFormat(",'{0}'", ta_pmca46a[0].InnerXml.Trim());

                    if (ta_pmca46b[0].InnerXml != "") rs["ta_pmca46b"] = ta_pmca46b[0].InnerXml.Trim();
                    else rs["ta_pmca46b"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca46b ");
                    value.AppendFormat(",'{0}'", ta_pmca46b[0].InnerXml.Trim());

                    if (ta_pmca46c[0].InnerXml != "") rs["ta_pmca46c"] = ta_pmca46c[0].InnerXml.Trim();
                    else rs["ta_pmca46c"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca46c ");
                    value.AppendFormat(",'{0}'", ta_pmca46c[0].InnerXml.Trim());

                    if (ta_pmca46d[0].InnerXml != "") rs["ta_pmca46d"] = ta_pmca46d[0].InnerXml.Trim();
                    else rs["ta_pmca46d"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca46d ");
                    value.AppendFormat(",'{0}'", ta_pmca46d[0].InnerXml.Trim());

                    if (ta_pmca46e[0].InnerXml != "") rs["ta_pmca46e"] = ta_pmca46e[0].InnerXml.Trim();
                    else rs["ta_pmca46e"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca46e ");
                    value.AppendFormat(",'{0}'", ta_pmca46e[0].InnerXml.Trim());

                    if (ta_pmca46f[0].InnerXml != "") rs["ta_pmca46f"] = ta_pmca46f[0].InnerXml.Trim();
                    else rs["ta_pmca46f"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca46f ");
                    value.AppendFormat(",'{0}'", ta_pmca46f[0].InnerXml.Trim());

                    if (ta_pmca46g[0].InnerXml != "") rs["ta_pmca46g"] = ta_pmca46g[0].InnerXml.Trim();
                    else rs["ta_pmca46g"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca46g ");
                    value.AppendFormat(",'{0}'", ta_pmca46g[0].InnerXml.Trim());



                    if (ta_pmca47[0].InnerXml != "") rs["ta_pmca47"] = ta_pmca47[0].InnerXml.Trim();
                    else rs["ta_pmca47"] = System.DBNull.Value;

                    colnum.Append(",ta_pmca47 ");
                    value.AppendFormat(",'{0}'", ta_pmca47[0].InnerXml.Trim());


                    if (ta_pmca48[0].InnerXml != "") rs["ta_pmca48"] = ta_pmca48[0].InnerXml.Trim();
                    else rs["ta_pmca48"] = System.DBNull.Value;


                    colnum.Append(",ta_pmca48 ");
                    value.AppendFormat(",'{0}'", ta_pmca48[0].InnerXml.Trim());


                    rs["status"] = "N";

                    colnum.Append(",status ");
                    value.AppendFormat(",'{0}'", "N");
                }

                try
                {
                    rs.Update();
                    rs.Close();
                }
                catch (SqlException ex)
                {
                    Utility.log(ex.InnerException.ToString(), ex.Errors.ToString(), ex.ErrorCode.ToString());
                    throw ex;
                }
                catch (Exception ex)
                {
                    string sql = string.Format("INSERT INTO  eipb.dbo.APMI610_IN ({0}) value({1})", colnum.ToString(), value.ToString());

                    Utility.log("other", ex.Message, ex.StackTrace, ex.InnerException.ToString(), ex.Data.Keys.ToString());

                    throw new Exception(sql, ex);
                }
                recheckvalues(sno);

                #endregion


                //if (System.IO.File.Exists(s.Replace("Download", "XML")))  //判斷在OUT資料夾裡, 檔案是否存在
                //{

                //    File.Delete(s.Replace("Download", "XML"));  //存在的話先刪除該檔案再存入新檔案
                //    File.Move(s, s.Replace("Download", "XML"));
                //}
                //else
                //{
                //    File.Move(s, s.Replace("Download", "XML"));  //不存在直接存入新檔案
                //}

                //發mail---------------------------------------------------------------------------------------------------------------------------
                plant = pmcano[0].InnerXml.Trim(); ERP_No = plantid[0].InnerXml.Trim();

                //Upload("D:\\APMI610_XML\\ERP_XML\\"+ plantid[0].InnerXml + "_apmi610_" + pmcano[0].InnerXml + ".xml", "ftp://192.168.0.250/" + plantid[0].InnerXml + "_apmi610_" + pmcano[0].InnerXml + ".xml", "xmlback", "xmlback");
                // Upload("D:\\APMI610_XML\\ERP_XML\\" + fname, "ftp://192.168.0.250/" + fname, "xmlback", "xmlback"); //update by carol 2018/07/26  與ERP 一致
                //---------------------------------------------------------------------------------------------------------------------------

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
}