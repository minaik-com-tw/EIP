using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DBTransfer
/// </summary>
public class DBTransfer
{
	 
		//public static string Constr1 = "Data Source=WEB242;Initial Catalog=EIPA;Persist Security Info=True;User ID=smooth;Password=mat2009";
        public static string Constr1=System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString; 
		
        public void RunIUSql(string sql)
        {
            SqlConnection conn1 = new SqlConnection(Constr1);
            conn1.Open();

            SqlCommand query = new SqlCommand(sql, conn1);
            query.ExecuteNonQuery();
            conn1.Close();


        }

        public float GetCount(string sql)
        {
            float revalue = 0;
            SqlConnection conn1 = new SqlConnection(Constr1);
            conn1.Open();
            SqlCommand sqlc = new SqlCommand(sql, conn1);
            
            SqlDataReader dr = sqlc.ExecuteReader();
            while (dr.Read())
            {
                revalue = float.Parse(dr[0].ToString());
            }
            return revalue;

            conn1.Close();

            

        }
    
        public string GetTopfile(string sql)
       {
           string revalue = "";
            SqlConnection conn1 = new SqlConnection(Constr1);
            conn1.Open();
            SqlCommand sqlc = new SqlCommand(sql, conn1);

            SqlDataReader dr = sqlc.ExecuteReader();
            while (dr.Read())
            {
                revalue =dr[0].ToString();
            }
            return revalue;

            conn1.Close();

        }
	 
    
}
