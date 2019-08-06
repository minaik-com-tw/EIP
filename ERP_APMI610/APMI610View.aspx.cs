/* mark     Date        Aouther   action         Reason
 * ----------------------------------------------------------
 * V1.0.1  2018/05/07  carol.yeh  Modify  廠商分類，廠商性質，付款廠商編號　回傳至ERP
 * V1.0.2  2018/07/30  carol.yeh  Modify  股票代號要回傳ERP
 */

using System;
using System.Drawing;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;



namespace ERP_APMI610
{
    public partial class APMI610View : SmoothEnterprise.Web.Page
    {

        private bool _NotifyReview1 = false;
        private int Allsn = 0;
        List<exChange> txtOut = new List<exChange>();

        protected void Page_PreRender(object sender, System.EventArgs e)
        {

            //手動發mail 給下一關審核者 
            //Response.Write(_NotifyReview1.ToString() + DateTime.Now.Minute.ToString());
            //Allsn = Allsn + 1;
            
            testmodel("Page_PreRender");
            testmodel(_NotifyReview1.ToString());


            #region
            //信改在 FlowFeedbackViewer1_OnLoadHistor  發送
            /*
            if (_NotifyReview1)
           {
               DBTransfer gd = new DBTransfer();

               string RowC = gd.GetTopfile("select   count(*) from dgflowqueue a left join dguser" +
                   " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") + "'  AND reviewdate IS NULL AND qseq is not null ");
               testmodel("Next Approve:"+RowC);

               tw.com.minaik.eip.WS_SMS ws = new tw.com.minaik.eip.WS_SMS();



               SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
               rss.Open("select   REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid from dgflowqueue a left join dguser" +
                   " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit")+"'  AND reviewdate IS NULL AND qseq is not null ");
               if (!rss.EOF)
               {
                   //Allsn = Allsn + 1;
                   string MId = "{72b8968c-b411-40bc-b3d5-11ea23c4a621}";
                   string PapCaption = "供應商代號申請單";
                   string PID = FIELD_pmcsn.Text + addmemo();
                   string AppName = rss["name"].ToString();
                   string purl = "http://eip.minaik.com.tw" + rss["requesturl"].ToString().ToLower().Replace("edit", "View");
                   string AppMail = rss["email"].ToString();
                   string body = "如您待審核的筆數較多, 可直接至<a href='http://eip.minaik.com.tw/ERP_APMI610/MultiApproval610.aspx'>多筆審核進行簽核</a>";
                   testmodel("MainApprove");

                   sendmail(rss["email"].ToString(), rss["name"].ToString());

                   sendmail("herzog.lin@minaik.com.tw", rss["name"].ToString());
                   testmodel("Deputy_Approve");
                   DeputyApprove(rss["revieweruid"].ToString(), rss["requesturl"].ToString());

                   //建立審核人員  ---------------

                   string mess = " 注意:供應商代號申請," + FIELD_pmcsn.Text + ":" + this.CurrentUser.LogonID;
                   string c = ws.ActSMS("0920828895", mess);

                   //------------------------------
                   string Sqlc = "insert into  [EIPB].[dbo].[doulog](rowid,appid,appdate )values('" + Request.QueryString["rowid"] + "','" +
                                     rss["revieweruid"].ToString() + "',getdate())";


                   gd.RunIUSql(Sqlc);
                   //如果是秀針審核就要發 message

                   testmodel("Modify Approver");

                   //rss.MoveNext();

               }
               else
               {  
                   string mess1 = " Error:供應商代號異常," + FIELD_pmcsn.Text + ":" + this.CurrentUser.LogonID;
                   string c1 = ws.ActSMS("0920828895", mess1);

               }
               testmodel("End  _NotifyReview1");
           }

            */
            #endregion
        }
         
        protected void sendmail(string email, string name)
        {


            String ques;

            MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站<多>)");
            MailAddress to = new MailAddress(email);

            // MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");
            MailAddress bcc2 = new MailAddress("herzog.lin@minaik.com.tw");

            MailMessage message = new MailMessage(from, to);

            ques = name + " 您好:" + "<br>" +
                   "<br>" +
                   "供應商代號申請單現有一筆，正等待您的處理:" + "<br>" +
                   "<br>" +
                   "供應商代號單號 : " + FIELD_pmcsn.Text + "<br>" +
                   "申請日期 : " + FIELD_pmcaud15.Text + "<br>" +
                   "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_APMI610/APMI610View.aspx?rowid=" + Request.QueryString["rowid"] + "\" >至供應商代號申請單系統審核</a>" +
                   "<br>" +
                   //  "如您待審核的筆數較多, 可直接至" + "<a href=\"http://eip.minaik.com.tw/ERP_APMI610/MultiApproval610.aspx\" >供應商代號申請多筆審核</a>" +
                   //  "進行簽核" +
                   "<br>" +
                   "<br>" +
                   "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                   "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                   "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

            message.Subject = "供應商代號申請單-" + FIELD_pmcsn.Text + " 簡稱:" + FIELD_pmca03.Text + "-" + addmemo() + "  等待您的處理";

            message.IsBodyHtml = true;
            message.Body = ques;

            SmtpClient client = new SmtpClient("192.168.0.12");
            client.Credentials = new NetworkCredential("eip", "eip1106");

            client.Send(message);




        }
         
        private void DeputyApprove(string id, string linkstr)
        {
            string MId = "{166f4599-5482-4137-8060-eb1b2b82bbdb}";
            string PapCaption = "供應商代號申請單";
            string PID = FIELD_pmcsn.Text + addmemo();

            string urlink = "http://eip.minaik.com.tw" + linkstr.ToLower().Replace("edit", "View");

            string body = "如您待審核的筆數較多, 可直接至<a href='http://eip.minaik.com.tw/ERP_APMI610/MultiApproval610.aspx'>多筆審核進行簽核</a>";


            ShrFlowMail ActMail = new ShrFlowMail();
            #region 代理人
            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs2.Open(" SELECT b.name name,email FROM dguserdeputy a left join dguser b on a.deputyuid=b.id left join dgflow c on a.sid=c.id  " +
                     " where  a.uid='" + id + "'  " +
                     " and  " +
                     " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                     " (c.typename like 'sharflow121%' and sdate < GETDATE() and edate is null) or " +
                     " (c.typename like 'sharflow121%' and sdate < GETDATE() and edate > GETDATE()) or " +
                     "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");
            while (!rs2.EOF)
            {
                string AppName = rs2["name"].ToString();
                string AppMail = rs2["email"].ToString();
                ActMail.SendMail(MId, PapCaption, PID, AppName, AppMail, urlink, body);
                rs2.MoveNext();

            }
            rs2.Close();

            #endregion
        }

