using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class UI_TEST_Getid2 : System.Web.UI.Page
{
    string _name = "";
    string _plant = "MINAIK";
    int _page = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        /**
         * 2017/12/01 del by carol         
        this.SqlDataSource1.SelectCommand = GetSQLstring(userName.Text);
        * **/

        _plant = Request.QueryString["plant"];
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        /**
         * 2017/12/01 del by carol         
        string name = this.userName.Text;
        this.SqlDataSource1.SelectCommand = GetSQLstring(name);
         this.GridView1.DataBind();
       // Response.Write(GetSQLstring(group, name));
        * **/

    }

    protected void Page_PreRender(object sender, System.EventArgs e)
    {

        _name = userName.Text.Trim();
        
        Query(_page);
    }

    /* 2017/12/01 del by carol         
   public string GetSQLstring( string name)
   {

      // string SQLCommand = "SELECT id, logonid, name, email FROM dguser Where 1 = 1";
       string SQLCommand = " SELECT pmc03,pmc01   FROM [IP185].[MINAIK].[dbo].[PMC_FILE]    where (  pmc01 like '"+name+"%' or  "+
           "    pmc03 like '" + name + "%') ";                 
      return SQLCommand;

   }
   */

    private void Query(int page)
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
        sb.AppendFormat(" ,'ERP' kind from [IP185].[{0}].[dbo].[PMC_FILE]  ", _plant);
        sb.Append(" UNION ALL select PMCA01 'PMC01' ,PMCA03 'PMC03','EIP' kind  ");
        sb.AppendFormat(" from eipb.dbo.APMI610_IN where PlantID='{0}'  ) g1 ", _plant);
//        sb.AppendFormat("where (  pmc01 like '{0}%' or pmc03 like '{0}%')  order by PMC01 ", _name);
        sb.AppendFormat("where (  pmc01 like '{0}%' or pmc03 like '{0}%') and len(PMC01)>0 and PMC03 is not null  order by PMC01 ", _name);

        using (SqlDataSource Conn = new SqlDataSource())
        {
            Conn.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString;
            {
                Conn.SelectCommand = sb.ToString();

                Conn.DataSourceMode = SqlDataSourceMode.DataSet;

                DataSourceSelectArguments args = new DataSourceSelectArguments();

                DataView dv = (DataView)Conn.Select(args);

                GridView1.PageIndex = page;
                GridView1.DataSource = dv;
                GridView1.DataBind();
                Session["Page"] = page;

                Conn.Dispose();
            }
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        _page = e.NewPageIndex;
    }
}
