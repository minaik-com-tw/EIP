using System;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maintain
{
    public partial class Mail : System.Web.UI.Page
    {
        string _group = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem[] selected = Utility.setList("select dept_no 'value',dept_nm 'name' from eipa.dbo.lea_hm1dept10 where  dept_nm not like '*%' order by  dept_no ", Dept.SelectedValue);
                this.Dept.Items.AddRange(selected);
                
                GVBind(0);
            } 
            
        }

        protected void Btn_Qry_Click(object sender, EventArgs e)
        {
            GVBind(0);
        }

        private void GVBind(int page)
        {
            using (SqlDataSource Conn = new SqlDataSource())
            {
                Conn.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString;

                StringBuilder sb = new StringBuilder();

                string user = this.UserName.Text;
                string dept = this.Dept.SelectedValue;


                sb.Append(" select m.id,d.dept_nm ,u.name 'UserName',m.mail 'email',m.logonid, u_group from EIPE.DBO.IPQC_Mail m ");
                sb.Append(" left join eipa.dbo.dguser u on m.logonid = u.logonid ");
                sb.Append(" left join eipa.dbo.lea_hm1emp10 e on e.emp_no = u.empid");
                sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no = e.dept_no  ");
                sb.Append(" left join eipa.dbo.dglevel l on u.levid = l.lnid  ");
                sb.Append(" where ustatus='57DADAB8-44CF-4BAA-A40C-324F9F4533A9' ");


                if (!string.IsNullOrEmpty(user))
                {
                    sb.Append(string.Format(" and u.name like '%{0}%' ", user));
                }

                if (!string.IsNullOrEmpty(dept))
                {
                    sb.Append(string.Format(" and d.dept_no='{0}' ", dept));
                }

                if (!string.IsNullOrEmpty(_group))
                {
                    sb.Append(string.Format(" and m.u_group='{0}' ", _group));
                }


                sb.Append(" order by d.dept_no ,l.lshort desc ");


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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVBind(e.NewPageIndex);
        }

        protected void Dept_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVBind(0);
        }

        protected void Btn_Add_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("UserSelect.aspx");
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
                        rs.Open("DELETE EIPE.DBO.IPQC_Mail WHERE id = '" + Item + "'");

                    }
                    rs.Close();
                }

                GVBind(0);
            }
        }



    }
}
