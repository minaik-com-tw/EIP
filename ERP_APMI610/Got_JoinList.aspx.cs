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

public partial class PManagement_JoinList : System.Web.UI.Page
{

    private string ConnStr;
    private SqlConnection Conn;
    private string ViewSQL;



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Detai_List= "";
            string SQLCode = "";

            //if (!string.IsNullOrEmpty(Request.QueryString["PID"]))
            //    SQLCode = "SELECT deptName,strName,strLogin,strLevel FROM ProJect_JoinList Where  PID = '" + Request.QueryString["PID"] + "' and DocType = '207ce0e4-77fc-4c11-8df9-e64a8ac56347'  Group by  deptName,strName,strLogin,strLevel order by deptName,strLogin";
            //else
            SQLCode = "SELECT  sn,type,Tman,TEL,main,remark,email  FROM EIPB.dbo.APMI610_IN_detail where sn='" + Request.QueryString["sn"] + "'";
            
            
            //SELECT * FROM ProJect_JoinList Where  DocID = '" + Request.QueryString["ID"] + "'";


            SqlConnection conn14 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPCConnectionString"].ConnectionString);
            conn14.Open();
            SqlCommand cmd15 = new SqlCommand(SQLCode, conn14);
            SqlDataReader dr1 = cmd15.ExecuteReader();
            while (dr1.Read())
            {
                if (Detai_List == "")
                    Detai_List = dr1["type"].ToString().Trim() + "," + dr1["tman"].ToString().Trim() + "," + dr1["TEL"].ToString().Trim() + "," + dr1["main"].ToString().Trim() + "," + dr1["remark"].ToString().Trim() + "," + dr1["email"].ToString().Trim();
                else
                    Detai_List = Detai_List + "@@" + dr1["type"].ToString().Trim() + "," + dr1["tman"].ToString().Trim() + "," + dr1["TEL"].ToString().Trim() + "," + dr1["main"].ToString().Trim() + "," + dr1["remark"].ToString().Trim() + "," + dr1["email"].ToString().Trim();
            }
            dr1.Close();
            dr1.Dispose();
            cmd15.Cancel();
            cmd15.Dispose();
            Response.Write(Detai_List);
        }

       
    }

 
}
        
