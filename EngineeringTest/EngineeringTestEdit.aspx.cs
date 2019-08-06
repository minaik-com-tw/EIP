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
public partial class EngineeringTestEdit : SmoothEnterprise.Web.Page
{
    public string data2;
	protected void Page_Load(object sender, System.EventArgs e)
	{
        BUTTON_save.Attributes.Add("OnClick", "return   j1()"); //如前端javascript檢查有問題,禁止提交頁面
        BUTTON_SendRequest.Attributes.Add("OnClick", "return   j1()");
        data2 = "1";
        SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rsa.Open("select * from dgflowqueue where text='資材單位' and qseq='1' and reviewresult is not null and   requesturl like '%" + Request.QueryString["id"] + "'");
        if (!rsa.EOF)
        {
            this.BUTTON_StopRequest.Visible = false;
        }
        if (this.CurrentUser.LogonID.ToString() == "Rage.Mai")
        {
            this.BUTTON_StopRequest.Visible = true;
            this.InputButton2.Visible = true;
        }


            this.BUTTON_StopRequest.Visible = Utility.MIS_Manager(CurrentUser.LogonID);

       
		try
		{
            if (!this.IsPostBack)
            {
                this.cima01.ReadOnly = false;
                this.cima02.ReadOnly = false;
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT plantid,no,add_date,expect_date,cima01,cima02,cima03,rev,oduction_amount,delivers_amount,oduction_explain "+
                       ",lsend,makesend,pmcsend,workssend,status,flow_type,rd_level,order_no,name,a.remark remark,a.obj , project_no,module_no ,isnot FROM EngineeringTest_head a left join dguser b on a.add_user=b.id  WHERE a.id='" + Request.QueryString["id"] + "' ");
                if (!rs.EOF)
                {

                    this.plantid.Text = rs["plantid"].ToString();
                    this.no.Text = rs["no"].ToString();
                    this.add_date.Text = rs["add_date"].ToString();
                    this.rd_level.Text = rs["rd_level"].ToString().Trim(); 
                    this.FIELD_expect_date.Text = rs["expect_date"].ToString();
                    this.cima01.Text = rs["cima01"].ToString();
                    this.cima02.Text = rs["cima02"].ToString();
                    this.cima03.Text = rs["cima03"].ToString();
                    this.rev.Text = rs["rev"].ToString();
                    this.oduction_amount.Text = rs["oduction_amount"].ToString();
                    this.delivers_amount.Text = rs["delivers_amount"].ToString();
                    this.oduction_explain.Text = rs["oduction_explain"].ToString();
                    this.order_no.Text = rs["order_no"].ToString();
                    this.FIELD_lsend.Text = rs["lsend"].ToString();
                    this.FIELD_makesend.Text = rs["makesend"].ToString();
                    this.FIELD_pmcsend.Text = rs["pmcsend"].ToString();
                    this.FIELD_workssend.Text = rs["workssend"].ToString();
                    this.flow_type.Text = rs["flow_type"].ToString().Trim();
                    this.add_user.Text = rs["name"].ToString();
                    this.remark.Text = rs["remark"].ToString();
                    this.project_no.Text = rs["project_no"].ToString();
                    this.module_no.Text = rs["module_no"].ToString();
                    this.FEILD_obj.SelectedIndex = rs["obj"] is DBNull ? 0 : int.Parse( rs["obj"].ToString());
                    this.FIELD_ISNOTORNULL.Checked = bool.Parse(rs["isnot"].ToString());
                    if (rs["status"].ToString() != "Y")this.InputButton2.Visible = true;
                    if (rs["status"].ToString() == "Y") this.InputButton1.Enabled = true;
                    if (rs["status"].ToString() == "Y")
                    { 
                        this.BUTTON_save.Enabled = false; 
                    }
                    else
                    {
                        this.BUTTON_save.Enabled = true; 
                    }


                    if (rs["status"].ToString() == "N")
                    {
                        this.AddWarning(this, "Page_Load()", "", "請記得將單據送審！");
                        this.AddWarning(this, "Page_Load()", "", "若修改資料，請先按儲存鈕將資料儲存！");
                    }
                }
                else
                {
                    //Response.Redirect("EngineeringTest.aspx");
                }
            }
		}
		catch
		{
            //Response.Redirect("EngineeringTest.aspx");
		}
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
    	}
	}

	protected void BUTTON_save_Click(object sender, System.EventArgs e)
	{
        //if (this.IsValid)
        //{
            //try
            //{

               cima01.Attributes.Add("readonly", "false");
               cima02.Attributes.Add("readonly", "false");
               cima03.Attributes.Add("readonly", "false");
               rev.Attributes.Add("readonly", "false");

               oduction_amount.Attributes.Add("readonly", "false");
               delivers_amount.Attributes.Add("readonly", "false");

               
                //單頭update

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM EngineeringTest_head WHERE id='" + Request.QueryString["id"] + "' ");
                if (!rs.EOF)
                {
                    // Response.Write("bbb");


                     rs["flow_type"] = this.flow_type.Text;
                     rs["rd_level"] = this.rd_level.Text;
                     rs["cima01"] = this.cima01.Text;
                     rs["cima02"] = this.cima02.Text;
                     rs["cima03"] = this.cima03.Text;
                     rs["rev"] = this.rev.Text;
                     rs["oduction_amount"] = this.oduction_amount.Text;
                     rs["delivers_amount"] = this.delivers_amount.Text;
                     DateTime de = Convert.ToDateTime(this.FIELD_expect_date.Text);
                     rs["expect_date"] = de.ToString("yyyy/MM/dd");
                     rs["oduction_explain"] = this.oduction_explain.Text;
                     rs["order_no"] = this.order_no.Text;
                     rs["lsend"] = this.FIELD_lsend.Text;
                     rs["pmcsend"] =this.FIELD_pmcsend.Text;
                     rs["project_no"] = this.project_no.Text;
                     if (this.FIELD_workssend.Text != "") rs["workssend"] = this.FIELD_workssend.Text;
                     if (this.FIELD_makesend.Text != "") rs["makesend"] = this.FIELD_makesend.Text;
                     rs["mail"] = Request.Form["email"].Replace(",", ";");
                     rs["remark"] = this.remark.Text;
                     rs["module_no"] = this.module_no.Text;
                     rs["obj"] = this.FEILD_obj.SelectedValue;
                     rs["isnot"] = this.FIELD_ISNOTORNULL.Checked;
                    rs.Update();
                }
                rs.Close();

                //單身刪除再新增
                SmoothEnterprise.Database.DataSet rsdelete = new SmoothEnterprise.Database.DataSet();
                rsdelete.ExecuteNonQuery("delete EngineeringTest_body where aid='" + Request.QueryString["id"] + "' ");

                for (int i = 0; i <= int.Parse(Request.Form["idx"]); i++)
                {
                    if (Request.Form["txtSymbol"].Split(',')[i] != "")
                    {
                        SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs2.Open("SELECT * FROM EngineeringTest_body WHERE 1=0");
                        rs2.Add();
                        rs2["aid"] = Request.QueryString["id"];
                        rs2["ima01"] = Request.Form["txtSymbol"].Split(',')[i];
                        //rs2["ima02"] = Request.Form["txtCName"].Split(',')[i];
                        rs2["amount"] = float.Parse(Request.Form["Quantity"].Split(',')[i]);
                        //rs2["samount"] = float.Parse(Request.Form["Quantity2"].Split(',')[i]);
                        rs2["pcs"] = Request.Form["Unit"].Split(',')[i];
                        //rs2["material_origin"] = int.Parse(Request.Form["Source"].Split(',')[i]); 
                        rs2.Update();
                        rs2.Close();
                    }
                    
                }

            // 20130521 增加內容定義
            #region 內容定義

                rsdelete.ExecuteNonQuery("delete Engineeringtest_Item WHERE aID = '" + Request.QueryString["ID"] + "'");

            if (!string.IsNullOrEmpty( Request.Params["Item"] )) //ADD BY CAROL 20190325 
            {
                SmoothEnterprise.Database.DataSet email = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                email.Open("SELECT * FROM Engineeringtest_Item WHERE 1=0");

                String[] Item = Request.Form["Item"].Split(',');
                String[] resolution = Request.Form["resolution"].Split(',');
                String[] describe = Request.Form["describe"].Split(',');

                int x = 0;
                foreach (string bb in Item)
                {
                    if (!String.IsNullOrEmpty(bb))
                    {
                        email.Add();
                        email["aid"] = Request.QueryString["ID"];
                        email["strItem"] = bb;
                        email["strDoc"] = resolution[x];
                        email["strProductNum"] = describe[x];
                        email.Update();
                    }
                    x = x + 1;
                }
                email.Close();

                #endregion
            }
            // 20130521 增加內容定義
        }

    protected void BUTTON_back_Click(object sender, System.EventArgs e)
    {
        this.GoBack("EngineeringTest.aspx", new string[] { "EngineeringTestDelete.aspx" });
    }

    protected void BUTTON_delete_Click(object sender, System.EventArgs e)
    {
        Response.Redirect("EngineeringTestDelete.aspx?id=" + Request.QueryString["id"]);
    }
    protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {
        SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rb.Open("SELECT * FROM EngineeringTest_head WHERE id='" + Request.QueryString["id"] + "'  ");
        while (!rb.EOF)
        {
            rb["STATUS"] = "Y";

            rb.Update();
            rb.MoveNext();

        }
        rb.Close();

        this.InputButton2.Enabled = false;
        this.BUTTON_SendRequest.Flow = this.FlowClient1;
        this.InputButton1.Enabled = true;
        this.BUTTON_save.Enabled = false;

        managerlevel aa = new managerlevel(); //引用managerlevel class
        ArrayList all = new ArrayList();  //all arraylist
        ArrayList managerid = new ArrayList();  //主管id arraylist
        ArrayList managerlv = new ArrayList();  //主管階級 arraylist
        ArrayList managernm = new ArrayList();  //主管職稱 arraylist

        //if (aa.manager(this.CurrentUser.ID.ToString()).Split('@')[0] == this.FIELD_lsend.Text.ToString().ToUpper())
        //{

        //}
        //else
        //{
        //    managerid.Add(this.FIELD_lsend.Text);
        //    managernm.Add("自訂審核人");

        //    managerid.Add(aa.manager(this.CurrentUser.ID.ToString()).Split('@')[0]);
        //    managernm.Add("直屬主管");


        //}


        if (this.flow_type.Text == "1")
        {
            managerid.Add(this.FIELD_lsend.Text);
            managernm.Add("直屬主管");
            managerid.Add(this.FIELD_pmcsend.Text);
            managernm.Add("資材單位");
        }

        if (this.flow_type.Text == "2")
        {
            managerid.Add(this.FIELD_lsend.Text);
            managernm.Add("直屬主管");
            managerid.Add(this.FIELD_pmcsend.Text);
            managernm.Add("資材單位");
            managerid.Add(this.FIELD_makesend.Text);
            managernm.Add("製造單位");
        }
        if (this.flow_type.Text == "3")
        {
            managerid.Add(this.FIELD_lsend.Text);
            managernm.Add("直屬主管");
            managerid.Add(this.FIELD_pmcsend.Text);
            managernm.Add("資材單位");
            managerid.Add(this.FIELD_workssend.Text);
            managernm.Add("工程單位");
        }
        if (this.flow_type.Text == "4")
        {
            managerid.Add(this.FIELD_lsend.Text);
            managernm.Add("直屬主管");
            managerid.Add(this.FIELD_pmcsend.Text);
            managernm.Add("資材單位");
            managerid.Add(this.FIELD_workssend.Text);
            managernm.Add("工程單位");

            managerid.Add(this.FIELD_makesend.Text);
            managernm.Add("製造單位");
        }
        if (this.flow_type.Text == "5")
        {
            managerid.Add(this.FIELD_pmcsend.Text);
            managernm.Add("資材單位");
            managerid.Add(this.FIELD_workssend.Text);
            managernm.Add("工程單位");

            managerid.Add(this.FIELD_makesend.Text);
            managernm.Add("製造單位");

            managerid.Add(this.FIELD_lsend.Text);
            managernm.Add("直屬主管");
        }



        sharflow12_3.Flowwork.sharflow12_31 flow = new sharflow12_3.Flowwork.sharflow12_31();
        // sharflow12.Flowwork.sharflow121 flow = new sharflow12.Flowwork.sharflow121();
        FlowClient1.Text = "工程試作單電子簽核";  //更改流程名稱
        switch (managerid.Count)  //依舊arraylist裡面有幾個,來判斷走那條flow
        {

            case 1:
                e.NextNode = flow.sharflow12_3Node1;
                break;

            case 2:
                e.NextNode = flow.sharflow12_3Node2;
                break;

            case 3:
                e.NextNode = flow.sharflow12_3Node4;
                break;

            case 4:
                e.NextNode = flow.sharflow12_3Node7;
                break;

            case 5:
                e.NextNode = flow.sharflow12_3Node11;
                break;

            case 6:
                e.NextNode = flow.sharflow12_3Node16;
                break;

            case 7:
                e.NextNode = flow.sharflow12_3Node22;
                break;

            case 8:
                e.NextNode = flow.sharflow12_3Node29;
                break;

            case 9:
                e.NextNode = flow.sharflow12_3Node37;
                break;

            case 10:
                e.NextNode = flow.sharflow12_3Node46;
                break;

            case 11:
                e.NextNode = flow.sharflow12_3Node56;
                break;

            case 12:
                e.NextNode = flow.sharflow12_3Node67;
                break;
        }
        e.NextNode.ReviewerURL = "/EngineeringTest/EngineeringTestView.aspx";

        int count = 0;
        foreach (string i in managerid)  //將簽核人員id塞進flow
        {
            this.FlowClient1.AddParameter("USER" + count.ToString(), i);
            //Response.Write("USER" + count.ToString() + ")" + i + "<br>");
            count++;
        }

        count = 0;

        foreach (string i in managernm)  //將簽核人員職稱塞進flow
        {
            this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
            //Response.Write("USERTITLE" + count.ToString() + ")" + i + "<br>");
            count++;
        }

        //寄mail------------------------------------------------------------------

        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        string sendermail = "";
        if (this.flow_type.SelectedValue == "5")
        {
            sendermail = this.FIELD_pmcsend.Text;
        }
        else
        {
            sendermail = this.FIELD_lsend.Text;
        }

        rss.Open("select id bid,name,email from dguser where id = '" + sendermail + "' ");
        if (!rss.EOF)
        {

            ArrayList email_list = new ArrayList();  //email list


            email_list.Add(rss["name"].ToString() + '#' + rss["email"].ToString());

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

                //MailAddress bcc = new MailAddress("Raven.Lee@minaik.com.tw");
                //MailAddress bccrage = new MailAddress("rage.mai@minaik.com.tw");
                MailMessage message = new MailMessage(from, to);
                //message.Bcc.Add(bcc);
                //message.Bcc.Add(bccrage);
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

                message.Subject = "EIP工程試作單號 - " + this.no.Text + " 成品料號-" + this.cima01.Text + "正在待您審核中";

                message.IsBodyHtml = true;
                message.Body = ques;

                SmtpClient client = new SmtpClient("192.168.0.12");

                client.Send(message);

            }


        }

    }
    protected void InputButton1_Click(object sender, EventArgs e)
    {

        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rss.Open("select a.*, b.name name, b.email email,c.no no,b.id bid from dgflowqueue a left join dguser b on a.revieweruid = b.id " +
                "left join EngineeringTest_head c on c.id= '" + Request.QueryString["id"] + "' " +
                "where requesturl = '/EngineeringTest/EngineeringTestedit.aspx?id=" + Request.QueryString["id"] + "' and revieweruid <> " +
                "'" + System.Guid.Empty.ToString() + "' and reviewdate is null ");
        if (!rss.EOF)
        {

            ArrayList email_list = new ArrayList();  //email list


            email_list.Add(rss["name"].ToString() + '#' + rss["email"].ToString());

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

                //MailAddress bcc = new MailAddress("rage.mai@minaik.com.tw");

                MailMessage message = new MailMessage(from, to);
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

                message.Subject = "提醒您 EIP工程試作單號 - " + this.no.Text + " 成品料號-" + this.cima01.Text + "正在待您審核中";

                message.IsBodyHtml = true;
                message.Body = ques;

                SmtpClient client = new SmtpClient("192.168.0.12");

                client.Send(message);

            }


        }
    }
    protected void BUTTON_StopRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {
        this.InputButton2.Enabled = true;
        this.InputButton1.Enabled = false;
        this.BUTTON_save.Enabled = true;
        SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rb.Open("SELECT * FROM EngineeringTest_head WHERE id='" + Request.QueryString["id"] + "'  ");
        while (!rb.EOF)
        {
            rb["STATUS"] = "N";

            rb.Update();
            rb.MoveNext();

        }
        rb.Close();
    }
    protected void InputButton2_Click(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rb.Open("SELECT * FROM EngineeringTest_head WHERE id='" + Request.QueryString["id"] + "'  ");
        while (!rb.EOF)
        {
            rb["STATUS"] = "V";

            rb.Update();
            rb.MoveNext();

        }
        rb.Close();

        Response.Redirect("EngineeringTest.aspx");
    }
    protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
    {
        try
        {
            //Label label;
            //object obj = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
            //label = (Label)obj;
            //label.Text = e["Flow_Comment"].ToString();

            SmoothEnterprise.Web.UI.HTMLControl.InputText it2;
            object obj2 = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
            it2 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj2;
            it2.Enabled = true;
            it2.ReadOnly = true;
            it2.Text = (string)e["Flow_Comment"];
        }
        catch { }

        //電子簽章呈現-----------------------------------------------------------------------------------------
        System.Web.UI.WebControls.Image sin1;
        object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
        sin1 = (System.Web.UI.WebControls.Image)obj5;
        //Response.Write((string)e["InputText3"] + "--");
        sin1.ImageUrl = "~/image/" + (string)e["InputText3"] + ".JPG";
    }
}
}