using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Drawing;

/// <summary>
/// 共用程式
/// create by carol  20170209
/// </summary>
public static class Utility
{
    /// <summary>
    ///  Report  Domain Name
    /// </summary>
    public static string ReportUrl = "http://rs.minaik.com.tw";

    /// <summary>
    /// report 2 使用reportview v10 re
    /// 主要是用來輸出 rdlc 需要使用excel分頁
    /// </summary>
    public static string Report2Url = "http://192.168.0.182:9001";

    /// <summary>
    /// local Domain Name
    /// </summary>
    //public static string LocalUrl = "http://eip.minaik.com.tw";

    /// <summary>
    /// local Domain Name
    /// </summary>
    public static string LocalUrl
    {
        get
        {
            //string url = Request.Url.Authority;
            //System.Web.HttpContext.Current.Response.Write(str + "<br>");
            string url = "http://" + System.Web.HttpContext.Current.Request.Url.Authority;
            return url;
        }
    }

    public static string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString;

    public static string MIS_Mail
    {
        get
        {
            string MIS = System.Web.Configuration.WebConfigurationManager.AppSettings["MIS"].ToString();

            string[] List = MIS.Split(',');
            string Mails = "";

            //foreach (string logonid in List)
            //{
            //    if (!string.IsNullOrEmpty(Mails))
            //    {
            //        Mails += logonid + ",";
            //    }

            //    Mails += logonid + "@minaik.com.tw";

            //}
            int i = 0;
            foreach (string user in List)
            {
                List[i] = string.Format("{0}@minaik.com.tw", user);
                i++;
            }

            Mails = string.Join(",", List);
            return Mails;
        }
    }

    public static string[] MIS
    {
        get
        {
            string user = System.Web.Configuration.WebConfigurationManager.AppSettings["MIS"].ToString();
            string[] List = user.Split(',');

            return List;
        }
    }


    /// <summary>
    /// check currect User is MiS
    /// </summary>
    /// <param name="currLogonid">current user logonid</param>
    /// <returns></returns>
    public static bool MIS_Manager(string currLogonid)
    {
        bool isPass = false;
        string Mail = System.Web.Configuration.WebConfigurationManager.AppSettings["MIS"].ToString();
        string[] List = Mail.Split(',');

        foreach (string address in List)
        {
            if (address.ToUpper() == currLogonid.ToUpper())
            {
                isPass = true;
                break;
            }
        }

        return isPass;
    }

    /// <summary>
    /// 加入特別權限
    /// </summary>
    /// <param name="Login">this.CurrentUser.LogonID</param>
    /// <param name="Manager">Add Other User </param>
    /// <returns></returns>
    public static bool SpecialPermissions(string Login, ArrayList Manager)
    {

        bool isPass = false;

        foreach (string User in Manager)
        {

            if (Login.ToUpper() == User.ToUpper())
            {
                isPass = true;
                break;
            }
        }

        return isPass;
    }

    /// <summary>
    /// HR1教育訓練特列權限
    /// </summary>
    /// <returns></returns>
    public static ArrayList HR1_Manager()
    {
        ArrayList User = new ArrayList();

        foreach (string person in MIS)
        {
            User.Add(person);
        }

        return User;
    }


    /// <summary>
    /// get user informaction by loginid
    /// </summary>
    /// <param name="LoginID"></param>
    /// <returns> ID,LOGONID,NAME,EMAIL,EMPID,LEVID,ERPID,DEPTNO,DEPT </returns>
    public static Dictionary<string, string> GetUserInfo(string LoginID)
    {
        //id,logonid,name,email,empid,erpid
        Dictionary<string, string> dgUser = null;

        using (SqlConnection conn4 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
        {
            conn4.Open();

            StringBuilder sb = new StringBuilder();

            sb.Append(" select d.dept_no,d.dept_nm,u.id,u.logonid,u.name ,u.email,u.empid,u.levid,u.erpid,l.lname 'job' from eipa.dbo.dguser u ");
            sb.Append(" left join eipa.dbo.lea_hm1emp10 e on e.emp_no=u.empid ");
            sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no=e.dept_no");
            sb.Append(" left join eipa.dbo.dglevel l on l.lnid=u.levid");
            sb.AppendFormat(" where u.logonid='{0}' ", LoginID);

            using (SqlCommand cmd4 = new SqlCommand(sb.ToString(), conn4))
            {
                SqlDataReader rd = cmd4.ExecuteReader();
                dgUser = new Dictionary<string, string>();

                while (rd.Read())
                {
                    dgUser.Add("ID", rd["id"].ToString());
                    dgUser.Add("LOGONID", rd["logonid"].ToString());
                    dgUser.Add("NAME", rd["name"].ToString());
                    dgUser.Add("EMAIL", rd["email"].ToString());
                    dgUser.Add("EMPID", rd["empid"].ToString());
                    dgUser.Add("LEVID", rd["levid"].ToString());
                    dgUser.Add("JOB", rd["job"].ToString());
                    dgUser.Add("ERPID", rd["erpid"].ToString());
                    dgUser.Add("DEPTNO", rd["dept_no"].ToString());
                    dgUser.Add("DEPT", rd["dept_nm"].ToString());
                }
                rd.Close();
            }
            conn4.Close();
        }
        return dgUser;
    }

    /// <summary>
    /// get User Info by ID
    /// return ID,LOGONID,NAME,EMAIL,EMPID,LEVID,ERPID,DEPTNO,DEPT
    /// </summary>
    /// <param name="uid"> 
    /// dguser id
    /// </param>
    /// <returns> ID,LOGONID,NAME,EMAIL,EMPID,LEVID,ERPID,DEPTNO,DEPT </returns>
    public static Dictionary<string, string> GetUIDInfo(string uid)
    {
        using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string LOGONID = ds.ExecuteScalar(string.Format("select LOGONID from eipa.dbo.dguser where id='{0}'", uid)).ToString();
            return GetUserInfo(LOGONID);
        }
    }

