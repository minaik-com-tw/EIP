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
using System.IO;

//using SmoothEnterprise.Configuration;
//using SmoothEnterprise.Web;
//using System.Web.Profile;
//using System.Web.SessionState;

public partial class Bulletin_AttachDownload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    
        
       SmoothEnterprise.Database.DataSet attch = new SmoothEnterprise.Database.DataSet();
        string rname = "UpName";
        string rattach = "UpFil";
        //string tableid = Request.QueryString["table"].ToString() ;//"csc_attachment";
        string pd,fid = "";
        int stp = 0;


        //attch.Open("SELECT " + rname + "," + rattach + " FROM "+tableid+" WHERE attid='" + 
        //base.Request.QueryString["attid"] +"'");

        attch.Open("select arguments from eipa.dbo.dgflowqueue where id='" + Request.QueryString["id"].ToString() + "'");

        while (!attch.EOF)
        {
             
            pd = attch["arguments"].ToString();
            fid = pd.LastIndexOf('.').ToString();
            stp = pd.LastIndexOf('.') + 1;
            fid = pd.Substring(stp, (pd.Length - pd.LastIndexOf('.') - 1));

            

            try
            {
                base.Response.AddHeader("content-disposition", "attachment;filename=" + Request.QueryString["id"].ToString()+".jpg");

            }
            catch
            {
                base.Response.AddHeader("content-disposition", "attachment;filename=down.");
            }

            Response.ContentType = "application/octet-stream";

            base.Response.BinaryWrite((byte[])attch["arguments"]);


            attch.MoveNext();
        }

        attch.Close();
 
        


    }

    private string ResFid(string p)
    {   string redstr="";
        switch (p)
        {
            
            case "PDF":
                redstr = "application/pdf";
                break;
            case "PPT":
                redstr = "application/vnd.ms-powerpoint";
                break;
            case "HTM":
            case "HTML":
                redstr  = "text/html";
                break;
            case "CSV":
            case "TXT":
                redstr  = "text/plain";
                break;
            case "DOC":
            case "DOCX":
                redstr = "application/msword";
                break;
            case "XLS":
            case "XLSX":
                redstr = "application/ms-excel";
                break;
            case "JPG":
                redstr = "image/jpeg";
                break;
            case "BMP":
                redstr = "image/bmp";
                break;
            case "GIF":
                redstr = "image/gif";
                break; 

            default:
                redstr = "application/unknown";
                break;


        }

        return redstr;
    }
             
        
    
}
