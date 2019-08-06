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
using System.Net;
using System.Text;

namespace IPQC
{
    public partial class IPQCAdd :IPQC_Base
    {

        protected void Page_Load(object sender, System.EventArgs e)
        { 
            if (!IsPostBack)
            { 
                try
                { 
                    initdate(); 
                    getflow(p_list);
                    getView();
                }
                catch (Exception ex)
                {
                    this.AddError(this, "Page_Load()", "", ex.Message + "<br/>" + ex.StackTrace);
                }
            }

            BUTTON_back.Text = getStr("back");
            BUTTON_save.Text = getStr("save");
            BUTTON_savenext.Text = getStr("continue");
        }


       
        private void initdate()
        {
            try
            {


                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * " +
                        "  FROM EIPE.DBO.IPQC_parameter " +
                        " ORDER BY PARAMETER , SEQ ");
                this.FIELD_inituser.Text = this.CurrentUser.ID;//.Replace("{","").Replace("}","");


                this.FIELD_initdate.Text = System.DateTime.Now.ToString("yyyy-MM-dd");
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
                //this.FILED_COO.Items.Clear();
                //this.FILED_VCOO.Items.Clear();
                //this.FILED_NPI_Director.Items.Clear();
                //this.FILED_QA_Director.Items.Clear();

                //while (!rs.EOF)
                //{
                //    if (rs["parameter"].ToString().Contains("commit"))
                //    {
                //        this.FIELD_QA_dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //        this.FIELD_NPI_dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //        this.FIELD_Prod_dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //        this.FIELD_Tooling_Dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //        this.FIELD_PMC_Dept.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));

                //        this.FILED_COO.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //        this.FILED_VCOO.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                        

                //        this.FILED_NPI_Director.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));　//舊欄位不改名欄　2017/09/05 flow 為Eng Director-Stanley 
                //        this.FILED_QA_Director.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));　//舊欄位不改名欄 2017/09/05 flow 為 QE Director-GK
                //        this.FILED_QE_Director.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));  //新增 Dr. Imbert Theadore
                //        this.FILED_QA.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));  //新增 Dr. Imbert Theadore

                //    }
                //    rs.MoveNext();
                //}
                //rs.MoveFirst();
                //#endregion

                //#region init master commit
                //this.FIELD_Master_Dispostion.Items.Clear();
                //while (!rs.EOF)
                //{
                //    if (rs["parameter"].ToString().Contains("commit"))
                //        this.FIELD_Master_Dispostion.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //    rs.MoveNext();
                //}
                //rs.MoveFirst();
                //#endregion

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

                /* #region init  Custome commit
                //this.FIELD_customer.Items.Clear();
                //while (!rs.EOF)
                //{
                //    if (rs["parameter"].ToString().Contains("customer"))
                //        this.FIELD_customer.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //    rs.MoveNext();
                //}
                //rs.MoveFirst();
                //#endregion
                //#region init product commit
                //this.FIELD_Product_Name.Items.Clear();
                //while (!rs.EOF)
                //{
                //    if (rs["parameter"].ToString().Contains("product"))
                //        this.FIELD_Product_Name.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //    rs.MoveNext();
                //}
                //rs.MoveFirst();
                 #endregion*/
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
                //#region init Final proposed disposition
                //this.FIELD_Proposed_Dispostion.Items.Clear();
                //while (!rs.EOF)
                //{
                //    if (rs["parameter"].ToString().Contains("commit") && !string.IsNullOrEmpty(rs["value"].ToString().Trim()))
                //        this.FIELD_Proposed_Dispostion.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                //    rs.MoveNext();
                //}
                //rs.MoveFirst();
                //#endregion

                #region  Init IPQC Dispostion NO.
                rs.Close();
                rs.Open("EXEC EIPE.DBO.IPQC_QAD_SEQ_SP");
                this.FIELD_IPQC_NO.Text = rs["NO"].ToString();
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
                rs.Open("SELECT * FROM csc_base_file where tid='A' and  LActi='Y'");
                FIELD_customer.Items.Add(new ListItem("NA", ""));
                while (!rs.EOF)
                {
                    FIELD_customer.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LID"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
                #endregion
                #region others
                FIELD_Product_Name.Items.Add(new ListItem("NA", ""));
                FIELD_Program_Name.Items.Add(new ListItem("NA", ""));
                FIELD_PN.Items.Add(new ListItem("NA", ""));
                #endregion
                #region commod
                /*
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
            */
                #endregion
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

        protected void BUTTON_save_Click(object sender, System.EventArgs e)
        {
            if (this.IsValid)
            {
                try
                {
                    Guid rowno = Guid.NewGuid();

                    saveform(rowno);
                    savefile(rowno);
                    if (sender == this.BUTTON_savenext)
                        Response.Redirect("IPQCAdd.aspx");
                    else
                        Response.Redirect("IPQCEdit.aspx?rowno=" + rowno.ToString().Replace("{", "").Replace("}", ""));

                }
                catch (Exception ex)
                {
                    this.AddError(this, "BUTTON_save_Click()", "", ex.Message + "<br/>" + ex.StackTrace);
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
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM EIPE.DBO.IPQC WHERE 1=0");
                rs.Add();
                rs["rowno"] = rowno;
                rs["IPQC_NO"] = this.FIELD_IPQC_NO.Text;
                rs["inituser"] = new Guid(this.FIELD_inituser.Text);
                rs["initdate"] = this.FIELD_initdate.Text;
                rs["sheet_NO"] = this.FIELD_sheet_NO.Text;
                rs["station"] = this.FIELD_station.SelectedValue;
                rs["customer"] = this.FIELD_customer.SelectedValue;
                rs["Program_Name"] = this.FIELD_Program_Name.SelectedValue;
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
                 


                rs["UAI_no"] = this.FIELD_UAI_no.Text;

                rs["IsState"] =(int) status.Waite;

                rs.Update();
                rs.Close();

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
                HttpFileCollection files = HttpContext.Current.Request.Files;
                System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
                int att_count = 0;
                string filepath = @"ftp://ftp.minaik.com.tw/WQDP/IPQC";
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs2.Open("SELECT * FROM EIPE.DBO.IPQC_file WHERE 1=0");

                foreach (string FieldName in files.AllKeys)
                {
                    Response.Write(FieldName + "<br/>");
                    HttpPostedFile postedfile = files[FieldName];
                    string filename, fileExt, filePath;
                    filename = System.IO.Path.GetFileName(postedfile.FileName);//.Replace(" ", "_").Replace("#", "_").Replace(")", "_").Replace("(", "_");    //抓取文件名

                    fileExt = System.IO.Path.GetExtension(postedfile.FileName);    //抓取文件附檔名

                    if (postedfile.ContentLength > 0)
                    {
                        string filefullpath = filepath + "/" + filename;
                        //Response.Write(filefullpath);
                        rs2.Add();
                        att_count = att_count + 1;
                        String tafilename = "filename" + att_count.ToString();
                        String taattach = "attachment" + att_count.ToString();
                        String tafilexten = "fileexten" + att_count.ToString();
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
                Response.Write(ex.Message);
            }
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

        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            this.GoBack();
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

        public string getStr(string key)
        {
            return this.GetLocalResourceObject(key).ToString();
        }

    }
}