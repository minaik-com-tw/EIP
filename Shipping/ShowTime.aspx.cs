using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class Shipping_ShowTime : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.SqlDataSource1.SelectCommand = GetSQLstring();
        }

    }

    public string GetSQLstring()
    {
        string SQLCommand = "SELECT * FROM Forwarder_log Where 1 = 1";

        if (!String.IsNullOrEmpty(Request.QueryString["INV"]))  
        {
            SQLCommand = SQLCommand + " and  (INV_Num = '" + Request.QueryString["INV"] + "')";
        }
        return SQLCommand;
    }

}
