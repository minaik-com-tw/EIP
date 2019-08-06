using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for MyLibrary
/// </summary>
public class MyLibrary_apmt420
{
    public MyLibrary_apmt420()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void RunMailProcess(string urlink, string Sname, string Smail,string Stype)
    {
               
        
        //SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        //sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        ////以下步驟需確認dgmessage 有一筆ID 為 “{D9FCE19B-BB81-4067-A05A-118DB711E765}” 的資料

        //sendmessage1.MessageID = new System.Guid("{6D2E7C2B-B009-4980-972D-E2F0EF8A887A}");

        //sendmessage1.Paramaters.Add("receivername", Sname); //加入Email 可使用的屬性
        //sendmessage1.Paramaters.Add("sendername", "ePortal@minaik.com.tw"); //加入Email 可使用的屬性
        //sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性
        //sendmessage1.Paramaters.Add("RequestNotes", addapmt420);
        

        ////if(Stype=="Back")   sendmessage1.Paramaters.Add("reviewresult", "退回(退至上一關)");
        ////if (Stype == "Back")   sendmessage1.Paramaters.Add("reviewresult", "退回(退至提案人)");
        ////if (Stype == "Complete") sendmessage1.Paramaters.Add("reviewresult", "完成通知");


        //sendmessage1.To = Smail; //給定通知人員
        //SmoothEnterprise.Configuration.Parameter para = new
        //SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        //sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        //sendmessage1.Send(); //寄信


        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        //以下步驟需確認dgmessage 有一筆ID 為 “{D9FCE19B-BB81-4067-A05A-118DB711E765}” 的資料

        sendmessage1.MessageID = new System.Guid("{6D2E7C2B-B009-4980-972D-E2F0EF8A887A}");

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



    //public void RunMailProcess2(string urlink, string Sname, string Smail, string Stype,string requestname)
    //{


    //    SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
    //    sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
    //    //以下步驟需確認dgmessage 有一筆ID 為 “{D9FCE19B-BB81-4067-A05A-118DB711E765}” 的資料
    //    if (Stype == "Complete")
    //    {
    //        sendmessage1.MessageID = new System.Guid("{55290564-8251-43b8-bc49-2fd32ef81b5f}");

    //    }
    //    else
    //    {
    //        sendmessage1.MessageID = new System.Guid("{457df47b-6043-4355-8090-fd7adb78ba1d}");

    //    }
    //    sendmessage1.Paramaters.Add("receivername", Sname); //加入Email 可使用的屬性
    //    sendmessage1.Paramaters.Add("sendername", "ePortal@minaik.com.tw"); //加入Email 可使用的屬性
    //    sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性

    //    sendmessage1.Paramaters.Add("requestername", requestname);
        


    //    if (Stype == "Back") sendmessage1.Paramaters.Add("reviewresult", "退回(退至上一關)");
    //    if (Stype == "Back") sendmessage1.Paramaters.Add("reviewresult", "退回(退至提案人)");
    //    if (Stype == "Complete") sendmessage1.Paramaters.Add("reviewresult", "完成通知");


    //    sendmessage1.To = Smail; //給定通知人員
    //    SmoothEnterprise.Configuration.Parameter para = new
    //    SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
    //    sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
    //    sendmessage1.Send(); //寄信


    //}
}
