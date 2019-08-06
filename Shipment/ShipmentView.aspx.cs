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
using System.Threading;
using System.Net.Mail;

/// <summary>
/// Mark       Date           Author             Reason
/// ---------------------------------------------------------------------------------------------------
/// V1.0.1       2018/07/19   Carol             因業助需求加一remark 在shipment_body 
/// V1.0.2       2019/06/14   Carol             sql異常，導致列表異常，故更新


namespace Shipment
{
    public partial class ShipmentView : SmoothEnterprise.Web.Page
    {
        private string db1 = ""; //db主位置 
        private string db2 = ""; //db副位置
        private string db3 = ""; //db副2位置
        private bool _NotifyReview = false;
        public string NPIupdate = "0"; //1代表NPI工程師, 才可以update資料
        public string OTHER = "0";  //1代表OTHER維護
        protected void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                Button_UpdateItem.Attributes.Add("OnClick", "return   j1()");
                if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
                {
                    db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                    db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                    db3 = "[barcode].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                }

                if (!this.IsPostBack)
                {

                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                    //取出 Customer
                    rs.Open("SELECT   LID,LCaption FROM " + db1 + "[NPI_Base_file] where TID='C' and LActi='Y' order by  LCaption asc");
                    while (!rs.EOF)
                    {
                        this.FIELD_Customer.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LCaption"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT   LID,LCaption FROM " + db1 + "[NPI_Base_file] where TID='S' and LActi='Y' order by  LCaption asc");
                    while (!rs.EOF)
                    {
                        this.FIELD_Shipment_type.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LID"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT   LID,LCaption FROM " + db1 + "[NPI_Base_file] where TID='E' and LActi='Y' order by  LCaption asc");
                    while (!rs.EOF)
                    {
                        this.FIELD_Potential_P_choose.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LCaption"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    this.FIELD_Material.Items.Add(new ListItem("NA", "NA"));
                    this.FIELD_Material2.Items.Add(new ListItem("NA", "NA"));
                    this.FIELD_Material3.Items.Add(new ListItem("NA", "NA"));

                    rs.Open("SELECT lcaption  FROM " + db3 + "[bar_base_file]  where TID='G' and LActi='Y' and comid='MAT'");
                    while (!rs.EOF)
                    {

                        this.FIELD_Material.Items.Add(new ListItem(rs["lcaption"].ToString(), rs["lcaption"].ToString()));
                        this.FIELD_Material2.Items.Add(new ListItem(rs["lcaption"].ToString(), rs["lcaption"].ToString()));
                        this.FIELD_Material3.Items.Add(new ListItem(rs["lcaption"].ToString(), rs["lcaption"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs3.Open("SELECT * FROM " + db1 + "NPI_Base_file where TID='P'");
                    while (!rs3.EOF)
                    {
                        //DropDownList1.Items.Add(new ListItem(rs3["dept_nm"].ToString(), rs3["dept_no"].ToString()));
                        CheckBoxList2.Items.Add(new ListItem(rs3["LCaption"].ToString(), rs3["LID"].ToString()));
                        rs3.MoveNext();
                    }
                    rs3.Close();




                    rs.Open("SELECT a.id, a.No, a.Ver, a.ERP_PO, a.Customer, a.C_PO, a.Purpose, a.loc, a.Add_user, a.Add_date, a.Status, b.name bname,plant,ETA " +
                            "FROM  " + db1 + "Shipment_head AS a LEFT OUTER JOIN " +
                            "               " + db2 + "dguser AS b ON a.add_user = b.id " +
                            "WHERE (a.id = '" + Request.QueryString["id"] + "')");
                    if (!rs.EOF)
                    {
                        this.FIELD_Customer.Items.Add(new ListItem(rs["Customer"].ToString(), rs["Customer"].ToString()));
                        this.FIELD_Customer.Text = rs["Customer"].ToString();
                        this.FIELD_PO.Text = rs["C_PO"].ToString();
                        //this.FIELD_Purpose.Text = rs["Purpose"].ToString();
                        this.FIELD_loc.Text = rs["loc"].ToString();
                        this.FIELD_ERP_PO.Text = rs["ERP_PO"].ToString();
                        this.add_user.Text = rs["bname"].ToString();
                        this.no.Text = rs["no"].ToString();
                        this.ver.Text = rs["ver"].ToString();
                        this.Plant.Text = rs["plant"].ToString();
                        this.FIELD_Add_date.Text = rs["add_date"].ToString();
                        this.FIELD_ETA.Text = rs["ETA"].ToString();

                        if (rs["ver"].ToString() != "1")
                        {

                            Label32.ForeColor = Color.Gray;
                            FIELD_C_demand.BackColor = Color.White;
                            FIELD_C_demand.Enabled = false;
                            Label21.ForeColor = Color.White;
                            Label22.ForeColor = Color.Red;
                        }

                    }
                    else
                    {
                        Response.Redirect("Shipment.aspx");
                    }

                    gridviewchange(Request.QueryString["id"]);
                    this.FIELD_Packing.Text = "QTY:" + Environment.NewLine + "NW/GW:" + Environment.NewLine + "CARTON QTY:" + Environment.NewLine + "VIA:" + Environment.NewLine + "Attn to:";


                    //Material由自行填寫轉至下拉式,故設定-------------------------------------------------


                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                    rss.Open("select distinct Material Material_1 from " + db1 + "Shipment_body " +
                            "where aid='" + Request.QueryString["id"] + "' and Material <>'' " +
                            "and Material not in (SELECT lcaption  FROM " + db3 + "bar_base_file  " +
                            "where TID='G' and LActi='Y' and comid='MAT' ) ");

                    while (!rss.EOF)
                    {
                        this.FIELD_Material.Items.Add(new ListItem(rss["Material_1"].ToString(), rss["Material_1"].ToString()));
                        rss.MoveNext();
                    }
                    rss.Close();

                    //------------------------------------------------------------------------------------

                }

                //確認進來的人是不是工程師or助理, 如果是的話可以update東西
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs2.Open("select * from " + db2 + "dgflowqueue where requesturl like '%" + Request.QueryString["id"] + "' " +
                       "and text in ('NPI Engineer','NPI Assistant') and revieweruid='" + this.CurrentUser.ID.ToString() + "'");
                if (!rs2.EOF)
                {
                    NPIupdate = "1";
                    this.InputFile1.Visible = true;
                    CheckBoxList1.Enabled = true;
                    CheckBoxFile3.Enabled = true;
                    attach2.Visible = true;
                    attach1.Visible = true;
                    this.Button1.Visible = true;
                }
                else
                {
                    SmoothEnterprise.Database.DataSet rsf = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    string command = "SELECT TOP 1 *  " +
                                     "  from  EIPA.dbo.dguserdeputy   " +
                                     " where uid = (select top 1 revieweruid  " +
                                     "                from eipa.dbo.dgflowqueue  " +
                                     "               where requesturl like '%" + Request.QueryString["id"] + "' " +
                                     "                 and text = 'NPI Engineer')  " +
                                     "   AND Deputyuid = '" + this.CurrentUser.ID.ToString() + "' " +
                                     "   AND SYSDATETIME() BETWEEN sdate AND edate";
                    rsf.Open(command);
                    if (!rsf.EOF)
                    {
                        NPIupdate = "1";
                        this.InputFile1.Visible = true;
                        CheckBoxList1.Enabled = true;
                        CheckBoxFile3.Enabled = true;
                        attach2.Visible = true;
                        attach1.Visible = true;
                        this.Button1.Visible = true;
                    }
                    else
                    {
                        Button_UpdateItem.Enabled = false;
                    }

                }


                if (Request.QueryString["other"] == "1")
                {

                    //this.Label35.ForeColor = Color.Black;
                    //this.Label29.ForeColor = Color.Black;
                    //this.FIELD_C_demand2.Enabled = true;
                    //this.FIELD_C_demand2.ButtonClick = true;
                    //this.FIELD_C_demand2.BackColor = Color.LemonChiffon;

                    this.attach1.Visible = true;
                    this.InputFile1.Visible = true;
                    this.Button1.Visible = true;

                    OTHER = "1";

                    this.Button_UpdateItem.Enabled = true;
                    this.Label34.ForeColor = Color.Black;
                    this.FIELD_Shipment_status.Enabled = true;
                    this.FIELD_Shipment_status.BackColor = Color.LemonChiffon;

                    this.Label31.ForeColor = Color.Black;
                    this.FIELD_B_NO.Enabled = true;
                    this.FIELD_B_NO.BackColor = Color.LemonChiffon;

                    this.Label41.ForeColor = Color.Black;
                    this.FIELD_ETD.Enabled = true;
                    this.FIELD_ETD.BackColor = Color.LemonChiffon;




                    this.LABEL_1.ForeColor = Color.Gray;
                    this.Label13ab.ForeColor = Color.Gray;
                    this.Label9.ForeColor = Color.Gray;
                    //this.Label1.ForeColor = Color.Gray;
                    this.Label6a.ForeColor = Color.Gray;
                    this.Label11.ForeColor = Color.Gray;
                    this.Label25.ForeColor = Color.Gray;
                    this.Label4.ForeColor = Color.Gray;
                    this.lab3.ForeColor = Color.Gray;
                    this.Label13x.ForeColor = Color.Gray;
                    this.Label12.ForeColor = Color.Gray;
                    this.Label3.ForeColor = Color.Gray;
                    this.LABEL5.ForeColor = Color.Gray;
                    this.Label19.ForeColor = Color.Gray;
                    this.Label13xx.ForeColor = Color.Gray;
                    this.Label2.ForeColor = Color.Gray;
                    this.Label20a.ForeColor = Color.Gray;
                    this.Label8a.ForeColor = Color.Gray;
                    this.Label32.ForeColor = Color.Gray;
                    this.Label45.ForeColor = Color.Gray;
                    this.Label49.ForeColor = Color.Gray;
                    this.Label47.ForeColor = Color.Gray;
                    this.Label10.ForeColor = Color.Gray;
                    this.Label35.ForeColor = Color.Gray;
                    this.Label29.ForeColor = Color.Gray;
                    this.Label38.ForeColor = Color.Gray;
                    this.Label40.ForeColor = Color.Gray;
                    this.Label6a.ForeColor = Color.Gray;
                    this.Label43.ForeColor = Color.Gray;
                    this.Label51.ForeColor = Color.Gray;
                    this.Label44.ForeColor = Color.Gray;
                    this.Label17.ForeColor = Color.Gray;
                    this.Label21.ForeColor = Color.Gray;
                    this.Label22.ForeColor = Color.Gray;
                    this.Label42.ForeColor = Color.Gray;
                    this.Label30.ForeColor = Color.Gray;
                    this.Label8.ForeColor = Color.Gray;

                    FIELD_ERP_PO.BackColor = Color.White;
                    FIELD_Customer.BackColor = Color.White;
                    FIELD_PO.BackColor = Color.White;
                    //FIELD_Purpose.BackColor = Color.White;
                    FIELD_loc.BackColor = Color.White;
                    FIELD_Material.BackColor = Color.White;
                    FIELD_Material2.BackColor = Color.White;
                    FIELD_Material3.BackColor = Color.White;
                    FIELD_Shipment_type.BackColor = Color.White;
                    FIELD_Qty.BackColor = Color.White;
                    FIELD_LV.BackColor = Color.White;
                    FIELD_HV.BackColor = Color.White;
                    FIELD_C_demand.BackColor = Color.White;
                    FIELD_C_demand2.BackColor = Color.White;
                    FIELD_Potential_P_choose.BackColor = Color.White;
                    FIELD_Potential_P.BackColor = Color.White;
                    CheckBoxList2.BackColor = Color.White;
                    FIELD_Packing.BackColor = Color.White;
                    FIELD_Labno.BackColor = Color.White;
                    FIELD_EngineeringTestNo.BackColor = Color.White;
                    FIELD_purpose2.BackColor = Color.White;
                    this.FIELD_labsn.BackColor = Color.White;







                    FIELD_ERP_PO.ReadOnly = true;
                    FIELD_PO.ReadOnly = true;
                    //FIELD_Purpose.ReadOnly = true;
                    FIELD_loc.ReadOnly = true;

                }

                //附檔----------------------------------------------------
                int i = 0;
                ContentPlaceHolder cnt;
                cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                CheckBoxList chb = (CheckBoxList)cnt.FindControl("CheckBoxList1");

                ContentPlaceHolder cnt2;
                cnt2 = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder2");
                CheckBoxList chb2 = (CheckBoxList)cnt.FindControl("CheckBoxFile2");

                ContentPlaceHolder cnt3;
                cnt3 = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder3");
                CheckBoxList chb3 = (CheckBoxList)cnt.FindControl("CheckBoxFile3");

                rs2.Open("SELECT id,FileName,usertype FROM " + db1 + "shipment_File WHERE FileKey='" + Request.QueryString["ID"] + "' ");
                while (!rs2.EOF)
                {
                    switch (rs2["usertype"].ToString().Trim())
                    {
                        case "1":
                            chb.Items.Add(new ListItem("<img with=\"50%\" src=\"FileDownload.aspx?id=" + rs2["id"].ToString() + "\">", rs2["id"].ToString()));
                            break;
                        case "2":
                            chb2.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs2["id"].ToString() + "\" target=\"_blank\">" + rs2["FileName"].ToString() + "</a>", rs2["id"].ToString()));
                            break;
                        case "3":
                            chb3.Items.Add(new ListItem("<img with=\"50%\" src=\"FileDownload.aspx?id=" + rs2["id"].ToString() + "\">", rs2["id"].ToString()));
                            break;
                    }
                    rs2.MoveNext();
                }
                rs2.Close();

            }
            catch (Exception ex)
            {
                //Response.Redirect("Shipment.aspx");
                Response.Write(ex.Message);
            }
        }

        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            this.GoBack();
        }

        protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
        {
            if (NPIupdate == "1" && this.FlowFeedback1.ResultType.ToString() == "Next")
            {

                string NPIcommit = "0";  //0為ok,1為有問題
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open(" select item from " + db1 + "shipment_body where aid='" + Request.QueryString["id"] + "' " +
                       "and (shipment_type is null or c_demand is null or c_demand2 is null or packing is null or purpose2 is null )");
                if (!rs.EOF)
                {

                    string error_material = "項次" + rs["item"].ToString() + "的尚有資料未維護齊全";
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "xxx", " alert('" + error_material.ToString() + "');", true);
                    NPIcommit = "1";


                }
                rs.Close();

                //NPI工程師及助理可UPDATESE Approved Doc
                #region NPI工程師及助理可UPDATESE Approved Doc
                string FileList = "";
                for (int x = 0; x < this.CheckBoxList1.Items.Count; x++)
                {
                    if (this.CheckBoxList1.Items[x].Selected == true)
                    {
                        if (FileList == "")
                            FileList = "'" + this.CheckBoxList1.Items[x].Value + "'";
                        else
                            FileList = FileList + ",'" + this.CheckBoxList1.Items[x].Value + "'";
                    }
                }

                for (int x = 0; x < this.CheckBoxFile2.Items.Count; x++)
                {
                    if (CheckBoxFile2.Items[x].Selected == true)
                    {
                        if (FileList == "")
                            FileList = "'" + CheckBoxFile2.Items[x].Value + "'";
                        else
                            FileList = FileList + ",'" + CheckBoxFile2.Items[x].Value + "'";
                    }
                }

                for (int x = 0; x < this.CheckBoxFile3.Items.Count; x++)
                {
                    if (CheckBoxFile3.Items[x].Selected == true)
                    {
                        if (FileList == "")
                            FileList = "'" + CheckBoxFile3.Items[x].Value + "'";
                        else
                            FileList = FileList + ",'" + CheckBoxFile3.Items[x].Value + "'";
                    }
                }

                #region 動態新增
                HttpFileCollection files = HttpContext.Current.Request.Files;
                System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
                int att_count = 0;

                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs2.Open("SELECT * FROM " + db1 + "shipment_File WHERE 1=0");
                int ifile = 0;
                foreach (string key in files.AllKeys)
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

                        if (key.IndexOf("attach1") > 0)
                        {
                            rs2["UserType"] = "1";    //附檔為BARCODE No.
                        }
                        if (key.IndexOf("InputFile1") > 0)
                        {
                            rs2["UserType"] = "2";   //附檔為SE Approved Doc
                        }
                        if (key.IndexOf("attach2") > 0)
                        {
                            rs2["UserType"] = "3";   //附檔為DCM code 
                        }

                        rs2["FileKey"] = Request.QueryString["id"];
                        rs2["FileName"] = filename;
                        rs2["FileBody"] = fileBytes;
                        rs2["FileType"] = fileExt;
                        rs2.Update();
                    }
                    ifile++;
                }
                rs2.Close();
                #endregion
                //刪除附檔------------------------------------------------------------------------------------------
                if (FileList != "")
                {
                    SmoothEnterprise.Database.DataSet rsD = new SmoothEnterprise.Database.DataSet();
                    rsD.ExecuteNonQuery("Delete FROM " + db1 + " shipment_File WHERE ID in (" + FileList + ")");
                }
                //刪除附檔------------------------------------------------------------------------------------------

