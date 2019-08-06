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

public partial class APMI255_IN : SmoothEnterprise.Web.Page 
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    string OK_NO = string.Empty; //單號
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
        {
            db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
            db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 

        }
        /*   ================= 抓 ERP 資料進 EIP =================  */
        // FileRoute 設定..暫存的目錄位置

        string InitDirectory = @"D:\CXMT310_XML\ERP_Download\";

        // 先抓 FTP  的資料
        ArrayList FtpList = List("ftp://192.168.0.250/", "xmluser", "(XmlUser)");

        foreach (string s in FtpList)
        {

            //找到 自己要的檔名!
            if (s.IndexOf("cxmt310") != -1)
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
        //string InitDirectory = @"D:\XML"; //原始目錄

        ArrayList MyFiles = new ArrayList();

        DirectoryInfo di = new DirectoryInfo(InitDirectory);

        // 呼叫上面的函式 Get Files
        GetFiles(di, searchPattern, ref MyFiles);

        //Print it

        foreach (string s in MyFiles)
        {
            //try
            //{
                if (s.IndexOf("cxmt310") != -1)
                {

                    System.Diagnostics.Debug.Write(s);
                    XmlDocument xDoc = new XmlDocument();
                    xDoc.Load((s));


                    XmlNodeList PlantID = xDoc.GetElementsByTagName("PlantID");
                    XmlNodeList l_azp03 = xDoc.GetElementsByTagName("l_azp03");
                    XmlNodeList CompanyName = xDoc.GetElementsByTagName("CompanyName");
                    XmlNodeList ProgramID = xDoc.GetElementsByTagName("ProgramID");
                    XmlNodeList oaydesc = xDoc.GetElementsByTagName("oaydesc");
                    XmlNodeList g_user = xDoc.GetElementsByTagName("g_user");
                    XmlNodeList g_name = xDoc.GetElementsByTagName("g_name");
                    XmlNodeList ta_oqa24 = xDoc.GetElementsByTagName("ta_oqa24");
                    XmlNodeList ta_oqa25 = xDoc.GetElementsByTagName("ta_oqa25");
                    XmlNodeList oqa01 = xDoc.GetElementsByTagName("oqa01");
                   
                    XmlNodeList oqa02 = xDoc.GetElementsByTagName("oqa02");
                    XmlNodeList oqa03 = xDoc.GetElementsByTagName("oqa03");
                    XmlNodeList oqa031 = xDoc.GetElementsByTagName("oqa031");
                    XmlNodeList oqa032 = xDoc.GetElementsByTagName("oqa032");
                    XmlNodeList oqa05 = xDoc.GetElementsByTagName("oqa05");
                    XmlNodeList gem02_0 = xDoc.GetElementsByTagName("gem02-0");
                    XmlNodeList oqa06 = xDoc.GetElementsByTagName("oqa06");
                    XmlNodeList oqa07 = xDoc.GetElementsByTagName("oqa07");
                    XmlNodeList gen02_1 = xDoc.GetElementsByTagName("gen02-1");
                    XmlNodeList oqa08 = xDoc.GetElementsByTagName("oqa08");

                    XmlNodeList oqa09 = xDoc.GetElementsByTagName("oqa09");
                    XmlNodeList oqa10 = xDoc.GetElementsByTagName("oqa10");
                    XmlNodeList oqa12 = xDoc.GetElementsByTagName("oqa12");
                    XmlNodeList oqa13 = xDoc.GetElementsByTagName("oqa13");
                    XmlNodeList oqa14 = xDoc.GetElementsByTagName("oqa14");
                    XmlNodeList oqa15 = xDoc.GetElementsByTagName("oqa15");
                    XmlNodeList oqa16 = xDoc.GetElementsByTagName("oqa16");
                    XmlNodeList oqa17 = xDoc.GetElementsByTagName("oqa17");
                    XmlNodeList oqaconf = xDoc.GetElementsByTagName("oqaconf");
                    XmlNodeList oqaacti = xDoc.GetElementsByTagName("oqaacti");

                    XmlNodeList oqauser = xDoc.GetElementsByTagName("oqauser");
                    XmlNodeList oqagrup = xDoc.GetElementsByTagName("oqagrup");
                    XmlNodeList oqamodu = xDoc.GetElementsByTagName("oqamodu");
                    XmlNodeList oqa011 = xDoc.GetElementsByTagName("oqa011");
                    XmlNodeList ta_oqa01 = xDoc.GetElementsByTagName("ta_oqa01");
                    XmlNodeList ta_oqa011 = xDoc.GetElementsByTagName("ta_oqa011");
                    XmlNodeList ta_oqa012 = xDoc.GetElementsByTagName("ta_oqa012");
                    XmlNodeList ta_oqa013 = xDoc.GetElementsByTagName("ta_oqa013");
                    XmlNodeList ta_oqa014 = xDoc.GetElementsByTagName("ta_oqa014");
                    XmlNodeList ta_oqa015 = xDoc.GetElementsByTagName("ta_oqa015");

                    XmlNodeList ta_oqa016 = xDoc.GetElementsByTagName("ta_oqa016");
                    XmlNodeList ta_oqa017 = xDoc.GetElementsByTagName("ta_oqa017");
                    XmlNodeList ta_oqa018 = xDoc.GetElementsByTagName("ta_oqa018");
                    XmlNodeList ta_oqa021 = xDoc.GetElementsByTagName("ta_oqa021");
                    XmlNodeList tc_oag02_2 = xDoc.GetElementsByTagName("tc_oag02-2");
                    XmlNodeList ta_oqa022 = xDoc.GetElementsByTagName("ta_oqa022");
                    XmlNodeList ta_oqa023 = xDoc.GetElementsByTagName("ta_oqa023");
                    XmlNodeList ta_oqa031 = xDoc.GetElementsByTagName("ta_oqa031");
                    XmlNodeList ta_oqa032 = xDoc.GetElementsByTagName("ta_oqa032");
                    XmlNodeList ta_oqa033 = xDoc.GetElementsByTagName("ta_oqa033");

                    XmlNodeList oag02_3 = xDoc.GetElementsByTagName("oag02-3");
                    XmlNodeList ta_oqa034 = xDoc.GetElementsByTagName("ta_oqa034");
                    XmlNodeList ta_oqa041 = xDoc.GetElementsByTagName("ta_oqa041");
                    XmlNodeList ta_oqa042 = xDoc.GetElementsByTagName("ta_oqa042");
                    XmlNodeList ta_oqa043 = xDoc.GetElementsByTagName("ta_oqa043");
                    XmlNodeList oag02_4 = xDoc.GetElementsByTagName("oag02-4");
                    XmlNodeList ta_oqa044 = xDoc.GetElementsByTagName("ta_oqa044");
                    XmlNodeList ta_oqa051 = xDoc.GetElementsByTagName("ta_oqa051");
                    XmlNodeList ta_oqa052 = xDoc.GetElementsByTagName("ta_oqa052");
                    XmlNodeList ta_oqa053 = xDoc.GetElementsByTagName("ta_oqa053");

                    XmlNodeList oag02_5 = xDoc.GetElementsByTagName("oag02-5");
                    XmlNodeList ta_oqa054 = xDoc.GetElementsByTagName("ta_oqa054");
                    XmlNodeList ta_oqa061 = xDoc.GetElementsByTagName("ta_oqa061");
                    XmlNodeList ta_oqa062 = xDoc.GetElementsByTagName("ta_oqa062");
                    XmlNodeList ta_oqa063 = xDoc.GetElementsByTagName("ta_oqa063");
                    XmlNodeList oag02_6 = xDoc.GetElementsByTagName("oag02-6");
                    XmlNodeList ta_oqa064 = xDoc.GetElementsByTagName("ta_oqa064");
                    XmlNodeList ta_oqa071 = xDoc.GetElementsByTagName("ta_oqa071");
                    XmlNodeList ta_oqa072 = xDoc.GetElementsByTagName("ta_oqa072");
                    XmlNodeList ta_oqa073 = xDoc.GetElementsByTagName("ta_oqa073");

                    XmlNodeList oag02_7 = xDoc.GetElementsByTagName("oag02-7");
                    XmlNodeList ta_oqa074 = xDoc.GetElementsByTagName("ta_oqa074");
                    XmlNodeList ta_oqa010 = xDoc.GetElementsByTagName("ta_oqa010");
                    XmlNodeList ta_oqa019 = xDoc.GetElementsByTagName("ta_oqa019");
                    XmlNodeList ta_oqa17 = xDoc.GetElementsByTagName("ta_oqa17");
                    XmlNodeList ta_oqa171 = xDoc.GetElementsByTagName("ta_oqa171");
                    XmlNodeList ta_oqa024 = xDoc.GetElementsByTagName("ta_oqa024");
                    XmlNodeList tc_oag02_8 = xDoc.GetElementsByTagName("tc_oag02-8");
                    XmlNodeList ta_oqa035 = xDoc.GetElementsByTagName("ta_oqa035");
                    XmlNodeList ta_oqa045 = xDoc.GetElementsByTagName("ta_oqa045");

                    XmlNodeList ta_oqa055 = xDoc.GetElementsByTagName("ta_oqa055");
                    XmlNodeList ta_oqa065 = xDoc.GetElementsByTagName("ta_oqa065");
                    XmlNodeList ta_oqa075 = xDoc.GetElementsByTagName("ta_oqa075");
                    XmlNodeList ta_oqa18 = xDoc.GetElementsByTagName("ta_oqa18");
                    XmlNodeList ta_oqa025 = xDoc.GetElementsByTagName("ta_oqa025");
                    XmlNodeList ta_oqa026 = xDoc.GetElementsByTagName("ta_oqa026");
                    XmlNodeList ta_oqa17x = xDoc.GetElementsByTagName("ta_oqa17x");
                    XmlNodeList ta_oqa17t = xDoc.GetElementsByTagName("ta_oqa17t");
                    XmlNodeList sum = xDoc.GetElementsByTagName("sum");
                    XmlNodeList ta_oqa20 = xDoc.GetElementsByTagName("ta_oqa20");
                    XmlNodeList ta_oqa20x = xDoc.GetElementsByTagName("ta_oqa20x");
                    XmlNodeList ta_oqa20t = xDoc.GetElementsByTagName("ta_oqa20t");
                    XmlNodeList sum1 = xDoc.GetElementsByTagName("sum1");

                    XmlNodeList ta_oqa221 = xDoc.GetElementsByTagName("ta_oqa221");
                    XmlNodeList gec02_9 = xDoc.GetElementsByTagName("gec02-9");
                    XmlNodeList ta_oqa222 = xDoc.GetElementsByTagName("ta_oqa222");
                    XmlNodeList ta_oqa223 = xDoc.GetElementsByTagName("ta_oqa223");
                    XmlNodeList ta_oqa23 = xDoc.GetElementsByTagName("ta_oqa23");
                    XmlNodeList oah02_ = xDoc.GetElementsByTagName("oah02-");
                    XmlNodeList profit = xDoc.GetElementsByTagName("profit");





                    Response.Write("select * from " + db1 + "cxmt310_in_head  where oqa01 = '" + oqa01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' "+"<br>");

                    SmoothEnterprise.Database.DataSet hs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    hs.Open("select * from " + db1 + "cxmt310_in_head  where oqa01 = '" + oqa01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' ");//檢查單頭是否有重覆單據號碼
                    if (!hs.EOF)
                    {
                        if (ta_oqa18[0].InnerXml.ToString().Substring(0, 1) == "R" || ta_oqa18[0].InnerXml.ToString().Substring(0, 1) == "9") //R為erp退回重送9為erp作廢 ((皆以原單號處理))
                        {
                            Response.Write("1");
                            #region 若有相同單號, 已被退回, 單頭UPDATE,單身刪除後新增

                            #region 刪除單身/特別說明/備註

                            SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet();
                            rsb.ExecuteNonQuery("delete  " + db1 + "cxmt310_in_body where  no='" + hs["no"].ToString() + "' and oqb01 = '" + oqa01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "'");
                            rsb.ExecuteNonQuery("delete  " + db1 + "cxmt310_in_oqe where  no='" + hs["no"].ToString() + "' and oqe01 = '" + oqa01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "'");
                            rsb.ExecuteNonQuery("delete  " + db1 + "cxmt310_in_tcoqe where  no='" + hs["no"].ToString() + "' and tc_oqe01 = '" + oqa01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "'");

                            #endregion

                            #region 更新單頭
                            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs.Open("SELECT * FROM " + db1 + "cxmt310_in_head  where no='" + hs["no"].ToString() + "' and oqa01 = '" + oqa01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' ");
                            if (!rs.EOF)
                            {

                                if (PlantID[0].InnerXml != "") rs["PlantID"] = PlantID[0].InnerXml;
                                if (l_azp03[0].InnerXml != "") rs["l_azp03"] = l_azp03[0].InnerXml;
                                if (CompanyName[0].InnerXml != "") rs["CompanyName"] = CompanyName[0].InnerXml;
                                if (ProgramID[0].InnerXml != "") rs["ProgramID"] = ProgramID[0].InnerXml;
                                if (oaydesc[0].InnerXml != "") rs["oaydesc"] = oaydesc[0].InnerXml;
                                if (g_user[0].InnerXml != "") rs["g_user"] = g_user[0].InnerXml;
                                if (g_name[0].InnerXml != "") rs["g_name"] = g_name[0].InnerXml;
                                if (ta_oqa24[0].InnerXml != "") rs["ta_oqa24"] = ta_oqa24[0].InnerXml;
                                if (ta_oqa25[0].InnerXml != "") rs["ta_oqa25"] = ta_oqa25[0].InnerXml;
                                if (oqa01[0].InnerXml != "") rs["oqa01"] = oqa01[0].InnerXml;

                                if (oqa02[0].InnerXml != "") rs["oqa02"] = oqa02[0].InnerXml;
                                if (oqa03[0].InnerXml != "") rs["oqa03"] = oqa03[0].InnerXml;
                                if (oqa031[0].InnerXml != "") rs["oqa031"] = oqa031[0].InnerXml;
                                if (oqa032[0].InnerXml != "") rs["oqa032"] = oqa032[0].InnerXml;
                                if (oqa05[0].InnerXml != "") rs["oqa05"] = oqa05[0].InnerXml;
                                if (gem02_0[0].InnerXml != "") rs["gem02_0"] = gem02_0[0].InnerXml;
                                if (oqa06[0].InnerXml != "") rs["oqa06"] = oqa06[0].InnerXml;
                                if (oqa07[0].InnerXml != "") rs["oqa07"] = oqa07[0].InnerXml;
                                if (gen02_1[0].InnerXml != "") rs["gen02_1"] = gen02_1[0].InnerXml;
                                if (oqa08[0].InnerXml != "") rs["oqa08"] = oqa08[0].InnerXml;

                                if (oqa09[0].InnerXml != "") rs["oqa09"] = oqa09[0].InnerXml;
                                if (oqa10[0].InnerXml != "") rs["oqa10"] = oqa10[0].InnerXml;
                                if (oqa12[0].InnerXml != "") rs["oqa12"] = oqa12[0].InnerXml;
                                if (oqa13[0].InnerXml != "") rs["oqa13"] = oqa13[0].InnerXml;
                                if (oqa14[0].InnerXml != "") rs["oqa14"] = oqa14[0].InnerXml;
                                if (oqa15[0].InnerXml != "") rs["oqa15"] = oqa15[0].InnerXml;
                                if (oqa16[0].InnerXml != "") rs["oqa16"] = oqa16[0].InnerXml;
                                if (oqa17[0].InnerXml != "") rs["oqa17"] = oqa17[0].InnerXml;
                                if (oqaconf[0].InnerXml != "") rs["oqaconf"] = oqaconf[0].InnerXml;
                                if (oqaacti[0].InnerXml != "") rs["oqaacti"] = oqaacti[0].InnerXml;

                                if (oqauser[0].InnerXml != "") rs["oqauser"] = oqauser[0].InnerXml;
                                if (oqagrup[0].InnerXml != "") rs["oqagrup"] = oqagrup[0].InnerXml;
                                if (oqamodu[0].InnerXml != "") rs["oqamodu"] = oqamodu[0].InnerXml;
                                if (oqa011[0].InnerXml != "") rs["oqa011"] = oqa011[0].InnerXml;
                                if (ta_oqa01[0].InnerXml != "") rs["ta_oqa01"] = ta_oqa01[0].InnerXml;
                                if (ta_oqa011[0].InnerXml != "") rs["ta_oqa011"] = ta_oqa011[0].InnerXml;
                                if (ta_oqa012[0].InnerXml != "") rs["ta_oqa012"] = ta_oqa012[0].InnerXml;
                                if (ta_oqa013[0].InnerXml != "") rs["ta_oqa013"] = ta_oqa013[0].InnerXml;
                                if (ta_oqa014[0].InnerXml != "") rs["ta_oqa014"] = ta_oqa014[0].InnerXml;
                                if (ta_oqa015[0].InnerXml != "") rs["ta_oqa015"] = ta_oqa015[0].InnerXml;

                                if (ta_oqa016[0].InnerXml != "") rs["ta_oqa016"] = ta_oqa016[0].InnerXml;
                                if (ta_oqa017[0].InnerXml != "") rs["ta_oqa017"] = ta_oqa017[0].InnerXml;
                                if (ta_oqa018[0].InnerXml != "") rs["ta_oqa018"] = ta_oqa018[0].InnerXml;
                                if (ta_oqa021[0].InnerXml != "") rs["ta_oqa021"] = ta_oqa021[0].InnerXml;
                                if (tc_oag02_2[0].InnerXml != "") rs["tc_oag02_2"] = tc_oag02_2[0].InnerXml;
                                if (ta_oqa022[0].InnerXml != "") rs["ta_oqa022"] = ta_oqa022[0].InnerXml;
                                if (ta_oqa023[0].InnerXml != "") rs["ta_oqa023"] = ta_oqa023[0].InnerXml;
                                if (ta_oqa031[0].InnerXml != "") rs["ta_oqa031"] = ta_oqa031[0].InnerXml;
                                if (ta_oqa032[0].InnerXml != "") rs["ta_oqa032"] = ta_oqa032[0].InnerXml;
                                if (ta_oqa033[0].InnerXml != "") rs["ta_oqa033"] = ta_oqa033[0].InnerXml;

                                if (oag02_3[0].InnerXml != "") rs["oag02_3"] = oag02_3[0].InnerXml;
                                if (ta_oqa034[0].InnerXml != "") rs["ta_oqa034"] = ta_oqa034[0].InnerXml;
                                if (ta_oqa041[0].InnerXml != "") rs["ta_oqa041"] = ta_oqa041[0].InnerXml;
                                if (ta_oqa042[0].InnerXml != "") rs["ta_oqa042"] = ta_oqa042[0].InnerXml;
                                if (ta_oqa043[0].InnerXml != "") rs["ta_oqa043"] = ta_oqa043[0].InnerXml;
                                if (oag02_4[0].InnerXml != "") rs["oag02_4"] = oag02_4[0].InnerXml;
                                if (ta_oqa044[0].InnerXml != "") rs["ta_oqa044"] = ta_oqa044[0].InnerXml;
                                if (ta_oqa051[0].InnerXml != "") rs["ta_oqa051"] = ta_oqa051[0].InnerXml;
                                if (ta_oqa052[0].InnerXml != "") rs["ta_oqa052"] = ta_oqa052[0].InnerXml;
                                if (ta_oqa053[0].InnerXml != "") rs["ta_oqa053"] = ta_oqa053[0].InnerXml;

                                if (oag02_5[0].InnerXml != "") rs["oag02_5"] = oag02_5[0].InnerXml;
                                if (ta_oqa054[0].InnerXml != "") rs["ta_oqa054"] = ta_oqa054[0].InnerXml;
                                if (ta_oqa061[0].InnerXml != "") rs["ta_oqa061"] = ta_oqa061[0].InnerXml;
                                if (ta_oqa062[0].InnerXml != "") rs["ta_oqa062"] = ta_oqa062[0].InnerXml;
                                if (ta_oqa063[0].InnerXml != "") rs["ta_oqa063"] = ta_oqa063[0].InnerXml;
                                if (oag02_6[0].InnerXml != "") rs["oag02_6"] = oag02_6[0].InnerXml;
                                if (ta_oqa064[0].InnerXml != "") rs["ta_oqa064"] = ta_oqa064[0].InnerXml;
                                if (ta_oqa071[0].InnerXml != "") rs["ta_oqa071"] = ta_oqa071[0].InnerXml;
                                if (ta_oqa072[0].InnerXml != "") rs["ta_oqa072"] = ta_oqa072[0].InnerXml;
                                if (ta_oqa073[0].InnerXml != "") rs["ta_oqa073"] = ta_oqa073[0].InnerXml;

                                if (oag02_7[0].InnerXml != "") rs["oag02_7"] = oag02_7[0].InnerXml;
                                if (ta_oqa074[0].InnerXml != "") rs["ta_oqa074"] = ta_oqa074[0].InnerXml;
                                if (ta_oqa010[0].InnerXml != "") rs["ta_oqa010"] = ta_oqa010[0].InnerXml;
                                if (ta_oqa019[0].InnerXml != "") rs["ta_oqa019"] = ta_oqa019[0].InnerXml;
                                if (ta_oqa17[0].InnerXml != "") rs["ta_oqa17"] = ta_oqa17[0].InnerXml;
                                if (ta_oqa171[0].InnerXml != "") rs["ta_oqa171"] = ta_oqa171[0].InnerXml;
                                if (ta_oqa024[0].InnerXml != "") rs["ta_oqa024"] = ta_oqa024[0].InnerXml;
                                if (tc_oag02_8[0].InnerXml != "") rs["tc_oag02_8"] = tc_oag02_8[0].InnerXml;
                                if (ta_oqa035[0].InnerXml != "") rs["ta_oqa035"] = ta_oqa035[0].InnerXml;
                                if (ta_oqa045[0].InnerXml != "") rs["ta_oqa045"] = ta_oqa045[0].InnerXml;

                                if (ta_oqa055[0].InnerXml != "") rs["ta_oqa055"] = ta_oqa055[0].InnerXml;
                                if (ta_oqa065[0].InnerXml != "") rs["ta_oqa065"] = ta_oqa065[0].InnerXml;
                                if (ta_oqa075[0].InnerXml != "") rs["ta_oqa075"] = ta_oqa075[0].InnerXml;
                                if (ta_oqa18[0].InnerXml != "") rs["ta_oqa18"] = ta_oqa18[0].InnerXml;
                                if (ta_oqa025[0].InnerXml != "") rs["ta_oqa025"] = ta_oqa025[0].InnerXml;
                                if (ta_oqa026[0].InnerXml != "") rs["ta_oqa026"] = ta_oqa026[0].InnerXml;
                                if (ta_oqa17x[0].InnerXml != "") rs["ta_oqa17x"] = ta_oqa17x[0].InnerXml;
                                if (ta_oqa17t[0].InnerXml != "") rs["ta_oqa17t"] = ta_oqa17t[0].InnerXml;
                                if (sum[0].InnerXml != "") rs["sum"] = sum[0].InnerXml;
                                if (ta_oqa20[0].InnerXml != "") rs["ta_oqa20"] = ta_oqa20[0].InnerXml;
                                if (ta_oqa20x[0].InnerXml != "") rs["ta_oqa20x"] = ta_oqa20x[0].InnerXml;
                                if (ta_oqa20t[0].InnerXml != "") rs["ta_oqa20t"] = ta_oqa20t[0].InnerXml;
                                if (sum1[0].InnerXml != "") rs["sum1"] = sum1[0].InnerXml;

                                if (ta_oqa221[0].InnerXml != "") rs["ta_oqa221"] = ta_oqa221[0].InnerXml;
                                if (gec02_9[0].InnerXml != "") rs["gec02_9"] = gec02_9[0].InnerXml;
                                if (ta_oqa222[0].InnerXml != "") rs["ta_oqa222"] = ta_oqa222[0].InnerXml;
                                if (ta_oqa223[0].InnerXml != "") rs["ta_oqa223"] = ta_oqa223[0].InnerXml;
                                if (ta_oqa23[0].InnerXml != "") rs["ta_oqa23"] = ta_oqa23[0].InnerXml;
                                if (oah02_[0].InnerXml != "") rs["oah02_"] = oah02_[0].InnerXml;
                                if (profit[0].InnerXml != "") rs["profit"] = profit[0].InnerXml;

                                Response.Write(ta_oqa18[0].InnerXml.ToString().Substring(0, 1));
                                //如果ERP傳來狀況為作廢, 則EIP STATUS UPDATE V
                                if (ta_oqa18[0].InnerXml.ToString().Substring(0, 1) == "9")
                                {
                                    rs["status"] = "V";
                                }
                                else
                                {
                                    rs["status"] = "N";
                                }



                                rs.Update();
                                rs.Close();

                            }
                            #endregion

                            #region 新增單身

                            int cmicNodes = xDoc.GetElementsByTagName("record").Count;
                            for (int i = 0; i <= (cmicNodes - 1); i++)
                            {
                                XmlNodeList oqb02 = xDoc.GetElementsByTagName("oqb02");
                                XmlNodeList oqb03 = xDoc.GetElementsByTagName("oqb03");
                                XmlNodeList oqb031 = xDoc.GetElementsByTagName("oqb031");
                                XmlNodeList oqb032 = xDoc.GetElementsByTagName("oqb032");
                                XmlNodeList oqb04 = xDoc.GetElementsByTagName("oqb04");
                                XmlNodeList oqb05 = xDoc.GetElementsByTagName("oqb05");
                                XmlNodeList ta_oqb17 = xDoc.GetElementsByTagName("ta_oqb17");
                                XmlNodeList ta_oqb12 = xDoc.GetElementsByTagName("ta_oqb12");
                                XmlNodeList ta_oqb13 = xDoc.GetElementsByTagName("ta_oqb13");
                                XmlNodeList oqb07 = xDoc.GetElementsByTagName("oqb07");

                                XmlNodeList oqb08 = xDoc.GetElementsByTagName("oqb08");
                                XmlNodeList ta_oqb01 = xDoc.GetElementsByTagName("ta_oqb01");
                                XmlNodeList ta_oqb02 = xDoc.GetElementsByTagName("ta_oqb02");
                                XmlNodeList ta_oqb03 = xDoc.GetElementsByTagName("ta_oqb03");
                                XmlNodeList ta_oqb04 = xDoc.GetElementsByTagName("ta_oqb04");
                                XmlNodeList ta_oqb091 = xDoc.GetElementsByTagName("ta_oqb091");
                                XmlNodeList ta_oqb092 = xDoc.GetElementsByTagName("ta_oqb092");
                                XmlNodeList ta_oqb093 = xDoc.GetElementsByTagName("ta_oqb093");
                                XmlNodeList ta_oqb09 = xDoc.GetElementsByTagName("ta_oqb09");
                                XmlNodeList oqb09 = xDoc.GetElementsByTagName("oqb09");

                                XmlNodeList ta_oqb10 = xDoc.GetElementsByTagName("ta_oqb10");
                                XmlNodeList oqb10 = xDoc.GetElementsByTagName("oqb10");
                                XmlNodeList ta_oqb11 = xDoc.GetElementsByTagName("ta_oqb11");
                                XmlNodeList oqb11 = xDoc.GetElementsByTagName("oqb11");
                                XmlNodeList ta_oqb07t = xDoc.GetElementsByTagName("ta_oqb07t");
                                XmlNodeList ta_oqb07 = xDoc.GetElementsByTagName("ta_oqb07");
                                XmlNodeList ta_oqb08t = xDoc.GetElementsByTagName("ta_oqb08t");
                                XmlNodeList ta_oqb08 = xDoc.GetElementsByTagName("ta_oqb08");



                                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                rs2.Open("SELECT * FROM " + db1 + "CXMT310_IN_BODY WHERE 1=0");
                                rs2.Add();

                                rs2["PlantID"] = PlantID[0].InnerXml;
                                rs2["oqb01"] = oqa01[0].InnerXml;
                                if (oqb02[i].InnerXml != "") rs2["oqb02"] = i.ToString();
                                if (oqb03[i].InnerXml != "") rs2["oqb03"] = oqb03[i].InnerXml;
                                if (oqb031[i].InnerXml != "") rs2["oqb031"] = oqb031[i].InnerXml;
                                if (oqb032[i].InnerXml != "") rs2["oqb032"] = oqb032[i].InnerXml;
                                if (oqb04[i].InnerXml != "") rs2["oqb04"] = oqb04[i].InnerXml;
                                if (oqb05[i].InnerXml != "") rs2["oqb05"] = oqb05[i].InnerXml;
                                if (ta_oqb17[i].InnerXml != "") rs2["ta_oqb17"] = ta_oqb17[i].InnerXml;
                                if (ta_oqb12[i].InnerXml != "") rs2["ta_oqb12"] = ta_oqb12[i].InnerXml;
                                if (ta_oqb13[i].InnerXml != "") rs2["ta_oqb13"] = ta_oqb13[i].InnerXml;
                                if (oqb07[i].InnerXml != "") rs2["oqb07"] = oqb07[i].InnerXml;

                                if (oqb08[i].InnerXml != "") rs2["oqb08"] = oqb08[i].InnerXml;
                                if (ta_oqb01[i].InnerXml != "") rs2["ta_oqb01"] = ta_oqb01[i].InnerXml;
                                if (ta_oqb02[i].InnerXml != "") rs2["ta_oqb02"] = ta_oqb02[i].InnerXml;
                                if (ta_oqb03[i].InnerXml != "") rs2["ta_oqb03"] = ta_oqb03[i].InnerXml;
                                if (ta_oqb04[i].InnerXml != "") rs2["ta_oqb04"] = ta_oqb04[i].InnerXml;
                                if (ta_oqb091[i].InnerXml != "") rs2["ta_oqb091"] = ta_oqb091[i].InnerXml;
                                if (ta_oqb092[i].InnerXml != "") rs2["ta_oqb092"] = ta_oqb092[i].InnerXml;
                                if (ta_oqb093[i].InnerXml != "") rs2["ta_oqb093"] = ta_oqb093[i].InnerXml;
                                if (ta_oqb09[i].InnerXml != "") rs2["ta_oqb09"] = ta_oqb09[i].InnerXml;
                                if (oqb09[i].InnerXml != "") rs2["oqb09"] = oqb09[i].InnerXml;

                                if (ta_oqb10[i].InnerXml != "") rs2["ta_oqb10"] = ta_oqb10[i].InnerXml;
                                if (oqb10[i].InnerXml != "") rs2["oqb10"] = oqb10[i].InnerXml;
                                if (ta_oqb11[i].InnerXml != "") rs2["ta_oqb11"] = ta_oqb11[i].InnerXml;
                                if (oqb11[i].InnerXml != "") rs2["oqb11"] = oqb11[i].InnerXml;
                                if (ta_oqb07t[i].InnerXml != "") rs2["ta_oqb07t"] = ta_oqb07t[i].InnerXml;
                                if (ta_oqb07[i].InnerXml != "") rs2["ta_oqb07"] = ta_oqb07[i].InnerXml;
                                if (ta_oqb08t[i].InnerXml != "") rs2["ta_oqb08t"] = ta_oqb08t[i].InnerXml;
                                if (ta_oqb08[i].InnerXml != "") rs2["ta_oqb08"] = ta_oqb08[i].InnerXml;

                                rs2["no"] = hs["no"].ToString();
                                rs2["ver"] = hs["ver"].ToString();


                                rs2.Update();
                                rs2.Close();
                            }




                            #endregion

                            #region 新增特別說明及備註

                            int cmicNodes_oqe = xDoc.GetElementsByTagName("oqe").Count;
                            for (int i3 = 0; i3 <= (cmicNodes_oqe - 1); i3++)
                            {
                                XmlNodeList oqe01 = xDoc.GetElementsByTagName("oqe01");
                                XmlNodeList oqe02 = xDoc.GetElementsByTagName("oqe02");
                                XmlNodeList oqe03 = xDoc.GetElementsByTagName("oqe03");
                                XmlNodeList oqe04 = xDoc.GetElementsByTagName("oqe04");


                                if (oqe01[i3].InnerXml.ToString() != "")
                                {
                                    SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                    rs3.Open("SELECT * FROM " + db1 + "CXMT310_IN_OQE WHERE 1=0");
                                    rs3.Add();

                                    rs3["PlantID"] = PlantID[0].InnerXml;
                                    if (oqe01[i3].InnerXml != "") rs3["oqe01"] = oqe01[i3].InnerXml;
                                    if (oqe02[i3].InnerXml != "") rs3["oqe02"] = oqe02[i3].InnerXml;
                                    if (oqe03[i3].InnerXml != "") rs3["oqe03"] = oqe03[i3].InnerXml;
                                    if (oqe04[i3].InnerXml != "") rs3["oqe04"] = oqe04[i3].InnerXml;


                                    rs3["no"] = hs["no"].ToString();
                                    rs3.Update();
                                    rs3.Close();
                                }
                            }

                            int cmicNodes_tc_oqe = xDoc.GetElementsByTagName("tc_oqe").Count;
                            for (int i4 = 0; i4 <= (cmicNodes_tc_oqe - 1); i4++)
                            {
                                XmlNodeList tc_oqe01 = xDoc.GetElementsByTagName("tc_oqe01");
                                XmlNodeList tc_oqe02 = xDoc.GetElementsByTagName("tc_oqe02");
                                XmlNodeList tc_oqe03 = xDoc.GetElementsByTagName("tc_oqe03");
                                XmlNodeList tc_oqe04 = xDoc.GetElementsByTagName("tc_oqe04");

                                if (tc_oqe01[i4].InnerXml.ToString() != "")
                                {
                                    SmoothEnterprise.Database.DataSet rs4 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                    rs4.Open("SELECT * FROM " + db1 + "CXMT310_IN_TCOQE WHERE 1=0");
                                    rs4.Add();

                                    rs4["PlantID"] = PlantID[0].InnerXml;
                                    if (tc_oqe01[i4].InnerXml != "") rs4["tc_oqe01"] = tc_oqe01[i4].InnerXml;
                                    if (tc_oqe02[i4].InnerXml != "") rs4["tc_oqe02"] = tc_oqe02[i4].InnerXml;
                                    if (tc_oqe03[i4].InnerXml != "") rs4["tc_oqe03"] = tc_oqe03[i4].InnerXml;
                                    if (tc_oqe04[i4].InnerXml != "") rs4["tc_oqe04"] = tc_oqe04[i4].InnerXml;


                                    rs4["no"] = hs["no"].ToString();
                                    rs4.Update();
                                    rs4.Close();
                                }
                            }

                            // File.Move(s, s.Replace("Download", "XML"));


                            #endregion


                            #endregion
                        }
                        else
                        {
                            Response.Write("2");

                            #region 單號同,但狀態為送審,ver+1

                            //EIP單號---------------------------------------------------------------------------------------------------

                            EIPSysSha UseSha = new EIPSysSha();
                            OK_NO = UseSha.GetNewSn("P202", DateTime.Now.ToString("yyMM"));

                            //---------------------------------------------------------------------------------------------------------

                            #region 新增單頭
                            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs.Open("SELECT * FROM " + db1 + "cxmt310_IN_HEAD WHERE 1=0");
                            rs.Add();

                            if (PlantID[0].InnerXml != "") rs["PlantID"] = PlantID[0].InnerXml;
                            if (l_azp03[0].InnerXml != "") rs["l_azp03"] = l_azp03[0].InnerXml;
                            if (CompanyName[0].InnerXml != "") rs["CompanyName"] = CompanyName[0].InnerXml;
                            if (ProgramID[0].InnerXml != "") rs["ProgramID"] = ProgramID[0].InnerXml;
                            if (oaydesc[0].InnerXml != "") rs["oaydesc"] = oaydesc[0].InnerXml;
                            if (g_user[0].InnerXml != "") rs["g_user"] = g_user[0].InnerXml;
                            if (g_name[0].InnerXml != "") rs["g_name"] = g_name[0].InnerXml;
                            if (ta_oqa24[0].InnerXml != "") rs["ta_oqa24"] = ta_oqa24[0].InnerXml;
                            if (ta_oqa25[0].InnerXml != "") rs["ta_oqa25"] = ta_oqa25[0].InnerXml;
                            if (oqa01[0].InnerXml != "") rs["oqa01"] = oqa01[0].InnerXml;

                            if (oqa02[0].InnerXml != "") rs["oqa02"] = oqa02[0].InnerXml;
                            if (oqa03[0].InnerXml != "") rs["oqa03"] = oqa03[0].InnerXml;
                            if (oqa031[0].InnerXml != "") rs["oqa031"] = oqa031[0].InnerXml;
                            if (oqa032[0].InnerXml != "") rs["oqa032"] = oqa032[0].InnerXml;
                            if (oqa05[0].InnerXml != "") rs["oqa05"] = oqa05[0].InnerXml;
                            if (gem02_0[0].InnerXml != "") rs["gem02_0"] = gem02_0[0].InnerXml;
                            if (oqa06[0].InnerXml != "") rs["oqa06"] = oqa06[0].InnerXml;
                            if (oqa07[0].InnerXml != "") rs["oqa07"] = oqa07[0].InnerXml;
                            if (gen02_1[0].InnerXml != "") rs["gen02_1"] = gen02_1[0].InnerXml;
                            if (oqa08[0].InnerXml != "") rs["oqa08"] = oqa08[0].InnerXml;

                            if (oqa09[0].InnerXml != "") rs["oqa09"] = oqa09[0].InnerXml;
                            if (oqa10[0].InnerXml != "") rs["oqa10"] = oqa10[0].InnerXml;
                            if (oqa12[0].InnerXml != "") rs["oqa12"] = oqa12[0].InnerXml;
                            if (oqa13[0].InnerXml != "") rs["oqa13"] = oqa13[0].InnerXml;
                            if (oqa14[0].InnerXml != "") rs["oqa14"] = oqa14[0].InnerXml;
                            if (oqa15[0].InnerXml != "") rs["oqa15"] = oqa15[0].InnerXml;
                            if (oqa16[0].InnerXml != "") rs["oqa16"] = oqa16[0].InnerXml;
                            if (oqa17[0].InnerXml != "") rs["oqa17"] = oqa17[0].InnerXml;
                            if (oqaconf[0].InnerXml != "") rs["oqaconf"] = oqaconf[0].InnerXml;
                            if (oqaacti[0].InnerXml != "") rs["oqaacti"] = oqaacti[0].InnerXml;

                            if (oqauser[0].InnerXml != "") rs["oqauser"] = oqauser[0].InnerXml;
                            if (oqagrup[0].InnerXml != "") rs["oqagrup"] = oqagrup[0].InnerXml;
                            if (oqamodu[0].InnerXml != "") rs["oqamodu"] = oqamodu[0].InnerXml;
                            if (oqa011[0].InnerXml != "") rs["oqa011"] = oqa011[0].InnerXml;
                            if (ta_oqa01[0].InnerXml != "") rs["ta_oqa01"] = ta_oqa01[0].InnerXml;
                            if (ta_oqa011[0].InnerXml != "") rs["ta_oqa011"] = ta_oqa011[0].InnerXml;
                            if (ta_oqa012[0].InnerXml != "") rs["ta_oqa012"] = ta_oqa012[0].InnerXml;
                            if (ta_oqa013[0].InnerXml != "") rs["ta_oqa013"] = ta_oqa013[0].InnerXml;
                            if (ta_oqa014[0].InnerXml != "") rs["ta_oqa014"] = ta_oqa014[0].InnerXml;
                            if (ta_oqa015[0].InnerXml != "") rs["ta_oqa015"] = ta_oqa015[0].InnerXml;

                            if (ta_oqa016[0].InnerXml != "") rs["ta_oqa016"] = ta_oqa016[0].InnerXml;
                            if (ta_oqa017[0].InnerXml != "") rs["ta_oqa017"] = ta_oqa017[0].InnerXml;
                            if (ta_oqa018[0].InnerXml != "") rs["ta_oqa018"] = ta_oqa018[0].InnerXml;
                            if (ta_oqa021[0].InnerXml != "") rs["ta_oqa021"] = ta_oqa021[0].InnerXml;
                            if (tc_oag02_2[0].InnerXml != "") rs["tc_oag02_2"] = tc_oag02_2[0].InnerXml;
                            if (ta_oqa022[0].InnerXml != "") rs["ta_oqa022"] = ta_oqa022[0].InnerXml;
                            if (ta_oqa023[0].InnerXml != "") rs["ta_oqa023"] = ta_oqa023[0].InnerXml;
                            if (ta_oqa031[0].InnerXml != "") rs["ta_oqa031"] = ta_oqa031[0].InnerXml;
                            if (ta_oqa032[0].InnerXml != "") rs["ta_oqa032"] = ta_oqa032[0].InnerXml;
                            if (ta_oqa033[0].InnerXml != "") rs["ta_oqa033"] = ta_oqa033[0].InnerXml;

                            if (oag02_3[0].InnerXml != "") rs["oag02_3"] = oag02_3[0].InnerXml;
                            if (ta_oqa034[0].InnerXml != "") rs["ta_oqa034"] = ta_oqa034[0].InnerXml;
                            if (ta_oqa041[0].InnerXml != "") rs["ta_oqa041"] = ta_oqa041[0].InnerXml;
                            if (ta_oqa042[0].InnerXml != "") rs["ta_oqa042"] = ta_oqa042[0].InnerXml;
                            if (ta_oqa043[0].InnerXml != "") rs["ta_oqa043"] = ta_oqa043[0].InnerXml;
                            if (oag02_4[0].InnerXml != "") rs["oag02_4"] = oag02_4[0].InnerXml;
                            if (ta_oqa044[0].InnerXml != "") rs["ta_oqa044"] = ta_oqa044[0].InnerXml;
                            if (ta_oqa051[0].InnerXml != "") rs["ta_oqa051"] = ta_oqa051[0].InnerXml;
                            if (ta_oqa052[0].InnerXml != "") rs["ta_oqa052"] = ta_oqa052[0].InnerXml;
                            if (ta_oqa053[0].InnerXml != "") rs["ta_oqa053"] = ta_oqa053[0].InnerXml;

                            if (oag02_5[0].InnerXml != "") rs["oag02_5"] = oag02_5[0].InnerXml;
                            if (ta_oqa054[0].InnerXml != "") rs["ta_oqa054"] = ta_oqa054[0].InnerXml;
                            if (ta_oqa061[0].InnerXml != "") rs["ta_oqa061"] = ta_oqa061[0].InnerXml;
                            if (ta_oqa062[0].InnerXml != "") rs["ta_oqa062"] = ta_oqa062[0].InnerXml;
                            if (ta_oqa063[0].InnerXml != "") rs["ta_oqa063"] = ta_oqa063[0].InnerXml;
                            if (oag02_6[0].InnerXml != "") rs["oag02_6"] = oag02_6[0].InnerXml;
                            if (ta_oqa064[0].InnerXml != "") rs["ta_oqa064"] = ta_oqa064[0].InnerXml;
                            if (ta_oqa071[0].InnerXml != "") rs["ta_oqa071"] = ta_oqa071[0].InnerXml;
                            if (ta_oqa072[0].InnerXml != "") rs["ta_oqa072"] = ta_oqa072[0].InnerXml;
                            if (ta_oqa073[0].InnerXml != "") rs["ta_oqa073"] = ta_oqa073[0].InnerXml;

                            if (oag02_7[0].InnerXml != "") rs["oag02_7"] = oag02_7[0].InnerXml;
                            if (ta_oqa074[0].InnerXml != "") rs["ta_oqa074"] = ta_oqa074[0].InnerXml;
                            if (ta_oqa010[0].InnerXml != "") rs["ta_oqa010"] = ta_oqa010[0].InnerXml;
                            if (ta_oqa019[0].InnerXml != "") rs["ta_oqa019"] = ta_oqa019[0].InnerXml;
                            if (ta_oqa17[0].InnerXml != "") rs["ta_oqa17"] = ta_oqa17[0].InnerXml;
                            if (ta_oqa171[0].InnerXml != "") rs["ta_oqa171"] = ta_oqa171[0].InnerXml;
                            if (ta_oqa024[0].InnerXml != "") rs["ta_oqa024"] = ta_oqa024[0].InnerXml;
                            if (tc_oag02_8[0].InnerXml != "") rs["tc_oag02_8"] = tc_oag02_8[0].InnerXml;
                            if (ta_oqa035[0].InnerXml != "") rs["ta_oqa035"] = ta_oqa035[0].InnerXml;
                            if (ta_oqa045[0].InnerXml != "") rs["ta_oqa045"] = ta_oqa045[0].InnerXml;

                            if (ta_oqa055[0].InnerXml != "") rs["ta_oqa055"] = ta_oqa055[0].InnerXml;
                            if (ta_oqa065[0].InnerXml != "") rs["ta_oqa065"] = ta_oqa065[0].InnerXml;
                            if (ta_oqa075[0].InnerXml != "") rs["ta_oqa075"] = ta_oqa075[0].InnerXml;
                            if (ta_oqa18[0].InnerXml != "") rs["ta_oqa18"] = ta_oqa18[0].InnerXml;
                            if (ta_oqa025[0].InnerXml != "") rs["ta_oqa025"] = ta_oqa025[0].InnerXml;
                            if (ta_oqa026[0].InnerXml != "") rs["ta_oqa026"] = ta_oqa026[0].InnerXml;
                            if (ta_oqa17x[0].InnerXml != "") rs["ta_oqa17x"] = ta_oqa17x[0].InnerXml;
                            if (ta_oqa17t[0].InnerXml != "") rs["ta_oqa17t"] = ta_oqa17t[0].InnerXml;
                            if (sum[0].InnerXml != "") rs["sum"] = sum[0].InnerXml;
                            if (ta_oqa20[0].InnerXml != "") rs["ta_oqa20"] = ta_oqa20[0].InnerXml;
                            if (ta_oqa20x[0].InnerXml != "") rs["ta_oqa20x"] = ta_oqa20x[0].InnerXml;
                            if (ta_oqa20t[0].InnerXml != "") rs["ta_oqa20t"] = ta_oqa20t[0].InnerXml;
                            if (sum1[0].InnerXml != "") rs["sum1"] = sum1[0].InnerXml;

                            if (ta_oqa221[0].InnerXml != "") rs["ta_oqa221"] = ta_oqa221[0].InnerXml;
                            if (gec02_9[0].InnerXml != "") rs["gec02_9"] = gec02_9[0].InnerXml;
                            if (ta_oqa222[0].InnerXml != "") rs["ta_oqa222"] = ta_oqa222[0].InnerXml;
                            if (ta_oqa223[0].InnerXml != "") rs["ta_oqa223"] = ta_oqa223[0].InnerXml;
                            if (ta_oqa23[0].InnerXml != "") rs["ta_oqa23"] = ta_oqa23[0].InnerXml;
                            if (oah02_[0].InnerXml != "") rs["oah02_"] = oah02_[0].InnerXml;
                            if (profit[0].InnerXml != "") rs["profit"] = profit[0].InnerXml;



                            rs["status"] = "N";
                            rs["no"] = OK_NO;
                            SmoothEnterprise.Database.DataSet ab = new SmoothEnterprise.Database.DataSet();
                            object objolab = ab.ExecuteScalar("SELECT max(ver)+1 ver FROM " + db1 + "cxmt310_in_head where oqa01 = '" + oqa01[0].InnerXml + "' and PlantID='" + PlantID[0].InnerXml + "' ");
                            string ano_oroder = objolab.ToString();
                            rs["ver"] = int.Parse(ano_oroder.ToString());
                            rs.Update();
                            rs.Close();

                            #endregion

                            #region 新增單身

                            int cmicNodes = xDoc.GetElementsByTagName("record").Count;
                            for (int i = 0; i <= (cmicNodes - 1); i++)
                            {
                                XmlNodeList oqb02 = xDoc.GetElementsByTagName("oqb02");
                                XmlNodeList oqb03 = xDoc.GetElementsByTagName("oqb03");
                                XmlNodeList oqb031 = xDoc.GetElementsByTagName("oqb031");
                                XmlNodeList oqb032 = xDoc.GetElementsByTagName("oqb032");
                                XmlNodeList oqb04 = xDoc.GetElementsByTagName("oqb04");
                                XmlNodeList oqb05 = xDoc.GetElementsByTagName("oqb05");
                                XmlNodeList ta_oqb17 = xDoc.GetElementsByTagName("ta_oqb17");
                                XmlNodeList ta_oqb12 = xDoc.GetElementsByTagName("ta_oqb12");
                                XmlNodeList ta_oqb13 = xDoc.GetElementsByTagName("ta_oqb13");
                                XmlNodeList oqb07 = xDoc.GetElementsByTagName("oqb07");

                                XmlNodeList oqb08 = xDoc.GetElementsByTagName("oqb08");
                                XmlNodeList ta_oqb01 = xDoc.GetElementsByTagName("ta_oqb01");
                                XmlNodeList ta_oqb02 = xDoc.GetElementsByTagName("ta_oqb02");
                                XmlNodeList ta_oqb03 = xDoc.GetElementsByTagName("ta_oqb03");
                                XmlNodeList ta_oqb04 = xDoc.GetElementsByTagName("ta_oqb04");
                                XmlNodeList ta_oqb091 = xDoc.GetElementsByTagName("ta_oqb091");
                                XmlNodeList ta_oqb092 = xDoc.GetElementsByTagName("ta_oqb092");
                                XmlNodeList ta_oqb093 = xDoc.GetElementsByTagName("ta_oqb093");
                                XmlNodeList ta_oqb09 = xDoc.GetElementsByTagName("ta_oqb09");
                                XmlNodeList oqb09 = xDoc.GetElementsByTagName("oqb09");

                                XmlNodeList ta_oqb10 = xDoc.GetElementsByTagName("ta_oqb10");
                                XmlNodeList oqb10 = xDoc.GetElementsByTagName("oqb10");
                                XmlNodeList ta_oqb11 = xDoc.GetElementsByTagName("ta_oqb11");
                                XmlNodeList oqb11 = xDoc.GetElementsByTagName("oqb11");
                                XmlNodeList ta_oqb07t = xDoc.GetElementsByTagName("ta_oqb07t");
                                XmlNodeList ta_oqb07 = xDoc.GetElementsByTagName("ta_oqb07");
                                XmlNodeList ta_oqb08t = xDoc.GetElementsByTagName("ta_oqb08t");
                                XmlNodeList ta_oqb08 = xDoc.GetElementsByTagName("ta_oqb08");



                                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                rs2.Open("SELECT * FROM " + db1 + "CXMT310_IN_BODY WHERE 1=0");
                                rs2.Add();

                                rs2["PlantID"] = PlantID[0].InnerXml;
                                rs2["oqb01"] = oqa01[0].InnerXml;
                                if (oqb02[i].InnerXml != "") rs2["oqb02"] = i.ToString();
                                if (oqb03[i].InnerXml != "") rs2["oqb03"] = oqb03[i].InnerXml;
                                if (oqb031[i].InnerXml != "") rs2["oqb031"] = oqb031[i].InnerXml;
                                if (oqb032[i].InnerXml != "") rs2["oqb032"] = oqb032[i].InnerXml;
                                if (oqb04[i].InnerXml != "") rs2["oqb04"] = oqb04[i].InnerXml;
                                if (oqb05[i].InnerXml != "") rs2["oqb05"] = oqb05[i].InnerXml;
                                if (ta_oqb17[i].InnerXml != "") rs2["ta_oqb17"] = ta_oqb17[i].InnerXml;

                               
                                if (ta_oqb12[i].InnerXml != "") rs2["ta_oqb12"] = ta_oqb12[i].InnerXml;
                                if (ta_oqb13[i].InnerXml != "") rs2["ta_oqb13"] = ta_oqb13[i].InnerXml;
                                if (oqb07[i].InnerXml != "") rs2["oqb07"] = oqb07[i].InnerXml;

                                if (oqb08[i].InnerXml != "") rs2["oqb08"] = oqb08[i].InnerXml;
                                if (ta_oqb01[i].InnerXml != "") rs2["ta_oqb01"] = ta_oqb01[i].InnerXml;
                                if (ta_oqb02[i].InnerXml != "") rs2["ta_oqb02"] = ta_oqb02[i].InnerXml;
                                if (ta_oqb03[i].InnerXml != "") rs2["ta_oqb03"] = ta_oqb03[i].InnerXml;
                                if (ta_oqb04[i].InnerXml != "") rs2["ta_oqb04"] = ta_oqb04[i].InnerXml;
                                if (ta_oqb091[i].InnerXml != "") rs2["ta_oqb091"] = ta_oqb091[i].InnerXml;
                                if (ta_oqb092[i].InnerXml != "") rs2["ta_oqb092"] = ta_oqb092[i].InnerXml;
                                if (ta_oqb093[i].InnerXml != "") rs2["ta_oqb093"] = ta_oqb093[i].InnerXml;
                                if (ta_oqb09[i].InnerXml != "") rs2["ta_oqb09"] = ta_oqb09[i].InnerXml;
                                if (oqb09[i].InnerXml != "") rs2["oqb09"] = oqb09[i].InnerXml;

                                if (ta_oqb10[i].InnerXml != "") rs2["ta_oqb10"] = ta_oqb10[i].InnerXml;
                                if (oqb10[i].InnerXml != "") rs2["oqb10"] = oqb10[i].InnerXml;
                                if (ta_oqb11[i].InnerXml != "") rs2["ta_oqb11"] = ta_oqb11[i].InnerXml;
                                if (oqb11[i].InnerXml != "") rs2["oqb11"] = oqb11[i].InnerXml;
                                if (ta_oqb07t[i].InnerXml != "") rs2["ta_oqb07t"] = ta_oqb07t[i].InnerXml;
                                if (ta_oqb07[i].InnerXml != "") rs2["ta_oqb07"] = ta_oqb07[i].InnerXml;
                                if (ta_oqb08t[i].InnerXml != "") rs2["ta_oqb08t"] = ta_oqb08t[i].InnerXml;
                                if (ta_oqb08[i].InnerXml != "") rs2["ta_oqb08"] = ta_oqb08[i].InnerXml;





                                rs2["no"] = OK_NO;
                                rs2["ver"] = int.Parse(ano_oroder.ToString().Trim()) + 1;
                                rs2.Update();
                                rs2.Close();
                            }




                            #endregion

                            #region 新增特別說明及備註

                            int cmicNodes_oqe = xDoc.GetElementsByTagName("oqe").Count;
                            for (int i3 = 0; i3 <= (cmicNodes_oqe - 1); i3++)
                            {
                                XmlNodeList oqe01 = xDoc.GetElementsByTagName("oqe01");
                                XmlNodeList oqe02 = xDoc.GetElementsByTagName("oqe02");
                                XmlNodeList oqe03 = xDoc.GetElementsByTagName("oqe03");
                                XmlNodeList oqe04 = xDoc.GetElementsByTagName("oqe04");


                                if (oqe01[i3].InnerXml.ToString() != "")
                                {
                                    SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                    rs3.Open("SELECT * FROM " + db1 + "CXMT310_IN_OQE WHERE 1=0");
                                    rs3.Add();

                                    rs3["PlantID"] = PlantID[0].InnerXml;
                                    if (oqe01[i3].InnerXml != "") rs3["oqe01"] = oqe01[i3].InnerXml;
                                    if (oqe02[i3].InnerXml != "") rs3["oqe02"] = oqe02[i3].InnerXml;
                                    if (oqe03[i3].InnerXml != "") rs3["oqe03"] = oqe03[i3].InnerXml;
                                    if (oqe04[i3].InnerXml != "") rs3["oqe04"] = oqe04[i3].InnerXml;


                                    rs3["no"] = OK_NO;
                                    rs3.Update();
                                    rs3.Close();
                                }
                            }

                            int cmicNodes_tc_oqe = xDoc.GetElementsByTagName("tc_oqe").Count;
                            for (int i4 = 0; i4 <= (cmicNodes_tc_oqe - 1); i4++)
                            {
                                XmlNodeList tc_oqe01 = xDoc.GetElementsByTagName("tc_oqe01");
                                XmlNodeList tc_oqe02 = xDoc.GetElementsByTagName("tc_oqe02");
                                XmlNodeList tc_oqe03 = xDoc.GetElementsByTagName("tc_oqe03");
                                XmlNodeList tc_oqe04 = xDoc.GetElementsByTagName("tc_oqe04");

                                if (tc_oqe01[i4].InnerXml.ToString() != "")
                                {
                                    SmoothEnterprise.Database.DataSet rs4 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                    rs4.Open("SELECT * FROM " + db1 + "CXMT310_IN_TCOQE WHERE 1=0");
                                    rs4.Add();

                                    rs4["PlantID"] = PlantID[0].InnerXml;
                                    if (tc_oqe01[i4].InnerXml != "") rs4["tc_oqe01"] = tc_oqe01[i4].InnerXml;
                                    if (tc_oqe02[i4].InnerXml != "") rs4["tc_oqe02"] = tc_oqe02[i4].InnerXml;
                                    if (tc_oqe03[i4].InnerXml != "") rs4["tc_oqe03"] = tc_oqe03[i4].InnerXml;
                                    if (tc_oqe04[i4].InnerXml != "") rs4["tc_oqe04"] = tc_oqe04[i4].InnerXml;


                                    rs4["no"] = OK_NO;
                                    rs4.Update();
                                    rs4.Close();
                                }
                            }

                            // File.Move(s, s.Replace("Download", "XML"));


                            #endregion

                            #endregion


                        }
                    }
                    else
                    {
                        Response.Write("3");
                        #region 單號不相同,將資料全數新增
                        
                        //EIP單號---------------------------------------------------------------------------------------------------

                        EIPSysSha UseSha = new EIPSysSha();
                        OK_NO = UseSha.GetNewSn("P202", DateTime.Now.ToString("yyMM"));

                        //---------------------------------------------------------------------------------------------------------

                         #region 新增單頭
                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("SELECT * FROM " + db1 + "cxmt310_IN_HEAD WHERE 1=0");
                        rs.Add();

                        if (PlantID[0].InnerXml != "") rs["PlantID"] = PlantID[0].InnerXml;
                        if (l_azp03[0].InnerXml != "") rs["l_azp03"] = l_azp03[0].InnerXml;
                        if (CompanyName[0].InnerXml != "") rs["CompanyName"] = CompanyName[0].InnerXml;
                        if (ProgramID[0].InnerXml != "") rs["ProgramID"] = ProgramID[0].InnerXml;
                        if (oaydesc[0].InnerXml != "") rs["oaydesc"] = oaydesc[0].InnerXml;
                        if (g_user[0].InnerXml != "") rs["g_user"] = g_user[0].InnerXml;
                        if (g_name[0].InnerXml != "") rs["g_name"] = g_name[0].InnerXml;
                        if (ta_oqa24[0].InnerXml != "") rs["ta_oqa24"] = ta_oqa24[0].InnerXml;
                        if (ta_oqa25[0].InnerXml != "") rs["ta_oqa25"] = ta_oqa25[0].InnerXml;
                        if (oqa01[0].InnerXml != "") rs["oqa01"] = oqa01[0].InnerXml;

                        if (oqa02[0].InnerXml != "") rs["oqa02"] = oqa02[0].InnerXml;
                        if (oqa03[0].InnerXml != "") rs["oqa03"] = oqa03[0].InnerXml;
                        if (oqa031[0].InnerXml != "") rs["oqa031"] = oqa031[0].InnerXml;
                        if (oqa032[0].InnerXml != "") rs["oqa032"] = oqa032[0].InnerXml;
                        if (oqa05[0].InnerXml != "") rs["oqa05"] = oqa05[0].InnerXml;
                        if (gem02_0[0].InnerXml != "") rs["gem02_0"] = gem02_0[0].InnerXml;
                        if (oqa06[0].InnerXml != "") rs["oqa06"] = oqa06[0].InnerXml;
                        if (oqa07[0].InnerXml != "") rs["oqa07"] = oqa07[0].InnerXml;
                        if (gen02_1[0].InnerXml != "") rs["gen02_1"] = gen02_1[0].InnerXml;
                        if (oqa08[0].InnerXml != "") rs["oqa08"] = oqa08[0].InnerXml;

                        if (oqa09[0].InnerXml != "") rs["oqa09"] = oqa09[0].InnerXml;
                        if (oqa10[0].InnerXml != "") rs["oqa10"] = oqa10[0].InnerXml;
                        if (oqa12[0].InnerXml != "") rs["oqa12"] = oqa12[0].InnerXml;
                        if (oqa13[0].InnerXml != "") rs["oqa13"] = oqa13[0].InnerXml;
                        if (oqa14[0].InnerXml != "") rs["oqa14"] = oqa14[0].InnerXml;
                        if (oqa15[0].InnerXml != "") rs["oqa15"] = oqa15[0].InnerXml;
                        if (oqa16[0].InnerXml != "") rs["oqa16"] = oqa16[0].InnerXml;
                        if (oqa17[0].InnerXml != "") rs["oqa17"] = oqa17[0].InnerXml;
                        if (oqaconf[0].InnerXml != "") rs["oqaconf"] = oqaconf[0].InnerXml;
                        if (oqaacti[0].InnerXml != "") rs["oqaacti"] = oqaacti[0].InnerXml;

                        if (oqauser[0].InnerXml != "") rs["oqauser"] = oqauser[0].InnerXml;
                        if (oqagrup[0].InnerXml != "") rs["oqagrup"] = oqagrup[0].InnerXml;
                        if (oqamodu[0].InnerXml != "") rs["oqamodu"] = oqamodu[0].InnerXml;
                        if (oqa011[0].InnerXml != "") rs["oqa011"] = oqa011[0].InnerXml;
                        if (ta_oqa01[0].InnerXml != "") rs["ta_oqa01"] = ta_oqa01[0].InnerXml;
                        if (ta_oqa011[0].InnerXml != "") rs["ta_oqa011"] = ta_oqa011[0].InnerXml;
                        if (ta_oqa012[0].InnerXml != "") rs["ta_oqa012"] = ta_oqa012[0].InnerXml;
                        if (ta_oqa013[0].InnerXml != "") rs["ta_oqa013"] = ta_oqa013[0].InnerXml;
                        if (ta_oqa014[0].InnerXml != "") rs["ta_oqa014"] = ta_oqa014[0].InnerXml;
                        if (ta_oqa015[0].InnerXml != "") rs["ta_oqa015"] = ta_oqa015[0].InnerXml;

                        if (ta_oqa016[0].InnerXml != "") rs["ta_oqa016"] = ta_oqa016[0].InnerXml;
                        if (ta_oqa017[0].InnerXml != "") rs["ta_oqa017"] = ta_oqa017[0].InnerXml;
                        if (ta_oqa018[0].InnerXml != "") rs["ta_oqa018"] = ta_oqa018[0].InnerXml;
                        if (ta_oqa021[0].InnerXml != "") rs["ta_oqa021"] = ta_oqa021[0].InnerXml;
                        if (tc_oag02_2[0].InnerXml != "") rs["tc_oag02_2"] = tc_oag02_2[0].InnerXml;
                        if (ta_oqa022[0].InnerXml != "") rs["ta_oqa022"] = ta_oqa022[0].InnerXml;
                        if (ta_oqa023[0].InnerXml != "") rs["ta_oqa023"] = ta_oqa023[0].InnerXml;
                        if (ta_oqa031[0].InnerXml != "") rs["ta_oqa031"] = ta_oqa031[0].InnerXml;
                        if (ta_oqa032[0].InnerXml != "") rs["ta_oqa032"] = ta_oqa032[0].InnerXml;
                        if (ta_oqa033[0].InnerXml != "") rs["ta_oqa033"] = ta_oqa033[0].InnerXml;

                        if (oag02_3[0].InnerXml != "") rs["oag02_3"] = oag02_3[0].InnerXml;
                        if (ta_oqa034[0].InnerXml != "") rs["ta_oqa034"] = ta_oqa034[0].InnerXml;
                        if (ta_oqa041[0].InnerXml != "") rs["ta_oqa041"] = ta_oqa041[0].InnerXml;
                        if (ta_oqa042[0].InnerXml != "") rs["ta_oqa042"] = ta_oqa042[0].InnerXml;
                        if (ta_oqa043[0].InnerXml != "") rs["ta_oqa043"] = ta_oqa043[0].InnerXml;
                        if (oag02_4[0].InnerXml != "") rs["oag02_4"] = oag02_4[0].InnerXml;
                        if (ta_oqa044[0].InnerXml != "") rs["ta_oqa044"] = ta_oqa044[0].InnerXml;
                        if (ta_oqa051[0].InnerXml != "") rs["ta_oqa051"] = ta_oqa051[0].InnerXml;
                        if (ta_oqa052[0].InnerXml != "") rs["ta_oqa052"] = ta_oqa052[0].InnerXml;
                        if (ta_oqa053[0].InnerXml != "") rs["ta_oqa053"] = ta_oqa053[0].InnerXml;

                        if (oag02_5[0].InnerXml != "") rs["oag02_5"] = oag02_5[0].InnerXml;
                        if (ta_oqa054[0].InnerXml != "") rs["ta_oqa054"] = ta_oqa054[0].InnerXml;
                        if (ta_oqa061[0].InnerXml != "") rs["ta_oqa061"] = ta_oqa061[0].InnerXml;
                        if (ta_oqa062[0].InnerXml != "") rs["ta_oqa062"] = ta_oqa062[0].InnerXml;
                        if (ta_oqa063[0].InnerXml != "") rs["ta_oqa063"] = ta_oqa063[0].InnerXml;
                        if (oag02_6[0].InnerXml != "") rs["oag02_6"] = oag02_6[0].InnerXml;
                        if (ta_oqa064[0].InnerXml != "") rs["ta_oqa064"] = ta_oqa064[0].InnerXml;
                        if (ta_oqa071[0].InnerXml != "") rs["ta_oqa071"] = ta_oqa071[0].InnerXml;
                        if (ta_oqa072[0].InnerXml != "") rs["ta_oqa072"] = ta_oqa072[0].InnerXml;
                        if (ta_oqa073[0].InnerXml != "") rs["ta_oqa073"] = ta_oqa073[0].InnerXml;

                        if (oag02_7[0].InnerXml != "") rs["oag02_7"] = oag02_7[0].InnerXml;
                        if (ta_oqa074[0].InnerXml != "") rs["ta_oqa074"] = ta_oqa074[0].InnerXml;
                        if (ta_oqa010[0].InnerXml != "") rs["ta_oqa010"] = ta_oqa010[0].InnerXml;
                        if (ta_oqa019[0].InnerXml != "") rs["ta_oqa019"] = ta_oqa019[0].InnerXml;
                        if (ta_oqa17[0].InnerXml != "") rs["ta_oqa17"] = ta_oqa17[0].InnerXml;
                        if (ta_oqa171[0].InnerXml != "") rs["ta_oqa171"] = ta_oqa171[0].InnerXml;
                        if (ta_oqa024[0].InnerXml != "") rs["ta_oqa024"] = ta_oqa024[0].InnerXml;
                        if (tc_oag02_8[0].InnerXml != "") rs["tc_oag02_8"] = tc_oag02_8[0].InnerXml;
                        if (ta_oqa035[0].InnerXml != "") rs["ta_oqa035"] = ta_oqa035[0].InnerXml;
                        if (ta_oqa045[0].InnerXml != "") rs["ta_oqa045"] = ta_oqa045[0].InnerXml;

                        if (ta_oqa055[0].InnerXml != "") rs["ta_oqa055"] = ta_oqa055[0].InnerXml;
                        if (ta_oqa065[0].InnerXml != "") rs["ta_oqa065"] = ta_oqa065[0].InnerXml;
                        if (ta_oqa075[0].InnerXml != "") rs["ta_oqa075"] = ta_oqa075[0].InnerXml;
                        if (ta_oqa18[0].InnerXml != "") rs["ta_oqa18"] = ta_oqa18[0].InnerXml;
                        if (ta_oqa025[0].InnerXml != "") rs["ta_oqa025"] = ta_oqa025[0].InnerXml;
                        if (ta_oqa026[0].InnerXml != "") rs["ta_oqa026"] = ta_oqa026[0].InnerXml;
                        if (ta_oqa17x[0].InnerXml != "") rs["ta_oqa17x"] = ta_oqa17x[0].InnerXml;
                        if (ta_oqa17t[0].InnerXml != "") rs["ta_oqa17t"] = ta_oqa17t[0].InnerXml;
                        if (sum[0].InnerXml != "") rs["sum"] = sum[0].InnerXml;
                        if (ta_oqa20[0].InnerXml != "") rs["ta_oqa20"] = ta_oqa20[0].InnerXml;
                        if (ta_oqa20x[0].InnerXml != "") rs["ta_oqa20x"] = ta_oqa20x[0].InnerXml;
                        if (ta_oqa20t[0].InnerXml != "") rs["ta_oqa20t"] = ta_oqa20t[0].InnerXml;
                        if (sum1[0].InnerXml != "") rs["sum1"] = sum1[0].InnerXml;

                        if (ta_oqa221[0].InnerXml != "") rs["ta_oqa221"] = ta_oqa221[0].InnerXml;
                        if (gec02_9[0].InnerXml != "") rs["gec02_9"] = gec02_9[0].InnerXml;
                        if (ta_oqa222[0].InnerXml != "") rs["ta_oqa222"] = ta_oqa222[0].InnerXml;
                        if (ta_oqa223[0].InnerXml != "") rs["ta_oqa223"] = ta_oqa223[0].InnerXml;
                        if (ta_oqa23[0].InnerXml != "") rs["ta_oqa23"] = ta_oqa23[0].InnerXml;
                        if (oah02_[0].InnerXml != "") rs["oah02_"] = oah02_[0].InnerXml;
                        if (profit[0].InnerXml != "") rs["profit"] = profit[0].InnerXml;



                        rs["status"] = "N";
                        rs["no"] = OK_NO;
                        rs["ver"] = 1;

                        rs.Update();
                        rs.Close();

                         #endregion

                         #region 新增單身

                        int cmicNodes = xDoc.GetElementsByTagName("record").Count;
                       // Response.Write("record共" + cmicNodes);
                        for (int i = 0; i <= (cmicNodes - 1); i++)
                        {
                            XmlNodeList oqb02 = xDoc.GetElementsByTagName("oqb02");
                            XmlNodeList oqb03 = xDoc.GetElementsByTagName("oqb03");
                            XmlNodeList oqb031 = xDoc.GetElementsByTagName("oqb031");
                            XmlNodeList oqb032 = xDoc.GetElementsByTagName("oqb032");
                            XmlNodeList oqb04 = xDoc.GetElementsByTagName("oqb04");
                            XmlNodeList oqb05 = xDoc.GetElementsByTagName("oqb05");
                            XmlNodeList ta_oqb17 = xDoc.GetElementsByTagName("ta_oqb17");
                            XmlNodeList ta_oqb12 = xDoc.GetElementsByTagName("ta_oqb12");
                            XmlNodeList ta_oqb13 = xDoc.GetElementsByTagName("ta_oqb13");
                            XmlNodeList oqb07 = xDoc.GetElementsByTagName("oqb07");

                            XmlNodeList oqb08 = xDoc.GetElementsByTagName("oqb08");
                            XmlNodeList ta_oqb01 = xDoc.GetElementsByTagName("ta_oqb01");
                            XmlNodeList ta_oqb02 = xDoc.GetElementsByTagName("ta_oqb02");
                            XmlNodeList ta_oqb03 = xDoc.GetElementsByTagName("ta_oqb03");
                            XmlNodeList ta_oqb04 = xDoc.GetElementsByTagName("ta_oqb04");
                            XmlNodeList ta_oqb091 = xDoc.GetElementsByTagName("ta_oqb091");
                            XmlNodeList ta_oqb092 = xDoc.GetElementsByTagName("ta_oqb092");
                            XmlNodeList ta_oqb093 = xDoc.GetElementsByTagName("ta_oqb093");
                            XmlNodeList ta_oqb09 = xDoc.GetElementsByTagName("ta_oqb09");
                            XmlNodeList oqb09 = xDoc.GetElementsByTagName("oqb09");

                            XmlNodeList ta_oqb10 = xDoc.GetElementsByTagName("ta_oqb10");
                            XmlNodeList oqb10 = xDoc.GetElementsByTagName("oqb10");
                            XmlNodeList ta_oqb11 = xDoc.GetElementsByTagName("ta_oqb11");
                            XmlNodeList oqb11 = xDoc.GetElementsByTagName("oqb11");
                            XmlNodeList ta_oqb07t = xDoc.GetElementsByTagName("ta_oqb07t");
                            XmlNodeList ta_oqb07 = xDoc.GetElementsByTagName("ta_oqb07");
                            XmlNodeList ta_oqb08t = xDoc.GetElementsByTagName("ta_oqb08t");
                            XmlNodeList ta_oqb08 = xDoc.GetElementsByTagName("ta_oqb08");



                            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs2.Open("SELECT * FROM " + db1 + "CXMT310_IN_BODY WHERE 1=0");
                            rs2.Add();
                            rs2["PlantID"] = PlantID[0].InnerXml;
                            rs2["oqb01"] = oqa01[0].InnerXml;
                            if (oqb02[i].InnerXml != "") rs2["oqb02"] = i.ToString();
                            if (oqb03[i].InnerXml != "") rs2["oqb03"] = oqb03[i].InnerXml;
                            if (oqb031[i].InnerXml != "") rs2["oqb031"] = oqb031[i].InnerXml;
                            if (oqb032[i].InnerXml != "") rs2["oqb032"] = oqb032[i].InnerXml;
                            if (oqb04[i].InnerXml != "") rs2["oqb04"] = oqb04[i].InnerXml;
                            if (oqb05[i].InnerXml != "") rs2["oqb05"] = oqb05[i].InnerXml;
                            if (ta_oqb17[i].InnerXml != "") rs2["ta_oqb17"] = ta_oqb17[i].InnerXml;


                             
                            if (ta_oqb12[i].InnerXml != "") rs2["ta_oqb12"] = ta_oqb12[i].InnerXml;
                            if (ta_oqb13[i].InnerXml != "") rs2["ta_oqb13"] = ta_oqb13[i].InnerXml;
                            if (oqb07[i].InnerXml != "") rs2["oqb07"] = oqb07[i].InnerXml;

                            if (oqb08[i].InnerXml != "") rs2["oqb08"] = oqb08[i].InnerXml;
                            if (ta_oqb01[i].InnerXml != "") rs2["ta_oqb01"] = ta_oqb01[i].InnerXml;
                            if (ta_oqb02[i].InnerXml != "") rs2["ta_oqb02"] = ta_oqb02[i].InnerXml;
                            if (ta_oqb03[i].InnerXml != "") rs2["ta_oqb03"] = ta_oqb03[i].InnerXml;
                            if (ta_oqb04[i].InnerXml != "") rs2["ta_oqb04"] = ta_oqb04[i].InnerXml;
                            if (ta_oqb091[i].InnerXml != "") rs2["ta_oqb091"] = ta_oqb091[i].InnerXml;
                            if (ta_oqb092[i].InnerXml != "") rs2["ta_oqb092"] = ta_oqb092[i].InnerXml;
                            if (ta_oqb093[i].InnerXml != "") rs2["ta_oqb093"] = ta_oqb093[i].InnerXml;
                            if (ta_oqb09[i].InnerXml != "") rs2["ta_oqb09"] = ta_oqb09[i].InnerXml;
                            if (oqb09[i].InnerXml != "") rs2["oqb09"] = oqb09[i].InnerXml;

                            if (ta_oqb10[i].InnerXml != "") rs2["ta_oqb10"] = ta_oqb10[i].InnerXml;
                            if (oqb10[i].InnerXml != "") rs2["oqb10"] = oqb10[i].InnerXml;
                            if (ta_oqb11[i].InnerXml != "") rs2["ta_oqb11"] = ta_oqb11[i].InnerXml;
                            if (oqb11[i].InnerXml != "") rs2["oqb11"] = oqb11[i].InnerXml;
                            if (ta_oqb07t[i].InnerXml != "") rs2["ta_oqb07t"] = ta_oqb07t[i].InnerXml;
                            if (ta_oqb07[i].InnerXml != "") rs2["ta_oqb07"] = ta_oqb07[i].InnerXml;
                            if (ta_oqb08t[i].InnerXml != "") rs2["ta_oqb08t"] = ta_oqb08t[i].InnerXml;
                            if (ta_oqb08[i].InnerXml != "") rs2["ta_oqb08"] = ta_oqb08[i].InnerXml;
                            




                            rs2["no"] = OK_NO;
                            rs2["ver"] = 1;
                            rs2.Update();
                            rs2.Close();
                        }




                        #endregion

                        #region 新增特別說明及備註

                        int cmicNodes_oqe = xDoc.GetElementsByTagName("oqe").Count;
                        for (int i3 = 0; i3 <= (cmicNodes_oqe - 1); i3++)
                        {
                            XmlNodeList oqe01 = xDoc.GetElementsByTagName("oqe01");
                            XmlNodeList oqe02 = xDoc.GetElementsByTagName("oqe02");
                            XmlNodeList oqe03 = xDoc.GetElementsByTagName("oqe03");
                            XmlNodeList oqe04 = xDoc.GetElementsByTagName("oqe04");


                            if (oqe01[i3].InnerXml.ToString() != "")
                            {
                                SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                rs3.Open("SELECT * FROM " + db1 + "CXMT310_IN_OQE WHERE 1=0");
                                rs3.Add();

                                rs3["PlantID"] = PlantID[0].InnerXml;
                                if (oqe01[i3].InnerXml != "") rs3["oqe01"] = oqe01[i3].InnerXml;
                                if (oqe02[i3].InnerXml != "") rs3["oqe02"] = oqe02[i3].InnerXml;
                                if (oqe03[i3].InnerXml != "") rs3["oqe03"] = oqe03[i3].InnerXml;
                                if (oqe04[i3].InnerXml != "") rs3["oqe04"] = oqe04[i3].InnerXml;


                                rs3["no"] = OK_NO;
                                rs3.Update();
                                rs3.Close();
                            }
                        }

                        int cmicNodes_tc_oqe = xDoc.GetElementsByTagName("tc_oqe").Count;
                        for (int i4 = 0; i4 <= (cmicNodes_tc_oqe - 1); i4++)
                        {
                            XmlNodeList tc_oqe01 = xDoc.GetElementsByTagName("tc_oqe01");
                            XmlNodeList tc_oqe02 = xDoc.GetElementsByTagName("tc_oqe02");
                            XmlNodeList tc_oqe03 = xDoc.GetElementsByTagName("tc_oqe03");
                            XmlNodeList tc_oqe04 = xDoc.GetElementsByTagName("tc_oqe04");

                            if (tc_oqe01[i4].InnerXml.ToString() != "")
                            {
                                SmoothEnterprise.Database.DataSet rs4 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                rs4.Open("SELECT * FROM " + db1 + "CXMT310_IN_TCOQE WHERE 1=0");
                                rs4.Add();

                                rs4["PlantID"] = PlantID[0].InnerXml;
                                if (tc_oqe01[i4].InnerXml != "") rs4["tc_oqe01"] = tc_oqe01[i4].InnerXml;
                                if (tc_oqe02[i4].InnerXml != "") rs4["tc_oqe02"] = tc_oqe02[i4].InnerXml;
                                if (tc_oqe03[i4].InnerXml != "") rs4["tc_oqe03"] = tc_oqe03[i4].InnerXml;
                                if (tc_oqe04[i4].InnerXml != "") rs4["tc_oqe04"] = tc_oqe04[i4].InnerXml;


                                rs4["no"] = OK_NO;
                                rs4.Update();
                                rs4.Close();
                            }
                        }

                       // File.Move(s, s.Replace("Download", "XML"));


                        #endregion

                         #endregion
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
                       

                    //發mail---------------------------------------------------------------------------------------------------------------------------

                    string ta_oqa18_string = ta_oqa18[0].InnerXml;
                    Response.Write(ta_oqa18_string);
                    if (ta_oqa18_string.ToString().Substring(0, 1) != "9")  //作廢
                    {
                        Response.Write("<br>====" + ta_oqa18[0].InnerXml);

                        String ques;
                        SmoothEnterprise.Database.DataSet es = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        es.Open("select email," + db1 + "cxmt310_in_head.id id  from " + db1 + "cxmt310_in_head  LEFT JOIN " + db2 + "dguser ON g_user=erpid where oqa01 = '" + oqa01[0].InnerXml + "' and plantid='" + PlantID[0].InnerXml + "'  and no='" + OK_NO.ToString() + "' ");
                        if (!es.EOF)
                        {
                            MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                            MailAddress to = new MailAddress(es["email"].ToString());

                            MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                            MailMessage message = new MailMessage(from, to);
                            message.Bcc.Add(bcc);

                            ques = "您好:" + "<br>" +
                                   "<br>" +
                                   "ERP報價電子簽核申請單現有一筆，正等待您的處理:" + "<br>" +
                                   "<br>" +
                                   "申請單號 : " + oqa01[0].InnerXml + "<br>" +
                                   "申請日期 : " + oqa02[0].InnerXml + "<br>" +
                                   "申請人員 : " + g_name[0].InnerXml + "<br>" +
                                   "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_CXMT310/CXMT310Edit.aspx?id=" + es["id"].ToString() + "\" >至ERP報價電子簽核系統檢視並編輯內容</a>" +
                                   "<br>" +
                                   "<br>" +
                                   "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                   "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                   "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                            message.Subject = "報價單號 - " + oqa01[0].InnerXml + " 等待您的處理";
                            message.IsBodyHtml = true;
                            message.Body = ques;

                            SmtpClient client = new SmtpClient("192.168.0.12");

                            client.Send(message);

                            Response.Write("Mail傳送完畢" + "<br>");


                        }
                    }

                    Upload("D:\\CXMT310_XML\\ERP_XML\\" + PlantID[0].InnerXml + "_cxmt310_" + oqa01[0].InnerXml + ".xml", "ftp://192.168.0.250/" + PlantID[0].InnerXml + "_CXMT310_" + oqa01[0].InnerXml + ".xml", "xmlback", "xmlback");

                    //---------------------------------------------------------------------------------------------------------------------------
                }
            //}
            //catch (Exception ex)
            //{
            //    Response.Write("ERROR<BR>");
                //string s1 = s.Replace(".xml", "");
                //s1 = s1.Replace("D:\\APMI255_XML\\ERP_Download\\", "");
                //int sone = s1.IndexOf("_");
                //int stwo = s1.LastIndexOf("_");
                //stwo = stwo + 1;
                //FileStream fs = new FileStream(@"D:\APMI255_XML\4GL\" + s1 + ".txt", FileMode.Create, FileAccess.Write);

                //StreamWriter sw = new StreamWriter(fs);
                //sw.WriteLine("\"" + s1.Substring(0, sone) + "\",\"apmi255\",\"" + s1.Substring(stwo, 10) + "\",\"E\",\"\"");
                //sw.Close();
                //fs.Close();
                //Upload(fs.ToString(), "ftp://192.168.0.250/" + s1.ToString() + ".txt", "4gl", "4gl");


                ////發mail---------------------------------------------------------------------------------------------------------------------------
                //String ques;

                //MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                //MailAddress to = new MailAddress("ann.lin@minaik.com.tw");

                //MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                //MailMessage message = new MailMessage(from, to);
                //message.Bcc.Add(bcc);

                //ques = "有問題";

                //message.Subject = "ERP採購核價有問題";
                //message.IsBodyHtml = true;
                //message.Body = ques;

                //SmtpClient client = new SmtpClient("192.168.0.12");

                //client.Send(message);

                //Response.Write("ERP採購核價有問題" + "<br>");

                

                
                //---------------------------------------------------------------------------------------------------------------------------

 
            //}
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