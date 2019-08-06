using SmoothEnterprise.Flowwork.UI.WebControl;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Text;
using System.Threading;
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
            sb.Append(" SELECT  top 1 requesturl, revieweruid,name,email,convert(varchar(20), a.initdate,120)'initdate' FROM   eipa.dbo.dgflowqueue a  ");
            sb.AppendFormat(" left join eipa.dbo.dguser b   on revieweruid=b.id  where requesturl like '%{0}' order by b.initdate  desc ", rowid);
            //  sb.AppendFormat("  and resulttype is null and revieweruid!='00000000-0000-0000-0000-000000000000' ");


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
        /// 催審
        /// </summary>
        /// <param name="rowid">url </param>
        /// <param name="subject">mail subject </param>
        /// <param name="mail"> 制式格式，不需要寫 [詳細資料請點選連結進入……]等 EIP結尾用語 </param>
        //public void RemindReviewer(string url, string subject, string content)
        //{
        //    StringBuilder sb = new StringBuilder();
        //    sb.Append(" SELECT  requesturl, revieweruid,name,email,convert(varchar(20), a.initdate,120)'initdate' FROM   eipa.dbo.dgflowqueue a  ");
        //    sb.AppendFormat(" left join eipa.dbo.dguser b   on revieweruid=b.id  where requesturl like '%{0}' ", rowid);
        //    sb.AppendFormat("  and resulttype is null and revieweruid!='00000000-0000-0000-0000-000000000000' ");


        //    using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        //    {
        //        ds.Open(sb.ToString());

        //        if (!ds.EOF)
        //        {
        //            string uid = ds["revieweruid"].ToString();
        //            string email = ds["email"].ToString();
        //            string name = ds["name"].ToString();
        //            string initdate = ds["initdate"].ToString();

        //            StringBuilder body = new StringBuilder();

        //            body.AppendFormat("Dear {0},<br>", name);
        //            body.AppendFormat("{0}<br>", content);

        //            body.AppendFormat("詳細資料請點選連結進入: {0}{1}<br><br>", Utility.LocalUrl, url);

        //            body.Append("如您想了解更多有關員工入口網站的資訊請點選以下連結進入 <br>");
        //            sb.Append("<a href=\"" + Utility.LocalUrl + "\">員工入口網站</a><br>");
        //            body.Append("感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>");

        //            Utility.MailFromEIP(email, subject, body.ToString(), false);

        //            DeputyApprove(uid, ds["requesturl"].ToString(), subject + " (代)", content);

        //        }


        //    }


        //    //Response.Redirect("OQCView.aspx?id=" + Request.QueryString["id"].ToString());
        //}

        #region Approve

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

                DeputyApprove2(user_id, rowid, Subject, MailBody);

            }
        }
        #endregion Approve

        #region 代理人
        private void DeputyApprove(string id, string request_url, string subject, string content)
        {
            StringBuilder body = new StringBuilder();

            body.Append("Dear *** ,<br>");
            body.AppendFormat("{0}<br>", content);

            body.AppendFormat("詳細資料請點選連結進入: {0}{1}<br><br>", Utility.LocalUrl, request_url);

            body.Append("如您想了解更多有關員工入口網站的資訊請點選以下連結進入 <br>");
            body.Append("<a href=\"" + Utility.LocalUrl + "\">員工入口網站</a><br>");
            body.Append("感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>");

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

                    string text = body.ToString().Replace("***", AppName);

                    Utility.MailFromEIP(AppMail, subject, text, false);

                    rs2.MoveNext();

                }
                rs2.Close();
            }
        }

        private void DeputyApprove2(string id, string request_url, string subject, string content)
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
        #endregion

        public void Feedback_FeedbackComplete(string uid, string url, FlowFeedback feedback, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
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
                it3.Text = uid;
                e["Flow_loginID"] = it3.Text;

                //寫入是否為代理人
                SmoothEnterprise.Web.UI.HTMLControl.InputText it4;
                object obj4 = feedback.ReplyView.FindControl("IniReviewer");
                it4 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj4;
                e["IniReviewer"] = "代";

                StringBuilder sb = new StringBuilder();
                //
                sb.AppendFormat(" select revieweruid  from  eipa.dbo.dgflowqueue   where requesturl like '%{0}' ", url);
                sb.AppendFormat("  and revieweruid='{0}' and  initdate=(select MAX(initdate)   from  eipa.dbo.dgflowqueue    where requesturl like '%{1}') ", uid, url);
                sb.AppendFormat(" and  initdate=(select MAX(initdate)   from  eipa.dbo.dgflowqueue    where requesturl like '%{0}') ", url);

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

        public void FlowViewer_History(FlowFeedbackViewer fview, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            Label label;
            object obj = fview.HistoryView.FindControl("Show_Comment");
            label = (Label)obj;
            label.Text = e["Flow_Comment"].ToString();
            label.ForeColor = System.Drawing.Color.Red;
            label.Font.Bold = true;
            label.Enabled = true;
            label.Font.Size = 13;

            //電子簽章呈現-----------------------------------------------------------------------------------------
            System.Web.UI.WebControls.Image sin1;
            object obj5 = fview.HistoryView.FindControl("Image1");
            sin1 = (System.Web.UI.WebControls.Image)obj5;
            //Response.Write((string)e["Flow_loginID"] + "--");
            if ((string)e["Flow_loginID"].ToString().Length.ToString() != "0")
            {
                sin1.Visible = true;
            }
            else
            {
                sin1.Visible = false;
            }

            Dictionary<string, string> us = Utility.GetUIDInfo(e["Flow_loginID"].ToString());
            sin1.ImageUrl = "~/image/" + us["LOGONID"] + ".jpg";

            System.Web.UI.WebControls.Image sin2;
            object obj6 = fview.HistoryView.FindControl("Image2");
            sin2 = (System.Web.UI.WebControls.Image)obj6;

            if ((string)e["IniReviewer"].ToString().Length.ToString() == "0") sin2.Visible = false;
            else sin2.Visible = true;

        }


        //DeputyApprove
        public void GetCurrApproveMail(string _rowid, ref string emial, ref string name)
        {
            Utility.log(1, string.Format("{0},id:{1}", "FlowFeedback1_FlowStop", _rowid));

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
                    emial = ds["email"].ToString();

                }
            }
        }
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

