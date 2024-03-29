using System;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Collections.Generic;
using System.Text;

namespace IPQC
{
    public partial class IPQCView : IPQC_Base
    {


        private bool _NotifyReview = false;
        private int Allsn = 0;
        private string _NodeType = "";
        protected void Page_Load(object sender, System.EventArgs e)
        {
            //Page.Title = "IPQC View Page";
            if (!this.IsPostBack)
            {
                try
                {
                    initdate();
                    initvalue();
                    initfile();

                    // 判斷是否為簽核人員-----------------------------------
                    //FieldDisable();

                    getView();

                }
                catch (Exception ex)
                {
                    this.AddError(this, "Page_Load", "", ex.Message + "<br>" + ex.StackTrace);
                    //Response.Redirect("IPQC.aspx");
                }
            }
            getflow(p_list);


        }





        /// <summary>
        /// 欄位開放變更
        /// </summary>
        //private void FieldDisable()
        //{
        //    try
        //    {

        //        Origin.Value = "N";

        //        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
        //        string commandstr = "select * from eipe.dbo.ipqc_flow f where f.uid='" + this.CurrentUser.ID + "'  ";

        //        rs.Open(commandstr);
        //        if (!rs.EOF)
        //        {
        //            hd_title.Value = rs["text"].ToString();

        //            switch (rs["rowno"].ToString().ToUpper())
        //            {
        //                case "6173D422-FE0D-447E-97C6-AA97377369F5"://"HOD of QE":
        //                    this.FIELD_QA_dept.Enabled = true;
        //                    hd_controls.Value = FIELD_QA_dept.UniqueID;
        //                    break;
        //                case "F06BAF9C-EEB5-45EA-BCC1-9449CF76093D"://"HOD of NPI":
        //                    FIELD_NPI_dept.Enabled = true;
        //                    hd_controls.Value = FIELD_QA_dept.UniqueID;
        //                    break;
        //                case "ABA6BDC4-A482-4204-AFA8-ABE04193909D": //"HOD of Production":
        //                    FIELD_Prod_dept.Enabled = true;
        //                    hd_controls.Value = FIELD_QA_dept.UniqueID;
        //                    break;
        //                case "297070E3-0D79-48F3-B84E-AE112860D9F1"://"HOD of Tooling":
        //                    FIELD_Tooling_Dept.Enabled = true;
        //                    hd_controls.Value = FIELD_QA_dept.UniqueID;
        //                    break;
        //                case "5CF79554-A020-4E4F-A982-323CB0CC3716":// "HOD of PMC":
        //                    FIELD_PMC_Dept.Enabled = true;
        //                    hd_controls.Value = FIELD_QA_dept.UniqueID;
        //                    break;
        //                case "0A4231B3-DA43-4C0F-9A11-E7B52E32D139"://"QE Director":
        //                    FILED_QA_Director.Enabled = true;
        //                    hd_controls.Value = FIELD_QA_dept.UniqueID;
        //                    break;
        //                case "DF0C58C2-0C04-42F9-8F57-0BE05BD20414"://"QE Director":
        //                    FILED_QA_Director.Enabled = true;
        //                    hd_controls.Value = FIELD_QA_dept.UniqueID;
        //                    break;
        //                case "5E16AE3F-CBF9-41AC-859E-1F91F7F6EE6F":// "Eng Director":
        //                    FILED_NPI_Director.Enabled = true;
        //                    hd_controls.Value = FIELD_QA_dept.UniqueID;

        //                    break;
        //                case "71561CD7-8A32-4014-B653-A642F2630848":// "副營運長":
        //                    this.FILED_VCOO.Enabled = true;
        //                    hd_controls.Value = FIELD_QA_dept.UniqueID;
        //                    Origin.Value = "Y";
        //                    break;
        //                case "98ECD8B2-EDD7-40FF-8E80-05D5484934C5": //"營運長":
        //                    FILED_COO.Enabled = true;
        //                    hd_controls.Value = FIELD_QA_dept.UniqueID;
        //                    Origin.Value = "Y";
        //                    break;

        //            }
        //            rs.MoveNext();
        //        }
        //        rs.Close();
        //        rs.Dispose();


        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message);
        //    }
        //}

