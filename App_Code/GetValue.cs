using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text.RegularExpressions;

using System.Web;



public class GetValue
{


    // ************* 取得角色類別 *************
     public string GetUserType(string UserID)
    {

        string strUserType;

        //建立資料庫連線
        SqlConnection conn1 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn1.Open();
        SqlCommand cmd1 = new SqlCommand("Select UserType From TreeUser Where UserID =@UserID", conn1);
        cmd1.Parameters.Add("@UserID", SqlDbType.NVarChar, 50).Value = UserID;
        SqlDataReader dr1 = cmd1.ExecuteReader();

        if (dr1.Read())
        {
            strUserType = dr1["UserType"].ToString().Trim();
        }
        else
        {
            strUserType = "Guest";
        }

        dr1.Dispose();
        cmd1.Dispose();
        conn1.Close();
        conn1.Dispose();

        // 回傳值
        return strUserType;
    }
    // ************* 取得角色類別 *************


    // ************* 取得角色權限 *************
    public string GetUserLimit(string UserID,string NodeID)
    {

        string strUserLimit;

        //建立資料庫連線
        SqlConnection conn2 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn2.Open();
        SqlCommand cmd2 = new SqlCommand("Select * From TreeNodeLimit Where UserID =@UserID and NodeID =@NodeID", conn2);
        cmd2.Parameters.Add("@UserID", SqlDbType.NVarChar, 50).Value = UserID;
        cmd2.Parameters.Add("@NodeID", SqlDbType.NVarChar, 50).Value = NodeID;
        SqlDataReader dr2 = cmd2.ExecuteReader();

        if (dr2.Read())
        {
            strUserLimit = "Yes";
        }
        else
        {
            strUserLimit = "No";
        }

        dr2.Dispose();
        cmd2.Dispose();
        conn2.Close();
        conn2.Dispose();

        // 回傳值
        return strUserLimit;
    }
    // ************* 取得角色權限 *************


    // ***************** 取得角色部門名稱 ****************
    public string GetUserDepartment(string UserID)
    {
        string UserDepartment;

        //建立資料庫連線
        SqlConnection conn3 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn3.Open();
        SqlCommand cmd3 = new SqlCommand("Select dggroup.name From dggroup,dguser Where dggroup.ID = dguser.gid  and  dguser.ID =@UserID", conn3);
        cmd3.Parameters.Add("@UserID", SqlDbType.NVarChar, 50).Value = UserID;
        SqlDataReader dr3 = cmd3.ExecuteReader();

        if (dr3.Read())
        {
            UserDepartment = dr3["name"].ToString();
        }
        else
        {
            UserDepartment = "無部門";
        }

        dr3.Dispose();
        cmd3.Dispose();
        conn3.Close();
        conn3.Dispose();
        // 回傳值
        return UserDepartment;
    }
    // **************** 取得角色部門名稱 ****************

    
    // ***************** 取得角色部門代碼 ****************
    public string GetUserDepartmentNo(string UserID)
    {
        string UserDepartmentNo;
        //建立資料庫連線
        SqlConnection conn3 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn3.Open();
        SqlCommand cmd3 = new SqlCommand("Select dggroup.id From dggroup,dguser Where dggroup.ID = dguser.gid  and  dguser.ID =@UserID", conn3);
        cmd3.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = UserID;
        SqlDataReader dr3 = cmd3.ExecuteReader();

        if (dr3.Read())
        {
            UserDepartmentNo = dr3["id"].ToString();
        }
        else
        {
            UserDepartmentNo = "無部門";
        }

        dr3.Dispose();
        cmd3.Dispose();
        conn3.Close();
        conn3.Dispose();

        // 回傳值
        return UserDepartmentNo;
    }
    // **************** 取得角色部門代碼 ****************




    // ************* 取得節點類型 *************
    public string GetNodeType(string NodeID)
    {
        string strNodeType;

        //建立資料庫連線
        SqlConnection conn4 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn4.Open();
        SqlCommand cmd4 = new SqlCommand("Select strType From TreeNode Where ID =@NodeID", conn4);
        cmd4.Parameters.Add("@NodeID", SqlDbType.NVarChar, 50).Value = NodeID;
        SqlDataReader dr4 = cmd4.ExecuteReader();

        if (dr4.Read())
        {
            strNodeType = dr4["strType"].ToString().Trim();
        }
        else
        {
            strNodeType = "Folder";
        }

        dr4.Dispose();
        cmd4.Dispose();
        conn4.Close();
        conn4.Dispose();

        // 回傳值
        return strNodeType;
    }
    // ************* 取得節點類型 *************



