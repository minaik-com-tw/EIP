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
public class MyLibrary
{
	public MyLibrary()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public void Run_NetMail(string to1, string ID, string subject1, string EndMessage, string linkid, string papername)
    {
        string url1 = "http://eip.minaik.com.tw/CSM/Master/csRepview.aspx?SysId=" + linkid;
        MailAddress from = new MailAddress("EIP@minaik.com.tw", "ePortal(MA QA-CSS)");
        MailAddress to = new MailAddress(to1);
        MailMessage message = new MailMessage(from, to);

        // Response.Write(Request.QueryString["rowid"]);

        String bodys = "Dear " + ID + " 先生/小姐<hr>目前有一封客訴<br>客戶:<font color='blue'>" +
               papername + "</font><br>主旨:<font color='blue'>" +
               EndMessage + "</font><p><p><a href=" + url1 + ">點閱詳細資料</a><p>" +
               "<center>以上信件為系統自動轉發,請勿回覆";



        message.Subject = subject1; // ID + "審核單據已經完成";

        message.Body = string.Format(@"" + bodys + "");
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("192.168.0.12");
        client.Send(message);


    }


    public void RunMailProcess(string urlink, string Sname, string Smail,string Stype)
    {
               
        
        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        //以下步驟需確認dgmessage 有一筆ID 為 “{D9FCE19B-BB81-4067-A05A-118DB711E765}” 的資料
        if (Stype == "Complete")
        {
            sendmessage1.MessageID = new System.Guid("{55290564-8251-43b8-bc49-2fd32ef81b5f}");
        
        }
        else
        {
            sendmessage1.MessageID = new System.Guid("{457df47b-6043-4355-8090-fd7adb78ba1d}");
        
        }
        sendmessage1.Paramaters.Add("receivername", Sname); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("sendername", "ePortal@minaik.com.tw"); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性
        

        if(Stype=="Back")   sendmessage1.Paramaters.Add("reviewresult", "退回(退至上一關)");
        if (Stype == "Back")   sendmessage1.Paramaters.Add("reviewresult", "退回(退至提案人)");
        if (Stype == "Complete") sendmessage1.Paramaters.Add("reviewresult", "完成通知");


        sendmessage1.To = Smail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.Send(); //寄信


    }


    public void DeputyProcess(string urlink, string Sname, string Smail, string Stype, string requename)
    {
               
        
        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        //以下步驟需確認dgmessage 有一筆ID 為 “{D9FCE19B-BB81-4067-A05A-118DB711E765}” 的資料
        sendmessage1.MessageID = new System.Guid("{056f4b37-fc52-424f-b8df-9962142a8052}");
        
        
        sendmessage1.Paramaters.Add("receivername", Sname); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("sendername", Stype); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requestername", requename); //加入Email 可使用的屬性
        
         
         

        sendmessage1.To = Smail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.Send(); //寄信


    }

    
    public void RemindProcess(string urlink, string Sname, string Smail, string Stype, string requename)
    {
               
        
        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        //以下步驟需確認dgmessage 有一筆ID 為 “{D9FCE19B-BB81-4067-A05A-118DB711E765}” 的資料
        sendmessage1.MessageID = new System.Guid("{C8843A29-E99A-4AE5-BE06-03100C3F68B6}");
        
        
        sendmessage1.Paramaters.Add("receivername", Sname); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("sendername", Stype); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requestername", requename); //加入Email 可使用的屬性
        
         
         

        sendmessage1.To = Smail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.Send(); //寄信


    }

    public void RunMailProcessH(string urlink, string Sname, string Smail, string Stype)
    {
 


        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        //以下步驟需確認dgmessage 有一筆ID 為 “{D9FCE19B-BB81-4067-A05A-118DB711E765}” 的資料

        sendmessage1.MessageID = new System.Guid("{34e676d7-d413-46df-9173-d6f0dc7159a1}");

        sendmessage1.Paramaters.Add("receivername", Sname); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("sendername", "ePortal@minaik.com.tw"); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requestername", Stype);



        sendmessage1.To = Smail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.Send(); //寄信


    }


    

    public void RunMailProcess2(string urlink, string Sname, string Smail, string Stype,string requestname)
    {


        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        //以下步驟需確認dgmessage 有一筆ID 為 “{D9FCE19B-BB81-4067-A05A-118DB711E765}” 的資料
        if (Stype == "Complete")
        {
            sendmessage1.MessageID = new System.Guid("{55290564-8251-43b8-bc49-2fd32ef81b5f}");

        }
        else
        {
            sendmessage1.MessageID = new System.Guid("{457df47b-6043-4355-8090-fd7adb78ba1d}");

        }
        sendmessage1.Paramaters.Add("receivername", Sname); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("sendername", "ePortal@minaik.com.tw"); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性

        sendmessage1.Paramaters.Add("requestername", requestname);
        


        if (Stype == "Back") sendmessage1.Paramaters.Add("reviewresult", "退回(退至上一關)");
        if (Stype == "Back") sendmessage1.Paramaters.Add("reviewresult", "退回(退至提案人)");
        if (Stype == "Complete") sendmessage1.Paramaters.Add("reviewresult", "完成通知");


        sendmessage1.To = Smail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.Send(); //寄信


    }
}
