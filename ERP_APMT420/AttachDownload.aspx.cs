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
using System.Data.OleDb;

//using SmoothEnterprise.Configuration;
//using SmoothEnterprise.Web;
//using System.Web.Profile;
//using System.Web.SessionState;

public partial class Bulletin_AttachDownload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (base.Request.QueryString["bulid"] != null)
        //{
        //    try
        //    {
        //        OleDbConnection connection = new OleDbConnection("Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Data Source=RITALIU-V\\SQLEXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=RITALIU-V;Use Encryption for Data=False;Tag with column collation when possible=False;Initial Catalog=c02;" );
        //        OleDbCommand command = new OleDbCommand("SELECT id,rfilename,attachments FROM bul_main WHERE id='" + base.Request.QueryString["bulid"] + "'", connection);
        //        connection.Open();
        //        OleDbDataReader reader = command.ExecuteReader();
        //        if (reader.Read())
        //        {
        //            try
        //            {
        //                base.Response.AddHeader("content-disposition", "attachment;filename=" + Server.UrlPathEncode(reader["rfilename"].ToString()));
        //            }
        //            catch
        //            {
        //                base.Response.AddHeader("content-disposition", "attachment;filename=down.");
        //            }
        //            base.Response.BinaryWrite((byte[])reader["attachments"]);
        //        }
        //        connection.Close();
        //    }
        //    catch
        //    {
        //    }
        //}

        if (base.Request.QueryString["bulid"] != null)
        {
            string rname = "filename" + Request.QueryString["atnu"].ToString();
            string rattach = "attachment" + Request.QueryString["atnu"].ToString();
            try
            {
                SmoothEnterprise.Database.DataSet attch = new SmoothEnterprise.Database.DataSet();

                attch.Open("SELECT id,filename1,filename2,filename3,filename4,filename5,filename6,attachment1,attachment2,attachment3,attachment4,attachment5,attachment6 FROM apmt420_in_head WHERE id='" + base.Request.QueryString["bulid"] + "'");

                while (!attch.EOF)
                {
                    try
                    {
                        //base.Response.AddHeader("content-disposition", "attachment;filename=" + Server.UrlPathEncode(attch["rfilename"].ToString()));
                        base.Response.AddHeader("content-disposition", "attachment;filename=" + Server.UrlPathEncode(attch[rname].ToString()));
                    }
                    catch
                    {
                        base.Response.AddHeader("content-disposition", "attachment;filename=down.");
                    }
                    //base.Response.BinaryWrite((byte[])attch["attachments"]);
                    base.Response.BinaryWrite((byte[])attch[rattach]);
                    attch.MoveNext();
                }

                attch.Close();
            }
            catch
            {
            }
        }
    }
}
