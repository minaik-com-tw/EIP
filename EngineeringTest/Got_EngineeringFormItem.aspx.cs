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
using System.Data.SqlClient;

public partial class PManagement_EngineeringFormItem : System.Web.UI.Page
{

    private string ConnStr;
    private SqlConnection Conn;
    private string ViewSQL;



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Detai_List= "";
            SqlConnection conn14 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
            conn14.Open();
            SqlCommand cmd15 = new SqlCommand("SELECT * FROM Engineeringtest_Item where aid = '" + Request.QueryString["ID"] + "'", conn14);
            SqlDataReader dr1 = cmd15.ExecuteReader();
            while (dr1.Read())
            {
                if (Detai_List == "")
                    Detai_List = dr1["strItem"].ToString().Trim() + "," + dr1["strDoc"].ToString().Trim() + "," + dr1["strProductNum"].ToString().Trim() ;
                else
                    Detai_List = Detai_List + "@@" + dr1["strItem"].ToString().Trim() + "," + dr1["strDoc"].ToString().Trim() + "," + dr1["strProductNum"].ToString().Trim() ;
            }
            dr1.Close();
            dr1.Dispose();
            cmd15.Cancel();
            cmd15.Dispose();
            Response.Write(Detai_List);
        }

       
    }

 
}
        