    // ************* 取得部門編號 *************
    public string GetempDept(string logonid)
    {
        string strDept;

        //建立資料庫連線

        SqlConnection conn5 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn5.Open();
        SqlCommand cmd5 = new SqlCommand("SELECT  lea_hm1emp10.dept_no  From lea_hm1emp10,dguser where lea_hm1emp10.emp_no = dguser.empid and dguser.logonid = @logonid", conn5);
        cmd5.Parameters.Add("@logonid", SqlDbType.NVarChar, 50).Value = logonid;
        SqlDataReader dr5 = cmd5.ExecuteReader();
        if (dr5.Read())
            strDept = dr5["dept_no"].ToString().Trim();
        else
            strDept = "XXX" ;

        dr5.Dispose();
        cmd5.Dispose();
        conn5.Close();
        conn5.Dispose();
        return strDept;  

        // 回傳值
    }
    // ************* 取得部門編號 *************



    // ***************** 取得角色 E-Mail ****************
    public string GetUserEmail(string UserID)
    {
        string UserEmail;
        //建立資料庫連線
        SqlConnection conn6 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn6.Open();
        SqlCommand cmd6 = new SqlCommand("Select dguser.id,dguser.email From dguser Where dguser.ID =@UserID", conn6);
        cmd6.Parameters.Add("@UserID", SqlDbType.NVarChar, 50).Value = UserID;
        SqlDataReader dr6 = cmd6.ExecuteReader();

        if (dr6.Read())
        {
            UserEmail = dr6["email"].ToString();
        }
        else
        {
            UserEmail = "";
        }

        dr6.Dispose();
        cmd6.Dispose();
        conn6.Close();
        conn6.Dispose();

        // 回傳值
        return UserEmail;
    }
    // **************** 取得角色 E-Mail ****************



    // ***************** 取得 樹狀名稱 ****************
    public string GetTreeName(string TreeNum)
    {
        //建立資料庫連線
        string TreeName;
        SqlConnection conn7 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn7.Open();
        SqlCommand cmd7 = new SqlCommand("Select PKey,TreeName  From ISO.dbo.TreeBase Where TreeNo =@TreeNum", conn7);
        cmd7.Parameters.Add("@TreeNum", SqlDbType.NVarChar, 50).Value = TreeNum;
        SqlDataReader dr7 = cmd7.ExecuteReader();
        if (dr7.Read())
            TreeName = dr7["TreeName"].ToString();
        else
            TreeName = "";

        dr7.Dispose();
        cmd7.Dispose();
        conn7.Close();
        conn7.Dispose();
        return TreeName;
        // 回傳值
    }
    // **************** 取得 樹狀名稱 ****************



    // ***************** 取得 樹狀權限 ****************
    public string GetTreeLimit(string UserID, string TreeNum)
    {
        //建立資料庫連線

        string TreeLimit;
        SqlConnection conn8 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn8.Open();
        SqlCommand cmd8 = new SqlCommand("Select PKey,UserType From iso.dbo.DCM_Limit Where UserLogID =@UserLogID and TreeNum =@TreeNum", conn8);
        cmd8.Parameters.Add("@UserLogID", SqlDbType.NVarChar, 50).Value = UserID;
        cmd8.Parameters.Add("@TreeNum", SqlDbType.NVarChar, 50).Value = TreeNum;
        SqlDataReader dr8 = cmd8.ExecuteReader();
        if (dr8.Read())
            TreeLimit = dr8["UserType"].ToString();
        else
            TreeLimit = "";
        dr8.Dispose();
        cmd8.Dispose();
        conn8.Close();
        conn8.Dispose();

        return TreeLimit;
        // 回傳值
    }
    // **************** 取得 樹狀權限 ****************



