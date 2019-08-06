using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ManagePDF
{

 public partial class PDFDownLoad : SmoothEnterprise.Web.Page

{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    private string db3 = ""; //db副2位置
    protected void Page_Load(object sender, EventArgs e)
    {
        if (base.Request.QueryString["ID"] != null)
        {


            try
            {
                if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
                {
                    db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                    db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                    db3 = "[barcode].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                }
                SmoothEnterprise.Database.DataSet attch = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                attch.Open("SELECT ID,FileBody,FileName FROM " + db1 + "shipment_File WHERE (ID = '" + Request.QueryString["ID"] + "')");

                if (!attch.EOF)
                {
                    try
                    {

                        base.Response.AddHeader("content-disposition", "attachment;filename=" + Server.UrlPathEncode(attch["FileName"].ToString()));

                    }
                    catch
                    {
                        base.Response.AddHeader("content-disposition", "attachment;filename=down.");
                        Response.Flush();
                        Response.End();
                    }

                    base.Response.BinaryWrite((byte[])attch["FileBody"]);
                    Response.Flush();
                    Response.End();
                                       
                }
                attch.Close();
                Response.End();
            }
            catch
            {
            }
        }
        else
        {
            Response.End();
        }

    }

}
}