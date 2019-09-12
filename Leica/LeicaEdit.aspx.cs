using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Leica
{

    public partial class LeicaEdit : LeicaBase
    {
        MABase.Flow f = new Flow();
        int _all_row = 0;
        public StringBuilder all_sb = new StringBuilder();
        string Title = "Leica IPQC生產資訊系統";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
              

                all_sb = new StringBuilder(); //by test dubug

                msg.Value = "";
                Create_Table();
                _head_id = Request.QueryString["rowid"];
                //---------------------------------
                ddl_setting();
                setTag();
                if (!IsPostBack)
                {
                    InitUI();
                    OutTable();
                    DB_Load();

                    txt_supervisor.Text = "carol.yeh"; //"eileen.wang";
                    txt_manager.Text = "carol.yeh";//"elliot.chang";
                }
                else
                {

                    GetTable();
                    _h_operator = txt_operator.Text;
                    _insp_date = txt_inspDt.Text;
                    _kind = ddl_kind.SelectedValue;
                    _product = ddl_product.SelectedValue;
                    _program = ddl_program.SelectedValue;
                    _result = ddl_result.SelectedValue;
                    _custmer = ddl_custmer.SelectedValue;

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


                head_id.Value = _head_id;
                base_id.Value = _base_id;
                ft_rowid.Value = _ft_rowid;


                txt_inspDt.Text = _insp_date;
                ddl_kind.SelectedValue = _kind;

                test(ddl_product, _product);

                ddl_product.SelectedValue = _product;
                ddl_program.SelectedValue = _program;
                ddl_custmer.SelectedValue = _custmer;

                test(ddl_program, _program);

                ddl_result.SelectedValue = _result;
                txt_operator.Text = _h_operator;

                ddl_inspect.SelectedValue = _inspect;
                txt_samp_count.Text = _samp_count;
                txt_insp_count.Text = _insp_count;
                ddl_sp_stand.SelectedValue = _sp_stand;

                txt_birthDt.Text = _birthDt;
                txt_b_opeartor.Text = _b_opeartor;

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
        /// 指定物件顯示名稱
        /// </summary>
        private void setTag()
        {
            Btn_fail.Text = getStr("obsolete");
            Btn_RemindReviewer.Text = getStr("remind");
            Btn_Save.Text = getStr("save");
            Btn_SendRequest.Text = getStr("submit");
            Btn_Stop.Text = getStr("suspend");

        }

        private void DB_Load()
        {
            Head_load();
            lbase_load();
            //====================================================
            ddl_join_parent(ddl_product, _kind, false);
            ddl_join_parent(ddl_program, _product, false);
            ddl_join_parent(ddl_test, _program, false);
            //ddl_join_parent(ddl_ts_standard, _test, false);


        }

        private void test(DropDownList ddl, string value)

        {
            foreach (ListItem item in ddl.Items)
            {
                Utility.Debug(item.Value, value);
            }
        }

        private void Head_load()
        {
            Leica_Head head = new Leica_Head();
            head.Query(_head_id);
            _kind = head.Kind;
            _h_operator = head.H_Operator;
            _insp_date = head.Insp_Dt;
            _result = head.Result;
            //---------Aout Option by Kind----------------

            _product = ConvertToJoin(head.Product, head.Kind);
            _program = ConvertToJoin(head.Program, _product); //_product要用join的代碼去找
            lab_NO.Text = head.Insp_No;
            _insp_no = head.Insp_No;
            _custmer = head.Custmer;

        }

        private void lbase_load()
        {
            using (SqlConnection cn = new SqlConnection(Utility.ConnStr))
            {
                cn.Open();
                //3.引用SqlCommand物件
                string sql = string.Format("select * from eipe.dbo.Leica_Base where head_id='{0}' ", _head_id);
                using (SqlCommand command = new SqlCommand(sql, cn))
                {
                    using (SqlDataReader rs = command.ExecuteReader())
                    {
                        try
                        {
                            while (rs.Read())
                            {
                                _base_id = rs["rowid"].ToString();
                                string insp_count = rs["insp_count"].ToString();
                                string samp_count = rs["samp_count"].ToString();
                                string standard_id = rs["standard_id"].ToString();
                                string bith_date = Convert.ToDateTime(rs["bith_date"].ToString()).ToShortDateString();
                                string b_operator = rs["b_operator"].ToString();
                                string seq = rs["seq"].ToString();
                                _inspect = rs["inspect"].ToString();

                                string inspect_text = GetItemOption(ddl_inspect, _inspect);
                                string standard = GetItemOption(ddl_sp_stand, standard_id);

                                // "head_id", "inspect_id", "inspect", "insp_count", "samp_count", "standard_id", "standard", "bith_date", "b_operator", "seq", "base_id"
                                db_VMI_Load(_base_id);

                                db_FT_Load(_base_id);

                                lbase.Table.Rows.Add(_head_id, _inspect, inspect_text, insp_count, samp_count, standard_id, standard, bith_date, b_operator, seq, _base_id, DateTime.Now.ToString());
                            }
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }
                        finally
                        {
                            rs.Close();
                        }

                    }
                }
            }

        }

        private void load_s5(string ft_id)
        {
            try
            {
                using (SqlConnection cn = new SqlConnection(Utility.ConnStr))
                {
                    cn.Open();
                    //3.引用SqlCommand物件
                    string sql = string.Format("select * from eipe.dbo.Leica_Ft_Track where ft_id='{0}' ", ft_id);
                    using (SqlCommand command = new SqlCommand(sql, cn))
                    {
                        using (SqlDataReader rs = command.ExecuteReader())
                        {
                            try
                            {
                                while (rs.Read())
                                {

                                    string test_id = rs["test"].ToString();
                                    string ts_standard_id = rs["standard"].ToString();
                                    string ft_qty = rs["qty"].ToString();
                                    string ft_jdug_id = rs["judgment"].ToString();
                                    string s1 = rs["s1"].ToString();
                                    string s2 = rs["s2"].ToString();
                                    string s3 = rs["s3"].ToString();
                                    string s4 = rs["s4"].ToString();
                                    string s5 = rs["s5"].ToString();

                                    //因為多階選單，會造成ddl沒有資料，所以要從DB內找

                                    string text_key = GetOptionTxt(test_id); //db存的是sys_option的rowid
                                    _test = ConvertToJoin(test_id, _program); //找出join 的代號

                                    string ts_standard_key = GetOptionTxt(ts_standard_id); //db存的是sys_option的rowid
                                    _ts_standard = ConvertToJoin(ts_standard_id, _test);


                                    string ft_jdug = GetItemOption(ddl_ft_judg, ft_jdug_id);
                                    //S5 = new data_table("S5", "ft_id", "test", "test_id", "ts_standard", "ts_standard_id", "ft_qty", "ft_jdug", "ft_jdug_id", "s1", "s2", "s3", "s4", "s5");
                                    S5.Table.Rows.Add(ft_id, text_key, _test, ts_standard_key, _ts_standard, ft_qty, ft_jdug, ft_jdug_id, s1, s2, s3, s4, s5);
                                }
                            }

                            finally
                            {
                                rs.Close();
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void db_FT_Load(string base_id)
        {
            using (SqlConnection cn = new SqlConnection(Utility.ConnStr))
            {
                cn.Open();
                //3.引用SqlCommand物件
                string sql = string.Format("select * from eipe.dbo.Leica_Feature where base_id='{0}' ", base_id);
                using (SqlCommand command = new SqlCommand(sql, cn))
                {
                    using (SqlDataReader rs = command.ExecuteReader())
                    {
                        try
                        {
                            while (rs.Read())
                            {

                                _ft_rowid = rs["ft_id"].ToString();
                                string prod_index = rs["prod_index"].ToString();
                                string insp_time = rs["insp_time"].ToString();

                                load_s5(_ft_rowid);
                                ft.Table.Rows.Add(base_id, _ft_rowid, prod_index, insp_time);
                            }
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }
                        finally
                        {
                            rs.Close();
                        }

                    }
                }
            }
        }

        private void db_VMI_Load(string base_id)
        {
            try
            {
                using (SqlConnection cn = new SqlConnection(Utility.ConnStr))
                {
                    cn.Open();
                    string sql = string.Format("select * from eipe.dbo.Leica_VMI where base_id='{0}' ", base_id);

                    using (SqlCommand command = new SqlCommand(sql, cn))
                    {
                        using (SqlDataReader rs = command.ExecuteReader())
                        {
                            while (rs.Read())
                            {
                                string vmi_id = rs["rowid"].ToString();
                                string position = rs["position"].ToString();
                                string qty = rs["qty"].ToString();
                                string judgment = rs["judgment"].ToString();

                                string position_txt = GetItemOption(ddl_position, position);
                                string judg_txt = GetItemOption(ddl_vmi_judg, judgment);

                                load_VMI_Shape(vmi_id);
                                // "base_id", "vmi_id", "position_txt", "position", "qty", "judg_txt", "judgment"

                                vmi.Table.Rows.Add(base_id, vmi_id, position_txt, position, qty, judg_txt, judgment);
                            }
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void load_VMI_Shape(string vmi_id)
        {
            try
            {
                using (SqlConnection cn = new SqlConnection(Utility.ConnStr))
                {
                    cn.Open();
                    string sql = string.Format("select * from eipe.dbo.Leica_VMI_Shape where vmi_id='{0}' ", vmi_id);

                    using (SqlCommand command = new SqlCommand(sql, cn))
                    {
                        using (SqlDataReader rs = command.ExecuteReader())
                        {
                            while (rs.Read())
                            {
                                string seq = rs["seq"].ToString();
                                string shape_id = rs["shape"].ToString();
                                string shape_txt = GetItemOption(ddl_shape, shape_id);
                                //shape = new data_table("shape", "vmi_id", "shape_txt", "shape", "seq");
                                shape.Table.Rows.Add(vmi_id, shape_txt, shape_id, seq);
                            }
                        }

                    }
                }
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

            //Join_Product(ddl_product);
            //Join_Program(ddl_program);
            //Join_Test(ddl_test);
            //Join_TsSeand(ddl_ts_standard);
        }

        private void InitUI()
        {
            _insp_date = DateTime.Now.ToShortDateString();
            txt_operator.Text = CurrentUser.LogonID;
            _insp_count = "0";
            _samp_count = "0";
        }

        #region event

        protected void lbtn_base_add_Click(object sender, EventArgs e)
        {
            //add_Main();

            if (vmi_list.Rows.Count > 0)
            {

                //string get = string.Format(" base_id='{0}' ", _base_id);
                //DataRow[] bases = lbase.Table.Select(get);  //

                add_vmi(_base_id);



                add_All(_base_id);

                ScriptManager.RegisterStartupScript(Page, GetType(), "click", "clear_all()", true);
            }
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

            if (!string.IsNullOrEmpty(_test))
            {
                ddl_join_parent(ddl_ts_standard, _test, false);
            }

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
                // Response.Write(ex.Message + "<br>" + ex.StackTrace);
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
        }

        private void All_Bind()
        {

            lbase.Table.DefaultView.Sort = "curr";
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
            _base_id = gvr.Cells[0].Text;


            if (e.CommandName == "Del_All")
            {
                Del_All(insepect, _base_id);
            }

            if (e.CommandName == "Update_All")
            {

                if (insepect == "VMI")
                {
                    Copy_To_Vmi(_base_id);
                    Del_All(insepect, _base_id);
                    up_vmi.Update();
                }
                else
                {
                    Copy_To_ft(_base_id);
                    ft_show();
                    up_ft.Update();
                }


            }
        }

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

            lbase.Row_Del(" base_id='" + base_id + "' ");

            All_Bind();
        }

        #endregion all_list
        private Table getView(string baseid)
        {
            Table tb = new Table();
            tb = getVim(baseid);

            if (tb.Rows.Count == 0)
            {
                tb = getFtList(baseid);
            }
            return tb;
        }

        private Table getFtList(string baseid)
        {
            Table tb = new Table();
            tb.ID = baseid;
            tb.GridLines = GridLines.None;


            DataRow[] ft_dr = ft.Table.Select(" base_id='" + baseid + "' "); //不重覆
            int i = 0;
            foreach (DataRow f in ft_dr)
            {
                TableRow tr = new TableRow();

                TableCell td = new TableCell();

                //--------------------------------------

                Table view = getFT2(f);

                if (i % 2 == 0)
                {
                    view.CssClass = "comicGreen";
                }
                else
                {
                    view.CssClass = "comicYellow";
                }

                //--------------------------------------
                td.Controls.Add(view);
                td.Attributes.Add("align", "center");
                tr.Cells.Add(td);
                tb.Rows.Add(tr);
                i++;
            }

            return tb;
        }

        private Table getFT2(DataRow f)
        {
            Table tb = new Table();

            //prod_index insp_time
            TableHeaderRow hr = new TableHeaderRow();


            //hr.CssClass = "ft_hr";

            //t_ft = new data_table("t_ft", "base_id", "ft_id", "prod_index", "insp_time");
            TableHeaderCell hh_prod = new TableHeaderCell();
            hh_prod.Text = f["prod_index"].ToString();
            //colspan="要橫跨的列數"
            hh_prod.ColumnSpan = 4;
            hr.Cells.Add(hh_prod);


            TableHeaderCell hh_time = new TableHeaderCell();
            hh_time.Text = f["insp_time"].ToString();
            hh_time.ColumnSpan = 5;
            hr.Cells.Add(hh_time);
            tb.Rows.Add(hr);


            DataRow[] R_s5 = S5.Table.Select(string.Format(" ft_id='{0}' ", f["ft_id"].ToString()));
            int i = 0;
            foreach (DataRow s in R_s5)
            {
                TableRow tr = new TableRow();

                //tr.CssClass = "s5_even";
                if (i % 2 == 0)
                {
                    //  tr.CssClass = "s5_single";
                }


                TableCell td_ts = DefultTc(120);
                td_ts.Text = s["test"].ToString();
                tr.Cells.Add(td_ts);

                TableCell td_ts_st = DefultTc(120);
                td_ts_st.Text = s["ts_standard"].ToString();
                tr.Cells.Add(td_ts_st);

                TableCell td_qty = DefultTc(80);
                td_qty.Text = s["ft_qty"].ToString();
                tr.Cells.Add(td_qty);

                TableCell td_jdug = DefultTc(120);
                td_jdug.Text = s["ft_jdug"].ToString();
                tr.Cells.Add(td_jdug);

                TableCell td_s1 = DefultTc(60);
                td_s1.Text = s["s1"].ToString();
                tr.Cells.Add(td_s1);

                TableCell td_s2 = DefultTc(60);
                td_s2.Text = s["s2"].ToString();
                tr.Cells.Add(td_s2);

                TableCell td_s3 = DefultTc(60);
                td_s3.Text = s["s3"].ToString();
                tr.Cells.Add(td_s3);

                TableCell td_s4 = DefultTc(60);
                td_s4.Text = s["s4"].ToString();
                tr.Cells.Add(td_s4);

                TableCell td_s5 = DefultTc(60);
                td_s5.Text = s["s5"].ToString();
                tr.Cells.Add(td_s5);

                tb.Rows.Add(tr);
                i++;
            }

            return tb;
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

        private Table getVim(string baseid)
        {
            Table tb = new Table();
            tb.CssClass = "vmi_tb";
            tb.Attributes.Add("align", "center");

            //"vmi", "head_id", "vmi_id", "position", "position_id", "qty", "judg", "judg_id"
            DataRow[] Vim_dr = vmi.Table.Select(" base_id='" + baseid + "' ");

            if (Vim_dr.Length > 0)
            {
                StringBuilder sb = new StringBuilder();


                int i = 0;
                foreach (DataRow row in Vim_dr)
                {
                    TableRow tr = new TableRow();

                    TableCell cell01 = DefultTc(80);
                    cell01.Text = row["position_txt"].ToString();
                    tr.Cells.Add(cell01);


                    TableCell cell02 = DefultTc(80);
                    cell02.Controls.Add(getShapeRegion(row["vmi_id"].ToString()));
                    tr.Cells.Add(cell02);

                    TableCell cell03 = DefultTc(60);

                    cell03.Text = row["qty"].ToString();
                    tr.Cells.Add(cell03);

                    TableCell cell04 = DefultTc(80);

                    cell04.Text = row["judg_txt"].ToString();
                    tr.Cells.Add(cell04);


                    tb.Rows.Add(tr);
                    i++;
                }

            }

            return tb;
        }

        private TableCell DefultTc(int width)
        {
            TableCell cell01 = new TableCell(); //Position 
            cell01.Width = width;
            cell01.BorderWidth = 1;
            // cell01.BorderColor = Utility.HexColor("#5d3d21");
            cell01.Style.Add("padding", "2px");

            return cell01;

        }

        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (Confirm())
                {
                    Update_Head();
                    Del_Former();
                    Save_Base();
                    Save_VMI();
                    Save_Feature();
                    msg.Value = getStr("save_ok");
                }
            }
            catch (Exception ex)
            {
                all_sb.Append(ex.Message + "<br>");
                all_sb.Append(ex.StackTrace.ToString() + "<br>");
            }


        }

        private void Del_Former()
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select * from eipe.dbo.Leica_Base where head_id='{0}' ", _head_id);

                ds.Open(sql);

                while (!ds.EOF)
                {

                    del_VMI(ds["rowid"].ToString()); //base_id
                    del_Feature(ds["rowid"].ToString());

                    ds.MoveNext();
                }
            }

            Leica_Base.Delete(_head_id);

        }

        private void del_Feature(string base_id)
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select * from eipe.dbo.Leica_Feature where base_id='{0}' ", base_id);

                ds.Open(sql);

                while (!ds.EOF)
                {
                    string ft_id = ds["ft_id"].ToString();

                    Leica_Ft_Track.Delete(ft_id);
                    ds.MoveNext();
                }
            }

            Leica_Feature.Delete(base_id);
        }


        private void del_VMI(string base_id)
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select * from eipe.dbo.Leica_VMI where base_id='{0}' ", base_id);

                ds.Open(sql);

                while (!ds.EOF)
                {
                    string vmi_id = ds["rowid"].ToString();

                    Leica_VMI_Shape.Delete(vmi_id);
                    ds.MoveNext();
                }
            }

            Leica_VMI.Delete(base_id);
        }

        private void Update_Head()
        {
            EIPSysSha SysNum = new EIPSysSha();

            Leica_Head Head = new Leica_Head();

            Head.Create_User = CurrentUser.LogonID;
            Head.H_Operator = _h_operator;
            Head.Insp_Dt = _insp_date;
            Head.Insp_No = SysNum.GetNewSn("Q608", DateTime.Now.ToString("yyMM"));
            Head.Kind = _kind; //是因為他parent_id
            Head.Product = ConvertToOption(_product);
            Head.Program = ConvertToOption(_program);
            Head.Result = _result;
            Head.ROWID = _head_id;
            Head.Status = Convert.ToInt16(status.Waite).ToString();
            Head.Modify_User = CurrentUser.LogonID;
            Head.Update();


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

        protected void s5_list_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ft_id = s5_list.DataKeys[e.RowIndex].Value.ToString();

            t_S5.Row_Del(string.Format(" ft_id='{0}' ", ft_id));
            S5_Bind();
        }

        protected void Btn_RemindReviewer_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            string mail = "", user = "";
            f.GetCurrApproveMail(Request.QueryString["rowid"], ref mail, ref user);

            string insp_no = lab_NO.Text;
            string subject = string.Format("{0} 單號:{1}-{2}", Title, insp_no, "(催審)");
            string url = string.Format("{0}{1}?rowid={2}", Utility.LocalUrl, @"/Leica/LeicaView.aspx", Request.QueryString["rowid"]);
            string body = Flow.MailFormat.Remind(Title, user, lab_NO.Text, url);
            Utility.SendMail(mail, user, subject, body);
        }

        protected void Btn_Stop_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            Leica_Head.Stata_Change(status.Stop, Request.QueryString["rowid"]);
            string mail = "";
            string user = "";
            f.Stop(Request.QueryString["rowid"], ref mail, ref user);

            string insp_no = lab_NO.Text;
            string subject = string.Format("{0} 單號:{1}-{2}", Title, insp_no, "(中止)");
            string url = string.Format("{0}{1}?rowid={2}", Utility.LocalUrl, @"/Leica/LeicaView.aspx", Request.QueryString["rowid"]);
            string body = Flow.MailFormat.Stop(Title, user, lab_NO.Text, url);

            Utility.SendMail(mail, user, subject, body);

        }

        protected void Btn_fail_Click(object sender, EventArgs e)
        {
            Leica_Head.Stata_Change(status.Fial, Request.QueryString["rowid"]);

            msg.Value = getStr("fail");
        }

        protected void Btn_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            string rowid = Request.QueryString["rowid"];
            if (this.IsValid)
            {
                try
                {

                    Leica_Head.Stata_Change(status.Send, rowid);
                    Dictionary<string, string> Review = new Dictionary<string, string>();


                    //ArrayList managerid = new ArrayList();  //主管id 
                    //ArrayList managernm = new ArrayList();  //主管 Text

                    string supervisor = Utility.GetUserID(txt_supervisor.Text);
                    string manager = Utility.GetUserID(txt_manager.Text);

                    //managerid.Add(supervisor);
                    //managernm.Add("確認");
                    Review.Add("確認", supervisor);

                    //managerid.Add(manager);
                    //managernm.Add("審核");

                    Review.Add("審核", manager);

                    //managerid.Add(PopupUser3.Text);
                    //managernm.Add("負責主管3");


                    FlowClient1.Text = "Leica審核-" + " NO:" + _insp_no;
                    sharflow12_2.Flowwork.sharflow12_21 flow = new sharflow12_2.Flowwork.sharflow12_21();

                    switch (Review.Count)  //依舊arraylist裡面有幾個,來判斷走那條flow
                    {

                        case 1:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 2:
                            e.NextNode = flow.sharflow12_2Node2;
                            break;

                        case 3:
                            e.NextNode = flow.sharflow12_2Node4;
                            break;

                    }

                    //--------------------------------------------------------------------
                    int count = 0;

                    foreach (KeyValuePair<string, string> k in Review)  //將簽核人員id塞進flow
                    {
                        this.FlowClient1.AddParameter("USER" + count.ToString(), k.Value);
                        this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), k.Key);
                        count++;
                    }
                    string url = "/Leica/LeicaView.aspx";
                    e.NextNode.ReviewerURL = url;
                    //通知主要審核者 
                    url = string.Format("{0}{1}?rowid={2}", Utility.LocalUrl, url, rowid);
                    string mail = MABase.Flow.MailFormat.Approve(Title, txt_supervisor.Text, lab_NO.Text, url);
                    string subject = string.Format("{0} No:{1}({2})", Title, lab_NO.Text, "審核");

                    User_Info user = new User_Info();
                    user.GetUserByLogo(txt_supervisor.Text);
                   
                    f.ToApproval(rowid, user.NAME , subject, mail);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {  

            f.FlowViewer_History("S_Comment", FlowFeedbackViewer1, e);
        }
    }
}