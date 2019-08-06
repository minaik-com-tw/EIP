using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Build
{
    public partial class Mail : SmoothEnterprise.Web.Page
    {
        string _select = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                Dictionary<string, string> US = Utility.GetUserInfo(CurrentUser.LogonID);

                ListItem[] List = Utility.setList(" select dept_no 'value',dept_nm 'name' from eipa.dbo.lea_hm1dept10 where  dept_nm not like '*%' order by  dept_no ", US["DEPTNO"]);
                ddl_dept.Items.AddRange(List);

                UserList();
                MailList();
            }
            else
            {
                _select=user_mail.Value;

            }

            msg.Value = "";
        }

        protected void Btn_Qry_Click(object sender, EventArgs e)
        { 
            UserList(); 
        }

        private void UserList()
        {
            using (SqlDataSource Conn = new SqlDataSource())
            {
                Conn.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString;

                StringBuilder sb = new StringBuilder();

                string user = this.txt_name.Text;
                string dept = this.ddl_dept.SelectedValue;

                //id 'value', tag 'en' , tag name 'tw'
                //sb.Append(" select u.id,d.dept_nm ,u.name ,u.email,u.logonid from eipa.dbo.dguser u ");

                sb.Append(" select  u.id 'value', u.name 'en',u.name 'tw',NULL 'def'  from eipa.dbo.dguser u ");
                sb.Append(" left join eipa.dbo.lea_hm1emp10 e on e.emp_no = u.empid");
                sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no = e.dept_no  ");
                sb.Append(" left join eipa.dbo.dglevel l on u.levid = l.lnid  ");
                sb.Append(" where ustatus='57DADAB8-44CF-4BAA-A40C-324F9F4533A9'");
                sb.Append(" and  u.id not in (select id from eipe.dbo.pcn_mail) ");
                sb.Append("  and comid='MAT' and d.dept_no is not null "); 

                if (!string.IsNullOrEmpty(user))
                {
                    sb.Append(string.Format(" and u.name like '%{0}%' ", user));
                }

                if (!string.IsNullOrEmpty(dept))
                {
                    sb.Append(string.Format(" and d.dept_no='{0}' ", dept));
                }

                sb.Append(" order by d.dept_no ,l.lshort desc ");

                lb_user.Items.Clear();
                ListItem[] item = Utility.getOPItem(sb.ToString(), "", language.tw, false); 
                
                lb_user.Items.AddRange(item);

                lb_user.Items.Remove(item[0]);
                 
            }
        }

        protected void ddl_dept_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserList();
        }
         
        protected void btn_add_Click(object sender, EventArgs e)
        {
            addMail();
            UserList();
            MailList();
            msg.Value = "新增成功";
            
        }

        private void MailList()
        {

            lb_mail.Items.Clear();
            ListItem[] item = Utility.getOPItem("select id,name 'en',name 'tw',NULL 'def' from eipe.dbo.pcn_mail order by name ", "", language.tw, false);

            lb_mail.Items.AddRange(item);

            lb_mail.Items.Remove(item[0]);

        }

        private void addMail()
        {
           string[] mail =_select.Split(';');

            foreach (string uid in mail)
            {
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    string sql = string.Format(" select * from eipe.dbo.pcn_mail where id='{0}' ", uid);
                    rs.Open(sql);

                    if (rs.EOF)
                    {
                        Dictionary<string, string> us = Utility.GetUIDInfo(uid);

                        rs.Add();

                        rs["id"] = us["ID"];
                        rs["name"] = us["NAME"];
                        rs["mail"] = us["EMAIL"];

                        rs.Update();
                         
                    }
                }
            } 
        }

        private void DelMail()
        {
            string[] mail = _select.Split(';');

            foreach (string uid in mail)
            {
                string sql = string.Format(" delete from eipe.dbo.pcn_mail where id='{0}' ", uid);
                Utility.execDel(sql);
            }  
        }

        protected void btn_del_Click(object sender, EventArgs e)
        {
            DelMail();
            UserList();
            MailList();
            msg.Value = "刪除成功";
        }
    }
}