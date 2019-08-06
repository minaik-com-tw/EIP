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

namespace Option
{
    public partial class Option :SmoothEnterprise.Web.Page
    {
        string _type = "", _input = "", _limit = "";

        protected void Page_Load(object sender, System.EventArgs e)
        {  
            if (!this.IsPostBack)

            {
                cboType.Items.AddRange(IPQC_RaBase.getKind(_type));

                    
            }
            else
            {
                _type = cboType.SelectedValue;
                _input = txtName.Text;
            }
            
            _type = cboType.SelectedValue;
            

        }

        public virtual void Page_PreRender(object sender, System.EventArgs e)
        {
            this.KeepURL();
            this.Query();
        }

        public  void Query()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(" select  rowid,kind,en,tw,case when(def=1) then 'V' else '' end 'def',case when (display=1) then 'V' else '' end 'display' from eipe.dbo.IPQC_Ra_Option  where 1=1 and kind<>'Report' {0} order by def desc ,en  ");
            Limin();
            string sql = string.Format(sb.ToString(), _limit);
            DataList1.SQL = sql; 
          
        } 

        protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
        {   
            try
            {

                if (column.ID == "DataList1_edit")
                {
                    cell.OutputHTML = "<a href=\"OptionEdit.aspx?rowid=" + rs["rowid"].ToString() + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
                } 
            }
            catch (Exception ex)
            {
                this.AddError(this, "DataList1_OnRenderCell()", "", ex.Message);
            }
        }

       


        protected void Btn_Query_Click(object sender, EventArgs e)
        {
            
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        { 
            Response.Redirect("../Option/OptionAdd.aspx");
        }

        private void Limin()
        {
            StringBuilder sb = new StringBuilder();

            if (!string.IsNullOrEmpty(_input))
            {
                sb.AppendFormat(" and ( en like '%{0}%' or tw like '%{0}%') ", _input);
            }

            if (!string.IsNullOrEmpty(_type))
            {
                sb.AppendFormat(" and  kind='{0}' ", _type);
            }

            _limit = sb.ToString();
        }



    }
}
