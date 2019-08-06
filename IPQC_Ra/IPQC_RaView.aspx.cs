using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPQC_Ra
{
    public partial class IPQC_RaView : IPQC_RaBase
    {

        private bool _NotifyReview = false;
        private string _NotifyType = "";
        int action = 0;

        private IPQC_Ra_Head head = new IPQC_Ra_Head();
        protected void Page_Load(object sender, EventArgs e)
        {
            Init();
        }

        private void Init()
        {
            string rowid = Request.QueryString["rowid"];
            head.GetInfo(rowid);

            _cStatus = (status)head.status;
            lab_product.Text = getOptionName(head.product);

            lab_testtype.Text = getOptionName(head.test_type);

            lab_testitem.Text = getOptionName(head.test_item);

            getDept(head.employee);

            lab_applicant.Text = _user;
            lab_depat.Text = _dept;
            lab_week.Text = new TaiwanCalendar().GetWeekOfYear(head.received_dt, System.Globalization.CalendarWeekRule.FirstDay, System.DayOfWeek.Sunday).ToString();
            lab_Received.Text = head.received_dt.ToString("yyyy/MM/dd");

            lab_bomdt.Text = head.manufacture_dt.ToString("yyyy/MM/dd");
            lab_dispatch.Text = head.dispatch_no;
            lab_material.Text = getOptionName(head.material);
            lab_program.Text = getOptionName(head.program);
            lab_sample.Text = head.sample.ToString();
            lab_tooling.Text = head.tooling_no;
            if (head.equipment != "")
            {
                lab_equipment.Text = IPQC_RaBase.getMachinName(head.equipment);
            }
            lab_Ra_NO.Text = head.ra_no;

        }



        protected void Btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("/IPQC_Ra/IPQC_Ra.aspx");
        }

        protected void Btn_Fail_Click(object sender, EventArgs e)
        {
            _cStatus = status.Fial;
            head.UpdataStatus(Request.QueryString["rowid"], status.Fial);
            Response.Write("<script>alert('已經作廢完畢');</script>");
            this.GoBack();
        }

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
                if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete)
                {
                    e.NextNode = e.FlowNode.DefaultNode();
                    e.NextNode.ReviewerURL = "/IPQC_Ra/IPQC_RaView.aspx";
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
                    _NotifyType = "Complete";
                    action =(int) status.Complete;
                    Complete();
                    break;
                case SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate:
                case SmoothEnterprise.Flowwork.Control.ReviewResultType.Return:
                    // 中止 
                    Stop();
                    break;
            }

        }

        private void Stop()
        {
            string guid = Request.QueryString["rowid"].ToString();

            _cStatus = status.Stop;
            head.UpdataStatus(guid, status.Stop);

            SendMail(guid, head.employee, head.ra_no, head.send_dt, "中止");

            DBTransfer fs = new DBTransfer();
            if (!string.IsNullOrEmpty(guid))
            {
                fs.RunIUSql("delete  dgflowqueue where requesturl like '%" + guid + "%'");

            }
        }

        private void Complete()
        {
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            StringBuilder sql = new StringBuilder();

            
            head.UpdataStatus(Request.QueryString["rowid"], status.Complete);

            SendMail(head.id, head.employee, head.ra_no, head.send_dt, "審核完成");

            Response.Redirect("http://" + Request.Url.Authority.ToString() + "/Flowwork/MyApproval.aspx");//回到個人待審頁面

        }

        protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
        {
            try
            {
                this.FlowFeedback1.Commit();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
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
            //手動發mail 給下一關審核者       
            if (_NotifyReview)
            {
                SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                ds.Open("select   REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid , convert(varchar(20), a.initdate,120)'initdate'  from dgflowqueue a left join dguser" +
                    " b on revieweruid=b.id where requesturl like '%ipqc_ra/%" + Request.QueryString["rowid"] + "'  AND reviewdate IS NULL AND qseq is not null ");

                if (!ds.EOF)
                {
                    if (_NotifyType == "Next")
                    {
                        //送審
                        SendMail(head.id, head.employee, head.ra_no, head.send_dt, "送審");
                    }
                    else
                    {
                        //退回
                        SendMail(head.id, head.employee, head.ra_no, head.send_dt, "退回");
                    }
                }
                Response.Redirect("http://" + Request.Url.Authority.ToString() + "/Flowwork/MyApproval.aspx");//回到個人待審頁面

            }
        }




    }
}