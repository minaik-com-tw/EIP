using SmoothEnterprise.Flowwork.UI.WebControl;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// MABase 的摘要描述
/// </summary>
public class MABase : SmoothEnterprise.Web.Page
{
    public language lang = (language)1;
    private string _sysName;
    private string[] _manager;
    private string _sql;
    protected bool _NotifyReview = false;
    public bool isDel = false;

    protected string _rowid;
    protected int _status = 0;

    public MABase()
    {
        lang = CurrLang;
        string dir = Server.MapPath(".");
        _sysName = Path.GetFileNameWithoutExtension(dir);

    }

    public MABase(string SysName)
    {
        _sysName = SysName;


    }

    /// <summary>
    ///  List default contril edit & view
    /// </summary>
    /// <param name="column"></param>
    /// <param name="id"></param>
    /// <param name="isPass"> currect user is  administrator or author </param>
    /// <returns>link html </returns>
    public string List_Default(string column, string id, bool isPass)
    {
        string html = "";
        if (column.ToUpper().Contains("EDIT") && (isPass))
        {
            html = "<a href=\"" + getEdit + "?rowid=" + id + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
        }

        if (column.ToUpper().Contains("VIEW"))
        {
            html = "<a href=\"" + getView + "?rowid=" + id + "\"><img src=\"/lib/img/icon-zoom.gif\" border=\"0\"></a>";
        }

        return html;
    }

    /// <summary>
    ///  List default contril edit & view
    /// </summary>
    /// <param name="column"></param>
    /// <param name="id"></param>
    /// <param name="isPass"> currect user is  administrator or author </param>
    /// <returns>link html </returns>
    public string List_Edit(string column, string id, bool isPass)
    {
        string html = "";
        if (column.ToUpper().Contains("EDIT") && (isPass))
        {
            html = "<a href=\"" + getEdit + "?rowid=" + id + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
        }
        return html;
    }

    public virtual string List_Del(string column, string id, bool isPass)
    {
        string html = "";
        if (column.Contains("del") && (isPass))
        {
            isDel = true;
            html = "<input type='checkbox' name='Del_Item' id='Del_Item'  value='" + id + "' />";
        }

        return html;
    }



    public string tranfer_status(string value)
    {
        return Utility.chnageStatus(value, lang);
    }



    public void Redirect_Add()
    {
        Response.Redirect(getApp);
    }

    public string getView
    {
        get
        {
            string Page = _sysName + "View.aspx";
            return Page;
        }
    }

    public string getApp
    {
        get
        {
            string Page = "../" + _sysName + "/" + _sysName + "Add.aspx";
            return Page;
        }
    }

    public string getEdit
    {
        get
        {
            string Page = _sysName + "Edit.aspx";
            return Page;
        }
    }

    public string[] Manager
    {
        set
        {
            _manager = value;
        }
    }

    public language Language
    {


        get
        {
            if (language.tw == lang)
            {
                return language.tw;
            }
            else
            {
                return language.en;
            }

        }
    }

    public language CurrLang
    {
        get
        {
            language curr = (language)1;

            //當表單沒回傳值 ctl00$HeaderControl1$FIELD_language=null;
            string langVal = System.Web.HttpContext.Current.Request.Form["ctl00$HeaderControl1$FIELD_language"];

            if (string.IsNullOrEmpty(langVal))
            {
                if (System.Web.HttpContext.Current.Request.Cookies["userLan"] != null)
                {
                    langVal = System.Web.HttpContext.Current.Request.Cookies["userLan"].Value;
                }
                else
                {
                    langVal = curr.ToString();
                }
            }

            if (langVal.Contains("en"))
            {
                curr = language.en;
            }

            if (langVal.Contains("tw"))
            {
                curr = language.tw;
            }
            return curr;
        }
    }




    protected string getStr(string key)
    {
        string kk = "";
        try
        {
            kk = this.GetLocalResourceObject(key).ToString();
        }
        catch (Exception ex)
        {
            Response.Write("<div style='color:red;font-size=13px' >not find:" + key + "</div><br>");
            //throw new Exception(ex.Message);
        }

        return kk;
    }

