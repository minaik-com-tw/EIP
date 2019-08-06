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
using System.Text;
using System.IO;
using System.Threading;
using System.Net;

namespace ERP_CIMI100
{
public partial class cimi100_TurnView : SmoothEnterprise.Web.Page
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    private string db3 = ""; //db副2位置
    private string class_no = ""; //2拋轉3變更
    private string flowname = "";//流程名稱
    private bool _NotifyReview = false;
	protected void Page_Load(object sender, System.EventArgs e)
	{
        class_no = Request.QueryString["class_no"];

        if (Environment.MachineName.ToString().Trim() != "ANN-LIN") //如果不是在Ann本機, 則指定資料庫 
        {
            db1 = "[EIPB].[dbo].";
            db2 = "[EIPA].[dbo].";
            db3 = "[192.168.0.185].[dbo].";

        }
		if (!this.IsPostBack)
		{
			//try
			//{
                if (!this.IsPostBack)
                {


                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                    rs.Open("SELECT   bass_no,name FROM " + db1 + "cimi100_base where class_no='plantid' and bass_no <> 'ALL' order by order_no");
                    while (!rs.EOF)
                    {
                        CheckBoxList2.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();


                    rs.Open("SELECT a.*,b.name bname FROM " + db1 + "cimi100_main a left join " + db2 + "dguser b on a.add_user=b.id WHERE a.id='" + Request.QueryString["id"] + "' ");
                    if (!rs.EOF)
                    {
                        this.FIELD_NO.Text = rs["no"].ToString();
                        this.FIELD_add_user.Text = rs["bname"].ToString();
                        this.FIELD_plantid.Text = rs["plantid"].ToString();
                        

                    }
                    else
                    {
                        Response.Redirect("cimi100.aspx");
                    }
                    rs.Close();

                    //找之前新增的key值
                    rs.Open("select max(elapsedticks) elapsedticks from " + db1 + "cimi100_turn where no='" + this.FIELD_NO.Text + "'");
                    if (!rs.EOF)
                    {
                        this.PK1.Value = rs["elapsedticks"].ToString();
                    }

                    #region 確認身份是否為簽核人或代理人, 如yes, 可update

                    SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs2.Open("  select * from  " + db2 + "dgflowqueue where requesturl like '%" + Request.QueryString["id"] + "%' and revieweruid <>'00000000-0000-0000-0000-000000000000' " ); //找簽核人員
                    if (!rs2.EOF)
                    {
                        if ("{"+rs2["revieweruid"].ToString().ToUpper()+"}" == this.CurrentUser.ID.ToString().ToUpper())  //簽核人員=登錄人員
                        {
                            Button_UpdateItem.Enabled = true;
                        }
                        else
                        {
                            SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead); //找簽核人員是否=登錄人員
                            rs3.Open(" SELECT b.name name,email FROM " + db2 + "dguserdeputy a left join " + db2 + "dguser b on a.deputyuid=b.id left join " + db2 + "dgflow c on a.sid=c.id  " +
                                     " where  a.uid='" + rs2["revieweruid"].ToString() + "' and b.id='" + this.CurrentUser.ID.ToString() + "' " +
                                     " and  " +
                                     " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                                     " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate is null) or " +  //sharflow12_21 一般流程
                                     " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate > GETDATE()) or " +
                                     "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");
                            if (!rs3.EOF)
                            {
                                Button_UpdateItem.Enabled = true;
                            }
                            else
                            {
                                Button_UpdateItem.Enabled = false;
                            }
                        }
                    }
                    else
                    {
                        
                        Button_UpdateItem.Enabled = false;

                    }

                    #endregion
                    if (this.CurrentUser.LogonID != "herzog.lin") Button1.Visible = false;


                    # region 判斷語言
                    string userUICulture = Thread.CurrentThread.CurrentUICulture.Name;
                    if (userUICulture == "en")
                    {
                        if (class_no.ToString() == "2") this.title.Text = "Material Toss Turn Application"; else this.title.Text = "Material Change Application";

                    }
                    else
                    {

                        if (class_no.ToString() == "2") this.title.Text = "料件拋轉申請單"; else this.title.Text = "料件變更申請單";

                    }
                    #endregion

                    #region 若為3變更,廠區隱形
                    if (class_no.ToString() == "3")
                    {
                        this.CheckBoxList2.Visible = false;
                        this.Label8.Visible = false;
                    }

                    #endregion
                }
                gridviewchange(this.FIELD_NO.Text);

			//}
			//catch
			//{
			//	Response.Redirect("cimi100.aspx");
			//}
		}
	}

    protected void Page_PreRender(object sender, System.EventArgs e)
    {
        if (class_no.ToString() == "2") flowname = "料件拋轉流程"; else flowname = "料件變更流程";

        //下一關發信
        ShrFlowMail Backsend = new ShrFlowMail();
        if (_NotifyReview)
        {

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("select top 1 REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid from " + db2 + "dgflowqueue a left join " + db2 + "dguser b on revieweruid=b.id where requesturl like '%" + Request.QueryString["id"] + "%'  AND reviewdate IS NULL AND qseq is not null  ");  
            if (!rs.EOF)
            {
                Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", flowname.ToString(), this.FIELD_NO.Text, rs["name"].ToString(), rs["email"].ToString(), "http://eip.minaik.com.tw/ERP_Cimi100/Cimi100_turnView.aspx?id=" + Request.QueryString["id"] + "&class_no=" + Request.QueryString["class_no"], "--申請人員:" + rs["name"].ToString() + "<BR>--廠區:" + this.FIELD_plantid.Text + "");

                Dguserdeputy(rs["bid"].ToString());
            }
        }

    }

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
		this.GoBack();
	}

    protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
    {
        this.FlowFeedback1.Commit();
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                e.Row.Cells[1].Attributes.Add("onclick", "onGridViewRowSelected('" + e.Row.DataItemIndex + "','" + Request.QueryString["class_no"] + "')");

            }
            if (class_no.ToString() == "3")  //若為3變更,廠區隱形
            {
                e.Row.Cells[7].Visible = false;

            }
            e.Row.Cells[0].Enabled = false;

        

    }
    protected void Button_UpdateItem_Click(object sender, EventArgs e)
    {
        //拋轉的廠區
        string strPlantidLimmit = "";
        string plantid_list = "";
        for (int x = 0; x < this.CheckBoxList2.Items.Count; x++)
        {
            if (CheckBoxList2.Items[x].Selected == true)
            {
                strPlantidLimmit = strPlantidLimmit + CheckBoxList2.Items[x].Value + "@";
                if (plantid_list == "")
                {
                    plantid_list = "'" + CheckBoxList2.Items[x].Value + "'";
                }
                else
                {
                    plantid_list = plantid_list + ",'" + CheckBoxList2.Items[x].Value + "'";
                }
            }
        }

        SmoothEnterprise.Database.DataSet rrs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rrs.Open("select * from " + db1 + "cimi100_turn where elapsedticks= '" + this.PK1.Value.ToString() + "' and partno='" + Request.Form["FIELD_Partno"].ToString() + "' and item <> '" + this.rember_item.Value.ToString() + "' ");

        if (!rrs.EOF)
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('料號重覆登打!');", true);
        }
        else if (strPlantidLimmit.Length < 2 && class_no == "2")
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('請輸入廠區!');", true);

        }
        else
        {
            SmoothEnterprise.Database.DataSet urs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            urs.Open("SELECT * FROM " + db1 + "cimi100_turn WHERE elapsedTicks='" + this.PK1.Value.ToString() + "' and item='" + this.rember_item.Value.ToString() + "' ");
            if (!urs.EOF)
            {

                urs["partno"] = Request.Form["FIELD_Partno"];
                urs["component"] = Request.Form["FIELD_Component"];
                urs["dwg"] = Request.Form["FIELD_DWG"];
                urs["turn_plantid"] = strPlantidLimmit.ToString();
                urs.Update();
            }
            urs.Close();
        }
        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aaa", " document.getElementById(\"ctl00_ContentPlaceHolder1_Button_UpdateItem\").style.display = \"none\" ;", true);
        for (int i = 0; i < CheckBoxList2.Items.Count; i++)  //新增完將checkboxlist清除
        {
            CheckBoxList2.Items[i].Selected = false;
        }
        gridviewchange(this.FIELD_NO.Text);
    }

    void gridviewchange(string aa)  //change girdview
    {


        SqlDataSource1.SelectCommand = "select  no, item, elapsedTicks, partno, component, dwg, " +
                                       " CASE  WHEN turn_plantid ='' THEN turn_plantid   " +
                                       " ELSE  SUBSTRING(REPLACE(turn_plantid,'@', ','), 0, LEN(turn_plantid)) END  turn_plantid  " +
                                       " ,tc_imi02,tc_imi021,tc_imi03,tc_imi031 as tc_imi03nm from " + db1 + "cimi100_turn where no='" + aa.ToString() + "'  ";


        //Response.Write(SqlDataSource1.SelectCommand.ToString());
        this.GridView1.DataBind();

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

            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
           "RedirectAfterCommit",
           "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");

        }
        catch { }

    }
    protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
    {
        if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
        {

            _NotifyReview = true;
            e.NextNode = e.FlowNode.DefaultNode();
            e.NextNode.ReviewerURL = "/ERP_Cimi100/Cimi100_TurnView.aspx";
        }

    }
    protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
    {

        if (class_no.ToString() == "2") flowname = "料件拋轉系統"; else flowname = "料件變更系統";

        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rss.Open("select no,add_user aid,b.email aemail,b.name aname,c.id bid,c.email bemail,c.name baname from  " + db1 + "cimi100_main a  left join  " + db2 + "dguser b on a.add_user=b.id " +
                 "left join " + db2 + "dguser c on a.dcc=c.id  where a.id='" + Request.QueryString["id"] + "'   ");
        if (!rss.EOF)
        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete)  //完成審核
            {
                SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rb.Open("SELECT * FROM " + db1 + "cimi100_main WHERE id='" + Request.QueryString["id"] + "'  ");
                if (!rb.EOF)
                {
                    rb["STATUS"] = "OK";
                    rb.Update();

                    gridviewchange(this.FIELD_NO.Text);

                    String ques;

                    MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                    MailAddress to = new MailAddress(rss["aemail"].ToString());
                    if(this.FIELD_plantid.Text != "MAT") { MailAddress bcc = new MailAddress(rss["bemail"].ToString()); }
                    MailMessage message = new MailMessage(from, to);
                    ques = "您好:" + "<br>" +
                            flowname+ "已完成審核, 詳細資料如下:" + "<br>" +
                            "單號 : " + this.FIELD_NO.Text + "<br>" +
                           "<br>" + GridViewToHtml(GridView1) + "<br>" +
                           "申請內容 : " +
                           "<a href=\"http://eip.minaik.com.tw/erp_cimi100/cimi100_turnView.aspx?id=" + Request.QueryString["id"] + "&class_no=" + Request.QueryString["class_no"] + "\" >至" + flowname + "查看</a>" +
                           "<br>" +
                           "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                           "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                           "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                    message.Subject = flowname + "單號 - " + this.FIELD_NO.Text + "己完成審核";

                    message.IsBodyHtml = true;
                    message.Body = ques;

                    SmtpClient client = new SmtpClient("192.168.0.12");

                    client.Send(message);

                }
                rb.Close();

                #region 完成審核寄txt給ERP
                if (class_no.ToString().Trim() == "2")  //拋轉
                {
                    FileStream fs = new FileStream(@"D:\CIMI100_XML\4GL\" + this.FIELD_plantid.Text.ToString().Trim() + "_T-CIMI100_" + this.FIELD_NO.Text + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs, Encoding.Default);
                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs.Open("SELECT   CASE  WHEN turn_plantid ='' THEN turn_plantid   ELSE  SUBSTRING(REPLACE(turn_plantid,'@', ','), 0, LEN(turn_plantid)) END  turn_plantid , " +
                            "partno,replace(replace(replace(replace(component,'\"','~'),'＂','~'),'''','~'),'&','~')  component," +
                            " replace(replace(replace(replace(dwg,'\"','~'),'＂','~'),'''','~'),'&','~')  dwg FROM " + db1 + "cimi100_turn where no='" + this.FIELD_NO.Text.Trim() + "' order by item");
                    while (!rs.EOF)
                    {

                        String[] s = rs["turn_plantid"].ToString().Split(',');
                        foreach (string bb in s)
                        {
                            sw.WriteLine("\"" + bb.ToString() + "\",\"CIMI100\",\"" + rs["partno"].ToString() + "\",\"" + rs["Component"].ToString() + "\",\"" + rs["dwg"].ToString() + "\"");

                        }

                        rs.MoveNext();
                    }
                    rs.Close();

                    sw.Close();
                    fs.Close();
                    Upload("D:\\CIMI100_XML\\4GL\\" + this.FIELD_plantid.Text.ToString().Trim() + "_T-CIMI100_" + this.FIELD_NO.Text + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString().Trim() + "_T-CIMI100_" + this.FIELD_NO.Text + ".txt", "4gl", "4gl");



                }
                else                              //變更
                {
                    FileStream fs = new FileStream(@"D:\CIMI100_XML\4GL\" + this.FIELD_plantid.Text.ToString().Trim() + "_M-CIMI100_" + this.FIELD_NO.Text + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs, Encoding.Default);
                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs.Open("SELECT   CASE  WHEN turn_plantid ='' THEN turn_plantid   ELSE  SUBSTRING(REPLACE(turn_plantid,'@', ','), 0, LEN(turn_plantid)) END  turn_plantid , " +
                            "partno,replace(replace(replace(replace(component,'\"','~'),'＂','~'),'''','~'),'&','~') component"+
                            " , replace(replace(replace(replace(dwg,'\"','~'),'＂','~'),'''','~'),'&','~') dwg FROM " + db1 + "cimi100_turn where no='" + this.FIELD_NO.Text.Trim() + "' order by item");
                    while (!rs.EOF)
                    {
                        string plantid = this.FIELD_plantid.Text.Trim();
                        if (this.FIELD_plantid.Text.Trim() == "MAT") plantid = "MINAIK";
                        sw.WriteLine("\"" + plantid.ToString() + "\",\"CIMI100\",\"" + rs["partno"].ToString() + "\",\"" + rs["Component"].ToString() + "\",\"" + rs["dwg"].ToString() + "\"");
                        rs.MoveNext();
                    }
                    rs.Close();

                    sw.Close();
                    fs.Close();
                    Upload("D:\\CIMI100_XML\\4GL\\" + this.FIELD_plantid.Text.ToString().Trim() + "_M-CIMI100_" + this.FIELD_NO.Text + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString().Trim() + "_M-CIMI100_" + this.FIELD_NO.Text + ".txt", "4gl", "4gl");

                    uploadERP2();
                
                }

                #endregion





            }

            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate || e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Return)         //退回
            {
                SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rb.Open("SELECT * FROM " + db1 + "cimi100_main WHERE id='" + Request.QueryString["id"] + "'  ");
                if (!rb.EOF)
                {
                    rb["STATUS"] = "NO";
                    rb.Update();

                }
                rb.Close();

                ShrFlowMail Backsend = new ShrFlowMail();
                Backsend.RejectResult("5a3f8c87-e0dc-4bbb-8116-661521bfc6c7", flowname.ToString(), this.FIELD_NO.Text, rss["aemail"].ToString(), "--廠區:" + this.FIELD_plantid.Text + "<BR>--申請人員:" + rss["aname"].ToString(), rss["aname"].ToString(), "http://eip.minaik.com.tw/erp_cimi100/cimi100_turnView.aspx?id=" + Request.QueryString["id"] + "&class_no=" + Request.QueryString["class_no"], "退回單據");




            }

        }
    }

    void Dguserdeputy(string userid)  //代理人寄信
    {
        ShrFlowMail Backsend = new ShrFlowMail();



        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rs.Open(" SELECT b.name name,email FROM " + db2 + "dguserdeputy a left join " + db2 + "dguser b on a.deputyuid=b.id left join " + db2 + "dgflow c on a.sid=c.id  " +
                 " where  a.uid='" + userid + "'  " +
                 " and  " +
                 " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                 " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate is null) or " +  //sharflow12_21 一般流程
                 " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate > GETDATE()) or " +
                 "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");
        while (!rs.EOF)
        {

            Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", flowname.ToString(), this.FIELD_NO.Text, rs["name"].ToString(), rs["email"].ToString(), "http://eip.minaik.com.tw/ERP_Cimi100/Cimi100_turnView.aspx?id=" + Request.QueryString["id"] + "&class_no=" + Request.QueryString["class_no"], "--申請人員:" + rs["name"].ToString() + "<BR>--廠區:" + this.FIELD_plantid.Text + ""); 
            rs.MoveNext();

        }
        rs.Close();

    }
    protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
    {
        try
        {
            //意見的呈現-----------------------------------------------------------------------------------------

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
            sin1.ImageUrl = "~/image/" + (string)e["InputText3"] + ".JPG";

        }
        catch { }
    }

    private string GridViewToHtml(GridView gv)  //用gridmail產生html
    {
        this.GridView1.Columns[1].Visible = false;
        StringBuilder sb = new StringBuilder();
        StringWriter sw = new StringWriter(sb);
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        gv.RenderControl(hw);
        return sb.ToString();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

        // •因會產生例外詳細資訊: System.Web.HttpException: 型別 'GridView' 的控制項 'GridView1' 必須置於有 runat=server 的表單標記之中。
        //所以必須在程式碼中覆寫VerifyRenderingInServerForm這個方法。


    }

    #region 將ERP的TXT檔案上傳
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
    #endregion

    private void uploadERP2()
    {

        int i = 0;
        #region 完成審核寄txt給ERP    

        FileStream fs = new FileStream(@"D:\CIMI100_XML\4GL\" + this.FIELD_plantid.Text.ToString().Trim() + "_-CIMI012_" + this.FIELD_NO.Text.Trim() + ".txt", FileMode.Create, FileAccess.Write);
        StreamWriter sw = new StreamWriter(fs, Encoding.Default);
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //如為'T','G','K','H', 料號=技術產品
        rs.Open("SELECT partno,tc_imi02,tc_imi021,tc_imi03,tc_imi031" +
            "   FROM [EIPB].[dbo].[cimi100_turn] where no='" + this.FIELD_NO.Text.ToString().Trim() + "'" +
            "  and (tc_imi02!='' or  tc_imi021!='' or tc_imi03!='' )");
        while (!rs.EOF)
        {
            i++;
            //String[] s = rs["p_plantid"].ToString().Split(',');
            //foreach (string bb in s)
            //{

                //string plantsn = bb.Replace("@", "").ToString();
                //if (bb.ToString().Trim() == "MINAIK") group_code = rs["partno"].ToString().Substring(0, 1);  //MAT永遠代料件第一碼,子廠代分群碼
                //if (bb.ToString().Trim() == "MINAIK" && (rs["partno"].ToString().Substring(0, 1) == "C" || rs["partno"].ToString().Substring(0, 1) == "S")) source_code = "P";  //20130703  MAT C or S料號開頭 皆為採購料件
                sw.WriteLine("\"" + this.FIELD_plantid.Text.ToString().Trim() + "\",\"" + rs["partno"].ToString() + "\",\"" + rs["tc_imi02"].ToString() + "\",\"" + rs["tc_imi021"].ToString() + "\",\"" +
                            rs["tc_imi03"].ToString() + "\"");

            //}

            rs.MoveNext();
        }
        rs.Close();

        sw.Close();
        fs.Close();

        if (i > 0) Upload("D:\\CIMI100_XML\\4GL\\" + this.FIELD_plantid.Text.ToString().Trim() + "_-CIMI012_" + this.FIELD_NO.Text + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString().Trim() + "_-CIMI012_" + this.FIELD_NO.Text + ".txt", "4gl", "4gl");





        #endregion
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        
        if (class_no.ToString().Trim() == "2")  //拋轉
                {
                    FileStream fs = new FileStream(@"D:\CIMI100_XML\4GL\" + this.FIELD_plantid.Text.ToString().Trim() + "_T-CIMI100_" + this.FIELD_NO.Text + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs, Encoding.Default);
                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs.Open("SELECT   CASE  WHEN turn_plantid ='' THEN turn_plantid   ELSE  SUBSTRING(REPLACE(turn_plantid,'@', ','), 0, LEN(turn_plantid)) END  turn_plantid , " +
                            "partno,replace(replace(replace(replace(component,'\"','~'),'＂','~'),'''','~'),'&','~')  component," +
                            " replace(replace(replace(replace(dwg,'\"','~'),'＂','~'),'''','~'),'&','~')  dwg FROM " + db1 + "cimi100_turn where no='" + this.FIELD_NO.Text.Trim() + "' order by item");
                    while (!rs.EOF)
                    {

                        String[] s = rs["turn_plantid"].ToString().Split(',');
                        foreach (string bb in s)
                        {
                            sw.WriteLine("\"" + bb.ToString() + "\",\"CIMI100\",\"" + rs["partno"].ToString() + "\",\"" + rs["Component"].ToString() + "\",\"" + rs["dwg"].ToString() + "\"");

                        }

                        rs.MoveNext();
                    }
                    rs.Close();

                    sw.Close();
                    fs.Close();
                    Upload("D:\\CIMI100_XML\\4GL\\" + this.FIELD_plantid.Text.ToString().Trim() + "_T-CIMI100_" + this.FIELD_NO.Text + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString().Trim() + "_T-CIMI100_" + this.FIELD_NO.Text + ".txt", "4gl", "4gl");





                }
                else                              //變更
                {
              
                    FileStream fs = new FileStream(@"D:\CIMI100_XML\4GL\" + this.FIELD_plantid.Text.ToString().Trim() + "_M-CIMI100_" + this.FIELD_NO.Text + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs, Encoding.Default);
                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs.Open("SELECT   CASE  WHEN turn_plantid ='' THEN turn_plantid   ELSE  SUBSTRING(REPLACE(turn_plantid,'@', ','), 0, LEN(turn_plantid)) END  turn_plantid , " +
                            "partno,replace(replace(replace(replace(component,'\"','~'),'＂','~'),'''','~'),'&','~') component"+
                            " , replace(replace(replace(replace(dwg,'\"','~'),'＂','~'),'''','~'),'&','~') dwg FROM " + db1 + "cimi100_turn where no='" + this.FIELD_NO.Text.Trim() + "' order by item");
                    while (!rs.EOF)
                    {
                        string plantid = this.FIELD_plantid.Text.Trim();
                        if (this.FIELD_plantid.Text.Trim() == "MAT") plantid = "MINAIK";
                        sw.WriteLine("\"" + plantid.ToString() + "\",\"CIMI100\",\"" + rs["partno"].ToString() + "\",\"" + rs["Component"].ToString() + "\",\"" + rs["dwg"].ToString() + "\"");
                        rs.MoveNext();
                    }
                    rs.Close();

                    sw.Close();
                    fs.Close();
                    Upload("D:\\CIMI100_XML\\4GL\\" + this.FIELD_plantid.Text.ToString().Trim() + "_M-CIMI100_" + this.FIELD_NO.Text + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString().Trim() + "_M-CIMI100_" + this.FIELD_NO.Text + ".txt", "4gl", "4gl");

                    //
                    uploadERP2();

                } 
    }
        
}
}