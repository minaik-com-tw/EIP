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
using CrystalDecisions.CrystalReports.Engine;

public partial class CXMT310_Report1 : SmoothEnterprise.Web.Page 
{
    ReportDocument myReportDoc = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rs.Open("SELECT no from [EIPB].[dbo].cxmt310_in_head where id='" + Request.QueryString["id"] + "' ");
        if (!rs.EOF)
        {
            string sql;
            sql = "EXEC CXMT310_Report1 '"+rs["no"].ToString()+"'";
            string DBConfig_sql = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString;


            DataSet ds = new DataSet();
            SqlConnection sqlCon = new SqlConnection(DBConfig_sql);
            SqlDataAdapter sqlAd = new SqlDataAdapter();
            SqlCommand sqlCmd = new SqlCommand(sql, sqlCon);


            sqlAd.SelectCommand = sqlCmd;
            sqlAd.Fill(ds, "sql");
            CrystalReportSource1.ReportDocument.Load(Server.MapPath("CXMT310_Report1.rpt"));
            CrystalReportSource1.ReportDocument.SetDataSource(ds.Tables["sql"]);
            CrystalReportSource1.DataBind();
            CrystalReportViewer1.ReportSource = CrystalReportSource1;

        }

        CrystalReportViewer1.DisplayGroupTree = false; 


    }

    protected void Page_Unload(object sender, EventArgs e)
    {
        if (myReportDoc == null)
            return;
        else
        {
            myReportDoc.Close();
            myReportDoc.Dispose();
            CrystalReportViewer1.Dispose();
        }
    }
}