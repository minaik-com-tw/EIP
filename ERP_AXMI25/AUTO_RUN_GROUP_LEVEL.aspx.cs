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

public partial class ERP_AXMI25_AUTO_RUN_GROUP_LEVEL : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs.ExecuteNonQuery("EIPB.DBO.DG_GROUP_LEVEL_SP");
            rs.Close();
            rs.Dispose();
        }
        catch
        {
        }
    }
}
