using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Leica
{

    public partial class LeicaView : LeicaBase
    {
        MABase.Flow f = new Flow();
        int _all_row = 0;
        public StringBuilder all_sb = new StringBuilder();
        string Title = "Leica IPQC生產資訊系統";


        string curr_ft_id = "";
        int iRowspan = 1; //合併列數
        int item = 1;
        System.Drawing.Color bg_Color, ft_Color;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                msg.Value = "";
                Create_Table();
                _head_id = Request.QueryString["rowid"];
                //------ 
                if (!IsPostBack)
                {
                    InitUI();
                    OutTable();
                    DB_Load();
                    upload_Bind();
                    lab_inspDt.Text = _insp_date;
                    lab_kind.Text = GetOptionTxt(_kind);
                    lab_operator.Text = _h_operator;
                    lab_product.Text = GetOptionTxt(_product);
                    lab_program.Text = GetOptionTxt(_program);
                    lab_NO.Text = _insp_no;
                    lab_result.Text = GetOptionTxt(_result);

                    All_Bind(); //最後
                }
                

            }

            catch (Exception ex)
            {
                throw ex;
            }
        }



        private void DB_Load()
        {
            Head_load();
            lbase_load();
        }


        private void Head_load()
        {
            Leica_Head head = new Leica_Head();
            head.Query(_head_id);

            _kind = head.Kind;
            _h_operator = head.H_Operator;
            _insp_date = head.Insp_Dt;
            _result = head.Result;
            _insp_no = head.Insp_No;
            _product = head.Product;
            _program = head.Program;
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

                                string inspect_text = GetInspectTxt(standard_id);
                                string standard = GetOptionTxt(standard_id);

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
                                    string ts_standard_key = GetOptionTxt(ts_standard_id); //db存的是sys_option的rowid 
                                    string ft_jdug = GetOptionTxt(ft_jdug_id);
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

                                string position_txt = GetOptionTxt(position);
                                string judg_txt = GetOptionTxt(judgment);

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
                                string shape_txt = GetOptionTxt(shape_id);
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

        private void InitUI()
        {
            _insp_date = DateTime.Now.ToShortDateString();
            lab_operator.Text = CurrentUser.LogonID;
            _insp_count = "0";
            _samp_count = "0";
        } 

        private void All_Bind()
        {
            lbase.Table.DefaultView.Sort = "curr";
            GridView_Bind(all_list, lbase.Table);
            up_list.Update();
        }

        private void upload_Bind()
        {
            File_list(file_list);
            up_file.Update(); 
        } 

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

                ////< asp:LinkButton ID = "lbtn_All_Update" runat = "server" CommandName = "Update_All" title = "Update" CommandArgument = "<%# ((GridViewRow) Container).RowIndex %>" class="fas fa-wrench ft_edit" OnClientClick="return upload_base()" ></asp:LinkButton>
                //LinkButton lbtn_All_Update = new LinkButton();

                //int Row_Index = e.Row.DataItemIndex;//從tr開始算
                //lbtn_All_Update.CommandName = "Update_All";
                //lbtn_All_Update.CommandArgument = Convert.ToString(Row_Index);
                //lbtn_All_Update.CssClass = "fas fa-wrench ft_edit";


                //lbtn_All_Update.OnClientClick = "return upload_base('" + base_id + "','" + Guid.NewGuid().ToString() + "' )";

                //e.Row.Cells[10].Controls.Add(lbtn_All_Update);
                _all_row++;
            }
        }
 
       

          
        /// <summary>
        /// 顯示簽核資料
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            
            f.FlowViewer_History("S_Comment", FlowFeedbackViewer1, e);
        }

        /// <summary>
        /// 送出簽核
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
        {
            try
            {

                this.FlowFeedback1.Commit();
                Response.Redirect("http://" + Request.Url.Authority.ToString() + "/Flowwork/MyApproval.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        /// <summary>
        /// 簽核流程結束
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
        {
            string uName = "", eMail = "";
            string mail_script = "";
            string rowid = Request.QueryString["rowid"];
            status s = 0;
            string url = Utility.LocalUrl + Request.RawUrl;
            string reslut = "", subject="";

            switch (e.ResultType)
            {
                case SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete://完成 //結束
                    s = status.Complete;
                    mail_script = MABase.Flow.MailFormat.Complete(Title,uName ,lab_NO.Text, url);
                    reslut = "審核通過"; 
                    f.getCreateUser(rowid,ref uName,ref eMail);

                     subject = string.Format("{0} No:{1}({2})", Title, lab_NO.Text, reslut);
                    Utility.SendMail(eMail, "EIP(員工入口網站)", subject, mail_script);

                    break;
                case SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate://退回提案人

                    s = status.Back;
                    f.getCreateUser(rowid,ref uName,ref eMail);
                    mail_script = MABase.Flow.MailFormat.Terminate(Title, uName, lab_NO.Text, url);
                    reslut = "退回";
                    f.getCreateUser(rowid, ref uName, ref eMail);

                    subject = string.Format("{0} No:{1}({2})", Title, lab_NO.Text, reslut);
                    Utility.SendMail(eMail, "EIP(員工入口網站)", subject, mail_script);
                    break;
                case SmoothEnterprise.Flowwork.Control.ReviewResultType.Next:
                    s = status.Send; 

                    mail_script =MABase.Flow.MailFormat.Approve(Title, uName, lab_NO.Text, url);
                    reslut = "審核";
                    subject = string.Format("{0} No:{1}({2})", Title, lab_NO.Text, reslut);
                    
                    f.ToApproval(rowid,uName, subject, mail_script);

                    break;

            }

            
            Leica_Head.Stata_Change(s, rowid); 
        }

        //該節流程結束
        protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
        {
            try
            {     
                 
                if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
                {
                    e.NextNode = e.FlowNode.DefaultNode();
                    //_NodeType = "Next";
                    e.NextNode.ReviewerURL = Request.CurrentExecutionFilePath;
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message+"<br/>"+ex.StackTrace+"<br/>");
            }

        }

        //該節簽核完成
        protected void FlowFeedback1_FeedbackComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
        {
            string url = Request.Url.PathAndQuery;
                f.Feedback_FeedbackComplete( CurrentUser.LogonID , url,  FlowFeedback1 , e);
              
        }

        protected void file_list_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
             e.Item.ItemType == ListItemType.AlternatingItem)
            {

                // Retrieve the Label control in the current DataListItem.
                LinkButton lbtn = (LinkButton)e.Item.FindControl("lbtn_file");
                lbtn.Style.Add("font-size", "1.2em");
                DataRowView DRV = (DataRowView)e.Item.DataItem;

                lbtn.Text = DRV.Row["file_name"].ToString();
                //lbtn.OnClientClick = "return Download('" + DRV.Row["rowid"].ToString()+ "')";

                string paramster = string.Format("rowid={0} and head_id={1}", "'" + DRV.Row["rowid"].ToString() + "'", "'" + _head_id + "'");

                string Url = string.Format("{0}/comm/download_handler.ashx?table={1}&col_filename={2}&col_type={3}&col_content={4}&paramenter={5}", Utility.LocalUrl, "eipe.dbo.leica_file", "file_name", "kind", "arguments", paramster);
                lbtn.Attributes.Add("href", Url);


            }

        }


    }
}