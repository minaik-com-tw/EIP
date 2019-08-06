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
/// Summary description for MailLayout
/// </summary>
public class MailLayout
{
	public MailLayout(){
    
    
    }

    private string mailip = "192.168.0.12";
    private string domain = "eip@minaik.com.tw";
		//
		// TODO: Add constructor logic here
		//
        //送審通知
    public void Sendmail(string name,string mail,string subject,string url,string SendName){
            
         //   string url1 = "http://eip.minaik.com.tw/testpaper/twfrmviewm.aspx?rowid=" + Request.QueryString["rowid"];
            
            
            
             SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
           
             MailAddress from = new MailAddress(domain);
             MailAddress to = new MailAddress(mail);
             MailMessage message = new MailMessage(from, to);

         

             String bodys = "<table width='550' border='0'><tr><td>Dear " + name +
                 "</td></tr><tr><td><hr noshade='noshade' size='1' style='border-right: #cccccc 1px dashed; border-top: #cccccc 1px dashed;"+
                 "border-left: #cccccc 1px dashed; border-bottom: #cccccc 1px dashed' width='100%' /></td></tr><tr><td >" + SendName +
                 "提出了審核的請示，懇請撥空處理</td></tr>" +
                 "<tr><td height='100'><a href=" + url + ">點閱詳細資料</a>" +
                 "<td></tr><tr><td>Best Regards <br >EIP System</td></tr></table>";


             ActionSend(message, name, SendName, subject, bodys);


        }

   
        //簽核後通知
    public void Approvemail(string name, string mail, string subject, string url, string SendName)
    {

        //   string url1 = "http://eip.minaik.com.tw/testpaper/twfrmviewm.aspx?rowid=" + Request.QueryString["rowid"];



        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        MailAddress from = new MailAddress("eip@minaik.com.tw");
        MailAddress to = new MailAddress(mail);
        MailMessage message = new MailMessage(from, to);



        String bodys = "<table width='550' border='0'><tr><td>Dear " + name +
            "</td></tr><tr><td><hr noshade='noshade' size='1' style='border-right: #cccccc 1px dashed; border-top: #cccccc 1px dashed;" +
            "border-left: #cccccc 1px dashed; border-bottom: #cccccc 1px dashed' width='100%' /></td></tr><tr><td >" + SendName +
            "提出了審核的請示，懇請撥空處理</td></tr>" +
            "<tr><td height='100'><a href=" + url + ">點閱詳細資料</a>" +
            "<td></tr><tr><td>Best Regards <br >EIP System</td></tr></table>";


        message.Subject = name + " 您有來自" + SendName + " 的" + subject + "等待您的處理";

        message.Body = string.Format(@"" + bodys + "");
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("192.168.0.12");
        client.Send(message);


    }



        //中止通知
    public void Stopmail(string name, string mail, string subject, string url, string SendName)
    {

        //   string url1 = "http://eip.minaik.com.tw/testpaper/twfrmviewm.aspx?rowid=" + Request.QueryString["rowid"];



        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        MailAddress from = new MailAddress("eip@minaik.com.tw");
        MailAddress to = new MailAddress(mail);
        MailMessage message = new MailMessage(from, to);



        String bodys = "<table width='550' border='0'><tr><td>Dear " + name +
            "</td></tr><tr><td><hr noshade='noshade' size='1' style='border-right: #cccccc 1px dashed; border-top: #cccccc 1px dashed;" +
            "border-left: #cccccc 1px dashed; border-bottom: #cccccc 1px dashed' width='100%' /></td></tr><tr><td >" + SendName +
            "提出了審核的請示，懇請撥空處理</td></tr>" +
            "<tr><td height='100'><a href=" + url + ">點閱詳細資料</a>" +
            "<td></tr><tr><td>Best Regards <br >EIP System</td></tr></table>";


        message.Subject = name + " 您有來自" + SendName + " 的" + subject + "等待您的處理";

        message.Body = string.Format(@"" + bodys + "");
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("192.168.0.12");
        client.Send(message);


    }




        //催審通知
    public void pushmail(string name, string mail, string subject, string url, string SendName)
    {

        //   string url1 = "http://eip.minaik.com.tw/testpaper/twfrmviewm.aspx?rowid=" + Request.QueryString["rowid"];



        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        MailAddress from = new MailAddress("eip@minaik.com.tw");
        MailAddress to = new MailAddress(mail);
        MailMessage message = new MailMessage(from, to);



        String bodys = "<table width='550' border='0'><tr><td>Dear " + name +
            "</td></tr><tr><td><hr noshade='noshade' size='1' style='border-right: #cccccc 1px dashed; border-top: #cccccc 1px dashed;" +
            "border-left: #cccccc 1px dashed; border-bottom: #cccccc 1px dashed' width='100%' /></td></tr><tr><td >" + SendName +
            "對於此單據,比較急迫,懇請你撥空處理</td></tr>" +
            "<tr><td height='100'><a href=" + url + ">點閱詳細資料</a>" +
            "<td></tr><tr><td>Best Regards <br >EIP System</td></tr></table>";


        message.Subject = name + " 您有來自" + SendName + " 的" + subject + "等待您的處理";

        message.Body = string.Format(@"" + bodys + "");
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("192.168.0.12");
        client.Send(message);


    }

    private void ActionSend(MailMessage mm, string name, string SendName, string subject, string bodys)
    {

        mm.Subject = name + " 您有來自" + SendName + " 的" + subject + "等待您的處理";

        mm.Body = string.Format(@"" + bodys + "");
        mm.BodyEncoding = System.Text.Encoding.UTF8;
        mm.IsBodyHtml = true;
        SmtpClient client = new SmtpClient(mailip);
        client.Send(mm);


    }

    //簽核後通知
    public void finAppmail(string name, string mail, string subject, string url, string SendName)
    {

        //   string url1 = "http://eip.minaik.com.tw/testpaper/twfrmviewm.aspx?rowid=" + Request.QueryString["rowid"];



        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        MailAddress from = new MailAddress("eip@minaik.com.tw");
        MailAddress to = new MailAddress(mail);
        MailMessage message = new MailMessage(from, to);



        String bodys = "<table width='550' border='0'><tr><td>Dear " + name +
            "</td></tr><tr><td><hr noshade='noshade' size='1' style='border-right: #cccccc 1px dashed; border-top: #cccccc 1px dashed;" +
            "border-left: #cccccc 1px dashed; border-bottom: #cccccc 1px dashed' width='100%' /></td></tr><tr><td >" + SendName +
            "完成審核流程</td></tr>" +
            "<tr><td height='100'><a href=" + url + ">點閱詳細資料</a>" +
            "<td></tr><tr><td>Best Regards <br >EIP System</td></tr></table>";


        message.Subject = name + "妳之前送審的單子,已經處理完畢";

        message.Body = string.Format(@"" + bodys + "");
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("192.168.0.12");
        client.Send(message);


    }
	 
}
