using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Builder
{
    public partial class Manager : SmoothEnterprise.Web.Page
    {
        string _user = "",_del="", _dept="";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Dictionary<string, string> UserInfo = Utility.GetUserInfo(CurrentUser.LogonID);
                ListItem[] selected = Utility.setList("select dept_no 'value',dept_nm 'name' from eipa.dbo.lea_hm1dept10 where  dept_nm not like '*%' order by  dept_no ", UserInfo["DEPTNO"]);
                this.Dept.Items.AddRange(selected); 
                
                

            }
            else
            {
                _user = txt_user_id.Value;
                _del = del_user.Value;
                _dept = this.Dept.SelectedValue.Trim();
            }

            msg.Value = "";
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


                sb.Append(" select u.id,d.dept_nm ,u.name ,u.email,u.logonid from eipe.dbo.SYS_Category c  ");
                sb.Append(" left join eipa.dbo.dguser u on u.id=c.rowno  ");
                sb.Append(" left join eipa.dbo.lea_hm1emp10 e on e.emp_no =u.empid　");
                sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no = e.dept_no  ");
                sb.Append(" left join eipa.dbo.dglevel l on u.levid = l.lnid  ");
                sb.Append(" where ustatus='57DADAB8-44CF-4BAA-A40C-324F9F4533A9'");
                sb.Append(" and comid='MAT' and d.dept_no is not null ");
                sb.Append(" and c.program = 'PCN' and kind = 'manager' "); 
                

                if (!string.IsNullOrEmpty(_dept))
                {
                    sb.Append(string.Format(" and d.dept_no='{0}' ", _dept));
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string uid = row.Cells[4].Text; 
        }



        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            add_user();
            _dept = "";
            txt_user_id.Value = "";
            txt_user.Text = "";
        }

        private void add_user()
        {
            if (string.IsNullOrEmpty(_user))
            {
                msg.Value = "請選擇人員";
            }
            else
            {
                using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    string sql = string.Format("select * from eipe.dbo.SYS_Category where rowno='{0}' ", _user);
                    ds.Open(sql);
                    if (ds.EOF)
                    {
                        ds.Add();
                        ds["rowno"] = _user;
                        ds["program"] = "PCN";
                        ds["kind"] = "manager";
                        ds["name"] = Utility.GetUName(_user);

                        ds.Update();
                        msg.Value = "新增成功";
                    }
                    else
                    {
                        msg.Value = "人員重覆";
                    }

                    
                }
            }
        }

        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            GVBind(0);
        }

        protected void btn_del_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(_del))
                {
                    string[] dels = _del.Split(';');

                    foreach (string d in dels)
                    {
                        string sql = string.Format("delete  from eipe.dbo.SYS_Category  where  program = 'PCN' and kind = 'manager' and rowno='{0}'", d);

                        Utility.execDel(sql);
                    }
                    msg.Value = "刪除成功";
                }

            }
            catch (Exception ex)
            {
                throw ex;
                
            }
        }

        protected void Dept_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVBind(0);
        }
    }
}