    /// <summary>
    /// find user name by uid
    /// </summary>
    /// <param name="uid">user guid</param>
    /// <returns></returns>
    public static string GetUName(string uid)
    {
        using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string Name = ds.ExecuteScalar(string.Format("select Name from eipa.dbo.dguser where id='{0}'", uid)).ToString();
            return Name;
        }
    }


    /// <summary>
    /// getu usr account by id 
    /// </summary>
    /// <param name="uid"> user guid </param>
    /// <returns></returns>
    public static string GetAccount(string uid)
    {
        using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string LOGONID = ds.ExecuteScalar(string.Format("select LOGONID from eipa.dbo.dguser where id='{0}'", uid)).ToString();
            return LOGONID;
        }
    }


    /// <summary>
    ///  get User guid by Logonid
    /// </summary>
    /// <param name="Logonid"></param>
    /// <returns>User Guid</returns>
    public static string GetUserID(string logonid)
    {
        using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string uid = ds.ExecuteScalar(string.Format("select id from eipa.dbo.dguser where logonid='{0}'", logonid)).ToString();
            return uid;
        }
    }
    /// <summary>
    /// 取得該員之直屬主管
    /// </summary>
    /// <param name="User_Guid">User</param>
    /// <returns></returns>
    public static string FindLeader(string User_Guid)
    {

        string leaderid = "";
        #region 申請人為部門最高主管時

        string mana = string.Empty;                        //部門主管
        string topmana = string.Empty;                     //上級主管 - 直屬主管用
        string topmana2 = string.Empty;                    //上級主管 - 跨部門判斷用

        try
        {
            SmoothEnterprise.Database.DataSet smana = new SmoothEnterprise.Database.DataSet();
            object objma = smana.ExecuteScalar("SELECT B.uid from dguser as A LEFT JOIN dggroup as B on A.gid=B.id WHERE A.id = '" + User_Guid + "'");
            mana = Convert.ToString(objma);

            string matry = "{" + mana.ToUpper() + "}";
            if ((User_Guid == matry) || (User_Guid == mana))
            {
                string mstr = "SELECT B.id AS nid FROM dggroup as A" +
                              " LEFT JOIN dguser as B on A.uid = B.id" +
                              " LEFT JOIN dglevel as C on B.levid = C.lnid" +
                              " WHERE A.id=(SELECT B.pid from dguser as A" +
                              " LEFT JOIN dggroup as B on A.gid=B.id" +
                              " LEFT JOIN dguser as C on B.uid=C.id" +
                              " LEFT JOIN dglevel as D on D.lnid=C.levid" +
                              " WHERE A.id = '" + User_Guid.Replace("{", "").Replace("}", "") + "')";

                SmoothEnterprise.Database.DataSet tmana = new SmoothEnterprise.Database.DataSet();
                object objtma = tmana.ExecuteScalar(mstr);


                topmana = Convert.ToString(objtma);

                if (topmana != "")
                {
                    leaderid = topmana;
                }
                else
                {
                    leaderid = mana;
                }
            }
            else
            {
                leaderid = mana;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        #endregion

        return leaderid;
    }



    /// <summary>
    /// get Single cell data 
    /// </summary>
    /// <param name="sql"></param>
    /// <returns>get sql first item data </returns>
    public static string getSingle(string sql)
    {

        string str = "";
        if (!string.IsNullOrEmpty(sql))
        {

            using (SqlConnection con = new SqlConnection(DBTransfer.Constr1))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader rd = cmd.ExecuteReader();

                if (rd.Read())
                {
                    str = rd[0].ToString();
                }

                con.Close();
            }
        }
        return str;
    }

    public static string toJson(object obj)
    {
        string json = "";
        if (obj != null)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            {
                json = js.Serialize(obj);
            }
        }
        return json;
    }

    /// <summary>
    /// 是否是有小數(不論正負)
    /// </summary>
    /// <param name="examine"></param>
    /// <returns></returns>
    public static bool IsFloat(string examine)
    {
        bool chk = false;
        if (!string.IsNullOrEmpty(examine))
        {
            Regex NumberPattern = new Regex(@"^(-[0-9]*|[0-9]*)$|^(-[0-9]*|[0-9]*)(\.{1}\d*)$");
            chk = NumberPattern.IsMatch(examine);
        }
        return chk;
    }

    public static bool IsInteger(string examine)
    {
        Regex NumberPattern = new Regex(@"^(-[0-9]*|[0-9]*)$");
        return NumberPattern.IsMatch(examine);
    }

    public static bool getRegex(string examine, string regex)
    {

        Regex NumberPattern = new Regex(regex);
        return NumberPattern.IsMatch(examine);
    }

    /// <summary>
    /// log file
    /// </summary>
    /// <param name="txt">log conent</param>
    public static void log(int i, params string[] txt)
    {
        string str = string.Join(",", txt);

        if (!isEIP)
        {
            System.Web.HttpContext.Current.Response.Write(str + "<br><br>");
        }

        if (i > 0)
        {


            string body = string.Format("[{0}]{1}\r\n", DateTime.Now.ToString(), str);

            string Dt = DateTime.Now.ToString("yyyyMMdd");
            System.IO.File.AppendAllText(Path.GetTempPath() + Dt + ".txt", body);
        }
    }

    public static void log(params string[] txt)
    {
        log(0, txt);
    }

    /// <summary>
    /// log file
    /// </summary>
    /// <param name="txt">log conent </param>
    /// <param name="fname">log file name</param>
    public static void log(string txt, string fname)
    {
        log(txt, fname, "delete");

    }

    /// <summary>
    /// set DropDownList Item 
    /// </summary>
    /// <param name="sqlcmd">sql command</param>
    /// <param name="request">default item </param>
    /// <returns></returns>
    public static ListItem[] setList(string sqlcmd, string request)
    {
        ListItem[] Item = new ListItem[0];

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
        {
            try
            {
                conn.Open();

                SqlDataAdapter da = new SqlDataAdapter(sqlcmd, conn);
                DataSet ds = new DataSet();
                da.Fill(ds, "temp");

                DataTable dt = ds.Tables["temp"];

                conn.Close();
                da.Dispose();

                int iCount = dt.Rows.Count + 1;
                Item = new ListItem[iCount];
                Item[0] = new ListItem("Select", "");
                int i = 1;
                foreach (DataRow row in dt.Rows)
                {
                    string value = row[0].ToString();

                    string text = row[1].ToString();

                    Item[i] = new ListItem(text, value);

                    if (value.Trim().ToUpper() == request.Trim().ToUpper())
                    {
                        Item[i].Selected = true;
                    }

                    i++;
                }

                dt.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        return Item;
    }

    /// <summary>
    /// set DropList Item　
    /// </summary>
    /// <param name="sqlcmd">sql commmand top 3 column is  value,en name,tw name </param>
    /// <param name="request"> selected or default </param>
    /// <param name="lang">將language 配合 sys_option 中的欄位使用 en 為必需欄位 </param>
    /// <returns></returns>
    public static ListItem[] getOPItem(string sqlcmd, string request, language tag)
    {
        return getOPItem(sqlcmd, request, tag, true);
    }

    /// <summary>
    /// set DropList Item　
    /// </summary>
    /// <param name="sqlcmd">sql commmand top 3 column is  id 'value', tag 'en' , tag name 'tw'  </param>
    /// <param name="request"> selected or default </param>
    /// <param name="lang">將language 配合 sys_option 中的欄位使用 en 為必需欄位 </param>
    /// <returns></returns>
    public static ListItem[] getOPItem(string sqlcmd, string request, language tag, bool idefault)
    {
        ListItem[] Item = new ListItem[0];

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
        {
            try
            {
                conn.Open();

                SqlDataAdapter da = new SqlDataAdapter(sqlcmd, conn);
                DataSet ds = new DataSet();
                da.Fill(ds, "temp");
                DataTable dt = ds.Tables["temp"];

                conn.Close();
                da.Dispose();

                int iCount = dt.Rows.Count + 1;
                Item = new ListItem[iCount];
                Item[0] = new ListItem("Select", "");

                int i = 1;
                foreach (DataRow row in dt.Rows)
                {
                    string value = row[0].ToString();

                    string text = row[tag.ToString()].ToString();

                    Item[i] = new ListItem(text, value);

                    request = request.Replace("&nbsp;", string.Empty);

                    if (!string.IsNullOrEmpty(request))
                    {
                        if (value == request)
                        {
                            Item[i].Selected = true;
                        }
                    }
                    else
                    {
                        if (idefault)
                        {
                            if (!string.IsNullOrEmpty(row[3].ToString()))
                            {
                                bool isDef = (bool)row[3];

                                if (isDef)
                                {
                                    Item[i].Selected = true;
                                }
                            }
                        }
                    }



                    i++;
                }

                dt.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        return Item;

    }


    public static string setHList(string sqlcmd, string request)
    {
        return setHList(sqlcmd, request, language.en);
    }

    /// <summary>
    ///  html select controls setting 
    /// </summary>
    /// <param name="sqlcmd">sql command</param>
    /// <param name="request">default item </param>
    /// <param name="tag">language type</param>
    /// <returns></returns>
    public static string setHList(string sqlcmd, string request, language tag)
    {
        StringBuilder sb = new StringBuilder();
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            try
            {
                rs.Open(sqlcmd);

                int iCount = rs.Rows.Count + 1;

                sb.Append("<option value=\"\">select</option>");

                while (!rs.EOF)
                {
                    //rs["hdL"].ToString(), rs["id"].ToString()
                    string value = rs["rowid"].ToString();
                    string text = rs[tag.ToString()].ToString();


                    if (value == request)
                    {
                        sb.AppendFormat("<option value=\"{0}\" selected=\"true\" >{1}</option>", value, text);
                    }
                    else
                    {
                        sb.AppendFormat("<option value=\"{0}\">{1}</option>", value, text);
                    }

                    rs.MoveNext();

                }

                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        return sb.ToString();

    }

    public static void getStatus(DropDownList cboList, language tag)
    {
        string[] sOStatus = Enum.GetNames(typeof(status));

        ListItem[] List = new ListItem[sOStatus.Length + 1];
        List[0] = new ListItem("select", "");
        int i = 1;
        foreach (string Text in sOStatus)
        {
            ListItem Item = new ListItem();

            string Option = Text;

            string Value = ((int)Enum.Parse(typeof(status), Text)).ToString();

            switch (tag)
            {
                case language.cn:
                    Option = cn_status(Value);
                    break;
                case language.jp:
                    Option = jp_status(Value);
                    break;

                case language.tw:
                    Option = tw_status(Value);
                    break;
                default:

                    break;
            }

            List[i] = new ListItem(Option, Value.ToString());
            if (Value == cboList.SelectedValue)
            {
                List[i].Selected = true;
            }
            i++;
        }

        cboList.Items.Clear();
        cboList.Items.AddRange(List);

    }

    public static void getStatus(ref DropDownList cboList, language tag)
    {
        string[] sOStatus = Enum.GetNames(typeof(status));

        ListItem[] List = new ListItem[sOStatus.Length + 1];
        List[0] = new ListItem("select", "");
        int i = 1;
        foreach (string Text in sOStatus)
        {
            ListItem Item = new ListItem();

            string Option = Text;

            string Value = ((int)Enum.Parse(typeof(status), Text)).ToString();

            switch (tag)
            {
                case language.cn:
                    Option = cn_status(Value);
                    break;
                case language.jp:
                    Option = jp_status(Value);
                    break;

                case language.tw:
                    Option = tw_status(Value);
                    break;
                default:

                    break;
            }

            List[i] = new ListItem(Option, Value.ToString());
            if (Value == cboList.SelectedValue)
            {
                List[i].Selected = true;
            }
            i++;
        }

        cboList.Items.Clear();
        cboList.Items.AddRange(List);

    }

    public static string tw_status(string value)
    {
        string result = "";
        //Waite = 0,
        if (value == "0")
        {
            result = "未送審";
        }
        //Send = 1,
        if (value == "1")
        {
            result = "送審中";
        }

        //Stop = 2,
        if (value == "2")
        {
            result = "中止";
        }

        //Complete = 3,
        if (value == "3")
        {
            result = "完成審核";
        }
        //Fial = 4
        if (value == "4")
        {
            result = "作廢";
        }

        //Back = 5,
        if (value == "5")
        {
            result = "退回";
        }
        return result;
    }

    public static string en_status(string value)
    {
        string result = "";
        //Waite = 0,
        if (value == "0")
        {
            result = "Waite";
        }
        //Send = 1,
        if (value == "1")
        {
            result = "Send";
        }

        //Stop = 2,
        if (value == "2")
        {
            result = "Stop";
        }

        //Complete = 3,
        if (value == "3")
        {
            result = "Complete";
        }
        //Fial = 4
        if (value == "4")
        {
            result = "Fail";
        }

        //Fial = ５
        if (value == "５")
        {
            result = "Back";
        }
        return result;
    }

    public static string jp_status(string value)
    {
        string result = "";
        //Waite = 0,
        if (value == "0")
        {
            result = "Waite";
        }
        //Send = 1,
        if (value == "1")
        {
            result = "Send";
        }

        //Stop = 2,
        if (value == "2")
        {
            result = "Stop";
        }

        //Complete = 3,
        if (value == "3")
        {
            result = "Complete";
        }
        //Fial = 4
        if (value == "4")
        {
            result = "Fial";
        }

        //Back = 5
        if (value == "5")
        {
            result = "Back";
        }
        return result;
    }

    public static string cn_status(string value)
    {
        string result = "";
        //Waite = 0,
        if (value == "0")
        {
            result = "未送审";
        }
        //Send = 1,
        if (value == "1")
        {
            result = "送审中";
        }

        //Stop = 2,
        if (value == "2")
        {
            result = "中止";
        }

        //Complete = 3,
        if (value == "3")
        {
            result = "完成审核";
        }
        //Fial = 4
        if (value == "4")
        {
            result = "作废";
        }

        //退回 = 5
        if (value == "5")
        {
            result = "退回";
        }
        return result;
    }

    /// <summary>
    /// Controls Enable setting 
    /// </summary>
    /// <param name="isShow">display status</param>
    /// <param name="Controls"></param>
    public static void setEnable(bool isShow, params WebControl[] Controls)
    {
        foreach (WebControl ctr in Controls)
        {
            ctr.Enabled = isShow;
        }
    }

    public static void setVisable(bool isShow, params WebControl[] Controls)
    {
        foreach (WebControl ctr in Controls)
        {
            ctr.Visible = isShow;
        }
    }

    public static string chnageStatus(string value, language type)
    {

        string result = "";

        //tw
        if ((int)type == 1)
        {
            result = tw_status(value);
        }
        //cn
        if ((int)type == 2)
        {
            result = cn_status(value);
        }

        // jp
        if ((int)type == 3)
        {
            result = jp_status(value);
        }

        // jp
        if ((int)type == 0)
        {
            result = en_status(value);
        }

        return result;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="eMail">收件人</param>
    /// <param name="Subject">主旨</param>
    /// <param name="Body">信件內容</param>
    /// <param name="isMIS">bcc 給 mis</param>
    public static void MailFromEIP(string eMail, string Subject, string Body, bool isMIS)
    {
        SendMail(eMail, "EIP(員工入口網站)", Subject, Body, "", isMIS, "");
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="eMail">收件人</param>
    /// <param name="Subject">主旨</param>
    /// <param name="Body">信件內容</param>
    /// <param name="isMIS">bcc 給 mis</param>
    /// /// <param name="CC">cc 給其他人</param>
    public static void MailFromEIP(string eMail, string Subject, string Body, bool isMIS, string CC)
    {
        SendMail(eMail, "EIP(員工入口網站)", Subject, Body, "", isMIS, CC);
    }


    /// <summary>
    /// Mail for EIP have attachment
    /// </summary>
    /// <param name="eMail">收件人</param>
    /// <param name="Subject">主旨</param>
    /// <param name="Body">信件內容</param>
    /// <param name="attacher">附件</param>
    /// <param name="isMIS">bcc 給 mis</param>
    /// <param name="CC">cc 給其他人</param>
    public static void MailFromEIP(string eMail, string Subject, string Body, string attacher, bool isMIS, string CC)
    {
        SendMail(eMail, "EIP(員工入口網站)", Subject, Body, attacher, isMIS, CC);
    }

    /// <summary>
    /// send mail
    /// </summary>
    /// <param name="MailList"> Mail List</param>
    /// <param name="FromName"></param>
    /// <param name="Subject"></param>
    /// <param name="Body">mail context</param>
    /// <param name="isMIS">bcc to MIS </param>
    public static void SendMail(string eMail, string FromName, string Subject, string Body, bool isMIS)
    {
        SendMail(eMail, FromName, Subject, Body, "", isMIS, "");
    }

    /// <summary>
    /// send mail
    /// </summary>
    /// <param name="MailList"> Mail List</param>
    /// <param name="FromName"></param>
    /// <param name="Subject"></param>
    /// <param name="Body"></param>
    public static void SendMail(string eMail, string FromName, string Subject, string Body)
    {
        SendMail(eMail, FromName, Subject, Body, "", false, "");
    }



    /// <summary>
    /// 
    /// </summary>
    /// <param name="eMail">收信件</param>
    /// <param name="SenderName">送件者</param>
    /// <param name="Subject">主旨</param>
    /// <param name="Body">信件內容</param>
    /// <param name="AttachPath">附件位置</param>
    /// <param name="toMIS">是否寄給MIS</param>
    /// <param name="CC">以,分隔</param>
    public static void SendMail(string eMail, string SenderName, string Subject, string Body, string AttachPath, bool toMIS, string CC)
    {
        try
        {

            MailMessage MainConfig = new MailMessage();
            string myMailEncoding = "utf-8";
            MainConfig.To.Add(eMail);

            //MainConfig.From = new MailAddress("eipa.yeh@minaik.com.tw" , FromName, System.Text.Encoding.UTF8);
            MainConfig.From = new MailAddress("eip@minaik.com.tw", SenderName, System.Text.Encoding.UTF8);
            //郵件標題 
            MainConfig.Subject = Subject;
            //郵件標題編碼  
            MainConfig.SubjectEncoding = System.Text.Encoding.UTF8;
            //郵件內容

            MainConfig.Body = Body;
            MainConfig.IsBodyHtml = true;
            MainConfig.BodyEncoding = System.Text.Encoding.UTF8;//郵件內容編碼 

            MainConfig.Priority = MailPriority.Normal;//郵件優先級 
            if (toMIS == true)
            {
                MainConfig.Bcc.Add(MIS_Mail);

            }

            if (!string.IsNullOrEmpty(CC))
            {
                MainConfig.Bcc.Add(CC);
            }


            if (!string.IsNullOrEmpty(AttachPath))
            {

                // 設定附件檔案(Attachment) 
                System.Net.Mail.Attachment attachment1 =
                   new System.Net.Mail.Attachment(AttachPath);
                attachment1.Name = System.IO.Path.GetFileName(AttachPath);
                attachment1.NameEncoding = Encoding.GetEncoding(myMailEncoding);
                attachment1.TransferEncoding = System.Net.Mime.TransferEncoding.Base64;

                // 設定該附件為一個內嵌附件(Inline Attachment)
                attachment1.ContentDisposition.Inline = true;
                attachment1.ContentDisposition.DispositionType = System.Net.Mime.DispositionTypeNames.Inline;

                MainConfig.Attachments.Add(attachment1);

            }

            SmtpClient client = new SmtpClient("192.168.0.12");
            client.Credentials = new NetworkCredential("eip", "eip1106");

            client.Send(MainConfig);

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    /// <summary>
    /// Matchin Option Value is UID
    /// </summary>
    /// <param name="List"></param>
    public static void getMachinV(DropDownList List)
    {
        string sql = "select  m.machineID,builderspec+'#'+ma_location+' '+masupply+' '+maName+' '+convert(nvarchar(10),builderton) 'en' FROM EIPB.dbo.machine_main m where maName <>'清洗機' order by builderspec,masupply,ma_location";
        ListItem[] Item = Utility.getOPItem(sql, List.SelectedValue, language.en, false);
        List.Items.Clear();
        List.Items.AddRange(Item);
    }

    /// <summary>
    /// Matchin Option Value is Text
    /// </summary>
    /// <param name="List"></param>
    public static void getMachinT(DropDownList List)
    {
        string sql = "select builderspec+'#'+ma_location+' '+masupply+' '+maName+' '+convert(nvarchar(10),builderton) ,builderspec+'#'+ma_location+' '+masupply+' '+maName+' '+convert(nvarchar(10),builderton) 'en' FROM EIPB.dbo.machine_main m where maName <>'清洗機' order by builderspec,m.masupply,m.ma_location desc  ";
        ListItem[] Item = Utility.getOPItem(sql, List.SelectedValue, language.en, false);
        List.Items.Clear();
        List.Items.AddRange(Item);
    }

    public static void execDel(string sql)
    {
        SQL_Exec(sql);
    }

    public static void SQL_Exec(string sql)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(DBTransfer.Constr1))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message.ToString() + "<br>" + sql);
            throw ex;
        }
    }


    public static string getManager(string programnm, string PointNm)
    {

        List<string> List = new List<string>();
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string command_hr1 = "select uid from norflowappid where programnm='" + System.IO.Path.GetFileName(programnm) + "'{0} order by sort ";

            string limint = "";
            if (!string.IsNullOrEmpty(PointNm))
            {
                limint = string.Format("and pointNm='{0}'", PointNm);
            }
            command_hr1 = string.Format(command_hr1, limint);


            rs.Open(command_hr1);

            while (!rs.EOF)
            {
                List.Add(rs["uid"].ToString());
                rs.MoveNext();
            }
        }

        return string.Join(",", List.ToArray());
    }

    public static ListItem[] getDept(string def)
    {

        ListItem[] selected = Utility.setList("select dept_no 'value',dept_nm 'name' from eipa.dbo.lea_hm1dept10 where  dept_nm not like '*%' order by  dept_no ", def);
        return selected;
    }

    public static ListItem[] getDept()
    {
        return getDept("");
    }

    public static bool isEIP
    {

        get
        {

            string DNS = System.Web.HttpContext.Current.Request.Url.Host.ToString();

            bool isbool = ("http://" + DNS) == LocalUrl ? true : false;

            return isbool;

        }


    }



    public static bool isPicture(string sub)
    {
        //jpeg; jpg; gif; png

        bool ispass = false;
        sub = sub.ToUpper();
        string[] pic = { ".JPEG", ".JPG", ".GIF", ".PNG" };

        foreach (string v in pic)
        {
            if (v.ToString().ToUpper().Contains(sub))
            {
                ispass = true;
                break;
            }
        }

        return ispass;

    }

    public static string GetGIT_UserName(string pid)
    {
        User_Info u = new User_Info();
        u.GetdgUsererPid(pid);
        return u.NAME;
    }

    /// 以流的形式，可以設定很豐富複雜的樣式 
    /// </summary> 
    /// <param name="content">Excel中內容(Table格式)</param> 
    /// <param name="filename">文件名</param> 
    /// <param name="cssText">樣式內容</param> 
    public static void ExportToExcel(string filename, string content, string cssText)
    {

        content = string.Format("<style type='text/css'>{0}</style>{1}", cssText, content);

        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Buffer = true;
        HttpContext.Current.Response.Charset = "UTF-8";
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
        HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        HttpContext.Current.Response.ContentType = "application/ms-excel;charset=UTF-8";
        HttpContext.Current.Response.Write(content);
        HttpContext.Current.Response.Flush();
        HttpContext.Current.Response.End();
    }

    //Unix起始時間
    private static DateTime BaseTime = new DateTime(1970, 1, 1);

    /// <summary>
    /// 轉換UNIX時戳格式為C#的DateTime格式
    /// </summary>
    /// <param name="timeStamp">UNIX時戳</param>
    /// <returns>C#的DateTme格式</returns>
    public static DateTime GetTS_Date(long timeStamp)
    {
        return BaseTime.AddTicks((timeStamp + 8 * 60 * 60) * 10000000);
    }

    /// <summary>
    /// 轉換UNIX時戳格式為C#的DateTime格式
    /// </summary>
    /// <param name="timeStamp">UNIX時戳</param>
    /// <returns>C#的DateTme格式</returns>
    public static DateTime GetTS_Date(string timeStamp)
    {
        return GetTS_Date(long.Parse(timeStamp));
    }

    /// <summary>
    /// 轉換C#的DateTime格式為UNIX時戳格式
    /// </summary>
    /// <param name="dateTime">DateTime物件</param>
    /// <returns>UNIX時戳格式</returns>
    public static long GetTStamp(DateTime dateTime)
    {
        return (dateTime.Ticks - BaseTime.Ticks) / 10000000 - 8 * 60 * 60;
    }

    /// <summary>
    /// 轉換C#的DateTime格式為UNIX時戳格式
    /// </summary>
    /// <param name="dateTime">DateTime物件</param>
    /// <returns>UNIX時戳格式</returns>
    public static long GetTStamp()
    {

        return GetTStamp(DateTime.Now);
    }

    /// <summary>
    /// 轉換C#的DateTime格式為UNIX時戳格式
    /// </summary>
    /// <param name="dateTime">DateTime物件</param>
    /// <returns>UNIX時戳格式</returns>
    public static string GetTSs()
    {

        return GetTStamp(DateTime.Now).ToString();
    }

    public static Color HexColor(String hex)
    {
        //將井字號移除
        hex = hex.Replace("#", "");

        byte a = 255;
        byte r = 255;
        byte g = 255;
        byte b = 255;
        int start = 0;

        //處理ARGB字串 
        if (hex.Length == 8)
        {
            a = byte.Parse(hex.Substring(0, 2), System.Globalization.NumberStyles.HexNumber);
            start = 2;
        }

        // 將RGB文字轉成byte
        r = byte.Parse(hex.Substring(start, 2), System.Globalization.NumberStyles.HexNumber);
        g = byte.Parse(hex.Substring(start + 2, 2), System.Globalization.NumberStyles.HexNumber);
        b = byte.Parse(hex.Substring(start + 4, 2), System.Globalization.NumberStyles.HexNumber);

        return Color.FromArgb(a, r, g, b);
    }

}

public class Container
{

    DataRow _base;

    public Container(DataRow db)
    {
        _base = db;
    }


    public string this[string key]
    {
        get
        {


            return _base[key].ToString().Trim();
        }

        set
        {
            _base[key] = value.Trim();
        }
    }
}


public enum language : int  //在這修改預設的型別
{
    en = 0,
    tw = 1,
    cn = 2,
    jp = 3
}

public enum status : int  //在這修改預設的型別
{
    Waite = 0, //待處理
    Send = 1, //送出
    Stop = 2,//中止
    Complete = 3, //完成
    Fial = 4,//作癈
    Back = 5//退回提案 
}

public class User_Info
{
 private   string _id, _logonid, _name, _email, _empid, _levid, _erpid, _deptno, _dept, _erppid, _jod;

    public string ID { get { return _id; } }
    public string LOGONID { get { return _logonid; } }
    public string NAME { get { return _name; } }
    public string EMAIL { get { return _email; } }
    public string EMPID { get { return _empid; } }
    public string LEVID { get { return _levid; } }
    public string ERPID { get { return _erpid; } }
    public string DEPTNO { get { return _deptno; } }
    public string DEPT { get { return _dept; } }
    public string JOD { get { return _jod; } }
    public string ERPPID { get { return _erppid; } }

    //***********************
    public void GetdgUsererPid(string erpid)
    {
        using (SqlConnection conn4 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
        {
            conn4.Open();

            StringBuilder sb = new StringBuilder();
             
            sb.Append(" select d.dept_no,d.dept_nm,u.id,u.logonid,u.name ,u.email,u.empid,u.levid,u.erpid,l.lname 'job', a.erpid from eipa.dbo.dguser u ");
            sb.Append(" left join EIPA.DBO.dgusererpid a on  a.id = u.id ");
            sb.Append(" left join eipa.dbo.lea_hm1emp10 e on e.emp_no=u.empid ");
            sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no=e.dept_no and dept_nm not like '%**%'");
            sb.Append(" left join eipa.dbo.dglevel l on l.lnid=u.levid");
            sb.AppendFormat("  where a.erpid = '{0}' ", erpid);

 
            using (SqlCommand cmd4 = new SqlCommand(sb.ToString(), conn4))
            {
                SqlDataReader rd = cmd4.ExecuteReader();


                if (rd.Read())
                {
                    _id = rd["id"].ToString();
                    _logonid = rd["logonid"].ToString();
                    _name = rd["name"].ToString();
                    _email = rd["email"].ToString();
                    _empid = rd["empid"].ToString();
                    _levid = rd["levid"].ToString();
                    _jod = rd["job"].ToString();
                    _erpid = rd["erpid"].ToString();
                    _deptno = rd["dept_no"].ToString();
                    _dept = rd["dept_nm"].ToString();
                    _erppid = rd["erpid"].ToString();
                }
                rd.Close();
            }
            conn4.Close();
        }

    }

    public void GetUserByID(string id)
    {
        using (SqlConnection conn4 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
        {
            conn4.Open();

            StringBuilder sb = new StringBuilder();

            sb.Append(" select d.dept_no,d.dept_nm,u.id,u.logonid,u.name ,u.email,u.empid,u.levid,u.erpid,l.lname 'job' from eipa.dbo.dguser u ");
            sb.Append(" left join eipa.dbo.lea_hm1emp10 e on e.emp_no=u.empid ");
            sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no=e.dept_no and dept_nm not like '%**%'");
            sb.Append(" left join eipa.dbo.dglevel l on l.lnid=u.levid");
            sb.AppendFormat("  where u.id = '{0}' ", id);

            using (SqlCommand cmd4 = new SqlCommand(sb.ToString(), conn4))
            {
                SqlDataReader rd = cmd4.ExecuteReader();


                if (rd.Read())
                {
                    _id = rd["id"].ToString();
                    _logonid = rd["logonid"].ToString();
                    _name = rd["name"].ToString();
                    _email = rd["email"].ToString();
                    _empid = rd["empid"].ToString();
                    _levid = rd["levid"].ToString();
                    _jod = rd["job"].ToString();
                    _erpid = rd["erpid"].ToString();
                    _deptno = rd["dept_no"].ToString();
                    _dept = rd["dept_nm"].ToString();
                    
                }
                rd.Close();
            }
            conn4.Close();
        }

    }

    public void GetUserByLogo(string logonid)
    {
        using (SqlConnection conn4 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
        {
            conn4.Open();

            StringBuilder sb = new StringBuilder();

            sb.Append(" select d.dept_no,d.dept_nm,u.id,u.logonid,u.name ,u.email,u.empid,u.levid,u.erpid,l.lname 'job' from eipa.dbo.dguser u ");
            sb.Append(" left join eipa.dbo.lea_hm1emp10 e on e.emp_no=u.empid ");
            sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no=e.dept_no and dept_nm not like '%**%'");
            sb.Append(" left join eipa.dbo.dglevel l on l.lnid=u.levid");
            sb.AppendFormat("  where u.logonid = '{0}' ", logonid);

            using (SqlCommand cmd4 = new SqlCommand(sb.ToString(), conn4))
            {
                SqlDataReader rd = cmd4.ExecuteReader();


                if (rd.Read())
                {
                    _id = rd["id"].ToString();
                    _logonid = rd["logonid"].ToString();
                    _name = rd["name"].ToString();
                    _email = rd["email"].ToString();
                    _empid = rd["empid"].ToString();
                    _levid = rd["levid"].ToString();
                    _jod = rd["job"].ToString();
                    _erpid = rd["erpid"].ToString();
                    _deptno = rd["dept_no"].ToString();
                    _dept = rd["dept_nm"].ToString();

                }
                rd.Close();
            }
            conn4.Close();
        }

    }

}

