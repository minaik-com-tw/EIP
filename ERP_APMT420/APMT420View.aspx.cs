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
using System.IO;
using SmoothEnterprise.Web.UI.HTMLControl;
using System.Net;

namespace ERP_APMT420
{
    public partial class APMT420View : SmoothEnterprise.Web.Page
    {
        private bool _NotifyReview = false;
        private string quick = "";
        protected void Page_Load(object sender, System.EventArgs e)
        {
            //Page.Title = "APMT420 View Page";
            if (!this.IsPostBack)
            {
                try
                {
                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                    rs.Open("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                    if (!rs.EOF)
                    {

                        this.FIELD_no.Text = rs["no"].ToString();
                        //this.FIELD_plantID.Text = rs["plantID"].ToString();
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
                        this.FIELD_pur.Text = rs["pur"].ToString();
                        this.FIELD_mis.Text = rs["mis"].ToString();
                        this.FIELD_lsend.Text = rs["lsend"].ToString();
                        this.FIELD_osend1.Text = rs["osend1"].ToString();
                        this.FIELD_osend2.Text = rs["osend2"].ToString();
                        this.FIELD_osend3.Text = rs["osend3"].ToString();
                        this.FIELD_osend4.Text = rs["osend4"].ToString();
                        this.FIELD_osend5.Text = rs["osend5"].ToString();
                        this.FIELD_computer.Text = rs["computer"].ToString().Trim();
                        this.FIELD_chemistry.Text = rs["chemistry"].ToString().Trim();
                        this.FIELD_QUICK.Text = rs["QUICK"].ToString().Trim();
                        this.FIELD_computer_no.Text = rs["computer_no"].ToString();
                        this.GridView1.RowStyle.Height = 10;

                        if (rs["computer_no"].ToString() != "")
                        {
                            HyperLink1.Text = rs["computer_no"].ToString();
                            DBTransfer miscon = new DBTransfer();
                            string sn = miscon.GetTopfile("SELECT  rowid   FROM [EIPA].[dbo].[misepapers] a " +
                                "   where  Rpapsn='" + rs["computer_no"].ToString() + "'");
                            HyperLink1.NavigateUrl = "/MISReport/WFH0007view.aspx?rowid=" + sn;

                        }


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
                                Label4.Visible = false;
                            }
                        }
                        SqlDataSource1.SelectCommand = "SELECT bno, b.pmk01, pml02, pml04, pml041, pml41, CONVERT(varchar(12) , pml33, 111 ) pml33,CONVERT(varchar(12) , pml34, 111 ) pml34,CONVERT(varchar(12) , pml35, 111 ) pml35, pml20, pml07, ima021, pml12, pml121, pml122, pml40, aag02, pml67, gem02, pml06, pml31, round(pml88,0) pml88, ta_pml05, ta_pml01, ta_pml02, ta_pml06,ta_pml07,fab02,ta_pml08,fac02,ta_pml09,ta_pml10,ta_pml11,apb10_sum,oea01,oqa13 FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and a.id='" + Request.QueryString["id"] + "'"; //改變datalist的sql
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               //Response.Write("SELECT bno, b.pmk01, pml02, pml04, pml041, pml41, CONVERT(varchar(12) , pml33, 111 ) pml33,CONVERT(varchar(12) , pml34, 111 ) pml34,CONVERT(varchar(12) , pml35, 111 ) pml35, pml20, pml07, ima021, pml12, pml121, pml122, pml40, aag02, pml67, gem02, pml06 FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and a.id='" + Request.QueryString["id"] + "'");
                        this.GridView1.DataBind();
                    }
                    else
                    {
                        Response.Redirect("APMT420.aspx");
                    }
                }
                catch
                {
                    Response.Redirect("APMT420.aspx");
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
        protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
        {
            Utility.log(1, "ERP_APMT420", e.ResultType.ToString(), CurrentUser.Name);
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete)
            {
                //審核通過要執行的程式碼
                try
                {
                    string sqlstr = "";
                    sqlstr = "SELECT * FROM APMT420_IN_HEAD where id='" + Request.QueryString["id"] + "'";
                    SmoothEnterprise.Database.DataSet ds;
                    ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    ds.Open(sqlstr);

                    if (!ds.EOF)
                    {
                        ds["STATUS"] = "Y";
                        ds.Update();
                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                        rs.Open("select plantid,pmk01,b.empid purempid,c.name username,c.email usermail from apmt420_in_head a left join dguser b on  pur=b.id left join dguser c on senduser=c.id WHERE a.id='" + Request.QueryString["id"] + "' ");
                        if (!rs.EOF)
                        {
                            FileStream fs = new FileStream(@"D:\APMT420_XML\4GL\" + rs["plantid"].ToString() + "_apmt420_" + rs["pmk01"].ToString() + ".txt", FileMode.Create, FileAccess.Write);
                            StreamWriter sw = new StreamWriter(fs);
                            sw.WriteLine("\"" + rs["plantid"].ToString() + "\",\"apmt420\",\"" + rs["pmk01"].ToString() + "\",\"Y\",\"" + rs["purempid"].ToString() + "\"");
                            sw.Close();
                            fs.Close();
                            Upload("D:\\APMT420_XML\\4GL\\" + rs["plantid"].ToString() + "_apmt420_" + rs["pmk01"].ToString() + ".txt", "ftp://192.168.0.250/" + rs["plantid"].ToString() + "_APMT420_" + rs["pmk01"].ToString() + ".txt", "4gl", "4gl");



                            //發信測試------------------------------------------
                            SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                            //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                            rss.Open("select * from dguser where name='" + this.FIELD_gen02_3.Text + "' ");
                            if (!rss.EOF)
                            {
                                if (rs["usermail"].ToString() == "" || rs["usermail"].ToString() == rss["email"].ToString())
                                {
                                    MyLibrary_apmt420 Backsend = new MyLibrary_apmt420();
                                    Backsend.RunMailProcess("/ERP_APMT420/APMT420view.aspx?id=" + Request.QueryString["id"],
                                    rss["name"].ToString(), rss["email"].ToString(), "請購單" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + "  ,結果為:完成審核");  //link,name,who mail,titel
                                                                                                                                                                       //Response.Write("/ERP_APMT420/APMT420Edit.aspx?id=" + Request.QueryString["id"] + "<br>" + rss["name"].ToString() + "<br>" + rss["email"].ToString() + "<br>" + " 請購單號:" + this.FIELD_pmk01.Text + "<br>" + " 廠商:" + this.FIELD_pmc03.Text + "<br>");
                                }
                                else
                                {
                                    MyLibrary_apmt420 Backsend = new MyLibrary_apmt420();
                                    Backsend.RunMailProcess("/ERP_APMT420/APMT420view.aspx?id=" + Request.QueryString["id"],
                                    rss["name"].ToString(), rss["email"].ToString(), "請購單" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + "  ,結果為:完成審核");  //link,name,who mail,titel

                                    MyLibrary_apmt420 Backsend1 = new MyLibrary_apmt420();
                                    Backsend1.RunMailProcess("/ERP_APMT420/APMT420view.aspx?id=" + Request.QueryString["id"],
                                    rs["username"].ToString(), rs["usermail"].ToString(), "請購單" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + "  ,結果為:完成審核");  //link,name,who mail,titel



                                }
                            }
                            //發信測試------------------------------------------

                            if (this.FIELD_chemistry.Text == "Y")
                            {
                                SmoothEnterprise.Database.DataSet rsx = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                                rsx.Open("select b.name name,b.id id,b.email email from ERP_FLOW a left join dguser b on a.PID=b.id WHERE ERP_NAME='apmt420' and DEP_NAME='GAD'");
                                while (!rsx.EOF)
                                {
                                    MyLibrary_apmt420 Backsenda = new MyLibrary_apmt420();
                                    Backsenda.RunMailProcess("/ERP_APMT420/APMT420view.aspx?id=" + Request.QueryString["id"],
                                    rsx["name"].ToString(), rsx["email"].ToString(), "請購單" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + "  ,為化學氣體類或外包修繕類");  //link,name,who mail,titel
                                    rsx.MoveNext();
                                }
                                rsx.Close();
                            }

                        }
                    }
                    else
                    {
                        ds["STATUS"] = " ";
                        ds.Update();

                    }
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
                    string sqlstr = "";
                    sqlstr = "SELECT * FROM APMT420_IN_HEAD where id='" + Request.QueryString["id"] + "'";



                    SmoothEnterprise.Database.DataSet ds;
                    ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    ds.Open(sqlstr);

                    //ds.Open("SELECT * FROM emp_add WHERE id='" + Request.QueryString["id"] + "'");
                    //Response.Write(ds.EOF);
                    //Response.Write("SELECT * FROM bomheadbuffer WHERE TROWID='" + Request.QueryString["TROWID"] + "'");
                    if (!ds.EOF)
                    {
                        //Response.Write("有資料");
                        ds["STATUS"] = "退回";  //被退回
                        ds.Update();
                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                        rs.Open("select plantid,pmk01,b.empid purempid,c.name username,c.email usermail from apmt420_in_head a left join dguser b on  pur=b.id left join dguser c on senduser=c.id WHERE a.id='" + Request.QueryString["id"] + "' ");
                        if (!rs.EOF)
                        {
                            FileStream fs = new FileStream(@"D:\APMT420_XML\4GL\" + rs["plantid"].ToString() + "_apmt420_" + rs["pmk01"].ToString() + ".txt", FileMode.Create, FileAccess.Write);
                            StreamWriter sw = new StreamWriter(fs);
                            sw.WriteLine("\"" + rs["plantid"].ToString() + "\",\"apmt420\",\"" + rs["pmk01"].ToString() + "\",\"N\",\"\"");
                            sw.Close();
                            fs.Close();
                            Upload("D:\\APMT420_XML\\4GL\\" + rs["plantid"].ToString() + "_apmt420_" + rs["pmk01"].ToString() + ".txt", "ftp://192.168.0.250/" + rs["plantid"].ToString() + "_APMT420_" + rs["pmk01"].ToString() + ".txt", "4gl", "4gl");


                            //發信測試------------------------------------------
                            SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                            //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");


                            //rss.Open("select * from dguser where name='" + this.FIELD_gen02_3.Text + "' ");
                            rss.Open("select b.* from apmt420_in_head  a " +
                                "  left join dguser b on pmk12=erpid WHERE a.id='" + Request.QueryString["id"] + "'");

                            if (!rss.EOF)
                            {
                                if (rs["usermail"].ToString() == "" || rs["usermail"].ToString() == rss["email"].ToString())
                                {
                                    MyLibrary_apmt420 Backsend = new MyLibrary_apmt420();
                                    Backsend.RunMailProcess("/ERP_APMT420/APMT420edit.aspx?id=" + Request.QueryString["id"],
                                    rss["name"].ToString(), rss["email"].ToString(), "請購單" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + "  ,結果為:退回");  //link,name,who mail,titel
                                                                                                                                                                     //Response.Write("/ERP_APMT420/APMT420Edit.aspx?id=" + Request.QueryString["id"] + "<br>" + rss["name"].ToString() + "<br>" + rss["email"].ToString() + "<br>" + " 請購單號:" + this.FIELD_pmk01.Text + "<br>" + " 廠商:" + this.FIELD_pmc03.Text + "<br>");
                                }
                                else
                                {
                                    MyLibrary_apmt420 Backsend = new MyLibrary_apmt420();
                                    Backsend.RunMailProcess("/ERP_APMT420/APMT420edit.aspx?id=" + Request.QueryString["id"],
                                    rss["name"].ToString(), rss["email"].ToString(), "請購單" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + "  ,結果為:退回");  //link,name,who mail,titel

                                    MyLibrary_apmt420 Backsend1 = new MyLibrary_apmt420();
                                    Backsend1.RunMailProcess("/ERP_APMT420/APMT420edit.aspx?id=" + Request.QueryString["id"],
                                    rs["username"].ToString(), rs["usermail"].ToString(), "請購單" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + "  ,結果為:退回");  //link,name,who mail,titel



                                }
                            }
                            //發信測試------------------------------------------
                        }
                    }
                    else
                    {
                        ds["STATUS"] = "Y";
                        ds.Update();
                    }
                }
                catch
                {
                    // Response.Write("有問題");
                }

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

                //if (Request.QueryString[0].ToLower() == "bfea4cbf-5a5c-4e3e-a680-4d0e76f5748c")
                //{
                //    e.Reviewers.Add("D45938A7-3430-42EC-8BE6-0E1F391329E0", "第六關審核人");
                //}

            }
            catch { }
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
        protected void PRINT_Click(object sender, EventArgs e)
        {
            Response.Write("<script language='JavaScript'>window.print();</script>");
        }
        protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
        {
            _NotifyReview = true;


            #region 仿多筆審核, 用於A的下一關為B, 但B的代理人為A,在A簽核時只審核一次 120224

            int i = 0;
            //執行指令, 目前一定會跑一次
            RunAjaxName("runflow" + i.ToString() + i.ToString(), "/erp_apmt420/APMT420view.aspx?id=" + Request.QueryString["id"], "RESULTTYPE=Next", "document.getElementById(\"div_/erp_apmt420/APMT420view.aspx?id=" + Request.QueryString["id"] + "\").innerHTML", true);


            string js =
            "<script language=\"javascript\">" + Environment.NewLine +
            "function FlowAutoReview()" + Environment.NewLine +
            "   {" + Environment.NewLine +
            "          var obj=document.getElementById(\"waitview\");" + Environment.NewLine +
            "          if (obj!=null)" + Environment.NewLine +
            "          {" + Environment.NewLine +
            "              obj.style.cursor=\"default\";" + Environment.NewLine +
            "              obj.style.display=\"none\";" + Environment.NewLine +
            "           }" + Environment.NewLine +
            "           location.replace(\"" + Request.Url.ToString() + "\");" + Environment.NewLine +
            "           document.location.href='/Flowwork/MyApproval.aspx';" + Environment.NewLine +     //轉址
            "   }" + Environment.NewLine +
            "</script>" + Environment.NewLine +
            "<DIV id=\"waitview\" name=\"waitview\" style=\"BACKGROUND-POSITION: 100% 300px; Z-INDEX: 5; FILTER: alpha(opacity=20); LEFT: 0%; BACKGROUND-IMAGE: url(Img/indicator_circle_thickbox.gif); CURSOR: wait; BACKGROUND-REPEAT: no-repeat; POSITION: absolute; TOP: 0; BACKGROUND-COLOR: black ; width:100% ; height:100%;\"></DIV>" + Environment.NewLine;

            this.RegisterClientScriptBlock("FlowAutoReview", js);

            #endregion






        }

        protected void Page_PreRenderComplete(object sender, System.EventArgs e)  //120302 修改,原本為Page_PreRender改成Page_PreRenderComplete, 如此一來仿多筆審核的連下關一起簽的mail才能正常
        {

            //發信測試------------------------------------------

            //Response.Write(this.CurrentUser.LogonID.ToString());

            if (_NotifyReview)
            {
                if (this.FIELD_QUICK.Text == "Y")
                {
                    quick = "  --急件";

                }


                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                //Response.Write("select top 1 REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid from dgflowqueue a left join dguser b on revieweruid=b.id where requesturl like '%" + Request.QueryString["id"] + "'  AND reviewdate IS NULL AND qseq is not null");
                rss.Open("select top 1 REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid,revieweruid from dgflowqueue a left join dguser b on revieweruid=b.id where requesturl like '%" + Request.QueryString["id"] + "'  AND reviewdate IS NULL AND qseq is not null ");
                if (!rss.EOF)
                {

                    MyLibrary_apmt420 Backsend = new MyLibrary_apmt420();
                    Backsend.RunMailProcess(rss["requesturl"].ToString(),
                    rss["name"].ToString(), rss["email"].ToString(), " 請購單號:" + this.FIELD_pmk01.Text + " 廠商:" + this.FIELD_pmc03.Text + quick.ToString());  //link,name,who mail,titel
                                                                                                                                                             //DBTransfer actsql1 = new DBTransfer();
                                                                                                                                                             //actsql1.RunIUSql("insert into  misbuffer2(caption)values('ann信裡面" + this.FIELD_pmk01.Text + "')");

                    #region 代理人
                    SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rs2.Open(" SELECT b.name name,email FROM dguserdeputy a left join dguser b on a.deputyuid=b.id left join dgflow c on a.sid=c.id  " +
                             " where  a.uid='" + rss["bid"].ToString() + "'  " +
                             " and  b.id not in (  select revieweruid from dgflowqueue a left join dguser b on revieweruid=b.id where requesturl like '%" + Request.QueryString["id"] + "' and revieweruid <> '00000000-0000-0000-0000-000000000000') and " +
                             " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                             " (c.typename like 'ERP_FLOW%' and sdate < GETDATE() and edate is null) or " +
                             " (c.typename like 'ERP_FLOW%' and sdate < GETDATE() and edate > GETDATE()) or " +
                             "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");  //20120302  增加" and  b.id not in (  select revieweruid from dgflowqueue a left join dguser b on revieweruid=b.id where requesturl like '%" + Request.QueryString["id"] + "' and revieweruid <> '00000000-0000-0000-0000-000000000000') and " 因為仿多筆審核下一關時, 讓宋協理不要收到信
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

            }
            //DBTransfer actsql3 = new DBTransfer();
            //actsql3.RunIUSql("insert into  misbuffer2(caption)values('ann信最外裡面" + this.FIELD_pmk01.Text + "')");

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

        #region 仿多筆審核, 用於A的下一關為B, 但B的代理人為A,在A簽核時只審核一次 120224
        protected string RunAjaxName(string reqname, string url, string sendquerystring, string responseclientname, bool autorun)
        {
            string retname = reqname + "_RunAjax()";
            string ajaxjs =
                "<script language=\"javascript\">" + Environment.NewLine +
                "    // Use XMLHttpreq Type" + Environment.NewLine +
                "    var " + reqname + " = false;" + Environment.NewLine +
                "    try" + Environment.NewLine +
                "    {" + Environment.NewLine +
                "        " + reqname + " = new XMLHttpreq();" + Environment.NewLine +
                "    }" + Environment.NewLine +
                "    catch (trymicrosoft)" + Environment.NewLine +
                "    {" + Environment.NewLine +
                "        try" + Environment.NewLine +
                "        {" + Environment.NewLine +
                "            " + reqname + " = new ActiveXObject(\"Msxml2.XMLHTTP\");" + Environment.NewLine +
                "        }" + Environment.NewLine +
                "        catch (othermicrosoft)" + Environment.NewLine +
                "        {" + Environment.NewLine +
                "            try" + Environment.NewLine +
                "            {" + Environment.NewLine +
                "                " + reqname + " = new ActiveXObject(\"Microsoft.XMLHTTP\");" + Environment.NewLine +
                "            }" + Environment.NewLine +
                "            catch (failed)" + Environment.NewLine +
                "            {" + Environment.NewLine +
                "                " + reqname + " = false;" + Environment.NewLine +
                "            }" + Environment.NewLine +
                "        }" + Environment.NewLine +
                "    }" + Environment.NewLine +
                "    if (!" + reqname + ") alert(\"Error initializing XMLHttpreq!\");" + Environment.NewLine +

                "    // Call Run Ajax" + Environment.NewLine +
                "    function " + reqname + "_RunAjax()" + Environment.NewLine +
                "    {" + Environment.NewLine +
                "        " + reqname + ".open(\"POST\",\"" + url + "\", true);" + Environment.NewLine +
                "        " + reqname + ".onreadystatechange = " + reqname + "_Finally ;" + Environment.NewLine +
                "        " + reqname + ".setRequestHeader(\"Content-Type\",\"application/x-www-form-urlencoded\"); " + Environment.NewLine +
                "        " + reqname + ".send(" + (sendquerystring != "" ? "\"" + sendquerystring + "\"" : "null") + ");" + Environment.NewLine +
                "    }" + Environment.NewLine +
                "    " + Environment.NewLine +

                "    // FlowOK" + Environment.NewLine +
                "    function " + reqname + "_Finally()" + Environment.NewLine +
                "    {" + Environment.NewLine +
                "        if (" + reqname + ".readyState == 4)" + Environment.NewLine +
                "        {" + Environment.NewLine +
                "            if (" + reqname + ".status == 200)" + Environment.NewLine +
                "            {" + Environment.NewLine +
                //"                try" + Environment.NewLine +
                //"                {" + Environment.NewLine +
                //(responseclientname != "" ? "                    " + responseclientname + " = \"OK\";" : "") + Environment.NewLine +
                "                   FlowAutoReview();" + Environment.NewLine +
                //"                }" + Environment.NewLine +
                //"                catch (failed)" + Environment.NewLine +
                //"                {" + Environment.NewLine +
                //"                    alert(failed.description);" + Environment.NewLine +
                //"                }" + Environment.NewLine +
                "            }" + Environment.NewLine +
                "            else" + Environment.NewLine +
                "            {" + Environment.NewLine +
                "                alert(\"status is \" + " + reqname + ".status);" + Environment.NewLine +
                "            }" + Environment.NewLine +
                "        }" + Environment.NewLine +
                "    }" + Environment.NewLine +

                (autorun ? "   window.attachEvent(\"onload\"," + reqname + "_RunAjax);" : "") + Environment.NewLine +

                "</script>" + Environment.NewLine;

            this.RegisterClientScriptBlock(reqname, ajaxjs);
            return retname;
        }

        #endregion

        protected void btn_test_Click(object sender, EventArgs e)
        {
            string status = "";
            string sqlstr = "";

            sqlstr = "SELECT * FROM APMT420_IN_HEAD where id='" + Request.QueryString["id"] + "'";
            SmoothEnterprise.Database.DataSet ds;
            ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            ds.Open(sqlstr);

            if (!ds.EOF)
            {
                status = ds["STATUS"].ToString();
            }


            //**********************************************
            if (status == "Y")
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                rs.Open("select plantid,pmk01,b.empid purempid,c.name username,c.email usermail from apmt420_in_head a left join dguser b on  pur=b.id left join dguser c on senduser=c.id WHERE a.id='" + Request.QueryString["id"] + "' ");
                if (!rs.EOF)
                {
                    FileStream fs = new FileStream(@"D:\APMT420_XML\4GL\" + rs["plantid"].ToString() + "_apmt420_" + rs["pmk01"].ToString() + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs);
                    sw.WriteLine("\"" + rs["plantid"].ToString() + "\",\"apmt420\",\"" + rs["pmk01"].ToString() + "\",\"Y\",\"" + rs["purempid"].ToString() + "\"");
                    sw.Close();
                    fs.Close();
                    Upload("D:\\APMT420_XML\\4GL\\" + rs["plantid"].ToString() + "_apmt420_" + rs["pmk01"].ToString() + ".txt", "ftp://192.168.0.250/" + rs["plantid"].ToString() + "_APMT420_" + rs["pmk01"].ToString() + ".txt", "4gl", "4gl");


                }
            }
            //**********************************************


            if (status == "退回")
            { 
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                //Response.Write("select * from apmt420_in_head WHERE id='" + Request.QueryString["id"] + "' ");
                rs.Open("select plantid,pmk01,b.empid purempid,c.name username,c.email usermail from apmt420_in_head a left join dguser b on  pur=b.id left join dguser c on senduser=c.id WHERE a.id='" + Request.QueryString["id"] + "' ");
                if (!rs.EOF)
                {
                    FileStream fs = new FileStream(@"D:\APMT420_XML\4GL\" + rs["plantid"].ToString() + "_apmt420_" + rs["pmk01"].ToString() + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs);
                    sw.WriteLine("\"" + rs["plantid"].ToString() + "\",\"apmt420\",\"" + rs["pmk01"].ToString() + "\",\"N\",\"\"");
                    sw.Close();
                    fs.Close();
                    Upload("D:\\APMT420_XML\\4GL\\" + rs["plantid"].ToString() + "_apmt420_" + rs["pmk01"].ToString() + ".txt", "ftp://192.168.0.250/" + rs["plantid"].ToString() + "_APMT420_" + rs["pmk01"].ToString() + ".txt", "4gl", "4gl"); 
                } 
            }
 

        }
    }
}
