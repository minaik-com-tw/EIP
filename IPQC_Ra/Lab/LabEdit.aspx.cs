using SmoothEnterprise.Flowwork.UI.WebControl;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab
{
    public partial class LabEdit : Lab_Base
    {

        string _leader = "";
        protected void Page_Load(object sender, System.EventArgs e)
        {
            msg.Value = "";

            _pos = new dtPosit();
            _ts = new dtTs();
            _lang = CurrLang;
            _head_id = Request.QueryString["rowid"];
            _lab_id = Request.QueryString["lab_id"];
            //2CA1C1C5-D0C2-405C-91D0-F45DDF9AB462 Thomas.Hsiao


            getUnit(cbo_unit);
            if (!IsPostBack)
            {
                try
                {
                    ViewState[_ts.tag] = _ts.Container;

                    _leader = "2CA1C1C5-D0C2-405C-91D0-F45DDF9AB462";

                }
                catch (Exception ex)
                {
                    Response.Write(_lab_id + "<br>" + ex.Message + "<br>");


                }
                getPosition(_lab_id);
                
                Init();
                setDisplay();
                UpdateGV();
            }
            else
            {
                _pos.Container = (DataTable)ViewState[_pos.tag];
                _ts.Container = (DataTable)ViewState[_ts.tag];
                string logonid=txt_leader.Text;
                _leader = Utility.GetUserID(logonid);
            } 
            
           Dictionary<string,string> US = Utility.GetUIDInfo(_leader);
            txt_leader.Text = US["LOGONID"];

        }

        private void getColor(string product)
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                string sql = " select * from eipe.dbo.ipqc_ra_color where product_id='" + product + "' ";

                rs.Open(sql);
                if (!rs.EOF)
                {
                    up.Value = rs["up"].ToString();
                    down.Value = rs["down"].ToString();
                    upper.Value = string.IsNullOrEmpty(rs["upper"].ToString()) ? "#0000000" : rs["upper"].ToString();
                    lower.Value = string.IsNullOrEmpty(rs["lower"].ToString()) ? "#0000000" : rs["lower"].ToString();
                }
            }
        }

        private void Init()
        {
            if (!string.IsNullOrEmpty(_lab_id))
            {
                Inspect _ins = new Inspect();
                _ins = getLab(_lab_id);

                txt_replay.Text = _ins.replay;
                txt_re_result.Text = _ins.report_result;
                lbtn_download.Text = _ins.report_name;



                Utility.setVisable(string.IsNullOrEmpty(_ins.report_name) ? false:true, lbtn_del, lbtn_download); //顯示
            }

            IPQC_Ra_Head head = new IPQC_Ra_Head();
            head.GetInfo(_head_id);


            lab_product.Text = getOptionName(head.product);
            lab_testtype.Text = getOptionName(head.test_type);
            lab_testitem.Text = getOptionName(head.test_item);

            Dictionary<string, string> User = Utility.GetUIDInfo(head.employee);

            lab_applicant.Text = User["NAME"];
            lab_depat.Text = User["DEPT"];
            lab_week.Text = new TaiwanCalendar().GetWeekOfYear(head.received_dt, System.Globalization.CalendarWeekRule.FirstDay, System.DayOfWeek.Sunday).ToString();
            lab_Received.Text = head.received_dt.ToString("yyyy/MM/dd");
            lab_bomdt.Text = head.manufacture_dt.ToString("yyyy/MM/dd");
            lab_dispatch.Text = head.dispatch_no;
            lab_material.Text = getOptionName(head.material);
            lab_program.Text = getOptionName(head.program);
            txt_receiptdt.Text = string.IsNullOrEmpty(head.receipt_dt) ? "" : Convert.ToDateTime(head.receipt_dt).ToString("yyyy/MM/dd");

            lab_sample.Text = head.sample.ToString();
            lab_tooling.Text = head.tooling_no;
            if (!string.IsNullOrEmpty(head.equipment))
            {
                lab_equipment.Text = IPQC_RaBase.getMachinName(head.equipment);
            }
            lab_Ra_no.Text = head.ra_no;
            lab_remark.Text = head.remark;


            cbo_unit.SelectedValue = head.data_nuit;
            getColor(head.product);

            if (_status == status.Complete)
            {
                if (pass == 0)
                {
                    img_result.ImageUrl = "../img/FAIL.png";

                }
                else if (pass == 1)
                {
                    img_result.ImageUrl = "../img/Pass.png";
                }
                else {
                    img_result.ImageUrl = "../img/OOC.png";
                }
            }
            Btn_RemindReviewer.Text = getStr("remind_reviewer");
            Btn_Stop.Text = getStr("stop");
            //Btn_Send.Text = getStr("sb");
            Btn_fail.Text = getStr("fail");
            Btn_Save.Text = getStr("save");
            Btn_Back.Text = getStr("back");

        }

        protected void getPosition(string lab_id)
        {
            if (!string.IsNullOrEmpty(lab_id))
            {
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
                {
                    string sql = string.Format("select * from eipe.dbo.ipqc_Ra_lab_position where lab_id='{0}' order by seq ", lab_id);
                    rs.Open(sql);
                    if (!rs.EOF)
                    {
                        _pos.Add("", "", "", "", "", "", "", "", "");
                    }
                    while (!rs.EOF)
                    {
                        string rowid = rs["rowid"].ToString();
                        string file_name = rs["file_name"].ToString();
                        string expect_date = rs["expect_date"].ToString();
                        string complate_date =Convert.ToDateTime(  rs["complate_date"].ToString()).ToString("yyyy/MM/dd");
                        string rart = rs["rart"].ToString();
                        string average = rs["average"].ToString();
                        string attach = Convert.ToBase64String((byte[])rs["file_attach"]);  //加密成64位元字串

                        _pos.Add(lab_id, rowid, file_name, attach, expect_date, complate_date, rart, average, "s");
                        getTsList(rowid);
                        rs.MoveNext();
                    }
                }
            }
        }

        private void UpdateGV()
        {
            ViewState[_ts.tag] = _ts.Container;
            ViewState[_pos.tag] = _pos.Container;

            DataView dv = new DataView(_pos.Container);

            gv_Lab.DataSource = dv;
            gv_Lab.DataBind(); 
        }

        #region gv_Lab



        protected void gv_Lab_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            //    if (e.Row.RowType == DataControlRowType.DataRow)
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                _pos.Container = (DataTable)ViewState[_pos.tag];
                _ts.Container = (DataTable)ViewState[_ts.tag];

                int Index = e.Row.RowIndex;

                if (Index == 0)
                {
                    //position
                    FileUpload fileU = new FileUpload();
                    fileU.ID = "fileU";
                    fileU.CssClass = "required";
                    fileU.Attributes.CssStyle.Add("margin", "2px 2px");
                    e.Row.Cells[2].Width = 200;
                    e.Row.Cells[2].Controls.Add(fileU);

                    ////cmp_dt
                    //SmoothEnterprise.Web.UI.HTMLControl.InputText txt_comple_dt = new SmoothEnterprise.Web.UI.HTMLControl.InputText();
                    //txt_comple_dt.ID = "txt_comple_dt";
                    //txt_comple_dt.CssClass = "required";
                    //txt_comple_dt.Width = 120;
                    //txt_comple_dt.Attributes.CssStyle.Add("margin", "2px 2px");
                    //txt_comple_dt.FormatType = SmoothEnterprise.Web.UI.HTMLControl.InputText.FormatTypes.DateTime;
                    //e.Row.Cells[3].Width = 200;
                    //e.Row.Cells[3].Controls.Add(txt_comple_dt);

                    TextBox txt_comple_dt = new TextBox();
                    txt_comple_dt.ID = "txt_comple_dt";
                    txt_comple_dt.CssClass = "required date";
                    //txt_comple_dt.CssClass = "required";
                    //txt_comple_dt.Width = 120;
                    //txt_comple_dt.Attributes.CssStyle.Add("margin", "2px 2px");
                    //txt_comple_dt.CssClass = "date";
                    e.Row.Cells[3].Controls.Add(txt_comple_dt);

                    //rart
                    DropDownList cbo_rart = new DropDownList();
                    cbo_rart = add_cbo("cbo_rart", IPQC_RaBase.Option.RART, "");
                    cbo_rart.Width = 120;
                    cbo_rart.CssClass = "required";
                    cbo_rart.ID = "cbo_rart";
                    cbo_rart.Attributes.CssStyle.Add("margin", "2px 2px");
                    e.Row.Cells[4].Width = 200;
                    e.Row.Cells[4].Controls.Add(cbo_rart);

                    e.Row.Cells[4].Width = 600;
                    Button Btn_Lab_OK = GridBtn("Btn_Lab_OK", "OK", "");
                    Btn_Lab_OK.OnClientClick = "return check_lab()";
                    e.Row.Cells[6].Controls.Add(Btn_Lab_OK);
                }
                else
                {
                    e.Row.Cells[1].Text = Index.ToString(); ;

                    LinkButton lbtn_file = new LinkButton();
                    lbtn_file.ID = "lbtn_file";
                    e.Row.Cells[2].Controls.Add(lbtn_file);

                    LinkButton lbtn_Add = new LinkButton();
                    lbtn_Add = ImgButton("lbtn_Add", "../img/add2.png");
                    lbtn_Add.CommandName = "lbtn_Add";
                    lbtn_Add.CommandArgument = Index.ToString();
                    lbtn_Add.Attributes.CssStyle.Add("margin", "2px 2px");
                    Table ts = new Table();
                    ts.ID = "ts_result";

                    for (int i = 0; i <= 1; i++)
                    {
                        TableRow row = new TableRow();
                        row.BorderWidth = 1;
                        row.HorizontalAlign = HorizontalAlign.Center;
                        row.BorderStyle = BorderStyle.Solid;
                        if (i == 0)
                        {
                            row.BackColor = System.Drawing.Color.RoyalBlue;
                            row.ForeColor = System.Drawing.Color.FromName("#fff");
                            row.Height = 30;
                        }
                        else
                        {
                            row.ForeColor = System.Drawing.Color.Black;
                            row.BackColor = System.Drawing.Color.White;
                            if (i % 2 == 0)
                            {
                                row.BackColor = System.Drawing.Color.FromName("#D3E6F1");
                            }
                        }
                        if (i == 0)
                        {
                            TableCell cell1 = new TableCell();
                            cell1.Text = getStr("sample_no");
                            row.Cells.Add(cell1);

                            TableCell cell2 = new TableCell();
                            cell2.Text = getStr("cav");
                            row.Cells.Add(cell2);

                            TableCell cell3 = new TableCell();
                            cell3.Text = getStr("measurement");
                            row.Cells.Add(cell3);

                            TableCell cell4 = new TableCell();
                            row.Cells.Add(cell4);
                        }
                        else
                        {
                            TableCell cell1 = new TableCell();

                            row.Cells.Add(cell1);

                            TextBox txt_cav = new TextBox();
                            txt_cav.ID = "txt_cav";
                            txt_cav.Width = 100;
                            txt_cav.MaxLength = 20;
                            txt_cav.CssClass = "ts_r";
                            TableCell cell2 = new TableCell();
                            cell2.Controls.Add(txt_cav);
                            row.Cells.Add(cell2);

                            TextBox txt_mm = new TextBox();
                            txt_mm.ID = "txt_mm";
                            txt_mm.MaxLength = 20;
                            txt_mm.CssClass = "ts_r";
                            txt_mm.Width = 100;
                            TableCell cell3 = new TableCell();
                            cell3.Controls.Add(txt_mm);
                            row.Cells.Add(cell3);

                            TableCell cell4 = new TableCell();

                            Button Btn_TS_OK = GridBtn("Btn_TS_OK", "OK", Index.ToString());
                            Btn_TS_OK.OnClientClick = "return check_ts(this)";
                            cell4.Controls.Add(Btn_TS_OK);
                            row.Cells.Add(cell4);

                            if (_status != status.Waite && _status != status.Stop)
                            {
                                row.Visible = false;
                            }
                        }

                        ts.Controls.Add(row);
                    }

                    ts.Style.Add("margin", "5px 5px;");
                    ts.Style.Add("width", "70%");
                    ts.BorderWidth = 1;
                    ts.BorderColor = System.Drawing.Color.FromName("#808080");
                    ts.BorderStyle = BorderStyle.Solid;
                    ts.GridLines = GridLines.Both;
                    ts.CssClass = "all ts_rs";
                    e.Row.Cells[5].Controls.Add(ts);
                    e.Row.Cells[5].Style.Add("padding", " 2px 2px");
                    e.Row.Cells[5].Style.Add("vertical-align ", "top");



                    DataTable temp = _ts.Container;
                    if (temp.Rows.Count > 0)
                    {
                        foreach (DataRow item in temp.Rows)
                        {
                            Button Btn_TS_Del = GridBtn("Btn_TS_Del", "Del", item["rowid"].ToString());
                            Btn_TS_Del.ID = "ts_del_" + "_" + Index + "_" + item["rowid"];
                            //Btn_TS_Del.Text = "ts_del_" + "_" + Index + "_" + item["rowid"];
                            //Btn_TS_Del.Width =200;
                            Btn_TS_Del.Visible = false;

                            e.Row.Cells[5].Controls.Add(Btn_TS_Del);
                        }
                    }

                    Button Btn_Lab_Del = GridBtn("Btn_Lab_Del", "Del", Index.ToString());
                    Btn_Lab_Del.CommandName = "Btn_Lab_Del";
                    Btn_Lab_Del.Visible = isShow();
                    Btn_Lab_Del.CommandArgument = Index.ToString();
                    e.Row.Cells[6].Controls.Add(Btn_Lab_Del);
                }
            }

            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[2].Text = getStr("m_position");
                e.Row.Cells[3].Text = getStr("cmp_dt");
                e.Row.Cells[4].Text = getStr("rart");
                e.Row.Cells[5].Text = getStr("test_result");
            }
        }

        protected void gv_Lab_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int Index = e.Row.RowIndex;
                if (Index > 0)
                {
                    DataRowView drv = (DataRowView)e.Row.DataItem;

                    //"head_id", "rowid", "file_name", "file_attach", "expect_date", "complate_date"
                    e.Row.Cells[0].Text = drv["rowid"].ToString();
                    //GIF、JPG、PNG

                    Label lab = new Label();
                    lab.CssClass = "ts_seq";
                    lab.Text = Index.ToString();
                    e.Row.Cells[1].Controls.Add(lab);

                    string fileName = drv["file_name"].ToString().ToUpper();
                    string subName = Path.GetExtension(fileName).ToUpper();
                    bool isImg = false;

                    if (subName == ".JPG" || subName == ".GIF" || subName == ".BMP" || subName == ".PNG")
                    {
                        isImg = true;
                        string attach = "";
                        if (drv["type"].ToString() == "s")
                        {
                            attach = drv["rowid"].ToString();
                            System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();

                            e.Row.Cells[2].Text = "<img style=\"width: 250px; height:250px;\" src=\"ShowImage.ashx?type=s&attach=" + attach + "\">";

                        }
                        else
                        {

                            System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();


                            img.ImageUrl = Path.Combine("~/TEMP/", drv["file_name"].ToString());

                            img.Width = 200;
                            img.Height = 200;
                            e.Row.Cells[2].Controls.Add(img);

                        }
                    }


                    if (isImg == false)
                    {
                        LinkButton lbtn_file = (LinkButton)e.Row.Cells[4].FindControl("lbtn_file");
                        lbtn_file.CommandArgument = drv["rowid"].ToString();
                        lbtn_file.CommandName = "lbtn_file";
                        lbtn_file.ID = "lbtn_file";
                        lbtn_file.Text = drv["file_name"].ToString();
                    }

                    e.Row.Cells[2].Style.Add("padding", " 2px 2px");
                    e.Row.Cells[2].Style.Add("vertical-align ", "top");


                    //e.Row.Cells[2].Text = drv["file_name"].ToString();
                    e.Row.Cells[3].Text = drv["complate_date"].ToString();//Convert.ToDateTime().ToString("yyyy/MM/dd");
                    e.Row.Cells[4].Text = getOptionName(drv["rart"].ToString());
                    Double dAvg = 0;
                    DataRow[] TsList = _ts.getList(" position_id='" + drv["rowid"].ToString() + "' ");

                    if (TsList.Length > 0)
                    {
                        Table ts = (Table)e.Row.Cells[5].FindControl("ts_result");
                        int i = 1;
                        double total = 0;
                        foreach (DataRow item in TsList)
                        {
                            TableRow row = new TableRow();
                            row.BorderWidth = 1;
                            row.HorizontalAlign = HorizontalAlign.Center;
                            row.BorderStyle = BorderStyle.Solid;

                            row.ForeColor = System.Drawing.Color.Black;
                            row.BackColor = System.Drawing.Color.White;
                            if (i % 2 == 0)
                            {
                                row.BackColor = System.Drawing.Color.FromName("#D3E6F1");
                            }

                            TableCell cell1 = new TableCell();
                            cell1.Text = Convert.ToString(i);
                            row.Cells.Add(cell1);

                            TableCell cell2 = new TableCell();
                            cell2.Text = item["cav"].ToString();
                            row.Cells.Add(cell2);


                            TableCell cell3 = new TableCell();
                            cell3.Text = item["measurement"].ToString();
                            total += Convert.ToDouble(item["measurement"]);
                            cell3.CssClass = "mm";
                            row.Cells.Add(cell3);

                            TableCell cell4 = new TableCell();
                            string btn_name = "ts_del_" + "_" + Index + "_" + item["rowid"];
                            Button Btn_TS_Del = (Button)e.Row.FindControl(btn_name);
                            Btn_TS_Del.Visible = isShow();

                            cell4.Controls.Add(Btn_TS_Del);



                            row.Cells.Add(cell4);
                            ts.Controls.Add(row);
                            i++;
                        }
                        /***************************/

                        dAvg = Math.Round((total / TsList.Length), 3);

                        TableRow Avg = new TableRow();
                        Avg.BorderWidth = 1;
                        Avg.HorizontalAlign = HorizontalAlign.Center;
                        Avg.BorderStyle = BorderStyle.Solid;
                        Avg.CssClass = "avg_rs";
                        Avg.ForeColor = System.Drawing.Color.FromName("#fff");
                        Avg.BackColor = System.Drawing.Color.FromName("#778CA5");

                        TableCell avg_tag = new TableCell();
                        avg_tag.Text = "average";
                        avg_tag.ColumnSpan = 2;
                        avg_tag.CssClass = "avg";
                        avg_tag.BackColor = Color.Yellow;
                        Avg.Cells.Add(avg_tag);

                        TableCell avg_Total = new TableCell();
                        avg_Total.Text = dAvg.ToString();
                        avg_Total.ColumnSpan = 2;
                        avg_Total.CssClass = "avg";
                        avg_tag.BackColor = Color.Yellow;
                        Avg.Cells.Add(avg_Total);

                        Avg.Height = 30;
                        ts.Controls.Add(Avg);

                        drv["average"] = dAvg;

                    }
                }
                else
                {
                    e.Row.Visible = isShow();

                    Button Btn_Lab_OK = (Button)e.Row.FindControl("Btn_Lab_OK");
                    PostBackTrigger trg_Lab_OK = new PostBackTrigger();
                    trg_Lab_OK.ControlID = Btn_Lab_OK.UniqueID; //要偵測的物件ID 
                    lab_up.Triggers.Add(trg_Lab_OK);
                }
            }
        }

        //顯示gvlist 的修改元件
        private bool isShow()
        {
            bool ishwo = true;
            if (base._status != status.Waite && base._status != status.Stop && base._status != status.Back)
            {
                ishwo = false;
            }

            if (IPQC_RaBase.isManage) //supert manager 
            {
                ishwo = true;
            }

            return ishwo;
        }

        protected void gv_Lab_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            string BtnName = e.CommandName.ToString();

            if (BtnName == "Btn_Lab_OK")
            {
                Save_Position();
            }

            if (BtnName == "Btn_Lab_Del")
            {
                int index = Convert.ToInt16(e.CommandArgument);
                string id = gv_Lab.Rows[index].Cells[0].Text;

                _pos.DelItem(index);
                _ts.DelList(" position_id='" + id + "' ");
            }

            if (BtnName == "Btn_TS_OK")
            {
                int index = Convert.ToInt16(e.CommandArgument);
                add_Result(index);
            }

            if (BtnName == "Btn_TS_Del")
            {
                string ts_id = e.CommandArgument.ToString();
                del_Result(ts_id);
            }

            if (BtnName == "lbtn_file")
            {
                string fileName = e.CommandArgument.ToString();
                DownloadFile(fileName);
            }

            UpdateGV();
            lab_up.Update();
        }

        private void del_Result(string ts_id)
        {
            _ts.DelList(" rowid='" + ts_id + "' ");
        }

        private void add_Result(int gv_index)
        {
            Table ts = (Table)gv_Lab.Rows[gv_index].Cells[5].FindControl("ts_result");

            string position = gv_Lab.Rows[gv_index].Cells[0].Text;

            TextBox txt_cav = (TextBox)ts.FindControl("txt_cav");
            TextBox txt_mm = (TextBox)ts.FindControl("txt_mm");

            _ts.Add(Guid.NewGuid().ToString(), position, txt_cav.Text, txt_mm.Text, "");

        }

        private void Save_Position()
        {
            FileUpload fileU = (FileUpload)gv_Lab.Rows[0].FindControl("fileU");
            TextBox txt_comple_dt = (TextBox)gv_Lab.Rows[0].FindControl("txt_comple_dt");
            DropDownList cbo_rart = (DropDownList)gv_Lab.Rows[0].FindControl("cbo_rart");

            string show = "";
            if (fileU.HasFile != false)
            {
                // FU1.FileName 只有 "檔案名稱.附檔名"，並沒有 Client 端的完整理路徑
                string filename = fileU.FileName;
                string extension = Path.GetExtension(filename).ToLowerInvariant();

                // 限制檔案大小，限制為 2MB
                int filesize = fileU.PostedFile.ContentLength / 1024;
                if (filesize > 15360)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", "$(function(){alert('" + getStr("file_size_error") + "');})", true);
                }
                else
                {
                    if (filename.Length > 30)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", "$(function(){alert('" + getStr("file_name_error") + "');})", true);
                    }
                    else
                    {

                        string TempPath = Path.Combine(Path.GetTempPath(), filename);
                        //                        string img = Server.MapPath(TempPath);

                        if (File.Exists(TempPath))
                        {
                            File.Delete(TempPath);
                        }

                        fileU.SaveAs(TempPath);


                        string attach = System.Text.Encoding.Default.GetString(fileU.FileBytes);
                        _pos.Add("", Guid.NewGuid().ToString(), filename, TempPath, "", txt_comple_dt.Text, cbo_rart.SelectedValue, "", "t");
                    }
                }
            }
            else
            {
                _pos.Add("", Guid.NewGuid().ToString(), "", "", "", txt_comple_dt.Text, cbo_rart.SelectedValue, "", "");
            }

            UpdateGV();
            lab_up.Update();
        }
        #endregion
        #region btn

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            _pos.Add("", "", "", "", "", "", "", "", "");
            UpdateGV();
            lab_up.Update();
        }
        #endregion

        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            try
            {

                string guid = save(_lab_id, _head_id, cbo_unit.SelectedValue, txt_receiptdt.Text, txt_re_result.Text, txt_replay.Text, lbtn_download.Text);
                Response.Redirect("labEdit.aspx?rowid=" + _head_id + "&lab_id=" + guid);
                UpdateGV();
                lab_up.Update();
            }
            catch (Exception ex)
            {
                //Utility.log(1, "LabEdit  Btn_Save_Click ", CurrentUser.Name, ex.StackTrace, ex.Message);
            }


        }

        protected void Btn_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            string head_id = Request.QueryString["rowid"];
            string lab_id = Request.QueryString["lab_id"];

            Inspect lab = new Inspect();


            if (this.IsValid)
            {
                try
                {
                    this.Btn_SendRequest.Flow = this.FlowClient1;
                    _status = status.Send;

                    lab.UpdateStatus(lab_id, status.Send);
                    setDisplay();
                    UpdateGV();
                    lab_up.Update();
                    // lab_InspectNO.Text = AddONumber(Request.QueryString["rowid"]);

                    // Response.Write("<script>alert('執行送審');</script>");
                    //執行送審程序
                    ArrayList managerid = new ArrayList();  //主管id 
                    ArrayList managernm = new ArrayList();  //主管 Text

                    managerid.Add(_leader);
                    managernm.Add("確認");

                    int count = 0;
                    foreach (string i in managerid)
                    {
                        this.FlowClient1.AddParameter("USER" + count.ToString(), i);
                        count++;
                    }
                    count = 0;
                    foreach (string i in managernm)
                    {
                        this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
                        count++;
                    }


                    sharflow12_2.Flowwork.sharflow12_21 flow = new sharflow12_2.Flowwork.sharflow12_21();
                    FlowClient1.Text = "IPQC Ra 實驗室檢驗單 單號：" + lab_Ra_no.Text;

                    switch (managerid.Count)  //依舊arraylist裡面有幾個,來判斷走那條flow
                    {

                        case 1:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 2:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 3:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 4:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 5:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 6:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 7:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 8:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 9:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 10:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 11:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 12:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 13:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 14:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 15:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;
                    }

                    e.NextNode.ReviewerURL = "/IPQC_Ra/Lab/LabView.aspx";
                    FirstApprove(managerid[0].ToString());

                }
                catch (Exception ex)
                {
                    this.AddError(this, "BUTTON_save_Click()", "", ex.Message);
                }
            }
        }

        protected void Btn_RemindReviewer_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            string request_id = "";
            string lab_id = Request.QueryString["lab_id"];
            string head_id = Request.QueryString["rowid"];

            string requesturl = string.Format("IPQC_Ra/Lab/LabEdit.aspx?rowid={0}&lab_id={1}", head_id, lab_id);
            UpdateGV();
            lab_up.Update();
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            StringBuilder sb = new StringBuilder();
            sb.Append(" select revieweruid bid from eipa.dbo.dgflowqueue f  ");
            sb.AppendFormat(" where requesturl  like '%{0}' and revieweruid <> '{1}' and reviewdate is null ", requesturl, System.Guid.Empty.ToString());
            rs.Open(sb.ToString());
            //rs.Open("select a.*, b.name requestname, b.email,b.id bid from dgflowqueue a left join dguser b on a.revieweruid = b.id " +
            //        "left join eipe.dbo.IPQC_Ra_Lab l on l.rowid= '" + lab_id + "' " +
            //        "where requesturl = '/lab/labEdit.aspx?rowid=" + head_id + "&lab_id="+lab_id+"' and revieweruid <> " +"'" + System.Guid.Empty.ToString() + "' and reviewdate is null ");
            if (!rs.EOF)
            {
                request_id = rs["bid"].ToString();

                #region 代理人
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs2.Open(" SELECT b.id 'proxy',email,sdate,edate,GETDATE() FROM dguserdeputy a left join dguser b on a.deputyuid=b.id " +
                         " where  a.uid='" + request_id + "'  " +
                         " and  " +
                         " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                         " (a.sid='4a632e9b-efc0-4162-9751-94996d850faf' and sdate < GETDATE() and edate is null) or " +
                         " (a.sid='4a632e9b-efc0-4162-9751-94996d850faf' and sdate < GETDATE() and edate > GETDATE()) or " +
                         "  a.sid is null and sdate < GETDATE() and edate  > GETDATE()) ");
                if (!rs2.EOF)
                {
                    request_id = rs2["proxy"].ToString();

                }
                rs2.Close();
                #endregion

                ReviewerMail(head_id, lab_id, request_id, lab_Ra_no.Text);

            }
        }

        protected void Btn_Stop_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {

            string head_id = Request.QueryString["rowid"].ToString();
            _status = status.Stop;

            string lab_id = Request.QueryString["lab_id"];
            Inspect lab = new Inspect();
            lab.GetInfo(lab_id);

            lab.UpdateStatus(lab_id, status.Stop);
            setDisplay();
            UpdateGV();
            lab_up.Update();
            //發通知給目前審核者,說已經中止了

            SendMail(head_id, lab_id, _leader, lab_Ra_no.Text, lab.send_date.ToShortDateString());

            DBTransfer fs = new DBTransfer();
            if (!string.IsNullOrEmpty(lab_id))
            {
                fs.RunIUSql("delete  dgflowqueue where requesturl like '%" + lab_id + "%'");

            } 
        }

        protected void Btn_fail_Click(object sender, EventArgs e)
        {
            string guid = Request.QueryString["lab_id"].ToString();
            _status = status.Fial;
            Inspect lab = new Inspect();
            lab.UpdateStatus(guid, status.Fial);
            setDisplay();
            Response.Write("<script>alert('已經作廢完畢');</script>");

        }

        protected void Btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Lab.aspx");
        }
        private void FirstApprove(string uid)
        {
            string rowid = Request.QueryString["rowid"];
            string lab_id = Request.QueryString["lab_id"];
            SendMail(rowid, lab_id, uid, lab_Ra_no.Text, DateTime.Now.ToShortDateString());
        }

        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            try
            {
                SmoothEnterprise.Web.UI.HTMLControl.InputText it;
                object obj = this.FlowFeedbackViewer1.HistoryView.FindControl("S_Comment");
                it = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj;
                it.Enabled = true;
                it.ReadOnly = true;
                it.Text = (string)e["Flow_Comment"];

                System.Web.UI.WebControls.Image sin1;
                object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
                sin1 = (System.Web.UI.WebControls.Image)obj5;


                System.Web.UI.WebControls.Image sin2;
                object obj6 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image2");
                sin2 = (System.Web.UI.WebControls.Image)obj6;


                sin1.Visible = false;  //default image 為Visable=true;

                //e["IniReviewer"].ToString() 表示"代"字
                if ((string)e["IniReviewer"].ToString().Length.ToString() == "0") sin2.Visible = false;
                else sin2.Visible = true;//為代理人


                //Response.Write((string)e["InputText3"].ToString() + "--");
                if ((string)e["InputText3"].ToString().Length.ToString() != "0")
                {
                    //判斷圖檔是否存在
                    string strupp = "";  //接 歷史的審核人員 logonid
                    DirectoryInfo di = new DirectoryInfo("C:\\Inetpub\\E_Portal1\\image");
                    FileInfo[] fi = di.GetFiles();
                    foreach (FileInfo fiTemp in fi)
                    {
                        strupp = (string)e["InputText3"] + ".jpg";//簽核者帳號
                                                                  //資料一律轉成大寫
                                                                  // Response.Write(fiTemp.Name.ToUpper() + "--" + strupp.ToUpper()+"--");

                        if (fiTemp.Name.ToUpper() == strupp.ToUpper())
                        {
                            sin1.Visible = true;
                            break;

                        }
                    }
                    sin1.ImageUrl = "~/image/" + (string)e["InputText3"] + ".JPG";


                }

                if ((string)e["IniReviewer"].ToString().Length.ToString() == "0") sin2.Visible = false;


            }
            catch { }
        }

        private void setDisplay()
        {


            Utility.setEnable(false, Btn_RemindReviewer, Btn_Stop, Btn_fail, Btn_Save, Btn_Back, txt_leader, lab_Mg1, cbo_unit, txt_receiptdt);

            int Status = (int)_status;

            switch (Status)
            {
                case (int)status.Complete:
                case (int)status.Fial:
                    Utility.setEnable(false, Btn_RemindReviewer, Btn_Stop, Btn_fail, Btn_Save, Btn_Back, txt_leader, lab_Mg1, cbo_unit, txt_receiptdt);
                    break;

                case (int)status.Send:
                    Utility.setEnable(true, Btn_Stop, Btn_RemindReviewer);
                    break;

                case (int)status.Back:
                case (int)status.Stop:
                case (int)status.Waite:
                default:

                    Utility.setEnable(true, Btn_fail, Btn_Save, txt_leader, lab_Mg1, cbo_unit, txt_receiptdt);

                    this.AddWarning(this, "Page_Load()", "", "請記得將單據送審！");
                    this.AddWarning(this, "Page_Load()", "", "若修改資料，請先按儲存鈕將資料儲存！");

                    break;
            }

            //if (string.IsNullOrEmpty(_lab_id))
            //{
            //    Utility.setEnable(false, Btn_Send);
            //}

            Utility.setEnable(true, Btn_Back);

            if (IPQC_RaBase.isManage) //supert manager 
            {
                if (Status != (int)status.Fial)
                {
                    Utility.setEnable(true, Btn_RemindReviewer, Btn_Stop, Btn_fail, Btn_Save, Btn_Back, txt_leader, lab_Mg1, cbo_unit, txt_receiptdt);
                }
            }
        }

        protected void btn_upload_Click(object sender, EventArgs e)
        {
            Utility.setVisable(true, lbtn_del, lbtn_download);

            UpdateGV();
            lab_up.Update();

            string upload = file_upload.FileName;
            if (!string.IsNullOrEmpty(upload))
            {
                FileInfo f = new FileInfo(upload);

                if (f.Name.Length > 20)
                {
                    msg.Value = getStr("file_name_long");
                }
                else
                {
                    bool status = false;


                    if (file_upload.HasFile != false)
                    {
                        //3.上傳FTP
                        string filename = file_upload.FileName;

                        // 限制檔案大小，限制為 2MB
                        int filesize = file_upload.PostedFile.ContentLength / 1024;
                        if (filesize > 15360)
                        {
                            msg.Value = getStr("file_large");

                        }
                        else
                        {

                            if (filename.Length > 20)
                            {
                                msg.Value = getStr("file_name_long");
                            }
                            else
                            {

                                string temp = Path.Combine(Path.GetTempPath(), file_upload.FileName);

                                file_upload.SaveAs(temp); //存在temp 
                                lbtn_download.Text = file_upload.FileName;
                                panel_upload.Update();
                            }
                        }

                    }

                }
            }

        }

        protected void lbtn_del_Click(object sender, EventArgs e)
        {
            Utility.setVisable(false, lbtn_del, lbtn_download);

            string files =Path.Combine(Path.GetTempPath(), lbtn_download.Text);

            if (!string.IsNullOrEmpty(files))
            {
                if (File.Exists(files))
                {
                    File.Delete(files);
                }

            }

            if (!string.IsNullOrEmpty(_lab_id))
            {
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    string sql = string.Format("select * from eipe.dbo.ipqc_ra_lab where rowid='{0}' ", _lab_id);
                    rs.Open(sql);
                    if (!rs.EOF)
                    {
                        rs["report_name"] = null;
                        rs["Report"] = null;
                        rs["modify_user"] = CurrentUser.ID;
                        rs["modify_date"] = DateTime.Now.ToString();
                        rs.Update();
                    }
                }

            }
            UpdateGV();
            lab_up.Update();

        }

        protected void lbtn_download_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(_lab_id))
            {
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
                {
                    rs.Open("select * from eipe.dbo.ipqc_ra_lab where rowid='" + _lab_id + "' ");


                    if (!rs.EOF)
                    {
                        MABase.outFile(rs["report_name"].ToString(), (byte[])rs["report"]);

                    }
                }
            }
        }
         
    }
}
