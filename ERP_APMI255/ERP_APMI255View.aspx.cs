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
using System.IO;
using System.Net;

namespace ERP_APMI255
{
public partial class ERP_APMI255View : SmoothEnterprise.Web.Page
{
    private string db = "[EIPB].[dbo]."; //db位置(apmi255皆放在EIPB的資料夾
    private string pmr05 = "A";   //是否分量計價
    private bool _NotifyReview = false;
	protected void Page_Load(object sender, System.EventArgs e)
	{
        if (!this.IsPostBack)
        {
            try
            {

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT * FROM " + db + "APMI255_IN_HEAD WHERE id='" + Request.QueryString["id"] + "' ");
                if (!rs.EOF)
                {

                    this.FIELD_no.Text = rs["no"].ToString();
                    this.FIELD_plantid.Text = rs["plantid"].ToString();
                    this.FIELD_CompanyName.Text = rs["CompanyName"].ToString();
                    this.FIELD_pmi01.Text = rs["pmi01"].ToString();
                    this.FIELD_pmi02.Text = rs["pmi02"].ToString();
                    this.FIELD_pmi03.Text = rs["pmi03"].ToString();
                    this.FIELD_pmc03_0.Text = rs["pmc03_0"].ToString();
                    this.FIELD_pmi04.Text = rs["pmi04"].ToString();
                    this.FIELD_pmi05.Text = rs["pmi05"].ToString();
                    pmr05 = rs["pmi05"].ToString();
                    this.FIELD_pmi08.Text = rs["pmi08"].ToString();
                    this.FIELD_pmi081.Text = rs["pmi081"].ToString();
                    this.FIELD_pmiuser.Text = rs["pmiuser"].ToString();
                    this.FIELD_gen02_1.Text = rs["gen02_1"].ToString();
                    this.FIELD_pmigrup.Text = rs["pmigrup"].ToString();
                    this.FIELD_gem02_2.Text = rs["gem02_2"].ToString();
                    this.FIELD_flowstatus.Text = rs["ta_pmi01"].ToString();
                    this.FIELD_rember.Text = rs["rember"].ToString();
                    //InputText1.Text = rs["status"].ToString();
                    switch (rs["status"].ToString())
                    {
                        case "N":
                            InputText1.Text = "未送審";

                            break;

                        case "Y":
                            InputText1.Text = "送審中";
                            break;

                        case "OK":
                            InputText1.Text = "完成審核";
                            break;

                        //case "ERP":
                        //    InputText1.Text = "送回ERP修改";
                        //    break;

                        case "NO":
                            InputText1.Text = "退回單據至ERP修改";
                            break;

                        case "V":
                            InputText1.Text = "作廢";
                            break;

                        default:
                            InputText1.Text = "未送審";
                            break;

                    }
                    //SqlDataSource1.SelectCommand = "select CASE   WHEN pmj06>pmj07 THEN 'tee2'  ELSE 'aaa'  END img,bno,pmj02,pmj03,pmj031,pmj032,pmj04,pmj05,pmj06,pmj06t,pmj07,pmj07t,pmj08,  " +
                    //                            "CONVERT(varchar(12) , pmj09, 111 ) pmj09,pmj10,CONVERT(varchar(12) , ta_pmj01, 111 ) ta_pmj01, " +
                    //                            "ima491,ima51,pmr03,pmr04,pmr05,pmr05t from " + db + "apmi255_in_body left join " + db + "apmi255_in_pmr " +
                    //                            " on bno=cno and pmj02=pmr02 where bno='" + rs["no"].ToString() + "' order by pmr03,pmj02 "; //改變datalist的sql

                    SqlDataSource1.SelectCommand = "select apmi255_in_head.ID id,case when pmj06>pmj07 then 'aaa.png' else 'bbb.png' end img1,bno,pmj02,pmj03,pmj031,pmj032,pmj04,pmj05,pmj06,pmj06t,pmj07,pmj07t,pmj08,  " +
                                                "  CONVERT(varchar(12) , pmj09, 111 ) pmj09,pmj10,CONVERT(varchar(12) , ta_pmj01, 111 ) ta_pmj01,  " +
                                                "  ima491,ima46,pmr03,pmr04,pmr05,pmr05t from " + db + "apmi255_in_body left join " + db + "apmi255_in_pmr on bno=cno and pmj02=pmr02 " +
                                                "    left join [EIPB].[dbo].apmi255_in_head on no=bno where bno='" + rs["no"].ToString() + "' order by pmr03,CAST(pmj02 AS int)  ";

                    this.GridView1.DataBind();
                    //Response.Write(SqlDataSource1.SelectCommand.ToString());




                }
                else
                {
                    Response.Redirect("ERP_APMI255.aspx");
                }

                //附檔----------------------------------------------------
                int i = 0;
                ContentPlaceHolder cnt;
                cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                CheckBoxList chb = (CheckBoxList)cnt.FindControl("CheckBoxFile");
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs2.Open("SELECT id,FileName FROM axmt610_File WHERE FileKey='" + Request.QueryString["ID"] + "' and usertype='1' ");
                while (!rs2.EOF)
                {
                    chb.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs2["id"].ToString() + "\" target=\"_blank\">" + rs2["FileName"].ToString() + "</a>", rs2["id"].ToString()));
                    rs2.MoveNext();
                }
                rs2.Close();



            }
            catch
            {
                //Response.Redirect("ERP_APMI255.aspx");
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

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (pmr05 == "Y")  //分量計價為Y 隱藏新單價/單價
        {
            e.Row.Cells[10].Visible = false;
            e.Row.Cells[11].Visible = false;
            e.Row.Cells[2].Visible = false;
            e.Row.Cells[1].Visible = false;
        }
        else
        {
            //分量計價為N 隱藏pmr欄位
            e.Row.Cells[16].Visible = false;
            e.Row.Cells[17].Visible = false;
            e.Row.Cells[18].Visible = false;
            e.Row.Cells[19].Visible = false;

        }
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
    
    protected void PRINT_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='JavaScript'>window.print();</script>");

    }
    protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
    {
        _NotifyReview = true;
        e.NextNode = e.FlowNode.DefaultNode();
        e.NextNode.ReviewerURL = "/ERP_APMI255/ERP_APMI255View.aspx";
    }
    protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
    {
        if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete)
        {
            //try
            //{
            string sqlstr = "";
            sqlstr = "SELECT * FROM " + db + "apmi255_in_head where id='" + Request.QueryString["id"] + "'";
            SmoothEnterprise.Database.DataSet ds;
            ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            ds.Open(sqlstr);

            if (!ds.EOF)
            {
                ds["STATUS"] = "OK";
                ds.Update();

                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rss.Open("select senduser bid,email,name from " + db + "apmi255_in_head a  left join dguser b on a.senduser=b.id where a.id='" + Request.QueryString["id"] + "'   ");
                if (!rss.EOF)
                {
                    #region 寄給申請人完成的mail

                    ArrayList email_list = new ArrayList();  //email list
                    email_list.Add(rss["email"].ToString());

                    #endregion

                    #region 寄給通知者

                    SmoothEnterprise.Database.DataSet plant = new SmoothEnterprise.Database.DataSet();
                    object planta = plant.ExecuteScalar("select comid from dguser a left join " + db + "apmi255_in_head b on a.id=b.senduser where b.id='" + Request.QueryString["id"] + "' ");
                    Response.Write("select comid from dguser a left join " + db + "apmi255_in_head b on a.id=b.senduser where b.id='" + Request.QueryString["id"] + "' ");

                    if (this.FIELD_flowstatus.Text.Trim().Substring(0,1) == "0")
                    {
                        switch (planta.ToString().Trim())
                        {
                            case "MAY":
                                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                                rs2.Open("select email from erp_flow a left join dguser b on a.pid=b.id where erp_name='apmi255' and no='MAT_CC' ");
                                while (!rs2.EOF)
                                {
                                    email_list.Add(rs2["email"].ToString());
                                    rs2.MoveNext();
                                }
                                rs2.Close();
                                break;
                            case "MAT":
                                SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                                rs3.Open("select email from erp_flow a left join dguser b on a.pid=b.id where erp_name='apmi255' and no='MAY_CC' ");
                                while (!rs3.EOF)
                                {
                                    email_list.Add(rs3["email"].ToString());
                                    rs3.MoveNext();
                                }
                                rs3.Close();
                                break;

                        }
                    }
                    else
                    {
                        if (planta.ToString().Trim() == "MAT")
                        {
                            //Response.Write("??<br>");
                            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                            rs2.Open("select email from erp_flow a left join dguser b on a.pid=b.id where erp_name='apmi255' and no='MAY_CC' ");
                            while (!rs2.EOF)
                            {
                                email_list.Add(rs2["email"].ToString());
                                rs2.MoveNext();

                              
                            }
                            rs2.Close();

                        }

                    }
                    

                    #endregion

                    #region Send email

                    foreach (string i in email_list)
                    {

                        Response.Write(i);
                        String ques;

                        MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                        MailAddress to = new MailAddress(i);

                        MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                        MailMessage message = new MailMessage(from, to);
                        
                        ques = "您好:" + "<br>" +
                               "<br>" +
                               "ERP採購核價電子簽核系統已完成審核, 詳細資料如下:" + "<br>" +
                               "<br>" +
                               "申請單號 : " + this.FIELD_no.Text + "<br>" +
                               "ERP單號 : " + this.FIELD_pmi01.Text + "<br>" +
                               "申請日期 : " + this.FIELD_pmi02.Text + "<br>" +
                               "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_APMI255/ERP_APMI255View.aspx?id=" + Request.QueryString["id"] + "\" >至ERP採購核價電子簽核系統查看</a>" +
                               "<br>" +
                               "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                               "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                               "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                        message.Subject = "(完成審核)核價單號 - " + this.FIELD_no.Text + " ERP單號-" + this.FIELD_pmi01.Text;

                        message.IsBodyHtml = true;
                        message.Body = ques;

                        SmtpClient client = new SmtpClient("192.168.0.12");
                        client.Credentials = new NetworkCredential("eip", "eip1106"); 

                        client.Send(message);

                    }

                    #endregion


                }

            }

            //傳簽核完成的TXT給ERP
            FileStream fs = new FileStream(@"D:\APMI255_XML\4GL\" + this.FIELD_plantid.Text.ToString() + "_apmi255_" + this.FIELD_pmi01.Text.ToString() + ".txt", FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);
            sw.WriteLine("\"" + this.FIELD_plantid.Text.ToString() + "\",\"apmi255\",\"" + this.FIELD_pmi01.Text.ToString() + "\",\"Y\"");
            sw.Close();
            fs.Close();
            Upload("D:\\APMI255_XML\\4GL\\" + this.FIELD_plantid.Text.ToString() + "_apmi255_" + this.FIELD_pmi01.Text.ToString() + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString() + "_apmi255_" + this.FIELD_pmi01.Text.ToString() + ".txt", "4gl", "4gl");

        }

        if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate ||
        e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Return)
        {
            //try
            //{
            string sqlstr = "";
            sqlstr = "SELECT * FROM " + db + "apmi255_in_head where id='" + Request.QueryString["id"] + "'";
            SmoothEnterprise.Database.DataSet ds;
            ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            ds.Open(sqlstr);

            if (!ds.EOF)
            {
                ds["STATUS"] = "NO";
                ds.Update();

                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rss.Open("select senduser bid,email,name from " + db + "apmi255_in_head a  left join dguser b on a.senduser=b.id where a.id='" + Request.QueryString["id"] + "'   ");
                if (!rss.EOF)
                {
                    #region 寄給申請人退回的mail

                    ArrayList email_list = new ArrayList();  //email list
                    email_list.Add(rss["email"].ToString());

                    #endregion

                    #region Send email

                    foreach (string i in email_list)
                    {


                        String ques;

                        MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                        MailAddress to = new MailAddress(i);

                        MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                        MailMessage message = new MailMessage(from, to);

                        ques = "您好:" + "<br>" +
                               "<br>" +
                               "ERP採購核價電子簽核系統已被退回, 詳細資料如下:" + "<br>" +
                               "<br>" +
                               "申請單號 : " + this.FIELD_no.Text + "<br>" +
                               "ERP單號 : " + this.FIELD_pmi01.Text + "<br>" +
                               "申請日期 : " + this.FIELD_pmi02.Text + "<br>" +
                               "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_APMI255/ERP_APMI255View.aspx?id=" + Request.QueryString["id"] + "\" >至ERP採購核價電子簽核系統查看</a>" +
                               "<br>" +
                               "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                               "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                               "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                        message.Subject = "(退回)核價單號 - " + this.FIELD_no.Text + " ERP單號-" + this.FIELD_pmi01.Text;

                        message.IsBodyHtml = true;
                        message.Body = ques;

                        SmtpClient client = new SmtpClient("192.168.0.12");
                        client.Credentials = new NetworkCredential("eip", "eip1106"); 

                        client.Send(message);

                    }

                    #endregion

                    //傳簽核退回的TXT給ERP
                    FileStream fs = new FileStream(@"D:\APMI255_XML\4GL\" + this.FIELD_plantid.Text.ToString() + "_apmi255_" + this.FIELD_pmi01.Text.ToString() + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs);
                    sw.WriteLine("\"" + this.FIELD_plantid.Text.ToString() + "\",\"apmi255\",\"" + this.FIELD_pmi01.Text.ToString() + "\",\"N\"");
                    sw.Close();
                    fs.Close();
                    Upload("D:\\APMI255_XML\\4GL\\" + this.FIELD_plantid.Text.ToString() + "_apmi255_" + this.FIELD_pmi01.Text.ToString() + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString() + "_apmi255_" + this.FIELD_pmi01.Text.ToString() + ".txt", "4gl", "4gl");

                }

            }


        }
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
                    email_list.Add(rs2["name"].ToString() + '#' + rs2["email"].ToString());
                    rs2.MoveNext();

                }
                rs2.Close();