                #endregion
                //NPI工程師及助理可UPDATESE Approved Doc

                //檢查是否有上傳SE Approved Doc(有po&客戶為wd開頭&shipmenttype=B:po出貨)
                if (this.FIELD_ERP_PO.Text != "" && this.FIELD_Customer.Text.Substring(0, 2).ToString() == "WD")
                {

                    //rs.Open("select count(*) countnum from  " + db1 + "shipment_file left join " + db1 + "shipment_body  on aid=filekey " +
                    //        "where aid='" + Request.QueryString["id"] + "' and shipment_type='36916B2D-F94D-40D3-9459-9644FF49A170' and usertype='2' and filekey='" + Request.QueryString["id"] + "'");

                    rs.Open("select  count(filekey) countnum,shipment_type,(CASE WHEN usertype IS NULL THEN '5' ELSE usertype END) usertype from " + db1 + "shipment_body " +
                            "left join (select * from " + db1 + "shipment_file where usertype='2') a on aid=filekey " +
                            "where aid='" + Request.QueryString["id"] + "' " +
                            "group by shipment_type,usertype");
                    if (rs["countnum"].ToString() == "0" && rs["shipment_type"].ToString().ToUpper() == "36916B2D-F94D-40D3-9459-9644FF49A170" && rs["usertype"].ToString() == "5")
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "xxx", " alert('需上傳SE Approved Doc');", true);
                        NPIcommit = "1";

                    }
                    rs.Close();

                }

                if (NPIcommit == "0")
                {
                    this.FlowFeedback1.Commit();
                }



            }
            else
            {
                this.FlowFeedback1.Commit();
            }
        }



        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;

                string paperlist = "";
                int countpaper = 0;
                int index = e.Row.DataItemIndex;

                SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs3.Open("SELECT shipment_paper_id FROM " + db1 + "shipment_paper where aid='" + Request.QueryString["id"] + "' and item='" + index + "'");
                while (!rs3.EOF)
                {
                    paperlist = paperlist + rs3["shipment_paper_id"] + "@";

                    countpaper = countpaper + 1;

                    rs3.MoveNext();
                }
                rs3.Close();
                string text = "";
                string te2 = "";
                for (int x = 0; x < CheckBoxList2.Items.Count; x++)
                {
                    if (paperlist.ToString().IndexOf(CheckBoxList2.Items[x].Value).ToString() != "-1")
                    {

                        te2 = te2 + x + "@";


                    }
                }

                e.Row.Cells[0].Attributes.Add("onclick", "onGridViewRowSelected('" + e.Row.DataItemIndex + "','" + te2.ToString() + "','" + countpaper + "')");

                GetBoxNumbers(e.Row.Cells[21], drv["lab_no"].ToString());

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
        protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {

                _NotifyReview = true;
                e.NextNode = e.FlowNode.DefaultNode();
                e.NextNode.ReviewerURL = "/Shipment/ShipmentView.aspx";
            }
        }
        protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete)  //完成審核
            {
                SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rb.Open("SELECT * FROM " + db1 + "Shipment_head WHERE id='" + Request.QueryString["id"] + "'  ");
                if (!rb.EOF)
                {
                    rb["STATUS"] = "OK";
                    rb.Update();

                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rss.Open("select add_user bid,email,name from " + db1 + "shipment_head a  left join " + db2 + "dguser b on a.add_user=b.id  where a.id='" + Request.QueryString["id"] + "'   ");
                    if (!rss.EOF)
                    {
                        ShrFlowMail Backsend = new ShrFlowMail();
                        Backsend.FinishApprove("c294bd9b-ebbd-4c6a-a608-c5175f3a3de2", "NPI送樣", this.no.Text, rss["email"].ToString(), "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text, rss["name"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "完成審核");
                    }

                }
                rb.Close();

            }


            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate ||
            e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Return)         //退回
            {
                SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rb.Open("SELECT * FROM " + db1 + "Shipment_head WHERE id='" + Request.QueryString["id"] + "'  ");
                if (!rb.EOF)
                {
                    rb["STATUS"] = "NO";
                    rb.Update();
                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rss.Open("select add_user bid,email,name from " + db1 + "shipment_head a  left join " + db2 + "dguser b on a.add_user=b.id  where a.id='" + Request.QueryString["id"] + "'   ");
                    if (!rss.EOF)
                    {
                        ShrFlowMail Backsend = new ShrFlowMail();
                        Backsend.RejectResult("5a3f8c87-e0dc-4bbb-8116-661521bfc6c7", "NPI送樣", this.no.Text, rss["email"].ToString(), "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text, rss["name"].ToString(), "http://eip.minaik.com.tw/Shipment/ShipmentEdit.aspx?id=" + Request.QueryString["id"], "退回單據");

                        SmoothEnterprise.Database.DataSet rss2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                        rss2.Open("select b.name bname,b.email bemail, " +
                                 "      c.name cname,c.email cemail, " +
                                 "      d.name dname,d.email demail, " +
                                 "      e.name ename,e.email eemail, " +
                                 "      f.name fname,f.email femail " +
                                " from " + db1 + "shipment_npiengineer a " +
                                "left join " + db2 + "dguser b on a.npi_engineer1=b.id " +
                                "left join " + db2 + "dguser c on a.npi_engineer2=c.id " +
                                "left join " + db2 + "dguser d on a.npi_engineer3=d.id " +
                                "left join " + db2 + "dguser e on a.npi_engineer4=e.id " +
                                "left join " + db2 + "dguser f on a.npi_engineer5=f.id " +
                                "WHERE aid='" + Request.QueryString["id"] + "' ");
                        if (!rss2.EOF)
                        {
                            if (rss2["bemail"].ToString() != rss["email"].ToString())
                            {
                                Backsend.RejectResult("5a3f8c87-e0dc-4bbb-8116-661521bfc6c7", "NPI送樣", this.no.Text, rss2["bemail"].ToString(), "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text, rss2["bname"].ToString(), "http://eip.minaik.com.tw/Shipment/ShipmentEdit.aspx?id=" + Request.QueryString["id"], "退回單據");
                            }
                            if (rss2["cemail"].ToString() != rss["email"].ToString())
                            {
                                Backsend.RejectResult("5a3f8c87-e0dc-4bbb-8116-661521bfc6c7", "NPI送樣", this.no.Text, rss2["cemail"].ToString(), "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text, rss2["cname"].ToString(), "http://eip.minaik.com.tw/Shipment/ShipmentEdit.aspx?id=" + Request.QueryString["id"], "退回單據");
                            }
                            if (rss2["demail"].ToString() != rss["email"].ToString())
                            {
                                Backsend.RejectResult("5a3f8c87-e0dc-4bbb-8116-661521bfc6c7", "NPI送樣", this.no.Text, rss2["demail"].ToString(), "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text, rss2["dname"].ToString(), "http://eip.minaik.com.tw/Shipment/ShipmentEdit.aspx?id=" + Request.QueryString["id"], "退回單據");
                            }
                            if (rss2["eemail"].ToString() != rss["email"].ToString())
                            {
                                Backsend.RejectResult("5a3f8c87-e0dc-4bbb-8116-661521bfc6c7", "NPI送樣", this.no.Text, rss2["eemail"].ToString(), "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text, rss2["ename"].ToString(), "http://eip.minaik.com.tw/Shipment/ShipmentEdit.aspx?id=" + Request.QueryString["id"], "退回單據");
                            }
                            if (rss2["femail"].ToString() != rss["email"].ToString())
                            {
                                Backsend.RejectResult("5a3f8c87-e0dc-4bbb-8116-661521bfc6c7", "NPI送樣", this.no.Text, rss2["femail"].ToString(), "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text, rss2["fname"].ToString(), "http://eip.minaik.com.tw/Shipment/ShipmentEdit.aspx?id=" + Request.QueryString["id"], "退回單據");
                            }

                        }

                    }

                }
                rb.Close();

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
            //下一關發信
            ShrFlowMail Backsend = new ShrFlowMail();
            if (_NotifyReview)
            {
                // Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", "NPI送樣", this.no.Text, "林欣茹", "ann.lin@minaik.com.tw", "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "select top 1 REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid from " + db2 + "dgflowqueue a left join " + db2 + "dguser b on revieweruid=b.id where requesturl like '%" + Request.QueryString["id"] + "'  AND reviewdate IS NULL AND qseq is not null and text <> 'NPI Engineer' ");

                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rss.Open("select top 1 REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid from " + db2 + "dgflowqueue a left join " + db2 + "dguser b on revieweruid=b.id where requesturl like '%" + Request.QueryString["id"] + "'  AND reviewdate IS NULL AND qseq is not null and text <> 'NPI Engineer' ");  //and text <> 'NPI Engineer' 要抓第二關,第一關的不抓
                if (!rss.EOF)
                {
                    Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", "NPI送樣", this.no.Text, rss["name"].ToString(), rss["email"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + "");

                    Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", "NPI送樣", this.no.Text, rss["name"].ToString(), "ann.lin@minaik.com.tw", "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + "");

                    Dguserdeputy(rss["bid"].ToString());
                }
            }

        }

        void Dguserdeputy(string userid)  //代理人寄信
        {
            ShrFlowMail Backsend = new ShrFlowMail();
            //Thread.Sleep(2000);


            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs.Open(" SELECT b.name name,email FROM " + db2 + "dguserdeputy a left join " + db2 + "dguser b on a.deputyuid=b.id left join " + db2 + "dgflow c on a.sid=c.id  " +
                     " where  a.uid='" + userid + "'  " +
                     " and  " +
                     " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                     " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate is null) or " +  //sharflow12_21 一般流程
                     " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate > GETDATE()) or " +
                     "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");
            while (!rs.EOF)
            {

                Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", "NPI送樣", this.no.Text, rs["name"].ToString(), rs["email"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + "");
                rs.MoveNext();

            }
            rs.Close();

        }

        protected void Button_UpdateItem_Click(object sender, EventArgs e)
        {
            //20121002 mandy提出, MA commitment date(ETD)己輸入不得再次變更
            SmoothEnterprise.Database.DataSet cdemand = new SmoothEnterprise.Database.DataSet();
            object objola = cdemand.ExecuteScalar("SELECT convert(char, c_demand, 112) c_demand FROM " + db1 + "shipment_body WHERE item='" + this.rember_item.Value + "' and aid='" + Request.QueryString["id"] + "'");
            string csdemand = objola.ToString();
            if (csdemand.Trim().ToString() != "" &&
                 !csdemand.Trim().ToString().ToUpper().Contains("NULL") &&
                 csdemand.Trim().ToString() != this.FIELD_C_demand.Text.Trim().ToString())
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('MA commitment date(ETD) 不得變更');", true);

            }
            else
            {
                if (OTHER.ToString() == "0")
                {

                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rss.Open("SELECT * FROM " + db1 + "shipment_body WHERE item='" + this.rember_item.Value + "' and aid='" + Request.QueryString["id"] + "'  ");
                    if (!rss.EOF)
                    {


                        rss["partno"] = Request.Form["FIELD_Partno"];
                        rss["component"] = Request.Form["FIELD_Component"];
                        rss["dwg"] = Request.Form["FIELD_DWG"];
                        rss["qty"] = this.FIELD_Qty.Text;
                        if (this.FIELD_Material.Text != "") rss["material"] = this.FIELD_Material.Text;
                        if (this.FIELD_Material2.Text != "") rss["material2"] = this.FIELD_Material2.Text;
                        if (this.FIELD_Material3.Text != "") rss["material3"] = this.FIELD_Material3.Text;
                        if (this.FIELD_Shipment_type.Text != "") rss["shipment_type"] = this.FIELD_Shipment_type.Text;
                        if (this.FIELD_LV.Text != "") rss["lv"] = this.FIELD_LV.Text;
                        if (this.FIELD_HV.Text != "") rss["hv"] = this.FIELD_HV.Text;

                        //if (this.FIELD_ETD.Text != "") rss["ETD"] = this.FIELD_ETD.Text;
                        if (this.FIELD_Packing.Text != "") rss["packing"] = this.FIELD_Packing.Text;
                        rss["lab_no"] = this.FIELD_Labno.Text;
                        rss["EngineeringTest_No"] = this.FIELD_EngineeringTestNo.Text;
                        rss["purpose2"] = this.FIELD_purpose2.Text;
                        rss["labsn"] = this.FIELD_labsn.Text;
                        rss["Explanation"] = this.FIELD_Explanation.Text;

                        rss["remark"] = this.txt_remark.Text; //V1.0.1
                        if (this.RadioButton1.Checked)
                        {
                            rss["potential_p"] = this.FIELD_Potential_P_choose.Text;
                        }
                        else
                        {
                            rss["potential_p"] = this.FIELD_Potential_P.Text;
                        }

                        //當維護c_demand or c_demand2時 寄信給業務

                        SmoothEnterprise.Database.DataSet rssales = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rssales.Open("SELECT convert(char, c_demand, 112) c_demand,convert(char, c_demand2, 112) c_demand2,name,email FROM  " + db1 + "shipment_body a  " +
                               "left join " + db1 + "shipment_head b on b.id=a.aid " +
                               "left join " + db2 + "dguser c on b.sales=c.id WHERE item='" + this.rember_item.Value + "' and aid='" + Request.QueryString["id"] + "'  ");
                        if (!rssales.EOF)
                        {
                            if (this.FIELD_C_demand.Text.ToString().Trim() != rssales["c_demand"].ToString().Trim() || this.FIELD_C_demand2.Text.ToString().Trim() != rssales["c_demand2"].ToString().Trim())
                            {
                                if (this.FIELD_C_demand.Text != "") rss["c_demand"] = DateTime.ParseExact(this.FIELD_C_demand.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces);
                                if (this.FIELD_C_demand2.Text != "") rss["c_demand2"] = DateTime.ParseExact(this.FIELD_C_demand2.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces);



                                ReSendInfo(no.Text, rssales["name"].ToString(), "交期己維護完畢", "Customer:" + this.FIELD_Customer.Text + "<br>Customer PO:" + this.FIELD_PO.Text +
                                    "<br>維護MA commitment  date(ETD)為" + this.FIELD_C_demand.Text.ToString() +
                                    "<br>維護MA commitment date revise (ETD)為" + this.FIELD_C_demand2.Text.ToString(),
                                    "c...", "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"]
                                    , this.CurrentUser.LogonID.ToString(), rssales["email"].ToString());

                            }
                        }

                        rss.Update();

                    }
                    rss.Close();



                    #region 刪掉shipment_paper再新增

                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet();
                    rs.ExecuteNonQuery("delete  from " + db1 + "shipment_paper where item='" + this.rember_item.Value + "' and aid='" + Request.QueryString["id"] + "' ");

                    for (int x = 0; x < this.CheckBoxList2.Items.Count; x++)
                    {
                        if (CheckBoxList2.Items[x].Selected == true)
                        {
                            SmoothEnterprise.Database.DataSet st = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            st.Open("SELECT * FROM " + db1 + "shipment_paper WHERE 1=0");
                            st.Add();
                            st["aid"] = Request.QueryString["id"];
                            st["item"] = this.rember_item.Value;
                            st["shipment_paper_id"] = CheckBoxList2.Items[x].Value;

                            st.Update();
                            st.Close();
                        }
                    }


                    #endregion

                    for (int i = 0; i < CheckBoxList2.Items.Count; i++)  //新增完將checkboxlist清除
                    {
                        CheckBoxList2.Items[i].Selected = false;
                    }

                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "test", "$(\"#FIELD_PartNo\").val('');$(\"#FIELD_Component\").val('');$(\"#FIELD_DWG\").val('');document.getElementById(\"ctl00_ContentPlaceHolder1_Button_UpdateItem\").style.display = \"none\" ;", true);
                    this.FIELD_Qty.Text = "";
                    this.FIELD_Material.Text = "NA";
                    this.FIELD_Material2.Text = "NA";
                    this.FIELD_Material3.Text = "NA";
                    this.FIELD_Shipment_type.Text = "";
                    this.FIELD_LV.Text = "";
                    this.FIELD_HV.Text = "";
                    this.FIELD_C_demand.Text = "";
                    this.FIELD_C_demand2.Text = "";
                    this.FIELD_ETA.Text = "";
                    this.FIELD_Potential_P.Text = "";
                    this.FIELD_Packing.Text = "QTY:" + Environment.NewLine + "NW/GW:" + Environment.NewLine + "CARTON QTY:" + Environment.NewLine + "VIA:" + Environment.NewLine + "Attn to:";

                    this.FIELD_Shipment_type.Text = "";
                    this.RadioButton1.Checked = true;
                    this.rember_item.Value = "";
                    this.FIELD_Potential_P_choose.Text = "";
                    this.FIELD_B_NO.Text = "";
                    this.FIELD_Shipment_status.Text = "";
                    this.FIELD_Labno.Text = "";
                    this.FIELD_EngineeringTestNo.Text = "";
                    this.FIELD_purpose2.Text = "";
                    this.FIELD_labsn.Text = "";
                    this.FIELD_Explanation.Text = "";

                    gridviewchange(Request.QueryString["id"]);

                }
                else
                {

                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rss.Open("SELECT * FROM " + db1 + "shipment_body WHERE item='" + this.rember_item.Value + "' and aid='" + Request.QueryString["id"] + "'  ");
                    if (!rss.EOF)
                    {


                        if (this.FIELD_B_NO.Text != "") rss["B_NO"] = this.FIELD_B_NO.Text;
                        if (this.FIELD_ETD.Text != "") rss["ETD"] = DateTime.ParseExact(this.FIELD_ETD.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces);

                        //當維護shipment_status時 寄信給業務

                        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rs.Open("SELECT shipment_status,name,email FROM  " + db1 + "shipment_body a  " +
                               "left join " + db1 + "shipment_head b on b.id=a.aid " +
                               "left join " + db2 + "dguser c on b.sales=c.id WHERE item='" + this.rember_item.Value + "' and aid='" + Request.QueryString["id"] + "'  ");
                        if (!rs.EOF)
                        {
                            if (this.FIELD_Shipment_status.Text != rs["shipment_status"].ToString())
                            {
                                rss["Shipment_status"] = this.FIELD_Shipment_status.Text;


                                ReSendInfo(no.Text, rs["name"].ToString(), "Shipment Status己維護完畢", "Customer:" + this.FIELD_Customer.Text + "<br>Customer PO:" + this.FIELD_PO.Text + "<br>己維護Shipment Status為" + this.FIELD_Shipment_status.Text, "c...", "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"]
                                    , this.CurrentUser.LogonID.ToString(), rs["email"].ToString());

                            }
                        }

                        rss.Update();

                    }
                    rss.Close();

                    this.FIELD_Qty.Text = "";
                    this.FIELD_Material.Text = "NA";
                    this.FIELD_Material2.Text = "NA";
                    this.FIELD_Material3.Text = "NA";
                    this.FIELD_Shipment_type.Text = "";
                    this.FIELD_LV.Text = "";
                    this.FIELD_HV.Text = "";
                    this.FIELD_C_demand.Text = "";
                    this.FIELD_C_demand2.Text = "";
                    this.FIELD_ETA.Text = "";
                    this.FIELD_Potential_P.Text = "";
                    this.FIELD_Packing.Text = "QTY:" + Environment.NewLine + "NW/GW:" + Environment.NewLine + "CARTON QTY:" + Environment.NewLine + "VIA:" + Environment.NewLine + "Attn to:";
                    this.FIELD_Shipment_type.Text = "";
                    this.RadioButton1.Checked = true;
                    this.rember_item.Value = "";
                    this.FIELD_Potential_P_choose.Text = "";
                    this.FIELD_B_NO.Text = "";
                    this.FIELD_Shipment_status.Text = "";
                    this.FIELD_Labno.Text = "";
                    this.FIELD_EngineeringTestNo.Text = "";
                    this.FIELD_purpose2.Text = "";
                    this.FIELD_labsn.Text = "";
                    this.FIELD_Explanation.Text = "";

                    gridviewchange(Request.QueryString["id"]);

                }


            }
            //ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aaa", " document.getElementById(\"ctl00_ContentPlaceHolder1_Button_UpdateItem\").style.display = \"none\" ;", true);
        }

        void gridviewchange(string aa)
        {



            string sql = "select aid, '' ERP_PO, item, Component, DWG, Partno, Material, Material2,Material3,  " +
                        "Shipment_type, LV, HV, Qty, CONVERT(char, C_demand, 111) AS C_demand, " +
                        "CONVERT(char, C_demand2, 111) AS C_demand2, CONVERT(char, ETD, 111) AS ETD, " +
                        "Potential_P, Paper, Packing, B_no, Shipment_status,lab_no,engineeringtest_no,c.id cid,purpose2,labsn , wear.rowno wear_rowno , Explanation ,a.remark from " + //V1.0.1
                                                                                                                                                                                       //db1 + "shipment_body  a left join (select * from " + db2 + "Experiment_head_file where no <>'' and papstatus <> 'V'  ) b on a.lab_no=b.no " + //V1.0.2 del
                         db1 + "shipment_body  a left join (select NO from " + db2 + "Experiment_head_file where no <>'' and papstatus <> 'V' group by NO ) b on a.lab_no=b.no " + //V1.0.2 update
                        "left join " + db2 + "engineeringtest_head c on a.engineeringtest_no=c.no left outer join eipb.dbo.LAP_Wear_test wear on a.labsn = wear.sn " +
                         "where aid='" + Request.QueryString["id"] + "'     ";

            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {

                ds.Open(sql);

                GridView1.DataSource = ds.GetDataTable;
                this.GridView1.DataBind();
            }



        }

        private void ReSendInfo(string sn, object receivername, string caption, string Descript, object body,
        object urlink, object MessageUser, string AppMail)
        {
            string DefSubject = "";


            DefSubject = "NPI送樣系統通知 單號:" + sn;



            SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
            sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
            sendmessage1.MessageID = new System.Guid("47d95ebe-5cf8-4242-862a-970274ac4b18");

            sendmessage1.Paramaters.Add("DefSubject", DefSubject);
            sendmessage1.Paramaters.Add("Title", Title);
            sendmessage1.Paramaters.Add("sn", sn); //加入Email 可使用的屬性
            sendmessage1.Paramaters.Add("receivername", receivername); //加入Email 可使用的屬性
            sendmessage1.Paramaters.Add("caption", caption); //加入Email 可使用的屬性
            sendmessage1.Paramaters.Add("Descript", Descript); //加入Email 可使用的屬性

            sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性
            sendmessage1.Paramaters.Add("MessageUser", MessageUser); //加入Email 可使用的屬性


            sendmessage1.To = AppMail; //給定通知人員
            SmoothEnterprise.Configuration.Parameter para = new
            SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
            sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
            sendmessage1.Send(); //寄信
        }

        public void GetBoxNumbers(TableCell cell, string numbers) //lab_no傳參數
        {

            if (!string.IsNullOrEmpty(numbers))
            {

                SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rsb.Open("SELECT rowid ,SamDescription FROM  eipA.dbo.Experiment_head_file WHERE no='" + numbers + "' ");
                System.Diagnostics.Debug.WriteLine(rsb.SQL);
                int i = 1;
                while (!rsb.EOF)
                {
                    LinkButton lb = new LinkButton();

                    lb.Text = numbers;

                    string url = string.Format("/experiment/StaExperimentShow.aspx?rowid={0}", rsb["rowid"]);
                    lb.Attributes.Add("href", url);
                    lb.Attributes.Add("target", "_blank");

                    Label l = new Label();

                    l.Text = i.ToString() + ".";
                    cell.Controls.Add(l);
                    cell.Controls.Add(lb);
                    cell.Controls.Add(new LiteralControl("<br />"));
                    i++;
                    rsb.MoveNext();
                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string FileList = "";
            for (int x = 0; x < this.CheckBoxList1.Items.Count; x++)
            {
                if (CheckBoxList1.Items[x].Selected == true)
                {
                    if (FileList == "")
                        FileList = "'" + CheckBoxList1.Items[x].Value + "'";
                    else
                        FileList = FileList + ",'" + CheckBoxList1.Items[x].Value + "'";
                }
            }

            for (int x = 0; x < this.CheckBoxFile2.Items.Count; x++)
            {
                if (CheckBoxFile2.Items[x].Selected == true)
                {
                    if (FileList == "")
                        FileList = "'" + CheckBoxFile2.Items[x].Value + "'";
                    else
                        FileList = FileList + ",'" + CheckBoxFile2.Items[x].Value + "'";
                }
            }

            for (int x = 0; x < this.CheckBoxFile3.Items.Count; x++)
            {
                if (CheckBoxFile3.Items[x].Selected == true)
                {
                    if (FileList == "")
                        FileList = "'" + CheckBoxFile3.Items[x].Value + "'";
                    else
                        FileList = FileList + ",'" + CheckBoxFile3.Items[x].Value + "'";
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
            rs2.Open("SELECT * FROM " + db1 + "shipment_File WHERE 1=0");
            int ifile = 0;
            foreach (string key in files.AllKeys)
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

                    if (key.IndexOf("attach1") > 0)
                    {
                        rs2["UserType"] = "1";    //附檔為BARCODE No.
                    }
                    if (key.Contains("InputFile"))
                    {
                        rs2["UserType"] = "2";   //附檔為SE Approved Doc
                    }
                    if (key.IndexOf("attach2") > 0)
                    {
                        rs2["UserType"] = "3";   //附檔為SE Approved Doc
                    }

                    rs2["FileKey"] = Request.QueryString["id"];
                    rs2["FileName"] = filename;
                    rs2["FileBody"] = fileBytes;
                    rs2["FileType"] = fileExt;
                    rs2.Update();
                }
                ifile++;
            }
            rs2.Close();


            #endregion
            //刪除附檔------------------------------------------------------------------------------------------
            if (FileList != "")
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet();
                rs.ExecuteNonQuery("Delete FROM " + db1 + " shipment_File WHERE ID in (" + FileList + ")");
            }
            if (!string.IsNullOrEmpty(Request.QueryString["other"]))
                Response.Redirect("Shipmentview.aspx?id=" + Request.QueryString["id"] + "&other=1");
            else
                Response.Redirect("Shipmentview.aspx?id=" + Request.QueryString["id"]);
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.FIELD_ETA.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "xxx", " alert('請輸入ETA');", true);
            }
            else
            {
                SmoothEnterprise.Database.DataSet rsu = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rsu.Open("SELECT * FROM " + db1 + "Shipment_head WHERE id='" + Request.QueryString["id"] + "' ");
                if (!rsu.EOF)
                {

                    rsu["ETA"] = this.FIELD_ETA.Text;

                    rsu.Update();
                }
                rsu.Close();

                //寄信給船務
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT name,email  FROM  " + db2 + "erp_flow LEFT JOIN " + db2 + "dguser on pid=id where  erp_name='shipment' and dep_name in ('forwarder')  ");
                while (!rs.EOF)
                {
                    String ques;

                    MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                    MailAddress to = new MailAddress(rs["email"].ToString());
                    MailMessage message = new MailMessage(from, to);
                    ques = rs["name"].ToString() + " 您好:" + "<br>" +
                           "<br>" +
                           "NPI送樣系統急件通知:" + "<br>" +
                           "<br>" +
                           "單號 : " + this.no.Text + "<br>" +
                           "ETA  : " + this.FIELD_ETA.Text + "<br>" +
                           "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/Shipment/ShipmentView.aspx?id=" + Request.QueryString["id"] + "\" >至NPI送樣系統查詢</a>" +
                           "<br>" +
                           "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                           "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                           "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                    message.Subject = "NPI送樣系統急件通知" + this.no.Text;

                    message.IsBodyHtml = true;
                    message.Body = ques;

                    SmtpClient client = new SmtpClient("192.168.0.12");

                    client.Send(message);
                    rs.MoveNext();
                }
                rs.Close();

                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "xxx", " alert('己發信通知船務');", true);

            }

        }
    }
}