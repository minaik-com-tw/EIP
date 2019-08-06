<%@ WebHandler Language="C#" Class="Supplier" Debug="true" %>

using System;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;

public class Supplier : IHttpHandler
{

    string _plant = "";
    public void ProcessRequest(HttpContext context)
    {
        string _name = context.Request.Form["name"];
           _plant =context.Request.Form["plant"];

            
        if (!string.IsNullOrEmpty(_name))
        {
            Query(_name);
        }


        context.Response.ContentType = "text/plain";

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    private void Query(string name)
    {

        //2017/12/01 因為資料不同步的問題，造成廠商代碼重覆，所以合併 EIP & ERP 的 TABLE做查詢 carol
        //// string SQLCommand = "SELECT id, logonid, name, email FROM dguser Where 1 = 1";
        // string SQLCommand = " SELECT pmc03,pmc01   FROM [IP185].[MINAIK].[dbo].[PMC_FILE]    where (  pmc01 like '"+name+"%' or  "+
        //     "    pmc03 like '" + name + "%') ";


        //2017/12/01 add by carol
        StringBuilder sb = new StringBuilder();
        sb.Append(" select distinct   PMC01,PMC03 from ( ");
        sb.Append(" select PMC01 COLLATE Chinese_Taiwan_Stroke_CI_AS 'PMC01'  ");
        sb.Append(" ,PMC03 COLLATE Chinese_Taiwan_Stroke_CI_AS 'PMC03' ");
        sb.AppendFormat(" ,'ERP' kind from [IP185].[MINAIK].[dbo].[PMC_FILE]  ",_plant);
        sb.Append(" UNION ALL select PMCA01 'PMC01' ,PMCA03 'PMC03','EIP' kind  ");
        sb.AppendFormat(" from eipb.dbo.APMI610_IN where PlantID='{0}' ) g1 ",_plant);
        sb.AppendFormat("where (  pmc01 like '{0}%' or pmc03 like '{0}%') and len(PMC01)>0 and PMC03 is not null  order by PMC01 ", name);

                 System.Web.HttpContext.Current.Response.Write(sb.ToString() + "<br>");
            

        DataTable dt = new DataTable();
        using (SqlConnection sc = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
        {
            SqlCommand scommand = new SqlCommand(sb.ToString(), sc);
            SqlDataAdapter sa = new SqlDataAdapter(scommand);
            try
            {
                sa.Fill(dt);
                sc.Close();
                sc.Dispose();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message + "<br>" + sb.ToString());
            }

        }
        System.Web.HttpContext.Current.Response.Write(dt.Rows.Count);

    }

}