    // ************* 取得部門名稱 *************
    public string GetempDeptName(string logonid)
    {
        string DeptName;

        //建立資料庫連線

        SqlConnection conn9 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn9.Open();
        SqlCommand cmd9 = new SqlCommand("SELECT  lea_hm1dept10.dept_nm  From lea_hm1emp10,dguser,lea_hm1dept10 where lea_hm1emp10.emp_no = dguser.empid and lea_hm1dept10.dept_no = lea_hm1emp10.dept_no and dguser.logonid = @logonid", conn9);
        cmd9.Parameters.Add("@logonid", SqlDbType.NVarChar, 50).Value = logonid;
        SqlDataReader dr9 = cmd9.ExecuteReader();
        if (dr9.Read())
            DeptName = dr9["dept_nm"].ToString().Trim();
        else
            DeptName = "無部門";

        dr9.Dispose();
        cmd9.Dispose();
        conn9.Close();
        conn9.Dispose();

        return DeptName;

        // 回傳值
    }
    // ************* 取得部門名稱 *************




    // ***************** 取得登入ID E-Mail ****************
    public string GetlogonidEmail(string logonid)
    {
        //建立資料庫連線
        string GLUserEmail = "" ;
        SqlConnection conn10 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn10.Open();
        SqlCommand cmd10 = new SqlCommand("Select dguser.id,dguser.email From dguser Where dguser.logonid=@logonid", conn10);
        cmd10.Parameters.Add("@logonid", SqlDbType.NVarChar, 50).Value = logonid;
        SqlDataReader dr10 = cmd10.ExecuteReader();

        if (dr10.Read())
        {
            GLUserEmail = dr10["email"].ToString();
        }
        else
        {
            GLUserEmail = "";
        }

        dr10.Dispose();
        cmd10.Dispose();
        conn10.Close();
        conn10.Dispose();

        // 回傳值
        return GLUserEmail;
    }
    // **************** 取得登入ID E-Mail ****************


    
    // ***************** 取得登入ID 部門老大 E-Mail ****************
    public string GetlogonidBossEmail(string logonid)
    {
        //建立資料庫連線
        string GBEmail="";
        string GBgid = "";
        bool GBisCheck = false;

        SqlConnection conn11 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn11.Open();
        SqlCommand cmd11 = new SqlCommand(" Select dguser.logonid,dguser.email,dguser.gid From dguser where id = " +
                                                                      " (SELECT dggroup.uid from dguser,dggroup where dguser.gid= dggroup.id and dguser.logonid = '" + logonid + "')", conn11);
        SqlDataReader dr11 = cmd11.ExecuteReader();
        if (dr11.Read())
        {
            if (logonid.Trim().ToLower() != dr11["logonid"].ToString().ToLower().Trim())
            {
                GBisCheck = true;
                GBEmail = dr11["email"].ToString().Trim();
                GBgid = dr11["gid"].ToString().Trim();
            }
            else
            {
                GBEmail = dr11["email"].ToString().Trim();
                GBgid = dr11["gid"].ToString().Trim();
            }
        }
        dr11.Dispose();
        cmd11.Dispose();


        if (!GBisCheck)
        {
            SqlCommand cmd12 = new SqlCommand(" SELECT dguser.id,dguser.email FROM dguser,dggroup " +
                                                                           " WHERE dggroup.uid = dguser.id  and dggroup.id=(SELECT dggroup.pid from dggroup WHERE Cast(dggroup.id as nvarchar(50)) = '" + GBgid + "')", conn11);
            SqlDataReader dr12 = cmd12.ExecuteReader();
            if (dr12.Read())
            {
                    GBisCheck = true;
                    GBEmail = dr12["email"].ToString().Trim();
            }
            dr12.Dispose();
            cmd12.Dispose();
        }

        conn11.Close();
        conn11.Dispose();
        return GBEmail;     // 回傳值

    }
    // **************** 取得登入ID 部門老大E-Mail ****************



