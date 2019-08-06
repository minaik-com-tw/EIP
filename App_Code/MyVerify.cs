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
public class MyVerify
{
    public MyVerify()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void RunMailMyVerify(string urlink, string Sname, string Smail, string Stype, string Fname)
    {
               
        
        SmoothEnterprise.Web.Mail.SendMessage sendmessage1 = new SmoothEnterprise.Web.Mail.SendMessage();
        sendmessage1.Format = SmoothEnterprise.Web.Mail.MailFormat.Html;
        //以下步驟需確認dgmessage 有一筆ID 為 “{D9FCE19B-BB81-4067-A05A-118DB711E765}” 的資料
        sendmessage1.MessageID = new System.Guid("{9597DBB5-1579-44EE-B1C9-AF017E6310F0}");
        sendmessage1.Paramaters.Add("reviewername", Sname); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("sendername", "ePortal@minaik.com.tw"); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requesturl", urlink); //加入Email 可使用的屬性
        sendmessage1.Paramaters.Add("requestername", Stype);
        sendmessage1.Paramaters.Add("flowtext", Fname);


        sendmessage1.To = Smail; //給定通知人員
        SmoothEnterprise.Configuration.Parameter para = new
        SmoothEnterprise.Configuration.Parameter(SmoothEnterprise.Configuration.Application.ConnectionString());
        sendmessage1.From = para.AdministratorEMail.ToString(); //寄信From 填入系統管理者Mail
        sendmessage1.Send(); //寄信


    }


}
