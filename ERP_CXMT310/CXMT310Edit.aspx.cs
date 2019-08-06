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
using System.Net;
using System.IO;

namespace ERP_CXMT310
{
public partial class CXMT310Edit : SmoothEnterprise.Web.Page
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
	protected void Page_Load(object sender, System.EventArgs e)
	{

        //try
        //{
            //if (!this.IsPostBack)
            //{
                if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
                {
                    db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                    db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 

                }

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT  id, no, ver, plantid, l_azp03, companyname, programid, oaydesc, g_user, g_name, ta_oqa24, ta_oqa25, oqa01,convert(char, oqa02, 111) oqa02, oqa03, oqa031, oqa032, oqa05, " +
                        "  gem02_0, oqa06, oqa07, gen02_1, oqa08, oqa09, oqa10,convert(char, oqa12, 111)  oqa12, oqa13, oqa14, oqa15, oqa16, oqa17, oqaconf, oqaacti, oqauser, oqagrup, oqamodu, oqa011,  " +
                        "  ta_oqa01, ta_oqa011, ta_oqa012, ta_oqa013, ta_oqa014, ta_oqa015, ta_oqa016, ta_oqa017, ta_oqa018, ta_oqa021, tc_oag02_2,convert(char, ta_oqa022, 111)  ta_oqa022,convert(char, ta_oqa023, 111)  ta_oqa023, ta_oqa031, " +
                        "  ta_oqa032, ta_oqa033, oag02_3, convert(char, ta_oqa034, 111) ta_oqa034, ta_oqa041, ta_oqa042, ta_oqa043, oga02_4, ta_oqa044, ta_oqa051, ta_oqa052, ta_oqa053, oga02_5, ta_oga054,  " +
                        "  ta_oqa061, ta_oqa062, ta_oqa063, oag02_6,convert(char, ta_oqa064, 111)  ta_oqa064, ta_oqa071, ta_oqa072, ta_oqa073, oag02_7,convert(char, ta_oqa074, 111)  ta_oqa074, ta_oqa010, ta_oqa019, ta_oqa17, ta_oqa171,  " +
                        "  ta_oqa024, tc_oag02_8, ta_oqa035, ta_oqa045, ta_oqa055, ta_oqa065, ta_oqa075, ta_oqa18, ta_oqa025, ta_oqa026, ta_oqa17x, ta_oqa17t, ta_oqa20, ta_oqa20x, " +
                        "  ta_oqa20t, ta_oqa221, gec02_9, ta_oqa222, case ta_oqa223 WHEN 'Y' THEN '(含稅)' else '(未含稅)' end ta_oqa223, ta_oqa23, oah02_, profit, quick, status,sum,sum1  " +
                        "   FROM " + db1 + "CXMT310_IN_HEAD WHERE id='" + Request.QueryString["id"] + "' ");