    // ***************** USERID 取得部門老大 E-Mail ****************
    public string GetUserIDBossEmail(string UserID)
    {
        //建立資料庫連線
        string GUEmail = "";
        string GUgid = "";
        bool GUisCheck = false;

        SqlConnection conn13 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn13.Open();
        SqlCommand cmd13 = new SqlCommand(" Select dguser.logonid,dguser.email,dguser.gid From dguser where id = " +
                                                                      " (SELECT dggroup.uid from dguser,dggroup where dguser.gid= dggroup.id and dguser.id = '" + UserID + "')", conn13);
        SqlDataReader dr13 = cmd13.ExecuteReader();
        if (dr13.Read())
        {
            if (UserID.Trim().ToLower() != dr13["logonid"].ToString().ToLower().Trim())
            {
                GUisCheck = true;
                GUEmail = dr13["email"].ToString().Trim();
                GUgid = dr13["gid"].ToString().Trim();
            }
            else
            {
                GUEmail = dr13["email"].ToString().Trim();
                GUgid = dr13["gid"].ToString().Trim();
            }
        }
        dr13.Dispose();
        cmd13.Dispose();


        if (!GUisCheck)
        {
            SqlCommand cmd14 = new SqlCommand(" SELECT dguser.id,dguser.email FROM dguser,dggroup " +
                                                                           " WHERE dggroup.uid = dguser.id  and dggroup.id=(SELECT dggroup.pid from dggroup WHERE Cast(dggroup.id as nvarchar(50)) = '" + GUgid + "')", conn13);
            SqlDataReader dr14 = cmd14.ExecuteReader();
            if (dr14.Read())
            {
                GUisCheck = true;
                GUEmail = dr14["email"].ToString().Trim();
            }
            dr14.Dispose();
            cmd14.Dispose();
        }

        conn13.Close();
        conn13.Dispose();
        return GUEmail;     // 回傳值

    }
    // **************** USERID 取得部門老大E-Mail ****************



    // ***************** 登入ID 取得部門老大 ID ****************
    public string GetlogonidBossID(string logonid)
    {
        //建立資料庫連線
        string GLBossID = "";
        string GLgid = "";
        bool GLisCheck = false;

        SqlConnection conn14 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn14.Open();
        SqlCommand cmd15 = new SqlCommand(" Select dguser.logonid,dguser.email,dguser.gid,dguser.id From dguser where id = " +
                                                                      " (SELECT dggroup.uid from dguser,dggroup where dguser.gid= dggroup.id and dguser.logonid = '" + logonid + "')", conn14);
        SqlDataReader dr15 = cmd15.ExecuteReader();
        if (dr15.Read())
        {
            if (logonid.Trim().ToLower() != dr15["logonid"].ToString().ToLower().Trim())
            {
                GLisCheck = true;
                GLBossID = dr15["id"].ToString().Trim();
                GLgid = dr15["gid"].ToString().Trim();
            }
            else
            {
                GLBossID = dr15["id"].ToString().Trim();
                GLgid = dr15["gid"].ToString().Trim();
            }
        }
        dr15.Dispose();
        cmd15.Dispose();

        if (!GLisCheck)
        {
            SqlCommand cmd16 = new SqlCommand(" SELECT dguser.id,dguser.email FROM dguser,dggroup " +
                                                                           " WHERE dggroup.uid = dguser.id  and dggroup.id=(SELECT dggroup.pid from dggroup WHERE Cast(dggroup.id as nvarchar(50)) = '" + GLgid + "')", conn14);
            SqlDataReader dr16 = cmd16.ExecuteReader();
            if (dr16.Read())
            {
                GLisCheck = true;
                GLBossID = dr16["id"].ToString().Trim();
            }
            dr16.Dispose();
            cmd16.Dispose();
        }

        conn14.Dispose();
        return GLBossID;     // 回傳值

    }
    // **************** 登入ID 取得部門老大ID ****************



