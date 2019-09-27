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
using SmoothEnterprise.Flowwork.Control;
using System.Data.SqlClient;
using System.Net.Mail;
using System.IO;
using System.Net;

namespace ERP_AXMT610
{
public partial class AXMT610View : SmoothEnterprise.Web.Page
{
    private bool _NotifyReview = false;
    private string quick = "";
	protected void Page_Load(object sender, System.EventArgs e)
	{
        //超限原因的下拉選單---------------------------------------------------------------------------
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
        //this.FIELD_reason_user.Items.Add("請選擇...", "");
        this.FIELD_reason_sales.Items.Add("請選擇...", "");
        ds.Open("SELECT REASON,id FROM axmt610_REASON where type='reason' ORDER BY id");
        while (!ds.EOF)
        {
            //this.FIELD_reason_user.Items.Add(ds["REASON"].ToString(), ds["REASON"].ToString());
            this.FIELD_reason_sales.Items.Add(ds["REASON"].ToString(), ds["REASON"].ToString());
            ds.MoveNext();
        }
        //-----------------------------------------------------------------------------------------------
        //改善方案的下拉選單---------------------------------------------------------------------------
        SmoothEnterprise.Database.DataSet ds2 = new SmoothEnterprise.Database.DataSet();
        //this.FIELD_Improve_user.Items.Add("請選擇...", "");
        this.FIELD_Improve_sales.Items.Add("請選擇...", "");
        ds2.Open("SELECT REASON,id FROM axmt610_REASON where type='Improve' ORDER BY id");
        while (!ds2.EOF)
        {
            //this.FIELD_Improve_user.Items.Add(ds2["REASON"].ToString(), ds2["REASON"].ToString());
            this.FIELD_Improve_sales.Items.Add(ds2["REASON"].ToString(), ds2["REASON"].ToString());
            ds2.MoveNext();
        }
        //-----------------------------------------------------------------------------------------------
        //try
        //{
            if (!this.IsPostBack)
            {

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT * FROM AXMT610_IN_HEAD WHERE id='" + Request.QueryString["id"] + "' ");
                if (!rs.EOF)
                {
                    this.FIELD_no.Text = rs["no"].ToString();
                    this.FIELD_no_order.Text = rs["no_order"].ToString();
                    this.FIELD_plantid.Text = rs["plantid"].ToString();
                    this.FIELD_companyname.Text = rs["companyname"].ToString();
                    //this.FIELD_programid.Text = rs["programid"].ToString();
                    this.FIELD_oga00.Text = rs["oga00"].ToString();
                    this.FIELD_oga01.Text = rs["oga01"].ToString();
                    this.FIELD_oga02.Text = rs["oga02"].ToString();
                    //this.FIELD_oga011.Text = rs["oga011"].ToString();
                    this.FIELD_oga16.Text = rs["oga16"].ToString();
                    this.FIELD_oga03.Text = rs["oga03"].ToString();
                    this.FIELD_occ02_0.Text = rs["occ02_0"].ToString();
                    this.FIELD_oga04.Text = rs["oga04"].ToString();
                    this.FIELD_occ02_1.Text = rs["occ02_1"].ToString();
                    this.FIELD_addr.Text = rs["addr"].ToString();
                    this.FIELD_oga18.Text = rs["oga18"].ToString();
                    this.FIELD_occ02_2.Text = rs["occ02_2"].ToString();
                    this.FIELD_oga15.Text = rs["oga15"].ToString();
                    this.FIELD_gem02_3.Text = rs["gem02_3"].ToString();
                    this.FIELD_oga14.Text = rs["oga14"].ToString();
                    this.FIELD_gen02_4.Text = rs["gen02_4"].ToString();
                    this.FIELD_oga902.Text = rs["oga902"].ToString();
                    this.FIELD_oga21.Text = rs["oga21"].ToString();
                    this.FIELD_oga211.Text = rs["oga211"].ToString();
                    this.FIELD_oga23.Text = rs["oga23"].ToString();
                    this.FIELD_oga24.Text = rs["oga24"].ToString();
                    this.FIELD_oga27.Text = rs["oga27"].ToString();
                    this.FIELD_oga50.Text = double.Parse(rs["oga50"].ToString()).ToString("N");
                    this.FIELD_curr.Text = rs["curr"].ToString();
                    this.FIELD_tot.Text = double.Parse(rs["tot"].ToString()).ToString("N");
                    this.FIELD_bal.Text = double.Parse(rs["bal"].ToString()).ToString("N");
                    this.FIELD_l_amt01.Text = double.Parse(rs["l_amt01"].ToString()).ToString("N");
                    this.FIELD_l_amt02.Text = double.Parse(rs["l_amt02"].ToString()).ToString("N");
                    this.FIELD_l_amt03.Text = double.Parse(rs["l_amt03"].ToString()).ToString("N");
                    //this.FIELD_Sales.Text = rs["sales"].ToString();
                    //this.FIELD_Lsend.Text = rs["lsend"].ToString();
                    quick = rs["quick"].ToString();
                    if (rs["status"].ToString() == "Y")
                    {
                        this.FIELD_status.Text = "送審中";
                    }
                    else
                    {
                        this.FIELD_status.Text = rs["status"].ToString();
                    }
                    this.FIELD_programid.Text = rs["programid"].ToString();
                    this.FIELD_Annotate_user.Text = rs["Annotate_user"].ToString();
                    this.FIELD_Annotate_sales.Text = rs["Annotate_salse"].ToString();

                    #region user
                    //SmoothEnterprise.Database.DataSet dss = new SmoothEnterprise.Database.DataSet();
                    //dss.Open("SELECT REASON,id FROM axmt610_REASON where reason='" + rs["reason_user"].ToString() + "' and type='reason' ");
                    //if (!dss.EOF)
                    //{
                    //    this.RadioSe1.Checked = true;
                    //    this.RadioSe2.Checked = false;
                    //    this.FIELD_reason_user.Value = rs["reason_user"].ToString();
                    //}
                    //else
                    //{
                    //    this.RadioSe1.Checked = false;
                    //    this.RadioSe2.Checked = true;
                    //    this.FIELD_reason_user2.Text = rs["reason_user"].ToString();
                    //}
                    //SmoothEnterprise.Database.DataSet dss2 = new SmoothEnterprise.Database.DataSet();
                    //dss2.Open("SELECT REASON,id FROM axmt610_REASON where reason='" + rs["improve_user"].ToString() + "' and type='improve' ");
                    //if (!dss2.EOF)
                    //{
                    //    this.RadioButton1.Checked = true;
                    //    this.RadioButton2.Checked = false;
                    //    this.FIELD_Improve_user.Value = rs["improve_user"].ToString();
                    //}
                    //else
                    //{
                    //    this.RadioButton1.Checked = false;
                    //    this.RadioButton2.Checked = true;
                    //    this.FIELD_Improve_user2.Text = rs["improve_user"].ToString();
                    //}
                    this.FIELD_reason_user2.Text = rs["reason_user"].ToString();
                    this.FIELD_Improve_user2.Text = rs["improve_user"].ToString();
                    if (rs["FlowRoute"].ToString() != "-1" && rs["FlowRoute"].ToString() != "")
                    {
                        Response.Write("<script type=\"text/javascript\">" + Environment.NewLine);
                        Response.Write("window.onload = function() {" + Environment.NewLine);
                        Response.Write("if (document.getElementById(\"8cdc67b5-baab-4d46-a25a-5f0c13f38308\") != null)" + Environment.NewLine);
                        Response.Write("{" + Environment.NewLine);
                        Response.Write("document.getElementById(\"8cdc67b5-baab-4d46-a25a-5f0c13f38308\").selectedIndex =" + rs["FlowRoute"].ToString() + ";" + Environment.NewLine);
                        Response.Write("__doPostBack('ctl00$ContentPlaceHolder1$FlowFeedbackViewer1','node')" + Environment.NewLine);
                        Response.Write("}" + Environment.NewLine);
                        Response.Write("}" + Environment.NewLine);
                        Response.Write("</script>" + Environment.NewLine);
                    }

                    //附檔----------------------------------------------------
                    int i = 0;
                    ContentPlaceHolder cnt;
                    cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                    CheckBoxList chb = (CheckBoxList)cnt.FindControl("CheckBoxFile");
                    SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs2.Open("SELECT id,FileName FROM axmt610_File WHERE FileKey='" + Request.QueryString["ID"] + "' and usertype='1'");
                    while (!rs2.EOF)
                    {
                        chb.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs2["id"].ToString() + "\" target=\"_blank\">" + rs2["FileName"].ToString() + "</a>", rs2["id"].ToString()));
                        rs2.MoveNext();
                    }
                    rs2.Close();


                    //--------------------------------------------------------

                # endregion

                    #region sales

                    SmoothEnterprise.Database.DataSet ess = new SmoothEnterprise.Database.DataSet();
                    ess.Open("SELECT REASON,id FROM axmt610_REASON where reason='" + rs["Reason_salse"].ToString() + "' and type='reason' ");
                    if (!ess.EOF)
                    {
                        this.RadioButton3.Checked = true;
                        this.RadioButton4.Checked = false;
                        this.FIELD_reason_sales.Value = rs["Reason_salse"].ToString();
                    }
                    else
                    {
                        this.RadioButton3.Checked = false;
                        this.RadioButton4.Checked = true;
                        this.FIELD_reason_sales2.Text = rs["Reason_salse"].ToString();
                    }
                    SmoothEnterprise.Database.DataSet ess2 = new SmoothEnterprise.Database.DataSet();
                    ess2.Open("SELECT REASON,id FROM axmt610_REASON where reason='" + rs["Improve_salse"].ToString() + "' and type='improve' ");
                    if (!ess2.EOF)
                    {
                        this.RadioButton5.Checked = true;
                        this.RadioButton6.Checked = false;
                        this.FIELD_Improve_sales.Value = rs["Improve_salse"].ToString();
                    }
                    else
                    {
                        this.RadioButton5.Checked = false;
                        this.RadioButton6.Checked = true;
                        this.FIELD_Improve_sales2.Text = rs["Improve_salse"].ToString();
                    }


                    //附檔----------------------------------------------------
                    int ei = 0;
                    ContentPlaceHolder ecnt;
                    ecnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                    CheckBoxList echb = (CheckBoxList)ecnt.FindControl("CheckBoxFile1");
                    SmoothEnterprise.Database.DataSet ers2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    ers2.Open("SELECT id,FileName FROM axmt610_File WHERE FileKey='" + Request.QueryString["ID"] + "' and usertype='2'");
                    while (!ers2.EOF)
                    {
                        echb.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + ers2["id"].ToString() + "\" target=\"_blank\">" + ers2["FileName"].ToString() + "</a>", ers2["id"].ToString()));
                        ers2.MoveNext();
                    }
                    ers2.Close();


