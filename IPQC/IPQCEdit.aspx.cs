using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

namespace IPQC
{
    public partial class IPQCEdit : IPQC_Base
    {


        protected void Page_Load(object sender, System.EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {

                    lang = CurrLang;

                    initdate();
                    initvalue();
                    initfile();
                    getflow(p_list);
                    getView();

                    Utility.setEnable(false, BUTTON_RemindReviewer, BUTTON_StopRequest, BUTTON_SendRequest, BUTTON_save, BUTTON_back);
                    if (_status == (int)status.Waite || _status == (int)status.Stop)
                    {
                        Utility.setEnable(true, BUTTON_SendRequest, BUTTON_save, BUTTON_back);
                    }

                    if (_status == (int)status.Send)
                    {
                        Utility.setEnable(true, BUTTON_RemindReviewer, BUTTON_StopRequest, BUTTON_back);
                    }

                    if (_status == (int)status.Complete)
                    {
                        Utility.setEnable(true, BUTTON_back);
                    }


                    if (Utility.MIS_Manager(CurrentUser.LogonID))
                    {
                        Utility.setEnable(true, BUTTON_RemindReviewer, BUTTON_StopRequest, BUTTON_SendRequest, BUTTON_save, BUTTON_back);
                    }

                    BUTTON_RemindReviewer.Text = getStr("remind_reviewer");
                    BUTTON_StopRequest.Text = getStr("stop");
                    BUTTON_SendRequest.Text = getStr("sb");
                    BUTTON_save.Text = getStr("save");
                    BUTTON_back.Text = getStr("back");
                    // generate form;
                }
            }
            catch (Exception ex)

            {
                //this.AddError(this, "Page_Load", "", ex.Message + "<br/>" + ex.StackTrace);
                Response.Write(ex.Message + "<br/>" + ex.StackTrace);
            }
        }


