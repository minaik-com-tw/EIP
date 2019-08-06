using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text.RegularExpressions;

using System.Web;



public class GetCheck
{
    public void ShowEmg(string UserID,string StrUrl)
    {

        bool isShowEmg = false;

        string GetSQL = " Select id From dgflowqueue Where revieweruid = '" + UserID + "'" +
                        " and requesturl like '%" + StrUrl + "%' AND (resulttype = 'Next' OR resulttype = 'Complete')";

       
        //建立資料庫連線
        SqlConnection conn1 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn1.Open();
        SqlCommand cmd1 = new SqlCommand(GetSQL, conn1);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read())
        {
            isShowEmg = true;
        }
        dr1.Dispose();
        cmd1.Dispose();


        if (!isShowEmg)
        {
            string GetSQL2 = " Select id From dgflowlog Where revieweruid = '" + UserID + "'" +
                             " and requesturl like '%" + StrUrl + "%' AND (resulttype = 'Next' OR resulttype = 'Complete')";
            SqlCommand cmd2 = new SqlCommand(GetSQL2, conn1);
            SqlDataReader dr2 = cmd2.ExecuteReader();
            if (dr2.Read())
            {
                isShowEmg = true;
            }
            dr2.Dispose();
            cmd2.Dispose();
        }

        conn1.Close();
        conn1.Dispose();

        if (isShowEmg)
        {
            HttpContext.Current.Response.Write("<script type=\"text/javascript\">");
            HttpContext.Current.Response.Write("alert('您好!! 此單據您已以審核過');");
            HttpContext.Current.Response.Write("</script>");
        }
    }

}
