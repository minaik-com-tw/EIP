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
using System.Text;

namespace ERP_AXMT610
{
public partial class AXMT610Edit : SmoothEnterprise.Web.Page
{
    private  string[] crm01 =new string[3]{"TOS01","HIT01","HIT02"};

	protected void Page_Load(object sender, System.EventArgs e)
	{

        //超限原因的下拉選單---------------------------------------------------------------------------
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
        this.FIELD_reason_user.Items.Add("請選擇...", "");
        //this.FIELD_reason_sales.Items.Add("請選擇...", "");
        ds.Open("SELECT REASON,id FROM axmt610_REASON where type='reason' ORDER BY id");
        while (!ds.EOF)
        {
            this.FIELD_reason_user.Items.Add(ds["REASON"].ToString(), ds["REASON"].ToString());
            //this.FIELD_reason_sales.Items.Add(ds["REASON"].ToString(), ds["REASON"].ToString());
            ds.MoveNext();
        }
        //-----------------------------------------------------------------------------------------------
        //改善方案的下拉選單---------------------------------------------------------------------------
        SmoothEnterprise.Database.DataSet ds2 = new SmoothEnterprise.Database.DataSet();
        this.FIELD_Improve_user.Items.Add("請選擇...", "");
        //this.FIELD_Improve_sales.Items.Add("請選擇...", "");
        ds2.Open("SELECT REASON,id FROM axmt610_REASON where type='Improve' ORDER BY id");
        while (!ds2.EOF)
        {
            this.FIELD_Improve_user.Items.Add(ds2["REASON"].ToString(), ds2["REASON"].ToString());
            //this.FIELD_Improve_sales.Items.Add(ds2["REASON"].ToString(), ds2["REASON"].ToString());
            ds2.MoveNext();
        }
        //-----------------------------------------------------------------------------------------------
		try
		{
            if (!IsPostBack)
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
                    this.FIELD_Sales.Text = rs["sales"].ToString();
                    this.FIELD_Lsend.Text = rs["lsend"].ToString();
                    this.FIELD_quick.Text = rs["quick"].ToString().Trim();
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


                    SmoothEnterprise.Database.DataSet dss = new SmoothEnterprise.Database.DataSet();
                    dss.Open("SELECT REASON,id FROM axmt610_REASON where reason='" + rs["reason_user"].ToString() + "' and type='reason' ");
                    if (!dss.EOF)
                    {
                        this.RadioSe1.Checked = true;
                        this.RadioSe2.Checked = false;
                        this.FIELD_reason_user.Value = rs["reason_user"].ToString();
                    }
                    else
                    {
                        this.RadioSe1.Checked = false;
                        this.RadioSe2.Checked = true;
                        this.FIELD_reason_user2.Text = rs["reason_user"].ToString();
                    }
                    SmoothEnterprise.Database.DataSet dss2 = new SmoothEnterprise.Database.DataSet();
                    dss2.Open("SELECT REASON,id FROM axmt610_REASON where reason='" + rs["improve_user"].ToString() + "' and type='improve' ");
                    if (!dss2.EOF)
                    {
                        this.RadioButton1.Checked = true;
                        this.RadioButton2.Checked = false;
                        this.FIELD_Improve_user.Value = rs["improve_user"].ToString();
                    }
                    else
                    {
                        this.RadioButton1.Checked = false;
                        this.RadioButton2.Checked = true;
                        this.FIELD_Improve_user2.Text = rs["improve_user"].ToString();
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

                    #region sales

                    //SmoothEnterprise.Database.DataSet ess = new SmoothEnterprise.Database.DataSet();
                    //ess.Open("SELECT REASON,id FROM axmt610_REASON where reason='" + rs["Reason_salse"].ToString() + "' and type='reason' ");
                    //if (!ess.EOF)
                    //{
                    //    this.RadioButton3.Checked = true;
                    //    this.RadioButton4.Checked = false;
                    //    this.FIELD_reason_sales.Value = rs["Reason_salse"].ToString();
                    //}
                    //else
                    //{
                    //    this.RadioButton3.Checked = false;
                    //    this.RadioButton4.Checked = true;
                    //    this.FIELD_reason_sales2.Text = rs["Reason_salse"].ToString();
                    //}
                    //SmoothEnterprise.Database.DataSet ess2 = new SmoothEnterprise.Database.DataSet();
                    //ess2.Open("SELECT REASON,id FROM axmt610_REASON where reason='" + rs["Improve_salse"].ToString() + "' and type='improve' ");
                    //if (!ess2.EOF)
                    //{
                    //    this.RadioButton5.Checked = true;
                    //    this.RadioButton6.Checked = false;
                    //    this.FIELD_Improve_sales.Value = rs["Improve_salse"].ToString();
                    //}
                    //else
                    //{
                    //    this.RadioButton5.Checked = false;
                    //    this.RadioButton6.Checked = true;
                    //    this.FIELD_Improve_sales2.Text = rs["Improve_salse"].ToString();
                    //}


                    ////附檔----------------------------------------------------
                    //int ei = 0;
                    //ContentPlaceHolder ecnt;
                    //ecnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                    //CheckBoxList echb = (CheckBoxList)ecnt.FindControl("CheckBoxFile1");
                    //SmoothEnterprise.Database.DataSet ers2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    //ers2.Open("SELECT id,FileName FROM axmt610_File WHERE FileKey='" + Request.QueryString["ID"] + "' and usertype='2'");
                    //while (!ers2.EOF)
                    //{
                    //    echb.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + ers2["id"].ToString() + "\" target=\"_blank\">" + ers2["FileName"].ToString() + "</a>", ers2["id"].ToString()));
                    //    ers2.MoveNext();
                    //}
                    //ers2.Close();


                    //--------------------------------------------------------

                    # endregion

                    //--------------------------------------------------------

                    if (rs["STATUS"].ToString().Trim() == "N" || rs["STATUS"].ToString().Trim() == "退回")
                    {
                        this.AddWarning(this, "Page_Load()", "", "請記得將儲存後再將單據送審！");
                        BUTTON_SendRequest.Visible = true;
                        BUTTON_save.Enabled = true;

                    }
                    else if (rs["STATUS"].ToString().Trim() == "完成審核")
                    {
                        this.InputButton2.Enabled = false;
                        this.BUTTON_save.Enabled = false;
                        this.BUTTON_SendRequest.Visible = false;

                    }
                    else
                    {
                        this.BUTTON_save.Enabled = false;
                        this.BUTTON_SendRequest.Visible = false;
                        
                    }
                    if (rs["STATUS"].ToString().Trim() == "Y")
                    {
                        this.InputButton2.Enabled = false;
                    }
                    #region 代入預設審核人（直屬主管及目的廠業務）
                   
                    if (this.FIELD_programid.Text.ToString() == "axmt610" || this.FIELD_programid.Text.ToString() == "axmt620" || this.FIELD_programid.Text.ToString() == "axmt650")
                    {
                        //正常
                        if (this.FIELD_Lsend.Text == "")
                        {
                            if (this.FIELD_gem02_3.Text.ToString() == "業務五部")
                            {
                                SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                rs1.Open("select id from dguser where erpid='" + this.FIELD_oga14.Text + "'");
                                if (!rs1.EOF)
                                {
                                    this.FIELD_Lsend.Text = rs1["id"].ToString();
                                }
                               // Response.Write("<script language='JavaScript'>window.alert('多角必須輸入目的廠業務窗口！');</script>");
                            }
                            else if (this.FIELD_oga14.Text.ToString().Trim() == "A00022")  //20121107 如果業務人員為陳淑華, 直屬主管需預設官副總
                            {

                                this.FIELD_Lsend.Text = "4A2805A5-6BDB-446B-B1CA-6D181E222B3E";

                            }
                            else
                            {
                                SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                rs1.Open("select b.id bid,b.uid uid,a.id aid,a.name,pid from dguser a left join dggroup b on a.gid=b.id  where erpid='" + this.FIELD_oga14.Text.ToString() + "' ");
                                if (!rs1.EOF)
                                {
                                    if (rs1["uid"].ToString() == rs1["aid"].ToString())
                                    {
                                        SmoothEnterprise.Database.DataSet rs22 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                        rs22.Open("select uid from dggroup where id='" + rs["pid"].ToString() + "'");

                                        if (!rs22.EOF)
                                        {
                                            this.FIELD_Lsend.Text = rs22["uid"].ToString();
                                        }
                                    }
                                    else
                                    {
                                        this.FIELD_Lsend.Text = rs1["uid"].ToString();
                                    }

                                }
                                else
                                {
                                    this.FIELD_Lsend.Text = this.CurrentUser.LogonID.ToString();
                                }
                           }
                        }

                    }
                    else
                    {
                        //多角
                        if (this.FIELD_Lsend.Text == "")
                        {
                            SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs1.Open("select * from ERP_FLOW where ERP_NAME='axmt610' and DEP_NAME='SALES' AND NO='" + rs["plantid"].ToString() + "'");
                            if (!rs1.EOF)
                            {
                                this.FIELD_Lsend.Text = rs1["pid"].ToString();
                            }
                        }

                        #region 代入預設目的廠業務
                        if (this.FIELD_Sales.Text == "")
                        {
                            SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs1.Open("select id from dguser where erpid='" + rs["l_gen01"].ToString() + "'");
                            if (!rs1.EOF)
                            {
                                this.FIELD_Sales.Text = rs1["id"].ToString();
                            }
                            //Response.Write("select id from dguser where erpid='" + rs["l_gen01"].ToString() + "'");
                        }

                        #endregion

                    }
                    #endregion

                    //this.Panel1.Visible = false;
                    

                }
                else
                {
                  //  Response.Redirect("AXMT610.aspx");
                }

                SqlDataSource1.SelectCommand = "select b.plantid plantid,bno,ogb31,ogb32,ogb04,ogb06,ima021,ogb05,ogb12 from AXMT610_IN_HEAD a left join AXMT610_IN_BODY b on a.plantid=b.plantid and a.no=b.bno where a.id='" + Request.QueryString["id"] + "'";

                //Response.Write("select b.plantid plantid,bno,ogb31,ogb32,ogb04,ogb06,ima021,ogb05,ogb12 from AXMT610_IN_HEAD a left join AXMT610_IN_BODY b on a.plantid=b.plantid and a.no=b.bno where a.id='" + Request.QueryString["id"] + "'");
                this.GridView1.DataBind();

            }
		}
		catch
		{
			//Response.Redirect("AXMT610.aspx");
		}

