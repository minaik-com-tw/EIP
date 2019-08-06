using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text.RegularExpressions;

using System.Web;



public class ProjectValue
{


    // ************* 取得專案編號 *************
     public string GetTreeNum(string TreeID)
    {
        string TreeNum;
        SqlConnection conn1 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPCConnectionString"].ConnectionString);
        conn1.Open();
        SqlCommand cmd1 = new SqlCommand("Select PKey,ProJectName,DBNum From eipc.dbo.ProJectFrom Where PID =@TreeID", conn1);
        cmd1.Parameters.Add("@TreeID", SqlDbType.NVarChar, 50).Value = TreeID;
        SqlDataReader dr1 = cmd1.ExecuteReader();

        if (dr1.Read())
            TreeNum = dr1["ProJectName"].ToString().Trim() + "(" + dr1["DBNum"].ToString().Trim() + ")";
        else
            TreeNum = "Null";

        dr1.Dispose();
        cmd1.Dispose();
        conn1.Close();
        conn1.Dispose();
        return TreeNum;
    }
    // ************* 取得專案編號 *************


    // ************* 取得節點編碼 *************
    public string GetTreePt(string NID)
    {
        string GetTreePt;
        SqlConnection conn1 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn1.Open();
        SqlCommand cmd1 = new SqlCommand("Select PKey,TreeNode From ProjectTree Where TreeText = '變更內容'  and  TreeID =@NID", conn1);
        cmd1.Parameters.Add("@NID", SqlDbType.NVarChar, 50).Value = NID;
        SqlDataReader dr1 = cmd1.ExecuteReader();

        if (dr1.Read())
            GetTreePt =  dr1["TreeNode"].ToString().Trim();
        else
            GetTreePt = "Null";

        dr1.Dispose();
        cmd1.Dispose();
        conn1.Close();
        conn1.Dispose();
        return GetTreePt;
    }
    // ************* 取得節點編碼 *************




    // ************* 去除Html *************
    public string GRemoveHTML(string strText)
    {
        string Cleanstring = "";
        if (string.IsNullOrEmpty(strText) == false)
        {
            Regex strRegEx = new Regex("<[^>]*>");
            strText = strText.Replace("&nbsp;", "");
            strText = strText.Replace("<br />", "");
            strText = strText.Replace("<p>", "");
            Cleanstring = strRegEx.Replace(strText, "");
        }
        return Cleanstring;
    }
    // ************* 去除Html *************
}
