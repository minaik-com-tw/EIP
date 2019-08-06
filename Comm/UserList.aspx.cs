using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Comm_UserList :SmoothEnterprise.Web.Page
{
    string dept = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            //user.Value = Request.Cookies["SmoothEnterprise711323"]["logonid"]; //EIP
            


            ListItem[] selected = Utility.setList("select dept_no 'value',dept_nm 'name' from eipa.dbo.lea_hm1dept10 where  dept_nm not like '*%' order by  dept_no ", ddl_dept.SelectedValue);
            ddl_dept.Items.AddRange(selected);
             
                Dictionary<string, string> us = Utility.GetUserInfo(CurrentUser.LogonID);
                dept = us["DEPTNO"];
                ddl_dept.SelectedValue = dept;  
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

            string user = this.txt_name.Text;
            dept = this.ddl_dept.SelectedValue;


            sb.Append(" select u.id,d.dept_nm ,u.name ,u.email,u.logonid from eipa.dbo.dguser u ");
            sb.Append(" left join eipa.dbo.lea_hm1emp10 e on e.emp_no = u.empid");
            sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no = e.dept_no  ");
            sb.Append(" left join eipa.dbo.dglevel l on u.levid = l.lnid  ");
            sb.Append(" where ustatus='57DADAB8-44CF-4BAA-A40C-324F9F4533A9'");
            sb.Append("  and comid='MAT' and d.dept_no is not null ");


            if (!string.IsNullOrEmpty(user))
            {
                sb.Append(string.Format(" and u.name like '%{0}%' or  u.logonid like '%{0}%'  ", user));
            }

            if (!string.IsNullOrEmpty(dept))
            {
                sb.Append(string.Format(" and d.dept_no='{0}' ", dept));
            }

            sb.Append(" order by d.dept_no ,l.lshort,logonid desc ");


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

    protected void ddl_dept_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt_name.Text = "";
        GVBind(0);
    }
     

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
     
    protected void txt_name_TextChanged(object sender, EventArgs e)
    {
        ddl_dept.SelectedValue = "";
        dept = "";
         
    }
}
