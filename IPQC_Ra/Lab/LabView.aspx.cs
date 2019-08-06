using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

namespace Lab
{
    public partial class LabView : Lab_Base
    {
        private bool _NotifyReview = false;
        private string _NotifyType = "";

        protected void Page_Load(object sender, System.EventArgs e)
        {
            _pos = new dtPosit();
            _ts = new dtTs();
            _lang = CurrLang;
            _head_id = Request.QueryString["rowid"];
            _lab_id = Request.QueryString["lab_id"];

            if (!IsPostBack)
            {
                ViewState[_pos.tag] = _pos.Container;
                ViewState[_ts.tag] = _ts.Container;

                getLab(_lab_id);
                getPosition(_lab_id);

            }
            else
            {
                _pos.Container = (DataTable)ViewState[_pos.tag];
                _ts.Container = (DataTable)ViewState[_ts.tag];
            }
            Init();
        }

        private void Init()
        {
            bool isshow = false;
            if (!string.IsNullOrEmpty(_lab_id))
            {
                
                Inspect _ins = new Inspect();
                _ins = getLab(_lab_id);

                lab_replay.Text = _ins.replay;
                lab_re_result.Text = _ins.report_result;
                lbtn_download.Text = _ins.report_name;

                if (!string.IsNullOrEmpty(_ins.report_result))
                {
                    isshow = true;
                }


            }
            panel_file.Visible = isshow;
            Utility.setVisable(isshow, lab_replay, lab_re_result, lbtn_download);
            IPQC_Ra_Head head = new IPQC_Ra_Head();
            head.GetInfo(_head_id);


            lab_product.Text = getOptionName(head.product);


            lab_testtype.Text = getOptionName(head.test_type);

            lab_testitem.Text = getOptionName(head.test_item);

            Dictionary<string, string> User = Utility.GetUIDInfo(head.employee);

            lab_applicant.Text = User["NAME"];
            lab_depat.Text = User["DEPT"];
            lab_week.Text = new TaiwanCalendar().GetWeekOfYear(head.received_dt, System.Globalization.CalendarWeekRule.FirstDay, System.DayOfWeek.Sunday).ToString();
            lab_Received.Text = head.received_dt.ToString("yyyy/MM/dd");
            lab_bomdt.Text = head.manufacture_dt.ToString("yyyy/MM/dd");
            lab_dispatch.Text = head.dispatch_no;
            lab_material.Text = getOptionName(head.material);
            lab_program.Text = getOptionName(head.program);
            lab_sample.Text = head.sample.ToString();
            lab_tooling.Text = head.tooling_no;
            if (!string.IsNullOrEmpty(head.equipment))
            {
                lab_equipment.Text = IPQC_RaBase.getMachinName(head.equipment);
            }
            lab_Ra_no.Text = head.ra_no;
            lab_remark.Text = head.remark;
            lab_unit.Text = getOptionName(head.data_nuit);
            lab_receipt.Text = head.receipt_dt;
            getColor(head.product);


            if (_status == status.Complete)
            {
                if (pass == 0)
                {
                    img_result.ImageUrl = "../img/FAIL.png";
                }
                else if (pass == 1)
                {
                    img_result.ImageUrl = "../img/Pass.png";

                }
                else
                {
                    img_result.ImageUrl = "../img/OOC.png";
                }
            }


        }

        private void getColor(string product)
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                string sql = " select * from eipe.dbo.ipqc_ra_color where product_id='" + product + "' ";