        //if (FIELD_no.Text == "B2013070001")
        //{
        //    Response.Write(this.FIELD_programid.Text.ToString() + "---" + this.FIELD_plantid.Text.ToString().Trim());
        //}

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
            if ((this.RadioSe1.Checked == true && this.FIELD_reason_user.Value.Length.ToString() != "0") || (this.RadioSe2.Checked == true && this.FIELD_reason_user2.Text.Length.ToString() != "0") || (this.RadioButton1.Checked == true && this.FIELD_Improve_user.Value.Length.ToString() != "0") || (this.RadioButton2.Checked == true && this.FIELD_Improve_user2.Text.Length.ToString() != "0"))
            {
                if (this.FIELD_Lsend.Text.ToString().Length != 0)
                {
                    if ((this.FIELD_programid.Text.ToString().IndexOf("axmt8") != -1 && this.FIELD_Sales.Text.ToString().Length != 0) || (this.FIELD_programid.Text.ToString() == "axmt610" || this.FIELD_programid.Text.ToString() == "axmt620" || this.FIELD_programid.Text.ToString() == "axmt650"))
                    {
                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("SELECT * FROM AXMT610_IN_HEAD WHERE id='" + Request.QueryString["id"] + "' ");
                        if (!rs.EOF)
                        {

                            if (this.FIELD_Sales.Text != "") rs["Sales"] = this.FIELD_Sales.Text; else rs["Sales"] = System.DBNull.Value;
                            if (this.FIELD_Lsend.Text != "") rs["Lsend"] = this.FIELD_Lsend.Text; else rs["Lsend"] = System.DBNull.Value;
                            if (this.FIELD_Annotate_user.Text != "") rs["Annotate_user"] = this.FIELD_Annotate_user.Text; else rs["Annotate_user"] = System.DBNull.Value;
                            rs["senduser"] = this.CurrentUser.ID;
                            rs["senduser"] = this.CurrentUser.ID;
                            rs["quick"] = this.FIELD_quick.Text;
                            if (this.RadioSe1.Checked)
                            {
                                rs["Reason_user"] = this.FIELD_reason_user.Value;
                            }
                            else
                            {
                                rs["Reason_user"] = this.FIELD_reason_user2.Text;
                            }
                            if (this.RadioButton1.Checked)
                            {
                                rs["Improve_user"] = this.FIELD_Improve_user.Value;
                            }
                            else
                            {
                                rs["Improve_user"] = this.FIELD_Improve_user2.Text;
                            }




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
                        Response.Redirect("AXMT610Edit.aspx?id=" + Request.QueryString["id"]);
                        //--------------------------------------------------------------------------------------------------
                    }
                    else
                    {
                        Response.Write("<script language='JavaScript'>window.alert('多角必須輸入目的廠業務窗口！');</script>");

                    }
                }
                else
                {
                    Response.Write("<script language='JavaScript'>window.alert('直屬主管不得空白！');</script>");
                }

            }
            else
            {
                Response.Write("<script language='JavaScript'>window.alert('請輸入信用額度超限原因及改善方案！');</script>");

            }
		}
		catch (Exception ex)
		{
			this.AddError(this,"BUTTON_save_Click()","",ex.Message);
		}
		
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        Response.Redirect("AXMT610.aspx");
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("AXMT610Delete.aspx?id="+Request.QueryString["id"]);
	}

    protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {
        //try
        //{
            if ((this.RadioSe1.Checked == true && this.FIELD_reason_user.Value.Length.ToString() != "0") || (this.RadioSe2.Checked == true && this.FIELD_reason_user2.Text.Length.ToString() != "0") || (this.RadioButton1.Checked == true && this.FIELD_Improve_user.Value.Length.ToString() != "0") || (this.RadioButton2.Checked == true && this.FIELD_Improve_user2.Text.Length.ToString() != "0"))
            {
                if (this.FIELD_Lsend.Text.ToString().Length != 0)
                {
                    if ((this.FIELD_programid.Text.ToString().IndexOf("axmt8") != -1 && this.FIELD_Sales.Text.ToString().Length != 0) || (this.FIELD_programid.Text.ToString() == "axmt610" || this.FIELD_programid.Text.ToString() == "axmt620" || this.FIELD_programid.Text.ToString() == "axmt650"))
                    {
                        this.BUTTON_SendRequest.Flow = this.FlowClient1;
                        this.FlowClient1.Text = "ERP信用放行流程(Credit Checking Requisition) No:" + this.FIELD_no.Text;

                        ArrayList countlevel = new ArrayList();
                        ArrayList jobname = new ArrayList();
                        ArrayList dobuleda = new ArrayList();

                        int strCount = 0;  // 算總共有個關卡

                        string[] sb = new string[4];   // 使用者自選直屬主管
                        string[] mb = new string[4];   // 登入者直屬主管

                        mb[0] = "";
                        mb[1] = "-1";
                        mb[2] = "";
                        mb[3] = "";


                        #region 信用放行人員


                        //if (this.FIELD_Lsend.Text.ToString() != "DE567430-33D7-438E-90FB-F8AE7AB684A9".Replace("{", "").Replace("}", "").ToLower())  //直屬主管如果是grace.chen則不用簽(因代理VK)
                        //{
                            strCount = strCount + 1;
                            countlevel.Add(this.FIELD_Lsend.Text);   // 將使用者選的人先加入陣列
                            jobname.Add("直屬主管");


                        //}
                            

                        if (this.FIELD_programid.Text.ToString() == "axmt610" || this.FIELD_programid.Text.ToString() == "axmt620" || this.FIELD_programid.Text.ToString() == "axmt650")
                        {
                            if (this.FIELD_plantid.Text.ToString().Trim() == "MINAIK")
                            {
                                   #region MAT正常信用放行

                                int costlevel = 10; //簽到協理
                                int xxx = 0;


                                //層級不夠需重跑
                                while (int.Parse(mb[1]) < costlevel)
                                {
                                    if (xxx == 0)
                                    {

                                        mb = getdeprtid(getdep(this.CurrentUser.ID.ToString()));
                                        xxx = xxx + 1;


                                    }
                                    else
                                    {
                                        mb = getdeprtid(mb[2]);
                                    }
                                    //Response.Write(mb[0].ToString() + "<br>");
                                    //判斷陣列中是否有重覆
                                    if (mb[0].ToString() != this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower())
                                    {

                                        if (!countlevel.Contains(mb[0]))
                                        {
                                            if (mb[0].ToString().ToLower() != "d0d0ee91-3a1c-4bb5-a85f-c66a58b74c14")//主管如果是曉毓免簽(因為在最後面)
                                            {

                                                countlevel.Add(mb[0]);
                                                jobname.Add(mb[3]);
                                                strCount = strCount + 1;
                                            }
                                        }


                                    }

                                    xxx = xxx + 1;
                                }

                                if (countlevel.Contains("13FEB136-9F48-416A-B495-7C2BE8C3B548") != true && this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower() != "13FEB136-9F48-416A-B495-7C2BE8C3B548")
                                {
                                    countlevel.Add("13FEB136-9F48-416A-B495-7C2BE8C3B548");
                                    jobname.Add("財務人員");
                                    strCount = strCount + 1;
                                }

                                if (countlevel.Contains("D22FD429-E1EC-431D-99E6-1D7041F8A452") != true && this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower() != "13FEB136-9F48-416A-B495-7C2BE8C3B548")
                                {
                                    countlevel.Add("D22FD429-E1EC-431D-99E6-1D7041F8A452");
                                    jobname.Add("財務主管");
                                    strCount = strCount + 1;
                                }


                                if (countlevel.Contains("D0D0EE91-3A1C-4BB5-A85F-C66A58B74C14") != true && this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower() != "DC62DBEB-6268-4254-B8ED-191DD35587C6")
                                {
                                    countlevel.Add("D0D0EE91-3A1C-4BB5-A85F-C66A58B74C14");
                                    jobname.Add("財務中心處最高主管");
                                    strCount = strCount + 1;
                                }

                                //if (countlevel.Contains("AB70A6C0-D106-4636-B1E1-15DFFF9A83C5") != true && this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower() != "AB70A6C0-D106-4636-B1E1-15DFFF9A83C5")
                                //{
                                //    countlevel.Add("AB70A6C0-D106-4636-B1E1-15DFFF9A83C5");
                                //    jobname.Add("財務長");
                                //    strCount = strCount + 1;
                                //}


                                #endregion
                            }
                            else
                            {
                                #region MAP正常信用放行    20120216 Ann加

                                int costlevel = 6; //簽到副理
                                int xxx = 0;


                                //層級不夠需重跑
                                while (int.Parse(mb[1]) < costlevel)
                                {
                                     

                                        if (xxx == 0)
                                        {
                                            mb = getdeprtid(getdep2(this.FIELD_oga14.Text.ToString()));
                                            xxx = xxx + 1;
                                        }
                                        else
                                        {
                                            mb = getdeprtid(mb[2]);
                                        }
                                     
                                    //判斷陣列中是否有重覆
                                    if (mb[0].ToString() != this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower())
                                    {

                                        if (!countlevel.Contains(mb[0]))
                                        {
                                            if (mb[0].ToString() != "de567430-33d7-438e-90fb-f8ae7ab684a9")
                                            {
                                                countlevel.Add(mb[0]);
                                                jobname.Add(mb[3]);
                                                strCount = strCount + 1;
                                            }
                                        }


                                    }

                                    xxx = xxx + 1;
                                }

                                for (int i = 0; i <= 4; i++)
                                {
                                    Response.Write(i.ToString());
                                    SmoothEnterprise.Database.DataSet ls = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                                    ls.Open("select * from erp_flow where dep_name='FIN' and no='" + i.ToString() + "'");
                                    if (!ls.EOF)
                                    {
                                        countlevel.Add(ls["pid"].ToString());
                                        switch (i.ToString().Trim())
                                        {
                                            case "1":
                                                jobname.Add("財務人員");
                                                break;
                                            case "2":
                                                jobname.Add("財務副理");
                                                break;
                                            case "3":
                                                jobname.Add("財務經理");
                                                break;
                                            case "4":
                                                jobname.Add("總經理");
                                                break;
                                        }
                                        strCount = strCount + 1;


                                    }
                                }



                                #endregion
                               
                            }
                        }
                        else
                        {
                            #region 多角信用放行




                            SmoothEnterprise.Database.DataSet aa = new SmoothEnterprise.Database.DataSet();
                            object objola = aa.ExecuteScalar("SELECT comid FROM axmt610_in_head a left join dguser b on a.sales=b.id WHERE a.id='" + Request.QueryString["id"] + "' ");
                            string comid = objola.ToString();

                            if (comid.ToString().Trim() == "MAP")
                            {
                                if (this.FIELD_Sales.Text != "" && this.FIELD_Sales.Text != this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower())
                                {
                                    strCount = strCount + 1;
                                    countlevel.Add(this.FIELD_Sales.Text);   // 將使用者選的人先加入陣列
                                    jobname.Add("目的廠業務相關人員");

                                }

                                mb = getdeprtid(getdep(this.FIELD_Sales.Text));

                                //判斷陣列中是否有重覆
                                if (mb[0].ToString() != this.FIELD_Sales.Text)
                                {
                                    if (!countlevel.Contains(mb[0]))
                                    {
                                        countlevel.Add(mb[0]);
                                        jobname.Add(mb[3]);
                                        strCount = strCount + 1;
                                    }

                                }



                                if (countlevel.Contains("2D8C2C4C-89D3-4D7C-BACD-B5861BFFA67D") != true && this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower() != "2D8C2C4C-89D3-4D7C-BACD-B5861BFFA67D")
                                {
                                    countlevel.Add("2D8C2C4C-89D3-4D7C-BACD-B5861BFFA67D");
                                    jobname.Add("財務人員");
                                    strCount = strCount + 1;
                                }

                            }
                            else
                            {


                                if (this.FIELD_Sales.Text != "" && this.FIELD_Sales.Text != this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower())
                                {
                                    strCount = strCount + 1;
                                    countlevel.Add(this.FIELD_Sales.Text);   // 將使用者選的人先加入陣列
                                    jobname.Add("目的廠業務相關人員");

                                }

                                int costlevel =10; //簽到協理
                                int xxx = 0;

                                Response.Write("312#");

                                //層級不夠需重跑
                                
                                while (int.Parse(mb[1]) < costlevel)
                                {
                                   // Response.Write(mb[0].ToString().ToUpper() + "---" + mb[1].ToString()+ "--<br>");
                                    if (xxx == 0)
                                    {
                                        mb = getdeprtid(getdep(this.FIELD_Sales.Text));
                                        xxx = xxx + 1;
                                    }
                                    else
                                    {
                                        mb = getdeprtid(mb[2]);
                                    }

                                    //判斷陣列中是否有重覆
                                    if (mb[0].ToString() != this.FIELD_Sales.Text)
                                    {
                                        if (!countlevel.Contains(mb[0]))
                                        {
                                            if (mb[0].ToString().ToUpper() != "D0D0EE91-3A1C-4BB5-A85F-C66A58B74C14")//主管如果是曉毓免簽(因為在最後面)
                                            {

                                                countlevel.Add(mb[0]);
                                                jobname.Add(mb[3]);
                                                strCount = strCount + 1;
                                            }
                                        }

                                    }

                                    xxx = xxx + 1;
                                }




                                if (countlevel.Contains("13FEB136-9F48-416A-B495-7C2BE8C3B548") != true && this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower() != "13FEB136-9F48-416A-B495-7C2BE8C3B548")
                                {
                                    countlevel.Add("13FEB136-9F48-416A-B495-7C2BE8C3B548");
                                    jobname.Add("財務人員");
                                    strCount = strCount + 1;
                                }

                                if (countlevel.Contains("D22FD429-E1EC-431D-99E6-1D7041F8A452") != true && this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower() != "13FEB136-9F48-416A-B495-7C2BE8C3B548")
                                {
                                    countlevel.Add("D22FD429-E1EC-431D-99E6-1D7041F8A452");
                                    jobname.Add("財務主管");
                                    strCount = strCount + 1;
                                }

                                if (countlevel.Contains("D0D0EE91-3A1C-4BB5-A85F-C66A58B74C14") != true && this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower() != "DC62DBEB-6268-4254-B8ED-191DD35587C6")
                                {
                                    countlevel.Add("D0D0EE91-3A1C-4BB5-A85F-C66A58B74C14");
                                    jobname.Add("財務中心處最高主管");
                                    strCount = strCount + 1;
                                }

                                //if (countlevel.Contains("AB70A6C0-D106-4636-B1E1-15DFFF9A83C5") != true && this.CurrentUser.ID.Replace("{", "").Replace("}", "").ToLower() != "AB70A6C0-D106-4636-B1E1-15DFFF9A83C5")
                                //{
                                //    countlevel.Add("AB70A6C0-D106-4636-B1E1-15DFFF9A83C5");
                                //    jobname.Add("財務長.");
                                //    strCount = strCount + 1;
                                //}

                            }
                            #endregion

                        }
                        #endregion

                        //if (this.FIELD_plantid.Text.ToString().Trim() == "MINAIK")
                        //{
                            #region 尋找簽核人員中的代理人是否與簽核中人員相如, 如相同則刪除該截點(留職位大的)
                            DateTime dt = DateTime.Now;
                            countlevel.Reverse(); //倒轉arraylist中的順序(因為要從大的往下找,才能留最大的)
                            jobname.Reverse();


                            int myIndex;
                            int mytooIndex;
                            foreach (string a in countlevel)
                            {

                                SmoothEnterprise.Database.DataSet da = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                                da.Open("SELECT uid,b.name bname,deputyuid,c.name cname FROM dguserdeputy a " +
                                        "left join dguser b on a.uid=b.id " +
                                        "left join dguser c on a.deputyuid=c.id " +
                                        "where  a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and uid='" + a.ToString() + "' and sdate <= '" + dt.ToString("yyyy-MM-dd HH:mm:ss") + "' and (edate >= '" + dt.ToString("yyyy-MM-dd HH:mm:ss") + "' or edate is null)");
                                if (!da.EOF) //查詢當日是否有代理人
                                {
                                    myIndex = countlevel.IndexOf(da["deputyuid"].ToString().ToUpper()); //如代理人在arraylist中有出現
                                    if (myIndex == -1)
                                    {
                                        myIndex = countlevel.IndexOf(da["deputyuid"].ToString()); //如代理人在arraylist中有出現
                                    }

                                    //Response.Write("---"+lshort("72702274-62be-455d-b768-e367865bb409")+"---");

                                    if (myIndex >= 0)
                                    {
                                        if (lshort(a.ToString()) < lshort(da["deputyuid"].ToString()))  //如果代理人的階層比原本的大的話
                                        {
                                            mytooIndex = countlevel.IndexOf(a.ToUpper());

                                            if (mytooIndex == -1)
                                            {
                                                mytooIndex = countlevel.IndexOf(a.ToString());
                                            }
                                            if (mytooIndex >= 0)
                                            {
                                                dobuleda.Add(mytooIndex.ToString()); //將此陣列位置記錄(記錄原id)
                                            }


                                        }
                                        else
                                        {

                                            dobuleda.Add(myIndex.ToString()); //將此陣列位置記錄(記錄代理人出現的id)
                                        }
                                    }

                                }
                            }
                            int dobuledaint = 0;
                            foreach (string i in dobuleda) //刪除該陣列
                            {
                                countlevel.RemoveAt(int.Parse(i.ToString()) - dobuledaint);
                                jobname.RemoveAt(int.Parse(i.ToString()) - dobuledaint);
                                dobuledaint = dobuledaint + 1;
                            }

                            countlevel.Reverse();
                            jobname.Reverse();

                            #endregion
                        //}
                        //6D6D309B-C9B8-493B-9C56-71814EBBDF67
                        //判斷第一個點是不是 grace 若是就改為P 姐
                            if (((FIELD_gen02_4.Text=="倪佩琦") || (FIELD_gen02_4.Text=="蔡施梅")) &&
                                (countlevel[0].ToString().ToUpper() == "DE567430-33D7-438E-90FB-F8AE7AB684A9")){
                                countlevel[0] = "6D6D309B-C9B8-493B-9C56-71814EBBDF67";
                            }


                        int count = 0;
                        foreach (string i in countlevel)
                        {
                            this.FlowClient1.AddParameter("USER" + count.ToString(), i);
                            //Response.Write("USER" + count.ToString() + ")" + i + "<br>");
                            count++;
                        }

                        count = 0;
                        foreach (string i in jobname)
                        {
                            this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
                            //Response.Write("USERTITLE" + count.ToString() + ")" + i + "<br>");
                            count++;
                        }

                        string FlowRoute = "-1";
                        switch (countlevel.Count)
                        {

                            case 3:
                                FlowRoute = "2";
                                break;
                            case 4:
                                FlowRoute = "5";
                                break;
                            case 5:
                                FlowRoute = "6";
                                break;
                            case 6:
                                FlowRoute = "0";
                                break;
                            case 7:
                                FlowRoute = "1";
                                break;
                            case 8:
                                FlowRoute = "3";
                                break;
                            case 9:
                                FlowRoute = "4";
                                break;

                        }
                        //自行撰寫發信給第一關mail----------------------------------------------------------------------------


                        if (this.FIELD_Lsend.Text.ToString().ToUpper() == "A6AAF5D4-A6B9-4073-8540-312DCF388B91")　　//如果為莊副總要另外處理(因莊副總只要收信用放行的信即可)
                        {
                            String ques;
                            SmoothEnterprise.Database.DataSet es = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                            es.Open("select * from dguser where id = '" + this.FIELD_Lsend.Text.ToString() + "'  ");
                            if (!es.EOF)
                            {
                                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                                MailAddress to = new MailAddress("ric.chuang@minaik.com.tw");

                                MailAddress bcc = new MailAddress("herzog.lin@minaik.com.tw");

                                MailMessage message = new MailMessage(from, to);
                                message.Bcc.Add(bcc);

                                ques = es["name"].ToString() + " 您好:" + "<br>" +
                                       "<br>" +
                                       "ERP信用放行申請單現有一筆，正等待您的處理:" + "<br>" +
                                       "<br>" +
                                       "出通/出貨單號 : " + this.FIELD_oga01.Text + "<br>" +
                                       "申請日期 : " + this.FIELD_oga02.Text + "<br>" +
                                       "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_AXMT610/AXMT610View.aspx?id=" + Request.QueryString["ID"] + "\" >至ERP信用放行申請單系統審核</a>" +
                                       "<br>" +
                                       "如您待審核的筆數較多, 可直接至" + "<a href=\"http://eip.minaik.com.tw/erp_axmt610/MyMultiApproval.aspx\" >信用放行多筆審核</a>" +
                                       "進行簽核" +
                                       "<br>" +
                                       "<br>" +
                                       "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                       "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                       "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";
                                if (this.FIELD_quick.Text == "Y")
                                {
                                    message.Subject = "信用放行單號 - " + this.FIELD_no.Text +" 客戶-"+this.FIELD_occ02_1.Text+ " 等待您的處理--急件";
                                }
                                else
                                {
                                    message.Subject = "信用放行單號 - " + this.FIELD_no.Text + " 客戶-" + this.FIELD_occ02_1.Text + " 等待您的處理";
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
                                         " where  a.uid='" + this.FIELD_Lsend.Text.ToString().ToUpper() + "'  " +
                                         " and  " +
                                         " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                                         " (a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and sdate < GETDATE() and edate is null) or " +
                                         " (a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and sdate < GETDATE() and edate > GETDATE()) or " +
                                         "  a.sid is null and sdate < GETDATE() and edate  > GETDATE()) ");
                                while (!rs2.EOF)
                                {
                                    //MyLibrary_AXMT610 Backsend = new MyLibrary_AXMT610();
                                    Backsend.RunMailProcess("/ERP_AXMT610/AXMT610view.aspx?id=" + Request.QueryString["id"],
                                    rs2["name"].ToString(), rs2["email"].ToString(), "信用放行單號 - " + this.FIELD_no.Text + " 客戶-" + this.FIELD_occ02_1.Text + "等待您的處理");  //link,name,who mail,titel
                                    rs2.MoveNext();

                                }
                                rs2.Close();

                                #endregion


                            }
                        }
                        else
                        {

                            String ques;
                            SmoothEnterprise.Database.DataSet es = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                            es.Open("select * from dguser where id = '" + countlevel[0].ToString() + "'  ");
                            if (!es.EOF)
                            {


                                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                                MailAddress to = new MailAddress(es["email"].ToString());

                                MailAddress bcc = new MailAddress("herzog.lin@minaik.com.tw");

                                MailMessage message = new MailMessage(from, to);
                                message.Bcc.Add(bcc);

                                ques = es["name"].ToString() + " 您好:" + "<br>" +
                                       "<br>" +
                                       "ERP信用放行申請單現有一筆，正等待您的處理:" + "<br>" +
                                       "<br>" +
                                       "出通/出貨單號 : " + this.FIELD_oga01.Text + "<br>" +
                                       "申請日期 : " + this.FIELD_oga02.Text + "<br>" +
                                       "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_AXMT610/AXMT610View.aspx?id=" + Request.QueryString["ID"] + "\" >至ERP信用放行申請單系統審核</a>" +
                                       "<br>" +
                                       "如您待審核的筆數較多, 可直接至" + "<a href=\"http://eip.minaik.com.tw/erp_axmt610/MyMultiApproval.aspx\" >信用放行多筆審核</a>" +
                                       "進行簽核" +
                                       "<br>" +
                                       "<br>" +
                                       "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                       "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                       "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";
                                if (this.FIELD_quick.Text == "Y")
                                {
                                    message.Subject = "信用放行單號 - " + this.FIELD_no.Text + " 客戶-" + this.FIELD_occ02_1.Text + " 等待您的處理--急件";
                                }
                                else
                                {
                                    message.Subject = "信用放行單號 - " + this.FIELD_no.Text + " 客戶-" + this.FIELD_occ02_1.Text + " 等待您的處理";
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
                                         " where  a.uid='" + this.FIELD_Lsend.Text.ToString().ToUpper() + "'  " +
                                         " and  " +
                                         " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                                         " (a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and sdate < GETDATE() and edate is null) or " +
                                         " (a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and sdate < GETDATE() and edate > GETDATE()) or " +
                                         "  a.sid is null and sdate < GETDATE() and edate  > GETDATE()) ");
                                while (!rs2.EOF)
                                {
                                    //MyLibrary_AXMT610 Backsend = new MyLibrary_AXMT610();
                                    Backsend.RunMailProcess("/ERP_AXMT610/AXMT610view.aspx?id=" + Request.QueryString["id"],
                                    rs2["name"].ToString(), rs2["email"].ToString(), "信用放行單號 - " + this.FIELD_no.Text + " 客戶-" + this.FIELD_occ02_1.Text + "等待您的處理");  //link,name,who mail,titel
                                    rs2.MoveNext();

                                }
                                rs2.Close();

                                #endregion
                            }

                        }



                        //----------------------------------------------------------------------------------------------------

                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        rs.Open("SELECT * FROM AXMT610_IN_HEAD WHERE id='" + Request.QueryString["ID"] + "' ");
                        if (!rs.EOF)
                        {
                            rs["status"] = "Y";
                            rs["FlowRoute"] = FlowRoute;

                            rs.Update();
                        }
                        rs.Close();

                        Response.Write("<script type=\"text/javascript\">");
                        Response.Write("location.href='axmt610Edit.aspx?id=" + Request.QueryString["ID"] + "';");
                        Response.Write("</script>");
                    }
                    else
                    {
                        Response.Write("<script language='JavaScript'>window.alert('多角必須輸入目的廠業務窗口！');</script>");

                    }
                }
                else
                {
                    Response.Write("<script language='JavaScript'>window.alert('直屬主管不得空白！');</script>");
                }

            }
            else
            {
                Response.Write("<script language='JavaScript'>window.alert('請輸入信用額度超限原因及改善方案！');</script>");

            }
        //}
        //catch
        //{

        //    Response.Write("<script language='JavaScript'>window.alert('請確認多角窗口輸入是否正確！');</script>");
        //}
    }

