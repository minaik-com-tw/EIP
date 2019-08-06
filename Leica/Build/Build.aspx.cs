using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Data.SqlClient;

namespace Build
{
    public partial class Build : LeicaBase
    {
        string _program = "";
        string _menu = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            lang = CurrLang;
            //getProgram(ddl_program); 
            if (!IsPostBack)
            {
                getMenu(ddl_menu); 
                Btn_Del.Visible = Utility.MIS_Manager(CurrentUser.LogonID);
                
            }
            else
            {
                // _program = ddl_program.SelectedValue;
                _menu = ddl_menu.SelectedValue;
            } 
        }

        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            Query();
        }

        private void Query()
        { 
            string limnit = "";
            if (!string.IsNullOrEmpty(_menu))
            {
                limnit = string.Format("and s.Kind='{0}'", _menu);
            } 

            StringBuilder sb = new StringBuilder();
            sb.Append(" select s.rowid,s.main,c.name 'category' ,c.tag,en,s.tw,case when( def=1) then 'V' else '' end 'def', case when( display=0) then 'V' else '' end 'display' from eipe.dbo.Sys_Option s ");
            sb.Append(" left join eipe.dbo.SYS_Category c on c.name=s.kind and c.program='Leica' ");
            sb.AppendFormat(" where main = 'Leica' {0} order by  tag ", limnit);
            
            DataList1.SQL = sb.ToString();
            
        }
          
   

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            Response.Redirect("buildAdd.aspx");
        }
         
        protected void DataList1_OnRenderCell(object sender, DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, EventArgs e)
        { 
            if (column.ID.ToUpper() == "DEL")
            {
                cell.OutputHTML = List_Del(column.ID, rs["rowid"].ToString(), true);
            }

            if (column.ID.ToUpper() == "EDIT")
            {
                cell.OutputHTML = List_Edit(column.ID, rs["rowid"].ToString(), true);
            }

            if (column.ID== "en")
            {
                string kind = rs["category"].ToString();

                string link = rs["en"].ToString();
                if (kind == "sp_standard" || kind == "ts_standard")
                {
                     link = string.Format("<a href='../Standard/Standard.aspx?standard_id={0}' >{1}</a>", rs["rowid"].ToString(),rs["en"].ToString());
                    
                }

                cell.OutputHTML = link;

            }
        }


        protected void Btn_Visable_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(del_item.Value))
            {
                string[] del = del_item.Value.Split(',');

                DBTransfer db = new DBTransfer();
                foreach (string d in del)
                {
                    string update = string.Format("update eipe.dbo.Sys_Option set display=0 where rowid='{0}' and main='Leica'", d);

                    
                    db.RunIUSql(update);
                }
            }
        }

        protected void Btn_Del_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(del_item.Value))
            {
                string[] del = del_item.Value.Split(',');

                DBTransfer db = new DBTransfer();
                foreach (string d in del)
                {
                    string update = string.Format("delete  eipe.dbo.Sys_Option where  rowid='{0}' and main='Leica'", d);
                    db.RunIUSql(update);
                }
            }
        }

        protected void Btn_Show_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(del_item.Value))
            {
                string[] del = del_item.Value.Split(',');

                DBTransfer db = new DBTransfer();
                foreach (string d in del)
                {
                    string update = string.Format("update eipe.dbo.Sys_Option set display=1 where rowid='{0}' and main='Leica'", d); 
                    db.RunIUSql(update);
                }
            }
        }
    }
}