                if (!rs.EOF)
                {

                    this.FIELD_no.Text = rs["no"].ToString();
                    this.FIELD_vera.Text = rs["ver"].ToString();
                    this.FIELD_plantid.Text = rs["plantid"].ToString();
                    //this.FIELD_l_azp03.Text = rs["l_azp03"].ToString();
                    this.FIELD_companyname.Text = rs["companyname"].ToString();
                    //this.FIELD_programid.Text = rs["programid"].ToString();
                    this.FIELD_oaydesc.Text = rs["oaydesc"].ToString();
                    //this.FIELD_g_user.Text = rs["g_user"].ToString();
                    this.FIELD_g_name.Text = rs["g_name"].ToString();
                    //this.FIELD_ta_oqa24.Text = rs["ta_oqa24"].ToString();
                    //this.FIELD_ta_oqa25.Text = rs["ta_oqa25"].ToString();
                    this.FIELD_oqa01.Text = rs["oqa01"].ToString();
                    this.FIELD_oqa02.Text = rs["oqa02"].ToString();
                    this.FIELD_oqa03.Text = rs["oqa03"].ToString();
                    this.FIELD_oqa031.Text = rs["oqa031"].ToString();
                    this.FIELD_oqa032.Text = rs["oqa032"].ToString();
                   // this.FIELD_oqa05.Text = rs["oqa05"].ToString();
                    this.FIELD_gem02_0.Text = rs["gem02_0"].ToString();
                    this.FIELD_oqa06.Text = rs["oqa06"].ToString();
                    //this.FIELD_oqa07.Text = rs["oqa07"].ToString();
                    this.FIELD_gen02_1.Text = rs["gen02_1"].ToString();
                    this.FIELD_oqa08.Text = rs["oqa08"].ToString();
                    this.FIELD_oqa09.Text = rs["oqa09"].ToString();
                    this.FIELD_oqa10.Text = rs["oqa10"].ToString();
                    this.FIELD_oqa12.Text = rs["oqa12"].ToString();
                    this.FIELD_oqa13.Text = double.Parse(rs["oqa13"].ToString()).ToString("N");
                    this.FIELD_oqa14.Text = double.Parse(rs["oqa14"].ToString()).ToString("N");
                    this.FIELD_oqa15.Text = double.Parse(rs["oqa15"].ToString()).ToString("N");
                    this.FIELD_oqa16.Text = double.Parse(rs["oqa16"].ToString()).ToString("N");
                    this.FIELD_oqa17.Text = double.Parse(rs["oqa17"].ToString()).ToString("N");
                    //this.FIELD_oqaconf.Text = rs["oqaconf"].ToString();
                    //this.FIELD_oqaacti.Text = rs["oqaacti"].ToString();
                    //this.FIELD_oqauser.Text = rs["oqauser"].ToString();
                    //this.FIELD_oqagrup.Text = rs["oqagrup"].ToString();
                    //this.FIELD_oqamodu.Text = rs["oqamodu"].ToString();
                    //this.FIELD_oqa011.Text = rs["oqa011"].ToString();
                   // this.FIELD_ta_oqa01.Text = rs["ta_oqa01"].ToString();
                    //this.FIELD_ta_oqa011.Text = rs["ta_oqa011"].ToString();
                    //this.FIELD_ta_oqa012.Text = rs["ta_oqa012"].ToString();
                    //this.FIELD_ta_oqa013.Text = rs["ta_oqa013"].ToString();
                    //this.FIELD_ta_oqa014.Text = rs["ta_oqa014"].ToString();
                    //this.FIELD_ta_oqa015.Text = rs["ta_oqa015"].ToString();
                    //this.FIELD_ta_oqa016.Text = rs["ta_oqa016"].ToString();
                    //this.FIELD_ta_oqa017.Text = rs["ta_oqa017"].ToString();
                    //this.FIELD_ta_oqa018.Text = rs["ta_oqa018"].ToString();
                    this.FIELD_ta_oqa021.Text = rs["ta_oqa021"].ToString();
                    this.FIELD_tc_oag02_2.Text = rs["tc_oag02_2"].ToString();
                    this.FIELD_ta_oqa022.Text = rs["ta_oqa022"].ToString();
                    this.FIELD_ta_oqa023.Text = rs["ta_oqa023"].ToString();
                    this.FIELD_ta_oqa031.Text = rs["ta_oqa031"].ToString();
                    this.FIELD_ta_oqa032.Text = double.Parse(rs["ta_oqa032"].ToString()).ToString("N");
                    this.FIELD_ta_oqa033.Text = rs["ta_oqa033"].ToString();
                    //this.FIELD_oag02_3.Text = rs["oag02_3"].ToString();
                    this.FIELD_ta_oqa034.Text = rs["ta_oqa034"].ToString();
                    //this.FIELD_ta_oqa041.Text = rs["ta_oqa041"].ToString();
                    //this.FIELD_ta_oqa042.Text = rs["ta_oqa042"].ToString();
                   // this.FIELD_ta_oqa043.Text = rs["ta_oqa043"].ToString();
                    //this.FIELD_oga02_4.Text = rs["oga02_4"].ToString();
                    //this.FIELD_ta_oqa044.Text = rs["ta_oqa044"].ToString();
                    //this.FIELD_ta_oqa051.Text = rs["ta_oqa051"].ToString();
                    //this.FIELD_ta_oqa052.Text = rs["ta_oqa052"].ToString();
                    //this.FIELD_ta_oqa053.Text = rs["ta_oqa053"].ToString();
                    //this.FIELD_oga02_5.Text = rs["oga02_5"].ToString();
                    //this.FIELD_ta_oga054.Text = rs["ta_oga054"].ToString();
                    this.FIELD_ta_oqa061.Text = rs["ta_oqa061"].ToString();
                    this.FIELD_ta_oqa062.Text = double.Parse(rs["ta_oqa062"].ToString()).ToString("N");
                    this.FIELD_ta_oqa063.Text = rs["ta_oqa063"].ToString();
                    //this.FIELD_oag02_6.Text = rs["oag02_6"].ToString();
                    this.FIELD_ta_oqa064.Text = rs["ta_oqa064"].ToString();
                    this.FIELD_ta_oqa071.Text = rs["ta_oqa071"].ToString();
                    this.FIELD_ta_oqa072.Text = double.Parse(rs["ta_oqa072"].ToString()).ToString("N");
                    this.FIELD_ta_oqa073.Text = rs["ta_oqa073"].ToString();
                   // this.FIELD_oag02_7.Text = rs["oag02_7"].ToString();
                    this.FIELD_ta_oqa074.Text = rs["ta_oqa074"].ToString();
                    this.FIELD_ta_oqa010.Text = rs["ta_oqa010"].ToString();
                    //this.FIELD_ta_oqa019.Text = rs["ta_oqa019"].ToString();
                    this.FIELD_ta_oqa17.Text = double.Parse(rs["ta_oqa17"].ToString()).ToString("N");
                    this.FIELD_ta_oqa171.Text = rs["ta_oqa171"].ToString();
                    //this.FIELD_ta_oqa024.Text = rs["ta_oqa024"].ToString();
                    //this.FIELD_tc_oag02_8.Text = rs["tc_oag02_8"].ToString();
                    //this.FIELD_ta_oqa035.Text = rs["ta_oqa035"].ToString();
                    //this.FIELD_ta_oqa045.Text = rs["ta_oqa045"].ToString();
                    //this.FIELD_ta_oqa055.Text = rs["ta_oqa055"].ToString();
                    //this.FIELD_ta_oqa065.Text = rs["ta_oqa065"].ToString();
                    //this.FIELD_ta_oqa075.Text = rs["ta_oqa075"].ToString();
                    //this.FIELD_ta_oqa18.Text = rs["ta_oqa18"].ToString();
                    //this.FIELD_ta_oqa025.Text = rs["ta_oqa025"].ToString();
                    //this.FIELD_ta_oqa026.Text = rs["ta_oqa026"].ToString();
                    this.FIELD_ta_oqa17x.Text = double.Parse(rs["ta_oqa17x"].ToString()).ToString("N");
                    this.FIELD_ta_oqa17t.Text = double.Parse(rs["ta_oqa17t"].ToString()).ToString("N");
                    this.FIELD_sum.Text = double.Parse(rs["sum"].ToString()).ToString("N");
                    this.FIELD_ta_oqa20.Text = double.Parse(rs["ta_oqa20"].ToString()).ToString("N");
                    this.FIELD_ta_oqa20x.Text = double.Parse(rs["ta_oqa20x"].ToString()).ToString("N");
                    this.FIELD_ta_oqa20t.Text = double.Parse(rs["ta_oqa20t"].ToString()).ToString("N");
                    this.FIELD_sum1.Text = double.Parse(rs["sum1"].ToString()).ToString("N");
                    this.FIELD_ta_oqa221.Text = rs["ta_oqa221"].ToString();
                   // this.FIELD_gec02_9.Text = rs["gec02_9"].ToString();
                    this.FIELD_ta_oqa222.Text = rs["ta_oqa222"].ToString();
                    this.FIELD_ta_oqa223.Text = rs["ta_oqa223"].ToString();
                    //this.FIELD_ta_oqa23.Text = rs["ta_oqa23"].ToString();
                    this.FIELD_oah02_.Text = rs["oah02_"].ToString();
                    this.FIELD_profit.Text = rs["profit"].ToString();
                    //this.FIELD_quick.Text = rs["quick"].ToString();
                    switch (rs["status"].ToString())
                    {
                        case "N":
                            this.FIELD_status.Text = "未送審";
                            this.InputButton1.Enabled = false;

                            break;

                        case "Y":
                            this.FIELD_status.Text = "送審中";
                            this.BUTTON_save.Enabled = false;
                            this.BUTTON_SendRequest.Enabled = false;
                            this.BUTTON_ERP.Enabled = false;
                            break;

                        case "OK":
                            this.FIELD_status.Text = "完成審核";
                            this.BUTTON_save.Enabled = false;
                            this.BUTTON_ERP.Enabled = false;
                            this.InputButton1.Enabled = false;
                            if (this.CurrentUser.LogonID.ToString() != "ann.lin")
                                this.BUTTON_SendRequest.Visible = false;
                            break;


                        case "NO":
                            this.FIELD_status.Text = "退回單據至ERP修改";
                            this.BUTTON_ERP.Enabled = false;
                            this.InputButton1.Enabled = false;
                            this.BUTTON_SendRequest.Visible = false;
                            this.BUTTON_save.Enabled = false;
                            break;

                        case "V":
                            this.FIELD_status.Text = "作廢";
                            this.BUTTON_save.Enabled = false;
                            this.BUTTON_SendRequest.Enabled = false;
                            this.BUTTON_ERP.Enabled = false;
                            this.InputButton1.Enabled = false;

                            break;

                        default:
                            this.FIELD_status.Text = "未送審";
                            this.InputButton1.Enabled = false;
                            break;

                    }

                    SqlDataSource1.SelectCommand = " select oqb02,oqb03,oqb031,oqb032,oqb04,oqb05,ta_oqb12,ta_oqb13,oqb07,oqb08,ta_oqb04,ta_oqb02, " +
                                                   "convert(char, ta_oqb03, 111) ta_oqb03,ta_oqb091,ta_oqb092,ta_oqb093, " +
                                                   "convert(nvarchar,cast(ta_oqb09 as money),1)  ta_oqb09, " +
                                                   "convert(nvarchar,cast(oqb09 as money),1) oqb09, " +
                                                   "convert(nvarchar,cast(ta_oqb10 as money),1) ta_oqb10, " +
                                                   "convert(nvarchar,cast(oqb10 as money),1) oqb10, " +
                                                   "convert(nvarchar,cast(ta_oqb11 as money),1) ta_oqb11, " +
                                                   "convert(nvarchar,cast(oqb11 as money),1) oqb11   " +
                                                   " from " + db1 + " cxmt310_in_body where no='" + rs["no"].ToString() + "' and plantid='" + rs["plantid"].ToString() + "'";

                    SqlDataSource2.SelectCommand = "select  oqe03, oqe04  from " + db1 + "cxmt310_in_oqe where no='" + rs["no"].ToString() + "' and plantid='" + rs["plantid"].ToString() + "'";

                    SqlDataSource3.SelectCommand = "select  tc_oqe03, tc_oqe04  from " + db1 + "cxmt310_in_tcoqe where no='" + rs["no"].ToString() + "' and plantid='" + rs["plantid"].ToString() + "'";

                    

                    this.GridView1.DataBind();
                    this.GridView2.DataBind();
                    this.GridView3.DataBind();

                    if (GridView2.Rows.Count == 0)
                    {
                        this.null1.Visible = true;
                    }
                    if (GridView3.Rows.Count == 0)
                    {
                        this.null2.Visible = true;
                    }

                }


