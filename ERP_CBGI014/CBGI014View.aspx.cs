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
using System.Data.SqlClient;
using System.IO;
using System.Threading;
using System.Text;
using System.Net;
using System.Data.SqlClient;

namespace ERP_CBGI014
{
    public partial class CBGI014View : SmoothEnterprise.Web.Page
    {
        private bool _NotifyReview = false;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            
            if (!this.IsPostBack)
            {
                Hid1.Value = Request.QueryString[0];
                Button2.Attributes.Add("onclick", "imageover('http://eip.minaik.com.tw/ERP_CBGI014/showLis.aspx?rowid=" + Request.QueryString[0].ToString() + "')");
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT * FROM eipb.dbo.CBGI014_Head WHERE rowid='" + Request.QueryString["rowid"] + "' ");
                if (!rs.EOF)
                {


                    this.FIELD_tc_cba00.Text = rs["tc_cba00"].ToString();
                    this.FIELD_tc_cba01.Text = rs["tc_cba02"].ToString();
                    this.FIELD_gem02_0.Text = rs["tc_cba01"].ToString()+"-"+ rs["gem02_0"].ToString();
                    //this.FIELD_tc_cba02.Text = rs["tc_cba02"].ToString();
                    this.FIELD_tc_cbauser.Text = rs["gen02_1"].ToString();
                    //this.FIELD_tc_cbagrup.Text = rs["tc_cbagrup"].ToString();

                    this.FIELD_inidate.Text = rs["inidate"].ToString();

                    this.FIELD_sn.Text = rs["sn"].ToString();

                    //	this.FIELD_gen02_1.Text = rs["gen02_1"].ToString();
                    this.FIELD_ver.Text = rs["ver"].ToString();



                }
                else
                {
                    Response.Redirect("CBGI014.aspx");
                }

                rs.Close();
                rs.Open("select *    from dgflowqueue  where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") +
                    "'  AND reviewdate IS NULL AND qseq is not null  and  text='SI' and  revieweruid='" + this.CurrentUser.ID + "'");
                if (!rs.EOF)
                {
                    Response.Write(rs["id"].ToString());

                    ButtonField bfield = new ButtonField();

                   bfield.HeaderText = "SI Review";
                   bfield.Text = "Click";
                     
                   GridView2.Columns.Add(bfield);

                   Panel1.Visible = true;

                }

                rs.Open("select *    from dgflowqueue  where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") +
                    "'  AND reviewdate IS NULL AND qseq is not null  and  text='MIS 主管' and  revieweruid='" + this.CurrentUser.ID + "'");
                if (!rs.EOF)
                {
                    ((Label)this.FlowFeedback1.ReplyView.FindControl("Label6")).Visible = true;
                    ((SmoothEnterprise.Security.UI.WebControl.PopupUser)this.FlowFeedback1.ReplyView.FindControl("PopupUser1")).Visible = true;
   

                }

