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
using System.Net.Mail;
using System.Net;

namespace ERP_APMI255
{
public partial class ERP_APMI255Edit : SmoothEnterprise.Web.Page
{
    private string db = "[EIPB].[dbo]."; //db位置(apmi255皆放在EIPB的資料夾
    private string quick = "";
    private string pmr05 = "A";   //是否分量計價
    int i = 0;
	protected void Page_Load(object sender, System.EventArgs e)
	{

		try
		{

            BUTTON_save.Attributes.Add("OnClick", "return   j1()"); //如前端javascript檢查有問題,禁止提交頁面
            BUTTON_SendRequest.Attributes.Add("OnClick", "return   j1()"); //如前端javascript檢查有問題,禁止提交頁面
            if (!IsPostBack)
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

 	 	 	 	 	this.FIELD_lsend.Text = rs["lsend"].ToString();
 	 	 	 	 	this.FIELD_mpru.Text = rs["mpru"].ToString();

                        this.FIELD_rember.Text = rs["rember"].ToString();
                        this.FIELD_quick.Text = rs["quick"].ToString().Trim();
                    
                  switch (rs["status"].ToString())
                  {
                      case "N":
                          InputText1.Text = "未送審";
                          this.InputButton1.Enabled = false;
                          
                          break;

                      case "Y":
                          InputText1.Text = "送審中";
                          this.BUTTON_save.Enabled = false;
                          this.BUTTON_SendRequest.Enabled = false;
                          this.BUTTON_ERP.Enabled = false;
                          break;

                      case "OK":
                          InputText1.Text = "完成審核";
                          this.BUTTON_save.Enabled = false;
                          this.BUTTON_ERP.Enabled = false;
                          this.InputButton1.Enabled = false;
                          if (this.CurrentUser.LogonID.ToString() != "ann.lin")
                          this.BUTTON_SendRequest.Visible = false;
                          break;

                      //case "ERP":
                      //    InputText1.Text = "退回ERP修改";
                      //    this.BUTTON_SendRequest.Enabled = false;
                      //    this.BUTTON_save.Enabled = false;
                      //    this.BUTTON_ERP.Enabled = false;
                      //    this.InputButton1.Enabled = false;
                      //    this.BUTTON_SendRequest.Visible = false;
                      //    break;

                      case "NO":
                          InputText1.Text = "退回單據至ERP修改";
                          this.BUTTON_ERP.Enabled = false;
                          this.InputButton1.Enabled = false;
                          this.BUTTON_SendRequest.Visible = false;
                          this.BUTTON_save.Enabled = false;
                          break;

                      case "V":
                          InputText1.Text = "作廢";
                          this.BUTTON_save.Enabled = false;
                          this.BUTTON_SendRequest.Enabled = false;
                          this.BUTTON_ERP.Enabled = false;
                          this.InputButton1.Enabled = false;

                          break;

                      default:
                          InputText1.Text = "未送審";
                          this.InputButton1.Enabled = false;
                          break;

                  }
                  //SqlDataSource1.SelectCommand = "select bno,pmj02,pmj03,pmj031,pmj032,pmj04,pmj05,pmj06,pmj06t,pmj07,pmj07t,pmj08,  "+
                  //                            "CONVERT(varchar(12) , pmj09, 111 ) pmj09,pmj10,CONVERT(varchar(12) , ta_pmj01, 111 ) ta_pmj01, "+
                  //                            "ima491,ima51,pmr03,pmr04,pmr05,pmr05t from " + db + "apmi255_in_body left join " + db + "apmi255_in_pmr " +
                  //                            " on bno=cno and pmj02=pmr02 where bno='" + rs["no"].ToString() + "' order by pmr03,pmj02  "; //改變datalist的sql

                  SqlDataSource1.SelectCommand = "select apmi255_in_head.ID id,case when pmj06>pmj07 then 'aaa.png' else 'bbb.png' end img1,bno,pmj02,pmj03,pmj031,pmj032,pmj04,pmj05,pmj06,pmj06t,pmj07,pmj07t,pmj08,  " +
                                              "  CONVERT(varchar(12) , pmj09, 111 ) pmj09,pmj10,CONVERT(varchar(12) , ta_pmj01, 111 ) ta_pmj01,  "+
                                              "  ima491,ima46,pmr03,pmr04,pmr05,pmr05t from " + db + "apmi255_in_body left join " + db + "apmi255_in_pmr on bno=cno and pmj02=pmr02 " +
                                              "    left join [EIPB].[dbo].apmi255_in_head on no=bno where bno='" + rs["no"].ToString() + "' order by pmr03,CAST(pmj02 AS int)  ";
                  this.GridView1.DataBind();

                  //Response.Write(SqlDataSource1.SelectCommand.ToString());


                  if (this.FIELD_lsend.Text == "")
                  {
                      managerlevel aa = new managerlevel(); //引用managerlevel class
                      this.FIELD_lsend.Text = aa.manager(this.CurrentUser.ID.ToString()).Split('@')[0];
                  }

                  if (rs["status"].ToString() == "N")
                  {
                      this.AddWarning(this, "Page_Load()", "", "請記得將單據送審！");
                      this.AddWarning(this, "Page_Load()", "", "若修改資料，請先按儲存鈕將資料儲存！");
                  }
				}												  
				else
				{
					Response.Redirect("ERP_APMI255.aspx");
				}
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

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
    	}
	}

