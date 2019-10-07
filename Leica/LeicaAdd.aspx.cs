using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Leica
{

    public partial class LeicaAdd : LeicaBase
    {
        int _all_row = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                msg.Value = "";
                Create_Table();

                //---------------------------------

                if (!IsPostBack)
                {
                    ddl_setting();
                    InitUI();
                    OutTable();
                    _head_id = Guid.NewGuid().ToString();

                }
                else
                {

                    GetTable();
                    _h_operator = txt_operator.Text;
                    _insp_date = txt_inspDt.Text;
                    
                    
                    _result = ddl_result.SelectedValue;
                    _custmer = ddl_custmer.SelectedValue;

                    _inspect = ddl_inspect.SelectedValue;
                    _samp_count = txt_samp_count.Text;
                    _sp_stand = ddl_sp_stand.SelectedValue;
                    _insp_count = txt_insp_count.Text;
                    _birthDt = txt_birthDt.Text;
                    _b_opeartor = txt_b_opeartor.Text;

                    
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
                    _vmi_time = txt_vmi_time.Text;

                    //暫時不使用，
                    _kind = ddl_kind.SelectedValue;
                    _product = ddl_product.SelectedValue;
                    _program = ddl_program.SelectedValue;
                    _test = ddl_test.SelectedValue;
                    _ts_standard = ddl_ts_standard.SelectedValue;
                }


                head_id.Value = _head_id;
                base_id.Value = _base_id;
                ft_rowid.Value = _ft_rowid;

                txt_inspDt.Text = _insp_date;
                ddl_kind.SelectedValue = _kind;
                ddl_product.SelectedValue = _product;
                ddl_program.SelectedValue = _program;
                ddl_result.SelectedValue = _result;
                ddl_custmer.SelectedValue = _custmer;

                ddl_inspect.SelectedValue = _inspect;
                txt_samp_count.Text = _samp_count;
                txt_insp_count.Text = _insp_count;
                ddl_sp_stand.SelectedValue = _sp_stand;

                txt_birthDt.Text = _birthDt;
                txt_b_opeartor.Text = _b_opeartor;

                ddl_test.SelectedValue = _test;
                ddl_ts_standard.SelectedValue = _ts_standard;

                Vmi_Bind(); 
                Ft_Bind();
                S5_Bind();
                All_Bind(); //最後
            }
            catch (Exception ex)
            {
                throw ex;
            }

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
            OperatorCustmer(ddl_custmer, false);

            Join_Product(ddl_product);
            Join_Program(ddl_program);

            Join_Test(ddl_test);
            Join_TsSeand(ddl_ts_standard);
        }

        private void InitUI()
        {
            //up_vmi.Visible = false;
            //up_ft.Visible = false;  

            _insp_date = DateTime.Now.ToShortDateString();
            txt_operator.Text = CurrentUser.LogonID;
            _insp_count = "0";
            _samp_count = "0";

            btn_file.Text = getStr("file_upload");
            Btn_Back.Text = getStr("back");
            Btn_Cancel.Text = getStr("cancel");
            Btn_Save.Text = getStr("save"); 
        }

        #region event

        protected void lbtn_base_add_Click(object sender, EventArgs e)
        {
            //add_Main();

            if (vmi_list.Rows.Count > 0)
            {
                string get = string.Format(" base_id='{0}' ", _base_id);
                DataRow[] bases = lbase.Table.Select(get);

                add_vmi(_base_id);
                add_All(_base_id);

                ScriptManager.RegisterStartupScript(Page, GetType(), "click", "clear_all();", true);

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
                string del = string.Format("shape ='{0}' ", id);
                t_shape.Row_Del(del);
            }

            shape_temp_bind();
        }

        protected void lbtn_vmi_add_Click(object sender, EventArgs e)
        {

            string vmi_id = Guid.NewGuid().ToString();
            //                  ( "base_id", "vmi_id", "position", "position_id", "qty", "judg", "judg_id","vmi_time");

            t_vmi.Table.Rows.Add("", vmi_id, _position == "" ? "" : ddl_position.SelectedValue, _position, _vmi_qty, _vmi_judg == "" ? "": ddl_vmi_judg.SelectedItem.Text, _vmi_judg,txt_vmi_time.Text);
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

            
                VMI_List_Head(e);
            
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
                lab_sp.ID = dr["shape"].ToString();
                lab_sp.Text = dr["shape_txt"].ToString();

                LinkButton lbtn_sp_del = new LinkButton();
                lbtn_sp_del.Attributes.Add("title", "del");
                lbtn_sp_del.ID = string.Format("lbtn_sp_del_{0}", i);
                lbtn_sp_del.CommandArgument = dr["shape"].ToString();
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

                txt += "<p>" + dr["shape_txt"].ToString() + "</p>";
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

            string del = string.Format(" vmi_id='{0}' and shape='{1}' ", guid, shape_id);
            shape.Row_Del(del);
            Vmi_Bind();
        }

        protected void vmi_list_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string guid = vmi_list.DataKeys[e.RowIndex].Value.ToString();

            shape.Row_Del(string.Format(" shape='{0}' ", guid));
            t_vmi.Row_Del(string.Format(" vmi_id='{0}' ", guid));
            Vmi_Bind();
        }

        #endregion event

        #region function 

        private void shape_traffic(string vmi_id)
        {
            foreach (DataRow dr in t_shape.Table.Rows)
            {
                //"vmi_id", "shape", "shape_txt"
                shape.Table.Rows.Add(vmi_id, dr["shape_txt"], dr["shape"]);
            }

            t_shape.Table.Rows.Clear();
            shape_temp_bind();
        }

        private void shape_temp_bind()
        {
            DataList_Bind(stemp_list, t_shape.Table);
            up_stemp.Update();
        }

        private void add_All(string uid)
        {
            //lbase.Table.Rows.Add("head_id", "inspect_id", "inspect", "insp_count", "samp_count", "standard_id", "standard", "bith_date", "b_operator", "seq", "base_id"
            string sql = string.Format(" base_id ='{0}' ", uid);
            DataRow[] r = lbase.Table.Select(sql); //有資料者，不新增

            if (r.Length == 0)
            {
                lbase.Table.Rows.Add(head_id.Value, _inspect, ddl_inspect.SelectedItem.Text, _insp_count, _samp_count, _sp_stand, ddl_sp_stand.SelectedItem.Text, _birthDt, _b_opeartor, 0, uid, DateTime.Now.ToString());
            }
            All_Bind();

        }

        //protected void add_Main() {

        //  //  thead.Table.Rows.Add(_head_id, ddl_kind.Text, txt_operator.Text, ddl_product.Text, ddl_program.Text ,ddl_result.Text );

        //}

        private void Vmi_Bind()
        {
            GridView_Bind(vmi_list, t_vmi.Table);
            up_vmi.Update();
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
            ddl_ft_judg.SelectedValue = "";
            txt_ft_qty.Text = "0";
            txt_s1.Text = "";
            txt_s2.Text = "";
            txt_s3.Text = "";
            txt_s4.Text = "";
            txt_s5.Text = "";
        }

        #endregion input 

        #region all_list
        

        protected void all_list_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {

                e.Row.Cells[0].Style.Add("display", "none");

                e.Row.Cells[1].Style.Add("display", "none");
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;
                string base_id = drv["base_id"].ToString();
                e.Row.Attributes.Add("id", base_id);



                e.Row.Cells[0].Text = base_id;
                e.Row.Cells[0].Style.Add("display", "none");


                e.Row.Cells[1].Text = drv["inspect_id"].ToString();
                e.Row.Cells[1].Style.Add("display", "none");
                e.Row.Cells[1].Attributes.Add("id", base_id + "_inspect_id");
                //"lbase", "head_guid", "inspect_id", "inspect", "insp_count", "samp_count", "standard_id", "standard", "bith_date", "b_operator"
                e.Row.Cells[2].Text = Convert.ToString(e.Row.DataItemIndex + 1);


                e.Row.Cells[3].Text = drv["inspect"].ToString();
                e.Row.Cells[3].Attributes.Add("id", base_id + "_insp");

                e.Row.Cells[4].Text = drv["insp_count"].ToString();
                //e.Row.Cells[4].CssClass = base_id+"_insp_count";
                e.Row.Cells[4].Attributes.Add("id", base_id + "_insp_count");

                e.Row.Cells[5].Text = drv["standard"].ToString();
                //e.Row.Cells[5].CssClass = base_id+"_standard";
                e.Row.Cells[5].Attributes.Add("id", base_id + "_standard");

                e.Row.Cells[6].Text = drv["samp_count"].ToString();
                //e.Row.Cells[6].CssClass = base_id+"_samp_count";
                e.Row.Cells[6].Attributes.Add("id", base_id + "_samp_count");

                e.Row.Cells[7].Text = drv["bith_date"].ToString();
                //e.Row.Cells[7].CssClass = base_id+"_bith_date";
                e.Row.Cells[7].Attributes.Add("id", base_id + "_bith_date");

                e.Row.Cells[8].Text = drv["b_operator"].ToString();
                //e.Row.Cells[8].CssClass = base_id+"_b_operator";
                e.Row.Cells[8].Attributes.Add("id", base_id + "_b_operator");

                e.Row.Cells[9].Controls.Add(getView(base_id));//view 該筆vmi的資料; 
                e.Row.Cells[9].Style.Value = "text-align: center";  //text-align: center;

                //< asp:LinkButton ID = "lbtn_All_Update" runat = "server" CommandName = "Update_All" title = "Update" CommandArgument = "<%# ((GridViewRow) Container).RowIndex %>" class="fas fa-wrench ft_edit" OnClientClick="return upload_base()" ></asp:LinkButton>
                LinkButton lbtn_All_Update = new LinkButton();

                int Row_Index = e.Row.DataItemIndex;//從tr開始算
                lbtn_All_Update.CommandName = "Update_All";
                lbtn_All_Update.CommandArgument = Convert.ToString(Row_Index);
                lbtn_All_Update.CssClass = "fas fa-wrench ft_edit";


                lbtn_All_Update.OnClientClick = "return upload_base('" + base_id + "','" + Guid.NewGuid().ToString() + "' )";

                e.Row.Cells[10].Controls.Add(lbtn_All_Update);
                _all_row++;
            }
        }

        protected void all_list_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = int.Parse(e.CommandArgument.ToString());
            GridViewRow gvr = all_list.Rows[index];

            string insepect = gvr.Cells[1].Text; //head_id
            string base_id = gvr.Cells[0].Text;

            if (e.CommandName == "Del_All")
            {
                Del_All(insepect, base_id);
            }

            if (e.CommandName == "Update_All")
            {

                if (insepect == "VMI")
                {

                    Copy_To_Vmi(base_id);
                    Del_All(insepect, base_id);

                    up_vmi.Update();
                }
                else
                {
                    Copy_To_ft(base_id);
                    ft_show();
                    up_ft.Update();

                }


            }
        }
        #endregion
        private void Copy_To_ft(string guid)
        {
            string get_ft = string.Format(" base_id='{0}' ", guid);
            DataRow[] all_ft = ft.Table.Select(get_ft);

            foreach (DataRow r in all_ft)
            {
                string ft_id = r["ft_id"].ToString();
                string get_s5 = string.Format(" ft_id='{0}' ", ft_id);

                DataRow[] s5_row = S5.Table.Select(get_s5);
                if (s5_row.Length > 0) //要有S5才可以新增ft
                {
                    foreach (DataRow s in s5_row)
                    {
                        ft_S5.Table.ImportRow(s);
                    }

                    S5.Row_Del(get_s5);
                    r["base_id"] = base_id.Value; //新資料的base_id

                    t_ft.Table.ImportRow(r);

                    r["base_id"] = guid;//回恢原資料;
                }
            }
            ft.Row_Del(get_ft);
            Ft_Bind();

            lbase.Row_Del(" base_id='" + guid + "' ");
            All_Bind();

        }

        //用jquery填寫
        //private void Copy_To_Base(string base_id)
        //{
        //    // "head_id", "inspect_id", "inspect", "insp_count", "samp_count", "standard_id", "standard", "bith_date", "b_operator", "seq", "base_id"
        //    DataRow[] bRows = lbase.Table.Select(string.Format(" base_id ='{0}' ", base_id)); //只會一筆

        //    foreach (DataRow r in bRows)
        //    {
        //        ddl_inspect.SelectedValue = r["inspect_id"].ToString();
        //        txt_insp_count.Text = r["insp_count"].ToString();
        //        ddl_sp_stand.SelectedValue = r["standard_id"].ToString();
        //        txt_samp_count.Text = r["samp_count"].ToString();
        //        txt_birthDt.Text = r["bith_date"].ToString();
        //        txt_b_opeartor.Text = r["b_operator"].ToString();

        //    }
        //    //  up_base.Update();
        //}

        private void Copy_To_Vmi(string base_id)
        {
            DataRow[] vmi_row = vmi.Table.Select(string.Format(" base_id='{0}' ", base_id));

            foreach (DataRow r in vmi_row)
            {
                t_vmi.Table.ImportRow(r);
            }

            Vmi_Bind();
            up_vmi.Update();
        }

        private void Del_All(string insepect, string base_id)
        {
            if (insepect == "VMI")
            {
                vmi.Row_Del(" base_id='" + base_id + "' ");
            }
            else
            {
                DataRow[] rs = ft.Table.Select(" base_id='" + base_id + "' ");


                foreach (DataRow r in rs)
                {
                    string ft_id = r["ft_id"].ToString();
                    S5.Row_Del("ft_id ='{" + ft_id + "}' ");
                }

                ft.Row_Del(" base_id='" + base_id + "' ");

            }
            //vmi del;

            lbase.Row_Del(" base_id='" + base_id + "' ");

            All_Bind();
        }

      
        //private TableRow getS5(string ft_id)
        //{
        //    TableRow tr_s5=
        //    DataRow[] R_s5 = ft_S5.Table.Select(" ft_id='" + ft_id + "' "); //不重覆    

        //    //ft_S5 = new data_table("ft_S5", "ft_id", "test", "test_id", "ts_standard", "ts_standard_id", "ft_qty", "ft_jdug", "ft_jdug_id", "s1", "s2", "s3", "s4", "s5");
        //    foreach (DataRow s in R_s5)
        //    {
        //        TableRow tr_s5 = new TableRow();

        //        TableCell td_ts_st = DefultTc(80);
        //        td_ts_st.Text = s["test"].ToString();
        //        tr_s5.Cells.Add(td_ts_st);

        //        TableCell td_qty = DefultTc(80);
        //        td_qty.Text = s["ft_qty"].ToString();
        //        tr_s5.Cells.Add(td_qty);

        //        TableCell td_jdug = DefultTc(80);
        //        td_jdug.Text = s["ft_jdug"].ToString();
        //        tr_s5.Cells.Add(td_jdug);

        //        TableCell td_s1 = DefultTc(80);
        //        td_s1.Text = s["s1"].ToString();
        //        tr_s5.Cells.Add(td_s1);

        //        TableCell td_s2 = DefultTc(80);
        //        td_s1.Text = s["s2"].ToString();
        //        tr_s5.Cells.Add(td_s2);

        //        TableCell td_s3 = DefultTc(80);
        //        td_s1.Text = s["s3"].ToString();
        //        tr_s5.Cells.Add(td_s3);

        //        TableCell td_s4 = DefultTc(80);
        //        td_s1.Text = s["s4"].ToString();
        //        tr_s5.Cells.Add(td_s4);

        //        TableCell td_s5 = DefultTc(80);
        //        td_s1.Text = s["s5"].ToString();
        //        tr_s5.Cells.Add(td_s5);

        //       // tb_f.Rows.Add(tr_s5);

        //    }

        //    return s5;
        //}





        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (Confirm())
                {
                    Save_Head();
                    Save_Base();
                    Save_VMI();

                    Save_Feature();


                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            string url = string.Format("LeicaEdit.aspx?rowid={0}", _head_id);
            Response.Redirect(url);

        }

        private void Save_Head()
        {

            EIPSysSha SysNum = new EIPSysSha();

            Leica_Head Head = new Leica_Head();

            Head.Create_User = CurrentUser.LogonID;
            Head.H_Operator = _h_operator;
            Head.Insp_Dt = _insp_date;
            Head.Insp_No = SysNum.GetNewSn("Q608", DateTime.Now.ToString("yyMM"));
            Head.Kind = _kind;
            Head.Product = ConvertToOption(_product);
            Head.Program = ConvertToOption(_program);
            Head.Result = _result;
            Head.ROWID = _head_id;
            Head.Status = Convert.ToInt16(status.Waite).ToString();
            Head.Custmer = _custmer;
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

                msg.Value = getStr("duplicate");
            }
        }

        private void Ft_Bind()
        {
            GridView_Bind(ft_list, ft_S5.Table);
            up_ft.Update();

        }

        private void upload_Bind()
        {
            File_list(file_list);
            up_file.Update();

        }


        private void S5_Bind()
        {
            GridView_Bind(s5_list, t_S5.Table);
            up_s5.Update();
        }


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

                    if (ft.Length > 0)
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
                        lbtn_edit.OnClientClick = string.Format("return ft_update('{0}','{1}')", ft[0]["prod_index"].ToString(), ft[0]["insp_time"].ToString()); //將要修改的資料傳回javascript 因為在UpdatePanel之外


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

            s5_Head(e);
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
                curr_ft_id = "";//因為要更新ft_list 
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

        protected void s5_list_RoDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ft_id = s5_list.DataKeys[e.RowIndex].Value.ToString();

            t_S5.Row_Del(string.Format(" ft_id='{0}' ", ft_id));
            S5_Bind();
        }

        /// <summary>
        /// 新增資料至 All List
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtn_add_all_Click(object sender, EventArgs e)
        {
            //GridView_Bind(all_list, lbase.Table);
            if (ft_list.Rows.Count > 0)
            {
                S5.Table.Merge(ft_S5.Table);
                ft.Table.Merge(t_ft.Table);
                add_All(_base_id);

                ft_S5.Table.Clear();
                t_ft.Table.Clear();
                Ft_Bind();
                ScriptManager.RegisterStartupScript(Page, GetType(), "click", "clear_all()", true);

            }
        }


        protected void btn_file_Click(object sender, EventArgs e)
        {

            if (fileU.HasFile != false)
            {
                //3.上傳FTP
                string filename = fileU.FileName;

                // 限制檔案大小，限制為 2MB
                int filesize = fileU.PostedFile.ContentLength / 1024;
                if (filesize > 15360)
                {
                    msg.Value = getStr("file_large");

                }
                else
                {

                    if (filename.Length > 200)
                    {
                        msg.Value = getStr("file_name_long");
                    }
                    else
                    {
                        msg.Value = File_upload(fileU);
                        upload_Bind();
                    }


                }

            }
        }
 

        protected void f_list_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            Upload_Del(e.CommandArgument.ToString());
            upload_Bind();
        } 
        protected void lab_file_Command(object sender, CommandEventArgs e)
        {
            upload_download(e.CommandArgument.ToString());
        }

        protected void file_list_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
             e.Item.ItemType == ListItemType.AlternatingItem)
            {

                // Retrieve the Label control in the current DataListItem.
                LinkButton lbtn = (LinkButton)e.Item.FindControl("lbtn_file");
                DataRowView DRV = (DataRowView)e.Item.DataItem;

                lbtn.Text = DRV.Row["file_name"].ToString();
                //lbtn.OnClientClick = "return Download('" + DRV.Row["rowid"].ToString()+ "')";

                string paramster = string.Format("rowid={0} and head_id={1}", "'" + DRV.Row["rowid"].ToString() + "'", "'" + _head_id + "'");

                string Url = string.Format("{0}/comm/download_handler.ashx?table={1}&col_filename={2}&col_type={3}&col_content={4}&paramenter={5}", Utility.LocalUrl, "eipe.dbo.leica_file", "file_name", "kind", "arguments", paramster);
                lbtn.Attributes.Add("href", Url); 
            } 
        }

      

   

        protected void s5_list_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ft_id = s5_list.DataKeys[e.RowIndex].Value.ToString();

            t_S5.Row_Del(string.Format(" ft_id='{0}' ", ft_id));
            S5_Bind();
        }


        protected void s5_list_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            s5_Head(e);
        }
    }
}
