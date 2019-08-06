using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;

/// <summary>
/// Summary description for MyLibrary
/// </summary>
public class ShrFlowMail
{
    public ShrFlowMail()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    //送審通知
    public void SendMail(string MId, string PapCaption ,string PID,  string AppName, string AppMail,
           string urlink, string body)
    {
        

        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        sendmessage1.MessageID = new System.Guid(MId);
        sendmessage1.Paramaters.Add("PapCaption", PapCaption); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("PID", PID); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("receivername", AppName); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("Body", body);

        sendmessage1.To = AppMail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.BodyEncoding = System.Text.Encoding.UTF8;
        sendmessage1.Send(); //寄信


     }
     //退回通知
    public void StopApprove(string MId, string PId, string PapCaption, string receivername, string requestername,
        string requesturl, string reviewresult, string body, string AppMail)
    {
         
         SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
         sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
         sendmessage1.MessageID = new System.Guid(MId);
         sendmessage1.Paramaters.Add("PapCaption", PapCaption); //加入Email 可使用的屬性
         sendmessage1.Paramaters.Add("PID", PId); //加入Email 可使用的屬性
         sendmessage1.Paramaters.Add("receivername", receivername); //加入Email 可使用的屬性
         sendmessage1.Paramaters.Add("requestername", requestername); //加入Email 可使用的屬性
         sendmessage1.Paramaters.Add("requesturl", requesturl); //加入Email 可使用的屬性
         sendmessage1.Paramaters.Add("reviewresult", reviewresult); //加入Email 可使用的屬性
         sendmessage1.Paramaters.Add("Body", body);

         sendmessage1.To = AppMail; //給定通知人員
         SmoothEnterprise.Configuration.Parameter para = new
         SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
         sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
         sendmessage1.BodyEncoding = System.Text.Encoding.UTF8;
         sendmessage1.Send(); //寄信
     }
     //催審通知
    public void RemindApprove(string MId, string PID, string receivername, string requesturl,
         string AppMail, string PapCaption, string body, string requestername)
     {
          
             
           
            SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
            sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
            sendmessage1.MessageID = new System.Guid(MId);
            sendmessage1.Paramaters.Add("PapCaption", PapCaption); //加入Email 可使用的屬性
            sendmessage1.Paramaters.Add("PID", PID); //加入Email 可使用的屬性
            sendmessage1.Paramaters.Add("receivername", receivername); //加入Email 可使用的屬性
            sendmessage1.Paramaters.Add("requestername", requestername); //加入Email 可使用的屬性
            sendmessage1.Paramaters.Add("requesturl", requesturl); //加入Email 可使用的屬性
            sendmessage1.Paramaters.Add("Body", body);

            sendmessage1.To = AppMail; //給定通知人員
            SmoothEnterprise.Configuration.Parameter para = new
            SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
            sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
            sendmessage1.BodyEncoding = System.Text.Encoding.UTF8;
            sendmessage1.Send(); //寄信




     }


     //完成審核通知 
    public void FinishApprove(string MId, string PapCaption, string PID, string AppMail, string body, string receivername, string requesturl, string reviewresult)
    {
        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        sendmessage1.MessageID = new System.Guid(MId);
        sendmessage1.Paramaters.Add("PapCaption", PapCaption); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("PID", PID); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("receivername", receivername); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requesturl", requesturl); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("Body", body);
        sendmessage1.Paramaters.Add("reviewresult", reviewresult); //加入Email 可使用的屬性

        sendmessage1.To = AppMail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.BodyEncoding = System.Text.Encoding.UTF8;
        sendmessage1.Send(); //寄信

      


    }


    /*
     *   上一關審核後,通知下一關審核者,進行審核通知
     * 
     * 
     */ 
    public void ApproveMail(string MId, string PapCaption, string PID, string AppName, string urlink,
        string AppMail, string body)
    {
        
        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        sendmessage1.MessageID = new System.Guid(MId);
        sendmessage1.Paramaters.Add("PapCaption", PapCaption); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("PID", PID); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("receivername", AppName); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("Body", body);

        sendmessage1.To = AppMail; //給定通知人員
        
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.BodyEncoding = System.Text.Encoding.UTF8;
        sendmessage1.Send(); //寄信

        Utility.log(0, sendmessage1.Body);
      
    }

    
    //退回通知 
    //MessageID,單號,單據名稱,單據所有人,待審人姓名,待審人mail,有限內容
    public void RejectResult(string MId, string PapCaption, string PID, string AppMail, string body, string receivername, string requesturl, string reviewresult)
    {
        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        sendmessage1.MessageID = new System.Guid(MId);
        sendmessage1.Paramaters.Add("PapCaption", PapCaption); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("PID", PID); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("receivername", receivername); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requesturl", requesturl); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("Body", body);
        sendmessage1.Paramaters.Add("reviewresult", reviewresult); //加入Email 可使用的屬性

        sendmessage1.To = AppMail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.BodyEncoding = System.Text.Encoding.UTF8;
        sendmessage1.Send(); //寄信

    }



    public void StopApprove(string MId, string PId, string PapCaption, string receivername, string AppMail)
    {

        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        sendmessage1.MessageID = new System.Guid(MId);
        sendmessage1.Paramaters.Add("PapCaption", PapCaption); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("PID", PId); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("receivername", receivername); //加入Email 可使用的屬性
        
        sendmessage1.To = AppMail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.BodyEncoding = System.Text.Encoding.UTF8;
        sendmessage1.Send(); //寄信
    }
   

    //一般的通知
    public void NormalResult(string AppMail,string MId, string subject, string content, string receivername)
    {
        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        sendmessage1.MessageID = new System.Guid(MId);
        sendmessage1.Paramaters.Add("subject", subject); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("content", content); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("receivername", receivername); //加入Email 可使用的屬性
      

        sendmessage1.To = AppMail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.BodyEncoding = System.Text.Encoding.UTF8;
        sendmessage1.Send(); //寄信

    }
     
}