        private string addmemo()
        {
            string snmemo = "";
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

            if (T1 == "U")
            {
                if (T2 == "UN") snmemo = "類別" + FIELD_pmca00.Text + "無異動";
                else snmemo = "類別" + FIELD_pmca00.Text + "有異動";
            }
            if (T1 == "V")
            {
                DBTransfer ds = new DBTransfer();
                // string disrec = ds.GetTopfile("SELECT  COUNT(*) FROM [IP185].[MINAIK].[dbo].[PMC_FILE] where  pmcaud01='N'" +
                //     "  and pmc01='" + FIELD_pmca01.Text + "'");
                string disrec = ds.GetTopfile("SELECT ISNULL(pmcaud01,'Y') pmcaud01 " +
                    "   FROM [EIPB].[dbo].[APMI610_IN] where    " +
                    "   pmcano='" + FIELD_pmcano.Text + "' and  PlantID='MINAIK'");

                // 原本是有Y 那就是要失效
                if (disrec == "Y") snmemo = "類別" + FIELD_pmca00.Text + "->失效";
                else snmemo = "類別" + FIELD_pmca00.Text + "->生效";
            }


            if (T1 == "I") snmemo = "類別" + FIELD_pmca00.Text;

            return snmemo;


        }

        protected void Page_Load(object sender, System.EventArgs e)
        {


            //(Request.RawUrl.ToString().Trim().ToLower().Replace("view","edit"));
            //Response.Write(" select revieweruid,text  from  dgflowqueue   where requesturl= '" + Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "'" +
            //   "  and revieweruid='" + this.CurrentUser.ID.Substring(1, 36) +
            //   "' and  initdate=(select MAX(initdate)   from  dgflowqueue    where requesturl= '" +
            //   Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "')");
            // //try
            //{
            //Allsn = Allsn + 1;
            //testmodel("Page_Load");
            //Response.Write(Request.RawUrl.ToString().Trim().Replace("view", "edit")+"--");
            if (Utility.MIS_Manager(this.CurrentUser.LogonID))
            {
                InputButton2.Visible = true;
                InputButton2.Text = "upload Txt(H)";

                InputButton1.Visible = true;
                InputButton1.Text = "Save(H)";
            }
             

            if (!this.IsPostBack)
            {
                TexBankAco.Attributes["onchange"] = "BankChange()";
                Texpmca02.Attributes["onchange"] = "BankChange()";

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT [GEB01] ,[GEB01]+'---'+[GEB02] name  FROM [IP185].[MINAIK].[dbo].[GEB_FILE]  order by geb01 ");
                while (!rs.EOF)
                {
                    Lispmca09.Items.Add(new ListItem(rs["name"].ToString(), rs["geb01"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();

                //PMCA_File
                rs.Open("SELECT *  FROM eipb.dbo.APMI610_IN   WHERE rowid='" + Request.QueryString["rowid"] + "' ");
                // Response.Write("SELECT a.*,name FROM eipb.dbo.APMI610_IN a left join dguser  on erpid=pmcauser  WHERE rowid='" + Request.QueryString["rowid"] + "' ");

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


                    FIELD_pmca04_2.Text = rs["pmca901"].ToString();


                    this.FIELD_gea02_0.Text = rs["gea02_0"].ToString();

                    this.FIELD_geb02_1.Text = rs["geb02_1"].ToString();


                    this.FIELD_pmca081.Text = rs["pmca081"].ToString();
                    this.FIELD_pmca082.Text = rs["pmca082"].ToString();
                    this.FIELD_pmca091.Text = rs["pmca091"].ToString() + " " + rs["pmca092"].ToString() + " " +
                               rs["pmca093"].ToString() + " " + rs["pmca094"].ToString();



                    this.FIELD_pmca10.Text = rs["pmca10"].ToString();
                    this.FIELD_pmca11.Text = rs["pmca11"].ToString();

                    this.FIELD_pmca14.Text = rs["pmca14"].ToString();

                    this.hiden_pmca17.Value = rs["pmca17"].ToString();
                    this.FIELD_pmca17.Text = rs["pma02_2"].ToString();
                    this.FIELD_pmca22.Text = rs["pmca22"].ToString();
                    this.FIELD_pmca24.Text = rs["pmca24"].ToString();


                    this.FIELD_pmca30.Text = rs["pmca30"].ToString();

                    string[] type = rs["pmca30"].ToString().Split(':');
                    this.hide_pmca30.Value = type[0];

                    this.FIELD_gec02_4.Text = rs["gec02_4"].ToString();

                    this.FIELD_oah02_5.Text = rs["oah02_5"].ToString();
                    this.FIELD_pmca52.Text = rs["pmca52"].ToString();

                    this.FIELD_pmca904.Text = rs["pmca904"].ToString();
                    this.FIELD_pmca911.Text = rs["pmca911"].ToString();
                    this.FIELD_pmcauser.Text = Utility.GetGIT_UserName(rs["pmcauser"].ToString());
                    this.FIELD_pmcagrup.Text = rs["gem02_6"].ToString();

                    this.FIELD_pmcaud15.Text = rs["pmcaud15"].ToString();
                    Labpmcaud01.Text = rs["pmcaud01"].ToString();

                    //申請原因類別
                    List1.Visible = false;
                    List2.Visible = false;
                    if (Repatt.Value == "I") //價格優勢 等等
                    {
                        List1.Visible = true;
                        List1.SelectedValue = rs["RepReason"].ToString();
                    }
                    else
                    {
                        List2.Visible = true;
                        List2.SelectedValue = rs["RepReason"].ToString();
                    }
                    //----------------------------------------------
                    InpPurDesc1.Text = rs["RRDesc1"].ToString();
                    InpPurDesc2.Text = rs["RRDesc2"].ToString();

                    //
                    TexBankAco.Text = rs["pmca56"].ToString();

                    TexBankSn.Text = rs["pmca55"].ToString();

                    TxtRecName.Text = rs["pmca12"].ToString();
                    //外幣 start-----
                    Texpmca01.Text = rs["ta_pmca01"].ToString();
                    Texpmca02.Text = rs["ta_pmca02"].ToString();
                    Texpmca03.Text = rs["ta_pmca03"].ToString();
                    Texpmca04.Text = rs["ta_pmca04"].ToString();
                    Texpmca05.Text = rs["ta_pmca05"].ToString();
                    Texpmca06.Text = rs["ta_pmca06"].ToString();
                    Texpmca07.Text = rs["ta_pmca07"].ToString();
                    Lispmca08.SelectedValue = rs["ta_pmca08"].ToString();

                    if (rs["ta_pmca09"].ToString() == "") Lispmca09.SelectedValue = "TW";
                    else Lispmca09.SelectedValue = rs["ta_pmca09"].ToString();


                    if (rs["ta_pmca13"].ToString() == "Y") CheckBox2.Checked = true;
                    // 外幣  end
                    CheckBox1.Checked = false;
                    CheckBox3.Checked = false;
                    CheRes.Checked = false;
                    //   LisBankSn.SelectedValue = rs["pmca55"].ToString();
                    if (rs["pmca23"].ToString() != "")
                        LisRes.SelectedValue = rs["pmca23"].ToString().Substring(0, 1);
                    DBTransfer os = new DBTransfer();

                    TexBankName.Text = os.GetTopfile(" SELECT nmt02   FROM [IP185].[MINAIK].[dbo].[NMT_FILE]  where nmt01='" + rs["pmca55"].ToString() + "'");
                    // Response.Write(" SELECT nmt02   FROM [IP185].[MINAIK].[dbo].[NMT_FILE]  where nmt01='" + rs["pmca55"].ToString() + "'");

                    //是否為關係人

                    if (rs["pmca903"].ToString() == "Y") CheckBox1.Checked = true;
                    //B2B廠商否
                    if (rs["ta_pmca15"].ToString() == "Y") CheckBox3.Checked = true;
                    //拍發兩通電文
                    if (rs["ta_pmca37"].ToString() == "Y") CheRes.Checked = true;

                    FIELD_ta_pmca40.Text = rs["ta_pmca40"].ToString();
                    FIELD_ta_pmca41.Text = rs["ta_pmca41"].ToString();


                    //產業別
                    Inta_pmca42.Text = rs["ta_pmca42"].ToString() + "-" + rs["tc_oah02_8"].ToString().Trim();

                    //加16個 暈倒
                    Tex_ta_pmca43a.Text = rs["ta_pmca43a"].ToString();
                    Tex_ta_pmca43b.Text = rs["ta_pmca43b"].ToString();
                    Tex_ta_pmca43c.Text = rs["ta_pmca43c"].ToString();

                    Tex_ta_pmca44a.Text = rs["ta_pmca44a"].ToString();
                    Tex_ta_pmca44b.Text = rs["ta_pmca44b"].ToString();
                    Tex_ta_pmca44c.Text = rs["ta_pmca44c"].ToString();

                    Tex_ta_pmca45a.Text = rs["ta_pmca45a"].ToString();
                    Tex_ta_pmca45b.Text = rs["ta_pmca45b"].ToString();
                    Tex_ta_pmca45c.Text = rs["ta_pmca45c"].ToString();

                    Tex_ta_pmca46a.Text = rs["ta_pmca46a"].ToString();
                    Tex_ta_pmca46b.Text = rs["ta_pmca46b"].ToString();
                    Tex_ta_pmca46c.Text = rs["ta_pmca46c"].ToString();
                    Tex_ta_pmca46d.Text = rs["ta_pmca46d"].ToString();
                    Tex_ta_pmca46e.Text = rs["ta_pmca46e"].ToString();
                    Tex_ta_pmca46f.Text = rs["ta_pmca46f"].ToString();
                    Tex_ta_pmca46g.Text = rs["ta_pmca46g"].ToString();


                    Tex_ta_pmca48.Text = rs["ta_pmca48"].ToString();
                    Tex_ta_pmca47.Text = rs["ta_pmca47"].ToString();



                    displayfile(false);

                    ///將差異顯示在 control
                    warrLab();

                    //Response.Write(FIELD_pmcano.Text.Substring(1,2));
					//Response.Write(rs["status"]);

                    if (rs["status"].ToString() != "C") //未審完者，才辦別  v1.0.2
                    { 

                    string Levstr = os.GetTopfile("select  text  from  dgflowqueue   where revieweruid='" + this.CurrentUser.ID + "' and  requesturl= '" + Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "'" +
                        "and  initdate=(select MAX(initdate)   from  dgflowqueue    where requesturl= '" +
                       Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "')");

                    //Response.Write(("select  text  from  dgflowqueue   where revieweruid='" + this.CurrentUser.ID + "' and  requesturl= '" + Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "'" +
                    //    "and  initdate=(select MAX(initdate)   from  dgflowqueue    where requesturl= '" +
                    //   Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "')"));

                    //add by 20180402 carol ,將自動存檔，改為手動存檔
                    if (Levstr == "財務1" || Levstr == "財務主管" || Levstr == "財務3")
                    {
                        InputButton1.Visible = true;
                    }
                    }

                    // Response.Write(Levstr.Trim());

                    setIcon(rs["PlantID"].ToString());

                }
                else
                {
                    Response.Redirect("APMI610.aspx");
                }
            }
            //}
            //catch
            //{
            //    Response.Redirect("APMI610.aspx");
            //}
        }

        private void testmodel(string str)
        {

            //str = str + "#" + Request.QueryString["rowid"].ToString() + "#" + this.CurrentUser.LogonID;
            //    DBTransfer ds = new DBTransfer();
            //    string sqc = "insert into misbuffer(caption)values('" + str+"')";
            //    ds.RunIUSql(sqc); 
        }
         
        //將差異顯示在 control
        private void warrLab()
        {


            Label tb = new Label();


            //if (tb != null)
            //{

            //}
            //else Response.Write("NULL");

            // tb.ForeColor = Color.Red;


            // LABEL_pmca071.ForeColor = Color.Red;
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            ds.Open("SELECT   Fnm  FROM [EIPB].[dbo].[APMI610_Mod]  where rowid='" + Request.QueryString[0] + "'");
            while (!ds.EOF)
            {
                string cnm = "LABEL_" + ds[0].ToString();

                //  Response.Write(cnm + "<br>");
                tb = (Label)MainPanel.FindControl(cnm);
                if (tb != null)
                {
                    tb.ForeColor = Color.Red;
                }

                ds.MoveNext();
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



        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            this.GoBack();
        }

        protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
        {

            //testmodel("FlowFeedback_Click");

            //假如是新增,且目前為財務3,若供應商代號為空白,就不能PASS
            DBTransfer ds = new DBTransfer();
            string Levstr = ds.GetTopfile("select  text  from  dgflowqueue   where requesturl= '" + Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "'" +
                "and  initdate=(select MAX(initdate)   from  dgflowqueue    where requesturl= '" +
               Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "')");

            if ((FIELD_pmca00.Text == "I:新增") && (Levstr == "財務3"))
            {
                if (FIELD_pmca01.Text == "") Response.Write("<script>alert('請輸入供應商編號');</script>");
                else this.FlowFeedback1.Commit();

            }
            else this.FlowFeedback1.Commit();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /* if(Panel3.Visible)  Panel3.Visible = false;
             else Panel3.Visible = true;

             gvBind(GridView1);
             * */
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            /*SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs.Open("SELECT * FROM eipb.dbo.APMI610_IN_detail WHERE 1=0");
            rs.Add();
                 rs["sn"]=FIELD_pmcsn.Text;
                 rs["type"]=Texpmca001.Text;
                 rs["Tman"]=TextBox2.Text;
                 rs["TEL"]=TextBox1.Text;
                 rs["main"]=TextBox3.Text;
                 rs["remark"]=TextBox4.Text;
                 rs["email"] = TextBox5.Text;


            rs.Update();
            rs.Close();
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "Save", "alert('寫入完成!');", true);
            */
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            /* int index = Convert.ToInt32(e.CommandArgument);
             GridViewRow selectedRow = GridView1.Rows[index];
             ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "Save", "alert('" + selectedRow.Cells[3].Text + "!');", true);

            // gvBind3(GridView3, Request.QueryString["rowid"], selectedRow.Cells[1].Text);

             * 
             */
        }


        private void gvBind(GridView gv)
        {
            /* SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
             string str = "SELECT   [detid],[sn],[type],[Tman]"+
                 ",[TEL],[main],[remark],[email] FROM [EIPB].[dbo].[APMI610_IN_detail] "+
                 " where  sn='" + FIELD_pmcsn.Text + "'";


             SqlDataAdapter da = new SqlDataAdapter(str, conn);
             {
                 DataTable dt = new DataTable();
                 da.Fill(dt);
                 gv.DataSource = dt;
                 gv.DataBind();
             }

             */
        }

        //儲存
        protected void InputButton1_Click(object sender, EventArgs e)
        {
            savedetail();
        }

        private void savedetail()
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs.Open("SELECT * FROM eipb.dbo.APMI610_IN WHERE rowid='" + Request.QueryString[0] + "'");
            if (!rs.EOF)
            {
                rs["pmca56"] = TexBankAco.Text;
                rs["pmca55"] = TexBankSn.Text;
                rs["pmca12"] = TxtRecName.Text;
                //外幣 start-----
                rs["ta_pmca01"] = Texpmca01.Text;
                rs["ta_pmca02"] = Texpmca02.Text;
                rs["ta_pmca03"] = Texpmca03.Text;
                rs["ta_pmca04"] = Texpmca04.Text;



                rs["ta_pmca05"] = Texpmca05.Text;
                rs["ta_pmca06"] = Texpmca06.Text;
                rs["ta_pmca07"] = Texpmca07.Text;
                rs["ta_pmca08"] = Lispmca08.SelectedValue;
                rs["ta_pmca09"] = Lispmca09.SelectedValue;

                rs["pmca04"] = FIELD_pmca04.Text;
                rs["pmca01"] = FIELD_pmca01.Text;
                rs["pmca901"] = FIELD_pmca04_2.Text;
                // 外幣  end
                //是否為關係人
                if (CheckBox1.Checked) rs["pmca903"] = "Y"; else rs["pmca903"] = "N";

                //B2B廠商否
                if (CheckBox2.Checked) rs["ta_pmca13"] = "Y"; else rs["ta_pmca13"] = "N";



                //B2B廠商否
                if (CheckBox3.Checked) rs["ta_pmca15"] = "Y"; else rs["ta_pmca15"] = "N";



                //拍發兩通電文
                if (CheRes.Checked) rs["ta_pmca37"] = "Y"; else rs["ta_pmca37"] = "N";


                rs["pmca23"] = LisRes.SelectedValue;

                rs.Update();
            }
            rs.Close();

            //setTxtOut();

            #region
            SmoothEnterprise.Database.DataSet DBItem = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            DBItem.Open("SELECT * FROM eipb.dbo.APMI610_IN_detail where sn= '" + FIELD_pmcsn.Text + "'");

            while (!DBItem.EOF)
            {
                Utility.log(CurrentUser.Name + " Del-APMI610_IN_detail sn:" + DBItem["sn"].ToString() + ",type:" + DBItem["type"].ToString() + ",Tman:" + DBItem["Tman"].ToString() + ",TEL:" + DBItem["TEL"].ToString() + ",main:" + DBItem["main"].ToString() + ",email:" + DBItem["email"].ToString());
                DBItem.Delete();
                DBItem.MoveNext();
            }
            DBItem.Update();

            //Utility.log(CurrentUser.Name + " APMI610_IN_detail sn:" + DBItem["sn"].ToString() + ",delete OK");

            if (!String.IsNullOrEmpty(Request.Form["typenm"]))
            {
                //Utility.log(CurrentUser.Name + " APMI610_IN_detail sn:" + DBItem["sn"].ToString() + ",Add 供應商聯絡人 ");
                //Utility.log(CurrentUser.Name + " APMI610_IN_detail sn:" + DBItem["sn"].ToString() + ",typenm：" + Request.Form["typenm"]);

                String[] typenm = Request.Form["typenm"].Split(',');
                String[] Tman = Request.Form["Tman"].Split(',');
                String[] TEL = Request.Form["TEL"].Split(',');
                String[] main = Request.Form["main"].Split(',');
                String[] remark = Request.Form["Remark"].Split(',');
                String[] email = Request.Form["email"].Split(',');
                int x = 0;

                foreach (string bb in typenm)
                {
                    // Utility.log(CurrentUser.Name + "ADD- APMI610_IN_detail sn:" + DBItem["sn"].ToString() + "bb：" + bb);

                    if (!String.IsNullOrEmpty(bb))
                    {
                        Response.Write("OK-Proposal_ReSolution<br>");
                        DBItem.Add();
                        DBItem["sn"] = FIELD_pmcsn.Text;
                        DBItem["type"] = typenm[x];
                        DBItem["Tman"] = Tman[x];
                        DBItem["TEL"] = TEL[x];
                        DBItem["main"] = main[x];
                        DBItem["remark"] = remark[x];
                        DBItem["email"] = email[x];

                        Utility.log(CurrentUser.Name + " ADD-APMI610_IN_detail sn:" + DBItem["sn"].ToString() + ",type:" + DBItem["type"].ToString() + ",Tman:" + DBItem["Tman"].ToString() + ",TEL:" + DBItem["TEL"].ToString() + ",main:" + DBItem["main"].ToString() + ",email:" + DBItem["email"].ToString());

                        DBItem.Update();

                        //item_Math = item_Math + bb + "      -      " + resolution[x] + "            (" + describe[x] + ")<BR>";
                    }
                    x = x + 1;
                }
            }
            DBItem.Close();
            #endregion
        }

        //v1.0.1修改更新格式
        private void setTxtOut()
        {
            
            setTxtValue("pmca17", hiden_pmca17.Value);
            setTxtValue("pmca56", TexBankAco.Text);
            setTxtValue( "pmca55", TexBankSn.Text);
            setTxtValue("pmca12", TxtRecName.Text);
            setTxtValue("ta_pmca01", Texpmca01.Text);
            setTxtValue("ta_pmca02", Texpmca02.Text);
            setTxtValue("ta_pmca03", Texpmca03.Text);
            setTxtValue("ta_pmca04", Texpmca04.Text);
            setTxtValue("ta_pmca05", Texpmca05.Text);
            setTxtValue("ta_pmca06", Texpmca06.Text);
            setTxtValue("ta_pmca07", Texpmca07.Text);

            setTxtValue("ta_pmca08", Lispmca08.Text);
            setTxtValue("ta_pmca09", Lispmca09.Text);
            setTxtValue("pmca04", FIELD_pmca04.Text);
            setTxtValue("pmca01", FIELD_pmca01.Text);
            setTxtValue("pmca901", FIELD_pmca04_2.Text);
            setTxtValue("pmca903", CheckBox1.Checked==true? "Y":"N");
            setTxtValue("ta_pmca13", CheckBox2.Checked == true ? "Y" : "N");
            setTxtValue("ta_pmca15", CheckBox3.Checked == true ? "Y" : "N");
            setTxtValue("ta_pmca37", CheRes.Checked == true ? "Y" : "N");
            setTxtValue("pmca23", LisRes.SelectedValue);
             
            setTxtValue("pmca30", hide_pmca30.Value);
            setTxtValue("ta_pmca47", Tex_ta_pmca47.Text); //v1.0.2
        }

        private void setTxtValue(string Column, string Value)
        {
            exChange Item = new exChange();
            Item.Column = Column;
            Item.Value = Value;
            txtOut.Add(Item); 
        }

        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {

            testmodel("FlowFeedbackViewer1_OnLoadHistor");

            testmodel(_NotifyReview1.ToString());
            testmodel(Allsn.ToString());

            if ((Allsn.ToString() == "0") && (_NotifyReview1))
            {
                //tw.com.minaik.eip.WS_SMS ws = new tw.com.minaik.eip.WS_SMS();


                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rss.Open("select   REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid from dgflowqueue a left join dguser" +
                  " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") + "'  AND reviewdate IS NULL AND qseq is not null ");
                if (!rss.EOF)
                {

                    Utility.log(1,CurrentUser.Name, " FlowFeedbackViewer1_OnLoadHistory","mail:"+ rss["email"].ToString()+"  " +rss["name"].ToString()," requesturl = '" + Request.RawUrl.ToString() + "'");
                    string rech = rss["email"].ToString();//+ "多";
                    testmodel(rech);
                    sendmail(rss["email"].ToString(), rss["name"].ToString());
                    sendmail("herzog.lin@minaik.com.tw", rss["name"].ToString());
                    DeputyApprove(rss["revieweruid"].ToString(), rss["requesturl"].ToString());

                    //建立審核人員 ----------------------
                    DBTransfer gd = new DBTransfer();

                    string Sqlc = "insert into  [EIPB].[dbo].[doulog](rowid,appid,appdate )values('" + Request.QueryString["rowid"] + "','" +
                                      rss["revieweruid"].ToString() + "',getdate())";
                    gd.RunIUSql(Sqlc);
                    //------------------------------------
                    string mess1 = " 注意:供應商代號簽核發動," + FIELD_pmcsn.Text + ":" + this.CurrentUser.LogonID;
                    //string c1 = ws.ActSMS("0920828895", mess1);
                }
                else
                {
                    string mess1 = " Error:供應商代號異常," + FIELD_pmcsn.Text + ":" + this.CurrentUser.LogonID;
                    //string c1 = ws.ActSMS("0920828895", mess1);
                    //沒辦法只有補這段去 外掛
                    sendmail();
                }
                Allsn++;
            }
            //  SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs. b=new  
            //  testmodel(b.ResultType.ToString());
            try
            {
                SmoothEnterprise.Web.UI.HTMLControl.InputText it2;
                object obj2 = this.FlowFeedbackViewer1.HistoryView.FindControl("S_Comment");

                it2 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj2;
                it2.Enabled = true;
                it2.ReadOnly = true;
                it2.Text = (string)e["Flow_Comment"];
                // Response.Write(it2.Text + "--");


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

        private void sendmail()
        {
            string ques = " 您好:" + "<br>" +
                    "<br>" +
                    "供應商代號申請單現有一筆，正等待您的處理:" + "<br>" +
                    "<br>" +
                    "供應商代號單號 : " + FIELD_pmcsn.Text + "<br>" +
                    "申請日期 : " + FIELD_pmcaud15.Text + "<br>" +
                    "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_APMI610/APMI610View.aspx?rowid=" + Request.QueryString["rowid"] + "\" >至供應商代號申請單系統審核</a>" +
                    "<br>" +
                    //  "如您待審核的筆數較多, 可直接至" + "<a href=\"http://eip.minaik.com.tw/ERP_APMI610/MultiApproval610.aspx\" >供應商代號申請多筆審核</a>" +
                    //  "進行簽核" +
                    "<br>" +
                    "<br>" +
                    "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                    "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                    "感謝您對員工入口網站的支持與愛護，<font Color=red>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

            string Subject = "供應商代號申請單-" + FIELD_pmcsn.Text + " 簡稱:" + FIELD_pmca03.Text + "-" + addmemo() + "  等待您的處理";

            DBTransfer ds = new DBTransfer();

            string sp = "NA-" + Request.QueryString[0].ToString();

            string sql = " insert into IP238.[FacMat].[dbo].[MailControl](name,subject,mail_content) values ('" +
                   sp + "','" + Subject + "','" + ques + "')";
            ds.RunIUSql(sql);


        }

        protected void FlowFeedback1_FeedbackComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
        {
            testmodel("FlowFeedback1_FeedbackComplete");


            SmoothEnterprise.Web.UI.HTMLControl.InputText it;
            object obj = this.FlowFeedback1.ReplyView.FindControl("Input_Comment");
            it = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj;
            e["Flow_Comment"] = it.Text;


            SmoothEnterprise.Web.UI.HTMLControl.InputText it3;
            object obj3 = this.FlowFeedback1.ReplyView.FindControl("InputText3");
            it3 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj3;
            it3.Text = this.CurrentUser.LogonID;
            e["InputText3"] = it3.Text;

            //寫入是否為代理人
            SmoothEnterprise.Web.UI.HTMLControl.InputText it4;
            object obj4 = this.FlowFeedback1.ReplyView.FindControl("IniReviewer");
            it4 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj4;
            e["IniReviewer"] = "代";


            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            ds.Open(" select revieweruid,text  from  dgflowqueue   where requesturl= '" + Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "'" +
               // "  and revieweruid='" + this.CurrentUser.ID.Substring(1, 36) +
               "and  initdate=(select MAX(initdate)   from  dgflowqueue    where requesturl= '" +
               Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "')");


            if (!ds.EOF)
            {

                e["IniReviewer"] = "";
                //自動存檔有問題，拿掉後，改手動。20180402
                //if ((ds["text"].ToString().Trim() == "財務1") ||
                //    (ds["text"].ToString().Trim() == "財務主管") ||
                //    (ds["text"].ToString().Trim() == "財務3")) savedetail();
                //財務2 savedetail();

            }
            ds.Close();

            if ((this.FlowFeedback1.ResultType.ToString() == "Return") ||
                (this.FlowFeedback1.ResultType.ToString() == "Back"))
            {

                e.NodeComplete = true;
            }

            //-------------------------------------

            if (this.FlowFeedback1.ResultType.ToString() == "Next")
            {

                //testmodel("FlowFeedback1_FeedbackComplete_Next");
                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rss.Open("select   REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid from dgflowqueue a left join dguser" +
                  " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") + "'  AND reviewdate IS NULL AND qseq is not null ");
                if (!rss.EOF)
                {

                    //testmodel(rss["email"].ToString());
                }

            }




            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
                  "RedirectAfterCommit",
                  "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");


        }


        protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
        {


            testmodel("FlowFeedback1_FlowNodeComplete");


            try
            {

                //_NodeType = e.ResultType.ToString();
                if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
                {
                    _NotifyReview1 = true;

                    // testmodel("Next");
                    //testmodel(e.NextNode.
                    e.NextNode = e.FlowNode.DefaultNode();
                    e.NextNode.ReviewerURL = "/erp_apmi610/apmi610view.aspx";



                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rss.Open("select   REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid from dgflowqueue a left join dguser" +
                      " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") + "'  AND reviewdate IS NULL AND qseq is not null ");
                    if (!rss.EOF)
                    {

                        testmodel(rss["email"].ToString());
                    }
                    else
                    {
                        testmodel("00");
                    }


                }
            }
            catch (Exception ex)
            {

            }

        }

        protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
        {
            DBTransfer RunCommand = new DBTransfer();
            ShrFlowMail Usemail = new ShrFlowMail();
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            string Sql = "";
            string requesturl = "";
            #region   流程 Complete
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete)
            {

                //寫回 status 為 C  表示 Complete
                //恢復staus flag            

                Sql = "update [EIPB].[dbo].[APMI610_IN] set   status='C' where  rowid='" + Request.QueryString["rowid"] + "'";

                RunCommand.RunIUSql(Sql);

                //發信通知送審者,表示單據已經簽核完畢  AppDate     ,[Appuser]
                ds.Open("select top 1 email,name  from dgflowqueue a " +
                    " left join dguser b on a.inituid=b.id  where  " +
                    "  requesturl='" + Request.RawUrl.ToString().Trim().ToLower().Replace("view", "edit") + "'   order by a.initdate asc    ");
                if (!ds.EOF)
                {
                    string MId = "{c294bd9b-ebbd-4c6a-a608-c5175f3a3de2}";

                    requesturl = "http://eip.minaik.com.tw/" + Request.RawUrl.ToString().Trim();

                    Usemail.FinishApprove(MId, "供應商代號申請", FIELD_pmcsn.Text,
                        "herzog.lin@minaik.com.tw", "", " herzog", requesturl, "審核完成");
                    Usemail.FinishApprove(MId, "供應商代號申請", FIELD_pmcsn.Text,
                        ds["email"].ToString(), "", ds["name"].ToString(), requesturl, "審核完成");
                    Usemail.FinishApprove(MId, "供應商代號申請", FIELD_pmcsn.Text,
                        "pearl.hsieh@minaik.com.tw", "", " pearl", requesturl, "審核完成");

                    Usemail.FinishApprove(MId, "供應商代號申請", FIELD_pmcsn.Text,
                        "miranda.chen@minaik.com.tw", "", " miranda", requesturl, "審核完成");
                }
                //完成後執行上傳TXT
                if (FIELD_pmca00.Text == "I:新增")
                {
                    // Usemail.FinishApprove(MId, "供應商代號申請", FIELD_pmcsn.Text,
                    //  ds["email"].ToString(), "", this.CurrentUser.Name, requesturl, "審核完成");
                    string nm = FIELD_pmca01.Text + "--" + FIELD_pmca03.Text;
                    TxtFtpi();
                    //MailtoAcc(nm,requesturl);


                }

                if (FIELD_pmca00.Text == "U:修改") TxtFtpu();

                //  if (FIELD_pmca00.Text == "V:生效否") TxtFtpV();
                if (FIELD_pmca00.Text == "V:生效否")
                {
                    if ((FIELD_pmca00.Text == "V:生效否") && (Labpmcaud01.Text == "N")) TxtFtpu();
                    else TxtFtpV();
                }
                 

                Response.Redirect("http://" + Request.Url.Authority.ToString() + "/Flowwork/MyApproval.aspx");

                ds.Close();
            }
            #endregion



            #region 流程 Reject

            if ((e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate) ||
                    (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Return))
            {
                Sql = "update [EIPB].[dbo].[APMI610_IN] set   status='R' where  rowid='" + Request.QueryString["rowid"] + "'";

                RunCommand.RunIUSql(Sql);

                //  SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                ds.Open("SELECT top 1 name,email  from  EIPA.dbo.dgflowqueue a " +
                    " left join dguser  b  on a.inituid=b.id  where requesturl  " +
                    " like '%" + Request.QueryString[0] + "%' order by a.initdate asc");
                //             " left join [dguser] b on a.IniUser=b.id   where rowid='" + Request.QueryString[0] + "'");
                if (!ds.EOF)
                {
                    string MId = "{5a3f8c87-e0dc-4bbb-8116-661521bfc6c7}";
                    string PapCaption = "供應商代號申請";
                    string PID = FIELD_pmcsn.Text;

                    string receivername = ds["name"].ToString();
                    string requestername = this.CurrentUser.Name;
                    string sendername = this.CurrentUser.Name;
                    requesturl = "http://eip.minaik.com.tw" + Request.RawUrl.ToString().Trim().ToLower().Replace("view", "edit");
                    string AppMail = ds["email"].ToString();
                    string reviewresult = "退回";
                    string body = "";


                    Usemail.StopApprove(MId, PID, PapCaption, receivername, requestername, requesturl,
                     reviewresult, body, AppMail);
                }
            }