    // ***************** UserID 取得部門老大 ID ****************
    public string GetUseridBossID(string Userid)
    {
        //建立資料庫連線
        string GUBossID = "";
        string GUgid = "";
        bool GUisCheck = false;

        SqlConnection conn14 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn14.Open();
        SqlCommand cmd15 = new SqlCommand(" Select dguser.logonid,dguser.email,dguser.gid,dguser.id From dguser where id = " +
                                                                      " (SELECT dggroup.uid from dguser,dggroup where dguser.gid= dggroup.id and dguser.id = '" + Userid + "')", conn14);
        SqlDataReader dr15 = cmd15.ExecuteReader();
        if (dr15.Read())
        {
            if (Userid.Trim().ToLower() != dr15["id"].ToString().ToLower().Trim())
            {
                GUisCheck = true;
                GUBossID = dr15["id"].ToString().Trim();
                GUgid = dr15["gid"].ToString().Trim();
            }
            else
            {
                GUBossID = dr15["id"].ToString().Trim();
                GUgid = dr15["gid"].ToString().Trim();
            }
        }
        dr15.Dispose();
        cmd15.Dispose();

        if (!GUisCheck)
        {
            SqlCommand cmd16 = new SqlCommand(" SELECT dguser.id,dguser.email FROM dguser,dggroup " +
                                                                           " WHERE dggroup.uid = dguser.id  and dggroup.id=(SELECT dggroup.pid from dggroup WHERE Cast(dggroup.id as nvarchar(50)) = '" + GUgid + "')", conn14);
            SqlDataReader dr16 = cmd16.ExecuteReader();
            if (dr16.Read())
            {
                GUisCheck = true;
                GUBossID = dr16["id"].ToString().Trim();
            }
            dr16.Dispose();
            cmd16.Dispose();
        }

        conn14.Dispose();
        return GUBossID;     // 回傳值

    }
    // **************** UserID 取得部門老大ID ****************



    // ***************** 取得登入ID 編碼 ****************
    public string GetUserdbID(string logonid)
    {
        //建立資料庫連線
        string UserdbID = "";
        SqlConnection conn15 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn15.Open();
        SqlCommand cmd17 = new SqlCommand("Select dguser.id,dguser.email From dguser Where dguser.logonid=@logonid", conn15);
        cmd17.Parameters.Add("@logonid", SqlDbType.NVarChar, 50).Value = logonid;
        SqlDataReader dr17 = cmd17.ExecuteReader();

        if (dr17.Read())
        {
            UserdbID = dr17["id"].ToString();
        }
        else
        {
            UserdbID = "";
        }

        dr17.Dispose();
        cmd17.Dispose();
        conn15.Close();
        conn15.Dispose();

        // 回傳值
        return UserdbID;
    }
    // **************** 取得登入ID 編碼 ****************



    // ***************** 取得登入loginID  ****************
    public string GetloginID(string UserID)
    {
        //建立資料庫連線
        string loginID = "";
        SqlConnection conn16 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn16.Open();
        SqlCommand cmd18 = new SqlCommand("Select dguser.id,dguser.logonid From dguser Where dguser.id=@UserID", conn16);
        cmd18.Parameters.Add("@UserID", SqlDbType.NVarChar, 50).Value = UserID;
        SqlDataReader dr18 = cmd18.ExecuteReader();
        if (dr18.Read())
        {
            loginID = dr18["logonid"].ToString();
        }
        else
        {
            loginID = "";
        }

        dr18.Dispose();
        cmd18.Dispose();
        conn16.Close();
        conn16.Dispose();

        // 回傳值
        return loginID;
    }
    // **************** 取得登入loginID  ****************

    // ***************** 取得登入者姓名  ****************
    public string GetUserName(string UserID)
    {
        //建立資料庫連線
        string UserName = "";
        SqlConnection conn17 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        conn17.Open();
        SqlCommand cmd19 = new SqlCommand("Select dguser.id,dguser.Name From dguser Where dguser.id=@UserID", conn17);
        cmd19.Parameters.Add("@UserID", SqlDbType.NVarChar, 50).Value = UserID;
        SqlDataReader dr19 = cmd19.ExecuteReader();
        if (dr19.Read())
        {
            UserName = dr19["Name"].ToString();
        }
        else
        {
            UserName = "";
        }

        dr19.Dispose();
        cmd19.Dispose();
        conn17.Close();
        conn17.Dispose();

        // 回傳值
        return UserName;
    }
    // **************** 取得登入loginID  ****************

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



    public void ShowEmg(string SEmg)
    {

        HttpContext.Current.Response.Write("<script type=\"text/javascript\">");
        HttpContext.Current.Response.Write("alert('" + SEmg + "');");
        HttpContext.Current.Response.Write("</script>");

    }

}
