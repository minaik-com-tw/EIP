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
using System.IO;
using System.Drawing;
using System.Collections.Specialized;



public partial class Portal_PeopleNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Response.Write("福委會專區    ");
        //Response.Write("<image>");
        #region 跑馬燈
        string imgid = Request.QueryString["imgid"];

        string connstr = ((NameValueCollection)

        Context.GetConfig("appSettings"))["connstr"]; 
        SqlConnection messageConn = new SqlConnection("uid=smooth;pwd=mat2009;Initial Catalog=EIP;Data Source=192.168.0.200; ");
        //"uid=smooth;pwd=mat2009;Data Source=EC;Initial Catalog=EIP;Integrated Security=True; Integrated Security=SSPI;");

        SqlCommand messageComm = new SqlCommand("select       attachments   from  bul_main   where   id   in   (select          id     from  dbo.bul_main where id=5) ", messageConn);

        string message = "";
        messageConn.Open();
        SqlDataReader messageReader = messageComm.ExecuteReader();
       // message += "<table cellspacing='0' cellpadding='0' width='190' high='150' border='0'　>";
        if (messageReader.Read())
        {
            


            Response.BinaryWrite((byte[])messageReader["image"]);
           

            //Response.Write(messageReader[0]);

        }
        //messageReader.Dispose();
        //messageConn.Dispose();
        //message += "</table>";
        //Response.Write(message);
        ////Literal1.Text = message;
        messageConn.Close();
        #endregion   



    }
}
