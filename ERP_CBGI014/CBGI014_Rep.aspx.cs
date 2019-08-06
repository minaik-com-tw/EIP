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

public partial class CBGI014_Rep : SmoothEnterprise.Web.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        string htmstr = "<table width='800'><tr><td>部門</td><td>類別 </td><td>數量</td> <td>數量</td> <td>負責人員</td>  </tr></table>";
        
        
        Panel1.Controls.Add(new LiteralControl(htmstr));



    }
}