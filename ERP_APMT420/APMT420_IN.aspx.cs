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


public partial class APMT420_IN : SmoothEnterprise.Web.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

        /*   ================= 抓 ERP 資料進 EIP =================  */
        // FileRoute 設定..暫存的目錄位置
        string InitDirectory = @"D:\APMT420_XML\ERP_Download\";

        // 先抓 FTP  的資料
        ArrayList FtpList = List("ftp://192.168.0.250/", "xmluser", "(XmlUser)");

        foreach (string s in FtpList)
        {
            //Response.Write("AAA");
            Response.Write(s.ToString());
            //找到 自己要的檔名!
            if (s.IndexOf("apmt420") != -1)
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

            Response.Write("<br>--"+s.ToString());
            try
            {
                if (s.IndexOf("apmt420") != -1)
                {
                    Response.Write("yes");


                    Response.Write("---------" + s.IndexOf("_") + "<br>");
                    System.Diagnostics.Debug.Write(s);
                    //this.textBox3.AppendText(s + "\n");
                    Response.Write(s + "\n");
                    XmlDocument xDoc = new XmlDocument();
                    xDoc.Load((s));
                    XmlNodeList plantid = xDoc.GetElementsByTagName("PlantID");
                    XmlNodeList pmk01 = xDoc.GetElementsByTagName("pmk01");
                    XmlNodeList pmk02 = xDoc.GetElementsByTagName("pmk02");
                    XmlNodeList pmk03 = xDoc.GetElementsByTagName("pmk03");
                    XmlNodeList pmk04 = xDoc.GetElementsByTagName("pmk04");
                    XmlNodeList pmk06 = xDoc.GetElementsByTagName("pmk06");
                    XmlNodeList pmk09 = xDoc.GetElementsByTagName("pmk09");
                    XmlNodeList pmc03 = xDoc.GetElementsByTagName("pmc03-0");
                    XmlNodeList pmk10 = xDoc.GetElementsByTagName("pmk10");
                    XmlNodeList pme031_1 = xDoc.GetElementsByTagName("pme031-1");
                    XmlNodeList pmk11 = xDoc.GetElementsByTagName("pmk11");
                    XmlNodeList pme031_2 = xDoc.GetElementsByTagName("pme031-2");
                    XmlNodeList pmk12 = xDoc.GetElementsByTagName("pmk12");
                    XmlNodeList gen02_3 = xDoc.GetElementsByTagName("gen02-3");
                    XmlNodeList pmk13 = xDoc.GetElementsByTagName("pmk13");
                    XmlNodeList gem02_4 = xDoc.GetElementsByTagName("gem02-4");
                    XmlNodeList pmk14 = xDoc.GetElementsByTagName("pmk14");
                    XmlNodeList gem02_5 = xDoc.GetElementsByTagName("gem02-5");
                    XmlNodeList pmk15 = xDoc.GetElementsByTagName("pmk15");
                    XmlNodeList gen02_6 = xDoc.GetElementsByTagName("gen02-6");
                    XmlNodeList pmk16 = xDoc.GetElementsByTagName("pmk16");
                    XmlNodeList pmk17 = xDoc.GetElementsByTagName("pmk17");
                    XmlNodeList pmc03_7 = xDoc.GetElementsByTagName("pmc03-7");
                    XmlNodeList pmk20 = xDoc.GetElementsByTagName("pmk20");
                    XmlNodeList pma02_8 = xDoc.GetElementsByTagName("pma02-8");
                    XmlNodeList pmk21 = xDoc.GetElementsByTagName("pmk21");
                    XmlNodeList pmk22 = xDoc.GetElementsByTagName("pmk22");
                    XmlNodeList pmk41 = xDoc.GetElementsByTagName("pmk41");
                    XmlNodeList oah02_9 = xDoc.GetElementsByTagName("oah02-9");
                    XmlNodeList pmk42 = xDoc.GetElementsByTagName("pmk42");
                    XmlNodeList pmk43 = xDoc.GetElementsByTagName("pmk43");
                    XmlNodeList ta_pmk01 = xDoc.GetElementsByTagName("ta_pmk01");
                    XmlNodeList pmk18 = xDoc.GetElementsByTagName("pmk18");
                    XmlNodeList l_amt1 = xDoc.GetElementsByTagName("l_amt1");
                    XmlNodeList l_amt2 = xDoc.GetElementsByTagName("l_amt2");

                    Response.Write("select * from apmt420_in_head  where pmk01 = '" + pmk01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
                   SmoothEnterprise.Database.DataSet hs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    hs.Open("select * from apmt420_in_head  where pmk01 = '" + pmk01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");//檢查單頭是否有重覆單據號碼
                    if (!hs.EOF)
                    {
                        Response.Write("相同");
                        #region 若有相同單號, 單頭UPDATE,單身刪除後新增
                        ////刪除
                        //SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet();
                        //rsa.ExecuteNonQuery("delete  apmt420_in_head where pmk01 = '" + pmk01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "'");
                        SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet();
                        rsb.ExecuteNonQuery("delete  apmt420_in_body where pmk01 = '" + pmk01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "'");
                        ////

                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("SELECT * FROM APMT420_IN_HEAD  where pmk01 = '" + pmk01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
                        if (!rs.EOF)
                        {
                            //rs.Add();
                            if (plantid[0].InnerXml != "") rs["plantID"] = plantid[0].InnerXml;
                            if (pmk01[0].InnerXml != "") rs["pmk01"] = pmk01[0].InnerXml;
                            if (pmk02[0].InnerXml != "") rs["pmk02"] = pmk02[0].InnerXml;
                            if (pmk03[0].InnerXml != "") rs["pmk03"] = pmk03[0].InnerXml;
                            if (pmk04[0].InnerXml != "") rs["pmk04"] = pmk04[0].InnerXml;
                            if (pmk06[0].InnerXml != "") rs["pmk06"] = pmk06[0].InnerXml;
                            if (pmk09[0].InnerXml != "") rs["pmk09"] = pmk09[0].InnerXml;
                            if (pmc03[0].InnerXml != "") rs["pmc03"] = pmc03[0].InnerXml;
                            if (pmk10[0].InnerXml != "") rs["pmk10"] = pmk10[0].InnerXml;
                            if (pme031_1[0].InnerXml != "") rs["pme031_1"] = pme031_1[0].InnerXml;
                            if (pmk11[0].InnerXml != "") rs["pmk11"] = pmk11[0].InnerXml;
                            if (pme031_2[0].InnerXml != "") rs["pme031_2"] = pme031_2[0].InnerXml;
                            if (pmk12[0].InnerXml != "") rs["pmk12"] = pmk12[0].InnerXml;
                            if (gen02_3[0].InnerXml != "") rs["gen02_3"] = gen02_3[0].InnerXml;
                            if (pmk13[0].InnerXml != "") rs["pmk13"] = pmk13[0].InnerXml;
                            if (gem02_4[0].InnerXml != "") rs["gem02_4"] = gem02_4[0].InnerXml;
                            if (pmk14[0].InnerXml != "") rs["pmk14"] = pmk14[0].InnerXml;
                            if (gem02_5[0].InnerXml != "") rs["gem02_5"] = gem02_5[0].InnerXml;
                            if (pmk15[0].InnerXml != "") rs["pmk15"] = pmk15[0].InnerXml;
                            if (gen02_6[0].InnerXml != "") rs["gen02_6"] = gen02_6[0].InnerXml;
                            if (pmk16[0].InnerXml != "") rs["pmk16"] = pmk16[0].InnerXml;
                            if (pmk17[0].InnerXml != "") rs["pmk17"] = pmk17[0].InnerXml;
                            if (pmc03_7[0].InnerXml != "") rs["pmc03_7"] = pmc03_7[0].InnerXml;
                            if (pmk20[0].InnerXml != "") rs["pmk20"] = pmk20[0].InnerXml;
                            if (pma02_8[0].InnerXml != "") rs["pma02_8"] = pma02_8[0].InnerXml;
                            if (pmk21[0].InnerXml != "") rs["pmk21"] = pmk21[0].InnerXml;
                            if (pmk22[0].InnerXml != "") rs["pmk22"] = pmk22[0].InnerXml;
                            if (pmk41[0].InnerXml != "") rs["pmk41"] = pmk41[0].InnerXml;
                            if (oah02_9[0].InnerXml != "") rs["oah02_9"] = oah02_9[0].InnerXml;
                            if (pmk42[0].InnerXml != "") rs["pmk42"] = pmk42[0].InnerXml;
                            if (pmk43[0].InnerXml != "") rs["pmk43"] = pmk43[0].InnerXml;
                            if (ta_pmk01[0].InnerXml != "") rs["ta_pmk01"] = ta_pmk01[0].InnerXml;
                            if (pmk18[0].InnerXml != "") rs["pmk18"] = pmk18[0].InnerXml;
                            if (l_amt1[0].InnerXml != "") rs["l_amt1"] = l_amt1[0].InnerXml;
                            if (l_amt2[0].InnerXml != "") rs["l_amt2"] = l_amt2[0].InnerXml;
                            if (pmk18[0].InnerXml == "X:作廢")
                            {
                                rs["status"] = "作廢";
                            }
                            else
                            {
                                rs["status"] = "N";
                            }
                            Response.Write("???");
                            rs.Update();
                            rs.Close();
                        }

                        SmoothEnterprise.Database.DataSet aa = new SmoothEnterprise.Database.DataSet();
                        object objola = aa.ExecuteScalar("SELECT no FROM apmt420_in_head where pmk01 = '" + pmk01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
                        string no = objola.ToString();


                        int cmicNodes = xDoc.GetElementsByTagName("record").Count;
                        Response.Write("record共" + cmicNodes);
                        for (int i = 0; i <= (cmicNodes - 1); i++)
                        {
                            XmlNodeList pml02 = xDoc.GetElementsByTagName("pml02");
                            XmlNodeList pml04 = xDoc.GetElementsByTagName("pml04");
                            XmlNodeList pml041 = xDoc.GetElementsByTagName("pml041");
                            XmlNodeList ima021 = xDoc.GetElementsByTagName("ima021");
                            XmlNodeList pml07 = xDoc.GetElementsByTagName("pml07");
                            XmlNodeList pml20 = xDoc.GetElementsByTagName("pml20");
                            XmlNodeList pml33 = xDoc.GetElementsByTagName("pml33");
                            XmlNodeList pml34 = xDoc.GetElementsByTagName("pml34");
                            XmlNodeList pml35 = xDoc.GetElementsByTagName("pml35");
                            XmlNodeList pml41 = xDoc.GetElementsByTagName("pml41");
                            XmlNodeList pml12 = xDoc.GetElementsByTagName("pml12");
                            XmlNodeList pml121 = xDoc.GetElementsByTagName("pml121");
                            XmlNodeList pml122 = xDoc.GetElementsByTagName("pml122");
                            XmlNodeList pml40 = xDoc.GetElementsByTagName("pml40");
                            XmlNodeList aag02 = xDoc.GetElementsByTagName("aag02");
                            XmlNodeList pml67 = xDoc.GetElementsByTagName("pml67");
                            XmlNodeList gem02 = xDoc.GetElementsByTagName("gem02");
                            XmlNodeList pml06 = xDoc.GetElementsByTagName("pml06");
                            XmlNodeList pml31 = xDoc.GetElementsByTagName("pml31");
                            XmlNodeList pml88 = xDoc.GetElementsByTagName("pml88");
                            XmlNodeList ta_pml05 = xDoc.GetElementsByTagName("ta_pml05");
                            XmlNodeList ta_pml01 = xDoc.GetElementsByTagName("ta_pml01");
                            XmlNodeList ta_pml02 = xDoc.GetElementsByTagName("ta_pml02");
                            XmlNodeList ta_pml06 = xDoc.GetElementsByTagName("ta_pml06");
                            XmlNodeList ta_pml07 = xDoc.GetElementsByTagName("ta_pml07");
                            XmlNodeList ta_pml08 = xDoc.GetElementsByTagName("ta_pml08");
                            XmlNodeList ta_pml09 = xDoc.GetElementsByTagName("ta_pml09");
                            XmlNodeList ta_pml10 = xDoc.GetElementsByTagName("ta_pml10");
                            XmlNodeList fab02 = xDoc.GetElementsByTagName("fab02");
                            XmlNodeList fac02 = xDoc.GetElementsByTagName("fac02");
                            XmlNodeList ta_pml11 = xDoc.GetElementsByTagName("ta_pml11");
                            //增加 已採購金額
                            XmlNodeList apb10_sum = xDoc.GetElementsByTagName("apb10_sum");
                            XmlNodeList oea01 = xDoc.GetElementsByTagName("oea01");
                            XmlNodeList oqa13 = xDoc.GetElementsByTagName("oqa13");
                             
                            
                            //Response.Write(i);
                            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs2.Open("SELECT * FROM APMT420_IN_BODY WHERE 1=0");
                            rs2.Add();
                            Response.Write("<br>相同單號:" + pml02[i].InnerXml + "<br>");
                            if (plantid[0].InnerXml != "") rs2["plantid"] = plantid[0].InnerXml;
                            if (pmk01[0].InnerXml != "") rs2["pmk01"] = pmk01[0].InnerXml;
                            if (pml02[i].InnerXml != "") rs2["pml02"] = pml02[i].InnerXml;
                            if (pml04[i].InnerXml != "") rs2["pml04"] = pml04[i].InnerXml;
                            if (pml041[i].InnerXml != "") rs2["pml041"] = pml041[i].InnerXml;
                            if (ima021[i].InnerXml != "") rs2["ima021"] = ima021[i].InnerXml;
                            if (pml07[i].InnerXml != "") rs2["pml07"] = pml07[i].InnerXml;
                            if (pml20[i].InnerXml != "") rs2["pml20"] = pml20[i].InnerXml;
                            if (pml33[i].InnerXml != "") rs2["pml33"] = pml33[i].InnerXml;
                            if (pml34[i].InnerXml != "") rs2["pml34"] = pml34[i].InnerXml;
                            if (pml35[i].InnerXml != "") rs2["pml35"] = pml35[i].InnerXml;
                            if (pml41[i].InnerXml != "") rs2["pml41"] = pml41[i].InnerXml;
                            if (pml12[i].InnerXml != "") rs2["pml12"] = pml12[i].InnerXml;
                            if (pml121[i].InnerXml != "") rs2["pml121"] = pml121[i].InnerXml;
                            if (pml122[i].InnerXml != "") rs2["pml122"] = pml122[i].InnerXml;
                            if (pml40[i].InnerXml != "") rs2["pml40"] = pml40[i].InnerXml;
                            if (aag02[i].InnerXml != "") rs2["aag02"] = aag02[i].InnerXml;
                            if (pml67[i].InnerXml != "") rs2["pml67"] = pml67[i].InnerXml;
                            if (gem02[i].InnerXml != "") rs2["gem02"] = gem02[i].InnerXml;
                            if (pml06[i].InnerXml != "") rs2["pml06"] = pml06[i].InnerXml;
                            if (pml31[i].InnerXml != "") rs2["pml31"] = pml31[i].InnerXml;
                            if (pml88[i].InnerXml != "") rs2["pml88"] = pml88[i].InnerXml;
                            if (ta_pml05[i].InnerXml != "") rs2["ta_pml05"] = ta_pml05[i].InnerXml;
                            if (ta_pml01[i].InnerXml != "") rs2["ta_pml01"] = ta_pml01[i].InnerXml;
                            if (ta_pml02[i].InnerXml != "") rs2["ta_pml02"] = ta_pml02[i].InnerXml;
                            if (ta_pml06[i].InnerXml != "") rs2["ta_pml06"] = ta_pml06[i].InnerXml;
                            if (ta_pml07[i].InnerXml != "") rs2["ta_pml07"] = ta_pml07[i].InnerXml;
                            if (ta_pml08[i].InnerXml != "") rs2["ta_pml08"] = ta_pml08[i].InnerXml;
                            if (ta_pml09[i].InnerXml != "") rs2["ta_pml09"] = ta_pml09[i].InnerXml;
                            if (ta_pml10[i].InnerXml != "") rs2["ta_pml10"] = ta_pml10[i].InnerXml;
                            if (fab02[i].InnerXml != "") rs2["fab02"] = fab02[i].InnerXml;
                            if (fac02[i].InnerXml != "") rs2["fac02"] = fac02[i].InnerXml;
                            if (ta_pml11[i].InnerXml != "") rs2["ta_pml11"] = ta_pml11[i].InnerXml;
                            //增加 已採購金額
                            if (apb10_sum[i].InnerXml != "") rs2["apb10_sum"] = apb10_sum[i].InnerXml;
                            if (oea01[i].InnerXml != "") rs2["oea01"] = oea01[i].InnerXml;
                          
                            if (oqa13[i].InnerXml != "") rs2["oqa13"] = oqa13[i].InnerXml;
                            
                            
                            Response.Write("單身寫入完成--" + oqa13[i].InnerXml+"<br>");

                            rs2["bno"] = no;
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
                        #region 單號不相同,將資料全數新增
                        //EIP單號-----------------------------------------
                        SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                        string now = DateTime.UtcNow.AddHours(6).ToString("yyyyMM");
                        object objola = onum.ExecuteScalar("SELECT ISNULL(MAX(substring(NO,8,11)),'00000')+1 FROM apmt420_in_head WHERE NO LIKE 'A" + now + "%' and plantid='" + plantid[0].InnerXml + "' ");
                        string maxnum = objola.ToString();
                        Int64 sidnum;
                        sidnum = Convert.ToInt64(maxnum);
                        string OK_NO = "A" + now + sidnum.ToString("0000");
                        //-------------------------------------------------
                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("SELECT * FROM APMT420_IN_HEAD WHERE 1=0");
                        rs.Add();
                        if (plantid[0].InnerXml != "") rs["plantID"] = plantid[0].InnerXml;
                        if (pmk01[0].InnerXml != "") rs["pmk01"] = pmk01[0].InnerXml;
                        if (pmk02[0].InnerXml != "") rs["pmk02"] = pmk02[0].InnerXml;
                        if (pmk03[0].InnerXml != "") rs["pmk03"] = pmk03[0].InnerXml;
                        if (pmk04[0].InnerXml != "") rs["pmk04"] = pmk04[0].InnerXml;
                        if (pmk06[0].InnerXml != "") rs["pmk06"] = pmk06[0].InnerXml;
                        if (pmk09[0].InnerXml != "") rs["pmk09"] = pmk09[0].InnerXml;
                        if (pmc03[0].InnerXml != "") rs["pmc03"] = pmc03[0].InnerXml;
                        if (pmk10[0].InnerXml != "") rs["pmk10"] = pmk10[0].InnerXml;
                        if (pme031_1[0].InnerXml != "") rs["pme031_1"] = pme031_1[0].InnerXml;
                        if (pmk11[0].InnerXml != "") rs["pmk11"] = pmk11[0].InnerXml;
                        if (pme031_2[0].InnerXml != "") rs["pme031_2"] = pme031_2[0].InnerXml;
                        if (pmk12[0].InnerXml != "") rs["pmk12"] = pmk12[0].InnerXml;
                        if (gen02_3[0].InnerXml != "") rs["gen02_3"] = gen02_3[0].InnerXml;
                        if (pmk13[0].InnerXml != "") rs["pmk13"] = pmk13[0].InnerXml;
                        if (gem02_4[0].InnerXml != "") rs["gem02_4"] = gem02_4[0].InnerXml;
                        if (pmk14[0].InnerXml != "") rs["pmk14"] = pmk14[0].InnerXml;
                        if (gem02_5[0].InnerXml != "") rs["gem02_5"] = gem02_5[0].InnerXml;
                        if (pmk15[0].InnerXml != "") rs["pmk15"] = pmk15[0].InnerXml;
                        if (gen02_6[0].InnerXml != "") rs["gen02_6"] = gen02_6[0].InnerXml;
                        if (pmk16[0].InnerXml != "") rs["pmk16"] = pmk16[0].InnerXml;
                        if (pmk17[0].InnerXml != "") rs["pmk17"] = pmk17[0].InnerXml;
                        if (pmc03_7[0].InnerXml != "") rs["pmc03_7"] = pmc03_7[0].InnerXml;
                        if (pmk20[0].InnerXml != "") rs["pmk20"] = pmk20[0].InnerXml;
                        if (pma02_8[0].InnerXml != "") rs["pma02_8"] = pma02_8[0].InnerXml;
                        if (pmk21[0].InnerXml != "") rs["pmk21"] = pmk21[0].InnerXml;
                        if (pmk22[0].InnerXml != "") rs["pmk22"] = pmk22[0].InnerXml;
                        if (pmk41[0].InnerXml != "") rs["pmk41"] = pmk41[0].InnerXml;
                        if (oah02_9[0].InnerXml != "") rs["oah02_9"] = oah02_9[0].InnerXml;
                        if (pmk42[0].InnerXml != "") rs["pmk42"] = pmk42[0].InnerXml;
                        if (pmk43[0].InnerXml != "") rs["pmk43"] = pmk43[0].InnerXml;
                        if (ta_pmk01[0].InnerXml != "") rs["ta_pmk01"] = ta_pmk01[0].InnerXml;
                        if (pmk18[0].InnerXml != "") rs["pmk18"] = pmk18[0].InnerXml;
                        if (l_amt1[0].InnerXml != "") rs["l_amt1"] = l_amt1[0].InnerXml;
                        if (l_amt2[0].InnerXml != "") rs["l_amt2"] = l_amt2[0].InnerXml;
                        rs["status"] = "N";
                        rs["no"] = OK_NO;


                        rs.Update();
                        rs.Close();





                        int cmicNodes = xDoc.GetElementsByTagName("record").Count;
                        Response.Write("record共" + cmicNodes+"<br>");
                        for (int i = 0; i <= (cmicNodes - 1); i++)
                        {
                            XmlNodeList pml02 = xDoc.GetElementsByTagName("pml02");
                            XmlNodeList pml04 = xDoc.GetElementsByTagName("pml04");
                            XmlNodeList pml041 = xDoc.GetElementsByTagName("pml041");
                            XmlNodeList ima021 = xDoc.GetElementsByTagName("ima021");
                            XmlNodeList pml07 = xDoc.GetElementsByTagName("pml07");
                            XmlNodeList pml20 = xDoc.GetElementsByTagName("pml20");
                            XmlNodeList pml33 = xDoc.GetElementsByTagName("pml33");
                            XmlNodeList pml34 = xDoc.GetElementsByTagName("pml34");
                            XmlNodeList pml35 = xDoc.GetElementsByTagName("pml35");
                            XmlNodeList pml41 = xDoc.GetElementsByTagName("pml41");
                            XmlNodeList pml12 = xDoc.GetElementsByTagName("pml12");
                            XmlNodeList pml121 = xDoc.GetElementsByTagName("pml121");
                            XmlNodeList pml122 = xDoc.GetElementsByTagName("pml122");
                            XmlNodeList pml40 = xDoc.GetElementsByTagName("pml40");
                            XmlNodeList aag02 = xDoc.GetElementsByTagName("aag02");
                            XmlNodeList pml67 = xDoc.GetElementsByTagName("pml67");
                            XmlNodeList gem02 = xDoc.GetElementsByTagName("gem02");
                            XmlNodeList pml06 = xDoc.GetElementsByTagName("pml06");
                            XmlNodeList pml31= xDoc.GetElementsByTagName("pml31");
                            XmlNodeList pml88 = xDoc.GetElementsByTagName("pml88");
                            XmlNodeList ta_pml05 = xDoc.GetElementsByTagName("ta_pml05");
                            XmlNodeList ta_pml01 = xDoc.GetElementsByTagName("ta_pml01");
                            XmlNodeList ta_pml02 = xDoc.GetElementsByTagName("ta_pml02");
                            XmlNodeList ta_pml06 = xDoc.GetElementsByTagName("ta_pml06");
                            XmlNodeList ta_pml07 = xDoc.GetElementsByTagName("ta_pml07");
                            XmlNodeList ta_pml08 = xDoc.GetElementsByTagName("ta_pml08");
                            XmlNodeList ta_pml09 = xDoc.GetElementsByTagName("ta_pml09");
                            XmlNodeList ta_pml10 = xDoc.GetElementsByTagName("ta_pml10");
                            XmlNodeList fab02 = xDoc.GetElementsByTagName("fab02");
                            XmlNodeList fac02 = xDoc.GetElementsByTagName("fac02");
                            XmlNodeList ta_pml11 = xDoc.GetElementsByTagName("ta_pml11");
                            //增加 已採購金額
                            XmlNodeList apb10_sum = xDoc.GetElementsByTagName("apb10_sum");
                            XmlNodeList oea01 = xDoc.GetElementsByTagName("oea01");
                            XmlNodeList oqa13 = xDoc.GetElementsByTagName("oqa13");

                            //Response.Write(i);
                            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs2.Open("SELECT * FROM APMT420_IN_BODY WHERE 1=0");
                            rs2.Add();
                            Response.Write("<br>APMT420_IN_BODY" + pml02[i].InnerXml + "<br>");
                            if (plantid[0].InnerXml != "") rs2["plantid"] = plantid[0].InnerXml;
                            if (pmk01[0].InnerXml != "") rs2["pmk01"] = pmk01[0].InnerXml;
                            if (pml02[i].InnerXml != "") rs2["pml02"] = pml02[i].InnerXml;
                            if (pml04[i].InnerXml != "") rs2["pml04"] = pml04[i].InnerXml;
                            if (pml041[i].InnerXml != "") rs2["pml041"] = pml041[i].InnerXml;
                            if (ima021[i].InnerXml != "") rs2["ima021"] = ima021[i].InnerXml;
                            if (pml07[i].InnerXml != "") rs2["pml07"] = pml07[i].InnerXml;
                            if (pml20[i].InnerXml != "") rs2["pml20"] = pml20[i].InnerXml;
                            if (pml33[i].InnerXml != "") rs2["pml33"] = pml33[i].InnerXml;
                            if (pml34[i].InnerXml != "") rs2["pml34"] = pml34[i].InnerXml;
                            if (pml35[i].InnerXml != "") rs2["pml35"] = pml35[i].InnerXml;
                            if (pml41[i].InnerXml != "") rs2["pml41"] = pml41[i].InnerXml;
                            if (pml12[i].InnerXml != "") rs2["pml12"] = pml12[i].InnerXml;
                            if (pml121[i].InnerXml != "") rs2["pml121"] = pml121[i].InnerXml;
                            if (pml122[i].InnerXml != "") rs2["pml122"] = pml122[i].InnerXml;
                            if (pml40[i].InnerXml != "") rs2["pml40"] = pml40[i].InnerXml;
                            if (aag02[i].InnerXml != "") rs2["aag02"] = aag02[i].InnerXml;
                            if (pml67[i].InnerXml != "") rs2["pml67"] = pml67[i].InnerXml;
                            if (gem02[i].InnerXml != "") rs2["gem02"] = gem02[i].InnerXml;
                            if (pml06[i].InnerXml != "") rs2["pml06"] = pml06[i].InnerXml;
                            if (pml31[i].InnerXml != "") rs2["pml31"] = pml31[i].InnerXml;
                            if (pml88[i].InnerXml != "") rs2["pml88"] = pml88[i].InnerXml;
                            if (ta_pml05[i].InnerXml != "") rs2["ta_pml05"] = ta_pml05[i].InnerXml;
                            if (ta_pml01[i].InnerXml != "") rs2["ta_pml01"] = ta_pml01[i].InnerXml;
                            if (ta_pml02[i].InnerXml != "") rs2["ta_pml02"] = ta_pml02[i].InnerXml;
                            if (ta_pml06[i].InnerXml != "") rs2["ta_pml06"] = ta_pml06[i].InnerXml;
                            if (ta_pml07[i].InnerXml != "") rs2["ta_pml07"] = ta_pml07[i].InnerXml;
                            if (ta_pml08[i].InnerXml != "") rs2["ta_pml08"] = ta_pml08[i].InnerXml;
                            if (ta_pml09[i].InnerXml != "") rs2["ta_pml09"] = ta_pml09[i].InnerXml;
                            if (ta_pml10[i].InnerXml != "") rs2["ta_pml10"] = ta_pml10[i].InnerXml;
                            if (fab02[i].InnerXml != "") rs2["fab02"] = fab02[i].InnerXml;
                            if (fac02[i].InnerXml != "") rs2["fac02"] = fac02[i].InnerXml;
                            if (ta_pml11[i].InnerXml != "") rs2["ta_pml11"] = ta_pml11[i].InnerXml;
                            //增加 已採購金額
                            if (apb10_sum[i].InnerXml != "") rs2["apb10_sum"] = apb10_sum[i].InnerXml;

                            if (oea01[i].InnerXml != "") rs2["oea01"] = oea01[i].InnerXml;

                            if (oqa13[i].InnerXml != "") rs2["oqa13"] = oqa13[i].InnerXml;
                           


                            rs2["bno"] = OK_NO;
                            rs2.Update();
                            rs2.Close();
                        }

                        File.Move(s, s.Replace("Download", "XML"));
                        //Response.Write(s + "---" + s.Replace("IN", "OUT")+"<br>");
                        //File.Delete(s); 

                        #endregion
                    }
                    //發mail---------------------------------------------------------------------------------------------------------------------------
                    if (pmk18[0].InnerXml != "X:作廢")
                    {
                        String ques;
                        SmoothEnterprise.Database.DataSet es = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        es.Open("select email,apmt420_in_head.id id  from apmt420_in_head  LEFT JOIN dguser ON pmk12=erpid where pmk01 = '" + pmk01[0].InnerXml + "' and plantid='" + plantid[0].InnerXml + "' ");
                        if (!es.EOF)
                        {
                            MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                            MailAddress to = new MailAddress(es["email"].ToString());

                            MailAddress bcc = new MailAddress("herzog.lin@minaik.com.tw");

                            MailMessage message = new MailMessage(from, to);
                            message.Bcc.Add(bcc);

                            ques = "您好:" + "<br>" +
                                   "<br>" +
                                   "ERP雜項請購電子簽核申請單現有一筆，正等待您的處理:" + "<br>" +
                                   "<br>" +
                                   "申請單號 : " + pmk01[0].InnerXml + "<br>" +
                                   "申請日期 : " + pmk04[0].InnerXml + "<br>" +
                                   "申請人員 : " + gen02_3[0].InnerXml + "<br>" +
                                   "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_APMT420/APMT420Edit.aspx?id=" + es["id"].ToString() + "\" >至ERP雜項請購電子簽核系統檢視並編輯內容</a>" +
                                   "<br>" +
                                   "<br>" +
                                   "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                   "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                   "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                            message.Subject = "請購單號 - " + pmk01[0].InnerXml + " 等待您的處理";
                            message.IsBodyHtml = true;
                            message.Body = ques;

                            SmtpClient client = new SmtpClient("192.168.0.12");

                            client.Send(message);

                             

                           Response.Write("Mail傳送完畢" + "<br>");

                           Upload("D:\\APMT420_XML\\ERP_XML\\" + plantid[0].InnerXml + "_apmt420_" + pmk01[0].InnerXml + ".xml", "ftp://192.168.0.250/" + plantid[0].InnerXml + "_apmt420_" + pmk01[0].InnerXml + ".xml", "xmlback", "xmlback");

                          }
                    }
                     
                    //---------------------------------------------------------------------------------------------------------------------------
                }
            }
            catch (Exception ex)
            {
                //herzog remark
                /*string s1 = s.Replace(".xml", "");
                s1 = s1.Replace("D:\\APMT420_XML\\ERP_Download\\", "");
                int sone = s1.IndexOf("_");
                int stwo = s1.LastIndexOf("_");
                stwo = stwo + 1;
                FileStream fs = new FileStream(@"D:\APMT420_XML\4GL\" + s1 + ".txt", FileMode.Create, FileAccess.Write);
                StreamWriter sw = new StreamWriter(fs);
                sw.WriteLine("\"" + s1.Substring(0, sone) + "\",\"apmt420\",\"" + s1.Substring(stwo, 10) + "\",\"E\",\"\"");
                sw.Close();
                fs.Close();
                //Upload(fs.ToString(), "ftp://192.168.0.250/" + s1.ToString() + ".txt", "4gl", "4gl");

                */
                //發mail---------------------------------------------------------------------------------------------------------------------------
                String ques;

                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                MailAddress to = new MailAddress("herzog.lin@minaik.com.tw");

                MailAddress bcc = new MailAddress("herzog.lin@minaik.com.tw");

                MailMessage message = new MailMessage(from, to);
                message.Bcc.Add(bcc);

                ques = "有問題";

                message.Subject = "ERP請購單有問題";
                message.IsBodyHtml = true;
                message.Body = ques;

                SmtpClient client = new SmtpClient("192.168.0.12");

                client.Send(message);

                Response.Write("ERP請購單有問題" + "<br>");

                    

                
                //---------------------------------------------------------------------------------------------------------------------------

 
            }
        }


        Response.Write("<br>END");
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

        Response.Write("GetFiles----");
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