                    //--------------------------------------------------------

                    #endregion

                    if (Utility.MIS_Manager(CurrentUser.LogonID))
                    {
                        btn_export.Visible = true;

                    }

                }
                else
                {
                    Response.Redirect("AXMT610.aspx");
                }

                SqlDataSource1.SelectCommand = "select b.plantid plantid,bno,ogb31,ogb32,ogb04,ogb06,ima021,ogb05,ogb12 from AXMT610_IN_HEAD a left join AXMT610_IN_BODY b on a.plantid=b.plantid and a.no=b.bno where a.id='" + Request.QueryString["id"] + "'";

                //Response.Write("select b.plantid plantid,bno,ogb31,ogb32,ogb04,ogb06,ima021,ogb05,ogb12 from AXMT610_IN_HEAD a left join AXMT610_IN_BODY b on a.plantid=b.plantid and a.no=b.bno where a.id='" + Request.QueryString["id"] + "'");
                this.GridView1.DataBind();

                //if (Request.QueryString["a"] != "1") //如果從放大鏡來不跳
                //{
                ////有審核過跳出
                //GetCheck TempFunction = new GetCheck();
                //TempFunction.ShowEmg(this.CurrentUser.ID.Replace("{", "").Replace("}", ""), Request.QueryString["ID"]);
                //}
            }
        //}
        //catch
        //{
        //    Response.Redirect("AXMT610.aspx");
        //}

        bool un = checkuser();

        if (un == true)
        {
            this.CheckBoxFile1.Visible = true;
            this.InputFile1.Visible = true;
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

                 SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                 rss.Open("SELECT * FROM AXMT610_IN_HEAD WHERE id='" + Request.QueryString["id"] + "' ");
                 if (!rss.EOF)
                 {
                     rss["Annotate_salse"] = this.FIELD_Annotate_sales.Text;
                     if (this.RadioButton3.Checked)
                     {
                         rss["Reason_salse"] = this.FIELD_reason_sales.Value;
                     }
                     else
                     {
                         rss["Reason_salse"] = this.FIELD_reason_sales2.Text;
                     }
                     if (this.RadioButton5.Checked)
                     {
                         rss["Improve_salse"] = this.FIELD_Improve_sales.Value;
                     }
                     else
                     {
                         rss["Improve_salse"] = this.FIELD_Improve_sales2.Text;
                     }
                     rss.Update();
                 }
                 rss.Close();



                 string FileList = "";
                 for (int x = 0; x < this.CheckBoxFile1.Items.Count; x++)
                 {
                     if (CheckBoxFile1.Items[x].Selected == true)
                     {
                         if (FileList == "")
                             FileList = "'" + CheckBoxFile1.Items[x].Value + "'";
                         else
                             FileList = FileList + ",'" + CheckBoxFile1.Items[x].Value + "'";
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
                         rs2["UserType"] = "2";    //目的廠業務的附檔為2
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
                 //Response.Redirect("AXMT610View.aspx?id=" + Request.QueryString["id"]); //使附檔跑出來
                 //--------------------------------------------------------------------------------------------------

                 this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
                "RedirectAfterCommit",
                "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");

             }
             else
             {

                 this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
                "RedirectAfterCommit",
                "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");


             }

            //---------------------------------------------------------------


        }
        catch { }
    }
    protected void FlowFeedback1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
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
    protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
    {
        _NotifyReview = true;
        string FlowRoute = "-1";

        AXMT610_2.Flowwork.AXMT610_21 f = new AXMT610_2.Flowwork.AXMT610_21();
        //AXMT610_1.Flowwork.Flow1 f = new AXMT610_1.Flowwork.Flow1();
        if (e.FlowNode.ToString() == f.AXMT610_2Node1.ToString())

        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {
                SmoothEnterprise.Database.DataSet ds3;
                ds3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                ds3.Open("SELECT * FROM AXMT610_IN_HEAD WHERE id='" + Request.QueryString["ID"] + "'");
                if (!ds3.EOF)
                {
                    FlowRoute = ds3["FlowRoute"].ToString();

                }
                    if (FlowRoute == "0")
                        e.NextNode = f.AXMT610_2Node1.AXMT610_2Node11;

                    if (FlowRoute == "1")
                        e.NextNode = f.AXMT610_2Node1.AXMT610_2Node16;

                    if (FlowRoute == "2")
                        e.NextNode = f.AXMT610_2Node1.AXMT610_2Node2;

                    if (FlowRoute == "3")
                        e.NextNode = f.AXMT610_2Node1.AXMT610_2Node22;

                    if (FlowRoute == "4")
                        e.NextNode = f.AXMT610_2Node1.AXMT610_2Node29;

                    if (FlowRoute == "5")
                        e.NextNode = f.AXMT610_2Node1.AXMT610_2Node4;

                    if (FlowRoute == "6")
                        e.NextNode = f.AXMT610_2Node1.AXMT610_2Node7;

                    sendmail(e.Parameters["USER1"].ToString());  //發給下一關審核人mail
                
            }
        }
        if (e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node2.ToString() || e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node4.ToString() ||
            e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node7.ToString() || e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node11.ToString() ||
            e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node16.ToString() || e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node22.ToString() || 
            e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node29.ToString())
        {
             if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {
                sendmail(e.Parameters["USER2"].ToString());  //發給下一關審核人mail
             }
        }

        if ( e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node4.AXMT610_2Node5.ToString() ||
            e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node7.AXMT610_2Node8.ToString() ||
            e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node11.AXMT610_2Node12.ToString() ||
            e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node16.AXMT610_2Node17.ToString() ||
            e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node22.AXMT610_2Node23.ToString() ||
            e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node29.AXMT610_2Node30.ToString())
        {
             if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {
                sendmail(e.Parameters["USER3"].ToString());  //發給下一關審核人mail
             }
        }

        if (e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node7.AXMT610_2Node8.AXMT610_2Node9.ToString() ||
           e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node11.AXMT610_2Node12.AXMT610_2Node13.ToString() ||
           e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node16.AXMT610_2Node17.AXMT610_2Node18.ToString() ||
           e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node22.AXMT610_2Node23.AXMT610_2Node24.ToString() ||
           e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node29.AXMT610_2Node30.AXMT610_2Node31.ToString())
        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {
                sendmail(e.Parameters["USER4"].ToString());  //發給下一關審核人mail
            }

        }

        if (e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node11.AXMT610_2Node12.AXMT610_2Node13.AXMT610_2Node14.ToString()||
            e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node16.AXMT610_2Node17.AXMT610_2Node18.AXMT610_2Node19.ToString()||
            e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node22.AXMT610_2Node23.AXMT610_2Node24.AXMT610_2Node25.ToString()||
            e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node29.AXMT610_2Node30.AXMT610_2Node31.AXMT610_2Node32.ToString())
        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {
                sendmail(e.Parameters["USER5"].ToString());  //發給下一關審核人mail
            }

        }

        if (e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node16.AXMT610_2Node17.AXMT610_2Node18.AXMT610_2Node19.AXMT610_2Node20.ToString()||
            e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node22.AXMT610_2Node23.AXMT610_2Node24.AXMT610_2Node25.AXMT610_2Node26.ToString()||
            e.FlowNode.ToString() ==f.AXMT610_2Node1.AXMT610_2Node29.AXMT610_2Node30.AXMT610_2Node31.AXMT610_2Node32.AXMT610_2Node33.ToString())
        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {
                sendmail(e.Parameters["USER6"].ToString());  //發給下一關審核人mail
            }

        }

        if (e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node22.AXMT610_2Node23.AXMT610_2Node24.AXMT610_2Node25.AXMT610_2Node26.AXMT610_2Node27.ToString() ||
            e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node29.AXMT610_2Node30.AXMT610_2Node31.AXMT610_2Node32.AXMT610_2Node33.AXMT610_2Node34.ToString())
        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {
                sendmail(e.Parameters["USER7"].ToString());  //發給下一關審核人mail
            }

        }

        if (e.FlowNode.ToString() == f.AXMT610_2Node1.AXMT610_2Node29.AXMT610_2Node30.AXMT610_2Node31.AXMT610_2Node32.AXMT610_2Node33.AXMT610_2Node34.AXMT610_2Node35.ToString())
        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {
                sendmail(e.Parameters["USER8"].ToString());  //發給下一關審核人mail
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

    private bool checkuser()
    {
        //顯示 使用者等級 --------------------------------
        //只有sales更新
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        ds.Open("SELECT sales FROM AXMT610_IN_HEAD WHERE id='" + Request.QueryString["id"] + "' ");
        bool un = false;


        if (!ds.EOF)
        {
            if (this.CurrentUser.ID.ToString().Replace("{", "").Replace("}", "").ToLower() == ds["sales"].ToString().Replace("{", "").Replace("}", "").ToLower())
            {
                un = true;
                return un;
            }
            else
            {
                return un;

            }


        }
        else
        {
            return un;
        }

        ds.Close();
        //-----------------------------------------------
    }

    protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
    {
        if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete)
        {
            //審核通過要執行的程式碼
            try
            {
                string sqlstra = "";
                sqlstra = "SELECT * FROM axmt610_IN_HEAD where id='" + Request.QueryString["id"] + "'";
                SmoothEnterprise.Database.DataSet dsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                dsa.Open(sqlstra);

                if (!dsa.EOF)
                {
                    //審核通過產生檔案給erp--------------------------------------------------------------------
                    FileStream fs = new FileStream(@"D:\AXMT610_XML\4GL\" + dsa["plantid"].ToString() + "_ovaxmt610_" + dsa["oga01"].ToString() + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs);
                    sw.WriteLine("\"" + dsa["plantid"].ToString() + "\",\"ovaxmt610\",\"" + dsa["oga01"].ToString() + "\",\"Y\"");
                    sw.Close();
                    fs.Close();
                    Upload("D:\\AXMT610_XML\\4GL\\" + dsa["plantid"].ToString() + "_ovaxmt610_" + dsa["oga01"].ToString() + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString() + "_ovaxmt610_" + this.FIELD_oga01.Text.ToString() + ".txt", "4gl", "4gl");

                    //------------------------------------------------------------------------------------------
                }
                string sqlstr = "";
                sqlstr = "SELECT * FROM axmt610_IN_HEAD where id='" + Request.QueryString["id"] + "'";
                SmoothEnterprise.Database.DataSet ds;
                ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                ds.Open(sqlstr);

                if (!ds.EOF)
                {
                    ds["STATUS"] = "完成審核";
                    ds.Update();

                    //寄給多角目的廠業務------------------------------------------
                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                    rss.Open("(SELECT email,name,plantid,oga01,no,occ02_1 FROM  axmt610_in_head a left join dguser b on a.sales=b.id where a.id='" + Request.QueryString["ID"] + "') " +
                             " UNION "+
                             " (SELECT email,name,plantid,oga01,no,occ02_1 FROM  axmt610_in_head a left join dguser b on a.senduser=b.id where a.id='" + Request.QueryString["ID"] + "') ");
                    while (!rss.EOF)
                    {
                        if (rss["email"].ToString().Length.ToString() != "0" )
                        {
                            String ques;
                            MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");

                            MailAddress to = new MailAddress(rss["email"].ToString());

                           // MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                            MailMessage message = new MailMessage(from, to);
                           // message.Bcc.Add(bcc);

                            ques = "您好:" + "<br>" +
                                   "<br>" +
                                   "ERP信用放行電子簽核申請單現有一筆，己完成審核:" + "<br>" +
                                   "<br>" +
                                   "廠區 : " + rss["plantid"].ToString() + "<br>" +
                                   "出通/出貨單號 : " + rss["oga01"].ToString() + "<br>" +
                                   "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_AXMT610/AXMT610View.aspx?id=" + Request.QueryString["id"] + "\" >至ERP信用放行單號系統檢視</a>" +
                                   "<br>" +
                                   "<br>" +
                                   "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                   "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                   "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                            message.Subject = "信用放行單號 - " + rss["no"].ToString() + " 客戶-" + rss["occ02_1"].ToString() + " 完成審核";
                            message.IsBodyHtml = true;
                            message.Body = ques;

                            SmtpClient client = new SmtpClient("192.168.0.12");
                            client.Credentials = new NetworkCredential("eip", "eip1106"); 

                            client.Send(message);



                            
                        }
                        rss.MoveNext();
                    }
                    //-------------------------------------------------------------
                }

                Response.Write("<script type=\"text/javascript\">");
                Response.Write("location.href='axmt610View.aspx?id=" + Request.QueryString["ID"] + "';");
                Response.Write("</script>");
            }
            catch
            {
                //Response.Write("有問題");
            }
        }

        if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate ||
         e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Return)
        {
            //被退回要執行的程式碼
            try
            {

                string sqlstra = "";
                sqlstra = "SELECT * FROM axmt610_IN_HEAD where id='" + Request.QueryString["id"] + "'";
                SmoothEnterprise.Database.DataSet dsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                dsa.Open(sqlstra);

                if (!dsa.EOF)
                {
                    //審核通過產生檔案給erp--------------------------------------------------------------------
                    FileStream fs = new FileStream(@"D:\AXMT610_XML\4GL\" + dsa["plantid"].ToString() + "_ovaxmt610_" + dsa["oga01"].ToString() + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs);
                    sw.WriteLine("\"" + dsa["plantid"].ToString() + "\",\"ovaxmt610\",\"" + dsa["oga01"].ToString() + "\",\"N\"");
                    sw.Close();
                    fs.Close();
                    Upload("D:\\AXMT610_XML\\4GL\\" + dsa["plantid"].ToString() + "_ovaxmt610_" + dsa["oga01"].ToString() + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString() + "_ovaxmt610_" + this.FIELD_oga01.Text.ToString() + ".txt", "4gl", "4gl");

                    //------------------------------------------------------------------------------------------
                }

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM AXMT610_IN_HEAD WHERE id='" + Request.QueryString["ID"] + "' ");
                if (!rs.EOF)
                {
                    rs["status"] = "退回";

                    rs.Update();
                }
                rs.Close();

                //寄信------------------------------------------
                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                rss.Open(" (SELECT email,name,plantid,oga01,no,occ02_1 FROM  axmt610_in_head a left join dguser b on a.senduser=b.id where a.id='" + Request.QueryString["ID"] + "') ");
                while (!rss.EOF)
                {
                    if (rss["email"].ToString().Length.ToString() != "0")
                    {
                        String ques;
                        MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");

                        MailAddress to = new MailAddress(rss["email"].ToString());

                      //  MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                        MailMessage message = new MailMessage(from, to);
                      //  message.Bcc.Add(bcc);

                        ques = "您好:" + "<br>" +
                               "<br>" +
                               "ERP信用放行電子簽核申請單現有一筆，己被退回:" + "<br>" +
                               "<br>" +
                               "廠區 : " + rss["plantid"].ToString() + "<br>" +
                               "ERP單號 : " + rss["oga01"].ToString() + "<br>" +
                               "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_AXMT610/AXMT610Edit.aspx?id=" + Request.QueryString["id"] + "\" >至ERP信用放行單號系統檢視</a>" +
                               "<br>" +
                               "<br>" +
                               "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                               "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                               "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                        message.Subject = "信用放行單號 - " + rss["no"].ToString() +" 客戶-" + rss["occ02_1"].ToString()+ " 己被退回";
                        message.IsBodyHtml = true;
                        message.Body = ques;

                        SmtpClient client = new SmtpClient("192.168.0.12");
                        client.Credentials = new NetworkCredential("eip", "eip1106"); 

                        client.Send(message);




                    }
                    rss.MoveNext();
                }
                //-------------------------------------------------------------
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("location.href='axmt610View.aspx?id=" + Request.QueryString["ID"] + "';");
                Response.Write("</script>");
            }
            catch
            {
               // Response.Write("有問題");
            }

        }
    }

    protected void Page_PreRender(object sender, System.EventArgs e)
    {

        ////發信給下一關------------------------------------------

        //if (_NotifyReview)
        //{

        //    String ques;
        //    SmoothEnterprise.Database.DataSet es = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //    es.Open("select top 1 REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid,c.oga01 oga01,c.oga02 oga02,c.id cid from dgflowqueue a " +
        //            "left join dguser b on revieweruid=b.id " +
        //            "left join AXMT610_IN_HEAD c on c.id like '%" + Request.QueryString["id"] + "' " +
        //            "where requesturl like '%" + Request.QueryString["id"] + "'  AND reviewdate IS NULL AND qseq is not null ");
        //    if (!es.EOF)
        //    {
        //        MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
        //        MailAddress to = new MailAddress(es["email"].ToString());

        //        MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

        //        MailMessage message = new MailMessage(from, to);
        //        message.Bcc.Add(bcc);

        //        ques = "您好:" + "<br>" +
        //               "<br>" +
        //               "ERP信用放行申請單現有一筆，正等待您的處理:" + "<br>" +
        //               "<br>" +
        //               "ERP單號 : " + es["oga01"].ToString() + "<br>" +
        //               "申請日期 : " + es["oga02"].ToString() + "<br>" +
        //               "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_AXMT610/AXMT610View.aspx?id=" + es["cid"].ToString() + "\" >至ERP信用放行申請單系統審核</a>" +
        //               "<br>" +
        //               "如您待審核的筆數較多, 可直接至" + "<a href=\"http://eip.minaik.com.tw/erp_axmt610/MyMultiApproval.aspx\" >信用放行多筆審核</a>" +
        //               "進行簽核" +
        //               "<br>" +
        //               "<br>" +
        //               "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
        //               "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
        //               "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

        //        message.Subject = "信用放行單號 - " + es["oga01"].ToString() + " 等待您的處理";
        //        message.IsBodyHtml = true;
        //        message.Body = ques;

        //        SmtpClient client = new SmtpClient("192.168.0.12");

        //        client.Send(message);

        //        //Response.Write("Mail傳送完畢" + "<br>");

        //        //attch.MoveNext();

        //    }
        //    Response.Redirect("~/Flowwork/myapproval.aspx");
        //}
        ////-------------------------------------------------------
    }

    #region IMultiApproval Members

    public string[] MultiApproval_ResultTypes
    {
        get
        {
            return new string[]{
                    SmoothEnterprise.Flowwork.Control.ReviewResultType.Next.ToString(), 
                    SmoothEnterprise.Flowwork.Control.ReviewResultType.Back.ToString(),
                    SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate.ToString()
            };
        }
    }

    #endregion

    protected void PRINT_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='JavaScript'>window.print();</script>");
    }

    void sendmail(string a)
    {
        
        SmoothEnterprise.Database.DataSet dsmail;
        dsmail = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        dsmail.Open("SELECT * FROM  AXMT610_IN_HEAD a left join dguser b on b.id='" + a.ToString() + "' where a.id='" + Request.QueryString["ID"] + "'");
        if (!dsmail.EOF)
        {


            //if (a.ToString() == "72702274-62BE-455D-B768-E367865BB409")
            //{
            //    String ques;

            //    MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
            //    MailAddress to = new MailAddress("ann.lin@minaik.com.tw");

            //    MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

            //    MailMessage message = new MailMessage(from, to);
            //    //message.Bcc.Add(bcc);

            //    //如果為陳副總簽核的格式
            //    ques = dsmail["name"].ToString() + " 您好:" + "<br>" +
            //       "<br>" +
            //       "ERP信用放行申請單現有一筆，正等待您的處理:" + "<br>" +
            //       "<br>" +
            //       "出通/出貨單號 : " + dsmail["oga01"].ToString() + "<br>" +
            //       "申請日期 : " + dsmail["oga02"].ToString() + "<br>" +
            //       "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/erp_axmt610/MyMultiApproval.aspx\" >信用放行多筆審核</a>" +
            //       "進行簽核" +
            //       "<br>" +
            //       "<br>" +
            //       "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
            //       "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
            //       "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";
            //    message.Subject = "信用放行單號 - " + dsmail["no"].ToString() + " 等待您的處理";
            //    message.IsBodyHtml = true;
            //    message.Body = ques;

            //    SmtpClient client = new SmtpClient("192.168.0.12");

            //    client.Send(message);

            //}
            //else
            //{
                String ques;

                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                MailAddress to = new MailAddress(dsmail["email"].ToString());

               // MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");
                MailAddress bcc2 = new MailAddress("ric.chuang@minaik.com.tw");

                MailMessage message = new MailMessage(from, to);
                if(dsmail["name"].ToString()=="李秀珍")
                {
                   // message.Bcc.Add(bcc);
                }
                if (dsmail["logonid"].ToString() == "ric.chuang") //莊副總
                {
                    message.Bcc.Add(bcc2);
                }
                ques = dsmail["name"].ToString() + " 您好:" + "<br>" +
                       "<br>" +
                       "ERP信用放行申請單現有一筆，正等待您的處理:" + "<br>" +
                       "<br>" +
                       "出通/出貨單號 : " + dsmail["oga01"].ToString() + "<br>" +
                       "申請日期 : " + dsmail["oga02"].ToString() + "<br>" +
                       "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_AXMT610/AXMT610View.aspx?id=" + dsmail["id"].ToString() + "\" >至ERP信用放行申請單系統審核</a>" +
                       "<br>" +
                       "如您待審核的筆數較多, 可直接至" + "<a href=\"http://eip.minaik.com.tw/erp_axmt610/MyMultiApproval.aspx\" >信用放行多筆審核</a>" +
                       "進行簽核" +
                       "<br>" +
                       "<br>" +
                       "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                       "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                       "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";
                if (quick.ToString() == "Y")
                {
                    message.Subject = "信用放行單號 - " + dsmail["no"].ToString() + " 客戶-" + dsmail["occ02_1"].ToString() + " 等待您的處理";
                }
                else
                {
                    message.Subject = "信用放行單號 - " + dsmail["no"].ToString() + " 客戶-" + dsmail["occ02_1"].ToString() + " 等待您的處理--急件";
                }
                message.IsBodyHtml = true;
                message.Body = ques;

                SmtpClient client = new SmtpClient("192.168.0.12");
                client.Credentials = new NetworkCredential("eip", "eip1106"); 

                client.Send(message);

                #region 代理人
                MyLibrary_AXMT610 Backsend = new MyLibrary_AXMT610();
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs2.Open(" SELECT name,email,sdate,edate,GETDATE() FROM dguserdeputy a left join dguser b on a.deputyuid=b.id " +
                         " where  a.uid='" + a.ToString() + "'  " +
                         " and  " +
                         " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                         " (a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and sdate < GETDATE() and edate is null) or " +
                         " (a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and sdate < GETDATE() and edate > GETDATE()) or " +
                         "  a.sid is null and sdate < GETDATE() and edate  > GETDATE()) ");
                while (!rs2.EOF)
                {
                    //MyLibrary_AXMT610 Backsend = new MyLibrary_AXMT610();
                    Backsend.RunMailProcess("/ERP_AXMT610/AXMT610view.aspx?id=" + Request.QueryString["id"],
                    rs2["name"].ToString(), rs2["email"].ToString(), "信用放行單號(代) - " + FIELD_no.Text + " 客戶-" + this.FIELD_occ02_1.Text + "等待您的處理---");  //link,name,who mail,titel
                    rs2.MoveNext();

                }
                rs2.Close();

                #endregion

            
        }
    }

    //檔案上傳
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

        protected void btn_export_Click(object sender, EventArgs e)
        {
            string sqlstra = "";
            sqlstra = "SELECT * FROM axmt610_IN_HEAD where id='" + Request.QueryString["id"] + "'";
            SmoothEnterprise.Database.DataSet dsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            dsa.Open(sqlstra);

            if (!dsa.EOF)
            {
                //審核通過產生檔案給erp--------------------------------------------------------------------
                FileStream fs = new FileStream(@"D:\" + dsa["plantid"].ToString() + "_ovaxmt610_" + dsa["oga01"].ToString() + ".txt", FileMode.Create, FileAccess.Write);
                StreamWriter sw = new StreamWriter(fs);
                sw.WriteLine("\"" + dsa["plantid"].ToString() + "\",\"ovaxmt610\",\"" + dsa["oga01"].ToString() + "\",\"Y\"");
                sw.Close();
                fs.Close();
                //Upload("D:\\AXMT610_XML\\4GL\\" + dsa["plantid"].ToString() + "_ovaxmt610_" + dsa["oga01"].ToString() + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString() + "_ovaxmt610_" + this.FIELD_oga01.Text.ToString() + ".txt", "4gl", "4gl");

                //------------------------------------------------------------------------------------------
            }

        }
    }
}