                //附檔----------------------------------------------------
                int i = 0;
                ContentPlaceHolder cnt;
                cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                CheckBoxList chb = (CheckBoxList)cnt.FindControl("CheckBoxFile");
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs2.Open("SELECT id,FileName FROM " + db1 + "CXMT310_File WHERE FileKey='" + Request.QueryString["ID"] + "' and usertype='1' ");
                while (!rs2.EOF)
                {
                    chb.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs2["id"].ToString() + "\" target=\"_blank\">" + rs2["FileName"].ToString() + "</a>", rs2["id"].ToString()));
                    rs2.MoveNext();
                }
                rs2.Close();


               
        //    }
        //}
        //catch
        //{
            //Response.Redirect("CXMT310.aspx");
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
		if (this.IsValid)
		{
			try
			{
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
                rs2.Open("SELECT * FROM " + db1 + "CXMT310_File WHERE 1=0");

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

                    SmoothEnterprise.Database.DataSet rsc = new SmoothEnterprise.Database.DataSet();
                    rsc.ExecuteNonQuery("Delete FROM " + db1 + "CXMT310_File WHERE ID in (" + FileList + ")");
                }

                Response.Redirect("CXMT310Edit.aspx?id=" + Request.QueryString["id"]);
				
			}
			catch (Exception ex)
			{
				this.AddError(this,"BUTTON_save_Click()","",ex.Message);
			}
		}
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        this.GoBack("CXMT310.aspx",new string[]{"CXMT310Delete.aspx"});
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("CXMT310Delete.aspx?id="+Request.QueryString["id"]);
	}

    protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {
        SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rb.Open("SELECT * FROM " + db1 + "cxmt310_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
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

         SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
         rs.Open("select b.id bid,b.name bname from  " + db1 + "cxmt310_in_head a LEFT JOIN  " + db2 + "DGUSER b ON oqa07=erpid  WHERE a.id='" + Request.QueryString["id"] + "' ");

        if (!rs.EOF)
        {

            if (this.FIELD_plantid.Text.Trim() == "MAY") //MAY業務=業務主管, 故只簽一次
            {
                managerid.Add(rs["bid"].ToString());
                managernm.Add("業務主管");

            }
            else
            {
                managerid.Add(rs["bid"].ToString());
                managernm.Add("業務");

                managerid.Add(aa.manager(rs["bid"].ToString()).Split('@')[0]);
                managernm.Add("業務主管");

                // 如組織圖中無官副總, 要加-----------------------------------------
                string vinc = "4A2805A5-6BDB-446B-B1CA-6D181E222B3E";   //官副總id
                string checkvinc = "";
                foreach (string i in managerid)  //將簽核人員id塞進flow
                {
                    if (i.ToString().ToUpper() == vinc)
                    {
                        checkvinc = "1";


                    }

                }

                if (checkvinc == "")
                {
                    managerid.Add(vinc);
                    managernm.Add("業務最高主管");
                }

                //----------------------------------------------------------------------

            }



        }


        sharflow12.Flowwork.sharflow121 flow = new sharflow12.Flowwork.sharflow121();
        FlowClient1.Text = "報價單電子簽核 ERP單號:" + this.FIELD_oqa01.Text;  //更改流程名稱
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
        e.NextNode.ReviewerURL = "/ERP_CXMT310/CXMT310VIEW.aspx";

        #region  刪除簽核人員pur_risk_sign

        SmoothEnterprise.Database.DataSet delrs = new SmoothEnterprise.Database.DataSet();
        delrs.ExecuteNonQuery("delete " + db1 + "CXMT310_sign where mid='" + Request.QueryString["id"] + "'");

        #endregion

        int count = 0;
        foreach (string i in managerid)  //將簽核人員id塞進flow
        {
            this.FlowClient1.AddParameter("USER" + count.ToString(), i);
            //Response.Write("USER" + count.ToString() + ")" + i + "<br>");
            count++;

            #region  新增簽核人員至pur_risk_sign

            delrs.ExecuteNonQuery("INSERT INTO " + db1 + "CXMT310_sign (mid,user_id,number) VALUES ('" + Request.QueryString["id"] + "','" + i.ToString() + "','" + count.ToString() + "')");

            #endregion
        }

        count = 0;

        foreach (string i in managernm)  //將簽核人員職稱塞進flow
        {
            this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);

            count++;
        }

        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rss.Open("select id bid,name,email from " + db2 + "dguser where id = '" + this.CurrentUser.ID + "' ");
        if (!rss.EOF)
        {
            ArrayList email_list = new ArrayList();  //email list


            email_list.Add(rss["name"].ToString() + '#' + rss["email"].ToString());

            #region 代理人
            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs2.Open(" SELECT b.name name,email FROM " + db2 + "dguserdeputy a left join " + db2 + "dguser b on a.deputyuid=b.id left join " + db2 + "dgflow c on a.sid=c.id  " +
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

            foreach (string i in email_list)
            {



                String ques;

                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                MailAddress to = new MailAddress(i.Split('#')[1]);

                MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                MailMessage message = new MailMessage(from, to);
                ques = i.Split('#')[0] + " 您好:" + "<br>" +
                       "<br>" +
                       "ERP報價電子簽核申請單現有一筆，正等待您的處理:" + "<br>" +
                       "<br>" +
                       "申請單號 : " + this.FIELD_no.Text + "<br>" +
                       "ERP單號 : " + this.FIELD_oqa01.Text + "<br>" +
                       "申請日期 : " + this.FIELD_oqa02.Text + "<br>" +
                       "申請人員 : " + this.FIELD_g_name.Text + "<br>" +
                       "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_CXMT310/CXMT310View.aspx?id=" + Request.QueryString["id"] + "\" >至ERP報價電子簽核系統檢視並編輯內容</a>" +
                       "<br>" +
                       "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                       "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                       "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";


                message.Subject = "報價單號 - " + this.FIELD_no.Text + " ERP單號-" + this.FIELD_oqa01.Text + "等待您的處理";

                message.IsBodyHtml = true;
                message.Body = ques;


                SmtpClient client = new SmtpClient("192.168.0.12");
                client.Credentials = new NetworkCredential("eip", "eip1106");
                client.Send(message);

            }

        }

        //讓更新能顯示------------------------------------------------------------------------------------
        Response.Write("<script type=\"text/javascript\">");
        Response.Write("location.href='CXMT310Edit.aspx?id=" + Request.QueryString["ID"] + "';");
        Response.Write("</script>");
        //-------------------------------------------------------------------------------------------------
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
        rb.Open("SELECT * FROM " + db1 + "cxmt310_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
        if (!rb.EOF)
        {
            rb["STATUS"] = "N";
            rb.Update();

        }
        rb.Close();

        //讓更新能顯示------------------------------------------------------------------------------------
        Response.Write("<script type=\"text/javascript\">");
        Response.Write("location.href='cxmt310Edit.aspx?id=" + Request.QueryString["ID"] + "';");
        Response.Write("</script>");
        //-------------------------------------------------------------------------------------------------
    }
    protected void BUTTON_ERP_Click(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rb.Open("SELECT * FROM " + db1 + "CXMT310_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
        if (!rb.EOF)
        {
            rb["STATUS"] = "NO";//退回ERP修改
            rb.Update();

        }
        rb.Close();

        //傳簽核退回的TXT給ERP
        FileStream fs = new FileStream(@"D:\CXMT310_XML\4GL\" + this.FIELD_plantid.Text.ToString() + "_CXMT310_" + this.FIELD_oqa01.Text + ".txt", FileMode.Create, FileAccess.Write);
        StreamWriter sw = new StreamWriter(fs);
        sw.WriteLine("\"" + this.FIELD_plantid.Text.ToString() + "\",\"CXMT310\",\"" + this.FIELD_oqa01.Text + "\",\"N\",\"" + this.FIELD_no.Text + "\"");
        sw.Close();
        fs.Close();
        Upload("D:\\CXMT310_XML\\4GL\\" + this.FIELD_plantid.Text.ToString() + "_CXMT310_" + this.FIELD_oqa01.Text + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString() + "_CXMT310_" + this.FIELD_oqa01.Text + ".txt", "4gl", "4gl");

        //讓更新能顯示------------------------------------------------------------------------------------
        Response.Write("<script type=\"text/javascript\">");
        Response.Write("location.href='cxmt310Edit.aspx?id=" + Request.QueryString["ID"] + "';");
        Response.Write("</script>");
        //-------------------------------------------------------------------------------------------------
    }
    protected void InputButton1_Click(object sender, EventArgs e)
    {

        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rss.Open("select a.*, b.name name, b.email email,c.no no,b.id bid from " + db2 + "dgflowqueue a left join " + db2 + "dguser b on a.revieweruid = b.id " +
                "left join " + db1 + "CXMT310_IN_head c on c.id= '" + Request.QueryString["id"] + "' " +
                "where requesturl = '/ERP_CXMT310/CXMT310edit.aspx?id=" + Request.QueryString["id"] + "' and revieweruid <> " +
                "'" + System.Guid.Empty.ToString() + "' and reviewdate is null ");
        if (!rss.EOF)
        {

            ArrayList email_list = new ArrayList();  //email list


            email_list.Add(rss["name"].ToString() + '#' + rss["email"].ToString());

            #region 代理人
            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs2.Open(" SELECT b.name name,email FROM " + db2 + "dguserdeputy a left join " + db2 + "dguser b on a.deputyuid=b.id left join " + db2 + "dgflow c on a.sid=c.id  " +
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
                       "ERP報價電子簽核申請單現有一筆，正等待您的處理:" + "<br>" +
                       "<br>" +
                       "申請單號 : " + this.FIELD_no.Text + "<br>" +
                       "ERP單號 : " + this.FIELD_oqa01.Text + "<br>" +
                       "申請日期 : " + this.FIELD_oqa02.Text + "<br>" +
                       "申請人員 : " + this.FIELD_g_name.Text + "<br>" +
                       "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_CXMT310/ERP_CXMT310View.aspx?id=" + Request.QueryString["id"] + "\" >至ERP報價電子簽核系統檢視並編輯內容</a>" +
                       "<br>" +
                       "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                       "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                       "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";


                message.Subject = "提醒您報價單號 - " + this.FIELD_no.Text + " ERP單號-" + this.FIELD_oqa01.Text + "等待您的處理";

                message.IsBodyHtml = true;
                message.Body = ques;

                SmtpClient client = new SmtpClient("192.168.0.12");
                client.Credentials = new NetworkCredential("eip", "eip1106");
                client.Send(message);

            }


        }
        //讓更新能顯示------------------------------------------------------------------------------------
        Response.Write("<script type=\"text/javascript\">");
        Response.Write("location.href='cxmt310Edit.aspx?id=" + Request.QueryString["ID"] + "';");
        Response.Write("</script>");
        //-------------------------------------------------------------------------------------------------
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