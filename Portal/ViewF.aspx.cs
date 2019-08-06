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

public partial class Portal_ViewF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         #region ¶]°¨¿O

        SqlConnection messageConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        //"uid=smooth;pwd=mat2009;Data Source=EC;Initial Catalog=EIP;Integrated Security=True; Integrated Security=SSPI;");

        SqlCommand messageComm = new SqlCommand("select    top   3   id,left(subject,11)  from  bul_main   where   id   in   (select          id     from  dbo.bul_main where lclass='A0002' AND MCLASS='B0018')   order   by   id   desc", messageConn);

        string message = "";
        messageConn.Open();
        DataSet ds = new DataSet();
        SqlDataReader messageReader = messageComm.ExecuteReader(CommandBehavior.CloseConnection);
        message += "<table cellspacing='0' cellpadding='0' width='180' high='100' border='0'¡@>";
        while (messageReader.Read())
        {
            message += string.Format("<font size='2'><Image  src='img/123.gif' Width='12px' /> <a target='_BLANK' href=\"http://eip.minaik.com.tw/Bulletin/bulletinView.aspx?id={0}\" >{1}...</> </a>", messageReader[0], messageReader[1]);
            message += "<BR>";
        }
        messageReader.Dispose();
        messageConn.Dispose();
        message += "<a target='_BLANK' href=\"http://eip.minaik.com.tw/Bulletin/bulletind.aspx\"><font size='2'>>> more";
        message += "</table>";
        Response.Write(message);
        //Response.Write("<P ALIGN='RIGHT'><a href=\"ViewTest.aspx?id={0}\"><font size='1'>more");
        ////Literal1.Text = message;
        #endregion
        
    }
}
