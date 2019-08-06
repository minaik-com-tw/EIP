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
using System.Data.SqlClient;

public partial class Portal_ViewNew2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        #region ¶]°¨¿O
        SqlConnection messageConn = new SqlConnection("uid=smooth;pwd=mat2009;Initial Catalog=EIP;Data Source=web242; ");
        //"uid=smooth;pwd=mat2009;Data Source=EC;Initial Catalog=EIP;Integrated Security=True; Integrated Security=SSPI;");

        SqlCommand messageComm = new SqlCommand("select     top   3   id,subject   from  bul_main   where   id   in   (select          id     from  dbo.bul_main)   order   by   id   desc", messageConn);

        string message = "";
        messageConn.Open();
        DataSet ds = new DataSet();
        SqlDataReader messageReader = messageComm.ExecuteReader(CommandBehavior.CloseConnection);
        message += "<table cellspacing='0' cellpadding='0' width='190' high='150' border='0'¡@>";
        while (messageReader.Read())
        {

            message += string.Format("<a href=\"ViewTest.aspx?id={0}\" ><font size='2'>{1}</>", messageReader[0], messageReader[1]);
            message += "<BR>";
        }
        messageReader.Dispose();
        messageConn.Dispose();
        message += "</table>";
        Response.Write(message);
        ////Literal1.Text = message;
        #endregion   
    }
}