                displayfile(false);
            }

            gvBind(GridView1);
            gvBind2(GridView2);
        }


        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            //手動發mail 給下一關審核者       
            if (_NotifyReview)
            {
                DBTransfer gd = new DBTransfer();
                //string topn=gd.GetTopfile("select top 1 text  from  dgflowqueue where requesturl like '%"+Request.QueryString[0]+"%'    order by initdate desc ");

                //gd.RunIUSql("insert into EIPA.dbo.misbuffer2(caption) values ('" + topn + "')");

                //if (topn == "財務長") callsm("1");
                //if (topn == "申請者") callsm("2");

                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rss.Open("select   REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid from dgflowqueue a left join dguser" +
                    " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") + "'  AND reviewdate IS NULL AND qseq is not null ");
                while (!rss.EOF)
                {
                    //Response.Write("Page_PreRenderA.2<br>");
                    string MId = "{72b8968c-b411-40bc-b3d5-11ea23c4a621}";
                    string PapCaption = "固定資產預算申請單";  //每次都要調整
                    string PID = FIELD_sn.Text;   //每次都要調整
                    string AppName = rss["name"].ToString();
                    string purl = "http://eip.minaik.com.tw" + rss["requesturl"].ToString().ToLower().Replace("edit", "View");
                    string AppMail = rss["email"].ToString();
                    string body = "";


                    ShrFlowMail UseMail = new ShrFlowMail();
                     UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, "herzog.lin@minaik.com.tw", body);
                     UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, AppMail, body);
                   
                    //UseMail.ApproveMail(MId, PapCaption, PID, AppName, urlink, "herzog.lin@minaik.com.tw", body);
                    //  DeputyApprove(rss["revieweruid"].ToString());

                    string Sqlc = "insert into  [EIPB].[dbo].[doulog](rowid,appid,appdate )values('" + Request.QueryString["rowid"] + "','" +
              rss["revieweruid"].ToString() + "',getdate())";
                    gd.RunIUSql(Sqlc);




                    rss.MoveNext();


                }


               
            }

        }


        protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
        {
            //判段絯Node是否為SI ,若是就去看他們是否有核細項資料
             SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
             rs.Open("select *    from dgflowqueue  where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") +
                    "'  AND reviewdate IS NULL AND qseq is not null  and  text='SI' and  revieweruid='" + this.CurrentUser.ID + "'");
             if (!rs.EOF)
             {
                 DBTransfer hs=new DBTransfer();
                 string Ercou = hs.GetTopfile("SELECT  count(*) as cu   FROM [EIPB].[dbo].[CBGI014_Body] " +
                     " where rowid='" +Request.QueryString[0] +"'  and itemstatus is null ");
                 if (Ercou == "0") this.FlowFeedback1.Commit();
                 else Response.Write("<script>alert('明細資料沒有選擇Yes or No !');</script>");

             }
             else
             {
                 this.FlowFeedback1.Commit();
             }
        }

        private void gvBind(GridView gv)
        {
            SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
            string str = "SELECT   a.nm tc_cbb06 " +
          ",b.nm tc_cbb07,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11 " +
          ",M12,unp,(M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12) sum,(M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12)*unp totalm FROM EIPB.dbo.CBGI014_Sum " +
          "left join EIPB.dbo.CBGI014_Base a on tc_cbb06=a.id " +
          "left join EIPB.dbo.CBGI014_Base b on tc_cbb07=b.id where  rowid='" + Request.QueryString["rowid"] + "'";
           // Response.Write(str);

            SqlDataAdapter da = new SqlDataAdapter(str, conn);
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                gv.DataSource = dt;
                gv.DataBind();



            }


        }

        private void gvBind2(GridView gv)
        {
            SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
            string str = "SELECT  dowid ,sn,tc_cbb03,faj31 "+
      ",fajowner,tc_cbb04,tc_cbb05,aag02,tc_cbb22,tc_cbb06,tc_bgx02,tc_cbb07 "+
      ",tc_bgy02,tc_cbb08,fac02,tc_cbb18,tc_cbb09,tc_cbb091,tc_cbb10,tc_cbb11 "+
      ",tc_cbb12,tc_cbb13f,tc_cbb13,tc_cbb14f,tc_cbb14 "+
      ",tc_cbb19,tc_cbb15,azf03,tc_cbb16 "+
      ",tc_cbb21,tc_cbb17,tc_cbb171,dstatus "+
      ",rowid,mismemo,itemstatus "+
      ",convert(char(10),faj26,120) faj26   FROM [EIPB].[dbo].[CBGI014_Body] where  rowid='" + Request.QueryString["rowid"] + "' order by  tc_cbb03 asc  ";


            SqlDataAdapter da = new SqlDataAdapter(str, conn);
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                gv.DataSource = dt;
                gv.DataBind();



            }


        }


        //審核完畢
        private void ResTxt()
        {
            string FMainnm = "";
            string M1 = "";
            string M2 = "";
            string M3 = "";
            string M4 = FIELD_tc_cba01.Text.Substring(0, 1);
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            ds.Open("select *  from  [EIPB].[dbo].[CBGI014_Head] where rowid='" + Request.QueryString[0] + "'");
            if (!ds.EOF)
            {

                FMainnm = ds["plantid"].ToString() + "_cbgi014_" + ds["tc_cba00"].ToString() + "_" + ds["tc_cba01"].ToString() + "_" + M4 + ".txt";
                M1 = ds["plantid"].ToString();
                M2 = ds["tc_cba00"].ToString();
                M3 = ds["tc_cba01"].ToString();

            }
            ds.Close();
            string T = "Y";
            //  string FMainnm = FIELD_PlantID.Text.Trim() + "_cbgi014-" + FIELD_pmcano.Text.Trim() + ".txt";


            //傳簽核退回的TXT給ERP  "MINAIK","cbgi014","16A1","13110","1","R"
            FileStream fs = new FileStream(@"D:\\CBGI014_XML\\4GL\\" + FMainnm, FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);
            sw.WriteLine("\"" + M1 + "\",\"cbgi014\",\"" + M2 + "\",\"" + M3 + "\",\"" + M4 + "\",\"" + T + "\"");
            // Response.Write("\"" + M1 + "\",\"cbgi014\",\"" + M2 + "\",\"" + M3 + "\",\"" + M4 + "\",\"" + T + "\"");

            sw.Close();
            fs.Close();
            Upload("D:\\CBGI014_XML\\4GL\\" + FMainnm, "ftp://192.168.0.250/" + FMainnm, "4gl", "4gl");
     

        }



        private void displayfile(bool un)
        {
            string status = "";

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

            string htmlstr = "";
            string detlstr = "";
            Panel2.Controls.Add(new LiteralControl("<table border='1' width='400px' cellpadding='0' cellspacing='0'><tr ><td style='font:8pt;COLOR: yellow; height: 25px; BACKGROUND-COLOR: #848484'>功能</td><td style='font:8pt;COLOR: yellow;height: 20px; background-color: #848484'>附件(下載)</td></tr>"));

            rs.Open("SELECT * FROM [EIPB].[dbo].[upload_attachment] WHERE detid='" + Request.QueryString[0] + "'");
            while (!rs.EOF)
            {

                htmlstr = "<a href='../AttachDownload.aspx?attid=" + rs["attid"] + "&table=[EIPB].[dbo].[upload_attachment]' target=\'_blank\' ><img border='0' width='25' height='25' src='../gif/p12.gif' />" + rs["upname"] + "</a>";
                if (un)
                {
                    detlstr = "<a href='CBGI014del.aspx?rowid=" + Request.QueryString[0] + "&W=Edit&attid=" + rs["attid"] + "'  ><img border='0' width='20' height='25' onClick=return j1('" + rs["attid"] + "') src='../gif/button_drop.png' /></a>";

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
            Response.Redirect("CBGI014.aspx");
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
                // Response.Write(it2.Text + "--");


                System.Web.UI.WebControls.Image sin1;
                object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
                sin1 = (System.Web.UI.WebControls.Image)obj5;

                System.Web.UI.WebControls.Image sin2;
                object obj6 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image2");
                sin2 = (System.Web.UI.WebControls.Image)obj6;

                Response.Write((string)e["IniReviewer"].ToString().Length.ToString());
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
        
        protected void FlowFeedback1_FeedbackComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
        {
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
               " and  initdate=(select MAX(initdate)   from  dgflowqueue    where requesturl= '" +
               Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "')");


            if (!ds.EOF)
            {
                e["IniReviewer"] = "";
                

            }
            ds.Close();

            if ((this.FlowFeedback1.ResultType.ToString() == "Return") ||
                (this.FlowFeedback1.ResultType.ToString() == "Back"))
            {

                e.NodeComplete = true;
            }

            //-------------------------------------

            string BossApprover = ((SmoothEnterprise.Security.UI.WebControl.PopupUser)this.FlowFeedback1.ReplyView.FindControl("PopupUser1")).Text;
            if (BossApprover.Length >= 20)
            {
                e.Reviewers.Add(new Guid(BossApprover), "加簽主管");
            }




            //this.FlowFeedback1.ResultType.ToString() == "Next"
            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
                  "RedirectAfterCommit",
                  "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");

        }
        
        protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {
                _NotifyReview = true;
                e.NextNode = e.FlowNode.DefaultNode();
                e.NextNode.ReviewerURL = "/ERP_CBGI014/CBGI014view.aspx";
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

                  Sql = "update [EIPB].[dbo].[CBGI014_Head] set   status='C' where  rowid='" + Request.QueryString["rowid"] + "'";
        
                RunCommand.RunIUSql(Sql);

                //發信通知送審者,表示單據已經簽核完畢  AppDate     ,[Appuser]
                ds.Open("select top 1 email,name  from dgflowqueue a " +
                    " left join dguser b on a.inituid=b.id  where  " +
                    "  requesturl='" + Request.RawUrl.ToString().Trim().ToLower().Replace("view", "edit") + "'   order by a.initdate asc    ");
                if (!ds.EOF)
                {
                    string MId = "{c294bd9b-ebbd-4c6a-a608-c5175f3a3de2}";

                    requesturl = "http://eip.minaik.com.tw/" + Request.RawUrl.ToString().Trim();

                    Usemail.FinishApprove(MId, "固定資產預算申請單", FIELD_sn.Text,
                        ds["email"].ToString(), "", this.CurrentUser.Name, requesturl, "審核完成");
                    Usemail.FinishApprove(MId, "固定資產預算申請單", FIELD_sn.Text,
                            "herzog.lin@minaik.com.tw", "", this.CurrentUser.Name, requesturl, "審核完成");

                }
                ResTxt();

                Response.Redirect("http://" + Request.Url.Authority.ToString() + "/Flowwork/MyApproval.aspx");

                ds.Close();
            }
            #endregion



            #region 流程 Reject

            if ((e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate) ||
                    (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Return))
            {
                 Sql = "update [EIPB].[dbo].[CBGI014_Head] set   status='T' where  rowid='" + Request.QueryString["rowid"] + "'";
        
                RunCommand.RunIUSql(Sql);

                //  SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                ds.Open("SELECT top 1 name,email  from  EIPA.dbo.dgflowqueue a " +
                    " left join dguser  b  on a.inituid=b.id  where requesturl  " +
                    " like '%" + Request.QueryString[0] + "%' order by a.initdate asc");
                //             " left join [dguser] b on a.IniUser=b.id   where rowid='" + Request.QueryString[0] + "'");
                if (!ds.EOF)
                {
                    string MId = "{5a3f8c87-e0dc-4bbb-8116-661521bfc6c7}";
                    string PapCaption = "固定資產預算申請單";
                    string PID = FIELD_sn.Text;

                    string receivername = ds["name"].ToString();
                    string requestername = this.CurrentUser.Name;
                    string sendername = this.CurrentUser.Name;
                    requesturl = "http://eip.minaik.com.tw" + Request.RawUrl.ToString().Trim().ToLower().Replace("view", "edit");
                    string AppMail = ds["email"].ToString();
                    string reviewresult = "退回";
                    string body = "";

                    Usemail.StopApprove(MId, PID, PapCaption, receivername, requestername, requesturl,
                     reviewresult, body, "herzog.lin@minaik.com.tw");
                    Usemail.StopApprove(MId, PID, PapCaption, receivername, requestername, requesturl,
                     reviewresult, body, AppMail);
                }
            }

            #endregion

        }
        
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = GridView2.Rows[index];
            LabT01.Text = selectedRow.Cells[0].Text;
            LabT02.Text = selectedRow.Cells[1].Text;
           // gvBind3(GridView3, Request.QueryString["rowid"], selectedRow.Cells[1].Text);
       
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs.Open("SELECT * FROM eipb.dbo.CBGI014_body WHERE rowid='" + Request.QueryString["rowid"] + "' and  tc_cbb03='" + LabT01.Text+ "'");
            if (!rs.EOF)
            {
                rs["itemstatus"] = Lisstatus.SelectedValue;
                rs["mismemo"] = TextBox1.Text;
                rs.Update();
            }
            rs.Close();

            gvBind2(GridView2);

        }

        internal void GridViewAddFooter(string _strFooterName, GridViewRowEventArgs _gd)
        {
            int co = _gd.Row.Cells.Count;
            TableCellCollection tc = _gd.Row.Cells;
            tc.Clear();
            TableCell tc1;
            for (int i = 0; i < co; i++)
            {
                if (i == 0)
                {
                    tc1 = new TableCell();
                    tc1.Text = _strFooterName;
                    tc.Add(tc1);
                }
                else
                {
                    tc.Add(new TableCell());
                }
            }
            _gd.Row.BackColor = System.Drawing.Color.Chocolate;
            _gd.Row.ForeColor = System.Drawing.Color.White; 
       }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                GridViewAddFooter("加總", e);
            }

      }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        internal void GridViewAddFooter_Sum(GridView _gd)
        {
            double sum = 0;
            if (_gd.Rows.Count > 0)
            {
                for (int i = 2; i < _gd.Rows[0].Cells.Count; i++)
                {
                    sum = 0;
                    if (i.ToString() != "15")
                    {
                        for (int j = 0; j < _gd.Rows.Count; j++)
                        {
                            sum += double.Parse(_gd.Rows[j].Cells[i].Text);
                            // sum += int.Parse(_gd.Rows[j].Cells[i].Text, NumberStyles.AllowThousands | NumberStyles.AllowDecimalPoint | NumberStyles.AllowLeadingSign);
                        }
                        _gd.FooterRow.Cells[i].Text = sum.ToString("N");
                    }
                   }
            }
        }



       


        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            GridViewAddFooter_Sum(GridView1);

        }
        protected void InputButton1_Click(object sender, EventArgs e)
        {
            ResTxt();
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