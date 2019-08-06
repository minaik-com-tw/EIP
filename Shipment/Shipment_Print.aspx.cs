using System;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;

public partial class EMP_ADDReport : SmoothEnterprise.Web.Page
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    private string db3 = ""; //db副2位置

    private ReportDocument myReportDocument = new ReportDocument();


    protected void Page_Load(object sender, EventArgs e)
    {
        CrystalReportViewer1.DisplayPage = true;
        if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
        {
            db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
            db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
            db3 = "[barcode].[dbo]."; //如果不是在Ann本機, 則指定資料庫 

        }

        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rs.Open("select min(item) minitem,packing from " + db1 + "shipment_body where aid='" + Request.QueryString["id"] + "' group by packing");
        if (!rs.EOF)
        {
            this.QUERY_ITEM.Text = rs["minitem"].ToString();
        }

        if (!IsPostBack)
        {
            CrystalReportViewer1.DisplayPage = false;
        }
        else
        {
            query();
        }
        myReportDocument.Load(Server.MapPath("shipment_print.rpt"));

        TableLogOnInfo logoninfo;
        foreach (CrystalDecisions.CrystalReports.Engine.Table mytable in myReportDocument.Database.Tables)
        {
            logoninfo = mytable.LogOnInfo;
            logoninfo.ConnectionInfo.ServerName = "192.168.0.238";
            logoninfo.ConnectionInfo.DatabaseName = "EIPB";
            logoninfo.ConnectionInfo.UserID = "smooth";
            logoninfo.ConnectionInfo.Password = "mat2009";

            mytable.ApplyLogOnInfo(logoninfo);
        }

        CrystalReportViewer1.ReportSource = myReportDocument;
        CrystalReportViewer1.RefreshReport();

    }

    protected void InputButton1_Click(object sender, EventArgs e)
    {
        try
        {
            query();
        }
        catch (Exception ex)
        {
            this.AddError(sender, "InputButton1_Click", "", "請檢查一下輸入的數值是否有誤");
        }


    }

    private void query()
    {

        string tempsql = "";
        string sql = "";

        string PCS1 = this.QUERY_PCS1.Text;
        string CARTON1 = this.QUERY_CARTNO1.Text;
        string PCS2 = this.QUERY_PCS2.Text;
        string CARTON2 = this.QUERY_CARTNO2.Text;



        if (QUERY_PCS1.Text.Trim() == "") PCS1 = "0";
        if (QUERY_CARTNO1.Text.Trim() == "") CARTON1 = "0";
        if (QUERY_PCS2.Text.Trim() == "") PCS2 = "0";
        if (QUERY_CARTNO2.Text.Trim() == "") CARTON2 = "0";

        try
        {
            sql = "declare @tab table ( " +
                "loc nvarchar(200), " +
                "c_po nvarchar(50), " +
                "dwg nvarchar(50), " +
                "component nvarchar(70), " +
                "qty float, " +
                "purpose2 nvarchar(100), " +
                "customer nvarchar(50), " +
                "c_demand2 datetime, " +
                "NUM   int) " +
                "insert @tab  " +
                "select loc,c_po,dwg,component,'" + PCS1.ToString() + "',purpose2,customer,c_demand2 ," + CARTON1.ToString() + " " +
                "from" + db1 + "shipment_head a left join" + db1 + "shipment_body  b on a.id=b.aid  " +
                "where id='" + Request.QueryString["id"] + "' and item='" + this.QUERY_ITEM.Text.ToString() + "' " +
                "union all " +
                "select loc,c_po,dwg,component,'" + PCS2.ToString() + "',purpose2,customer,c_demand2 ," + CARTON2.ToString() + " " +
                "from" + db1 + "shipment_head a left join" + db1 + "shipment_body  b on a.id=b.aid  " +
                "where id='" + Request.QueryString["id"] + "'  and item='" + this.QUERY_ITEM.Text.ToString() + "'; " +
                "WITH CTE AS ( " +
                "select loc,c_po,dwg,component,qty,purpose2,customer,c_demand2 ,NUM=NUM-1 " +
                "FROM @TAB " +
                "WHERE NUM>0 " +
                "UNION ALL " +
                "select loc,c_po,dwg,component,qty,purpose2,customer,c_demand2 ,NUM=NUM-1 " +
                "FROM CTE " +
                "WHERE NUM>0 ) " +
                "SELECT loc,c_po,dwg,component,qty,purpose2,customer,CONVERT(varchar(12) , c_demand2, 111 ) c_demand2,'" + this.QUERY_Attn.Text + "' attn  FROM CTE " +
                "ORDER BY qty desc ";
            tempsql = sql;
            if (this.CurrentUser.LogonID.ToString().ToUpper().Contains("A3409158-8CFA-4857-9B54-1962306E0010"))
            {
                Response.Write(sql);
            }
            string DBConfig_sql = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString;

            DataSet ds = new DataSet();
            SqlConnection sqlCon = new SqlConnection(DBConfig_sql);
            SqlDataAdapter sqlAd = new SqlDataAdapter();
            SqlCommand sqlCmd = new SqlCommand(sql, sqlCon);
            sqlAd.SelectCommand = sqlCmd;
            sqlAd.Fill(ds, "sql");

            myReportDocument.Load(Server.MapPath("shipment_print.rpt"));

            myReportDocument.SetDataSource(ds.Tables["sql"]);
            CrystalReportViewer1.ReportSource = myReportDocument;
            CrystalReportViewer1.RefreshReport();
        }
        catch (SqlException ex)
        {
            Response.Write(sql + "<br>");
            Response.Write(ex.Message + "<br>");
            throw ex;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "<br>");
            throw ex;
        }
    }



    protected void Page_UnLoad(object sender, EventArgs e)
    {
        if (myReportDocument != null)
        {
            myReportDocument.Close();
            myReportDocument.Dispose();
        }

    }
    protected void CrystalReportViewer1_Unload(object sender, EventArgs e)
    {
        if (myReportDocument != null)
        {
            myReportDocument.Close();
            myReportDocument.Dispose();
        }

    }


}