            #endregion


        }

        private void MailtoAcc(string name, string link)
        {
            MailAddress from = new MailAddress("eip@minaik.com.tw", "供應商代號申請新增完成");
            MailAddress to = new MailAddress("MAT_ACC會計部@minaik.com.tw");
            MailMessage message = new MailMessage(from, to);
            message.Subject = "供應商代號申請新增-" + name;
            string ques = "";
            ques = "您好:" + "<br>" +
                   "<br>" +
                   "供應商代號申請新增完成~<br>" +
                   "<br>" +
                   "詳細資料如下：" + link + "<br>" +
                   "因本信件為系統自動發送,請勿直接以此郵件回覆。";
            message.IsBodyHtml = true;
            message.Body = ques;
            SmtpClient client = new SmtpClient("192.168.0.12");
            client.Send(message);
        }

 
        /// <summary>
        /// 新增檔xml
        /// </summary>
        private void TxtFtpi()
        {
             
            string st = "1";
            string U = "I";
            string[] Fnm = new string[] { "pmca56", "pmca55", "ta_pmca01", "ta_pmca02", "ta_pmca03",
             "ta_pmca04", "ta_pmca05", "ta_pmca06", "ta_pmca07", "ta_pmca08", "ta_pmca09", "ta_pmca13",
             "ta_pmca15","ta_pmca37","pmca23","pmca01","pmca04","pmca901","pmca903","pmca12",
             "ta_pmca47","ta_pmca48" //v1.0.2
            };
            string FDetailnm = FIELD_PlantID.Text.Trim() + "_apmi201-" + FIELD_pmcano.Text.Trim() + ".txt";
            string FMainnm = FIELD_PlantID.Text.Trim() + "_apmi600-" + FIELD_pmcano.Text.Trim() + ".txt";


            FileStream fs = new FileStream(@"D:\APMI610_XML\4GL\" + FDetailnm, FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs, Encoding.Default);
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);


            //email

            // sw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"pmcaud03\",\"" + st + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");

            rs.Open("SELECT  sn , type , Tman , TEL , main , remark , email " +
                "   FROM  EIPB.dbo.APMI610_IN_detail  where sn='" + FIELD_pmcsn.Text + "'");
            while (!rs.EOF)
            {    
                sw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"" + FIELD_pmca01.Text.Trim() + "\",\"" + rs["Tman"].ToString() + "\",\"" + rs["TEL"].ToString() + "\",\"" +
                                   rs["remark"].ToString() + "\",\"" + rs["main"].ToString() + "\",\"" + rs["type"].ToString() + "\",\"" + rs["email"].ToString() + "\"");
                
                rs.MoveNext();
            }
            rs.Close();

            sw.Close();
            fs.Close();
            Upload("D:\\APMI610_XML\\4GL\\" + FDetailnm, "ftp://192.168.0.250/" + FDetailnm, "4gl", "4gl");
            DBTransfer gs = new DBTransfer();
            string gssql = "";

            //會計異動部份
            FileStream fn = new FileStream(@"D:\APMI610_XML\4GL\" + FMainnm, FileMode.Create, FileAccess.Write);
            StreamWriter nw = new StreamWriter(fn, Encoding.Default);
            nw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"pmcaud03\",\"" + st + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");

            //資料逐一寫入
            for (int i = 0; i < Fnm.Length; i++)
            {

                gssql = "select " + Fnm[i] + " from eipb.dbo.APMI610_IN " +
                         " where  rowid='" + Request.QueryString["rowid"] + "'";
                st = gs.GetTopfile(gssql);

                Response.Write(Fnm[i] +"["+st +"]<br>");
                nw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"" + Fnm[i] + "\",\"" + st + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");
                
            }


            nw.Close();
            fn.Close();
            Upload("D:\\APMI610_XML\\4GL\\" + FMainnm, "ftp://192.168.0.250/" + FMainnm, "4gl", "4gl");

        }

        private void TxtFtpV()
        {
            string st = "1";
            string U = "V";
            /*string[] Fnm = new string[] { "pmca56", "pmca55", "ta_pmca01", "ta_pmca02", "ta_pmca03", 
                 "ta_pmca04", "ta_pmca05", "ta_pmca06", "ta_pmca07", "ta_pmca08", "ta_pmca09", "ta_pmca13", 
                 "ta_pmca15","ta_pmca37","pmca23","pmca01","pmca04","pmca901","pmca903","pmca12"};

             */
            string FMainnm = FIELD_PlantID.Text.Trim() + "_apmi600-" + FIELD_pmcano.Text.Trim() + ".txt";


            DBTransfer gs = new DBTransfer();
            string gssql = "";

            //會計異動部份
            FileStream fn = new FileStream(@"D:\APMI610_XML\4GL\" + FMainnm, FileMode.Create, FileAccess.Write);
            StreamWriter nw = new StreamWriter(fn, Encoding.Default);
            nw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"pmcaud03\",\"" + st + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");
 
             

            nw.Close();
            fn.Close();
            Upload("D:\\APMI610_XML\\4GL\\" + FMainnm, "ftp://192.168.0.250/" + FMainnm, "4gl", "4gl");

        }

        #region 將ERP的TXT檔案上傳
        internal bool Upload(string fileName, string uploadUrl, string UserName, string Password)
        {

            if (!Utility.isEIP)
            {
                
                Response.Write("Test 環境，沒上傳至ftp");
                return true;
            }
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
        #endregion


        private void TxtFtpu()
        {

            //setTxtOut();
            string st = "1";
            string U = "U";
            string[] Fnm = new string[] {"pmca17", "pmca56", "pmca55", "ta_pmca01", "ta_pmca02", "ta_pmca03",
             "ta_pmca04", "ta_pmca05", "ta_pmca06", "ta_pmca07", "ta_pmca08", "ta_pmca09", "ta_pmca13",
             "ta_pmca15","ta_pmca37","pmca23","pmca01","pmca04","pmca901","pmca903","pmca12",
             "pmca30" //v1.0.1
             ,"ta_pmca47","ta_pmca48" //v1.0.2
            };
            string FDetailnm = FIELD_PlantID.Text.Trim() + "_apmi201-" + FIELD_pmcano.Text.Trim() + ".txt";
            string FMainnm = FIELD_PlantID.Text.Trim() + "_apmi600-" + FIELD_pmcano.Text.Trim() + ".txt";


            // FileStream fs = new FileStream(@"D:\APMI610_XML\4GL\" + FDetailnm, FileMode.Create, FileAccess.Write);
            // StreamWriter sw = new StreamWriter(fs, Encoding.Default);
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
             
            //email

            // sw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"pmcaud03\",\"" + st + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");

            /*  rs.Open("SELECT  sn , type , Tman , TEL , main , remark , email " +
                  "   FROM  EIPB.dbo.APMI610_IN_detail  where sn='" + FIELD_pmcsn.Text + "'");
              while (!rs.EOF)
              {

                  sw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"" + FIELD_pmca01.Text.Trim() + "\",\"" + rs["Tman"].ToString() + "\",\"" + rs["TEL"].ToString() + "\",\"" +
                                     rs["remark"].ToString() + "\",\"" + rs["main"].ToString() + "\",\"" + rs["type"].ToString() + "\",\"" + rs["email"].ToString() + "\"");

                  rs.MoveNext();
              }
              rs.Close();

              sw.Close();
              fs.Close();
              Upload("D:\\APMI610_XML\\4GL\\" + FDetailnm, "ftp://192.168.0.250/" + FDetailnm, "4gl", "4gl");
             */
            DBTransfer gs = new DBTransfer();
            string gssql = "";

            //會計異動部份
            FileStream fn = new FileStream(@"D:\APMI610_XML\4GL\" + FMainnm, FileMode.Create, FileAccess.Write);
            StreamWriter nw = new StreamWriter(fn, Encoding.Default);
            
            nw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"pmcaud03\",\"" + st + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");

            //rs.Open("SELECT  name    from eipb.sys.columns " +
            //    "    where   Object_ID = Object_ID('eipb.dbo.APMI610_IN')");

            //while (!rs.EOF)
            //{

            /* v1.0.1*/

            Dictionary<string, string> back_ERP = new Dictionary<string, string>();//v1.0.2過慮重覆的檔案
            for (int i = 0; i < Fnm.Length; i++)
            {
                //ERP 來源
                gssql = "select " + Fnm[i] + " from eipb.dbo.APMI610_IN " +
                         " where  rowid='" + Request.QueryString["rowid"] + "'";

                st = gs.GetTopfile(gssql);
                
                // nw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"" + Fnm[i] + "\",\"" + st + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");
                back_ERP.Add(Fnm[i], st);
                 rs.MoveNext();

               // Utility.log(1, "TxtFtpu 1 ", FIELD_PlantID.Text.Trim(), Fnm[i], FIELD_pmcano.Text.Trim(), U);
            }
            //*/

            //foreach (exChange item in txtOut)
            //{
               
            //    nw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"" + item.Column + "\",\"" + item.Value + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");
            //}

            //被修改的欄位
            rs.Open("SELECT   Fnm,eipvalue  FROM [EIPB].[dbo].[APMI610_Mod]  where " +
                " rowid='" + Request.QueryString["rowid"] + "'    and  Fnm not in ('pmcagrup','pmcamodu','pmcauser')");
         
            while (!rs.EOF)
            {

                //nw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"carol_test3\",\"" + st + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");
                //nw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"" +
                //    rs["Fnm"].ToString() + "\",\"" + rs["eipvalue"].ToString() + "\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\"");

                //Utility.log(1, "TxtFtpu 2 ", FIELD_PlantID.Text.Trim() , rs["Fnm"].ToString() ,rs["eipvalue"].ToString() , FIELD_pmcano.Text.Trim() ,U);
                //已存在
                if (back_ERP.ContainsKey(rs["Fnm"].ToString()))
                {
                    back_ERP[rs["Fnm"].ToString()] = rs["eipvalue"].ToString();
                }
                else
                {
                    back_ERP.Add(rs["Fnm"].ToString(), rs["eipvalue"].ToString());
                }
                Response.Write(rs["Fnm"].ToString()+":"+ rs["eipvalue"].ToString()+"<br>");
                rs.MoveNext();
            }

            foreach (KeyValuePair<string,string> erp in back_ERP)
            {
                string value = erp.Value;
                if (erp.Key == "pmca30")
                {
                    value = hide_pmca30.Value;
                }

                if (erp.Key == "pmca17")
                {
                    value = hiden_pmca17.Value;
                }

                

                string context = string.Format("\"{0}\",\"{1}\",\"{2}\",\"{3}\",\"{4}\"", FIELD_PlantID.Text.Trim(),erp.Key, value, FIELD_pmcano.Text.Trim(), U);
                nw.WriteLine(context);
            }

            //特別為失效變有效做這個程序
            if ((FIELD_pmca00.Text == "V:生效否") && (Labpmcaud01.Text == "N"))
            {
                nw.WriteLine("\"" + FIELD_PlantID.Text.Trim() + "\",\"" +
                       "pmcacti" + "\",\"Y\",\"" + FIELD_pmcano.Text.Trim() + "\",\"" + U + "\""); 
            }

            

            //}
            rs.Close();

            nw.Close();
            fn.Close();
            Upload("D:\\APMI610_XML\\4GL\\" + FMainnm, "ftp://192.168.0.250/" + FMainnm, "4gl", "4gl");


        }

        protected void InputButton2_Click1(object sender, EventArgs e)
        {
            
            Response.Write(FIELD_pmca00.Text);
            if (FIELD_pmca00.Text == "I:新增")
            {
                TxtFtpi();
            }

            
            if (FIELD_pmca00.Text == "U:修改")
            {
                TxtFtpu();
            }

            if (FIELD_pmca00.Text == "V:生效否")
            {
                if ((FIELD_pmca00.Text == "V:生效否") && (Labpmcaud01.Text == "N")) TxtFtpu();
                else TxtFtpV();
            }

            // if (FIELD_pmca00.Text == "V:生效否")TxtFtpV();
        }


        #region IMultiApproval Members

        public string[] MultiApproval_ResultTypes
        {
            get
            {
                return new string[]{
                    SmoothEnterprise.Flowwork.Control.ReviewResultType.Next.ToString(),
                    SmoothEnterprise.Flowwork.Control.ReviewResultType.Back.ToString(),
                    SmoothEnterprise.Flowwork.Control.ReviewResultType.Return.ToString()
            };
            }
        }

        #endregion
        protected void Button2_Click(object sender, EventArgs e)
        {
            //string fname="Herzog";
            //string femail="herzog.lin@minaik.com.tw";
            //sendmail();



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


    }
}


public class exChange
{
    //"MINAIK","pmca30","3:兩者","201-1690004","U"

    public string Factory;
    public string Column;
    public string Value;
    public string pmcano;
    public string Action;


}