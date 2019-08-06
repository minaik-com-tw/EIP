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

namespace Standard
{
    public partial class Standard : LeicaBase
    {
        string _standard = "";
        string _limit; 

        protected void Page_Load(object sender, System.EventArgs e)
        {
            msg.Value = "";
            _standard = Request.QueryString["standard_id"];
            if (!this.IsPostBack)
            {  
               lab_standard.Text =getStandrad(_standard);
                
            }
          
        }


        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            Query(0);
        }

        

        public void Query(int page)
        { 
            string sql = string.Format("select * from eipe.dbo.Leica_Standard where Standard_id='{0}' order by max  ", _standard);

            

            DataList1.SQL = sql;
        }
        
        protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
        {
            try
            { 

                if (column.ID == "edit")
                {
                    string html = string.Format("<a href='StandardEdit.aspx?rowid={0}'><img src='/Lib/img/icon-edit.gif' border='0'></a>",rs["rowid"]);
                    cell.OutputHTML = html;
                }

                if (column.ID == "del")
                {
                    cell.OutputHTML = "<input type=\"checkbox\" name=\"del_" + rs["rowid"].ToString() + "\" value=\"" + rs["rowid"].ToString() + "\" />";
                } 
            }
            catch (Exception ex)
            {
                this.AddError(this, "DataList1_OnRenderCell()", "", ex.Message);
            }
        }
 

       

        protected void Btn_Del_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(del_item.Value))
                {
                    DBTransfer exec = new DBTransfer();
                    string[] dels = del_item.Value.Split(',');

                    foreach (string item in dels)
                    {
                        exec.RunIUSql(" delete eipe.dbo.Leica_Standard where rowid='" + item + "' ");
                    }

                    msg.Value = "刪除成功";
                }
                else {
                    msg.Value = "請選擇刪除項目";
                }
            }
            catch (Exception ex )
            {
                Utility.log(0, ex.Message, ex.Source);
            }
        }



        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            _standard = Request.QueryString["standard_id"];
            Response.Redirect("StandardAdd.aspx?standard_id=" + _standard);
        }
    }
}
