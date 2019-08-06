using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maintain
{
    public partial class UserSelect : SmoothEnterprise.Web.Page
    {
        string _group = "Mail";
        string _week = "";
        protected void Page_Load(object sender, EventArgs e)
        {

           
            if (!IsPostBack)
            {
                Dictionary<string, string> UserInfo = Utility.GetUserInfo(CurrentUser.LogonID);
                ListItem[] selected = Utility.setList("select dept_no 'value',dept_nm 'name' from eipa.dbo.lea_hm1dept10 where  dept_nm not like '*%' order by  dept_no ", UserInfo["DEPTNO"]);
                this.Dept.Items.AddRange(selected);
                setWeek(cbo_week);
                cbo_week.SelectedValue = getWeek();
                cbo_group.SelectedValue = _group;
                IPQC_RaBase.getGroup(cbo_group);

                GVBind(0);
            }
            else
            {
                _week = this.cbo_week.SelectedValue;
                _group = cbo_group.SelectedValue;
            }

            

        }

        private void setWeek(DropDownList cboList)
        { 
            ListItem[] Option = new ListItem[7];

            Option[0] = new ListItem("一", "1");
            Option[1] = new ListItem("二", "2");
            Option[2] = new ListItem("三", "3");
            Option[3] = new ListItem("四", "4");
            Option[4] = new ListItem("五", "5");
            Option[5] = new ListItem("六", "6");
            Option[6] = new ListItem("日", "0");

            cboList.Items.AddRange(Option);

        }

        private string getWeek()
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                string sql = "select en from eipe.dbo.IPQC_Ra_Option where kind='Report'  ";
                return rs.ExecuteScalar(sql).ToString();
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
                string dept = this.Dept.SelectedValue.Trim();


                sb.Append(" select u.id,d.dept_nm ,u.name ,u.email,u.logonid from eipa.dbo.dguser u ");
                sb.Append(" left join eipa.dbo.lea_hm1emp10 e on e.emp_no = u.empid");
                sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no = e.dept_no  ");
                sb.Append(" left join eipa.dbo.dglevel l on u.levid = l.lnid  ");
                sb.Append(" where ustatus='57DADAB8-44CF-4BAA-A40C-324F9F4533A9'");
                sb.Append("  and comid='MAT' and d.dept_no is not null  ");

                if (_group.ToUpper() == "MAIL")
                {
                    sb.Append("  and u.email is not null  ");
                }

                sb.AppendFormat("  and  u.logonid not in (select logonid from eipe.dbo.IPQC_Ra_Mail where u_group='{0}' ) ", _group);

                if (!string.IsNullOrEmpty(user))
                {
                    sb.Append(string.Format(" and u.name like '%{0}%' ", user));
                }

                if (!string.IsNullOrEmpty(dept))
                {
                    sb.Append(string.Format(" and d.dept_no='{0}' ", dept));
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

        protected void Btn_Add_Click(object sender, EventArgs e)
        {

            string account = Request.Form["Account"];
            string[] Add = account.Split(',');


            if (string.IsNullOrEmpty(_group))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "alert('請選擇人員群組')", true);
            }
            else
            {
                foreach (string logonid in Add)
                {
                    using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
                    {
                        string commanda = string.Format(" select * From [EIPA].[dbo].[dguser] where logonid='{0}' ", logonid);

                        rs.Open(commanda);

                        if (!rs.EOF)
                        {
                            string name = rs["name"].ToString();
                            string email = rs["email"].ToString();
                            insertMail(logonid, email, name, _group);
                        }
                        rs.Close();
                    }
                }

                int Page = Convert.ToInt16(Session["Page"]);
                GVBind(Page);
            }
        }

        private void insertMail(string logonid, string mail, string name, string group)
        {

            using (SmoothEnterprise.Database.DataSet om = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                try
                {
                    using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                    {

                        rs.Open("SELECT * FROM  [EIPE].[dbo].[IPQC_Ra_Mail] WHERE 1=0");
                        rs.Add();

                        Guid uid = Guid.NewGuid();

                        rs["id"] = uid;
                        rs["uname"] = name;
                        rs["logonid"] = logonid;
                        rs["mail"] = mail;
                        rs["u_group"] = group;

                        rs.Update();
                        rs.Close();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }


            }
        }





        protected void cbo_week_SelectedIndexChanged(object sender, EventArgs e)
        {
            

            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = "select * from eipe.dbo.IPQC_Ra_Option where kind='Report' ";

                rs.Open(sql);

                if (!rs.EOF)
                {
                    rs["en"] = _week;
                } 
                rs.Update(); 
            }
        }
    }
}