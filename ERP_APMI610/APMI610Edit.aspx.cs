using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Threading;
using System.Text;
using System.Net;

namespace ERP_APMI610
{
    public partial class APMI610Edit : SmoothEnterprise.Web.Page
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            //Page.Title = "APMI610 Edit Page";
            try
            {
                if (!this.IsPostBack)
                {


                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs.Open("SELECT * FROM eipb.dbo.APMI610_IN  WHERE rowid='" + Request.QueryString["rowid"] + "' ");
                    if (!rs.EOF)
                    {
                        Repatt.Value = rs["pmca00"].ToString().Substring(0, 1).ToUpper();
                        //   Response.Write(rs["pmca00"].ToString().Substring(0, 1));
                        this.FIELD_PlantID.Text = rs["PlantID"].ToString();
                        this.FIELD_pmcsn.Text = rs["pmcsn"].ToString();
                        this.FIELD_pmca00.Text = rs["pmca00"].ToString();
                        this.FIELD_pmcano.Text = rs["pmcano"].ToString();
                        this.FIELD_pmca01.Text = rs["pmca01"].ToString();
                        this.FIELD_pmca02.Text = rs["pmy02_7"].ToString();
                        this.FIELD_pmca03.Text = rs["pmca03"].ToString();
                        this.FIELD_pmca04.Text = rs["pmca04"].ToString();

                        this.FIELD_gea02_0.Text = rs["gea02_0"].ToString();

                        this.FIELD_geb02_1.Text = rs["geb02_1"].ToString();
                        this.FIELD_pmca081.Text = rs["pmca081"].ToString();
                        this.FIELD_pmca082.Text = rs["pmca082"].ToString();
                        this.FIELD_pmca091.Text = rs["pmca091"].ToString() + " " + rs["pmca092"].ToString() + " " +
                               rs["pmca093"].ToString() + " " + rs["pmca094"].ToString();

                        // this.FIELD_pmca092.Text = rs["pmca092"].ToString();
                        // this.FIELD_pmca093.Text = rs["pmca093"].ToString();
                        // this.FIELD_pmca094.Text = rs["pmca094"].ToString();
                        this.FIELD_pmca10.Text = rs["pmca10"].ToString();
                        this.FIELD_pmca11.Text = rs["pmca11"].ToString();

                        this.FIELD_pmca14.Text = rs["pmca14"].ToString();

                        this.FIELD_pmca17.Text = rs["pma02_2"].ToString();
                        this.FIELD_pmca22.Text = rs["pmca22"].ToString();
                        this.FIELD_pmca24.Text = rs["pmca24"].ToString();

                        this.FIELD_pmca30.Text = rs["pmca30"].ToString();

                        this.FIELD_gec02_4.Text = rs["gec02_4"].ToString();

                        this.FIELD_oah02_5.Text = rs["oah02_5"].ToString();
                        this.FIELD_pmca52.Text = rs["pmca52"].ToString();

                        this.FIELD_pmca904.Text = rs["pmca904"].ToString();
                        this.FIELD_pmca911.Text = rs["pmca911"].ToString();


                        this.FIELD_pmcauser.Text =Utility.GetGIT_UserName(rs["pmcauser"].ToString());

                        this.FIELD_pmcagrup.Text = rs["gem02_6"].ToString();

                        this.FIELD_pmcaud15.Text = rs["pmcaud15"].ToString();
                        Labpmcaud01.Text = rs["pmcaud01"].ToString();
                        //2015/0803 ADD  如果為Y則是小於90天原因必key
                        HidDay.Value = rs["l_day"].ToString();

                        List1.Visible = false;
                        List2.Visible = false;
                        if (Repatt.Value == "I")
                        {
                            List1.Visible = true;
                            List1.SelectedValue = rs["RepReason"].ToString();
                        }
                        else
                        {
                            List2.Visible = true;
                            List2.SelectedValue = rs["RepReason"].ToString();


                        }
                        string status = rs["status"].ToString();

                        ButStop.Visible = false;

                        if (status == "Y")
                        {
                            ButStop.Visible = true;
                            ButStop.Enabled = true;
                            BUTTON_save.Enabled = false;
                        }

                        if (this.CurrentUser.LogonID == "herzog.lin")
                        {
                            BUTTON_save.Enabled = true;
                            BUTTON_save.Text = "Save(H)";
                        }
                        FIELD_ta_pmca40.Text = rs["ta_pmca40"].ToString();
                        FIELD_ta_pmca41.Text = rs["ta_pmca41"].ToString();

                        InpPurDesc1.Text = rs["RRDesc1"].ToString();
                        InpPurDesc2.Text = rs["RRDesc2"].ToString();

                        //產業別
                        Inta_pmca42.Text = rs["ta_pmca42"].ToString() + "-" + rs["tc_oah02_8"].ToString().Trim();


                        setIcon(rs["PlantID"].ToString());

                        displayfile(true);

                        DBTransfer fs = new DBTransfer();
                        PopupUser1.Text = fs.GetTopfile("select c.id  from EIPA.dbo.dguser " +
                            " a left join dggroup b on   a.gid=b.id  " +
                            " left join dguser c on b.uid=c.id   where a.id='" + this.CurrentUser.ID + "'");

                        TexActi.Value = fs.GetTopfile("SELECT  pmcacti   FROM [IP185].[MINAIK].[dbo].[PMC_FILE]  where   pmc01='" + rs["pmca01"].ToString() + "'");


                        //InputButton1
                        InputButton1.Visible = false;
                        if (status == "R" || status == "N")
                        {
                            InputButton1.Visible = true;
                        }

                    }
                    else
                    {
                        Response.Redirect("APMI610.aspx");
                    }

                    
                    
                }
            }
            catch (Exception ex)
            {
                if (Utility.MIS_Manager(CurrentUser.LogonID))
                {
                    Response.Write(ex.Message + "<br>" + ex.StackTrace.ToString());
                }
                else {
                    Response.Redirect("APMI610.aspx");
                }
            }