                rs.Open(sql);
                if (!rs.EOF)
                {
                    up.Value = rs["up"].ToString();
                    down.Value = rs["down"].ToString();
                    upper.Value = string.IsNullOrEmpty(rs["upper"].ToString()) ? "#0000000" : rs["upper"].ToString();
                    lower.Value = string.IsNullOrEmpty(rs["lower"].ToString()) ? "#0000000" : rs["lower"].ToString();
                }
            }
        }
        protected void getPosition(string lab_id)
        {
            DataTable dt = new DataTable();
            if (!string.IsNullOrEmpty(lab_id))
            {
                using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
                {
                    string sql = string.Format("select * from eipe.dbo.ipqc_Ra_lab_position where lab_id='{0}' order by seq ", lab_id);
                    conn.Open();
                    using (SqlDataAdapter dr = new SqlDataAdapter(sql, conn))
                    {
                        DataSet ds = new DataSet();
                        dr.Fill(ds, "temp");
                        dt = ds.Tables["temp"];
                    }
                }
            }

            DataView view = new DataView(dt);

            gv_Lab.DataSource = view;
            gv_Lab.DataBind();
        }

        //protected void getPosition(string lab_id)
        //{ 
        //    using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        //    {
        //        string sql = string.Format("select * from eipe.dbo.ipqc_Ra_lab_position where lab_id='{0}' order by seq ", lab_id);
        //        rs.Open(sql);

        //        while (!rs.EOF)
        //        {
        //            string rowid = rs["rowid"].ToString();
        //            string file_name = rs["file_name"].ToString();
        //            string expect_date = rs["expect_date"].ToString();
        //            string complate_date = rs["complate_date"].ToString();
        //            string rart = rs["rart"].ToString();
        //            string average = rs["average"].ToString();
        //            string attach = Convert.ToBase64String((byte[])rs["file_attach"]);  //加密成64位元字串

        //            _pos.Add(lab_id, rowid, file_name, attach, expect_date, complate_date, rart, average, "s");
        //            getTsList(rowid);
        //            rs.MoveNext();
        //        }

        //        GridView gv = new GridView();
        //        DataView view = new DataView(_pos.Container);

        //        gv_Lab.DataSource = view;
        //        gv_Lab.DataBind(); 
        //    }
        //} 

        //顯示簽核流程
        protected void FlowFeedback1_FeedbackComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
        {
            try
            {
                //writetofile("FlowFeedback1_FeedbackComplete");
                _NotifyReview = true;

                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "RedirectAfterCommit", "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");

                SmoothEnterprise.Web.UI.HTMLControl.InputText it;
                object obj = this.FlowFeedback1.ReplyView.FindControl("ResTxt");
                it = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj;
                e["Flow_Comment"] = it.Text;
                //電子簽章呈現---------------------------------------------------------------------
                SmoothEnterprise.Web.UI.HTMLControl.InputText it3;
                object obj3 = this.FlowFeedback1.ReplyView.FindControl("Flow_loginID");
                it3 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj3;
                it3.Text = this.CurrentUser.LogonID;
                e["Flow_loginID"] = it3.Text;

                //寫入是否為代理人
                SmoothEnterprise.Web.UI.HTMLControl.InputText it4;
                object obj4 = this.FlowFeedback1.ReplyView.FindControl("IniReviewer");
                it4 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj4;
                //e["IniReviewer"] = "代";
                e["IniReviewer"] = "代";


                SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                ds.Open(" select revieweruid  from  dgflowqueue   where requesturl like '%" + Request.QueryString[0].ToString() + "%'" +
                    "  and revieweruid='" + this.CurrentUser.ID.Substring(1, 36) +
                    "' and  initdate=(select MAX(initdate)   from  dgflowqueue    where requesturl like '%" +
                    Request.QueryString[0].ToString() + "%')");
                if (!ds.EOF)
                {
                    e["IniReviewer"] = "";
                }
                ds.Close();
                e.NodeComplete = true;
            }
            catch (Exception ex)
            {
                this.AddError(this, "FlowFeedback1_FeedbackComplete()", "", "FlowFeedback1_FeedbackComplete<br/>" + ex.Message);
            }
        }

        protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)

        {
            try
            {
                //writetofile("FlowFeedback1_FlowNodeComplete");
                _NotifyReview = true;
                _NotifyType = e.ResultType.ToString();
                if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
                {
                    e.NextNode = e.FlowNode.DefaultNode();
                    e.NextNode.ReviewerURL = "/Lab/LabView.aspx";
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message+"<br/>"+ex.StackTrace+"<br/>");
            }

        }
        //同意
        protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
        {
            switch (e.ResultType)
            {
                //完成
                case SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete:
                    Complete();
                    break;
                case SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate:
                    Back();
                    break;

            }

        }

        private void Back()
        {
            string head_id = Request.QueryString["rowid"].ToString();
            string lab_id = Request.QueryString["lab_id"];

            Inspect lab = new Inspect();
            lab.GetInfo(lab_id);
            lab.UpdateStatus(lab_id, status.Back);

            string requesturl = string.Format("IPQC_Ra/Lab/LabEdit.aspx?rowid={0}&lab_id={1}", head_id, lab_id);

            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                StringBuilder sb = new StringBuilder();

                sb.Append("  select top 1 requestuid from eipa.dbo.dgflowlog a  ");
                sb.AppendFormat(" where  a.requesturl like '%{0}' ", requesturl);
                sb.Append(" and revieweruid='00000000-0000-0000-0000-000000000000' ");

                rs.Open(sb.ToString());

                SendMail(head_id, lab_id, rs["requestuid"].ToString(), lab_Ra_no.Text, lab.send_date.ToShortDateString());

                DBTransfer fs = new DBTransfer();
                if (!string.IsNullOrEmpty(lab_id))
                {
                    fs.RunIUSql("delete  dgflowqueue where requesturl like '%" + lab_id + "%'");

                }
            }
        }

        private void Complete()
        {
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            StringBuilder sql = new StringBuilder();

            string head_id = Request.QueryString["rowid"].ToString();
            string lab_id = Request.QueryString["lab_id"];
            string requesturl = string.Format("IPQC_Ra/Lab/LabEdit.aspx?rowid={0}&lab_id={1}", head_id, lab_id);

            Inspect lab = new Inspect();
            lab.GetInfo(lab_id);
            lab.UpdateStatus(lab_id, status.Complete);

            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                StringBuilder sb = new StringBuilder();

                sb.Append("  select requestuid from eipa.dbo.dgflowqueue a  ");
                sb.AppendFormat(" where  a.requesturl like '%{0}' ", requesturl);
                sb.Append(" and revieweruid <>'00000000-0000-0000-0000-000000000000' ");
                sb.Append(" order by a.initdate desc ");

                rs.Open(sb.ToString());
                SendMail(head_id, lab_id, rs["requestuid"].ToString(), lab_Ra_no.Text, lab.send_date.ToShortDateString());
            }
            // Response.Redirect("http://" + Request.Url.Authority.ToString() + "/Flowwork/MyApproval.aspx");//回到個人待審頁面

        }

        protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
        {
            try
            {
                Save_test_Result();
                MailReview();
                this.FlowFeedback1.Commit();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        private void MailReview()
        {
            string mail = txt_Rmail.Value.Trim();
            string result = "";
            if (!string.IsNullOrEmpty(mail))
            {

                string head_id = Request.QueryString["rowid"].ToString();
                string lab_id = Request.QueryString["lab_id"];
                Inspect lab = new Inspect();
                lab.GetInfo(lab_id);

                string[] MailList = mail.Split(',');
                if (lab.result == 0)
                {
                    result = "Fail";
                }
                else if (lab.result == 1)
                {
                    result = "Pass";
                }
                else {

                    result = "OOC";
                }
                foreach (string Item in MailList)
                {
                    Dictionary<string, string> User = Utility.GetUIDInfo(Item);

                    string Subject = "(通知) IPQC Ra　實驗室檢驗單 - 單號:" + lab_Ra_no.Text + " 檢驗結果-" + result;

                    StringBuilder sb = new StringBuilder();
                    sb.AppendFormat("{0} 您好，<br><br> ", User["NAME"].ToString());
                    sb.AppendFormat("IPQC Ra實驗室檢驗單簽核系統內有一筆資料{0},請您查閱<br><br> ", lab_Ra_no.Text);
                    sb.AppendFormat("申請單號: {0}<br>", lab_Ra_no.Text);
                    sb.AppendFormat("申請日期: {0}<br> ", lab.send_date);
                    sb.AppendFormat("檢驗結果: {0}<br> ", result);
                    sb.AppendFormat("申請內容: {0}/IPQC_Ra/lab/labView.aspx?rowid={1}&lab_id={2}<br><br>", Utility.LocalUrl, head_id, lab_id);

                    sb.Append("Best Regards,<br>");
                    sb.Append("如您想了解更多有關員工入口網站的資訊請點選以下連結進入 <br>");
                    sb.Append("<a href=\"" + Utility.LocalUrl + "\">員工入口網站</a><br>");
                    sb.Append("感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>");

                    Utility.SendMail(User["EMAIL"].ToString(), "ePortal(員工入口網站)", Subject, sb.ToString());
                }

            }

        }

        private void Save_test_Result()
        {
            string lab_id = Request.QueryString["lab_id"];
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                //test_Result.Value
                string sql = "select * from eipe.dbo.ipqc_ra_lab where rowid='" + _lab_id + "'";
                rs.Open(sql);

                if (!rs.EOF)
                {
                    rs["result"] = Convert.ToInt16(test_Result.Value);
                }

                rs.Update();
                rs.Close();
            }
        }

        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            try
            {
                Label label;
                object obj = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
                label = (Label)obj;
                label.Text = e["Flow_Comment"].ToString();
                label.ForeColor = System.Drawing.Color.Red;
                label.Font.Bold = true;
                label.Enabled = true;
                label.Font.Size = 13;

                //電子簽章呈現-----------------------------------------------------------------------------------------
                System.Web.UI.WebControls.Image sin1;
                object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
                sin1 = (System.Web.UI.WebControls.Image)obj5;
                //Response.Write((string)e["Flow_loginID"] + "--");
                if ((string)e["Flow_loginID"].ToString().Length.ToString() != "0")
                {
                    sin1.Visible = true;
                }
                else
                {
                    sin1.Visible = false;
                }
                sin1.ImageUrl = "~/image/" + (string)e["Flow_loginID"] + ".JPG";

                System.Web.UI.WebControls.Image sin2;
                object obj6 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image2");
                sin2 = (System.Web.UI.WebControls.Image)obj6;

                if ((string)e["IniReviewer"].ToString().Length.ToString() == "0") sin2.Visible = false;
                else sin2.Visible = true;
            }
            catch { }
        }

        protected void Page_PreRender(object sender, System.EventArgs e)
        {

            string head_id = Request.QueryString["rowid"].ToString();
            string lab_id = Request.QueryString["lab_id"];
            string requesturl = string.Format("IPQC_Ra/Lab/LabEdit.aspx?rowid={0}&lab_id={1}", head_id, lab_id);

            Inspect lab = new Inspect();
            lab.GetInfo(lab_id);


            //手動發mail 給下一關審核者       
            if (_NotifyReview)
            {
                SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                ds.Open("select   REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid , convert(varchar(20), a.initdate,120)'initdate'  from dgflowqueue a left join dguser" +
                    " b on revieweruid=b.id where requesturl like '%" + requesturl + "'  AND reviewdate IS NULL AND qseq is not null ");

                if (!ds.EOF)
                {
                    if (_NotifyType == "Next")
                    {
                        //送審
                        SendMail(head_id, lab_id, ds["revieweruid"].ToString(), lab_Ra_no.Text, lab.send_date.ToShortDateString());
                    }
                    else
                    {
                        //退回
                        SendMail(head_id, lab_id, ds["revieweruid"].ToString(), lab_Ra_no.Text, lab.send_date.ToShortDateString());
                    }
                }
                Response.Redirect("http://" + Request.Url.Authority.ToString() + "/Flowwork/MyApproval.aspx");//回到個人待審頁面

            }
        }

        protected void gv_Lab_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            //    if (e.Row.RowType == DataControlRowType.DataRow)
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                _pos.Container = (DataTable)ViewState[_pos.tag];
                _ts.Container = (DataTable)ViewState[_ts.tag];

                int Index = e.Row.RowIndex;

                LinkButton lbtn_Add = new LinkButton();
                lbtn_Add = ImgButton("lbtn_Add", "../img/add2.png");
                lbtn_Add.CommandName = "lbtn_Add";
                lbtn_Add.CommandArgument = Index.ToString();
                lbtn_Add.Attributes.CssStyle.Add("margin", "2px 2px");
                Table ts = new Table();

                for (int i = 0; i <= 1; i++)
                {
                    TableRow row = new TableRow();
                    row.BorderWidth = 1;
                    row.HorizontalAlign = HorizontalAlign.Center;
                    row.BorderStyle = BorderStyle.Solid;
                    if (i == 0)
                    {
                        row.BackColor = System.Drawing.Color.RoyalBlue;
                        row.ForeColor = System.Drawing.Color.FromName("#fff");
                        row.Height = 30;
                    }
                    else
                    {
                        row.ForeColor = System.Drawing.Color.Black;
                        row.BackColor = System.Drawing.Color.White;
                        if (i % 2 == 0)
                        {
                            row.BackColor = System.Drawing.Color.FromName("#D3E6F1");
                        }
                    }

                    if (i == 0)
                    {
                        TableCell cell1 = new TableCell();
                        cell1.Text = getStr("sample_no");
                        row.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = getStr("cav");
                        row.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = getStr("measurement");
                        row.Cells.Add(cell3);

                        //TableCell cell4 = new TableCell();
                        //row.Cells.Add(cell4);
                    }


                    ts.Controls.Add(row);
                }
                ts.ID = "ts_result";
                ts.Style.Add("margin", "5px 5px;");
                ts.Style.Add("width", "70%");
                ts.BorderWidth = 1;
                ts.BorderColor = System.Drawing.Color.FromName("#808080");
                ts.BorderStyle = BorderStyle.Solid;
                ts.GridLines = GridLines.Both;
                ts.CssClass = "all ts_rs";
                e.Row.Cells[5].Controls.Add(ts);
                e.Row.Cells[5].Style.Add("padding", " 2px 2px");
                e.Row.Cells[5].Style.Add("vertical-align ", "top");


            }


            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[2].Text = getStr("m_position");
                e.Row.Cells[3].Text = getStr("cmp_dt");
                e.Row.Cells[4].Text = getStr("rart");
                e.Row.Cells[5].Text = getStr("test_Result");
            }
        }


        protected void gv_Lab_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int Index = e.Row.RowIndex;

                DataRowView drv = (DataRowView)e.Row.DataItem;

                //"head_id", "rowid", "file_name", "file_attach", "expect_date", "complate_date"
                e.Row.Cells[0].Text = drv["rowid"].ToString();
                //GIF、JPG、PNG

                e.Row.Cells[1].Text = Convert.ToString(Index + 1);
                string fileName = drv["file_name"].ToString().ToUpper();
                string subName = Path.GetExtension(fileName).ToUpper();
                bool isImg = false;

                if (subName == ".JPG" || subName == ".GIF" || subName == ".BMP" || subName == ".PNG")
                {
                    isImg = true;
                    string attach = "";

                    attach = drv["rowid"].ToString();
                    System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();

                    e.Row.Cells[2].Text = "<img style=\"width: 250px; height:250px;\" src=\"ShowImage.ashx?type=s&attach=" + attach + "\">";

                }


                if (isImg == false)
                {
                    LinkButton lbtn_file = (LinkButton)e.Row.Cells[4].FindControl("lbtn_file");
                    lbtn_file.CommandArgument = drv["rowid"].ToString();
                    lbtn_file.CommandName = "lbtn_file";
                    lbtn_file.ID = "lbtn_file";
                    lbtn_file.Text = drv["file_name"].ToString();
                }

                e.Row.Cells[2].Style.Add("padding", " 2px 2px");
                e.Row.Cells[2].Style.Add("vertical-align ", "top");


                //e.Row.Cells[2].Text = drv["file_name"].ToString();
                e.Row.Cells[3].Text = Convert.ToDateTime(drv["complate_date"].ToString()).ToShortDateString();
                e.Row.Cells[4].Text = getOptionName(drv["rart"].ToString());

                getTsList(drv["rowid"].ToString());

                Double dAvg = 0;
                DataRow[] TsList = _ts.getList(" position_id='" + drv["rowid"].ToString() + "' ");

                if (TsList.Length > 0)
                {
                    Table ts = (Table)e.Row.Cells[5].FindControl("ts_result");
                    int i = 1;
                    double total = 0;
                    foreach (DataRow item in TsList)
                    {
                        TableRow row = new TableRow();
                        row.BorderWidth = 1;
                        row.HorizontalAlign = HorizontalAlign.Center;
                        row.BorderStyle = BorderStyle.Solid;

                        row.ForeColor = System.Drawing.Color.Black;
                        row.BackColor = System.Drawing.Color.White;
                        if (i % 2 == 0)
                        {
                            row.BackColor = System.Drawing.Color.FromName("#D3E6F1");
                        }

                        TableCell cell1 = new TableCell();
                        cell1.Text = Convert.ToString(i);
                        cell1.Style.Add("margin", " 2px 2px");
                        row.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = item["cav"].ToString();
                        cell2.Style.Add("margin", " 2px 2px");
                        row.Cells.Add(cell2);


                        TableCell cell3 = new TableCell();
                        cell3.Text = item["measurement"].ToString();
                        total += Convert.ToDouble(item["measurement"]);
                        cell3.CssClass = "mm";
                        cell3.Style.Add("margin", " 2px 2px");
                        row.Cells.Add(cell3);

                        //TableCell cell4 = new TableCell();
                        //string btn_name = "ts_del_" + item["rowid"];
                        //Button Btn_TS_Del = (Button)e.Row.FindControl(btn_name);
                        //Btn_TS_Del.Visible = true;
                        //cell4.Controls.Add(Btn_TS_Del); 


                        ts.Controls.Add(row);
                        i++;
                    }
                    /***************************/

                    dAvg = Math.Round((total / TsList.Length), 3);

                    TableRow Avg = new TableRow();
                    Avg.BorderWidth = 1;
                    Avg.HorizontalAlign = HorizontalAlign.Center;
                    Avg.BorderStyle = BorderStyle.Solid;

                    Avg.ForeColor = System.Drawing.Color.FromName("#fff");
                    Avg.BackColor = System.Drawing.Color.FromName("#778CA5");

                    TableCell avg_tag = new TableCell();
                    avg_tag.Text = "average";
                    avg_tag.ColumnSpan = 2;
                    avg_tag.CssClass = "avg";
                    Avg.Cells.Add(avg_tag);

                    TableCell avg_Total = new TableCell();
                    avg_Total.Text = dAvg.ToString();
                    avg_Total.ColumnSpan = 2;
                    avg_Total.CssClass = "avg";
                    Avg.Cells.Add(avg_Total);

                    Avg.Height = 30;


                    ts.Height = 30;
                    ts.Controls.Add(Avg);
                    drv["average"] = dAvg;
                }
            }

        }

        protected void Btn_Back_Click(object sender, EventArgs e)
        {
            this.GoBack();
        }

        protected void lbtn_download_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(_lab_id))
            {
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
                {
                    rs.Open("select * from eipe.dbo.ipqc_ra_lab where rowid='" + _lab_id + "' ");


                    if (!rs.EOF)
                    {
                        MABase.outFile(rs["report_name"].ToString(), (byte[])rs["report"]);

                    }
                }
            }
        }

       
    }
}