                #endregion

                SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                object oquick = onum.ExecuteScalar("SELECT quick FROM " + db + "apmi255_in_head where id='" + Request.QueryString["id"] + "' ");


                foreach (string i in email_list)
                {


                    String ques;

                    MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                    MailAddress to = new MailAddress(i.Split('#')[1]);

                    MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                    MailMessage message = new MailMessage(from, to);
                    ques = i.Split('#')[0] + " 您好:" + "<br>" +
                       "<br>" +
                       "ERP採購核價電子簽核申請單現有一筆，正等待您的處理:" + "<br>" +
                       "<br>" +
                       "申請單號 : " + this.FIELD_no.Text + "<br>" +
                       "ERP單號 : " + this.FIELD_pmi01.Text + "<br>" +
                       "申請日期 : " + this.FIELD_pmi02.Text + "<br>" +
                       "申請人員 : " + this.FIELD_gen02_1.Text + "<br>" +
                       "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_APMI255/ERP_APMI255View.aspx?id=" + Request.QueryString["id"] + "\" >至ERP採購核價電子簽核系統檢視並編輯內容</a>" +
                       "<br>" +
                       "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                       "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                       "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                    if (oquick.ToString() == "Y")
                    {
                        message.Subject = "(急件)核價單號 - " + this.FIELD_no.Text + " ERP單號-" + this.FIELD_pmi01.Text + "等待您的處理";
                    }
                    else
                    {
                        message.Subject = "核價單號 - " + this.FIELD_no.Text + " ERP單號-" + this.FIELD_pmi01.Text + "等待您的處理";
                    }
                    message.IsBodyHtml = true;
                    message.Body = ques;

                    SmtpClient client = new SmtpClient("192.168.0.12");
                    client.Credentials = new NetworkCredential("eip", "eip1106"); 

                    client.Send(message);

                }


            }
        }


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