        private void initfile()
        {
            try
            {
                //Response.Write("1<br/>");
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM EIPE.DBO.IPQC_file WHERE rowno='" + this.Request.QueryString["rowno"].ToString() + "'");
                //Response.Write(rs.SQL + "<br/>");
                while (!rs.EOF)
                {
                    //Response.Write("2<br/>");
                    string width = "150";
                    //if (rs["FileType"].ToString().Contains(".jpg"))
                    //{
                    //Response.Write(rs["filefield"].ToString()+"<br/>");
                    if (rs["FileField"].ToString().Contains("Abnormal"))
                    {
                        showAttach(hl_Abnormal_FILE, rs["id"].ToString(), rs["FileName"].ToString());
                        ////Response.Write("Quality<br/>");
                        //if (rs["FileType"].ToString().ToLower().Contains(".jpg"))


                        ////                        this.check_Abnormal_FILE.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
                        //{
                        //    hl_Abnormal_FILE.ImageUrl = "FileDownload.aspx?id=" + rs["id"].ToString();
                        //    hl_Abnormal_FILE.NavigateUrl = "FileDownload.aspx?id=" + rs["id"].ToString();
                        //}
                        //else
                        //{
                        //    //this.check_Abnormal_FILE.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));
                        //    hl_Abnormal_FILE.Text = rs["FileName"].ToString();
                        //    hl_Abnormal_FILE.NavigateUrl = "FileDownload.aspx?id=" + rs["id"].ToString();
                        //    hl_Abnormal_FILE.Target = "_blank";
                        //}
                        ////$( "#riverroad" ).tooltip({ content: '<img src="yourImagePath" />' });
                    }
                    if (rs["FileField"].ToString().Contains("Dimension"))
                    {
                        showAttach(hDimension_file, rs["id"].ToString(), rs["FileName"].ToString());
                        ////Response.Write("Dimension<br/>");
                        //if (rs["FileType"].ToString().ToLower().Contains(".jpg"))
                        //{
                        //    hDimension_file.ImageUrl = "FileDownload.aspx?id=" + rs["id"].ToString();
                        //    hDimension_file.NavigateUrl = "FileDownload.aspx?id=" + rs["id"].ToString();

                        //}

                        ////this.check_Dimension_file.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
                        //else
                        //{
                        //    hDimension_file.Text = rs["FileName"].ToString();
                        //    hDimension_file.NavigateUrl = "FileDownload.aspx?id=" + rs["id"].ToString();
                        //    hDimension_file.Target = "_blank";
                        //}
                        ////                            this.check_Dimension_file.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));
                    }
                    if (rs["FileField"].ToString().Contains("Appearance"))
                    {
                        //Response.Write("Appearance<br/>");
                        //if (rs["FileType"].ToString().ToLower().Contains(".jpg"))
                        //    this.check_Appearance_file.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
                        //else
                        //    this.check_Appearance_file.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));

                        showAttach(hlAppearance_file, rs["id"].ToString(), rs["FileName"].ToString());
                    }
                    if (rs["FileField"].ToString().Contains("Cleanlines"))
                    {
                        //Response.Write("Cleanlines<br/>");
                        //if (rs["FileType"].ToString().ToLower().Contains(".jpg"))
                        //    this.check_Cleanlines_file.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
                        //else
                        //    this.check_Cleanlines_file.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));
                        showAttach(hlCleanlines_file, rs["id"].ToString(), rs["FileName"].ToString());
                    }
                    if (rs["FileField"].ToString().Contains("Reliability"))
                    {
                        ////Response.Write("Reliability<br/>");
                        //if (rs["FileType"].ToString().ToLower().Contains(".jpg"))
                        //    this.check_Reliability_file.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
                        //else
                        //    this.check_Reliability_file.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));
                        showAttach(hlReliability_file, rs["id"].ToString(), rs["FileName"].ToString());

                    }
                    //}
                    rs.MoveNext();
                }
                rs.Close();
                rs.Dispose();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private void initvalue()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM EIPE.DBO.IPQC WHERE rowno='" + this.Request.QueryString["rowno"].ToString() + "'");

                if (!rs.EOF)
                {
                    this.FIELD_IPQC_NO.Text = rs["IPQC_NO"].ToString();
                    this.FIELD_inituser.Text = rs["inituser"].ToString();
                    this.FIELD_initdate.Text = rs["initdate"].ToString();
                    this.FIELD_sheet_NO.Text = rs["sheet_NO"].ToString();
                    this.FIELD_station.SelectedValue = rs["station"].ToString();
                    this.FIELD_customer.SelectedValue = rs["customer"].ToString();
                    this.FIELD_Program_Name.Text = rs["Program_Name"].ToString();
                    this.FIELD_Product_Name.SelectedValue = rs["Product_Name"].ToString();
                    this.FIELD_PN.Text = rs["PN"].ToString();
                    this.FIELD_Rev.Text = rs["Rev"].ToString();
                    this.FIELD_Stage.SelectedValue = rs["Stage"].ToString();
                    this.FIELD_Defect_Rat.Text = rs["Defect_Rat"].ToString();
                    this.FIELD_Description.Text = rs["Description"].ToString();
                    this.FIELD_Dimension_check.SelectedValue = rs["Dimension_check"].ToString();
                    this.FIELD_Dimension.Text = rs["Dimension"].ToString();
                    this.FIELD_Appearance_check.SelectedValue = rs["Appearance_check"].ToString();
                    this.FIELD_Appearance.Text = rs["Appearance"].ToString();
                    this.FIELD_Cleanliness_check.SelectedValue = rs["Cleanlines_check"].ToString();
                    this.FIELD_Cleanlines.Text = rs["Cleanlines"].ToString();
                    this.FIELD_Reliability_check.SelectedValue = rs["Reliability_check"].ToString();
                    this.FIELD_Reliability.Text = rs["Reliability"].ToString();
                    this.FIELD_Judgement.SelectedValue = rs["QA_Judgement"].ToString();
                    this.FIELD_QA_Judgement_commit.SelectedValue = rs["QA_Judgement_commit"].ToString();
                    this.FIELD_CAPA_Sheet_NO.Text = rs["CAPA_Sheet_NO"].ToString();

                    _status = string.IsNullOrEmpty(rs["isState"].ToString())?0 : int.Parse(rs["isState"].ToString());

                    /*
                    this.FIELD_QA_dept.SelectedValue = rs["QA_dept"].ToString();
                    this.FIELD_NPI_dept.SelectedValue = rs["NPI_dept"].ToString();
                    this.FIELD_Prod_dept.SelectedValue = rs["Prod_dept"].ToString();
                    this.FIELD_Tooling_Dept.SelectedValue = rs["Tooling_Dept"].ToString();

                    this.FILED_NPI_Director.SelectedValue = rs["NPI_Director"].ToString();
                    this.FILED_QA_Director.SelectedValue = rs["QA_Director"].ToString();

                    this.FILED_QE_Director.SelectedValue = rs["QE_Director"].ToString();
                    this.FILED_QA.SelectedValue = rs["QA_VP"].ToString();

                    this.FILED_VCOO.SelectedValue = rs["V_COO"].ToString();
                    this.FILED_COO.SelectedValue = rs["COO"].ToString();
                    */
                }

                rs.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private void initdate()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * " +
                        "  FROM EIPE.DBO.IPQC_parameter " +
                        " ORDER BY PARAMETER , SEQ ");
                //this.FIELD_inituser.Text = this.CurrentUser.ID;//.Replace("{","").Replace("}","");


                //this.FIELD_initdate.Text = System.DateTime.Now.ToString("yyyy-MM-dd");
                #region init judgement commit
                this.FIELD_QA_Judgement_commit.Items.Clear();
                while (!rs.EOF)
                {
                    if (rs["parameter"].ToString().Contains("commit"))
                        this.FIELD_QA_Judgement_commit.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                    rs.MoveNext();
                }
                rs.MoveFirst();
                #endregion
                /*
                #region init MRB Team commit
                this.FIELD_QA_dept.Items.Clear();
                this.FIELD_NPI_dept.Items.Clear();
                this.FIELD_Prod_dept.Items.Clear();
                this.FIELD_Tooling_Dept.Items.Clear();

                //update by carol 20161125
                this.FIELD_PMC_Dept.Items.Clear();
                this.FILED_COO.Items.Clear();
                this.FILED_VCOO.Items.Clear();
                this.FILED_NPI_Director.Items.Clear();
                this.FILED_QA_Director.Items.Clear();


                while (!rs.EOF)
                {
                    if (rs["parameter"].ToString().Contains("commit"))
                    {
                        this.FIELD_QA_dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                        this.FIELD_NPI_dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                        this.FIELD_Prod_dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                        this.FIELD_Tooling_Dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));

                        this.FIELD_PMC_Dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));

                        this.FILED_COO.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                        this.FILED_VCOO.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));

                        this.FILED_NPI_Director.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));　//舊欄位不改名欄　2017/09/05 flow 為Eng Director-Stanley 
                        this.FILED_QA_Director.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));　//舊欄位不改名欄 2017/09/05 flow 為 QE Director-GK
                        this.FILED_QE_Director.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));  //新增 Dr. Imbert Theadore
                        this.FILED_QA.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString())); //Andrew Chong
                    }
                    rs.MoveNext();
                }
                rs.MoveFirst();
                #endregion
                /*
                /*
                #region init master commit
                this.FIELD_Master_Dispostion.Items.Clear();
                while (!rs.EOF)
                {
                    if (rs["parameter"].ToString().Contains("commit"))
                        this.FIELD_Master_Dispostion.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                    rs.MoveNext();
                }
                rs.MoveFirst();
                #endregion
                 
                  #region init Final proposed disposition
                this.FIELD_Proposed_Dispostion.Items.Clear();
                while (!rs.EOF)
                {
                    if (rs["parameter"].ToString().Contains("commit") && !string.IsNullOrEmpty(rs["value"].ToString().Trim()))
                        this.FIELD_Proposed_Dispostion.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                    rs.MoveNext();
                }
                rs.MoveFirst();
                #endregion
                 */
                #region init  Abnormal Station commit
                this.FIELD_station.Items.Clear();
                while (!rs.EOF)
                {
                    if (rs["parameter"].ToString().Contains("station"))
                        this.FIELD_station.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                    rs.MoveNext();
                }
                rs.MoveFirst();
                #endregion

                #region init stage commit
                this.FIELD_Stage.Items.Clear();
                while (!rs.EOF)
                {
                    if (rs["parameter"].ToString().Contains("stage"))
                        this.FIELD_Stage.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                    rs.MoveNext();
                }
                rs.MoveFirst();
                #endregion


                #region  Init IPQC Dispostion NO.
                //rs.Close();
                //rs.Open("EXEC EIPE.DBO.IPQC_QAD_SEQ_SP");
                //this.FIELD_IPQC_NO.Text = rs["NO"].ToString();
                #endregion
                #region Init FIELD_Dimension_check
                getChkItem(this.FIELD_Dimension_check);
                //this.FIELD_Dimension_check.Items.Clear();
                //this.FIELD_Dimension_check.Items.Add(new ListItem("NA", ""));
                //this.FIELD_Dimension_check.Items.Add(new ListItem("合格", "合格"));
                //this.FIELD_Dimension_check.Items.Add(new ListItem("不合格", "不合格"));
                #endregion
                #region Init FIELD_Appearance_check
                getChkItem(this.FIELD_Appearance_check);
                //this.FIELD_Appearance_check.Items.Clear();
                //this.FIELD_Appearance_check.Items.Add(new ListItem("NA", ""));
                //this.FIELD_Appearance_check.Items.Add(new ListItem("合格", "合格"));
                //this.FIELD_Appearance_check.Items.Add(new ListItem("不合格", "不合格"));
                #endregion
                #region Init FIELD_Cleanliness_check
                getChkItem(this.FIELD_Cleanliness_check);
                //this.FIELD_Cleanliness_check.Items.Clear();
                //this.FIELD_Cleanliness_check.Items.Add(new ListItem("NA", ""));
                //this.FIELD_Cleanliness_check.Items.Add(new ListItem("合格", "合格"));
                //this.FIELD_Cleanliness_check.Items.Add(new ListItem("不合格", "不合格"));
                #endregion
                #region Init FIELD_Reliability_check
                getChkItem(this.FIELD_Reliability_check);
                //this.FIELD_Reliability_check.Items.Clear();
                //this.FIELD_Reliability_check.Items.Add(new ListItem("NA", ""));
                //this.FIELD_Reliability_check.Items.Add(new ListItem("合格", "合格"));
                //this.FIELD_Reliability_check.Items.Add(new ListItem("不合格", "不合格"));
                #endregion

                #region 客戶名稱
                rs.Open("SELECT * FROM csc_base_file where tid='A' and  LActi='Y'");
                while (!rs.EOF)
                {
                    FIELD_customer.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LID"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
                #endregion
                #region 產品
                this.FIELD_Product_Name.Items.Clear();
                this.FIELD_Product_Name.Items.Add(new ListItem("NA", ""));
                rs.Open("SELECT LID,LCaption FROM csc_base_file where tid='I' and  LActi='Y' ");
                while (!rs.EOF)
                {
                    this.FIELD_Product_Name.Items.Add(new ListItem(rs[1].ToString(), rs[0].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
                #endregion
                #region 專案名稱
                //SELECT * FROM csc_base_file where tid='F' and  LActi='Y'
                string sq3 = "SELECT LCaption , LID FROM csc_base_file where tid='F' and  LActi='Y'";
                rs.Open(sq3);
                this.FIELD_Program_Name.Items.Clear();
                this.FIELD_Program_Name.Items.Add(new ListItem("NA", ""));
                while (!rs.EOF)
                {
                    this.FIELD_Program_Name.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LID"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
                #endregion
                #region 圖面
                rs.Open("select cwid,LCaption,tid  from  csc_bom left join  csc_base_file on cwid=lid " +
                           " where 1 = 1 " +

                           " and  bomact = 'Y' and   LActi = 'Y' and  TID = 'J' ");
                while (!rs.EOF)
                {
                    FIELD_PN.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["cwid"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
                #endregion

                flowResult1.Text = getStr("approve");
                flowResult2.Text = getStr("other");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
        {
            try
            {
                //writetofile("FlowFeedback1_FlowNodeComplete");
                if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
                {
                    _NotifyReview = true;
                    _NodeType = e.ResultType.ToString();
                    e.NextNode = e.FlowNode.DefaultNode();
                    e.NextNode.ReviewerURL = "/ipqc/ipqcview.aspx";
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message+"<br/>"+ex.StackTrace+"<br/>");
            }

        }
        protected void FlowFeedback1_FeedbackComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
        {
            try
            {
                _NotifyReview = true;
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);


                SmoothEnterprise.Web.UI.HTMLControl.InputText it;
                object obj = this.FlowFeedback1.ReplyView.FindControl("ResTxt");
                it = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj;
                e["Flow_Comment"] = it.Text;
                //電子簽章呈現---------------------------------------------------------------------
                SmoothEnterprise.Web.UI.HTMLControl.InputText it3;
                object obj3 = this.FlowFeedback1.ReplyView.FindControl("Flow_loginID");
                it3 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj3;
                it3.Text = this.CurrentUser.LogonID;
                e["Flow_loginID"] = it3.Text;


                //寫入是否為代理人
                SmoothEnterprise.Web.UI.HTMLControl.InputText it4;
                object obj4 = this.FlowFeedback1.ReplyView.FindControl("IniReviewer");
                it4 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj4;
                e["IniReviewer"] = "代";


                SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                ds.Open(" select revieweruid  from  dgflowqueue   where requesturl like '%" + Request.QueryString[0].ToString() + "%'" +
                    "  and revieweruid='" + this.CurrentUser.ID.Substring(1, 36) +
                    "' and  initdate=(select MAX(initdate)   from  dgflowqueue    where requesturl like '%" +
                    Request.QueryString[0].ToString() + "%')");
                if (!ds.EOF)
                {
                    e["IniReviewer"] = "";
                }
                ds.Close();
                //e.NodeComplete = true;
            }
            catch (Exception ex)
            {
                this.AddError(this, "FlowFeedback1_FeedbackComplete()", "", "FlowFeedback1_FeedbackComplete<br/>" + ex.Message);
            }
        }
        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {


            try
            {
                if ((Allsn.ToString() == "0") && (_NotifyReview))
                {
                   // SendMail(_NodeType);
                    Allsn++;
                }

                Label label;
                object obj = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
                label = (Label)obj;
                label.Text = e["Flow_Comment"].ToString();
                label.ForeColor = System.Drawing.Color.Red;
                label.Font.Bold = true;
                label.Enabled = true;
                label.Font.Size = 13;

                //電子簽章呈現-----------------------------------------------------------------------------------------
                System.Web.UI.WebControls.Image sin1;
                object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
                sin1 = (System.Web.UI.WebControls.Image)obj5;
                //Response.Write((string)e["Flow_loginID"] + "--");
                if ((string)e["Flow_loginID"].ToString().Length.ToString() != "0")
                {
                    sin1.Visible = true;
                }
                else
                {
                    sin1.Visible = false;
                }
                sin1.ImageUrl = "~/image/" + (string)e["Flow_loginID"] + ".JPG";

                System.Web.UI.WebControls.Image sin2;
                object obj6 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image2");
                sin2 = (System.Web.UI.WebControls.Image)obj6;

                if ((string)e["IniReviewer"].ToString().Length.ToString() == "0") sin2.Visible = false;
                else sin2.Visible = true;
            }
            catch { }
        }
        protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
        {
            try
            {
                using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {    
                    ds.Open("SELECT * FROM EIPE.DBO.IPQC WHERE  rowno ='" + Request.QueryString["ROWNO"] + "' ");
                     
                    if (!ds.EOF)
                    {
                        status action = (status) int.Parse(ds["isState"].ToString());

                        switch (e.ResultType)
                        {
                            case SmoothEnterprise.Flowwork.Control.ReviewResultType.Next:
                                _NodeType = "Next";
                                action = status.Send;
                                break;
                            case SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete:
                                _NodeType = "Complete";
                                action = status.Complete;

                                break;
                            case SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate:
                                _NodeType = "Terminate"; //退回提案人
                                action = status.Stop;
                                break;
                            case SmoothEnterprise.Flowwork.Control.ReviewResultType.Back:
                                _NodeType = "Back"; //回上層
                                action = status.Send;
                                break;

                                //    break;
                                //case SmoothEnterprise.Flowwork.Control.ReviewResultType.Return:
                                //    action = (int)status.Back;//駁
                                //    _NodeType = "Return";
                                //    break;
                                //default:
                                //    break;
                        }

                        ds["isState"] = (int)action;
                        _status = (int)action;
                        ds.Update();
                    }
                    ds.Close();
                }
                //sendmail(_NodeType);
                //Response.Redirect("http://" + Request.Url.Authority.ToString() + "/Flowwork/MyApproval.aspx");
            }
            catch (Exception ex)
            {
                Utility.log(ex.Message, ex.StackTrace);
            }

        }

        //送出
        protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
        {
            try
            {
                // saveform(new Guid(Request.QueryString["rowno"].ToString()));
                saveform();
                MailReview(); 
                this.FlowFeedback1.Commit();
                Response.Redirect("http://" + Request.Url.Authority.ToString() + "/Flowwork/MyApproval.aspx");
            }
            catch (Exception ex)
            {
                this.AddError(this, "BUTTON_FlowFeedback_Click", "", ex.Message + "<br/>" + ex.StackTrace);
            }

        }

        /// <summary>
        /// 儲存頁面資料
        /// </summary>
        /// 
        private void saveform()
        {
            try
            {

                using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    string uid = CurrentUser.ID.Replace("{", "").Replace("}", "");
                    string sql = string.Format("select * from eipe.dbo.ipqc_flow where uid='{0}' and enable='1' ", uid);
                    ds.Open(sql);

                    if (!ds.EOF)
                    {
                        string id = ds["class"] + "_" + ds["seq"];

                        Panel tr = (Panel)p_list.FindControl("tr_" + id);
                        Panel td = (Panel)tr.FindControl("td_" + id);
                        DropDownList cbo = (DropDownList)td.FindControl("cbo_" + id);


                        StringBuilder sb1 = new StringBuilder();
                        StringBuilder sb2 = new StringBuilder();

                        sb1.Append("insert eipe.dbo.ipqc_flow_record ( ");
                        sb1.Append(" rowid ");
                        sb2.AppendFormat("values ('{0}' ", Guid.NewGuid().ToString());

                        sb1.Append(",ipqc_id ");
                        sb2.AppendFormat(",'{0}' ", Request.QueryString["ROWNO"].Trim());

                        sb1.Append(",commit_id ");
                        sb2.AppendFormat(",'{0}' ", cbo.SelectedValue);
                        sb1.Append(",seq");
                        sb2.AppendFormat(",'{0}' ",id);
                        sb1.Append(",flow_id ) ");
                        sb2.AppendFormat(",'{0}') ", uid);

                        string insert = sb1.ToString() + sb2.ToString();
                        Utility.log(insert);
                        ds.ExecuteNonQuery(insert);

                    }

                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /*
        private void saveform2()
        {
            try
            {

                using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    string uid = CurrentUser.ID.Replace("{", "").Replace("}", "");
                    string sql = string.Format("select * from eipe.dbo.ipqc_flow where uid='{0}'", uid);
                    ds.Open(sql);

                    if (!ds.EOF)
                    {
                        //p_list->tr->td->select
                        string id = ds["class"] + "_" + ds["seq"];
                        //bool outside = false;
                        //DropDownList cbo = new DropDownList();
                        //foreach (object p in p_list.Controls)
                        //{
                        //    if (p is System.Web.UI.WebControls.Panel)
                        //    {
                        //        Panel tr = (Panel)p;
                        //        string tr_id = "tr_" + id;
                                
                        //        if (tr.ID == tr_id)
                        //        {
                        //            foreach (object p2 in tr.Controls)
                        //            {
                        //                if (p2 is System.Web.UI.WebControls.Panel)
                        //                {
                        //                    Panel td = (Panel)p2;

                        //                    string td_id = "td_" + id;
                        //                    if (td.ID == td_id)
                        //                    {
                        //                        foreach (object o in td.Controls)
                        //                        {
                        //                            if (o is DropDownList)
                        //                            {
                        //                                cbo = (DropDownList)o;

                        //                                string cbo_id = "cbo_" + id;
                        //                                if (cbo.ID == cbo_id)
                        //                                {
                        //                                    outside = true;
                        //                                    break;
                        //                                }
                        //                            }
                        //                            if (outside == true)
                        //                            {
                        //                                break;
                        //                            }
                        //                        }
                        //                    }

                        //                }
                        //                if (outside == true)
                        //                {
                        //                    break;
                        //                }
                        //            }
                        //        }

                                 
                        //    }
                        //    if (outside==true)
                        //    {
                        //        break;
                        //    }


                        //}

                        //Panel tr = (Panel)p_list.FindControl("tr_"+ id);
                        //Panel td = (Panel)tr.FindControl("td_"+ id);
                        //DropDownList cbo = (DropDownList)td.FindControl("cbo_"+ id); 


                        StringBuilder sb1 = new StringBuilder();
                        StringBuilder sb2 = new StringBuilder();

                        sb1.Append("insert eipe.dbo.ipqc_flow_record ( ");
                        sb1.Append(" rowid ");
                        sb2.AppendFormat("value( '{0}' ", Guid.NewGuid().ToString());

                        sb1.Append(" ,ipqc_id ");
                        sb2.AppendFormat(",'{0}' ", Request.QueryString["ROWNO"].Trim());

                        sb1.Append(" ,commint_id ");
                        sb2.AppendFormat(",'{0}' ", cbo.SelectedValue);
                        sb1.Append(" ,flow_id ) ");
                        sb2.AppendFormat(",'{0}') ", ds["rowno"]);

                        string insert = sb1.ToString() + sb2.ToString();
                        ds.ExecuteNonQuery(insert);

                    }

                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        */

        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            this.GoBack();
        }
        protected void SendMail(string type)
        {
            try
            {
                switch (type)
                {
                    case "Next":
                        ApproveMail();
                        break;
                    case "Complete":
                        FinishApprove();
                        Inform();
                        break;
                    case "Terminate":
                        RejectResult();
                        break;
                    case "Back":
                        ApproveMail();
                        break;
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private string mailbody()
        {
            try
            {
                StringBuilder sb = new StringBuilder();

                //getCSCCaption
                Dictionary<string, string> user = Utility.GetUIDInfo(FIELD_inituser.Text);

                sb.AppendFormat("<table style=\"width:80%;text-align: center;\" ><tr><td> <p style=\"color:#3399FF;text-align: center;font-weight: bold;font-size: 16px;\" >{0}</p></td></tr> ", getStr("mk"));
                sb.AppendFormat("<tr><td> <p style=\"color:#639430;text-align: center;font-weight: bold;font-size: 24px;\" >{0}</p></td></tr>", getStr("quality_record"));
                sb.Append("<tr><td style=\"width:100%\" > <table border=\"1\" style=\"border:1px solid #808080;width:100%;margin:10px 10px;border-collapse: collapse;border-spacing: 0;\"><tr> ");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;width:20%\" >{0} </td> ", getStr("initiator"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;width:30%\" >{0}</td> ", user["NAME"]);
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;width:20%\" >{0}</td> ", getStr("record_dt"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;width:30%\" >{0}</td></tr> ", FIELD_initdate.Text);
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", getStr("disposition"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td> ", FIELD_IPQC_NO.Text);
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}. </td> ", getStr("traveling"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr> ", FIELD_sheet_NO.Text);
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", getStr("station"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td> ", FIELD_station.Text);
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", getStr("customer"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr> ", getCSCCaption(FIELD_customer.Text));
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", getStr("product"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td> ", getCSCCaption(FIELD_Product_Name.Text));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", getStr("program"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr> ", getCSCCaption(FIELD_Program_Name.Text));
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", getStr("pn"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td> ", getCSCCaption(FIELD_PN.Text));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}. </td> ", getStr("rev"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr> ", FIELD_Rev.Text);
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\"> {0}</td> ", getStr("stage"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td> ", FIELD_Stage.Text);
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", getStr("defect_rate"));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr> ", FIELD_Defect_Rat.Text);
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", getStr("description"));
                sb.AppendFormat(" <td colspan=\"3\" style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr></table></td></tr></table> ", FIELD_Description.Text);


                return sb.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private void ApproveMail()
        {
            try
            {

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("select   REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid from dgflowqueue a left join dguser" +
                    " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") + "'  AND reviewdate IS NULL AND qseq is not null ");
                if (rs.EOF)
                    return;
                MailAddress to = new MailAddress(rs["email"].ToString());
                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                MailMessage message = new MailMessage(from, to);

                String allques = rs["name"].ToString() + " 您好:" + "<br>" +
                                 "<br>" +
                                 "品質異常處理系統提醒您資訊如下:" + "<br><br>" +
                                 "<a href=\"http://eip.minaik.com.tw/IPQC/IPQCView.aspx?rowno=" + Request.QueryString["rowno"].ToString() + "\" >品質異常處理審核</a><br><br>" +
                                mailbody() +
                                "<br>" +
                                "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                message.Subject = "異常單號 " + this.FIELD_IPQC_NO.Text + " - 反應站別 " + this.FIELD_station.Text + " - 異常描述" + this.FIELD_Description.Text;

                message.IsBodyHtml = true;
                message.Body = allques;


                SmtpClient client = new SmtpClient("192.168.0.12");

                client.Send(message);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        private void RejectResult()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT U.name NAME , U.email,U.id " +
                         "  FROM EIPE.DBO.IPQC IPQC LEFT JOIN EIPA.DBO.DGUSER U   " +
                         "    ON IPQC.inituser = U.ID  " +
                         " WHERE 1=1  " +
                         "   AND IPQC.rowno = '" + Request.QueryString["rowno"].ToString() + "'   ");
                if (rs.EOF)
                    return;
                MailAddress to = new MailAddress(rs["email"].ToString());
                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                MailAddress bcc = new MailAddress("rage.mai@minaik.com.tw");
                MailMessage message = new MailMessage(from, to);
                message.Bcc.Add(bcc);
                String allques = rs["name"].ToString() + " 您好:" + "<br>" +
                                 "<br>" +
                                 "品質異常處理系統提醒您資訊如下:" + "<br><br>" +
                                 "<a href=\"http://eip.minaik.com.tw/IPQC/IPQCView.aspx?rowno=" + Request.QueryString["rowno"].ToString() + "\" >品質異常處理審核</a><br><br>" +
                                mailbody() +
                                "<br>" +
                                "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                message.Subject = "異常單號 " + this.FIELD_IPQC_NO.Text + " - 反應站別 " + this.FIELD_station.Text + " - 異常描述" + this.FIELD_Description.Text + " 退回申請者";

                message.IsBodyHtml = true;
                message.Body = allques;


                SmtpClient client = new SmtpClient("192.168.0.12");

                client.Send(message);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private void FinishApprove()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT U.name NAME , U.email,U.id " +
                         "  FROM EIPE.DBO.IPQC IPQC LEFT JOIN EIPA.DBO.DGUSER U   " +
                         "    ON IPQC.inituser = U.ID  " +
                         " WHERE 1=1  " +
                         "   AND IPQC.rowno = '" + Request.QueryString["rowno"].ToString() + "'   ");
                if (rs.EOF)
                    return;
                MailAddress to = new MailAddress(rs["email"].ToString());
                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                MailAddress bcc = new MailAddress("rage.mai@minaik.com.tw");
                MailMessage message = new MailMessage(from, to);
                message.Bcc.Add(bcc);
                String allques = rs["name"].ToString() + " 您好:" + "<br>" +
                                 "<br>" +
                                 "品質異常處理系統提醒您資訊如下:" + "<br><br>" +
                                 "<a href=\"http://eip.minaik.com.tw/IPQC/IPQCView.aspx?rowno=" + Request.QueryString["rowno"].ToString() + "\" >品質異常處理審核</a><br><br>" +
                                mailbody() +
                                "<br>" +
                                "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                message.Subject = "異常單號 " + this.FIELD_IPQC_NO.Text + " - 反應站別 " + this.FIELD_station.Text + " - 異常描述" + this.FIELD_Description.Text + "已完成審核";

                message.IsBodyHtml = true;
                message.Body = allques;


                SmtpClient client = new SmtpClient("192.168.0.12");

                client.Send(message);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private void Inform()
        {
            List<string> list = new List<string>();
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                rs.Open(" SELECT m.* FROM eipe.dbo.ipqc_mail m  ");

                while (!rs.EOF)
                {
                    list.Add(rs["mail"].ToString());
                    rs.MoveNext();
                } 
            }

            //MailAddress to = new MailAddress(rs["email"].ToString());

            MailAddress to = new MailAddress(string.Join(",", list.ToArray()));


            MailAddress from = new MailAddress("eip@minaik.com.tw", "eIP(員工入口網站)");
            MailMessage message = new MailMessage(from, to);
            StringBuilder sb = new StringBuilder();
            sb.Append("您好<br>");
            sb.Append("品質異常處理系統提醒您，");
            if (_status == (int)status.Send)
            {
                sb.Append("該筆資料已發送審核<br><br>");
            }
            else
            {
                sb.Append("該筆資料已被中止<br><br>");
            }
            sb.Append(mailbody() + "<br>");
            sb.Append("詳細資料，請點連結至 <a href=\"" + Utility.LocalUrl + "/IPQC/IPQCView.aspx?rowno=" + Request.QueryString["ROWNO"].ToString() + "\" >品質異常處理系統</a>查閱<br>");
            sb.Append("如您想了解更多有關員工入口網站的資訊請點選以下連結進入<br>");
            sb.Append("<a href=\"" + Utility.LocalUrl + "\">員工入口網站</a><br>");
            sb.Append("感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font><br>");

            string action = Utility.tw_status(_status.ToString());

            //message.Subject = "異常單號 " + this.FIELD_IPQC_NO.Text + " - 反應站別 " + this.FIELD_station.Text + " - 異常描述" + this.FIELD_Description.Text;
            message.Subject = "[通知][" + action + "] 異常單號 " + this.FIELD_IPQC_NO.Text + " - 反應站別 " + this.FIELD_station.Text + " - 異常描述" + this.FIELD_Description.Text;
            message.IsBodyHtml = true;
            //message.Bcc.Add(Utility.MIS_Mail);
            message.Body = sb.ToString();
            SmtpClient client = new SmtpClient("192.168.0.12");
            client.Send(message);


        }

        private void showAttach(HyperLink hlink, string id, string context)
        {
            if (context.ToLower().Contains(".jpg"))


            //                        this.check_Abnormal_FILE.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
            {
                //hlink.ImageUrl = "FileDownload.aspx?id=" +id;
                //hlink.NavigateUrl = "FileDownload.aspx?id=" +id;

                System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
                img.ImageUrl = "FileDownload.aspx?id=" + id;
                img.Style.Add("width", "270px");

                hlink.Controls.Add(img);

            }
            else
            {
                //this.check_Abnormal_FILE.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));
                hlink.Text = context;
                hlink.NavigateUrl = "FileDownload.aspx?id=" + id;
                hlink.Target = "_blank";
            }
        }

        public string getStr(string key)
        {
            return this.GetLocalResourceObject(key).ToString();
        }

        private void MailReview()
        {
            string mail = txt_Rmail.Value.Trim();
            if (!string.IsNullOrEmpty(mail))
            {
                string[] MailList = mail.Split(',');

                foreach (string Item in MailList)
                {
                    Dictionary<string, string> User = Utility.GetUIDInfo(Item);

                    string Subject = "(通知) 品質異常處理單 - 單號:" + FIELD_sheet_NO.Text;
                    StringBuilder sb = new StringBuilder();
                    sb.AppendFormat("{0} 您好，<br><br> ", User["NAME"].ToString());
                    sb.Append("品質異常處理系統提醒您資訊如下:");
                    sb.AppendFormat("<a href=\"{0}/IPQC/IPQCView.aspx?rowno={1}\" >品質異常處理審核</a><br><br>", Utility.LocalUrl, Request.QueryString["rowno"].ToString());
                    sb.Append(mailbody());
                    sb.Append("如您想了解更多有關員工入口網站的資訊請點選以下連結進入 <br>");
                    sb.Append("<a href=\"" + Utility.LocalUrl + "\">員工入口網站</a><br>");
                    sb.Append("感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>");
                    Utility.SendMail(User["EMAIL"].ToString(), "ePortal(員工入口網站)", Subject, sb.ToString());
                }


            }

        }

        public string getCSCCaption(string id)
        {
            string Title = "";
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                string sql = string.Format("SELECT * FROM csc_base_file where  lid='{0}' ", id);
                rs.Open(sql);

                if (!rs.EOF)
                {
                    Title = rs["LCaption"].ToString();
                }

            }

            return Title;
        }

         
    }
}