            // TT();
            // BUTTON_StopRequest1.Enabled = true;
        }

        private void setIcon(string company)
        {

            img_icon.ImageUrl = "../../gif/MINAIK02.gif";
            img_icon.Width = 300;
            img_icon.Height = 60;

            if (company == "GIT")
            {

                img_icon.ImageUrl = "../../gif/GIT.gif";
                img_icon.Width = 450;
                img_icon.Height = 70;
            }
        }


        private void TT()
        {
            string T1 = "";
            string T2 = "";
            string T3 = "";
            string par1 = "";

            SmoothEnterprise.Database.DataSet js = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            js.Open("SELECT SUBSTRING(pmca00,1,1)T1, SUBSTRING(pmca00,1,1)+datadiff T2,datadiff T3 " +
                "   FROM [EIPB].[dbo].[APMI610_IN] where rowid='" + Request.QueryString[0] + "'");
            if (!js.EOF)
            {
                T1 = js["T1"].ToString();
                T2 = js["T2"].ToString();
                T3 = js["T3"].ToString();

            }

            switch (T1)
            {
                case "I":
                case "V":
                    par1 = T1;
                    break;
                case "U":
                    par1 = T2;
                    break;
            }


            string snmemo = "";
            Response.Write(T1 + "---");
            if (T1 == "U")
            {
                if (T3 == "N") snmemo = FIELD_pmcsn.Text + "類別" + FIELD_pmca00.Text + "無異動";
                else snmemo = FIELD_pmcsn.Text + "類別" + FIELD_pmca00.Text + "有異動";
            }
            else snmemo = FIELD_pmcsn.Text + "類別" + FIELD_pmca00.Text;

            Response.Write(snmemo + "--");
        }

        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.KeepURL();
            }
        }

        private void displayfile(bool un)
        {
            string status = "";

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

            string htmlstr = "";
            string detlstr = "";
            Panel2.Controls.Add(new LiteralControl("<table border='1' width='400px' cellpadding='0' cellspacing='0'><tr ><td style='font:8pt;COLOR: yellow; height: 25px; BACKGROUND-COLOR: teal'>功能</td><td style='font:8pt;COLOR: yellow;height: 20px; background-color: teal'>附件(下載)</td></tr>"));

            rs.Open("SELECT * FROM [EIPB].[dbo].[upload_attachment] WHERE detid='" + Request.QueryString[0] + "'");
            while (!rs.EOF)
            {

                htmlstr = "<a href='../AttachDownload.aspx?attid=" + rs["attid"] + "&table=[EIPB].[dbo].[upload_attachment]' target=\'_blank\' ><img border='0' width='25' height='25' src='../gif/p12.gif' />" + rs["upname"] + "</a>";
                if (un)
                {
                    detlstr = "<a href='APMI610del.aspx?rowid=" + Request.QueryString[0] + "&W=Edit&attid=" + rs["attid"] + "'  ><img border='0' width='20' height='25' onClick=return j1('" + rs["attid"] + "') src='../gif/button_drop.png' /></a>";

                }


                rs.MoveNext();
                Panel2.Controls.Add(new LiteralControl("<TR class='NormalBold'><TD align='center' style='width: 100px;height: 25px'>"));
                Panel2.Controls.Add(new LiteralControl(detlstr + "</TD><TD width='300px'>"));
                Panel2.Controls.Add(new LiteralControl(htmlstr + "</TD></tr>"));


            }
            Panel2.Controls.Add(new LiteralControl("</table>"));
        }


        protected void BUTTON_save_Click(object sender, System.EventArgs e)
        {
            if (this.IsValid)
            {
                try
                {
                    svaedata();
                    FileUploadData(Request.QueryString["rowid"]);

                    displayfile(true);

                    //Response.Redirect("APMI610.aspx");
                }
                catch (Exception ex)
                {
                    this.AddError(this, "BUTTON_save_Click()", "", ex.Message);
                }
            }
        }

        private void FileUploadData(string sysid)
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);

            //region 動態新增
            HttpFileCollection files = HttpContext.Current.Request.Files;
            System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
            int att_count = 0;

            for (int ifile = 0; ifile < files.Count; ifile++)
            {
                HttpPostedFile postedfile = files[ifile];
                string filename, fileExt, filePath;
                filename = System.IO.Path.GetFileName(postedfile.FileName);    //抓取文件名
                fileExt = System.IO.Path.GetExtension(postedfile.FileName);    //抓取文件附檔名

                if (postedfile.ContentLength > 0)
                {
                    att_count = att_count + 1;

                    String tafilename = "ulname" + att_count.ToString();
                    String taattach = "ulbody" + att_count.ToString();



                    byte[] fileBytes = new byte[postedfile.ContentLength];
                    postedfile.InputStream.Read(fileBytes, 0, postedfile.ContentLength);


                    rs.Open("SELECT * FROM [EIPB].[dbo].[upload_attachment] WHERE 1=0");
                    rs.Add();
                    rs["DetId"] = sysid;
                    rs["upname"] = filename;
                    rs["upfil"] = fileBytes;
                    rs["PId"] = "F501";
                    rs["attinidate"] = DateTime.Now.ToString();
                    rs.Update();
                    rs.Close();
                    filePath = System.IO.Path.GetFullPath(postedfile.FileName);    //try抓取文件路徑
                    // fpath[att_count] = filePath;

                }

            }
        }




        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            this.GoBack("APMI610.aspx", new string[] { "APMI610Delete.aspx" });
        }

        protected void BUTTON_delete_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("APMI610Delete.aspx?rowid=" + Request.QueryString["rowid"]);
        }




        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            try
            {
                SmoothEnterprise.Web.UI.HTMLControl.InputText it2;
                object obj2 = this.FlowFeedbackViewer1.HistoryView.FindControl("S_Comment");

                it2 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj2;
                it2.Enabled = true;
                it2.ReadOnly = true;
                it2.Text = (string)e["Flow_Comment"];



                System.Web.UI.WebControls.Image sin1;
                object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
                sin1 = (System.Web.UI.WebControls.Image)obj5;

                System.Web.UI.WebControls.Image sin2;
                object obj6 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image2");
                sin2 = (System.Web.UI.WebControls.Image)obj6;


                if ((string)e["IniReviewer"].ToString().Length.ToString() == "0") sin2.Visible = false;
                else sin2.Visible = true;

                //Response.Write((string)e["InputText3"].ToString() + "--");
                sin1.Visible = false;  //default image 為Visable=false;
                if ((string)e["InputText3"].ToString().Length.ToString() != "0")
                {
                    //判斷圖檔是否存在
                    string strupp = "";  //接 歷史的審核人員 logonid
                    DirectoryInfo di = new DirectoryInfo("C:\\Inetpub\\E_Portal1\\image");
                    FileInfo[] fi = di.GetFiles();
                    foreach (FileInfo fiTemp in fi)
                    {
                        strupp = (string)e["InputText3"] + ".jpg";
                        //資料一律轉成大寫
                        if (fiTemp.Name.ToUpper() == strupp.ToUpper())
                        {
                            sin1.Visible = true;
                            break;

                        }
                    }


                }
                sin1.ImageUrl = "~/image/" + (string)e["InputText3"] + ".JPG";


            }
            catch { }
        }



        protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {

            svaedata();


            int levid = 0;
            DBTransfer takedata = new DBTransfer();
            SmoothEnterprise.Database.DataSet js = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            //string idnm = "";


            ArrayList managerid = new ArrayList();  //主管id arraylist
            ArrayList managernm = new ArrayList();  //主管職稱 arraylist
            string gid = "";
            string[,] data = new string[1, 5];
            int count = 0;
            string firapp = "";
            string buf = "";



            managerid.Add(PopupUser1.Text);
            managernm.Add("直屬主管");
            buf = PopupUser1.Text;

            int t = 0;

            js.Open("select gid from eipa.dbo.dguser where id='" + PopupUser1.Text + "'");
            //  Response.Write("select gid from eipa.dbo.dguser where id='" + PopupUser1.Text + "'");
            if (!js.EOF)
            {
                gid = js["gid"].ToString();
                while (levid < 10)
                {
                    //t++;
                    if (gid.Length > 10) data = GetResGroup(gid);
                    if (data[0, 2] == null) break;
                    else
                    {
                        if (data[0, 2].ToString().ToUpper() == "63D0329E-F4C2-44C6-950C-92174D233BED")
                        {
                        }
                        else
                        {
                            if (buf != data[0, 2].ToString())
                            {
                                managerid.Add(data[0, 2].ToString());
                                managernm.Add(data[0, 1].ToString());
                            }
                            buf = data[0, 2].ToString();

                        }

                        // Response.Write(data[0, 1].ToString() + "--" + data[0, 2].ToString() + "--" + data[0, 0].ToString() + "--" + data[0, 0].ToString() + "<br>");

                        gid = data[0, 0].ToString();
                        levid = Int32.Parse(data[0, 4].ToString());

                    }

                    count++;
                    if (count > 8) break;
                }
                //firapp = managerid[0].ToString();
            }
            js.Close();


            /*
                       managerid.Add("FF0678EA-3EAF-4F1F-A012-1C54F93B48E2");
                       managernm.Add("會計一");


                       managerid.Add("D22FD429-E1EC-431D-99E6-1D7041F8A452");
                       managernm.Add("會計主管");



                       managerid.Add("AB70A6C0-D106-4636-B1E1-15DFFF9A83C5");
                       managernm.Add("財務長");
               */
            //---test --------------------
            // managerid.Clear();
            // managernm.Clear();


            // managerid.Add(PopupUser1.Text);
            // managernm.Add("主管1");
            string T1 = "";
            string T2 = "";
            string T3 = "";
            string par1 = "";
            js.Open("SELECT SUBSTRING(pmca00,1,1)T1, SUBSTRING(pmca00,1,1)+datadiff T2,datadiff T3 " +
                "   FROM [EIPB].[dbo].[APMI610_IN] where rowid='" + Request.QueryString[0] + "'");
            if (!js.EOF)
            {
                T1 = js["T1"].ToString();
                T2 = js["T2"].ToString();
                T3 = js["T3"].ToString();

            }
            //if ((T1 != "I") || (T1 != "V")) par1 = T1;
            //else par1 = T2;

            switch (T1)
            {
                case "I":
                case "V":
                    par1 = T1;
                    break;
                case "U":
                    par1 = T2;
                    break;
            }

            // managerid.Add("D45938A7-3430-42EC-8BE6-0E1F391329E0");
            // managernm.Add("TEST");
            js.Close();

            if (par1 == "V")
            {
                if (addmemo() == "1") js.Open("SELECT PID,isnull(content1,'test') title FROM ERP_FLOW where ERP_NAME='APMI610Edit'" +
                      "   and  DEP_NAME='UY' order by  No asc ");
                else
                    js.Open("SELECT PID,isnull(content1,'test') title FROM ERP_FLOW where ERP_NAME='APMI610Edit'" +
                   "   and  DEP_NAME='" + par1 + "' order by  No asc ");

            }
            else
            {

                js.Open("SELECT PID,isnull(content1,'test') title FROM ERP_FLOW where ERP_NAME='APMI610Edit'" +
                    "   and  DEP_NAME='" + par1 + "' order by  No asc ");
            }
            // Response.Write("SELECT PID,isnull(content1,'test') title FROM ERP_FLOW where ERP_NAME='APMI610Edit'" +
            //  "   and  DEP_NAME='" + par1 + "' order by  No asc ");

            while (!js.EOF)
            {
                managerid.Add(js["PID"].ToString());
                managernm.Add(js["title"].ToString());

                js.MoveNext();
            }



            //managerid.Add("13FEB136-9F48-416A-B495-7C2BE8C3B548");
            //managernm.Add("會計1");
            //managerid.Add("9D78E1CF-ED8E-47E0-8963-9534EF1FF3C3");
            //managernm.Add("會計2");
            //managerid.Add("13FEB136-9F48-416A-B495-7C2BE8C3B548");
            //managernm.Add("會計3");


            //managerid.Add("ab70a6c0-d106-4636-b1e1-15dfff9a83c5");
            //managernm.Add("財務長");
            //----------------------------




            FlowClient1.TypeName = "sharflow12_2.Flowwork.sharflow12_21";

            sharflow12_2.Flowwork.sharflow12_21 flow = new sharflow12_2.Flowwork.sharflow12_21();
            FlowClient1.Text = "供應商代號申請單";  //更改流程名稱

            switch (managerid.Count)  //依舊arraylist裡面有幾個,來判斷走那條flow
            {

                case 1:
                    e.NextNode = flow.sharflow12_2Node1;
                    break;

                case 2:
                    e.NextNode = flow.sharflow12_2Node2;
                    break;

                case 3:
                    e.NextNode = flow.sharflow12_2Node4;
                    break;
                case 4:
                    e.NextNode = flow.sharflow12_2Node7;
                    break;

                case 5:
                    e.NextNode = flow.sharflow12_2Node11;
                    break;
                case 6:
                    e.NextNode = flow.sharflow12_2Node16;
                    break;
                case 7:
                    e.NextNode = flow.sharflow12_2Node22;
                    break;
                case 8:
                    e.NextNode = flow.sharflow12_2Node29;
                    break;
                case 9:
                    e.NextNode = flow.sharflow12_2Node37;
                    break;
                case 10:
                    e.NextNode = flow.sharflow12_2Node46;
                    break;
                case 11:
                    e.NextNode = flow.sharflow12_2Node56;
                    break;
            }
            // e.NextNode.ReviewerURL = "/PManagement/DocControlView.aspx";
            e.NextNode.ReviewerURL = "/ERP_APMI610/APMI610View.aspx";

            count = 0;
            foreach (string i in managerid)  //將簽核人員id塞進flow
            {
                this.FlowClient1.AddParameter("USER" + count.ToString(), i);
                count++;
            }

            count = 0;

            foreach (string i in managernm)  //將簽核人員職稱塞進flow
            {
                this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
                count++;
            }


            //回寫單據狀泰
            string Sql = "update [EIPB].[dbo].[APMI610_IN] set   status='Y' where  rowid='" + Request.QueryString["rowid"] + "'";
            takedata.RunIUSql(Sql);


            //建立審核人員
            Sql = "insert into  [EIPB].[dbo].[doulog](rowid,appid,appdate )values('" + Request.QueryString["rowid"] + "','" +
                              PopupUser1.Text + "',getdate())";
            takedata.RunIUSql(Sql);


            //通知審核者
            js.Open("select name,email from dguser where id='" + PopupUser1.Text + "'");
            if (!js.EOF)
            {
                string snmemo = "";
                if (T1 == "U")
                {
                    if (T3 == "N") snmemo = FIELD_pmcsn.Text + "類別" + FIELD_pmca00.Text + "無異動";
                    else snmemo = FIELD_pmcsn.Text + "類別" + FIELD_pmca00.Text + "有異動";
                }
                else
                {
                    if (Labpmcaud01.Text == "Y") snmemo = FIELD_pmcsn.Text + "類別" + FIELD_pmca00.Text + "->失效";
                    else snmemo = FIELD_pmcsn.Text + "類別" + FIELD_pmca00.Text + "->有效";
                }


                MailLayout SenReq = new MailLayout();
                string purl = "http://eip.minaik.com.tw" + Request.RawUrl.ToLower().Replace("edit", "view");

                ShrFlowMail Backsend = new ShrFlowMail();
                // Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, snmemo,
                //     js[0].ToString(), "herzog.lin@minaik.com.tw", purl, FlowClient1.Text);

                Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, snmemo,
                    js[0].ToString(), js[1].ToString(), purl, FlowClient1.Text);

            }
            js.Close();


            //通知代理人機制
            //  DeputyApprove(managerid[0].ToString());

            displayfile(false);




            BUTTON_save.Enabled = false;
            //ButCancel.Enabled = false;


            ButStop.Visible = true;

            PopupUser1.Visible = false;
            Label9.Visible = false;
        }


        private string[,] GetResGroup(string gid)
        {
            string[,] data = new string[1, 5];
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            ds.Open("SELECT   a.pid, a.name  an,a.uid, b.name  bn,isnull(lshort,0) lev " +
                    " FROM    dggroup a left join  dguser b on a.uid=b.id  left join  eipa.dbo.dglevel c on b.levid=c.lnid " +
                    " where a.id='" + gid + "'");

            if (!ds.EOF)
            {
                data[0, 0] = ds[0].ToString();
                data[0, 1] = ds[1].ToString();
                data[0, 2] = ds[2].ToString();
                data[0, 3] = ds[3].ToString();
                data[0, 4] = ds[4].ToString();
            }

            return data;
        }


        private string addmemo()
        {
            DBTransfer ds = new DBTransfer();
            string disrec = ds.GetTopfile("SELECT  COUNT(*) FROM [IP185].[MINAIK].[dbo].[PMC_FILE] where  pmcacti='N'" +
                   "  and pmc01='" + FIELD_pmca01.Text + "'");


            //disrec -> 0 代表目前有效   >1代表現在是無效
            return disrec;
        }

        private void svaedata()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM eipb.dbo.APMI610_IN WHERE rowid='" + Request.QueryString["rowid"] + "' ");
                if (!rs.EOF)
                {
                    if (Repatt.Value == "I")
                    { rs["RepReason"] = List1.SelectedValue; }
                    else { rs["RepReason"] = List2.SelectedValue; }

                    rs["RRDesc1"] = InpPurDesc1.Text;
                    rs["RRDesc2"] = InpPurDesc2.Text;
                    rs.Update();
                }
                rs.Close();
            }
            catch (Exception ex)
            {
                Utility.log(0,ex.Message,ex.StackTrace.ToString());
            }
        }


        //-------------





        protected void ButStop_Click(object sender, EventArgs e)
        {
            this.BUTTON_save.Visible = true;
            DBTransfer takedata = new DBTransfer();
            string Sql = "update [EIPB].[dbo].[APMI610_IN] set   status='N' where  rowid='" + Request.QueryString["rowid"] + "'";
            takedata.RunIUSql(Sql);
            Sql = "delete  from  dgflowqueue where  requesturl='" + Request.RawUrl.ToString().Trim() + "'";
            //Response.Write(Sql);

            takedata.RunIUSql(Sql);
            //Response.Write(Sql);
            //發信給 該審核點 

            this.AddInformation(this, "BUTTON_StopRequest_Click()", "", "已經中止完畢!");
            BUTTON_save.Enabled = true;

            // BUTTON_StopRequest.Enabled = true;

            PopupUser1.Visible = true;
            Label9.Visible = true;

            //FileUploadData(Request.QueryString["rowid"].ToString());
        }
        protected void BUTTON_RemindReviewer_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

            ds.Open("SELECT   revieweruid,name,email  FROM   dgflowqueue a   left join dguser b  " +
                " on revieweruid=b.id  where requesturl='" + Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "'" +
                "  and resulttype is null and revieweruid!='00000000-0000-0000-0000-000000000000'");


            //"SELECT top 1 revieweruid,name,email  FROM   dgflowqueue a   left join dguser b " +
            //" on revieweruid=b.id  where requesturl like '%" + Request.QueryString[0] + "%'  order by a.initdate desc");

            while (!ds.EOF)
            {

                string MId = "{ca9348c8-504a-4454-9acc-18c03cfc8189}";
                string PapCaption = "供應商代號申請單(催)";
                string PID = FIELD_pmcsn.Text;
                string receivername = ds["name"].ToString();
                string requesturl = "http://eip.minaik.com.tw/" + Request.RawUrl.ToString().ToLower().Replace("edit", "view");
                string AppMail = ds["email"].ToString();
                string body = "";
                string requestername = this.CurrentUser.Name.ToString();

                ShrFlowMail ActRem = new ShrFlowMail();
                ActRem.RemindApprove(MId, PID, receivername, requesturl, AppMail, PapCaption, body, requestername);
                // ActRem.RemindApprove(MId, PID, receivername, requesturl, "herzog.lin@minaik.com.tw", PapCaption, body, requestername);

                //   DeputyApprove(ds[0].ToString());
                Response.Write("<script>alert('已經發信請" + receivername + "儘快審核!');</script>");
                ds.MoveNext();


            }
        }
        protected void InputButton1_Click(object sender, EventArgs e)
        {
            string FMainnm = FIELD_PlantID.Text.Trim() + "_apmi600-" + FIELD_pmcano.Text.Trim() + ".txt";
            string st = "R";
            string U = "I";

            //SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            //rb.Open("SELECT * FROM eipb.dbo.APMI610_IN  WHERE rowid='" + Request.QueryString["rowid"] + "'  ");
            //if (!rb.EOF)
            //{
            //    rb["STATUS"] = "E";//退回ERP修改
            //    rb.Update();

            //}
            //rb.Close();


            DBTransfer rb = new DBTransfer();
            rb.RunIUSql("update eipb.dbo.APMI610_IN set STATUS='E'  WHERE rowid='" + Request.QueryString["rowid"] + "'  ");

            //傳簽核退回的TXT給ERP
            FileStream fs = new FileStream(@"D:\\APMI610_XML\\4GL\\" + FMainnm, FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);
            sw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"pmcaud03\",\"" + st + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");


            sw.Close();
            fs.Close();
            Upload("D:\\APMI610_XML\\4GL\\" + FMainnm, "ftp://192.168.0.250/" + FMainnm, "4gl", "4gl");

            Response.Write("<script>alert('已經退回ERP!');</script>");
        }


        //將ERP的TXT檔案上傳
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
}