    public class Flow
    {
        public class Reviews
        {
            public List<Reviews> List = new List<Reviews>();

            public string id;
            public string tital;

            public void Add(string id, string tital)
            {
                Reviews r = new Reviews();
                r.id = id;
                r.tital = tital;
                List.Add(r);
            }

            public void Remove(string id, string tital)
            {
                List<Reviews> temp = List;

                foreach (Reviews r in temp)
                {
                    if (r.id == id && r.tital == tital)
                    {
                        List.Remove(r);
                    }
                }
                temp.Clear();
            }


        }


        /// <summary>
        ///   中止流程，會回傳審核者的mail& 名字 並刪除該筆資料的流程
        /// </summary>
        /// <param name="rowid"></param>
        /// <param name="eMail"> mail addrcess</param>
        /// <param name="user"> user name </param>
        /// <returns></returns>
        public void Stop(string rowid, ref string eMail, ref string user)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT  requesturl,name,email,convert(varchar(20), a.initdate,120)'initdate'  FROM   eipa.dbo.dgflowqueue a  ");
            sb.AppendFormat(" left join eipa.dbo.dguser b   on revieweruid=b.id  where requesturl like '%{0}' ", rowid);
            sb.AppendFormat("  and resulttype is null and revieweruid<>'00000000-0000-0000-0000-000000000000'  order by b.initdate  desc");


            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                ds.Open(sb.ToString());

