using System;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Maintain
{
    public partial class Flow : IPQC_Base
    {

        string _level = "", _dept = "", _name = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setlevel(cbo_level);
                GVBind(0);
            }
            else
            {
                _level = cbo_level.SelectedValue;
                _name = txt_name.Text;
            }

            cbo_level.SelectedValue = _level;

        }

        private void GVBind(int page)
        {
            using (SqlDataSource Conn = new SqlDataSource())
            {
                Conn.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString;

                StringBuilder sb = new StringBuilder();

                sb.Append(" select f.*,u.logonid,u.name  from eipe.dbo.ipqc_flow f ");
                sb.Append(" left join eipa.dbo.dguser u on f.uid=u.id ");
                sb.Append(" left join eipa.dbo.lea_hm1emp10 e on e.emp_no = u.empid");
                sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no = e.dept_no  ");
                sb.Append(" left join eipa.dbo.dglevel l on u.levid = l.lnid  ");
                sb.Append(" where ustatus='57DADAB8-44CF-4BAA-A40C-324F9F4533A9' ");

                if (!string.IsNullOrEmpty(_name))
                {
                    sb.Append(string.Format(" and u.name like '%{0}%' ", _name));
                }

                if (!string.IsNullOrEmpty(_level))
                {
                    sb.Append(string.Format(" and f.class='{0}' ", _level));
                }

                sb.Append(" order by f.class,f.seq ");


                Conn.SelectCommand = sb.ToString();

                Conn.DataSourceMode = SqlDataSourceMode.DataSet;

                DataSourceSelectArguments args = new DataSourceSelectArguments();

                DataView dv = (DataView)Conn.Select(args);

                GridView1.PageIndex = page;
                GridView1.DataSource = dv;
                GridView1.DataBind();
                Session["Page"] = page;
                Conn.Dispose();
            }
        }


        #region Controls Event

        protected void cbo_dept_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVBind(0);
        }

        protected void cbo_level_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVBind(0);
        }


        protected void Btn_Del_Click(object sender, EventArgs e)
        {
            string Del = Request.Form["DelKey"];

            if (!string.IsNullOrEmpty(Del))
            {
                string[] ID = Del.Split(',');
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    foreach (string Item in ID)
                    {
                        rs.Open("update eipe.dbo.ipqc_flow set enable='0' WHERE rowno = '" + Item + "'");

                    }
                    rs.Close();
                }

                GVBind(0);
                up_list.Update();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            GVBind(e.NewPageIndex);
            up_list.Update();
        }
        #endregion Controls Event

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;
                string level = drv["class"].ToString();

                //lbt_edit.ID = "lbt_edit";
                LinkButton lbt_edit = (LinkButton)e.Row.Cells[1].FindControl("lbt_edit");
                lbt_edit.Text = "<a href=\"FlowEdit.aspx?ROWNO=" + drv["ROWNO"].ToString() + "\"><img src=\"/PManagement/images/Edit.gif\" border=\"0\" Alt=修改></a>"; 
                
                if (level == "1")
                {
                    e.Row.Cells[2].Text = "HOD";
                    DropDownList seq = (DropDownList)e.Row.Cells[5].FindControl(e.Row.RowIndex.ToString());
                    seq=getLevelSeq(level,seq); 
                    seq.AutoPostBack = true;
                    seq.SelectedValue = drv["seq"].ToString(); 
                }
                 
                if (level == "2")
                {
                    e.Row.Cells[2].Text = "Director";
                    DropDownList seq = (DropDownList)e.Row.Cells[5].FindControl(e.Row.RowIndex.ToString());
                    seq = getLevelSeq(level, seq); 
                    seq.SelectedValue = drv["seq"].ToString(); 
                }

                if (level == "3")
                {
                    e.Row.Cells[2].Text = "Advanced";
                    DropDownList seq = (DropDownList)e.Row.Cells[5].FindControl(e.Row.RowIndex.ToString());
                    seq = getLevelSeq(level, seq); 
                    seq.SelectedValue = drv["seq"].ToString(); 
                }

                e.Row.Cells[7].Text =(!(bool)drv["mail"])?"":"V";
                e.Row.Cells[8].Text = !(bool)drv["enable"]?"V":"";

            }
        }

        private void seq_SelectedIndexChanged(object sender, EventArgs e)
        {

            DropDownList cbo = (DropDownList)sender;
            string seq = cbo.SelectedValue;
            int index = int.Parse(cbo.ID.ToString());

            //DataRowView drv = (DataRowView)e.Row.DataItem;


            string rowno = GridView1.DataKeys[index].Values[0].ToString();
            string level = GridView1.DataKeys[index].Values[1].ToString();

            update_seq(level, rowno, seq);
            GVBind(0);
            up_list.Update();

        }

        private DropDownList getLevelSeq(string level, DropDownList  cbo)
        {    
            cbo.Items.Clear();

            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                int seq = (int)(rs.ExecuteScalar(" select max(seq) 'seq' from eipe.dbo.ipqc_flow where class='" + level + "' "));

                if (seq > 0)
                {
                    for (int i = 1; i <= seq; i++)
                    {
                        string txt = i.ToString();
                        cbo.Items.Add(new ListItem(txt));
                    }
                }
            }


            return cbo;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string BtnName = e.CommandName.ToString();

            if (BtnName == "lbtn_Up")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string id = GridView1.Rows[index].Cells[0].Text;
            }
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            Response.Redirect("FlowAdd.aspx");
        }

        protected void Btn_Qquery_Click(object sender, EventArgs e)
        {
            GVBind(0);
        }

        private void update_seq(string level, string rowno, string seq)
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string old = " select rowno from eipe.dbo.ipqc_flow  where class='" + level + "' and seq='" + seq + "'";
                string owner = rs.ExecuteScalar(old).ToString(); //找出原序號的owner
                string move_seq = rs.ExecuteScalar(" select seq from eipe.dbo.ipqc_flow  where rowno='" + rowno + "' ").ToString();  //找出異動者的舊序號

                string change_owner = string.Format("update eipe.dbo.ipqc_flow  set seq = '{0}' where rowno = '{1}' ", move_seq, owner);
                rs.ExecuteNonQuery(change_owner).ToString();

                string change_move = string.Format("update eipe.dbo.ipqc_flow  set seq = '{0}' where rowno = '{1}' ", seq, rowno);
                rs.ExecuteNonQuery(change_move).ToString(); 
            }
        }



        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lbt_edit = new LinkButton();
                lbt_edit.ID = "lbt_edit";
                e.Row.Cells[1].Controls.Add(lbt_edit);

                DropDownList seq = new DropDownList();
                seq.ID = e.Row.RowIndex.ToString();
                seq.SelectedIndexChanged += new EventHandler(seq_SelectedIndexChanged);
                seq.Items.Add(new ListItem("A", "B"));
                e.Row.Cells[5].Controls.Add(seq);
                 
            }
        }
    }
}