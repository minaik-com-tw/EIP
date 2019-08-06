/*
 * 2014/9/3 增加在簽核完成後要增加一個按鈕可以show出並且印製工程試作單的單號和模具編號
 */
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
using System.Net.Mail;

namespace EngineeringTest
{
public partial class EngineeringTestView : SmoothEnterprise.Web.Page
{
    public string data2;
    public string style; //生管維護是否加框線
    private bool _NotifyReview = false;
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "EngineeringTest View Page";
        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rss.Open("select mail from EngineeringTest_head WHERE id='" + Request.QueryString["id"] + "' and (mail is not null and mail <> '')   ");
        if (!rss.EOF)
        {
            data2 = "[";
            String[] s = rss["mail"].ToString().Split(',');
            foreach (string bb in s)
            {
                data2 = data2 + "{\"id\":\"" + bb.ToString() + "\",\"name\":\"" + bb.ToString() + "\"},";
                rss.MoveNext();
            }
            data2 = data2.Substring(0, data2.Length - 1);
            data2 = data2 + "]";
        }
        else
        {
            data2 = "1";
        }
        rss.Close();

       // Response.Write(" <script   language=javascript> cima01.bgColor='#00ff00'  </script> ");
        

        if (!this.IsPostBack)
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT plantid,no,add_date,rd_level,expect_date,cima01,cima02,cima03,rev,oduction_amount,delivers_amount,oduction_explain " +
                       ",lsend,makesend,pmcsend,workssend,makes_no,name,flow_type,a.remark remark , a.obj, a.order_no order_no ,project_no , module_no , status , try_date , isnot FROM EngineeringTest_head a left join dguser b on a.add_user=b.id  WHERE a.id='" + Request.QueryString["id"] + "' ");
                if (!rs.EOF)
                {

                    this.plantid.Text = rs["plantid"].ToString();
                    this.no.Text = rs["no"].ToString();
                    this.add_date.Text = rs["add_date"].ToString();
                    this.rd_level.Text = rs["rd_level"].ToString();
                    this.FIELD_expect_date.Text = rs["expect_date"].ToString();
                    this.cima01.Text = rs["cima01"].ToString();
                    this.cima02.Text = rs["cima02"].ToString();
                    this.cima03.Text = rs["cima03"].ToString();
                    this.rev.Text = rs["rev"].ToString();
                    this.oduction_amount.Text = rs["oduction_amount"].ToString();
                    this.delivers_amount.Text = rs["delivers_amount"].ToString();
                    this.oduction_explain.Text = rs["oduction_explain"].ToString();
                    this.FIELD_lsend.Text = rs["lsend"].ToString();
                    this.FIELD_makesend.Text = rs["makesend"].ToString();
                    this.FIELD_pmcsend.Text = rs["pmcsend"].ToString();
                    this.FIELD_workssend.Text = rs["workssend"].ToString();
                    this.makes_no.Text = rs["makes_no"].ToString();
                    this.add_user.Text = rs["name"].ToString();
                    this.flow_type.Text = rs["flow_type"].ToString().Trim();
                    this.remark.Text = rs["remark"].ToString();
                    this.project_no.Text = rs["project_no"].ToString();
                    this.order_no.Text = rs["order_no"].ToString();
                    this.module_no.Text = rs["module_no"].ToString();
                    this.FEILD_obj.SelectedIndex = rs["obj"] is DBNull ? 0 : int.Parse(rs["obj"].ToString());
                    this.FIELD_TRY_DATE.Text = rs["try_date"].ToString();
                    this.FIELD_ISNOTORNULL.Checked = bool.Parse(rs["isnot"].ToString());

                    if (this.FIELD_workssend.Text.Trim().ToUpper() == this.CurrentUser.ID.Replace("{", "").Replace("}", ""))
                    {
                        if (rs["status"].ToString() != "完成審核")
                            this.FIELD_TRY_DATE.ButtonClick = true;
                        else
                            this.FIELD_TRY_DATE.ButtonClick = false;

                    }
                    else
                    {
                        this.FIELD_TRY_DATE.ButtonClick = false;
                    }
                    //if 
                    //{
                    //    style = "1";
                    //}
                    //else
                    //{
                        SmoothEnterprise.Database.DataSet see = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        //rs.Open("SELECT * FROM LeaveH WHERE hid='"+ Request.QueryString["hid"] +"' ");
                        see.Open("select * from dgflowqueue where requesturl like '%" + Request.QueryString["id"] + "' and revieweruid='" + this.CurrentUser.ID + "' and resulttype is null ");
                        if (!see.EOF)
                        {
                           //Response.Write("select * from dgflowqueue where requesturl like '%" + Request.QueryString["id"] + "' and revieweruid='" + this.CurrentUser.ID + "' and resulttype is null ");

                            if (rs["pmcsend"].ToString().ToUpper() == this.CurrentUser.ID.ToString().Substring(1, 36))
                            {
                                style = "1";
                            }
                            else
                            {

                                style = "2";
                            }
                            
                        }
                        else
                        {
                            style = "0";
                        }

                        //if (rs["status"].ToString() == "完成審核")
                        //{
                            this.PrintBarcode.Visible = true;
                        //}
                        //else
                        //{
                        //    this.PrintBarcode.Visible = false;
                        //}
                    //}
                    //else { style = "2"; }

                    //Response.Write(rs["pmcsend"].ToString().ToUpper() + "<br>" + this.CurrentUser.ID.ToString().Substring(1,36));


                }
                else
                {
                    //Response.Redirect("EngineeringTest.aspx");
                }


