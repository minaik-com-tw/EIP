using System.Text;

namespace Color
{
    public partial class Color : MABase
    {
        string _type = "", _input = "", _limit = "";

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (this.IsPostBack)

            {
                _input = txtName.Text.Trim();
            }

        }

        public virtual void Page_PreRender(object sender, System.EventArgs e)
        {
            this.KeepURL();
            this.Query();
        }

        public void Query()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(" select * from eipe.dbo.ipqc_ra_option o left join eipe.dbo.ipqc_ra_color  c on o.rowid=c.product_id where kind = 'Product Type' and display=1 ");
          

            if (!string.IsNullOrEmpty(_input))
            {
                sb.AppendFormat(" and ( en like '%{0}%' or tw like '%{0}%') ", _input);
            } 

            DataList1.SQL = sb.ToString();
            
        }

        protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
        {
            if (column.ID.ToUpper().Contains("EDIT"))
            {
                cell.OutputHTML = "<a href=\"" + getEdit + "?rowid=" + rs["rowid"] + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
            }

            //if (column.ID == "up")
            //{
            //    string color = "#000000";

            //    if (!string.IsNullOrEmpty(rs["upper"].ToString()))
            //    {
            //        color = rs["upper"].ToString();
            //    }

            //    cell.Value = "<font color=\"" + color + " \" >" + rs["up"] + "</font>";
            //}

            //if (column.ID == "down")
            //{

            //    string color = "#000000";

            //    if (!string.IsNullOrEmpty(rs["lower"].ToString()))
            //    {
            //        color = rs["lower"].ToString();
            //    }

            //    cell.Value = "<font color=\"" + color + " \" >" + rs["down"] + "</font>";
            //}
        }

       



    }
}
