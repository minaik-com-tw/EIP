/*
 * H201701    財務長異動: 09EF664C-22AB-43F1-A16E-729CF1C1FD68  變更為秀珍
 * H201901    財務長異動: 09EF664C-22AB-43F1-A16E-729CF1C1FD68  變更為德文
 *
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
using SmoothEnterprise.Security.UI.WebControl;
using SmoothEnterprise.Web.UI.HTMLControl;
using System.IO;
using System.Net;


namespace ERP_APMT420
{
public partial class APMT420Edit : SmoothEnterprise.Web.Page
{


    private string quick = "";

    static string Company = "";
	protected void Page_Load(object sender, System.EventArgs e)
	{
      //  Response.Write("select pname,pid from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc' and no in (SELECT CASE WHEN pml04 IN ('MISC固資','MISC-雜項購置') THEN '2' ELSE '1' END ot_hr FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and b.pmk01='" + rs["pmk01"].ToString() + "' and pml02='1' AND a.plantid='MAT')");
                           
		//Page.Title = "APMT420 Edit Page";
        //Response.Write(this.FIELD_computer.Text + FIELD_computer_no.Text);
        BUTTON_save.Attributes.Add("OnClick", "return   j1()"); //如前端javascript檢查有問題,禁止提交頁面
        BUTTON_SendRequest.Attributes.Add("OnClick", "return   j1()"); //如前端javascript檢查有問題,禁止提交頁面
        int ose;
        if (this.CurrentUser.LogonID.ToString() == "smooth")
        {
            this.BUTTON_StopRequest.Visible = true;
        }
		try
		{
            if (!this.IsPostBack)
            {
                try
                {
                    
                    //AddControls();
                    //Button_addpop.Attributes.Add("OnClick", "return   addtext()"); //如前端javascript檢查有問題,禁止提交頁面
                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                    rs.Open("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                    if (!rs.EOF)
                    {
                        
                        this.FIELD_no.Text = rs["no"].ToString();
                        Company  = rs["plantID"].ToString();
                        this.FIELD_pmk01.Text = rs["pmk01"].ToString();
                        this.FIELD_pmk02.Text = rs["pmk02"].ToString();
                        this.FIELD_pmk04.Text = rs["pmk04"].ToString();
                        this.FIELD_pmk06.Text = rs["pmk06"].ToString();
                        this.FIELD_pmk09.Text = rs["pmk09"].ToString();
                        this.FIELD_pmc03.Text = rs["pmc03"].ToString();
                        this.FIELD_pmk10.Text = rs["pmk10"].ToString();
                        this.FIELD_pme031_1.Text = rs["pme031_1"].ToString();
                        this.FIELD_pmk11.Text = rs["pmk11"].ToString();
                        this.FIELD_pme031_2.Text = rs["pme031_2"].ToString();
                        this.FIELD_pmk12.Text = rs["pmk12"].ToString();
                        this.FIELD_gen02_3.Text = rs["gen02_3"].ToString();
                        this.FIELD_pmk13.Text = rs["pmk13"].ToString();
                        this.FIELD_gem02_4.Text = rs["gem02_4"].ToString();
                        this.FIELD_pmk14.Text = rs["pmk14"].ToString();
                        this.FIELD_gem02_5.Text = rs["gem02_5"].ToString();
                        this.FIELD_pmk15.Text = rs["pmk15"].ToString();
                        this.FIELD_gen02_6.Text = rs["gen02_6"].ToString();
                        //this.FIELD_pmk16.Text = rs["pmk16"].ToString();
                        //this.FIELD_pmk17.Text = rs["pmk17"].ToString();
                        //this.FIELD_pmc03_7.Text = rs["pmc03_7"].ToString();
                        this.FIELD_pmk20.Text = rs["pmk20"].ToString();
                        this.FIELD_pma02_8.Text = rs["pma02_8"].ToString();
                        this.FIELD_pmk21.Text = rs["pmk21"].ToString();
                        this.FIELD_pmk22.Text = rs["pmk22"].ToString();
                        this.FIELD_pmk41.Text = rs["pmk41"].ToString();
                        this.FIELD_oah02_9.Text = rs["oah02_9"].ToString();
                        this.FIELD_pmk42.Text = rs["pmk42"].ToString();
                        this.FIELD_pmk43.Text = rs["pmk43"].ToString();
                        this.FIELD_ta_pmk01.Text = rs["ta_pmk01"].ToString();
                        //this.FIELD_pmk18.Text = rs["pmk18"].ToString();
                        this.FIELD_l_amt1.Text = rs["l_amt1"].ToString();
                        this.FIELD_l_amt2.Text = rs["l_amt2"].ToString();
                        this.FIELD_status.Text = rs["status"].ToString();
                        this.FIELD_acc.Text = rs["acc"].ToString();
                        TextBox1.Text = rs["acc"].ToString();
                        this.FIELD_pur.Text = rs["pur"].ToString();
                        this.FIELD_mis.Text = rs["mis"].ToString();
                        this.FIELD_computer_no.Text = rs["computer_no"].ToString();
                        this.FIELD_lsend.Text = rs["lsend"].ToString();
                        this.FIELD_osend1.Text = rs["osend1"].ToString();
                        if (rs["osend2"].ToString() != "")
                        {
                            this.FIELD_osend2.Text = rs["osend2"].ToString();
                            this.FIELD_osend2.Visible = true;
                        }
                        if (rs["osend3"].ToString() != "")
                        {
                            this.FIELD_osend3.Text = rs["osend3"].ToString();
                            this.FIELD_osend3.Visible = true;
                        }
                        if (rs["osend4"].ToString() != "")
                        {
                            this.FIELD_osend4.Text = rs["osend4"].ToString();
                            this.FIELD_osend4.Visible = true;
                        }
                        if (rs["osend5"].ToString() != "")
                        {
                            this.FIELD_osend5.Text = rs["osend5"].ToString();
                            this.FIELD_osend5.Visible = true;
                        }

                        

                    //   Response.Write(rs["pmk02"].ToString().Substring(0, 3) + "--<br>");
                       if (rs["pmk02"].ToString().Substring(0, 3) == "CAP")
                       {
                           HFCAP1.Value = "2";
                       }
                       else { HFCAP1.Value = "1"; }
                        //
                        //this.FIELD_osend3.Text = rs["osend3"].ToString();
                        //this.FIELD_osend4.Text = rs["osend4"].ToString();
                        //this.FIELD_osend5.Text = rs["osend5"].ToString();
                        string namefd;
                        //-----------------------------------------------------------------------------------
                        SmoothEnterprise.Database.DataSet rsax = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                       // Response.Write("SELECT pml041 FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and a.id='" + Request.QueryString["id"] + "'");
                        
                        
                        
                        rsax.Open("SELECT pml041 FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and a.id='" + Request.QueryString["id"] + "'");
                        if (!rsax.EOF)
                        {
                             namefd = rsax["pml041"].ToString();

                            //Response.Write(namefd.ToString());
                        


                        //判斷會計人員是誰
                        //'MISC-固資','MISC-雜項購置','MISC-遞延費用'
                        //2->CAP:資產請購   1->EXP:費用請購

                        //if (this.FIELD_acc.Text == "")
                        //{
                            //string acc1=2;
                            //if (rs["pmk02"].ToString().Substring(1, 3) == "CAP") acc1 = "1";
                            SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                          //  rsa.Open("select pname,pid from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc' and no in (SELECT CASE WHEN pml04 IN ('MISC-固資','MISC-雜項購置','MISC-遞延費用') THEN '2' ELSE '1' END ot_hr FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and b.pmk01='" + rs["pmk01"].ToString() + "' and pml02='1' AND a.plantid='" + rs["plantID"].ToString() + "')");
                            rsa.Open("select PID from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc' " +
                                " and NO='" + HFCAP1.Value + "' and company='"+Company+"'");
                           // Response.Write("select PID from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc' " +
                           //     " and NO='" + HFCAP1.Value + "' and company='" + Company + "'");
                            if (!rsa.EOF)
                            {
                                this.FIELD_acc.Text = rsa["pid"].ToString();
                            }
                        //}
                        //判斷採購人員與是否為電腦類
                        if (this.FIELD_pur.Text == "" && (namefd.IndexOf("電腦") != -1 || namefd.IndexOf("PC,") != -1 || namefd.IndexOf("NB,") != -1))
                        {
                            SmoothEnterprise.Database.DataSet rsaa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                            //Response.Write("select pname,pid from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc' and no in (SELECT CASE WHEN pml04 IN ('MISC固資','MISC-雜項購置') THEN '2' ELSE '1' END ot_hr FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and b.pmk01='" + rs["pmk01"].ToString() + "' and pml02='1' AND a.plantid='" + rs["plantID"].ToString() + "')");
                            rsaa.Open(" SELECT pid FROM erp_flow where NO='1' and DEP_NAME='PUR' and company='" + Company + "'");
                            if (!rsaa.EOF)
                            {
                                this.FIELD_pur.Text = rsaa["pid"].ToString();
                                this.FIELD_computer.Text = "Y";
                                //Response.Write("fsfsadfasasssssssss");
                            }
                        }

                        //判斷資訊人員是誰
                        if (this.FIELD_mis.Text == "" && (namefd.IndexOf("電腦") != -1 || namefd.IndexOf("PC,") != -1 || namefd.IndexOf("NB,") != -1))
                        {
                            SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                            //Response.Write("SELECT pid FROM erp_flow where No='" + rs["gem02_4"].ToString() + "'");
                            rsb.Open("SELECT pid FROM erp_flow where No='" + rs["gem02_4"].ToString() + "' and company='" + Company + "'");
                            if (!rsb.EOF)
                            {
                                this.FIELD_mis.Text = rsb["pid"].ToString();
                            }
                        }
                    }
                        //-----------------------------------------------------------------------------------
                        this.FIELD_computer.Text = rs["computer"].ToString().Trim();
                        this.FIELD_chemistry.Text = rs["chemistry"].ToString().Trim();
                        this.FIELD_quick.Text = rs["quick"].ToString().Trim();
                        this.GridView1.RowStyle.Height = 10;
                        ContentPlaceHolder cnt;
                        cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");

                        for (int ati = 1; ati <= 6; ati++)
                        {
                            String taattname = "attachment" + ati.ToString();
                            String rattname = "filename" + ati.ToString();
                            String tafilexten = "fileexten" + ati.ToString();
                            string dname = "FIELD_attachmentd" + ati.ToString();
                            string rname = "FIELD_attachmentr" + ati.ToString();

                            if (rs[taattname].ToString() != "")
                            {
                                String iexten;
                                iexten = Findfileicon(rs[tafilexten].ToString());

                                Literal lit = (Literal)cnt.FindControl(dname);
                                lit.Text = "<a target=\"_blank\" href=\"AttachDownload.aspx?bulid=" + rs["id"].ToString() + "&atnu=" + ati + "\"><img src=\"/Lib/Img/" + iexten + "\" border=\"0\" align=\"absmiddle\" alt=" + rs[rattname].ToString() + " ></a><a class='HTitle' target=\"_blank\" href=\"AttachDownload.aspx?bulid=" + rs["id"].ToString() + "&atnu=" + ati + "\"><font class='normal'>" + rs[rattname].ToString() + "</font></a>";
                            }
                            else
                            {
                                
                                CheckBox che = (CheckBox)cnt.FindControl(rname);
                                che.Visible = false;
                                che.Checked = false;
                            }
                        }
                        SqlDataSource1.SelectCommand = "SELECT bno, b.pmk01, pml02, pml04, pml041, pml41, CONVERT(varchar(12) , pml33, 111 ) pml33,CONVERT(varchar(12) , pml34, 111 ) pml34,CONVERT(varchar(12) , pml35, 111 ) pml35, pml20, pml07, ima021, pml12, pml121, pml122, pml40, aag02, pml67, gem02, pml06, pml31, pml88, ta_pml05,ta_pml01,ta_pml02,ta_pml06,ta_pml07,fab02,ta_pml08,fac02,ta_pml09,ta_pml10,ta_pml11,apb10_sum,oea01,oqa13  FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and a.id='" + Request.QueryString["id"] + "'"; //改變datalist的sql
                        //Response.Write("SELECT bno, b.pmk01, pml02, pml04, pml041, pml41, CONVERT(varchar(12) , pml33, 111 ) pml33,CONVERT(varchar(12) , pml34, 111 ) pml34,CONVERT(varchar(12) , pml35, 111 ) pml35, pml20, pml07, ima021, pml12, pml121, pml122, pml40, aag02, pml67, gem02, pml06 FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and a.id='" + Request.QueryString["id"] + "'");
                        this.GridView1.DataBind();

                        if (rs["STATUS"].ToString().Trim() == "退回" || rs["STATUS"].ToString().Trim() == "N")
                        {
                            this.AddWarning(this, "Page_Load()", "", "請記得將單據送審！");
                            BUTTON_SendRequest.Visible = true;
                            BUTTON_save.Enabled = true;
                            InputButton2.Enabled = true;



                        }
                        if ( rs["STATUS"].ToString().Trim() == "作廢")
                        {
                            BUTTON_SendRequest.Visible = false;
                            BUTTON_save.Enabled = false;

                        }

                        if (FIELD_computer.Text == "Y" && FIELD_mis.Text.Length == 0)
                        {
                            Response.Write("<script language='JavaScript'>window.alert('為電腦類者需選擇資訊人員');</script>");
                            
                        }
                        if (FIELD_computer.Text == "Y" && FIELD_computer_no.Text.Length == 0)
                        {
                            Response.Write("<script language='JavaScript'>window.alert('為電腦類者需填寫軟硬體申請單號');</script>");

                        }
                        if (FIELD_computer.Text == "N" && FIELD_computer_no.Text.Length != 0)
                        {
                            Response.Write("<script language='JavaScript'>window.alert('為電腦類者, 是否為電腦類需選Ｙ');</script>");

                        }
                        if (rs["STATUS"].ToString().Trim() == "送審中" || rs["STATUS"].ToString().Trim() == "Y")
                        {
                            //Response.Write(rs["STATUS"].ToString().Trim());
                            BUTTON_SendRequest.Visible = false;
                            BUTTON_save.Enabled = false;

                        }
                        if (FIELD_attachmentd1.Text == "")
                        {
                            this.Panel2.Visible = false;
                            this.Label3.Visible = false;
                        }
                        if (this.FIELD_lsend.Text == "")
                        {
                            //Response.Write("select b.id bid,b.uid uid,a.id aid,a.name,pid from dguser a left join dggroup b on a.gid=b.id  where logonid='" + this.CurrentUser.LogonID.ToString() + "' ");
                            SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs1.Open("select b.id bid,b.uid uid,a.id aid,a.name,pid from dguser a left join dggroup b on a.gid=b.id  where logonid='" + this.CurrentUser.LogonID.ToString() + "' ");
                            if (!rs1.EOF)
                            {

                                if (rs1["uid"].ToString() == rs1["aid"].ToString())
                                {
                                    SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                                    rs2.Open("select uid from dggroup where id='" + rs["pid"].ToString() + "'");
                                    // Response.Write("select uid from dggroup where id='" + rs["pid"].ToString() + "'");
                                    if (!rs2.EOF)
                                    {
                                        this.FIELD_lsend.Text = rs2["uid"].ToString();
                                    }
                                }
                                else
                                {
                                    this.FIELD_lsend.Text = rs1["uid"].ToString();
                                }

                            }
                            else
                            {
                                this.FIELD_lsend.Text = this.CurrentUser.LogonID.ToString();
                            }
                        }
                    }
                    else
                    {

                        //Response.Redirect("APMT420.aspx");
                        this.FIELD_lsend.Text = this.CurrentUser.ID.ToString();
                        //Response.Write (this.CurrentUser.LogonID.ToString());

                    }

                    if (this.CurrentUser.LogonID.ToLower() == "herzog.lin") BUTTON_save.Enabled = true;

                }
                catch
                {
                    //Response.Redirect("APMT420.aspx");
                    this.FIELD_lsend.Text = this.CurrentUser.ID.ToString();
                   // Response.Write(this.CurrentUser.LogonID.ToString());
                }



               
                

            }
           // this.FIELD_acc.Text = TextBox1.Text;

           // Response.Write(this.FIELD_acc.Text + "---");
		}
		catch
		{
			Response.Redirect("APMT420.aspx");
		}
	}

    public string Findfileicon(string p)
    {
        string iconName;

        switch (p)
        {
            case ".xls":
                iconName = "icon-excel.gif";
                break;
            case ".xlsx":
                iconName = "icon-excel.gif";
                break;
            case ".csv":
                iconName = "icon-excel.gif";
                break;
            case ".pdf":
                iconName = "icon-pdf.gif";
                break;
            case ".doc":
                iconName = "icon-word.gif";
                break;
            case ".docx":
                iconName = "icon-word.gif";
                break;
            case ".jpg":
                iconName = "icon-image.gif";
                break;
            default:
                iconName = "icon-attached.gif";
                break;
        };

        return iconName;
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


                if (FIELD_computer.Text == "Y" && FIELD_computer_no.Text.Length == 0)
                {
                    Response.Write("<script language='JavaScript'>window.alert('為電腦類者需選擇資訊人員');</script>");

                }
                if (FIELD_computer.Text == "N" && FIELD_computer_no.Text.Length != 0)
                {
                    Response.Write("<script language='JavaScript'>window.alert('為電腦類者, 是否為電腦類需選Ｙ');</script>");

                }
                else
                {
				    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rs.Open("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
                    //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
				    if (!rs.EOF)
				    {

                        rs["computer"] = this.FIELD_computer.Text;
                        rs["chemistry"] = this.FIELD_chemistry.Text;
                        rs["quick"] = this.FIELD_quick.Text;
                        rs["senduser"] = this.CurrentUser.ID;



                        if (this.FIELD_acc.Text != "") rs["acc"] = this.FIELD_acc.Text; else rs["acc"] = System.DBNull.Value;
                        if (this.FIELD_pur.Text != "") rs["pur"] = this.FIELD_pur.Text; else rs["pur"] = System.DBNull.Value;
                        if (this.FIELD_mis.Text != "") rs["mis"] = this.FIELD_mis.Text; else rs["mis"] = System.DBNull.Value;
                        if (this.FIELD_computer_no.Text != "") rs["computer_no"] = this.FIELD_computer_no.Text; else rs["computer_no"] = System.DBNull.Value;
                        if (this.FIELD_lsend.Text != "") rs["lsend"] = this.FIELD_lsend.Text; else rs["lsend"] = System.DBNull.Value;
                        if (this.FIELD_osend1.Text != "") rs["osend1"] = this.FIELD_osend1.Text; else rs["osend1"] = System.DBNull.Value;
                        if (this.FIELD_osend2.Text != "") rs["osend2"] = this.FIELD_osend2.Text; else rs["osend2"] = System.DBNull.Value;
                        if (this.FIELD_osend3.Text != "") rs["osend3"] = this.FIELD_osend3.Text; else rs["osend3"] = System.DBNull.Value;
                        if (this.FIELD_osend4.Text != "") rs["osend4"] = this.FIELD_osend4.Text; else rs["osend4"] = System.DBNull.Value;
                        if (this.FIELD_osend5.Text != "") rs["osend5"] = this.FIELD_osend5.Text; else rs["osend5"] = System.DBNull.Value;
                        

#region remove attachments

                        ContentPlaceHolder cnt;
                        cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");

                        for (int mfile = 1; mfile <= 6; mfile++)
                        {
                            string mdname = "FIELD_attachmentd" + mfile.ToString();
                            string mrname = "FIELD_attachmentr" + mfile.ToString();
                            String mtafilename = "filename" + mfile.ToString();
                            String mtaattach = "attachment" + mfile.ToString();
                            String mtafilext = "fileexten" + mfile.ToString();
                            CheckBox cek = (CheckBox)cnt.FindControl(mrname);

                            if (cek.Checked)
                            {
                                rs[mtafilename] = DBNull.Value;
                                rs[mtaattach] = DBNull.Value;
                                rs[mtafilext] = DBNull.Value;
                            }
                        }
                        #endregion
                        #region 動態新增
                        HttpFileCollection files = HttpContext.Current.Request.Files;
                        System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
                        //String uPath = "D:/Upload/";
                        //int att_count = 0;

                        for (int ifile = 0; ifile < files.Count; ifile++)
                        {
                            HttpPostedFile postedfile = files[ifile];
                            string filename, fileExt, filepath;
                            filename = System.IO.Path.GetFileName(postedfile.FileName);    //抓取文件名
                            fileExt = System.IO.Path.GetExtension(postedfile.FileName);    //抓取文件附檔名

                            //Response.Write(filename);

                            if (postedfile.ContentLength > 0)
                            {
                                for (int chnu = 1; chnu <= 6; chnu++)
                                {
                                    String fchnu = "filename" + chnu.ToString();
                                    String tchnu = "attachment" + chnu.ToString();
                                    String echnu = "fileexten" + chnu.ToString();
                                    if (rs[fchnu] == DBNull.Value)
                                    {
                                        byte[] fileBytes = new byte[postedfile.ContentLength];
                                        postedfile.InputStream.Read(fileBytes, 0, postedfile.ContentLength);
                                        rs[fchnu] = filename.ToString().Trim();
                                        rs[tchnu] = fileBytes;
                                        rs[echnu] = fileExt.ToString().Trim();
                                        //chnu = 5;
                                        break;
                                    }

                                }
                                //att_count = att_count + 1;
                                //String tafilename = "filename" + att_count.ToString();
                                //String taattach = "attachment" + att_count.ToString();
                                //byte[] fileBytes = new byte[postedfile.ContentLength];
                                //postedfile.InputStream.Read(fileBytes, 0, postedfile.ContentLength);
                                //rs[tafilename] = filename;
                                //rs[taattach] = fileBytes;

                                //postedfile.SaveAs(uPath + filename); //先暫時不存
                                //保存到指定的文件夹   
                                //postedFile.SaveAs(Server.MapPath("upedFile/") + fileName);   
                            }
                        }
                        #endregion
					    rs.Update();

                        
                        

				}
				rs.Close();
                Response.Redirect("APMT420Edit.aspx?id=" + Request.QueryString["id"]);
                }


                



			}
			catch (Exception ex)
			{
				this.AddError(this,"BUTTON_save_Click()","",ex.Message);
			}
            
		
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        this.GoBack("APMT420.aspx",new string[]{"APMT420Delete.aspx"});
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("APMT420Delete.aspx?no="+Request.QueryString["no"]);
	}




    protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {

       /*  SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rs.Open("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
        //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
        if (!rs.EOF)
        {

            rs["computer"] = this.FIELD_computer.Text;
            rs["chemistry"] = this.FIELD_chemistry.Text;
            rs["quick"] = this.FIELD_quick.Text;
            rs["senduser"] = this.CurrentUser.ID;
            if (this.FIELD_acc.Text != "") rs["acc"] = this.FIELD_acc.Text; else rs["acc"] = System.DBNull.Value;
            if (this.FIELD_pur.Text != "") rs["pur"] = this.FIELD_pur.Text; else rs["pur"] = System.DBNull.Value;
            if (this.FIELD_mis.Text != "") rs["mis"] = this.FIELD_mis.Text; else rs["mis"] = System.DBNull.Value;
            if (this.FIELD_computer_no.Text != "") rs["computer_no"] = this.FIELD_computer_no.Text; else rs["computer_no"] = System.DBNull.Value;
            if (this.FIELD_lsend.Text != "") rs["lsend"] = this.FIELD_lsend.Text; else rs["lsend"] = System.DBNull.Value;
            if (this.FIELD_osend1.Text != "") rs["osend1"] = this.FIELD_osend1.Text; else rs["osend1"] = System.DBNull.Value;
            if (this.FIELD_osend2.Text != "") rs["osend2"] = this.FIELD_osend2.Text; else rs["osend2"] = System.DBNull.Value;
            if (this.FIELD_osend3.Text != "") rs["osend3"] = this.FIELD_osend3.Text; else rs["osend3"] = System.DBNull.Value;
            if (this.FIELD_osend4.Text != "") rs["osend4"] = this.FIELD_osend4.Text; else rs["osend4"] = System.DBNull.Value;
            if (this.FIELD_osend5.Text != "") rs["osend5"] = this.FIELD_osend5.Text; else rs["osend5"] = System.DBNull.Value;
            #region remove attachments

            ContentPlaceHolder cnt;
            cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");

            for (int mfile = 1; mfile <= 5; mfile++)
            {
                string mdname = "FIELD_attachmentd" + mfile.ToString();
                string mrname = "FIELD_attachmentr" + mfile.ToString();
                String mtafilename = "filename" + mfile.ToString();
                String mtaattach = "attachment" + mfile.ToString();
                String mtafilext = "fileexten" + mfile.ToString();
                CheckBox cek = (CheckBox)cnt.FindControl(mrname);

                if (cek.Checked)
                {
                    rs[mtafilename] = DBNull.Value;
                    rs[mtaattach] = DBNull.Value;
                    rs[mtafilext] = DBNull.Value;
                }
            }
            #endregion
            #region 動態新增
            HttpFileCollection files = HttpContext.Current.Request.Files;
            System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
            //String uPath = "D:/Upload/";
            //int att_count = 0;

            for (int ifile = 0; ifile < files.Count; ifile++)
            {
                HttpPostedFile postedfile = files[ifile];
                string filename, fileExt, filepath;
                filename = System.IO.Path.GetFileName(postedfile.FileName);    //抓取文件名
                fileExt = System.IO.Path.GetExtension(postedfile.FileName);    //抓取文件附檔名

                //Response.Write(filename);

                if (postedfile.ContentLength > 0)
                {
                    for (int chnu = 1; chnu <= 5; chnu++)
                    {
                        String fchnu = "filename" + chnu.ToString();
                        String tchnu = "attachment" + chnu.ToString();
                        String echnu = "fileexten" + chnu.ToString();
                        if (rs[fchnu] == DBNull.Value)
                        {
                            byte[] fileBytes = new byte[postedfile.ContentLength];
                            postedfile.InputStream.Read(fileBytes, 0, postedfile.ContentLength);
                            rs[fchnu] = filename.ToString().Trim();
                            rs[tchnu] = fileBytes;
                            rs[echnu] = fileExt.ToString().Trim();
                            //chnu = 5;
                            break;
                        }

                    }
                       
                }
            }
            #endregion
            rs.Update();




        }

        */

            ArrayList countlevel = new ArrayList();

            //會計----------------------------------------------------------------------------
            countlevel.Add(this.FIELD_acc.Text);
            SmoothEnterprise.Database.DataSet rsax = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            //Response.Write("select pname,pid from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc' and no in (SELECT CASE WHEN pml04 IN ('MISC固資','MISC-雜項購置') THEN '2' ELSE '1' END ot_hr FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and b.pmk01='" + rs["pmk01"].ToString() + "' and pml02='1' AND a.plantid='" + rs["plantID"].ToString() + "')");
            //rsax.Open(" select pid from ERP_FLOW where ERP_NAME='apmt420' and DEP_NAME='ACC' "+
            //         " and NO in( "+
            //         " SELECT CASE pmk02 "+
            //         "  WHEN 'CAP:資產請購' THEN '1_2' "+
            //         "  ELSE '2_2' "+
            //         "  END pmk02 "+
            //         " FROM APMT420_IN_BODY b,APMT420_IN_HEAD a  " +
            //         " where a.pmk01=b.pmk01 and a.plantid=b.plantID and a.id='" + Request.QueryString["id"] + "')");
            //
           // rsax.Open("select pname,pid from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc' and no in (SELECT CASE WHEN pml04 IN ('MISC-固資','MISC-雜項購置','MISC-遞延費用') THEN '2_2' ELSE '1_2' END ot_hr FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and b.pmk01='" + rs["pmk01"].ToString() + "' and pml02='1' AND a.plantid='" + rs["plantID"].ToString() + "')");
         

            rsax.Open("select   pid from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc'  " +
                " and NO  like '" + HFCAP1.Value + "%'  and company='"+Company+"'   and   no not  in ('1','2') order by no asc  ");          
            while (!rsax.EOF)
            {
                //資料有可能有一天被會計拿掉,所以增加這個判斷
                if(rsax["pid"].ToString()!="")  countlevel.Add(rsax["pid"].ToString());


                rsax.MoveNext();
            }

            //--------------------------------------------------------------------------------




            //依金額決定簽至那裡-------------------------------------------------------------------------------------


            


            int costlevel=0;
            // 20120615 修改內稽簽核層級, 依sign_level table判斷(有內規另計)
           // Response.Write("select m_level from sign_level where PROGRAM='apmt420'  and plant='" + Company + "' and " + float.Parse(this.FIELD_l_amt2.Text) + ">cost1 and " + float.Parse(this.FIELD_l_amt2.Text) + "<=cost2");

            rsax.Open("select m_level from sign_level where PROGRAM='apmt420'  and plant='" + Company + "' and " + float.Parse(this.FIELD_l_amt2.Text) + ">cost1 and " + float.Parse(this.FIELD_l_amt2.Text) + "<=cost2");
             if (!rsax.EOF)
             {
                 costlevel = int.Parse(rsax["m_level"].ToString().Trim());

                 if (Company != "MAP")
                 {
                     if (float.Parse(this.FIELD_l_amt2.Text) <= 30000)
                     {
                         if (this.FIELD_gem02_4.Text.IndexOf("品保") != -1 || 
                             this.FIELD_gem02_4.Text.IndexOf("開發一部") != -1 ||
                             this.FIELD_gem02_4.Text.IndexOf("開發三部") != -1 ||
                             this.FIELD_gem02_4.Text.IndexOf("採購") != -1 || 
                             this.FIELD_gem02_4.Text.IndexOf("資材") != -1)
                         {
                             costlevel = 7; //簽經理
                         }
                         else
                         {
                             costlevel = 9; //大家都要簽到協理
                         }
                     }
                 }
             }

             Response.Write(costlevel + "--");

             //20120424 Alan經理說拿掉電腦類要簽到資深協理, 因發生3000塊的螢幕要簽到陳副總
             //20120716 Alan經理又說,10000塊以上要簽到協理
             if (FIELD_computer.Text == "Y" && float.Parse(this.FIELD_l_amt2.Text) >= 10000&& costlevel<=9)
             {
                 costlevel =9; //電腦類10000塊以上要簽到協理要簽到協理20120716
             }

             
            //---------------------------------------------------------------------------------------------------------
            string[] sb = new string[3];
            string[] ib = new string[3];
            // Response.Write("<br>"+costlevel+"<br>");
            int xx = 0;
            sb = getdeprtid(getdep(this.FIELD_lsend.Text));
            if (int.Parse(sb[1]) >= 10) //為協理級以上人員, 資訊在前面,  // 20120906 跨部門也是(品保sam要求)
            {

                //資訊----------------------------------------------------------------------------
                if (FIELD_computer.Text == "Y" && FIELD_mis.Text.Length != 0)
                {
                    countlevel.Add(this.FIELD_mis.Text);
                    countlevel.Add("D45938A7-3430-42EC-8BE6-0E1F391329E0");

                }
                //--------------------------------------------------------------------------------

                //跨部門--------------------------------------------------------------------------

                if (this.FIELD_osend1.Text != "") { countlevel.Add(this.FIELD_osend1.Text); } 
                if (this.FIELD_osend2.Text != "") { countlevel.Add(this.FIELD_osend2.Text); }
                if (this.FIELD_osend3.Text != "") { countlevel.Add(this.FIELD_osend3.Text); }
                if (this.FIELD_osend4.Text != "") { countlevel.Add(this.FIELD_osend4.Text); }
                if (this.FIELD_osend5.Text != "") { countlevel.Add(this.FIELD_osend5.Text); }

                //--------------------------------------------------------------------------------
                xx = 1;
                countlevel.Add(this.FIELD_lsend.Text);
            }
            else
            {

                countlevel.Add(this.FIELD_lsend.Text);
                //資訊----------------------------------------------------------------------------
                if (FIELD_computer.Text == "Y" && FIELD_mis.Text.Length != 0)
                {
                    countlevel.Add(this.FIELD_mis.Text);
                    countlevel.Add("D45938A7-3430-42EC-8BE6-0E1F391329E0");

                }
                //--------------------------------------------------------------------------------
                //跨部門--------------------------------------------------------------------------

                if (this.FIELD_osend1.Text != "") { countlevel.Add(this.FIELD_osend1.Text); } //跨部門
                if (this.FIELD_osend2.Text != "") { countlevel.Add(this.FIELD_osend2.Text); }
                if (this.FIELD_osend3.Text != "") { countlevel.Add(this.FIELD_osend3.Text); }
                if (this.FIELD_osend4.Text != "") { countlevel.Add(this.FIELD_osend4.Text); }
                if (this.FIELD_osend5.Text != "") { countlevel.Add(this.FIELD_osend5.Text); }
                if (this.FIELD_osend5.Text != "") { countlevel.Add(this.FIELD_osend5.Text); }

                //--------------------------------------------------------------------------------
                xx = 1;
            }


            //Response.Write(costlevel.ToString());
            //if (this.CurrentUser.LogonID.ToString() != "ivy1.you")
            //{ 

        	  SmoothEnterprise.Database.DataSet rsu = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
             rsu.Open("select lshort from dguser left join dglevel on levid=lnid where id='" + this.FIELD_lsend.Text + "'  ");
             if (!rsu.EOF)
             {

                 if (int.Parse(rsu["lshort"].ToString()) <= costlevel)
                 {

                     ib = getdeprtid(getdep(this.FIELD_lsend.Text));


                     if (countlevel.Contains(ib[0])) //判斷陣列中是否有重覆
                     {

                     }
                     else
                     {
                         countlevel.Add(ib[0]);
                         //Response.Write("<br>" + ib[0]);
                     }

                     if (this.CurrentUser.LogonID.ToString() == "herzog.lin1")
                     {
                         Response.Write("<br>---" + (ib[0]));
                         Response.Write("<br>---" + (ib[1]));
                         Response.Write("<br>---" + (ib[2]));

                     }

                     int resc = 0;
                     while (int.Parse(ib[1]) <= costlevel)
                     {  //層級不夠需重跑
                         ib = getdeprtid(ib[2]);
                         //Response.Write("<br>---" + costlevel.ToString()+"----"+(ib[0]));
                         //Response.Write("---" + (ib[1]));
                         //Response.Write("---" + (ib[2]));

                         if (countlevel.Contains(ib[0])) //判斷陣列中是否有重覆
                         {

                         }
                         else
                         {

                             if (xx != 1)
                             {
                                 if (int.Parse(ib[1]) >= 10) //判斷層級
                                 {
                                     //資訊----------------------------------------------------------------------------
                                     if (FIELD_computer.Text == "Y" && FIELD_mis.Text.Length != 0)
                                     {
                                         countlevel.Add(this.FIELD_mis.Text);
                                         countlevel.Add("D45938A7-3430-42EC-8BE6-0E1F391329E0");

                                     }
                                     //--------------------------------------------------------------------------------
                                     xx = 1;

                                 }
                             }
                             countlevel.Add(ib[0]);
                             //Response.Write("<br>"+ib[0]);
                         }
                         //resc++;
                         //if (resc > 7) break;
                     }
                 }
             }

             // 20130717 100001~1000000 加入財務長

             if (float.Parse(this.FIELD_l_amt2.Text) >= 100001 )
             {
                 int nIndex = countlevel.IndexOf("63D0329E-F4C2-44C6-950C-92174D233BED");  //尋找是否有謝先生
                 int nIndex2 = countlevel.IndexOf("63d0329e-f4c2-44c6-950c-92174d233bed");  //尋找是否有謝先生
                 //Response.Write("<br>*******"+nIndex);
                 if (nIndex>=1 || nIndex2 >=1)
                 {
                     countlevel.Remove("63D0329E-F4C2-44C6-950C-92174D233BED");  //刪除謝先生後重新加入
                     countlevel.Remove("63d0329e-f4c2-44c6-950c-92174d233bed");  //刪除謝先生後重新加入

                     countlevel.Add("09EF664C-22AB-43F1-A16E-729CF1C1FD68");
                     countlevel.Add("63D0329E-F4C2-44C6-950C-92174D233BED"); 

                 }
                 else
                 {
                     countlevel.Add("09EF664C-22AB-43F1-A16E-729CF1C1FD68"); //加入秀珍

                 }

             }

             // 2013071710 小於等於1000000 刪除謝先生 並且部門代號不能是自己部門
             
             // if (float.Parse(this.FIELD_l_amt2.Text) <= 1000000 )  
             if ((float.Parse(this.FIELD_l_amt2.Text) <= 1000000 ) && (FIELD_pmk13.Text!="11100"))
             {
                 countlevel.Remove("63D0329E-F4C2-44C6-950C-92174D233BED");  //刪除謝先生 
                 countlevel.Remove("63d0329e-f4c2-44c6-950c-92174d233bed");  //刪除謝先生 

             }


             if (FIELD_no.Text == "A2015080178")
             {

               //  countlevel.Add("09EF664C-22AB-43F1-A16E-729CF1C1FD68");
                 countlevel.Add("09EF664C-22AB-43F1-A16E-729CF1C1FD68");

             }


            if (this.FIELD_pur.Text != "") { countlevel.Add(this.FIELD_pur.Text); } //採購
            int count = 1;
            this.BUTTON_SendRequest.Flow = this.FlowClient5;
            this.InputButton2.Enabled = false;

            string title = "ERP請購單-"+ FIELD_pmk01.Text;


                switch (countlevel.Count)
                {
                    case 4:
                        this.BUTTON_SendRequest.Flow = this.FlowClient4;
                    FlowClient4.Text = title;
                        foreach (string i in countlevel)
                        {
                            //Response.Write("USER" + count.ToString() + "---" + i + "<br>");
                            this.FlowClient4.AddParameter("USER" + count.ToString(), i);
                            count++;
                        }
                        break;
                    case 5:
                        this.BUTTON_SendRequest.Flow = this.FlowClient5;
                    FlowClient5.Text = title;
                        foreach (string i in countlevel)
                        {
                            //Response.Write("USER" + count.ToString() + "---" + i + "<br>");
                            this.FlowClient5.AddParameter("USER" + count.ToString(), i);
                            count++;
                        }
                        break;
                    case 6:
                        this.BUTTON_SendRequest.Flow = this.FlowClient6;
                    FlowClient6.Text = title;
                        foreach (string i in countlevel)
                        {
                            //Response.Write("USER" + count.ToString() + "---" + i + "<br>");
                            this.FlowClient6.AddParameter("USER" + count.ToString(), i);
                            count++;
                        }
                        break;
                    case 7:
                        this.BUTTON_SendRequest.Flow = this.FlowClient7;
                    FlowClient7.Text = title;
                        foreach (string i in countlevel)
                        {
                            //Response.Write("USER" + count.ToString() + "---" + i + "<br>");
                            this.FlowClient7.AddParameter("USER" + count.ToString(), i);
                            count++;
                        }
                        break;
                    case 8:
                        this.BUTTON_SendRequest.Flow = this.FlowClient8;
                    FlowClient8.Text = title;
                        foreach (string i in countlevel)
                        {
                            //Response.Write("USER" + count.ToString() + "---" + i + "<br>");
                            this.FlowClient8.AddParameter("USER" + count.ToString(), i);
                            count++;
                        }
                        break;
                    case 9:
                        this.BUTTON_SendRequest.Flow = this.FlowClient9;
                    FlowClient9.Text = title;
                        foreach (string i in countlevel)
                        {
                            //Response.Write("USER" + count.ToString() + "---" + i + "<br>");
                            this.FlowClient9.AddParameter("USER" + count.ToString(), i);
                            count++;
                        }
                        break;
                    case 10:
                        this.BUTTON_SendRequest.Flow = this.FlowClient10;
                    FlowClient10.Text = title;
                        foreach (string i in countlevel)
                        {
                            //Response.Write("USER" + count.ToString() + "---" + i + "<br>");
                            this.FlowClient10.AddParameter("USER" + count.ToString(), i);
                            count++;
                        }
                        break;
                    case 11:
                        this.BUTTON_SendRequest.Flow = this.FlowClient11;
                    FlowClient11.Text = title;
                        foreach (string i in countlevel)
                        {
                            //Response.Write("USER" + count.ToString() + "---" + i + "<br>");
                            this.FlowClient11.AddParameter("USER" + count.ToString(), i);
                            count++;
                        }
                        break;
                    case 12:
                        this.BUTTON_SendRequest.Flow = this.FlowClient12;
                    FlowClient12.Text = title;
                        foreach (string i in countlevel)
                        {
                            //Response.Write("USER" + count.ToString() + "---" + i + "<br>");
                            this.FlowClient12.AddParameter("USER" + count.ToString(), i);
                            count++;
                        }
                        break;
                    case 13:
                        this.BUTTON_SendRequest.Flow = this.FlowClient13;
                    FlowClient13.Text = title;
                        foreach (string i in countlevel)
                        {
                            //Response.Write("USER" + count.ToString() + "---" + i + "<br>");
                            this.FlowClient13.AddParameter("USER" + count.ToString(), i);
                            count++;
                        }
                        break;
                    default:
                        //Response.Write("有問題");
                        break;
                }
           // }
            SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rb.Open("SELECT * FROM apmt420_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
            while (!rb.EOF)
            {
                rb["STATUS"] = "送審中";


                rb.Update();
                rb.MoveNext();

            }
            rb.Close();
            //發信測試------------------------------------------
            //if (this.CurrentUser.LogonID.ToString() == "ann.lin")
            //{
            //Response.Write(this.CurrentUser.LogonID.ToString());

            SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
            rss.Open("select * from dguser where id='" + this.FIELD_acc.Text + "' ");
            if (!rss.EOF)
            {
                if (this.FIELD_quick.Text == "Y")
                {
                    quick = "  --急件";

                }

                MyLibrary_apmt420 Backsend = new MyLibrary_apmt420();
                Backsend.RunMailProcess("/ERP_APMT420/APMT420view.aspx?id=" + Request.QueryString["id"],
                rss["name"].ToString(), rss["email"].ToString(), "請購單" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + quick.ToString());  //link,name,who mail,titel

                //發給余小姐
                MyLibrary_apmt420 Backsend1 = new MyLibrary_apmt420();
                Backsend1.RunMailProcess("/ERP_APMT420/APMT420view.aspx?id=" + Request.QueryString["id"],
                "余奇珍", "tina.yu@minaik.com.tw", "請購單" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + quick.ToString());  //link,name,who mail,titel



                #region 代理人
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs2.Open(" SELECT b.name name,email FROM dguserdeputy a left join dguser b on a.deputyuid=b.id left join dgflow c on a.sid=c.id  " +
                         " where  a.uid='" + rss["id"].ToString() + "'  " +
                         " and  " +
                         " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                         " (c.typename like 'ERP_FLOW%' and sdate < GETDATE() and edate is null) or " +
                         " (c.typename like 'ERP_FLOW%' and sdate < GETDATE() and edate > GETDATE()) or " +
                         "  a.sid is null and sdate < GETDATE() and edate  > GETDATE()) group by b.name,email ");
                while (!rs2.EOF)
                {
                    //MyLibrary_AXMT610 Backsend = new MyLibrary_AXMT610();

                    Backsend.RunMailProcess("/ERP_APMT420/APMT420view.aspx?id=" + Request.QueryString["id"],
                    rs2["name"].ToString(), rs2["email"].ToString(), "請購單" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + quick.ToString());  //link,name,who mail,titel
                    rs2.MoveNext();

                }
                rs2.Close();

                #endregion


            }
            //Response.Write("select requesturl,b.name name from dgflowqueue a left join dguser b on revieweruid=b.id where requesturl like '%" + Request.QueryString["id"] + "'  AND reviewdate IS NULL AND qseq is not null ");
            //}
            //發信測試------------------------------------------
        

    }



     private string[] getdeprtid(string ID)
    {
       
        string[] rid = new string[3];
        if (ID != "")
        {
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            ds.Open("select uid,levid,lshort,pid  from dggroup a left join dguser b on uid=b.id " +
                    " left join dglevel on levid=lnid where a.id='" + ID + "'");
            if (!ds.EOF)
            {

                rid[0] = ds["uid"].ToString(); //簽核人員id
                rid[1] = ds["lshort"].ToString();//簽核人員層級
                rid[2] = ds["pid"].ToString();//該簽核人員部門id
            }
             
        }
        else
        {
            rid[0] = "086A8CAD-4D68-4367-9994-FE8460AE7DA9";
            rid[1] = "14";
            rid[2] = "3F07E76C-CD8E-4F0C-AE0C-032FDBFD8E8A";
        } 
        return rid;
    }

    private string getleaderid_1(string ID)
    {

        string ridd="" ;
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        ds.Open("select uid from dguser a left join dggroup b on a.gid=b.id where a.id='" + ID + "'");
        if (!ds.EOF)
        {

            ridd = ds["uid"].ToString();

        }
        return ridd;


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
        rb.Open("SELECT * FROM apmt420_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
        while (!rb.EOF)
        {
            rb["STATUS"] = "N";


            rb.Update();
            rb.MoveNext();

        }
        rb.Close();

        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rs.Open("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
        if (!rs.EOF)  this.FIELD_acc.Text = rs["acc"].ToString();
        rs.Close();


        BUTTON_SendRequest.Visible = true;
        BUTTON_save.Enabled = true;
        InputButton2.Enabled = true;
    }

    //protected override void LoadViewState(object savedState)
    //{
    //    base.LoadViewState(savedState);
    //    if (ViewState["controsladded"] == null)
    //        AddControls();
    //}

    //private void AddControls()
    //{
    //    TextBox dynamictextbox = new TextBox();
    //    dynamictextbox.Text = "(Enter some text)";
    //    dynamictextbox.ID = "dynamictextbox";
    //    Button dynamicbutton = new Button();
    //    dynamicbutton.Click += new System.EventHandler(dynamicbutton_Click);
    //    dynamicbutton.Text = "Dynamic Button";
    //    Panel_LISEPOP.Controls.Add(dynamictextbox);
    //    Panel_LISEPOP.Controls.Add(new LiteralControl("<BR>"));
    //    Panel_LISEPOP.Controls.Add(new LiteralControl("<BR>"));
    //    Panel_LISEPOP.Controls.Add(dynamicbutton);
    //    ViewState["controlsadded"] = true;
    //}

    //private void dynamicbutton_Click(Object sender, System.EventArgs e)
    //{
    //    TextBox tb = new TextBox();
    //    tb = (TextBox)(Panel_LISEPOP.FindControl("dynamictextbox"));
    //    Label1.Text = tb.Text;
    //}

    public class Global 
{ 
    public static int iVars = 0; 
} 

    



    protected void Button1_Click(object sender, EventArgs e)
    {
        //if (Global.iVars == 2)
        //{
        //    SmoothEnterprise.Security.UI.WebControl.PopupUser myBox = new SmoothEnterprise.Security.UI.WebControl.PopupUser();
        //    Global.iVars = Global.iVars + 1;
        //    Response.Write(Global.iVars);
        //    myBox.ID = "FIELD_osenda" + Global.iVars;
        //    myBox.DisplayField = "name";
        //    myBox.FormatValueField = "logonid";
        //    myBox.FormatType = SmoothEnterprise.Security.UI.WebControl.PopupUser.FormatTypes.InputCombo;
        //    myBox.ValueField = "id";
        //    this.Panel_LISEPOP.Controls.Add(myBox);
        //}
        if (FIELD_osend2.Visible == true)
        {
            if (FIELD_osend3.Visible == true)
            {
                if (FIELD_osend4.Visible == true)
                {
                    if (FIELD_osend5.Visible == true)
                    {
                        
                    }
                    else
                    {
                        this.FIELD_osend5.Visible = true;
                    }
                }
                else
                {
                    this.FIELD_osend4.Visible = true;
                }
            }
            else
            {
                this.FIELD_osend3.Visible = true;
            }
        }
        else
        {
            this.FIELD_osend2.Visible = true;

        }

        FIELD_acc.Text = TextBox1.Text;
    }


    protected void InputButton1_Click(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rs.Open("select a.*, b.name requestname, b.email,c.no no,b.id bid from dgflowqueue a left join dguser b on a.revieweruid = b.id " +
                "left join apmt420_IN_HEAD c on c.id= '" + Request.QueryString["id"] + "' " +
                "where requesturl like '%id=" + Request.QueryString["id"] + "' and revieweruid <> " +
                "'" + System.Guid.Empty.ToString() + "' and reviewdate is null ");
        if (!rs.EOF)
        {
            if (this.FIELD_quick.Text == "Y")
            {
                quick = "  --急件";

            }
            MyLibrary_apmt420 Backsend = new MyLibrary_apmt420();
            Backsend.RunMailProcess("/ERP_APMT420/APMT420view.aspx?id=" + Request.QueryString["id"],
            rs["requestname"].ToString(), rs["email"].ToString(), " 請購單號:" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + quick.ToString());  //link,name,who mail,titel


            #region 代理人
            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs2.Open(" SELECT name,email FROM dguserdeputy a left join dguser b on a.deputyuid=b.id " +
                     " where  a.uid='" + rs["bid"].ToString() + "'  " +
                     " and  " +
                     " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                     " (a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and sdate < GETDATE() and edate is null) or " +
                     " (a.sid='1F7EBCF7-D202-4866-8C86-53A7D74D624B' and sdate < GETDATE() and edate > GETDATE()) or " +
                     "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by name,email ");
            while (!rs2.EOF)
            {
                //MyLibrary_apmt420 Backsend = new MyLibrary_apmt420();
                Backsend.RunMailProcess("/ERP_APMT420/APMT420view.aspx?id=" + Request.QueryString["id"],
                rs2["name"].ToString(), rs2["email"].ToString(), " 請購單號:" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + quick.ToString());  //link,name,who mail,titel
                rs2.MoveNext();
            }
            rs2.Close();

            #endregion
        }
    }
    protected void InputButton2_Click(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rb.Open("SELECT * FROM apmt420_in_head WHERE id='" + Request.QueryString["id"] + "'  ");
        while (!rb.EOF)
        {
            rb["STATUS"] = "退回";


            rb.Update();
            rb.MoveNext();

        }
        rb.Close();


        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rs.Open("select plantid,pmk01,b.empid purempid,c.name username,c.email usermail from apmt420_in_head a left join dguser b on  pur=b.id left join dguser c on senduser=c.id WHERE a.id='" + Request.QueryString["id"] + "' ");
        if (!rs.EOF)
        {
            FileStream fs = new FileStream(@"D:\APMT420_XML\4GL\" + rs["plantid"].ToString() + "_apmt420_" + rs["pmk01"].ToString() + ".txt", FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);
            sw.WriteLine("\"" + rs["plantid"].ToString() + "\",\"apmt420\",\"" + rs["pmk01"].ToString() + "\",\"N\",\"\"");
            sw.Close();
            fs.Close();
            Upload("D:\\APMT420_XML\\4GL\\" + rs["plantid"].ToString() + "_apmt420_" + rs["pmk01"].ToString() + ".txt", "ftp://192.168.0.250/" + rs["plantid"].ToString() + "_APMT420_" + rs["pmk01"].ToString() + ".txt", "4gl", "4gl");

            Response.Redirect("APMT420.aspx");
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        ArrayList countlevel = new ArrayList();

        //會計----------------------------------------------------------------------------
        countlevel.Add(this.FIELD_acc.Text);
        SmoothEnterprise.Database.DataSet rsax = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //Response.Write("select pname,pid from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc' and no in (SELECT CASE WHEN pml04 IN ('MISC固資','MISC-雜項購置') THEN '2' ELSE '1' END ot_hr FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and b.pmk01='" + rs["pmk01"].ToString() + "' and pml02='1' AND a.plantid='" + rs["plantID"].ToString() + "')");
        rsax.Open(" select pid from ERP_FLOW where ERP_NAME='apmt420' and DEP_NAME='ACC' " +
                 " and NO in( " +
                 " SELECT CASE pmk02 " +
                 "  WHEN 'CAP:資產請購' THEN '1_2' " +
                 "  ELSE '2_2' " +
                 "  END pmk02 " +
                 " FROM APMT420_IN_BODY b,APMT420_IN_HEAD a  " +
                 " where a.pmk01=b.pmk01 and a.plantid=b.plantID and a.id='" + Request.QueryString["id"] + "')");
        if (!rsax.EOF)
        {

            countlevel.Add(rsax["pid"].ToString());

        }

        //--------------------------------------------------------------------------------




        //依金額決定簽至那裡-------------------------------------------------------------------------------------





        int costlevel = 0;
        // 20120615 修改內稽簽核層級, 依sign_level table判斷(有內規另計)

        rsax.Open("select m_level from sign_level where PROGRAM='apmt420' and " + float.Parse(this.FIELD_l_amt2.Text) + ">cost1 and " + float.Parse(this.FIELD_l_amt2.Text) + "<=cost2");
        if (!rsax.EOF)
        {
            costlevel = int.Parse(rsax["m_level"].ToString().Trim());
            if (float.Parse(this.FIELD_l_amt2.Text) <= 30000)
            {
                if (this.FIELD_gem02_4.Text.IndexOf("品保") != -1 || this.FIELD_gem02_4.Text.IndexOf("開發一部") != -1 || this.FIELD_gem02_4.Text.IndexOf("採購") != -1 || this.FIELD_gem02_4.Text.IndexOf("資材") != -1)
                {
                    costlevel = 7; //簽經理
                }
                else
                {
                    costlevel = 9; //大家都要簽到協理
                }
            }
        }

        //20120424 Alan經理說拿掉電腦類要簽到資深協理, 因發生3000塊的螢幕要簽到陳副總
        //20120716 Alan經理又說,10000塊以上要簽到協理
        if (FIELD_computer.Text == "Y" && float.Parse(this.FIELD_l_amt2.Text) >= 10000 && costlevel <= 9)
        {
            costlevel = 9; //電腦類10000塊以上要簽到協理要簽到協理20120716
        }


        //---------------------------------------------------------------------------------------------------------
        string[] sb = new string[3];
        string[] ib = new string[3];
        // Response.Write("<br>"+costlevel+"<br>");
        int xx = 0;
        sb = getdeprtid(getdep(this.FIELD_lsend.Text));
        if (int.Parse(sb[1]) >= 10) //為協理級以上人員, 資訊在前面,  // 20120906 跨部門也是(品保sam要求)
        {

            //資訊----------------------------------------------------------------------------
            if (FIELD_computer.Text == "Y" && FIELD_mis.Text.Length != 0)
            {
                countlevel.Add(this.FIELD_mis.Text);
                countlevel.Add("D45938A7-3430-42EC-8BE6-0E1F391329E0");

            }
            //--------------------------------------------------------------------------------

            //跨部門--------------------------------------------------------------------------

            if (this.FIELD_osend1.Text != "") { countlevel.Add(this.FIELD_osend1.Text); }
            if (this.FIELD_osend2.Text != "") { countlevel.Add(this.FIELD_osend2.Text); }
            if (this.FIELD_osend3.Text != "") { countlevel.Add(this.FIELD_osend3.Text); }
            if (this.FIELD_osend4.Text != "") { countlevel.Add(this.FIELD_osend4.Text); }
            if (this.FIELD_osend5.Text != "") { countlevel.Add(this.FIELD_osend5.Text); }

            //--------------------------------------------------------------------------------
            xx = 1;
            countlevel.Add(this.FIELD_lsend.Text);
        }
        else
        {

            countlevel.Add(this.FIELD_lsend.Text);
            //資訊----------------------------------------------------------------------------
            if (FIELD_computer.Text == "Y" && FIELD_mis.Text.Length != 0)
            {
                countlevel.Add(this.FIELD_mis.Text);
                countlevel.Add("D45938A7-3430-42EC-8BE6-0E1F391329E0");

            }
            //--------------------------------------------------------------------------------
            //跨部門--------------------------------------------------------------------------

            if (this.FIELD_osend1.Text != "") { countlevel.Add(this.FIELD_osend1.Text); } //跨部門
            if (this.FIELD_osend2.Text != "") { countlevel.Add(this.FIELD_osend2.Text); }
            if (this.FIELD_osend3.Text != "") { countlevel.Add(this.FIELD_osend3.Text); }
            if (this.FIELD_osend4.Text != "") { countlevel.Add(this.FIELD_osend4.Text); }
            if (this.FIELD_osend5.Text != "") { countlevel.Add(this.FIELD_osend5.Text); }

            //--------------------------------------------------------------------------------
            xx = 1;
        }




        SmoothEnterprise.Database.DataSet rsu = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rsu.Open("select lshort from dguser left join dglevel on levid=lnid where id='" + this.FIELD_lsend.Text + "'  ");
        if (!rsu.EOF)
        {

            if (int.Parse(rsu["lshort"].ToString()) <= costlevel)
            {

                ib = getdeprtid(getdep(this.FIELD_lsend.Text));


                if (countlevel.Contains(ib[0])) //判斷陣列中是否有重覆
                {

                }
                else
                {
                    countlevel.Add(ib[0]);
                    //Response.Write("<br>" + ib[0]);
                }

                if (this.CurrentUser.LogonID.ToString() == "ann.lin")
                {
                    Response.Write("<br>---" + (ib[0]));
                    Response.Write("<br>---" + (ib[1]));
                    Response.Write("<br>---" + (ib[2]));

                }

                int resc = 0;
                while (int.Parse(ib[1]) <= costlevel)
                {  //層級不夠需重跑
                    ib = getdeprtid(ib[2]);

                    if (countlevel.Contains(ib[0])) //判斷陣列中是否有重覆
                    {

                    }
                    else
                    {

                        if (xx != 1)
                        {
                            if (int.Parse(ib[1]) >= 10) //判斷層級
                            {
                                //資訊----------------------------------------------------------------------------
                                if (FIELD_computer.Text == "Y" && FIELD_mis.Text.Length != 0)
                                {
                                    countlevel.Add(this.FIELD_mis.Text);
                                    countlevel.Add("D45938A7-3430-42EC-8BE6-0E1F391329E0");

                                }
                                //--------------------------------------------------------------------------------
                                xx = 1;

                            }
                        }
                        countlevel.Add(ib[0]);
                        //Response.Write("<br>"+ib[0]);
                    }
                    //resc++;
                    //if(resc>=6) break;
                     
                }
            }
        }

        // 20130717 100001~1000000 加入財務長

        if (float.Parse(this.FIELD_l_amt2.Text) >= 100001)
        {
            int nIndex = countlevel.IndexOf("63D0329E-F4C2-44C6-950C-92174D233BED");  //尋找是否有謝先生
            int nIndex2 = countlevel.IndexOf("63d0329e-f4c2-44c6-950c-92174d233bed");  //尋找是否有謝先生
            Response.Write("<br>*******" + nIndex);
            if (nIndex >= 1 || nIndex2 >= 1)
            {
                countlevel.Remove("63D0329E-F4C2-44C6-950C-92174D233BED");  //刪除謝先生後重新加入
                countlevel.Remove("63d0329e-f4c2-44c6-950c-92174d233bed");  //刪除謝先生後重新加入

                countlevel.Add("09EF664C-22AB-43F1-A16E-729CF1C1FD68");
                countlevel.Add("63D0329E-F4C2-44C6-950C-92174D233BED");

            }
            else
            {
                countlevel.Add("09EF664C-22AB-43F1-A16E-729CF1C1FD68"); //加入曉毓財務長

            }

        }

        // 2013071710 小於等於1000000 刪除謝先生
        if (float.Parse(this.FIELD_l_amt2.Text) <= 1000000)
        {
            countlevel.Remove("63D0329E-F4C2-44C6-950C-92174D233BED");  //刪除謝先生 
            countlevel.Remove("63d0329e-f4c2-44c6-950c-92174d233bed");  //刪除謝先生 

        }

        //DBTransfer fs = new DBTransfer();
        //for (int i = 0; i <countlevel.Count ; i++)
        //{
        //    str = fs.GetTopfile("select name from dguser where id='" + countlevel[i].ToString() + "'");
        //    Response.Write(countlevel[i].ToString()+"--"+str  );
        //}


    }




}

}