	protected void BUTTON_save_Click(object sender, System.EventArgs e)
	{

			try
			{
                
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM " + db + "APMI255_IN_HEAD WHERE id='" + Request.QueryString["id"] + "' ");
                if (!rs.EOF)
                {

                    rs["quick"] = this.FIELD_quick.Text;
                    rs["lsend"] = this.FIELD_lsend.Text;

                    if (this.FIELD_pmiuser.Text.Substring(0, 2) == "EF" && this.FIELD_flowstatus.Text.Trim().Substring(0, 1) == "1")  //MAY人員且簽核流程為1  送跨廠即可
                    {
                        SmoothEnterprise.Database.DataSet rsA = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rsA.Open("select * from ERP_FLOW where ERP_NAME='apmi255' and DEP_NAME='PUR' AND NO='MAT審核的採購' AND PID='" + this.FIELD_mpru.Text + "' ");  //確認MAY選的採購是否為MAT人員
                        if (!rsA.EOF)
                        {
                            rs["mpru"] = this.FIELD_mpru.Text;
                            // Response.Write("<script language='JavaScript'>window.alert('請輸入信用額度超限原因及改善方案！');</script>");
                        }
                    }
                    
                    rs["rember"] = this.FIELD_rember.Text;
                    rs.Update();
                }
                rs.Close();

                string FileList = "";
                for (int x = 0; x < this.CheckBoxFile.Items.Count; x++)
                {
                    if (CheckBoxFile.Items[x].Selected == true)
                    {
                        if (FileList == "")
                            FileList = "'" + CheckBoxFile.Items[x].Value + "'";
                        else
                            FileList = FileList + ",'" + CheckBoxFile.Items[x].Value + "'";
                    }
                }
                #region 動態新增
                HttpFileCollection files = HttpContext.Current.Request.Files;
                System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
                //String uPath = "D:/Upload/";
                int att_count = 0;

                //String fpath;
                //fpath = "";


                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs2.Open("SELECT * FROM AXMT610_File WHERE 1=0");

                for (int ifile = 0; ifile < files.Count; ifile++)
                {
                    HttpPostedFile postedfile = files[ifile];
                    string filename, fileExt, filePath;
                    filename = System.IO.Path.GetFileName(postedfile.FileName);    //抓取文件名
                    fileExt = System.IO.Path.GetExtension(postedfile.FileName);    //抓取文件附檔名

                    if (postedfile.ContentLength > 0)
                    {
                        rs2.Add();
                        att_count = att_count + 1;
                        String tafilename = "filename" + att_count.ToString();
                        String taattach = "attachment" + att_count.ToString();
                        String tafilexten = "fileexten" + att_count.ToString();

                        byte[] fileBytes = new byte[postedfile.ContentLength];
                        postedfile.InputStream.Read(fileBytes, 0, postedfile.ContentLength);
                        rs2["UserType"] = "1";    //申請者的附檔為1
                        rs2["FileKey"] = Request.QueryString["id"];
                        rs2["FileName"] = filename;
                        rs2["FileBody"] = fileBytes;
                        rs2["FileType"] = fileExt;
                        rs2.Update();
                    }
                }
                rs2.Close();
                #endregion
                //刪除附檔------------------------------------------------------------------------------------------
                if (FileList != "")
                {
                    string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ToString();
                    SqlConnection Conn = new SqlConnection(ConnStr);
                    Conn.Open();
                    SqlCommand cmd = new SqlCommand("Delete FROM axmt610_File WHERE ID in (" + FileList + ")", Conn);
                    //Response.Write("Delete FROM axmt610_File WHERE ID in (" + FileList + ")");
                    cmd.ExecuteNonQuery();
                    cmd.Cancel();
                    Conn.Close();
                }

                //--------------------------------------------------------------------------------------------------


                ////讓夾附件能顯示------------------------------------------------------------------------------------
                //Response.Write("<script type=\"text/javascript\">");
                //Response.Write("location.href='erp_apmi255Edit.aspx?id=" + Request.QueryString["ID"] + "';");
                //Response.Write("</script>");
                //--------------------------------------------------------------------------------------------------

                Response.Redirect("erp_apmi255Edit.aspx?id=" + Request.QueryString["id"]);
              
			}
			catch (Exception ex)
			{
				this.AddError(this,"BUTTON_save_Click()","",ex.Message);
			}
		
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        Response.Redirect("ERP_APMI255.aspx");
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


    protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {

            SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rb.Open("SELECT * FROM " + db + "apmi255_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
            if (!rb.EOF)
            {
                rb["STATUS"] = "Y";
                rb["senduser"] = this.CurrentUser.ID.ToString();
                rb.Update();

            }
            rb.Close();

            this.BUTTON_SendRequest.Flow = this.FlowClient1;
            managerlevel aa = new managerlevel(); //引用managerlevel class
            ArrayList all = new ArrayList();  //all arraylist
            ArrayList managerid = new ArrayList();  //主管id arraylist
            ArrayList managerlv = new ArrayList();  //主管階級 arraylist
            ArrayList managernm = new ArrayList();  //主管職稱 arraylist



            managerid.Add(this.FIELD_lsend.Text);
            managernm.Add("直屬主管");

            if (this.FIELD_lsend.Text != aa.manager(this.CurrentUser.ID.ToString()).Split('@')[0])
            {
                managerid.Add(aa.manager(this.CurrentUser.ID.ToString()).Split('@')[0]);
                managernm.Add("直屬主管");

            }



            if (this.FIELD_pmiuser.Text.Substring(0, 2) == "EF" && this.FIELD_flowstatus.Text.Trim().Substring(0, 1) == "1")  //MAY人員且簽核流程為1  送跨廠即可
            {
                SmoothEnterprise.Database.DataSet rsA = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rsA.Open("select * from ERP_FLOW where ERP_NAME='apmi255' and DEP_NAME='PUR' AND NO='MAT審核的採購' AND PID='" + this.FIELD_mpru.Text + "' ");  //確認MAY選的採購是否為MAT人員
                if (!rsA.EOF)
                {
                    managerid.Add(this.FIELD_mpru.Text);
                    managernm.Add("跨廠採購人員");
                }
                else
                {
                    managerid.Add("43AB27FF-E6C8-4A46-83AA-AB4590F252D3");
                    managernm.Add("跨廠採購人員");
                }
            }


            sharflow12.Flowwork.sharflow121 flow = new sharflow12.Flowwork.sharflow121();
            FlowClient1.Text = "採購核價單電子簽核 ERP單號:" + this.FIELD_pmi01.Text.ToString();  //更改流程名稱
            switch (managerid.Count)  //依舊arraylist裡面有幾個,來判斷走那條flow
            {

                case 1:
                    e.NextNode = flow.sharflow12Node1;
                    break;

                case 2:
                    e.NextNode = flow.sharflow12Node2;
                    break;

                case 3:
                    e.NextNode = flow.sharflow12Node4;
                    break;

                case 4:
                    e.NextNode = flow.sharflow12Node7;
                    break;

                case 5:
                    e.NextNode = flow.sharflow12Node11;
                    break;

                case 6:
                    e.NextNode = flow.sharflow12Node16;
                    break;

                case 7:
                    e.NextNode = flow.sharflow12Node22;
                    break;

                case 8:
                    e.NextNode = flow.sharflow12Node29;
                    break;

                case 9:
                    e.NextNode = flow.sharflow12Node37;
                    break;

                case 10:
                    e.NextNode = flow.sharflow12Node46;
                    break;

                case 11:
                    e.NextNode = flow.sharflow12Node56;
                    break;

                case 12:
                    e.NextNode = flow.sharflow12Node67;
                    break;
            }
            e.NextNode.ReviewerURL = "/ERP_APMI255/ERP_APMI255VIEW.aspx";

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

            SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rss.Open("select id bid,name,email from dguser where id = '" + this.FIELD_lsend.Text + "' ");
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

                    if (this.FIELD_quick.Text.Trim() == "Y")
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
                    client.Credentials=new NetworkCredential("eip", "eip1106"); 
                    client.Send(message);

                }

            }

            //讓更新能顯示------------------------------------------------------------------------------------
            Response.Write("<script type=\"text/javascript\">");
            Response.Write("location.href='erp_apmi255Edit.aspx?id=" + Request.QueryString["ID"] + "';");
            Response.Write("</script>");
            //-------------------------------------------------------------------------------------------------
        
    }
    protected void BUTTON_StopRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {
        SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rb.Open("SELECT * FROM " + db + "apmi255_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
        if (!rb.EOF)
        {
            rb["STATUS"] = "N";
            rb.Update();

        }
        rb.Close();

        //讓更新能顯示------------------------------------------------------------------------------------
        Response.Write("<script type=\"text/javascript\">");
        Response.Write("location.href='erp_apmi255Edit.aspx?id=" + Request.QueryString["ID"] + "';");
        Response.Write("</script>");
        //-------------------------------------------------------------------------------------------------

    }
    protected void BUTTON_ERP_Click(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rb.Open("SELECT * FROM " + db + "apmi255_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
        if (!rb.EOF)
        {
            rb["STATUS"] = "NO";//退回ERP修改
            rb.Update();

        }
        rb.Close();

        //傳簽核退回的TXT給ERP
        FileStream fs = new FileStream(@"D:\APMI255_XML\4GL\" + this.FIELD_plantid.Text.ToString() + "_apmi255_" + this.FIELD_pmi01.Text.ToString() + ".txt", FileMode.Create, FileAccess.Write);
        StreamWriter sw = new StreamWriter(fs);
        sw.WriteLine("\"" + this.FIELD_plantid.Text.ToString() + "\",\"apmi255\",\"" + this.FIELD_pmi01.Text.ToString() + "\",\"N\"");
        sw.Close();
        fs.Close();
        Upload("D:\\APMI255_XML\\4GL\\" + this.FIELD_plantid.Text.ToString() + "_apmi255_" + this.FIELD_pmi01.Text.ToString() + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString() + "_apmi255_" + this.FIELD_pmi01.Text.ToString() + ".txt", "4gl", "4gl");

        //讓夾附件能顯示------------------------------------------------------------------------------------
        Response.Write("<script type=\"text/javascript\">");
        Response.Write("location.href='erp_apmi255Edit.aspx?id=" + Request.QueryString["ID"] + "';");
        Response.Write("</script>");
        //--------------------------------------------------------------------------------------------------

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
    protected void InputButton1_Click(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rss.Open("select a.*, b.name name, b.email email,c.no no,b.id bid from dgflowqueue a left join dguser b on a.revieweruid = b.id " +
                "left join " + db + "APMI255_IN_head c on c.id= '" + Request.QueryString["id"] + "' " +
                "where requesturl = '/ERP_APMI255/ERP_APMI255edit.aspx?id=" + Request.QueryString["id"] + "' and revieweruid <> " +
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


                message.Subject = "提醒您核價單號 - " + this.FIELD_no.Text + " ERP單號-" + this.FIELD_pmi01.Text + "等待您的處理";

                message.IsBodyHtml = true;
                message.Body = ques;

                SmtpClient client = new SmtpClient("192.168.0.12");
                client.Credentials = new NetworkCredential("eip", "eip1106"); 
                client.Send(message);

            }


        }

    }


   



}
}