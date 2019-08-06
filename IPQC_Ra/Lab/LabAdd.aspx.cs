using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab
{
    public partial class LabAdd : Lab_Base
    {　
        protected void Page_Load(object sender, System.EventArgs e)
        {
            _lang = CurrLang;
            _head_id = Request.QueryString["rowid"];
            if (!IsPostBack)
            {
                getUnit(cbo_unit);
                Init();
                UpdateGV();

                ViewState[_ts.tag] = _ts.Container;
            }
            else
            {
                _pos.Container = (DataTable)ViewState[_pos.tag];
                _ts.Container = (DataTable)ViewState[_ts.tag];

            }
        }

        private void Init()
        {
            IPQC_Ra_Head head = new IPQC_Ra_Head();
            head.GetInfo(_head_id);

            _statue = (status)head.status;
            lab_product.Text = getOptionName(head.product); 
            product.Value = head.product;
            lab_testtype.Text = getOptionName(head.test_type); 
            lab_testitem.Text = getOptionName(head.test_item);

            Dictionary<string, string> User = Utility.GetUIDInfo(head.employee);

            lab_applicant.Text = User["NAME"];
            lab_depat.Text = User["DEPT"];
            lab_week.Text = new TaiwanCalendar().GetWeekOfYear(head.received_dt, System.Globalization.CalendarWeekRule.FirstDay, System.DayOfWeek.Sunday).ToString();
            lab_Received.Text = head.received_dt.ToString("yyyy/MM/dd");
            lab_bomdt.Text = head.manufacture_dt.ToString("yyyy/MM/dd");
            lab_dispatch.Text = head.dispatch_no;
            lab_material.Text = head.material;
            lab_program.Text = getOptionName(head.program);
            lab_sample.Text = head.sample.ToString();
            lab_tooling.Text = head.tooling_no;
            lab_equipment.Text = head.equipment;
            lab_Ra_no.Text = head.ra_no;
        }

        #region Btn
        　
        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            string guid = Guid.NewGuid().ToString(); 
            save(guid, _head_id,cbo_unit.SelectedValue); 
            string Link = string.Format("LabEdit.aspx?rowid={0}&lab_id={1}", _head_id, guid);
            Response.Redirect(Link);
        }
        　
        protected void Btn_Continue_Click(object sender, EventArgs e)
        {
            string guid = Guid.NewGuid().ToString();
            save(guid, _head_id, cbo_unit.SelectedValue);
            string Link = string.Format("LabAdd.aspx?rowid={0}", _head_id);
            Response.Redirect(Link);
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            _pos.Add("", "", "", "", "", "", "", "", "");
            UpdateGV();
            lab_up.Update(); 
        }

        protected void Btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Lab.aspx");
        }

        #endregion Btn 

        protected void UpdateGV()
        {
            DataView view = new DataView(_pos.Container);

            gv_Lab.DataSource = view;
            gv_Lab.DataBind();
            ViewState[_pos.tag] = _pos.Container;
            ViewState[_ts.tag] = _ts.Container;
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

                    //cmp_dt
                    SmoothEnterprise.Web.UI.HTMLControl.InputText txt_comple_dt = new SmoothEnterprise.Web.UI.HTMLControl.InputText();
                    txt_comple_dt.ID = "txt_comple_dt";
                    txt_comple_dt.CssClass = "required";
                    txt_comple_dt.Width = 120;
                    txt_comple_dt.Attributes.CssStyle.Add("margin", "2px 2px");
                    txt_comple_dt.FormatType = SmoothEnterprise.Web.UI.HTMLControl.InputText.FormatTypes.DateTime;
                    e.Row.Cells[3].Width = 200;
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

                    LinkButton lbtn_file = new LinkButton();
                    lbtn_file.ID = "lbtn_file";
                    e.Row.Cells[2].Controls.Add(lbtn_file);

                    
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
                        }

                        ts.Controls.Add(row);
                    }

                    ts.Style.Add("margin", "5px 5px;");
                    ts.Style.Add("width", "70%");
                    ts.BorderWidth = 1;
                    ts.BorderColor = System.Drawing.Color.FromName("#808080");
                    ts.BorderStyle = BorderStyle.Solid;
                    ts.GridLines = GridLines.Both;
                    ts.CssClass = "all";
                    e.Row.Cells[5].Controls.Add(ts);
                    e.Row.Cells[5].Style.Add("padding", " 2px 2px");
                    e.Row.Cells[5].Style.Add("vertical-align ", "top");



                    DataTable temp = _ts.Container;
                    if (temp.Rows.Count > 0)
                    {
                        foreach (DataRow item in temp.Rows)
                        {
                            Button Btn_TS_Del = GridBtn("Btn_TS_Del", "Del", item["rowid"].ToString());
                            Btn_TS_Del.ID = "ts_del_" + item["rowid"];

                            e.Row.Cells[5].Controls.Add(Btn_TS_Del);
                        }
                    }

                    Button Btn_Lab_Del = GridBtn("Btn_Lab_Del", "Del", Index.ToString());
                    Btn_Lab_Del.CommandName = "Btn_Lab_Del";
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

                    string[] subName = { ".GIF", ".JPG", ".PNG" };
                    string fileName = drv["file_name"].ToString().ToUpper();
                    bool isImg = false;
                    foreach (string pc in subName)
                    {
                        if (fileName.Contains(pc))
                        {
                            isImg = true;
                            string attach = "";
                            if (drv["type"].ToString() == "s")
                            {
                                attach = drv["rowid"].ToString();
                                System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
                                img.ImageUrl = string.Format("showInage.ashx?type={0}&attach={1}", drv["type"].ToString(), attach);

                                img.Width = 250;
                                img.Height = 250;
                                e.Row.Cells[2].Controls.Add(img);

                                break;
                            }
                            else
                            {
                                System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
                                img.ImageUrl = "img/" + drv["file_name"];
                                img.Width = 200;
                                img.Height = 200;
                                e.Row.Cells[2].Controls.Add(img);
                                break;
                            }
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
                    e.Row.Cells[3].Text = drv["complate_date"].ToString();
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
                            string btn_name = "ts_del_" + item["rowid"];
                            Button Btn_TS_Del = (Button)e.Row.FindControl(btn_name);
                            Btn_TS_Del.Visible = true;
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

                        Avg.ForeColor = System.Drawing.Color.Chocolate;
                        Avg.BackColor = System.Drawing.Color.LightGoldenrodYellow;

                        TableCell avg_tag = new TableCell();
                        avg_tag.Text = "average";
                        avg_tag.ColumnSpan = 2;
                        Avg.Cells.Add(avg_tag);

                        TableCell avg_Total = new TableCell();
                        avg_Total.Text = dAvg.ToString();
                        avg_Total.ColumnSpan = 2;
                        avg_Total.CssClass = "avg";
                        Avg.Cells.Add(avg_Total);

                        Avg.Height = 30;
                        ts.Controls.Add(Avg);
                        drv["average"] = dAvg;
                    }
                }
                else
                {
                    Button Btn_Lab_OK = (Button)e.Row.FindControl("Btn_Lab_OK");
                    PostBackTrigger trg_Lab_OK = new PostBackTrigger();
                    trg_Lab_OK.ControlID = Btn_Lab_OK.UniqueID; //要偵測的物件ID 
                    lab_up.Triggers.Add(trg_Lab_OK);
                }
            }

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

                _pos.DelItem(index - 1);
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
                       
                        string TempPath = Path.Combine("img/", filename);
                        string img = Server.MapPath(TempPath);
                        fileU.SaveAs(img);
                        string attach = System.Text.Encoding.Default.GetString(fileU.FileBytes);
                        _pos.Add("", Guid.NewGuid().ToString(), filename, img, "", txt_comple_dt.Text, cbo_rart.SelectedValue, "", "t");
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
        　
        
    }
}