                bool un = checkuser();


                //--判斷是否在DocCenterControl 有放行, 若不正確轉址回專案管理
                string Cu = "0";
                rs.Open("SELECT count(*) as CU " +
                    "  FROM [EIPC].[dbo].[DocCenterControl] " +
                    "  where filenm='" + Request.QueryString["PID"] + "' and moduerid='" + this.CurrentUser.ID + "' and DateStart<=getdate() and datestop>=getdate() ");
                if (!rs.EOF) Cu = rs["CU"].ToString(); ;

                if (Cu == "0") InputButton2.Visible = false;

                //------------------------------------------------ 



            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
                //Response.Redirect("EngineeringTest.aspx");
            }
		}
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
		this.GoBack();
	}

    private void savetrydate()
    {
        try
        {
            if (this.FIELD_TRY_DATE.Text != "" && (this.FIELD_workssend.Text.Trim().ToUpper() == this.CurrentUser.ID.Replace("{", "").Replace("}", "")))
            {
                //Response.Write(Request.QueryString["ID"].ToString());
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                string command = "UPDATE EIPA.DBO.EngineeringTest_head SET TRY_DATE = '"+this.FIELD_TRY_DATE.Text+"' WHERE ID = '" + Request.QueryString["ID"].ToString() + "'";
                rs.ExecuteNonQuery(command);
                rs.Close();
            }
        }catch(Exception ex){
            Response.Write(ex.Message);
        }
    }

    protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
    {
       // Response.Write("<script language='JavaScript'>window.alert('" + this.makes_no.Text + "');</script>");
        bool un = checkuser();

        if (un == true)
        {
            if (this.makes_no.Text == "" && this.FlowFeedback1.ResultType.ToString() == "Next")
            {
                Response.Write("<script language='JavaScript'>window.alert('請輸入製令單號！');</script>");

            }
            else
            {
                SaveMake_no();
                this.FlowFeedback1.Commit();
            }
        }
        else
        {
            if (this.FIELD_TRY_DATE.Text == "" && (this.FIELD_workssend.Text.Trim().ToUpper() == this.CurrentUser.ID.Replace("{", "").Replace("}", ""))
                && this.FlowFeedback1.ResultType.ToString() == "Next" && !this.FIELD_ISNOTORNULL.Checked)
            {
                Response.Write("<script language='JavaScript'>window.alert('請輸入開發試模日期！');</script>");
            }
            else
            {
                savetrydate();
                this.FlowFeedback1.Commit();
            }            
           // Response.Write("<script language='JavaScript'>window.alert('我不是生管！');</script>");

        }
    }
    protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
    {
        _NotifyReview = true;
        e.NextNode = e.FlowNode.DefaultNode();
        e.NextNode.ReviewerURL = "/EngineeringTest/EngineeringTestView.aspx";
    }
    protected void FlowFeedback1_FeedbackComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
    {
        try
        {
            SmoothEnterprise.Web.UI.HTMLControl.InputText it;
            object obj = this.FlowFeedback1.ReplyView.FindControl("Input_Comment");
            it = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj;
            e["Flow_Comment"] = it.Text;
            //電子簽章呈現---------------------------------------------------------------------
            SmoothEnterprise.Web.UI.HTMLControl.InputText it3;
            object obj3 = this.FlowFeedback1.ReplyView.FindControl("InputText3");
            it3 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj3;
            it3.Text = this.CurrentUser.LogonID;
            e["InputText3"] = it3.Text;

            //多角目的廠業務維護方案/原因/夾附件-----------------------------
            bool un = checkuser();

            if (un == true)
            {
                SaveMake_no();
            }

            //---------------------------------------------------------------

            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
            "RedirectAfterCommit",
            "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");




        }
        catch { }
    }

    protected void SaveMake_no()
    {

        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rss.Open("SELECT * FROM EIPA.DBO.EngineeringTest_head WHERE id='" + Request.QueryString["id"] + "' ");
        if (!rss.EOF)
        {
            rss["makes_no"] = this.makes_no.Text;
            rss.Update();
        }
        rss.Close();
    }

    protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
    {
        try
        {
            //意見的呈現-----------------------------------------------------------------------------------------
            //Label label;
            ////InputText label;
            //object obj = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
            //label = (Label)obj;
            //label.Text = e["Flow_Comment"].ToString();

            SmoothEnterprise.Web.UI.HTMLControl.InputText it2;
            object obj2 = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
            it2 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj2;
            it2.Enabled = true;
            it2.ReadOnly = true;
            it2.Text = (string)e["Flow_Comment"];


            //電子簽章呈現-----------------------------------------------------------------------------------------
            System.Web.UI.WebControls.Image sin1;
            object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
            sin1 = (System.Web.UI.WebControls.Image)obj5;
            //Response.Write((string)e["InputText3"] + "--");
            sin1.ImageUrl = "~/image/" + (string)e["InputText3"] + ".JPG";

        }
        catch { }
    }

    protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
    {
        if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete)
        {
            try
            {
                string sqlstr = "";
                sqlstr = "SELECT * FROM EngineeringTest_head where id='" + Request.QueryString["id"] + "'";
                SmoothEnterprise.Database.DataSet ds;
                ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                ds.Open(sqlstr);

                if (!ds.EOF)
                {
                    ds["STATUS"] = "完成審核";
                    ds.Update();

                     SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                     rss.Open("select add_user , email,mail,name from EngineeringTest_head a  left join dguser b on a.add_user=b.id where a.id='" + Request.QueryString["id"] + "'   ");
                     if (!rss.EOF)
                     {
                         #region 寄給申請人完成的mail

                         ArrayList email_list = new ArrayList();  //email list
                         email_list.Add(rss["email"].ToString());

                         #endregion

                         #region 寄給通知者

                         String[] s = rss["mail"].ToString().Split(';');
                         foreach (string bb in s)
                         {
                             email_list.Add(bb.ToString());
                             //Response.Write(bb.ToString());

                         }

                         #endregion

                         #region Send email


                         String ques;

                         MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                         //MailAddress to = new MailAddress(i);

                         MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");
                         MailMessage message = new MailMessage("eip@minaik.com.tw", rss["email"].ToString());
                         foreach (string i in email_list)
                         {
                             if(!string.IsNullOrEmpty(i))
                                message.To.Add(i);
                         }

                         DateTime de = Convert.ToDateTime(this.FIELD_expect_date.Text);
                         ques =  "您好:" + "<br>" +
                                "<br>" +
                                "EIP工程試作單系統已完成審核, 詳細資料如下:" + "<br>" +
                                "<br>" +
                                "單號 : " + this.no.Text + "<br>" +
                                "申請日期 : " + de.ToString("yyyy/MM/dd") + "<br>" +
                                "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/EngineeringTest/EngineeringTestView.aspx?id=" + Request.QueryString["id"] + "\" >至EIP工程試作單系統查看</a>" +
                                "<br>" +
                                "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                         message.Subject = "EIP工程試作單號 - " + this.no.Text + " 成品料號-" + this.cima01.Text + "己完成審核";

                         message.IsBodyHtml = true;
                         message.Body = ques;

                         SmtpClient client = new SmtpClient("192.168.0.12");

                         client.Send(message);



                         #endregion

                         if (this.cima01.Text.Substring(1, 1) == "9") //料號的開頭如果是”9”的時候要寄出去信件並新增至模具試模試作系統中
                         {
                             #region 寫入NPI_TryoutFeedback
                             EIPSysSha eip = new EIPSysSha();
                             SmoothEnterprise.Database.DataSet rss2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                             string NPI_TryoutFeedbackSN = eip.GetNewSn("N301", DateTime.Now.Year.ToString().Substring(2, 2) + DateTime.Now.Month.ToString("00"), "EIPB", "PAPDETAIL");
                             string Guidstring = Guid.NewGuid().ToString();
                             string sqlcommand = "INSERT INTO EIPB.dbo.NPI_TryoutFeedback " +
                                                 "          (rowno , " +
                                                 "           SN , " +
                                                 "           PNO , " +
                                                 "           PRODUCTION_NAME ," +
                                                 "           Drawing , " +
                                                 "           NPI ,  " +
                                                 "           VER , " +
                                                 "           QUARYTI ," +
                                                 "           samples," +
                                                 "           ORDERS," +
                                                 "           Explanation," +
                                                 "           NOTE, " +
                                                 "           Measured_datetime ," +
                                                 "           initdate ," +
                                                 "           inituid)  " +
                                                 "   VALUES('" + Guidstring + "'," +
                                                 "          '" + NPI_TryoutFeedbackSN + "'," +
                                                 "          '" + this.cima01.Text + "'," +
                                                 "          '" + this.cima02.Text + "'," +
                                                 "          '" + this.cima03.Text + "'," +
                                                 "          '" + rss["add_user"].ToString() + "'," +
                                                 "          '" + this.rev.Text + "'," +
                                                 "          " + this.oduction_amount.Text + "," +
                                                 "          " + this.delivers_amount.Text + "," +
                                                 "          '" + this.order_no.Text + "'," +
                                                 "          '" + this.oduction_explain.Text + "'," +
                                                 "          '" + this.remark.Text + "'," +
                                                 "          '" + this.FIELD_expect_date.Text + "' , " +
                                                 "          SYSDATETIME()," +
                                                 "          '" + rss["add_user"].ToString() + "')";
                             //throw new Exception(sqlcommand);
                             rss2.ExecuteNonQuery(sqlcommand);
                             #endregion

                             #region 寫入NPI的預設MailGrid
                             InsertIntoMailGrid(Guidstring);
                             #endregion

                             #region 寄出模具試模計劃的EMail
                             SendMail(email_list, Guidstring, NPI_TryoutFeedbackSN);
                             #endregion
                         }
                     }
               
                }

            }
            catch(Exception ex)
            {
                Response.Write(ex.Message + ex.StackTrace);
                //showError(ex.Message);
            }
        }

        if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate ||
        e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Return)
        {
            //try
            //{
                string sqlstr = "";
                sqlstr = "SELECT * FROM EngineeringTest_head where id='" + Request.QueryString["id"] + "'";
                SmoothEnterprise.Database.DataSet ds;
                ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                ds.Open(sqlstr);

                if (!ds.EOF)
                {
                    ds["STATUS"] = "退回";
                    ds.Update();

                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rss.Open("select add_user bid,email,name from EngineeringTest_head a  left join dguser b on a.add_user=b.id where a.id='" + Request.QueryString["id"] + "'   ");
                    if (!rss.EOF)
                    {
                        #region 寄給申請人退回的mail

                        ArrayList email_list = new ArrayList();  //email list
                        email_list.Add(rss["email"].ToString());

                           #region 如資材單位已簽核過, 也給生管單位一份

                        SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rsa.Open("select * from dgflowqueue where text='資材單位' and qseq='1' and reviewresult is not null and   requesturl like '%" + Request.QueryString["id"] + "'");
                        if (!rsa.EOF)
                        {
                            SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                            rsb.Open("select email from dguser where id='" + this.FIELD_pmcsend.Text + "'");
                            if (!rsb.EOF)
                            {
                                email_list.Add(rsb["email"].ToString());
                            }
                        }


                           #endregion

                        #endregion

                        #region Send email

                        foreach (string i in email_list)
                        {


                            String ques;

                            MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                            MailAddress to = new MailAddress(i);

                            MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                            MailMessage message = new MailMessage(from, to);
                            DateTime de = Convert.ToDateTime(this.FIELD_expect_date.Text);
                            ques = "您好:" + "<br>" +
                                   "<br>" +
                                   "EIP工程試作單系統已被退回, 詳細資料如下:" + "<br>" +
                                   "<br>" +
                                   "單號 : " + this.no.Text + "<br>" +
                                   "申請日期 : " + de.ToString("yyyy/MM/dd") + "<br>" +
                                   "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/EngineeringTest/EngineeringTestView.aspx?id=" + Request.QueryString["id"] + "\" >至EIP工程試作單系統查看</a>" +
                                   "<br>" +
                                   "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                   "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                   "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                            message.Subject = "EIP工程試作單號 - " + this.no.Text + " 成品料號-" + this.cima01.Text + "己被退回";

                            message.IsBodyHtml = true;
                            message.Body = ques;

                            SmtpClient client = new SmtpClient("192.168.0.12");

                            client.Send(message);

                        }

                        #endregion


                    }

                }

            //}
            //catch
            //{
            //    Response.Write("有問題");
            //}
        }
    }
    private void InsertIntoMailGrid(string Guidstring)
    {
        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        string sqlcommand = "INSERT INTO EIPB.dbo.NPI_mailgrid "+
                          " SELECT '" + Guidstring + "', U.id , G.email ,U.logonid  " +
                          "   FROM EIPB.dbo.NPI_TryoutFeedback_Mail_Group G LEFT JOIN EIPA.DBO.dguser U  " +
                          "     ON G.ID = U.id  "+
                          "  WHERE U.id = G.id";
        rss.ExecuteNonQuery(sqlcommand);
    }
    private bool checkuser()
    {
        //顯示 使用者等級 --------------------------------
        //只有sales更新
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        ds.Open("SELECT pmcsend FROM EngineeringTest_HEAD WHERE id='" + Request.QueryString["id"] + "' ");
        bool un = false;


        if (!ds.EOF)
        {
            if (this.CurrentUser.ID.ToString().Replace("{", "").Replace("}", "").ToLower() == ds["pmcsend"].ToString().Replace("{", "").Replace("}", "").ToLower())
            {
                un = true;
                //return un;
            }
        }
        
        ds.Close();
        return un;
        //-----------------------------------------------
    }

    protected void Page_PreRender(object sender, System.EventArgs e)
    {

        //發信測試------------------------------------------

        //Response.Write(this.CurrentUser.LogonID.ToString());
        if (_NotifyReview)
        {

            SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rss.Open("select top 1 REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid from dgflowqueue a left join dguser b on revieweruid=b.id where requesturl like '%" + Request.QueryString["id"] + "'  AND reviewdate IS NULL AND qseq is not null ");
            if (!rss.EOF)
            {

                ArrayList email_list = new ArrayList();  //email list


                email_list.Add(rss["name"].ToString()+'#'+rss["email"].ToString());

                #region 代理人
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs2.Open(" SELECT b.name name,email FROM dguserdeputy a left join dguser b on a.deputyuid=b.id left join dgflow c on a.sid=c.id  " +
                         " where  a.uid='" + rss["bid"].ToString() + "'  " +
                         " and  " +
                         " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                         " (c.typename like 'ERP_FLOW%' and sdate < GETDATE() and edate is null) or " +
                         " (c.typename like 'ERP_FLOW%' and sdate < GETDATE() and edate > GETDATE()) or " +
                         "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");
                while (!rs2.EOF)
                {
                    //MyLibrary_AXMT610 Backsend = new MyLibrary_AXMT610();
                    email_list.Add(rs2["name"].ToString() + '#' + rs2["email"].ToString());
                    rs2.MoveNext();

                }
                rs2.Close();

                #endregion

                foreach (string i in email_list)  
                {

                    //Response.Write( i + "<br>");
                    //Response.Write(i.Split('#')[0] + "<br>");  //人員姓名
                    //Response.Write(i.Split('#')[1] + "<br>");  //人員email

                    String ques;

                    MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                    MailAddress to = new MailAddress(i.Split('#')[1]);

                    MailAddress bcc = new MailAddress("Raven.Lee@minaik.com.tw");
                    MailAddress bccrage = new MailAddress("rage.mai@minaik.com.tw");

                    MailMessage message = new MailMessage(from, to);
                    message.Bcc.Add(bcc);
                    message.Bcc.Add(bccrage);
                    DateTime de = Convert.ToDateTime(this.FIELD_expect_date.Text);
                    ques = i.Split('#')[0] + " 您好:" + "<br>" +
                           "<br>" +
                           "EIP工程試作單系統現有一筆，正等待您的處理:" + "<br>" +
                           "<br>" +
                           "單號 : " + this.no.Text + "<br>" +
                           "申請日期 : " + de.ToString("yyyy/MM/dd") + "<br>" +
                           "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/EngineeringTest/EngineeringTestView.aspx?id=" + Request.QueryString["id"] + "\" >至EIP工程試作單系統審核</a>" +
                           "<br>" +
                           "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                           "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                           "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                    message.Subject = "EIP工程試作單號 - " + this.no.Text + " 成品料號-" + this.cima01.Text +"正在待您審核中" ;

                    message.IsBodyHtml = true;
                    message.Body = ques;

                    SmtpClient client = new SmtpClient("192.168.0.12");

                    client.Send(message);

                }


            }
        }
        //DBTransfer actsql3 = new DBTransfer();
        //actsql3.RunIUSql("insert into  misbuffer2(caption)values('ann信最外裡面" + this.FIELD_pmk01.Text + "')");

    }

    private void showError(string message)
    {
        string showmessage = "alert('" + message + "')";
        ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", showmessage, true);
    }

    protected void InputButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("PMRdata.aspx?PID=" + Request.QueryString[0] + "&ID=" + Request.QueryString[1]);
    }

    private void SendMail(ArrayList alist, string id, string sn)
    {               
        try
        {
            string mailaddress = "";//this.DataList1.Items.Count.ToString() ;
            string to_mail = "";
            SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rss.Open("select email from EIPA.dbo.EngineeringTest_head a  left join EIPA.dbo.dguser b on a.add_user=b.id where a.id='" + Request.QueryString["id"] + "'   ").ToString();
            if (!rss.EOF)
            {
                mailaddress = rss["email"].ToString();
            }
            //string MailCC = "";
            //if (alist.Count != 0)
            //{
            //    foreach (string s in alist)
            //    {
            //        MailCC += s + ";";
            //    }
            //}
            //int i = 0;
            //foreach (string mail in alist)
            //{
            //    if (i == 0)
            //        to_mail = mail;
            //    else
            //        mailaddress += mail + ";";
            //}
            //mailaddress = mailaddress.Substring(1, mailaddress.Length - 1);
            //mailaddress = this.CurrentUser.EMail + ";" + mailaddress;


            String ques;
            MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");

            MailAddress to = new MailAddress(mailaddress);
            //if (string.IsNullOrEmpty(MailCC))
            //{
            //    MailAddress cc = new MailAddress(MailCC);
            //}
            //正式的時候記得demark
            //MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw"); 
            //MailAddress bcc = new MailAddress("Raven.Lee@minaik.com.tw");
            //MailAddress bccrage = new MailAddress("rage.mai@minaik.com.tw");

            MailMessage message = new MailMessage(from, to);
            //message.Bcc.Add(bcc);
            //message.Bcc.Add(bccrage);

            message.To.Add(mailaddress);
            DateTime de = Convert.ToDateTime(this.FIELD_expect_date.Text);
            ques = "  您好: " +
                "<BR>NPI 試模計劃系統現有一筆資料通知您 " +
                " <BR>詳細資料：<a href=\"http://eip.minaik.com.tw/NPI_TryoutFeedback/NPI_TryoutFeedbackEdit.aspx?rowno=" + id + "\">http://eip.minaik.com.tw/NPI/NPI_TryoutFeedbackView.aspx</a>" +
                 " <BR>==================================================================================================" +
                 " <BR><table border=1 width=500>" +
                 " <tr>" +
                 " <td align=center style=background-color: #f0f0f0;>表單編號</td><td align=left >" + sn + "</td>" +
                 " </tr>" +
                 " <tr>" +
                 " <td align=center style=background-color: #f0f0f0;>成品料號</td><td align=left >" + this.cima01.Text + "</td>" +
                 " </tr>" +
                 " </table>" +
                 " <BR>==================================================================================================" +
                 " <BR>如您想了解更多有關員工入口網站的資訊請點選以下連結進入" +
                 " <BR><a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" +
                 " <BR>感謝您對員工入口網站的支持與愛護。<font color=\"red\">因本信件為系統自動發送,請勿直接以此郵件回覆</font>";

            message.Subject = "【通知】EIP模具試作計劃系統單號 - " + sn + " 成品料號-" + this.cima01.Text + "";

            message.IsBodyHtml = true;

            message.Body = ques;


            SmtpClient client = new SmtpClient("192.168.0.12");

            client.Send(message);

            //}
            //rss.Close();

        }
        catch (Exception e)
        {
            throw new Exception(e.Message );
        }
    }

    /// <summary>
    /// 加入印出工程試作單單號，在整個的簽核完成後
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://rs.minaik.com.tw/MBCS_report/MBCS_report_page.aspx?id=" + Request.QueryString["id"]);
    }
}
}