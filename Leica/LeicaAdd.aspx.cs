using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Leica
{
    
    public partial class LeicaAdd : LeicaBase
    {
        int _all_row = 0;
        int tt= 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                msg.Value = "";
                Create_Table();

                //---------------------------------

                if (!IsPostBack)
                {
                    InitUI();
                    OutTable();
                    _head_id = Guid.NewGuid().ToString();
                    tt = 1;
                }
                else
                {
                    tt += 1;
                    GetTable();
                    _h_operator = txt_operator.Text;
                    _insp_date = txt_inspDt.Text;
                    _kind = ddl_kind.SelectedValue;
                    _product = ddl_product.SelectedValue;
                    _program = ddl_program.SelectedValue;
                    _result = ddl_result.SelectedValue;

                    _inspect = ddl_inspect.SelectedValue;
                    _samp_count = txt_samp_count.Text;
                    _sp_stand = ddl_sp_stand.SelectedValue;
                    _insp_count = txt_insp_count.Text;
                    _birthDt = txt_birthDt.Text;
                    _b_opeartor = txt_b_opeartor.Text;

                    _test = ddl_test.SelectedValue;
                    _ts_standard = ddl_ts_standard.SelectedValue;
                    _prod_index = txt_prod_index.Text;
                    _insp_time = txt_insp_time.Text;
                    _ft_qty = txt_ft_qty.Text;
                    _ft_jdug = ddl_ft_judg.SelectedValue;

                    _s1 = txt_s1.Text;
                    _s2 = txt_s2.Text;
                    _s3 = txt_s3.Text;
                    _s4 = txt_s4.Text;
                    _s5 = txt_s5.Text;


                    _shape = ddl_shape.SelectedValue;

                    _base_id = base_id.Value;
                    _head_id = head_id.Value;
                    _ft_rowid = ft_rowid.Value;

                    _position = ddl_position.SelectedValue;
                    _vmi_qty = txt_vmi_qty.Text;
                    _vmi_judg = ddl_vmi_judg.SelectedValue;
                }

                ddl_setting();
                head_id.Value = _head_id;
                base_id.Value = _base_id;
                ft_rowid.Value = _ft_rowid;

                txt_inspDt.Text = _insp_date;
                ddl_kind.SelectedValue = _kind;
                ddl_product.SelectedValue = _product;
                ddl_program.SelectedValue = _program;
                ddl_result.SelectedValue = _result;

                ddl_inspect.SelectedValue = _inspect;
                txt_samp_count.Text = _samp_count;
                txt_insp_count.Text = _insp_count;
                ddl_sp_stand.SelectedValue = _sp_stand;

                txt_birthDt.Text = _birthDt;
                txt_b_opeartor.Text = _b_opeartor;

                Vmi_Bind();
                All_Bind(); //all_list
                Ft_Bind();
                S5_Bind();

            }
            catch (Exception ex)
            {
                throw ex;
            }

            lb_test.Text = tt.ToString();
        }

        /// <summary>
        /// s5_list 重新開始，所以要清空，以免第一列群組異常
        /// </summary>
        private void s5_list_init()
        {
            curr_ft_id = "";
            item = 1;

        }

        /// <summary>
        /// 因為多國語言要轉換 ddl內的選單，所以放在外面
        /// </summary>
        private void ddl_setting()
        {
            OperatorKind(ddl_kind, true);
            OperatorResult(ddl_result, false);
            Sample_Standard(ddl_sp_stand, false);
            OperatorJudg(ddl_vmi_judg, false);
            OperatorJudg(ddl_ft_judg, false);
            OperatorShape(ddl_shape, false);
            OperatorPosition(ddl_position, false);
            OperatorInpsert(ddl_inspect, false);

            Join_Product(ddl_product);
            Join_Program(ddl_program);
        }

        private void InitUI()
        {
            //up_vmi.Visible = false;
            //up_ft.Visible = false;  

            _insp_date = DateTime.Now.ToShortDateString();
            txt_operator.Text = CurrentUser.LogonID;
            _insp_count = "0";
            _samp_count = "0";

            //getProgram(ddl_programe, false);
            //getInspect(ddl_inspect, false);
            //getProduct(ddl_product, false);
        }

        #region event

        protected void lbtn_base_add_Click(object sender, EventArgs e)
        {
            //add_Main();

            if (vmi_list.Rows.Count > 0)
            {
                add_vmi(_base_id);
                add_All(_base_id);
                DataTable empty = new DataTable();
                GridView_Bind(vmi_list, empty);
            }
        }

        private void add_vmi(string uid)
        {
            foreach (DataRow row in t_vmi.Table.Rows)
            {
                row["base_id"] = uid;
                vmi.Table.ImportRow(row);
            }

            t_vmi.Table.Rows.Clear();
            Vmi_Bind();
        }

        protected void lbtn_insp_add_Click(object sender, EventArgs e)
        {
            //up_vmi.Visible = false;
            //up_ft.Visible = false;

            _base_id = Guid.NewGuid().ToString();

            base_id.Value = _base_id;

            curr_page.Value = _inspect;
            if (_inspect.ToUpper() == "VMI")
            {
                //up_vmi.Visible = true;
                up_vmi.Update();
            }
            else
            {
                ft_show();
                //up_ft.Visible = true;
                up_ft.Update();
            }
        }

        protected void ddl_test_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_join_parent(ddl_ts_standard, _test, false);
        }

        protected void lbin_shape_add_Click(object sender, EventArgs e)
        {
            string txt = ddl_shape.SelectedItem.Text;

            try
            {
                shape_temp_add(txt);
                shape_temp_bind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + "<br>" + ex.StackTrace);
                //throw new Exception("_shape_id can't empty,error at lbin_shape_add_Click");
            }
        }

        protected void stemp_list_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            if (!string.IsNullOrEmpty(id))
            {
                string del = string.Format("shape_id ='{0}' ", id);
                t_shape.Row_Del(del);
            }

            shape_temp_bind();
        }

        protected void lbtn_vmi_add_Click(object sender, EventArgs e)
        {

            string vmi_id = Guid.NewGuid().ToString();
            //                  ( "base_id", "vmi_id", "position", "position_id", "qty", "judg", "judg_id");
            t_vmi.Table.Rows.Add("", vmi_id, ddl_position.SelectedItem.Text, _position, _vmi_qty, ddl_vmi_judg.SelectedItem.Text, _vmi_judg);
            shape_traffic(vmi_id);

            ddl_position.SelectedValue = "";
            ddl_shape.SelectedValue = "";
            txt_vmi_qty.Text = "0";
            ddl_vmi_judg.SelectedValue = "";

            Vmi_Bind();
        }

        protected void vmi_list_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;
                getShape(e.Row.Cells[2], drv["vmi_id"].ToString());
            }
        }

        private void getShape(TableCell cell, string guid)
        {
            DataRow[] Rows = shape.Table.Select(string.Format(" vmi_id='{0}' ", guid));

            //new data_table("shape", "shape_id", "shape_id", "shape");
            int i = 0;
            foreach (DataRow dr in Rows)
            {
                Panel p = new Panel(); //span
                p.Style.Add("margin", "5px");

                Label lab_sp = new Label(); //名稱
                lab_sp.ID = dr["shape_id"].ToString();
                lab_sp.Text = dr["shape"].ToString();

                LinkButton lbtn_sp_del = new LinkButton();
                lbtn_sp_del.Attributes.Add("title", "del");
                lbtn_sp_del.ID = string.Format("lbtn_sp_del_{0}", i);
                lbtn_sp_del.CommandArgument = dr["shape_id"].ToString();
                lbtn_sp_del.CommandName = guid;
                lbtn_sp_del.Click += new EventHandler(lbtn_sp_del_Click);
                //lbtn_sp_del.Command += new CommandEventHandler(lbtn_sp_del_Command);
                lbtn_sp_del.Style.Add("text-decorationx", "none");
                lbtn_sp_del.Text = "<i class='fas fa-minus'></i>";

                p.Controls.Add(lab_sp);
                if (Rows.Length > 1)
                {
                    p.Controls.Add(lbtn_sp_del);
                }

                cell.Controls.Add(p);
                //cell.Text = "["+dr["shape"].ToString()+"]"; 


                i++;
            }
        }

        private Panel getShapeRegion(string guid)
        {
            DataRow[] Rows = shape.Table.Select(string.Format(" vmi_id='{0}' ", guid));
            Panel p = new Panel();
            Label lab_sp = new Label(); //名稱
            string txt = "";
            foreach (DataRow dr in Rows)
            {

                txt += "<p>" + dr["shape"].ToString() + "</p>";
            }

            lab_sp.Text = txt;
            p.Controls.Add(lab_sp);
            return p;
        }

        private void lbtn_sp_del_Click(object sender, EventArgs e)
        {
            //此处获取CommandArgument的值！
            string shape_id = ((LinkButton)sender).CommandArgument;
            string guid = ((LinkButton)sender).CommandName;

            string del = string.Format(" vmi_id='{0}' and shape_id='{1}' ", guid, shape_id);
            shape.Row_Del(del);
            Vmi_Bind();
        }

        protected void vmi_list_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string guid = vmi_list.DataKeys[e.RowIndex].Value.ToString();

            shape.Row_Del(string.Format(" shape_id='{0}' ", guid));
            t_vmi.Row_Del(string.Format(" vmi_id='{0}' ", guid));
            Vmi_Bind();
        }

        #endregion event

        #region function 

        private void shape_traffic(string vmi_id)
        {
            foreach (DataRow dr in t_shape.Table.Rows)
            {
                //"vmi_id", "shape_id", "shape_txt"
                shape.Table.Rows.Add(vmi_id, dr["shape_id"], dr["shape"]);
            }

            t_shape.Table.Rows.Clear();
            shape_temp_bind();
        }

        private void shape_temp_bind()
        {
            DataList_Bind(stemp_list, t_shape.Table);
        }

        private void add_All(string uid)
        {
            //lbase.Table.Rows.Add("head_id", "inspect_id", "inspect", "insp_count", "samp_count", "standard_id", "standard", "bith_date", "b_operator", "seq", "base_id"
            lbase.Table.Rows.Add(head_id.Value, _inspect, ddl_inspect.SelectedItem.Text, _insp_count, _samp_count, _sp_stand, ddl_sp_stand.SelectedItem.Text, _birthDt, _b_opeartor, 0, uid);
            All_Bind();

        }

        //protected void add_Main() {

        //  //  thead.Table.Rows.Add(_head_id, ddl_kind.Text, txt_operator.Text, ddl_product.Text, ddl_program.Text ,ddl_result.Text );

        //}

        private void Vmi_Bind()
        {
            GridView_Bind(vmi_list, t_vmi.Table);
        }

        private void All_Bind()
        {
            GridView_Bind(all_list, lbase.Table);

            up_list.Update();
        }



        private void ft_show()
        {
            up_ft.Visible = true;

            ddl_join_parent(ddl_test, _program, false);
        }

        #endregion input 

        #region all_list

        protected void all_list_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;
                //"lbase", "head_guid", "inspect_id", "inspect", "insp_count", "samp_count", "standard_id", "standard", "bith_date", "b_operator"
                e.Row.Cells[2].Text = drv["inspect"].ToString();
                e.Row.Cells[3].Text = drv["insp_count"].ToString();
                e.Row.Cells[4].Text = drv["standard"].ToString();
                e.Row.Cells[5].Text = drv["samp_count"].ToString();
                e.Row.Cells[6].Text = drv["bith_date"].ToString();
                e.Row.Cells[7].Text = drv["b_operator"].ToString();
                e.Row.Cells[8].Controls.Add(getView(drv["base_id"].ToString()));//view 該筆vmi的資料; 
                _all_row++;
            }
        }

        protected void all_list_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "del_row")
            {
                string base_id = e.CommandArgument.ToString();

                //vmi del;
                vmi.Row_Del(" base_id='" + base_id + "' ");
                lbase.Row_Del(" base_id='" + base_id + "' ");

                All_Bind();

            }
        }

        #endregion all_list
        private Table getView(string baseid)
        {
            //"vmi", "head_id", "vmi_id", "position", "position_id", "qty", "judg", "judg_id"
            DataRow[] list = vmi.Table.Select(" base_id='" + baseid + "' ");

            StringBuilder sb = new StringBuilder();

            Table tb = new Table();
            tb.Attributes.Add("border", "1");
            tb.Style.Add("margin", "2px");
            tb.Style.Add("border", "1px solid #8a988e;");
            tb.Style.Add("color", "#C87E20");
            tb.Style.Add("width", "99%");
            tb.Style.Add("height", "40px");

            int i = 0;
            foreach (DataRow row in list)
            {
                TableRow tr = new TableRow();
                //tr.BorderColor = Utility.HexColor("#126e82"); //TETSUKON 
                //tr.ForeColor = Utility.HexColor("#211E55"); //TETSUKON 
                tr.ForeColor = Utility.HexColor("#815c94");
                if (i % 2 != 0)
                {

                    //view style
                    //tr.BackColor = Utility.HexColor("#FFF6EC");
                    tr.ForeColor = Utility.HexColor("#1661ab");

                    if (_all_row % 2 != 0)
                    {
                        //#F1ECED
                        //tr.ForeColor = Utility.HexColor("#815c94");
                    }

                    //tr.ForeColor = System.Drawing.Color.Rosybrown;
                    //tr.ForeColor = System.Drawing.Color.RosyBrown;
                }


                TableCell cell01 = DefultTc(80);
                cell01.Text = row["position"].ToString();
                tr.Cells.Add(cell01);


                TableCell cell02 = DefultTc(80);
                cell02.Controls.Add(getShapeRegion(row["vmi_id"].ToString()));
                tr.Cells.Add(cell02);

                TableCell cell03 = DefultTc(60);

                cell03.Text = row["qty"].ToString();
                tr.Cells.Add(cell03);

                TableCell cell04 = DefultTc(80);

                cell04.Text = row["judg"].ToString();
                tr.Cells.Add(cell04);
                tb.Rows.Add(tr);
                i++;
            }
            return tb;

        }

        private TableCell DefultTc(int width)
        {
            TableCell cell01 = new TableCell(); //Position 
            cell01.Width = width;
            cell01.BorderWidth = 1;
            cell01.BorderColor = Utility.HexColor("#5d3d21");
            cell01.Style.Add("padding", "2px");

            return cell01;

        }
        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            if (Confirm())
            {
                Save_Head();
                Save_Base();
                Save_VMI();

                //Save_Feature();

            }
        }

        private void Save_Feature()
        {
            throw new NotImplementedException();
        }

        private void Save_VMI()
        {
            foreach (DataRow row in vmi.Table.Rows)
            {
                Leica_VMI v = new Leica_VMI(row);
                v.Insert();

                string sql = string.Format("vmi_id='{0}'", v.Rowid);

                DataRow[] sRow = shape.Table.Select(sql);
                Leica_VMI_Shape ls = new Leica_VMI_Shape(sRow[0]);
                ls.Insert();
            }
        }

        private void Save_Base()
        {
            int i = 1;

            // Leica_Base.Delete(main_id);
            foreach (DataRow row in lbase.Table.Rows)
            {

                Leica_Base lb = new Leica_Base(row);
                lb.Head_ID = _head_id;
                lb.Seq = i.ToString();
                lb.Insert();
                i++;
            }
        }

        private void Save_Head()
        {
            EIPSysSha SysNum = new EIPSysSha();

            Leica_Head Head = new Leica_Head();

            Head.Create_User = CurrentUser.LogonID;
            Head.H_Operator = _h_operator;
            Head.Inspect = _inspect;
            Head.Insp_No = SysNum.GetNewSn("Q608", DateTime.Now.ToString("yyMM"));
            Head.Kind = _kind;
            Head.Product = _product;
            Head.Program = _program;
            Head.Result = _result;
            Head.ROWID = _head_id;
            Head.Status = Convert.ToInt16(status.Waite).ToString();
            Head.Insert();
        }

        private bool Confirm()
        {
            bool ispass = true;
            string item = "";

            List<string> Mlist = new List<string>();

            if (string.IsNullOrEmpty(_kind))
            {
                Mlist.Add(getStr("type"));
            }

            if (string.IsNullOrEmpty(_program))
            {
                Mlist.Add("program");
            }

            if (string.IsNullOrEmpty(_result))
            {
                Mlist.Add("result");
            }

            if (Mlist.Count > 0)
            {
                item = string.Join(",", Mlist.ToArray());
                msg.Value = string.Format(@"{0}{1}\r\n", item, getStr("not_null"));
            }

            if (all_list.Rows.Count == 0)
            {
                item += getStr("all_empty");
                ispass = false;
                msg.Value += string.Format(@"{0}{1}\r\n", item, getStr("not_null"));
            }

            return ispass;
        }

        protected void Btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("LeicaAdd.aspx");
        }

        private string isNUll(string str)
        {
            string result = null;
            if (string.IsNullOrEmpty(str))
            {
                result = str;
            }

            return result;
        }


        protected void lbtn_ft_add_Click(object sender, EventArgs e)
        {
            //  "base_id", "ft_id", "prod_index", "insp_time"

            string sql = string.Format(" prod_index='{0}' and insp_time='{1}' ", _prod_index, _insp_time);
            DataRow[] ds = t_ft.Table.Select(sql);
            string rowid = Guid.NewGuid().ToString();

            //不重覆者才可以新增
            if (ds.Length == 0)
            {
                s5_list_init();
                t_ft.Table.Rows.Add(_base_id, rowid, _prod_index, _insp_time);

                foreach (DataRow r in t_S5.Table.Rows)
                {
                    r[0] = rowid;
                    ft_S5.Table.ImportRow(r);
                }

                Ft_Bind();

                t_S5.Table.Clear();
                S5_Bind();

                txt_prod_index.Text = "";
                txt_insp_time.Text = "";

            }
            else
            {

                msg.Value = "資料重覆";
            }
        }

        private void Ft_Bind()
        {
            GridView_Bind(ft_list, ft_S5.Table);
            up_ft.Update();

        }

        private void S5_Bind()
        {
            GridView_Bind(s5_list, t_S5.Table);
            up_s5.Update();
        }

        //protected void ft_list_RowDataBound2(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        int iRowspan = 0;
        //        DataRowView drv = (DataRowView)e.Row.DataItem;

        //        string ft_id = drv["ft_id"].ToString();

        //        DataRow[] s5 = t_S5.Table.Select(string.Format(" ft_id='{0}' ", ft_id));
        //        iRowspan = s5.Length;


        //        //base_id
        //        e.Row.Cells[0].Text = drv["base_id"].ToString();
        //        e.Row.Cells[0].RowSpan = iRowspan;

        //        //ft_id
        //        e.Row.Cells[1].Text = drv["ft_id"].ToString();
        //        e.Row.Cells[1].RowSpan = iRowspan;

        //        //item
        //        // e.Row.Cells[2].Text = drv["prod_index"].ToString();
        //        e.Row.Cells[2].RowSpan = iRowspan;

        //        //prod_index
        //        e.Row.Cells[3].Text = drv["prod_index"].ToString();
        //        e.Row.Cells[3].RowSpan = iRowspan;

        //        //insp_time
        //        e.Row.Cells[4].Text = drv["insp_time"].ToString();
        //        e.Row.Cells[4].RowSpan = iRowspan;


        //        foreach (DataRow r in s5)
        //        {

        //            //"t_S5", "ft_id", "test", "ts_standard", "ft_qty", "ft_jdug", "s1", "s2", "s3", "s4", "s5"
        //            e.Row.Cells[5].Text = r["test"].ToString();


        //            //Qty
        //            e.Row.Cells[6].Text = r["ft_qty"].ToString();


        //            //jdug
        //            e.Row.Cells[7].Text = r["ft_jdug"].ToString();


        //            //s1
        //            e.Row.Cells[8].Text = r["s1"].ToString();


        //            //s2
        //            e.Row.Cells[9].Text = r["s2"].ToString();


        //            //s3
        //            e.Row.Cells[10].Text = r["s3"].ToString();


        //            //s4
        //            e.Row.Cells[11].Text = r["s4"].ToString();


        //            //s5
        //            e.Row.Cells[12].Text = r["s5"].ToString();


        //            //del
        //            //e.Row.Cells[13].Text = "";

        //        }

        //        //copy
        //        //e.Row.Cells[14].Text = "";
        //        e.Row.Cells[14].RowSpan = iRowspan;
        //    }
        //}

        string curr_ft_id = "";
        int iRowspan = 1; //合併列數
        int item = 1;
        System.Drawing.Color bg_Color, ft_Color;

        /// <summary>
        /// 因為資料有做分群，所以字色來區分資料項次，以行色來分別列數
        /// 字色由資料算出
        /// 行色由系統設定，設定在aspx上，item,prod_index,insp_time,Edit,Copy,Del皆設為白色
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ft_list_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;

                string ft_id = drv["ft_id"].ToString();

                //-------------------test-----------------------------------------

                if (curr_ft_id == "" || (ft_id != curr_ft_id && !string.IsNullOrEmpty(ft_id)))
                {
                    e.Row.Height = 35;

                    //新資料

                    DataRow[] ft = t_ft.Table.Select(string.Format(" ft_id='{0}' ", ft_id));

                    curr_ft_id = ft_id;
                    iRowspan = 1;

                    //e.Row.Cells[0].Text = ft[0]["base_id"].ToString();

                    if (ft.Length> 0)
                    {

                    
                    //ft_id
                    e.Row.Cells[0].Text = ft[0]["ft_id"].ToString();


                    //item
                    e.Row.Cells[1].Text = Convert.ToString(item); //item

                    ft_Color = e.Row.ForeColor;

                    if ((item % 2) == 0) //背景色
                    {
                        e.Row.ForeColor = Utility.HexColor("#DDA52D");
                        ft_Color = e.Row.ForeColor;

                    }



                    //prod_index
                    e.Row.Cells[2].Text = ft[0]["prod_index"].ToString();


                    //insp_time
                    e.Row.Cells[3].Text = ft[0]["insp_time"].ToString();

                    DataRow[] s5 = ft_S5.Table.Select(string.Format(" ft_id='{0}' ", ft_id)); ;//計算合併的列數

                    iRowspan = s5.Length > 0 ? s5.Length : 1; //合併的列數

                    LinkButton lbtn_del = new LinkButton();
                    lbtn_del.CommandName = "del_comm";
                    lbtn_del.CommandArgument = ft_id;
                    lbtn_del.CssClass = "far fa-trash-alt ft_del";


                    //lbtn_del.Style.Value = "color:#eea08c;";


                    LinkButton lbtn_copy = new LinkButton();
                    lbtn_copy.CommandName = "copy_comm";
                    lbtn_copy.CommandArgument = ft_id;
                    lbtn_copy.CssClass = "far fa-copy ft_copy"; //<i class="far fa-copy"></i>
                    lbtn_copy.OnClientClick = "return ft_edit_check()";

                    LinkButton lbtn_edit = new LinkButton();
                    lbtn_edit.CommandName = "edit_comm";
                    lbtn_edit.CommandArgument = ft_id;
                    lbtn_edit.CssClass = "fas fa-wrench ft_edit"; //<i class="far fa-copy"></i>
                    lbtn_edit.OnClientClick =string.Format("return ft_update('{0}','{1}')", ft[0]["prod_index"].ToString(), ft[0]["insp_time"].ToString()); //將要修改的資料傳回javascript 因為在UpdatePanel之外


                        e.Row.Cells[12].Controls.Add(lbtn_edit);
                    e.Row.Cells[13].Controls.Add(lbtn_copy);
                    e.Row.Cells[14].Controls.Add(lbtn_del);

                    e.Row.Cells[12].RowSpan = iRowspan;
                    e.Row.Cells[13].RowSpan = iRowspan;
                    e.Row.Cells[14].RowSpan = iRowspan;

                    e.Row.Cells[0].RowSpan = iRowspan;
                    e.Row.Cells[1].RowSpan = iRowspan;
                    e.Row.Cells[2].RowSpan = iRowspan;
                    e.Row.Cells[3].RowSpan = iRowspan;


                    item++;//項次
                    }
                }
                else
                { //合併資料 將欄位隱藏
                    e.Row.Cells[12].Visible = false;
                    e.Row.Cells[13].Visible = false;
                    e.Row.Cells[14].Visible = false;

                    e.Row.Cells[0].Visible = false;
                    e.Row.Cells[1].Visible = false;
                    e.Row.Cells[2].Visible = false;
                    e.Row.Cells[3].Visible = false;


                    int index = e.Row.RowIndex;
                    e.Row.ForeColor = ft_Color;
                }

                //"t_S5", "ft_id", "test", "ts_standard", "ft_qty", "ft_jdug", "s1", "s2", "s3", "s4", "s5"

                e.Row.Cells[4].Text = drv["ts_standard"].ToString();


                //Qty
                e.Row.Cells[5].Text = drv["ft_qty"].ToString();


                //jdug
                e.Row.Cells[6].Text = drv["ft_jdug"].ToString();


                //s1
                e.Row.Cells[7].Text = drv["s1"].ToString();


                //s2
                e.Row.Cells[8].Text = drv["s2"].ToString();


                //s3
                e.Row.Cells[9].Text = drv["s3"].ToString();


                //s4
                e.Row.Cells[10].Text = drv["s4"].ToString();


                //s5
                e.Row.Cells[11].Text = drv["s5"].ToString();

            }
        }


        protected void ft_list_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string ft_id = e.CommandArgument.ToString();
            if (e.CommandName == "del_comm")
            {

                string del_cmd = string.Format(" ft_id='{0}' ", ft_id);
                ft_S5.Row_Del(del_cmd);
                t_ft.Row_Del(del_cmd);
                Ft_Bind();
            }

            if (e.CommandName == "copy_comm")
            {

                Set_S5_Update(ft_id, "COPY");
            }

            if (e.CommandName == "edit_comm")
            {


                Set_S5_Update(ft_id, "EDIT");

                //因為修改 所以不需要再存在
                string del_cmd = string.Format(" ft_id='{0}' ", ft_id);
                t_ft.Row_Del(del_cmd);
                Ft_Bind();
            }

        }

        private void Set_S5_Update(string ft_id, string action)
        {
            string get_cmd = string.Format(" ft_id='{0}' ", ft_id);
            DataRow[] s5 = ft_S5.Table.Select(get_cmd);

            string o_grid = "";
            foreach (DataRow r in s5)
            {
                //t_S5 = new data_table("t_S5", "ft_id", "test", "test_id", "ts_standard", "ts_standard_id", "ft_qty", "ft_jdug" ,"ft_jdug_id", "s1", "s2", "s3", "s4", "s5");
                o_grid = r[0].ToString();//將舊的資料存起 
                r[0] = Guid.NewGuid().ToString();//刷新
                t_S5.Table.ImportRow(r);//存回Temp檔
                if (action == "EDIT") { r.Delete(); }

                r[0] = o_grid;//回存;因為在copy的時候，僅僅只是復制一份到t_S5 但因為//刷新 guid會影響ft_S5 再存回
            }

            if (action != "COPY")
            {
                DataRow[] ft = t_ft.Table.Select(get_cmd); //只會有一筆

                txt_prod_index.Text = ft[0]["prod_index"].ToString();
                txt_insp_time.Text = ft[0]["insp_time"].ToString();
                 
            }

            S5_Bind();
        }

        protected void lbtn_S5_add_Click(object sender, EventArgs e)
        {
            t_S5.Table.Rows.Add(Guid.NewGuid().ToString(), ddl_test.SelectedItem.Text, _test, ddl_ts_standard.SelectedItem.Text, _ts_standard, _ft_qty, ddl_ft_judg.SelectedItem.Text, _ft_jdug, _s1, _s2, _s3, _s4, _s5);
            S5_Bind();
        }

        protected void s5_list_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ft_id = s5_list.DataKeys[e.RowIndex].Value.ToString();

            t_S5.Row_Del(string.Format(" ft_id='{0}' ", ft_id));
            S5_Bind();
        }
    }
}