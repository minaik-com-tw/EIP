using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Build
{
    public partial class treeList : System.Web.UI.Page

    {
        string _parentid = "", _next_tag = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    // SmoothEnterprise2: uid2 ={ 02CA2090 - C5D0 - 455B - A671 - 5D7168D08559} &logonid = Carol.Yeh & email = Carol.Yeh@minaik.com.tw & optvalue1 = &optvalue2 = &optvalue3 =
                    
                    //user.Value = Request.Cookies["SmoothEnterprise711323"]["logonid"]; //EIP
                    user.Value = Request.Cookies["SmoothEnterprise2"]["logonid"]; //9003 ´ú¸Õ¥Î
                    _parentid = Request.Form["parent_id"];
                    _next_tag = Request.Form["next_tag"];

                    //'0e93bb81-cc64-4b21-95e8-e2219c4aba86','Module'
                    /*
                    _parentid = "0e93bb81-cc64-4b21-95e8-e2219c4aba86";
                    _next_tag = "Module";
                    user.Value = "Carol.Yeh";
                    **/
                    next_tag.Value = _next_tag;
                    getParent();
                    select_list();
                    item_list();
                }

                parent_id.Value = _parentid;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + "<br>" + ex.StackTrace.ToString());
                // throw ex;
            }
        }

        private void getParent()
        {
            string previous = _parentid;
            string site = "";
            string root = "";
            do
            {
                string sql = string.Format("select s.tw ,j.*from eipe.dbo.leica_join  j left join  eipe.dbo.Sys_Option s on j.item_id=s.rowid   where  j.rowid='{0}' and s.display='1' ", previous);
                
                using (SqlConnection con = new SqlConnection(DBTransfer.Constr1))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sql, con);
                    SqlDataReader rd = cmd.ExecuteReader();
                    previous = "";
                    if (rd.Read())
                    {
                        string name = rd["tw"].ToString();
                        previous = rd["parent_id"].ToString();
                        site = ">" + name + site;
                        root = previous;
                    }

                    con.Close();
                }

            }
            while (!string.IsNullOrEmpty(previous));


            string title = Utility.getSingle(string.Format("select en from  eipe.dbo.Sys_Option where rowid = '{0}' and display='1' ", string.IsNullOrEmpty(root) ? _parentid : root));


            lab_tag.Text = title + (string.IsNullOrEmpty(site) ? "" : site);
        }

        private void select_list()
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat(" select  s.rowid 'value',s.en, s.tw ,null 'def' from eipe.dbo.leica_join j ");
            sb.AppendFormat(" left join eipe.dbo.Sys_Option s on j.item_id=s.rowid where parent_id='{0}' and s.display='1' order by en ", _parentid);

            lb_select.Items.Clear();
            ListItem[] item = Utility.getOPItem(sb.ToString(), "", language.tw, false);
            
            lb_select.Items.AddRange(item);
            lb_select.Items.Remove(item[0]);
        }



        private void item_list()
        {

            StringBuilder sb = new StringBuilder();


            // sb.Append(" select  u.id 'value', u.name 'en',u.name 'tw',NULL 'def'  from eipa.dbo.dguser u ");
            sb.AppendFormat(" select rowid 'value', en, tw ,null 'def' from eipe.dbo.Sys_Option ");
            sb.AppendFormat(" where main='Leica' and kind='{0}' and display='1' and  rowid not in ( ", _next_tag);
            sb.AppendFormat("   select  item_id from eipe.dbo.leica_join  where parent_id='{0} ' ) order by en ", _parentid);
            
            lb_list.Items.Clear();
            ListItem[] item = Utility.getOPItem(sb.ToString(), "", language.tw, false);

            lb_list.Items.AddRange(item);
            lb_list.Items.Remove(item[0]);
            if (lb_list.Items.Count > 0)
            {
                lb_list.Items[0].Selected = true;
            }
        }

        protected void btn_sve_Click(object sender, EventArgs e)
        {

        }
    }
}