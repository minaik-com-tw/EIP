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

public partial class MISReport_WFHDel : System.Web.UI.Page
{
    string SendObjID = string.Empty;  

     protected void Page_Load(object sender, EventArgs e)  
     {
          
         string str = "delete from [EIPB].[dbo].[upload_attachment] WHERE attid='" + Request.QueryString["attid"].ToString() + "'";
         
         DBTransfer RunCommand = new DBTransfer();
         RunCommand.RunIUSql(str);

         // if (Request.QueryString["W"].ToString() == "Edit")
         Response.Redirect("/ERP_APMI610/APMI610Edit.aspx?rowid=" + Request.QueryString["rowid"]);      
           

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
}