                if (!ds.EOF)
                {
                    user = ds["name"].ToString();
                    eMail = ds["email"].ToString();
                    string requesturl = ds["requesturl"].ToString();

                    string deleteSql = string.Format("delete EIPA.DBO.dgflowqueue where  requesturl='{0}'", requesturl);
                    Utility.execDel(deleteSql);
                }
            }
        }


        /// <summary>
        /// 審核人 送審信(已由ToApproval 已不使用)
        /// </summary>
        /// <param name="id"></param>
        /// <param name="request_url"></param>
        /// <param name="subject"></param>
        /// <param name="content"></param>
        public void ApproveMail(string rowid, string user_id, string Subject, string MailBody)
        {

            //StringBuilder sb = new StringBuilder();
            //sb.Append(" SELECT top(1) requesturl, revieweruid,name,email,convert(varchar(20), a.initdate,120)'initdate' FROM   eipa.dbo.dgflowqueue a  ");
            //sb.AppendFormat(" left join eipa.dbo.dguser b   on revieweruid=b.id  where requesturl like '%{0}' ", rowid);
            //sb.AppendFormat("  order by initdate desc ");

            Dictionary<string, string> us = Utility.GetUIDInfo(user_id);

            if (us.Count > 0)
            {
                string context = string.Format("Dear {0},<br>{1}", us["NAME"], MailBody);
                Utility.SendMail(us["EMAIL"], "EIP(員工入口網站)", Subject, context);
                DeputyApprove(user_id, rowid, Subject, MailBody);

            }
        }

        public void ToApproval(string rowid, string logonid, string Subject, string MailBody)
        {
            User_Info us = new User_Info();
            us.GetUserByLogo(logonid);
            Utility.SendMail(us.EMAIL, "EIP(員工入口網站)", Subject, MailBody);
            DeputyApprove(us.ID, rowid, Subject, MailBody);
        }

        /// <summary>
        /// 代理人 送審信
        /// </summary>
        /// <param name="id"></param>
        /// <param name="request_url"></param>
        /// <param name="subject"></param>
        /// <param name="content"></param>
        public void DeputyApprove(string id, string request_url, string subject, string content)
        {
            using (SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                StringBuilder sb = new StringBuilder();

                sb.Append(" SELECT b.name name,email FROM dguserdeputy a ");
                sb.Append("  left join dguser b on a.deputyuid=b.id ");
                sb.Append("  left join dgflow c on a.sid=c.id ");
                sb.AppendFormat(" where  a.uid='{0}' ", id); //請假人
                sb.Append("and ( (a.sid is null and  sdate < GETDATE() and edate is null) ");
                sb.Append("or (c.typename like 'sharflow12_21%' and sdate < GETDATE() and edate is null) ");
                sb.Append("or (c.typename like 'sharflow12_21%' and sdate < GETDATE() and edate > GETDATE() ");
                sb.Append(") or a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");

                while (!rs2.EOF)
                {
                    string AppName = rs2["name"].ToString();
                    string AppMail = rs2["email"].ToString();

                    string body = string.Format("Dear {0},<br>{1} ", AppName, content);

                    Utility.MailFromEIP(AppMail, subject, body, false);

                    rs2.MoveNext();

                }
                rs2.Close();
            }
        }


        /// <summary>
        /// 簽核結束
        /// </summary>
        /// <param name="logonid">人員帳號</param>
        /// <param name="rowno">requesturl</param>
        /// <param name="feedback">Smooth FlowFeedback </param>
        /// <param name="e">SmoothFeedbackCompleteEventArgs </param>
        public void Feedback_FeedbackComplete(string logonid, string rowno, FlowFeedback feedback, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
        {

            try
            {
                SmoothEnterprise.Web.UI.HTMLControl.InputText it;
                object obj = feedback.ReplyView.FindControl("ResTxt");
                it = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj;
                e["Flow_Comment"] = it.Text;
                //電子簽章呈現---------------------------------------------------------------------
                SmoothEnterprise.Web.UI.HTMLControl.InputText it3;
                object obj3 = feedback.ReplyView.FindControl("Flow_loginID");
                it3 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj3;
                it3.Text = logonid;
                e["Flow_loginID"] = it3.Text;

                //寫入是否為代理人
                SmoothEnterprise.Web.UI.HTMLControl.InputText it4;
                object obj4 = feedback.ReplyView.FindControl("IniReviewer");
                it4 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj4;
                e["IniReviewer"] = "代";

                StringBuilder sb = new StringBuilder();
                //
                sb.AppendFormat(" select revieweruid  from  eipa.dbo.dgflowqueue   where requesturl like '%{0}' ", rowno);
                sb.AppendFormat("  and revieweruid='{0}' and  initdate=(select MAX(initdate)   from  eipa.dbo.dgflowqueue    where requesturl like '%{1}') ", logonid, rowno);
                sb.AppendFormat(" and  initdate=(select MAX(initdate)   from  eipa.dbo.dgflowqueue    where requesturl like '%{0}') ", rowno);

                using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
                {


                    ds.Open(sb.ToString());
                    if (!ds.EOF)
                    {
                        e["IniReviewer"] = "";
                    }
                    ds.Close();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public void getCreateUser(string request_url, ref string name, ref string email)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT   revieweruid,name,email,convert(varchar(20), a.initdate,120)'initdate' FROM   eipa.dbo.dgflowqueue a  ");
            sb.AppendFormat(" left join eipa.dbo.dguser b   on requestuid=b.id  where requesturl like '%{0}' ", request_url);
            sb.AppendFormat("  and revieweruid='00000000-0000-0000-0000-000000000000' ");


            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                ds.Open(sb.ToString());

                if (!ds.EOF)
                {
                    name = ds["name"].ToString();
                    email = ds["email"].ToString();

                }
            }

        }

        /// <summary>
        /// History 基本設定
        /// </summary>
        /// <param name="CommentName">Comment Laber nmae </param>
        /// <param name="fview">flow object </param>
        /// <param name="e">FlowFeedbackHistoryEvent</param>
        public void FlowViewer_History(string CommentName, FlowFeedbackViewer fview, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            //簽核備註顯示
            Label Comment = (Label)fview.HistoryView.FindControl(CommentName);
            Comment.Text = (string)e["Flow_Comment"];
            Comment.Style.Value = "FILTER: none;  BACKGROUND-COLOR: #f0f0f0;border:2px inset #f0f0f0;";
            Comment.Width = 400;
            Comment.Height = 23;
             
            Image autograph = (Image)fview.HistoryView.FindControl("Image1");
            autograph.BorderColor = Utility.HexColor("#28ff28");

            autograph.Visible = false;  //default 簽名檔不顯示 

            //顯示簽名檔
            string user_guid = e["Flow_loginID"].ToString();
            User_Info us = new User_Info();

            //us.GetUserByID();
            if (!string.IsNullOrEmpty(user_guid))
            {
                autograph.Visible = true; //顯示簽名檔  
                string img_name = string.Format(@"../../images/{0}.jpg", user_guid); //確定檔案存在 
                autograph.ImageUrl = img_name;
                autograph.Visible = true; 
            }
              
            Image signature = (Image)fview.HistoryView.FindControl("Image2");
            //e["IniReviewer"].ToString() 表示"代"字 
            signature.Visible = false;

            string AppDeputy = e["InputText3"].ToString();
            if (!string.IsNullOrEmpty(AppDeputy))
            {
                //判斷圖檔是否存在 
                autograph.Visible = true; //顯示簽名檔  
                string img_name = string.Format(@"../../images/{0}.jpg", AppDeputy); //確定檔案存在 
                autograph.ImageUrl = img_name;
                autograph.Visible = true;
                signature.Visible = true;
            }

        }

        /// <summary>
        /// 取得目前的審核人員
        /// </summary>
        /// <param name="_rowid"></param>
        /// <param name="emial"></param>
        /// <param name="name"></param>
        public void GetCurrApproveMail(string _rowid, ref string email, ref string name)
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                //取得目前的簽核中的階層
                StringBuilder sb = new StringBuilder();
                sb.Append(" SELECT  top 1  text,reviewdate,qseq, REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid , ");
                sb.Append(" convert(varchar(20), a.initdate,120)'initdate' ");
                sb.Append(" FROM   eipa.dbo.dgflowqueue a  ");
                sb.Append(" left join eipa.dbo.dguser b   on revieweruid=b.id  ");
                sb.AppendFormat(" where requesturl like '%{0}' AND reviewdate IS NULL AND qseq is not null order by a.initdate  desc  ", _rowid);

                ds.Open(sb.ToString());

                if (!ds.EOF)
                {
                    name = ds["name"].ToString();
                    email = ds["email"].ToString();

                }
            }
        }

        public static User_Info GetReviewer(string _rowid)
        {
            User_Info a = new User_Info();
            try
            {

                using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
                {
                    //取得目前的簽核中的階層
                    StringBuilder sb = new StringBuilder();
                    sb.Append(" SELECT  top 1  text,reviewdate,qseq, REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid , ");
                    sb.Append(" convert(varchar(20), a.initdate,120)'initdate' ");
                    sb.Append(" FROM   eipa.dbo.dgflowqueue a  ");
                    sb.Append(" left join eipa.dbo.dguser b   on revieweruid=b.id  ");
                    sb.AppendFormat(" where requesturl like '%{0}' AND reviewdate IS NULL AND qseq is not null order by a.initdate  desc  ", _rowid);

                    ds.Open(sb.ToString());

                    if (!ds.EOF)
                    {
                        string uid = ds["revieweruid"].ToString();

                        a.GetUserByID(uid);
                    }

                    return a;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Mail Format

        public static class MailFormat
        {
            public static string Complete(string Title, string UserName, string NO, string Url)
            {
                //Remind Reviewer
                StringBuilder sb = new StringBuilder();

                sb.AppendFormat("您的申請<font Color='red'>已通過審核</font><br>", Title);
                sb.AppendFormat("系統:{0}<br>", Title);
                sb.AppendFormat("單號:{0}<br>", NO);
                return Normal(UserName, Url, sb.ToString());
            }

            /// <summary>
            /// 
            /// </summary>
            /// <param name="Title"></param>
            /// <param name="UserName"></param>
            /// <param name="NO"></param>
            /// <param name="Url"></param>
            /// <param name="Other"></param>
            /// <returns></returns>
            public static string Terminate(string Title, string UserName, string NO, string Url)
            {
                //Remind Reviewer
                StringBuilder sb = new StringBuilder();

                sb.AppendFormat("EIP中，有一筆您的申請<font Color='red'>已被退回</font><br>", Title);
                sb.AppendFormat("系統:{0}<br>", Title);
                sb.AppendFormat("單號:{0}<br>", NO);

                return Normal(UserName, Url, sb.ToString());
            }

            /// <summary>
            /// 審核
            /// </summary>
            /// <param name="Title"></param>
            /// <param name="UserName"></param>
            /// <param name="NO"></param>
            /// <param name="Url"></param>
            /// <returns></returns>
            public static string Approve(string Title, string UserName, string NO, string Url)
            {
                //Remind Reviewer
                StringBuilder sb = new StringBuilder();

                sb.AppendFormat("有一筆資料<font Color='red'>需要您的審核</font><br>");
                sb.AppendFormat("系統:{0}<br>", Title);
                sb.AppendFormat("單號:{0}<br>", NO);
                return Normal(UserName, Url, sb.ToString());
            }


            /// <summary>
            /// 中止
            /// </summary>
            /// <param name="Title"></param>
            /// <param name="UserName"></param>
            /// <param name="NO"></param>
            /// <param name="Url"></param>
            /// <returns></returns>
            public static string Stop(string Title, string UserName, string NO, string Url)
            {
                StringBuilder sb = new StringBuilder();

                sb.AppendFormat("需要您處理的資料，已<font Color='red'>被中止</font><br>");
                sb.AppendFormat("系統:{0}<br>", Title);
                sb.AppendFormat("單號:{0}<br>", NO);

                return Normal(UserName, Url, sb.ToString());
            }

            /// <summary>
            /// 催審
            /// </summary>
            /// <param name="Title"></param>
            /// <param name="UserName"></param>
            /// <param name="NO"></param>
            /// <param name="Url"></param>
            /// <returns></returns>
            public static string Remind(string Title, string UserName, string NO, string Url)
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("EIP中有一筆資料，請您<font Color='red'>盡速審核</font><br>");
                sb.AppendFormat("系統:{0}<br>", Title);
                sb.AppendFormat("單號:{0}<br>", NO);
                return Normal(UserName, Url, sb.ToString());
            }

            /// <summary>
            /// 基本的信件格式
            /// </summary>
            /// <param name="UserName"></param>
            /// <param name="Url"></param>
            /// <param name="Discript"></param>
            /// <returns></returns>
            public static string Normal(string UserName, string Url, string Discript)
            {
                StringBuilder sb = new StringBuilder();

                sb.AppendFormat("Dear {0},<br><br>", UserName);
                sb.AppendFormat("{0}<br>", Discript);
                sb.AppendFormat("資料內容請點選連結查詢<a href='{0}' >{0}</a><br>", Url);
                sb.Append(Bottom());
                return sb.ToString();
            }

            /// <summary>
            /// 通用底稿
            /// </summary>
            /// <returns></returns>
            public static string Bottom()
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("<br>如您想了解更多有關員工入口網站的資訊請點選以下連結進入 <br>");
                sb.Append("<a href=\"" + Utility.LocalUrl + "\">員工入口網站</a><br>");
                sb.Append("感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>");
                return sb.ToString();
            }
        }
        #endregion
    }

    public virtual void loaded()
    {
        //不可刪除
    }

    public static void outFile(string FileName, byte[] attach)
    {
        try
        {

            System.Web.HttpContext.Current.Response.Clear(); //清除buffer
            System.Web.HttpContext.Current.Response.ClearHeaders(); //清除 buffer 表頭
            System.Web.HttpContext.Current.Response.Buffer = false;
            System.Web.HttpContext.Current.Response.ContentType = "application/octet-stream";
            // 檔案類型還有下列幾種"application/pdf"、"application/vnd.ms-excel"、"text/xml"、"text/HTML"、"image/JPEG"、"image/GIF"
            System.Web.HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + System.Web.HttpUtility.UrlEncode(FileName, System.Text.Encoding.UTF8));
            // 考慮 utf-8 檔名問題，以 out_file 設定另存的檔名
            System.Web.HttpContext.Current.Response.AppendHeader("Content-Length", attach.Length.ToString()); //表頭加入檔案大小
            System.Web.HttpContext.Current.Response.BinaryWrite(attach);

            // 將檔案輸出
            System.Web.HttpContext.Current.Response.Flush();
            // 強制 Flush buffer 內容
            System.Web.HttpContext.Current.Response.End();
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }



}