        private void initfile()
        {
            try
            {
                //Response.Write("1<br/>");
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM EIPE.DBO.IPQC_file WHERE rowno='" + this.Request.QueryString["ROWNO"].ToString() + "'");
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
                        //Response.Write("Quality<br/>");
                        if (rs["FileType"].ToString().ToLower().Contains(".jpg"))
                            this.check_Abnormal_FILE.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
                        else
                            this.check_Abnormal_FILE.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));
                        //$( "#riverroad" ).tooltip({ content: '<img src="yourImagePath" />' });
                    }
                    if (rs["FileField"].ToString().Contains("Dimension"))
                    {
                        //Response.Write("Dimension<br/>");
                        if (rs["FileType"].ToString().ToLower().Contains(".jpg"))
                            this.check_Dimension_file.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
                        else
                            this.check_Dimension_file.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));
                    }
                    if (rs["FileField"].ToString().Contains("Appearance"))
                    {
                        //Response.Write("Appearance<br/>");
                        if (rs["FileType"].ToString().ToLower().Contains(".jpg"))
                            this.check_Appearance_file.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
                        else
                            this.check_Appearance_file.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));
                    }
                    if (rs["FileField"].ToString().Contains("Cleanlines"))
                    {
                        //Response.Write("Cleanlines<br/>");
                        if (rs["FileType"].ToString().ToLower().Contains(".jpg"))
                            this.check_Cleanlines_file.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
                        else
                            this.check_Cleanlines_file.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));
                    }
                    if (rs["FileField"].ToString().Contains("Reliability"))
                    {
                        //Response.Write("Reliability<br/>");
                        if (rs["FileType"].ToString().ToLower().Contains(".jpg"))
                            this.check_Reliability_file.Items.Add(new ListItem("<img width=\"" + width + "\" src=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" />", rs["id"].ToString()));
                        else
                            this.check_Reliability_file.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs["id"].ToString() + "\" target=\"_blank\">" + rs["FileName"].ToString() + "</a>", rs["id"].ToString()));
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
                rs.Open("SELECT * FROM EIPE.DBO.IPQC WHERE rowno='" + this.Request.QueryString["ROWNO"].ToString() + "'");

                if (!rs.EOF)
                {
                    this.FIELD_IPQC_NO.Text = rs["IPQC_NO"].ToString();
                    this.FIELD_inituser.Text = rs["inituser"].ToString();
                    this.FIELD_initdate.Text = rs["initdate"].ToString();
                    this.FIELD_sheet_NO.Text = rs["sheet_NO"].ToString();
                    this.FIELD_station.SelectedValue = rs["station"].ToString();
                    this.FIELD_customer.SelectedValue = rs["customer"].ToString();
                    this.FIELD_Program_Name.SelectedValue = rs["Program_Name"].ToString();
                    this.FIELD_Product_Name.SelectedValue = rs["Product_Name"].ToString();
                    this.FIELD_PN.SelectedValue = rs["PN"].ToString();
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


                    this.FIELD_UAI_no.Text = rs["UAI_no"].ToString();
                    _status = int.Parse(rs["isState"].ToString());

                }

                rs.Close();
            }
            catch (Exception ex)
            {

                Utility.log(ex.Message, ex.StackTrace);
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

                //#region init MRB Team commit
                //this.FIELD_QA_dept.Items.Clear();
                //this.FIELD_NPI_dept.Items.Clear();
                //this.FIELD_Prod_dept.Items.Clear();
                //this.FIELD_Tooling_Dept.Items.Clear();

                ////update by carol 20161125
                //this.FIELD_PMC_Dept.Items.Clear();


                //while (!rs.EOF)
                //{
                //    if (rs["parameter"].ToString().Contains("commit"))
                //    {
                //        this.FIELD_QA_dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //        this.FIELD_NPI_dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //        this.FIELD_Prod_dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //        this.FIELD_Tooling_Dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //        this.FIELD_PMC_Dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));


                //    }
                //    rs.MoveNext();
                //}
                //rs.MoveFirst();
                //#endregion

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
                 * */
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
                this.FIELD_Dimension_check.Items.Clear();
                this.FIELD_Dimension_check.Items.Add(new ListItem("NA", ""));
                this.FIELD_Dimension_check.Items.Add(new ListItem("合格", "合格"));
                this.FIELD_Dimension_check.Items.Add(new ListItem("不合格", "不合格"));
                #endregion
                #region Init FIELD_Appearance_check
                this.FIELD_Appearance_check.Items.Clear();
                this.FIELD_Appearance_check.Items.Add(new ListItem("NA", ""));
                this.FIELD_Appearance_check.Items.Add(new ListItem("合格", "合格"));
                this.FIELD_Appearance_check.Items.Add(new ListItem("不合格", "不合格"));
                #endregion
                #region Init FIELD_Cleanliness_check
                this.FIELD_Cleanliness_check.Items.Clear();
                this.FIELD_Cleanliness_check.Items.Add(new ListItem("NA", ""));
                this.FIELD_Cleanliness_check.Items.Add(new ListItem("合格", "合格"));
                this.FIELD_Cleanliness_check.Items.Add(new ListItem("不合格", "不合格"));
                #endregion
                #region Init FIELD_Reliability_check
                this.FIELD_Reliability_check.Items.Clear();
                this.FIELD_Reliability_check.Items.Add(new ListItem("NA", ""));
                this.FIELD_Reliability_check.Items.Add(new ListItem("合格", "合格"));
                this.FIELD_Reliability_check.Items.Add(new ListItem("不合格", "不合格"));
                #endregion

                #region 客戶名稱
                rs.Open("SELECT * FROM csc_base_file where tid='A' and  LActi='Y' order by Lcaption");
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
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
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

            if (this.IsValid)
            {

                try
                {
                    Guid rowno = new Guid(Request.QueryString["ROWNO"].ToString());

                    saveform(rowno);

                    savefile(rowno);

                    Response.Redirect("IPQCEdit.aspx?rowno=" + Request.QueryString["ROWNO"].ToString());
                }
                catch (Exception ex)
                {
                    string body = string.Format("Message:{0}<br>StackTrace:{1}<br>http://eip.minaik.com.tw/IPQC/IPQCEdit.aspx?ROWNO={2}", ex.Message, ex.StackTrace, Request.QueryString["ROWNO"].ToString());

                    Utility.SendMail(Utility.MIS_Mail, "EIP", "IPQC Error-" + FIELD_IPQC_NO.Text.ToString(), body);

                }
            }
        }
        /// <summary>
        /// 儲存頁面資料
        /// </summary>
        /// <param name="rowno"></param>
        private void saveform(Guid rowno)
        {
            try
            {



                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    rs.Open("SELECT * FROM EIPE.DBO.IPQC WHERE rowno='" + Request.QueryString["ROWNO"].ToString() + "'");



                    rs["sheet_NO"] = this.FIELD_sheet_NO.Text;
                    rs["station"] = this.FIELD_station.SelectedValue;
                    rs["customer"] = this.FIELD_customer.SelectedValue;
                    rs["Program_Name"] = FIELD_Program_Name.SelectedValue;
                    rs["Product_Name"] = this.FIELD_Product_Name.SelectedValue;
                    rs["PN"] = this.FIELD_PN.SelectedValue;
                    rs["Rev"] = this.FIELD_Rev.Text;
                    rs["Stage"] = this.FIELD_Stage.SelectedValue;
                    rs["Defect_Rat"] = this.FIELD_Defect_Rat.Text;
                    rs["Description"] = this.FIELD_Description.Text;
                    rs["Dimension_check"] = this.FIELD_Dimension_check.SelectedValue;
                    rs["Dimension"] = this.FIELD_Dimension.Text;
                    rs["Appearance_check"] = this.FIELD_Appearance_check.SelectedValue;
                    rs["Appearance"] = this.FIELD_Appearance.Text;
                    rs["Cleanlines_check"] = this.FIELD_Cleanliness_check.SelectedValue;
                    rs["Cleanlines"] = this.FIELD_Cleanlines.Text;
                    rs["Reliability_check"] = this.FIELD_Reliability_check.SelectedValue;
                    rs["Reliability"] = this.FIELD_Reliability.Text;
                    rs["QA_Judgement"] = this.FIELD_Judgement.SelectedValue;
                    rs["QA_Judgement_commit"] = this.FIELD_QA_Judgement_commit.SelectedValue;
                    rs["CAPA_Sheet_NO"] = this.FIELD_CAPA_Sheet_NO.Text;


                    rs.Update();
                    rs.Close();
                }
            }
            catch (Exception ex)
            {
                
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// 儲存檔案資料
        /// </summary>
        /// <param name="rowno"></param>
        private void savefile(Guid rowno)
        {
            try
            {
                string FileList = "";
                #region check_Abnormal_FILE
                for (int x = 0; x < this.check_Abnormal_FILE.Items.Count; x++)
                {
                    if (this.check_Abnormal_FILE.Items[x].Selected == true)
                    {
                        if (FileList == "")
                            FileList = "'" + this.check_Abnormal_FILE.Items[x].Value + "'";
                        else
                            FileList = FileList + ",'" + this.check_Abnormal_FILE.Items[x].Value + "'";
                    }
                }
                #endregion
                #region check_Dimension_file
                for (int x = 0; x < this.check_Dimension_file.Items.Count; x++)
                {

                    if (this.check_Dimension_file.Items[x].Selected == true)
                    {
                        
                        if (FileList == "")
                            FileList = "'" + this.check_Dimension_file.Items[x].Value + "'";
                        else
                            FileList = FileList + ",'" + this.check_Dimension_file.Items[x].Value + "'";
                    }
                }
                #endregion
                #region check_Appearance_file
                for (int x = 0; x < this.check_Appearance_file.Items.Count; x++)
                {
                    if (this.check_Appearance_file.Items[x].Selected == true)
                    {
                        if (FileList == "")
                            FileList = "'" + this.check_Appearance_file.Items[x].Value + "'";
                        else
                            FileList = FileList + ",'" + this.check_Appearance_file.Items[x].Value + "'";
                    }
                }
                #endregion
                #region check_Cleanlines_file
                for (int x = 0; x < this.check_Cleanlines_file.Items.Count; x++)
                {
                    if (this.check_Cleanlines_file.Items[x].Selected == true)
                    {
                        if (FileList == "")
                            FileList = "'" + this.check_Cleanlines_file.Items[x].Value + "'";
                        else
                            FileList = FileList + ",'" + this.check_Cleanlines_file.Items[x].Value + "'";
                    }
                }
                #endregion
                #region check_Reliability_file
                for (int x = 0; x < this.check_Reliability_file.Items.Count; x++)
                {
                    if (this.check_Reliability_file.Items[x].Selected == true)
                    {
                        if (FileList == "")
                            FileList = "'" + this.check_Reliability_file.Items[x].Value + "'";
                        else
                            FileList = FileList + ",'" + this.check_Reliability_file.Items[x].Value + "'";
                    }
                }
                #endregion


                #region 刪除附檔------------------------------------------------------------------------------------------
                if (FileList != "")
                {
                    Deletefile(FileList);
                    SmoothEnterprise.Database.DataSet rsD = new SmoothEnterprise.Database.DataSet();
                    rsD.ExecuteNonQuery("Delete FROM EIPE.DBO.IPQC_file WHERE id in (" + FileList + ")");
                }
                #endregion 刪除附檔------------------------------------------------------------------------------------------
                HttpFileCollection files = HttpContext.Current.Request.Files;
                System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
                int att_count = 0;
                string filepath = @"ftp://ftp.minaik.com.tw/WQDP/IPQC";
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs2.Open("SELECT * FROM EIPE.DBO.IPQC_file WHERE 1=0");

                foreach (string FieldName in files.AllKeys)
                {
                    //Response.Write(FieldName+"<br/>");
                    HttpPostedFile postedfile = files[FieldName];
                    string filename, fileExt, filePath;
                    filename = System.IO.Path.GetFileName(postedfile.FileName);//.Replace(" ", "_").Replace("#", "_").Replace(")", "_").Replace("(", "_");    //抓取文件名

                    fileExt = System.IO.Path.GetExtension(postedfile.FileName);    //抓取文件附檔名

                    if (postedfile.ContentLength > 0)
                    {
                        string filefullpath = filepath + "/" + filename;
                        //Response.Write(filefullpath);
                        rs2.Add();
                        //att_count = att_count + 1;
                        //String tafilename = "filename" + att_count.ToString();
                        //String taattach = "attachment" + att_count.ToString();
                        //String tafilexten = "fileexten" + att_count.ToString();
                        string tempfullfilename = @"D:\MDPM_upload\" + filename;
                        string objectfullfilename = filefullpath;
                        postedfile.SaveAs(tempfullfilename);
                        //byte[] fileBytes = new byte[postedfile.ContentLength];
                          Upload(tempfullfilename, objectfullfilename, "minaik", "mat2015");
                        
                        rs2["ID"] = Guid.NewGuid();
                        rs2["FileName"] = filename;
                        rs2["rowno"] = rowno;
                        rs2["FILEPATH"] = filepath;
                        rs2["FileField"] = FieldName;
                        rs2["FileType"] = fileExt;
                        rs2.Update();
                        System.IO.File.Delete(tempfullfilename);
                    }
                    //}
                }
                rs2.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void Deletefile(string FileList)
        {
            SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs3.Open("SELECT filepath , filename " +
                     " FROM EIPE.DBO.IPQC_file  " +
                     "WHERE ID IN (" + FileList + ")");
            while (!rs3.EOF)
            {
                try
                {
                    //WebRequest request = WebRequest.Create(new Uri(@"ftp://ftp.minaik.com.tw/WQDP/IPQC/" + rs3["filename"].ToString()));
                    WebRequest request = WebRequest.Create(new Uri(@"ftp://192.168.0.248/WQDP/IPQC/" + rs3["filename"].ToString()));
                    request.Credentials = new NetworkCredential("minaik", "mat2015");
                    request.Method = WebRequestMethods.Ftp.DeleteFile;
                    FtpWebResponse resp = (FtpWebResponse)request.GetResponse();
                }
                catch
                {
                }
                rs3.MoveNext();
            }
            rs3.Close();
            rs3.Dispose();
        }
        /// <summary>
        /// 上傳file至FTP
        /// </summary>
        /// <param name="檔案名稱"></param>
        /// <param name="FTP目的"></param>
        /// <param name="login名稱"></param>
        /// <param name="Password"></param>
        /// <returns></returns>
        private bool Upload(string fileName, string uploadUrl, string UserName, string Password)
        {
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
                //Response.Write("開始上傳資料流");
                while (true)
                {//開始上傳資料流
                    bytesRead = fileStream.Read(buffer, 0, buffer.Length);
                    if (bytesRead == 0)
                        break;
                    requestStream.Write(buffer, 0, bytesRead);
                }
                //Response.Write("結束上傳資料流");
                requestStream.Close();
                uploadResponse = (FtpWebResponse)uploadRequest.GetResponse();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("FTP 有誤，請聯絡MIS<br>" + ex.Message, ex);
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

       
        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("IPQC.aspx");
            //this.GoBack("IPQC.aspx",new string[]{"IPQCDelete.aspx"});
        }

        protected void BUTTON_delete_Click(object sender, System.EventArgs e)
        {
            //Response.Redirect("IPQCDelete.aspx?);
        }
        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            Label label;
            object obj = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
            label = (Label)obj;
            label.Text = e["Flow_Comment"].ToString();
            label.Enabled = true;
            label.ForeColor = System.Drawing.Color.Red;
            label.Font.Bold = true;
            label.Font.Size = 13;


            //電子簽章呈現-----------------------------------------------------------------------------------------
            System.Web.UI.WebControls.Image sin1;
            object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
            sin1 = (System.Web.UI.WebControls.Image)obj5;
            // Response.Write((string)e["Flow_loginID"].ToString() + "---");
            sin1.ImageUrl = "~/image/" + (string)e["Flow_loginID"] + ".JPG";
            if ((string)e["Flow_loginID"].ToString().Length.ToString() == "0")
            {
                sin1.Visible = false;
            }



            System.Web.UI.WebControls.Image sin2;
            object obj6 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image2");
            sin2 = (System.Web.UI.WebControls.Image)obj6;
            if ((string)e["IniReviewer"].ToString().Length.ToString() == "0")
                sin2.Visible = false;
            else
                sin2.Visible = true;
        }
        protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            try
            {


                Update_IPQC_status(Request.QueryString["ROWNO"], status.Send);

                bool pass = setflow(e);
                if (pass == true)
                {
                    SendMail();
                    Inform();
                }

            }
            catch (Exception ex)
            {

                this.Response.Write(ex.Message + "<br/>" + ex.StackTrace);
                //this.AddError(this, "SendRequest_Click", "", ex.Message + "<br/>" + ex.StackTrace);
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

        private bool setflow(SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            bool pass = false;

            try
            {

                string spcid = "", spcnm = "";
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
                #region 加入各單位會簽
                /**平簽單位
                 *  開發部 模具 製造 生管部 品保部  **/
                rs.Open("SELECT *   FROM eipe.dbo.ipqc_flow F  WHERE F.enable = 1 and mail='0'  ORDER BY class, seq");


                List<string> gLevel = new List<string>();
                List<string> gTitle = new List<string>();

                List<string> leve1 = new List<string>();
                List<string> leve2 = new List<string>();
                List<string> leve3 = new List<string>();

                List<string> T1 = new List<string>();
                List<string> T2 = new List<string>();
                List<string> T3 = new List<string>();

                while (!rs.EOF)
                {
                    string level = rs["class"].ToString();
                    string user = rs["uid"].ToString();
                    string text = rs["text"].ToString();



                    if (level == "1")
                    {
                        leve1.Add(user);
                        T1.Add(text);

                    }

                    if (level == "2")
                    {
                        leve2.Add(user);
                        T2.Add(text);
                    }

                    if (level == "3")
                    {
                        leve3.Add(user);
                        T3.Add(text);
                    }

                    rs.MoveNext();
                }
                rs.Close();
                #endregion

                if (leve1.Count > 0)
                {
                    gLevel.Add(string.Join("@", leve1.ToArray()));
                    gTitle.Add(string.Join("@", T1.ToArray()));

                }

                if (leve2.Count > 0)
                {
                    gLevel.Add(string.Join("@", leve2.ToArray()));
                    gTitle.Add(string.Join("@", T2.ToArray()));

                }

                if (leve3.Count > 0)
                {
                    gLevel.Add(string.Join("@", leve3.ToArray()));
                    gTitle.Add(string.Join("@", T3.ToArray()));

                }

                int count = 0;

                //gLevel.Clear();
                //gTitle.Clear();


                //managerid.Add("02CA2090-C5D0-455B-A671-5D7168D08559");
                //managernm.Add("直屬主管");

                //gLevel.Add("02CA2090-C5D0-455B-A671-5D7168D08559");
                //gTitle.Add("T1");

                //gLevel.Add("2EDF96BA-BFCB-4F67-947C-D2B9BAE2D62B");
                //gTitle.Add("T2");

                //gLevel.Add("22C260FA-AED3-463D-AF20-5CAA78F24CBD");
                //gTitle.Add("T3");

                //gLevel.Add("0DC215C7-0043-4CD6-AC6E-659ECDC88994");
                //gTitle.Add("T4");



                foreach (string user in gLevel)
                {
                    this.FlowClient1.AddParameter("USER" + count.ToString(), user);
                    this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), gTitle[count].ToString());
                    count++;
                }


                FlowClient1.TypeName = "sharflow12.Flowwork.sharflow121";
                FlowClient1.Text = getStr("quality_system");// +this.FIELD_occano.Text.Trim() + " 客戶：" + this.FIELD_occa02.Text.Trim();  //更改流程名稱

                sharflow12.Flowwork.sharflow121 flow = new sharflow12.Flowwork.sharflow121();

                switch (count)  //依舊arraylist裡面有幾個,來判斷走那條flow
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
                }


                //int count = 0;
                //foreach (string i in managerid)  //將簽核人員id塞進flow
                //{
                //    string title = managernm[count].ToString();

                //    count++;
                //}

                e.NextNode.ReviewerURL = "/IPQC/IPQCView.aspx";
                pass = true;

            }
            catch (Exception ext)
            {
                Utility.log(ext.Message, ext.StackTrace);
            }

            return pass;


        }

        protected void SendMail()
        {
            //try
            //{

            //    using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            //    {
            //        rs.Open("SELECT u.*,f.text FROM eipe.dbo.ipqc_flow F left join eipa.dbo.dguser u on f.uid=u.id " +
            //           " WHERE F.enable = 1  ORDER BY seq");

            //        while (!rs.EOF)
            //        {
            //          　MailAddress to = new MailAddress(rs["email"].ToString());
            //            //MailAddress to = new MailAddress(rs["email"].ToString());
            //            MailAddress from = new MailAddress("eip@minaik.com.tw", "EIP(員工入口網站)");
            //            MailMessage message = new MailMessage(from, to);
            //            StringBuilder sb = new StringBuilder();

            //            sb.Append("您好<br>");
            //            sb.Append("品質異常處理系統提醒您，");
            //            if (_status == (int)status.Send)
            //            {
            //                sb.Append("該筆資料已發送審核<br><br>");
            //            }
            //            else
            //            {
            //                sb.Append("該筆資料已被中止<br><br>");
            //            }
            //            sb.Append(mailbody() + "<br>");
            //            sb.Append("詳細資料，請點連結至 <a href=\"" + Utility.LocalUrl + "/IPQC/IPQCView.aspx?rowno=" + Request.QueryString["ROWNO"].ToString() + "\" >品質異常處理系統</a>查閱<br>");
            //            sb.Append("如您想了解更多有關員工入口網站的資訊請點選以下連結進入<br>");
            //            sb.Append("<a href=\"" + Utility.LocalUrl + "\">員工入口網站</a><br>");
            //            sb.Append("感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font><br>");

            //            string action = Utility.tw_status(_status.ToString());

            //            //message.Subject = "異常單號 " + this.FIELD_IPQC_NO.Text + " - 反應站別 " + this.FIELD_station.Text + " - 異常描述" + this.FIELD_Description.Text;
            //            message.Subject = "["+ action + "]異常單號 " + this.FIELD_IPQC_NO.Text + " - 反應站別 " + this.FIELD_station.Text + " - 異常描述" + this.FIELD_Description.Text;
            //            message.IsBodyHtml = true;
            //            message.Body = sb.ToString();
            //            SmtpClient client = new SmtpClient("192.168.0.12");
            //            client.Send(message);

            //            rs.MoveNext();
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Response.Write(ex.Message);
            //}
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
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;width:20%\" >{0} </td> ", "Initiator/開案人員");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;width:30%\" >{0}</td> ", user["NAME"]);
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;width:20%\" >{0}</td> ", "Initial date/開案日期");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;width:30%\" >{0}</td></tr> ", FIELD_initdate.Text);
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", "Disposition No /異常單號碼");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td> ", FIELD_IPQC_NO.Text);
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}. </td> ", "Traveling sheet No./工單號碼");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr> ", FIELD_sheet_NO.Text);
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", "Abnormal Station /異常站別");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td> ", FIELD_station.Text);
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", "Customer/客戶名稱");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr> ", getCSCCaption(FIELD_customer.Text));
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", "Product name/產品名稱");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td> ", getCSCCaption(FIELD_Product_Name.Text));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", "Program name/機種名稱");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr> ", getCSCCaption(FIELD_Program_Name.Text));
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", "P/N /產品圖號");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td> ", getCSCCaption(FIELD_PN.Text));
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}. </td> ", "Product Rev./產品版本");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr> ", FIELD_Rev.Text);
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\"> {0}</td> ", "Product stage/產品階段");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td> ", FIELD_Stage.Text);
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", "Defect Rate/不良率");
                sb.AppendFormat(" <td style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr> ", FIELD_Defect_Rat.Text);
                sb.AppendFormat(" <tr><td style=\"margin:2px 2px;padding:5px 10px;background-color: #D3F467;color: #433E15;text-align: right;font-weight: bolder;\" >{0}</td> ", "Description/異常描述");
                sb.AppendFormat(" <td colspan=\"3\" style=\"margin:2px 2px;padding:5px 10px;text-align:left;font-weight: bolder;\" >{0}</td></tr></table></td></tr></table> ", FIELD_Description.Text);


                return sb.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected void FIELD_customer_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string sq2 = "select cwid,LCaption,tid  from  csc_bom left join  csc_base_file on cwid=lid " +
                    "  where pwid='" + this.FIELD_customer.SelectedValue + "'  and  bomact='Y' and   LActi='Y' and  TID='F' ";
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                string LID = "";
                string LCaption = "";

                rs.Open("SELECT  LID,LCaption  FROM  csc_base_file    where LCaption='NA' and  LActi='Y'");
                if (!rs.EOF)
                {
                    LID = rs[0].ToString();
                    LCaption = rs[1].ToString();
                }
                rs.Close();

                FIELD_Product_Name.Items.Clear();
                sq2 = "select cwid,LCaption,tid  from  csc_bom left join  csc_base_file on cwid=lid " +
                  "  where pwid='" + FIELD_customer.SelectedValue + "'  and  bomact='Y' and   LActi='Y' and  TID='I' order by Lcaption ";
                FIELD_Product_Name.Items.Add(new ListItem(LCaption, LID));
                rs.Open(sq2);
                while (!rs.EOF)
                {
                    // profid = rs[1].ToString();
                    FIELD_Product_Name.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["cwid"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();

            }
            catch (Exception ex)
            {
                this.AddError(null, "FIELD_customer_SelectedIndexChanged", "", ex.Message + ex.StackTrace);
            }
        }

        protected void FIELD_Product_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                FIELD_Program_Name.Items.Clear();
                string sq2 = "select cwid,LCaption,tid  from  csc_bom left join  csc_base_file on cwid=lid " +
                   "  where pwid='" + FIELD_Product_Name.SelectedValue + "'  and  bomact='Y' and   LActi='Y' and  TID='F' ";


                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                string LID = "";
                string LCaption = "";

                rs.Open("SELECT  LID,LCaption  FROM  csc_base_file    where LCaption='NA' and  LActi='Y'");
                if (!rs.EOF)
                {
                    LID = rs[0].ToString();
                    LCaption = rs[1].ToString();
                }
                rs.Close();

                FIELD_Program_Name.Items.Add(new ListItem(LCaption, LID));
                rs.Open(sq2);
                while (!rs.EOF)
                {
                    FIELD_Program_Name.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["cwid"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
            }
            catch (Exception ex)
            {
                this.AddError(null, "", "", ex.Message + ex.StackTrace);
            }
        }

        protected void FIELD_Program_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string sq2 = "select cwid,LCaption,tid  from  csc_bom left join  csc_base_file on cwid=lid " +
                            "  where pwid='" + FIELD_Program_Name.SelectedValue + "'  and  bomact='Y' and   LActi='Y' and  TID='J' ";


                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);



                string LID = "";
                string LCaption = "";

                rs.Open("SELECT  LID,LCaption  FROM  csc_base_file    where LCaption='NA' and  LActi='Y'");
                if (!rs.EOF)
                {
                    LID = rs[0].ToString();
                    LCaption = rs[1].ToString();
                }
                rs.Close();

                FIELD_PN.Items.Clear();
                FIELD_PN.Items.Add(new ListItem(LCaption, LID));
                rs.Open(sq2);
                while (!rs.EOF)
                {
                    FIELD_PN.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["cwid"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
            }
            catch (Exception ex)
            {
                this.AddError(null, "", "", ex.Message + ex.StackTrace);
            }
        }

        protected void BUTTON_StopRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            try
            {
                string Rowno = this.Request.QueryString["ROWNO"].ToString();

                Del_Dg_flow(Rowno);

                Update_IPQC_status(Rowno, status.Stop);

                SendMail();
                Inform();

                BUTTON_SendRequest.Enabled = true;

            }
            catch (Exception ex)
            {
                this.AddError(null, "", "", ex.Message);
            }
        }

        protected void InputButton1_Click(object sender, EventArgs e)
        {
            try
            {

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("select   REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid from dgflowqueue a left join dguser" +
                    " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") + "'  AND reviewdate IS NULL AND qseq is not null ");
                if (rs.EOF)
                    return;
                MailAddress to = new MailAddress(rs["email"].ToString());
                MailAddress from = new MailAddress("eip@minaik.com.tw", "EIP(員工入口網站)");
                MailAddress bcc = new MailAddress("rage.mai@minaik.com.tw");
                MailMessage message = new MailMessage(from, to);
                message.Bcc.Add(bcc);
                String allques = rs["name"].ToString() + " 您好:" + "<br>" +
                                 "<br>" +
                                 "品質異常處理系統提醒您資訊如下:" + "<br><br>" +
                                 "<a href=\"http://eip.minaik.com.tw/IPQC/IPQCView.aspx?rowno=" + Request.QueryString["ROWNO"].ToString() + "\" >品質異常處理</a><br><br>" +
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

        private void Del_Dg_flow(string rowno)
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);

            string deleteSql = "delete EIPA.DBO.dgflowqueue where  requesturl='/IPQC/IPQCEdit.aspx?rowno=" + rowno + "'";
            //Response.Write(deleteSql);
            rs.Open(deleteSql);
            rs.Update();
            //e.CancelClick = true;

            Utility.execDel(" delete from eipe.dbo.ipqc_flow_record  where ipqc_id='" + rowno + "'");
        }

        private void Update_IPQC_status(string rowno, status action)
        {

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs.Open("SELECT * FROM EIPE.DBO.IPQC WHERE rowno='" + rowno + "' ");
            if (!rs.EOF)
            {
                _status = (int)action;
                rs["IsState"] = (int)action;
                rs.Update();
            }
            rs.Close();

            //displayfile(true);
            //showapprove(List_pmaxtype.SelectedValue);
        }




        public string getStr(string key)
        {
            return this.GetLocalResourceObject(key).ToString();
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

        protected void Btn_test_Click1(object sender, EventArgs e)
        {
            SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs t = new SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs();
            setflow(t);
        }



        protected void BUTTON_RemindReviewer_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {

            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            string sql = " select    revieweruid,name ,email  from eipa.dbo.dgflowqueue a "
                    + "   left join eipa.dbo.dguser u on a.requestuid=u.id "
                    + "   where  requesturl like '%ROWNO=" + Request.QueryString["ROWNO"] + "'and resulttype is null "
                    + " and revieweruid!='00000000-0000-0000-0000-000000000000' ";
            ds.Open(sql);

            if (!ds.EOF)
            {

                string MId = "{ca9348c8-504a-4454-9acc-18c03cfc8189}";//mail裡的格式
                string PapCaption = FlowClient1.Text;
                string PID = FIELD_IPQC_NO.Text;
                string receivername = ds["name"].ToString();
                string requesturl = Utility.LocalUrl + "/IPQC/IPQCView.aspx?ROWNO=" + Request.QueryString["ROWNO"].ToString();//審核者email裡的link
                string AppMail = ds["email"].ToString();
                string body = "";// FIELD_IqcRemark.Text;
                string requestername = this.CurrentUser.Name.ToString();

                ShrFlowMail ActRem = new ShrFlowMail();
                ActRem.RemindApprove(MId, PID, receivername, requesturl, AppMail, PapCaption, body, requestername);
                //ActRem.RemindApprove(MId, PID, receivername, requesturl, "herzog.lin@minaik.com.tw", PapCaption, body, requestername);

                DeputyApprove(ds[0].ToString());
                Response.Write("<script>alert('已經重新請" + ds["name"].ToString() + "審核');</script>");
                //ds.MoveNext();



            }
            ds.Close();
            //Response.Redirect("OQCView.aspx?id=" + Request.QueryString["id"].ToString());
        }

        private void DeputyApprove(string id)
        {

            string MId = "{166f4599-5482-4137-8060-eb1b2b82bbdb}";
            string PapCaption = FlowClient1.Text;
            string PID = FIELD_IPQC_NO.Text + "(代)";

            string urlink = "http://eip.minaik.com.tw/OQC/OQCView.aspx?id=" + Request.QueryString["ID"];

            string body = "";
            ShrFlowMail ActMail = new ShrFlowMail();
            #region 代理人
            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs2.Open(" SELECT b.name name,email FROM dguserdeputy a left join dguser b on a.deputyuid=b.id left join dgflow c on a.sid=c.id  " +
                     " where  a.uid='" + id + "'  " +
                     " and  " +
                     " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                     " (c.typename like 'sharflow12_21%' and sdate < GETDATE() and edate is null) or " +
                     " (c.typename like 'sharflow12_21%' and sdate < GETDATE() and edate > GETDATE()) or " +
                     "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");
            while (!rs2.EOF)
            {
                string AppName = rs2["name"].ToString();
                string AppMail = rs2["email"].ToString();
                ActMail.SendMail(MId, PapCaption, PID, AppName, AppMail, urlink, body);
                rs2.MoveNext();

            }
            rs2.Close();

            #endregion


        }
    }
}