    private string getdep(string ID)
    {
        string ridd = "";
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        ds.Open("select gid from dguser where id='" + ID + "'");
        if (!ds.EOF)
        {
            ridd = ds["gid"].ToString();
        }
        return ridd;
    }
    private string getdep2(string ID)
    {
        string ridd = "";
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        ds.Open("select gid from dguser where erpid='" + ID + "'");
        if (!ds.EOF)
        {
            ridd = ds["gid"].ToString();
        }
        return ridd;
    }


    private string[] getdeprtid(string ID)
    {
        string[] rid = new string[4];
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        ds.Open(" select a.uid,levid,lshort,a.pid,lname from dggroup a"+
                   " left join dguser c on a.uid=c.id "+
                   " left join dglevel d on c.levid=d.lnid " +
                   " where a.id='" + ID + "'");
        if (!ds.EOF)
        {
            rid[0] = ds["uid"].ToString(); //簽核人員id
            rid[1] = ds["lshort"].ToString();//簽核人員層級
            rid[2] = ds["pid"].ToString();//該簽核人員部門id
            rid[3] = ds["lname"].ToString();//該簽核人員職稱
        }
        return rid;
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
    protected void BUTTON_StopRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {
        SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rb.Open("SELECT * FROM axmt610_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
        while (!rb.EOF)
        {
            rb["STATUS"] = "N";
            rb["FlowRoute"] = "-1";


            rb.Update();
            rb.MoveNext();

        }
        rb.Close();
        BUTTON_SendRequest.Visible = true;
        BUTTON_save.Enabled = true;
        Response.Write("<script type=\"text/javascript\">");
        Response.Write("location.href='axmt610Edit.aspx?id=" + Request.QueryString["ID"] + "';");
        Response.Write("</script>");
    }
    protected void InputButton2_Click(object sender, EventArgs e)
    {
        FileStream fs = new FileStream(@"D:\AXMT610_XML\4GL\" + this.FIELD_plantid.Text.ToString() + "_ovaxmt610_" + this.FIELD_oga01.Text.ToString() + ".txt", FileMode.Create, FileAccess.Write);
        StreamWriter sw = new StreamWriter(fs);
        sw.WriteLine("\"" + this.FIELD_plantid.Text.ToString() + "\",\"ovaxmt610\",\"" + this.FIELD_oga01.Text.ToString() + "\",\"X\"");
        sw.Close();
        fs.Close();
        Upload("D:\\AXMT610_XML\\4GL\\" + this.FIELD_plantid.Text.ToString() + "_ovaxmt610_" + this.FIELD_oga01.Text.ToString() + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString() + "_ovaxmt610_" + this.FIELD_oga01.Text.ToString() + ".txt", "4gl", "4gl");


        SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rb.Open("SELECT * FROM axmt610_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
        while (!rb.EOF)
        {
            rb["STATUS"] = "V";
            rb["FlowRoute"] = "-1";


            rb.Update();
            rb.MoveNext();

        }
        rb.Close();

        Response.Redirect("AXMT610.aspx");
    }

    protected void InputButton1_Click(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rs.Open("select a.*, b.name requestname, b.email,b.logonid logonid,c.no no,b.id bid from dgflowqueue a left join dguser b on a.revieweruid = b.id " +
                "left join AXMT610_IN_HEAD c on c.id= '" + Request.QueryString["id"] + "' " +
                "where requesturl = '/ERP_AXMT610/AXMT610edit.aspx?id=" + Request.QueryString["id"] + "' and revieweruid <> "+
                "'" + System.Guid.Empty.ToString() + "' and reviewdate is null ");
        if (!rs.EOF)
        {

            MyLibrary_AXMT610 Backsend = new MyLibrary_AXMT610();
            Backsend.RunMailProcess("/ERP_AXMT610/AXMT610view.aspx?id=" + Request.QueryString["id"],
            rs["requestname"].ToString(), rs["email"].ToString(), "信用放行單號 - " + rs["no"].ToString() +" 客戶-" + this.FIELD_occ02_1.Text+ "等待您的處理");  //link,name,who mail,titel
            if (rs["logonid"].ToString() == "ric.chuang")
            {

                
                Backsend.RunMailProcess("/ERP_AXMT610/AXMT610view.aspx?id=" + Request.QueryString["id"],
                rs["requestname"].ToString(), "ann.lin@minaik.com.tw", "信用放行單號 - " + rs["no"].ToString() + " 客戶-" + this.FIELD_occ02_1.Text + "等待您的處理");  //link,name,who mail,titel
            }


            #region 代理人
            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs2.Open(" SELECT name,email,sdate,edate,GETDATE() FROM dguserdeputy a left join dguser b on a.deputyuid=b.id " +
                     " where  a.uid='" + rs["bid"].ToString() + "'  " +
                     " and  " +
                     " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                     " (a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and sdate < GETDATE() and edate is null) or " +
                     " (a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and sdate < GETDATE() and edate > GETDATE()) or " +
                     "  a.sid is null and sdate < GETDATE() and edate  > GETDATE()) ");
            while (!rs2.EOF)
            {
                //MyLibrary_AXMT610 Backsend = new MyLibrary_AXMT610();
                Backsend.RunMailProcess("/ERP_AXMT610/AXMT610view.aspx?id=" + Request.QueryString["id"],
                rs2["name"].ToString(), rs2["email"].ToString(), "信用放行單號 - " + rs["no"].ToString() + " 客戶-" + this.FIELD_occ02_1.Text + "等待您的處理---");  //link,name,who mail,titel
                
                Response.Write(rs2["email"].ToString() + "<br>");
               rs2.MoveNext();
            }
            rs2.Close();

            #endregion
        }

    }

   

    static int lshort(string a)
    {
        int b=0;
        SmoothEnterprise.Database.DataSet ds;
        ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        ds.Open("select lshort from dguser a left join dglevel b on a.levid=b.lnid where a.id='"+a.ToString().ToUpper()+"'");
        if (!ds.EOF)
        {

            b= int.Parse(ds["lshort"].ToString());
        }


        return b;

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

}
}