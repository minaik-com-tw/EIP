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
using System.Net.Mail;
using System.IO;


public partial class OutMailsche : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String ques;
        string sel_sql = string.Empty;

        #region - 閒置一天以上的單據通知申請人
        try
        {
            sel_sql = "SELECT A.*,I.name AS emu_name,I.email AS emu_email,datediff(hh,A.pmk04,GetDate()) delay,I.authcode FROM APMT420_IN_HEAD A  " +
                      "LEFT OUTER JOIN dguser I on SUBSTRING(A.PMK12,2,5) = I.empid  " +
                      "WHERE A.STATUS <> '作廢' AND A.STATUS <> 'Y' AND datediff(hh,A.pmk04,GetDate()) >= 24  ";
            Response.Write(sel_sql);
            //由於定期程序管理設定-待審核項目提醒通知已啟用，故更改為未送審單據才發通知
            //sel_sql = "SELECT A.*,I.name AS emu_name,I.email AS emu_email,datediff(hh,A.adddate,GetDate()) delay FROM out_main A " +
            //          "LEFT OUTER JOIN dguser I on A.emuid = I.id " +
            //          "WHERE A.type = 'N' AND datediff(hh,A.adddate,GetDate()) >= 24";

            SmoothEnterprise.Database.DataSet attch = new SmoothEnterprise.Database.DataSet();
            attch.Open(sel_sql);

            while (!attch.EOF)
            {

                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                MailAddress to = new MailAddress(attch["emu_email"].ToString());

                MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

                MailMessage message = new MailMessage(from, to);
                message.Bcc.Add(bcc);

                ques = "您好:" + "<br>" +
                       "<br>" +
                       "ERP雜項請購申請單現有一筆資料閒置一天以上，正等待您的處理(單據作廢、送審或催審):" + "<br>" +
                       "<br>" +
                       "申請單號 : " + attch["no"].ToString() + "<br>" +
                       "申請日期 : " + attch["pmk04"].ToString() + "<br>" +
                       "申請人員 : " + attch["gen02_3"].ToString() + "<br>" +
                       "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/ERP_APMT420/APMT420EDIT.aspx?id=" + attch["id"].ToString() + "\" >至ERP雜項請購申請單電子簽核系統檢視並編輯內容</a>" +
                       "<br>" +
                       "<br>" +
                       "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                       "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                       "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                message.Subject = "ERP雜項請購申請單,單號 - " + attch["no"].ToString() + " 等待您的處理";
                message.IsBodyHtml = true;
                message.Body = ques;

                SmtpClient client = new SmtpClient("192.168.0.12");

                client.Send(message);

                Response.Write("Mail傳送完畢"+"<br>");

                attch.MoveNext();
            }

            attch.Close();
        }
        catch
        {
        }
        #endregion

        //找出已完成審核但仍未登錄的單據
        //SELECT A.*,datediff(hh,A.adddate,GetDate()) delay,I.name AS emu_name,I.email AS emu_email FROM out_main A 
        //LEFT OUTER JOIN dguser I on A.emuid = I.id 
        //WHERE A.type='Complete' AND export = 'N'

    }

}
