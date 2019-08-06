using System;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Net;
using System.Xml;

namespace Shipping
{
public partial class ForwarderView : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "Forwarder View Page";
		if (!this.IsPostBack)
		{
			try
			{
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
				rs.Open("SELECT * FROM Forwarder WHERE ID='"+ Request.QueryString["ID"] +"' ");
				if (!rs.EOF)
				{
					
 	 	 	 	 	this.FIELD_PlantID.Text = rs["PlantID"].ToString();
                    this.ERP_Key.Text = rs["ERP_Key"].ToString();
                    this.ERP_Key2.Text = rs["ERP_Key2"].ToString();
 	 	 	 	 	this.FIELD_INV_Num.Text = rs["INV_Num"].ToString();
 	 	 	 	 	this.FIELD_SHIP_To.Text = rs["SHIP_To"].ToString();
 	 	 	 	 	this.FIELD_SHIPPING_No.Text = rs["SHIPPING_No"].ToString();
 	 	 	 	 	this.FIELD_SHIPPING_Dec.Text = rs["SHIPPING_Dec"].ToString();
 	 	 	 	 	this.FIELD_SHIPPING_Mode.Text = rs["SHIPPING_Mode"].ToString();
 	 	 	 	 	this.FIELD_SHIPPING_ModeDec.Text = rs["SHIPPING_ModeDec"].ToString();
 	 	 	 	 	this.FIELD_FORWARDER_Num.Text = rs["FORWARDER_Num"].ToString();
 	 	 	 	 	this.FIELD_FORWARDER_Dec.Text = rs["FORWARDER_Dec"].ToString();
 	 	 	 	 	this.FIELD_HawbNo.Text = rs["HawbNo"].ToString();
 	 	 	 	 	this.FIELD_FitNo.Text = rs["FitNo"].ToString();
 	 	 	 	 	this.FIELD_ETD.Text = rs["ETD"].ToString();
 	 	 	 	 	this.FIELD_ATD.Text = rs["ATD"].ToString();
 	 	 	 	 	this.FIELD_ETA.Text = rs["ETA"].ToString();
 	 	 	 	 	this.FIELD_ATAAS.Text = rs["ATAAS"].ToString();
 	 	 	 	 	this.FIELD_ATAC.Text = rs["ATAC"].ToString();
                    this.Label6.Text = rs["Cdate"].ToString();
				}												  
				else
				{
					Response.Redirect("Forwarder.aspx");
				}
			}
			catch
			{
				Response.Redirect("Forwarder.aspx");
			}
		}
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
		this.GoBack();
	}

    protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
    {
        this.FlowFeedback1.Commit();
    }


    protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
    {

        string FileName = "";
        string INV_Num = "";
        string ForwarderID = "";
        string ERP_Key = "";

        try
        {

            if (e.ResultType.ToString() == "Complete")
            {

                string InitDirectory = @"D:\Forwarder\4GL\";  //原始目錄

                string Plant = "";
                string strYMD = DateTime.Now.ToString("yyyy-MM-dd_hhmmss");
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open(" Select Pkey,ID,ERP_Key,ERP_Key2,PlantID,ProgramID,IsStatus,FileName,INV_Num,SHIP_To,SHIPPING_No,SHIPPING_Dec,SHIPPING_Mode,SHIPPING_ModeDec " +
                " FORWARDER_Num,FORWARDER_Dec,HawbNo,FitNo, CONVERT(VARCHAR, ETD, 111 ) ETD,CONVERT(VARCHAR, ATD, 111 ) ATD,CONVERT(VARCHAR, ETA, 111 ) ETA,CONVERT(VARCHAR, ATAAS, 111 ) ATAAS,CONVERT(VARCHAR, ATAC, 111 ) ATAC " +
                " From Forwarder Where ID = '" + Request.QueryString["ID"] + "'");
                while (!rs.EOF)
                {
                    ForwarderID = rs["ID"].ToString();
                    FileName = rs["FileName"].ToString();
                    INV_Num = rs["INV_Num"].ToString();
                    ERP_Key = rs["ERP_Key"].ToString();

                    FileStream fs = new FileStream(InitDirectory + rs["FileName"].ToString().Replace("axmt850", "axmt610").Replace("axmt620", "axmt610").Replace(".xml", "") + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs);


                    sw.WriteLine("\"" + rs["PlantID"].ToString() + "\",\"" + rs["ProgramID"].ToString() + "\",\"" + rs["ERP_Key"].ToString() + "\",\"N\"," +
                                 "\"" + rs["HawbNo"].ToString() + "\",\"" + rs["FitNo"].ToString() + "\",\"" + rs["ETD"].ToString() + "\"," +
                                 "\"" + rs["ATD"].ToString() + "\",\"" + rs["ETA"].ToString() + "\",\"" + rs["ATAAS"].ToString() + "\",\"" + rs["ATAC"].ToString() + "\"");
                    sw.Close();
                    fs.Close();

                    Upload(InitDirectory + rs["FileName"].ToString().Replace("axmt850", "axmt610").Replace("axmt620", "axmt610").Replace(".xml", "") + ".txt", "ftp://192.168.0.250/" + rs["FileName"].ToString().Replace("axmt850", "axmt610").Replace("axmt620", "axmt610").Replace(".xml", "") + ".txt", "4gl", "4gl");



                    if (rs["ERP_Key2"].ToString() != "")
                    {
                        FileStream fs2 = new FileStream(InitDirectory + rs["PlantID"].ToString() + "_axmt610_" + rs["ERP_Key2"].ToString() + ".txt", FileMode.Create, FileAccess.Write);
                        StreamWriter sw2 = new StreamWriter(fs2);

                        sw2.WriteLine("\"" + rs["PlantID"].ToString() + "\",\"" + rs["ProgramID"].ToString() + "\",\"" + rs["ERP_Key2"].ToString() + "\",\"N\"," +
                                     "\"" + rs["HawbNo"].ToString() + "\",\"" + rs["FitNo"].ToString() + "\",\"" + rs["ETD"].ToString() + "\"," +
                                     "\"" + rs["ATD"].ToString() + "\",\"" + rs["ETA"].ToString() + "\",\"" + rs["ATAAS"].ToString() + "\",\"" + rs["ATAC"].ToString() + "\"");
                        sw2.Close();
                        fs2.Close();
                        Plant = rs["PlantID"].ToString().ToUpper().Trim();

                        Upload(InitDirectory + rs["PlantID"].ToString() + "_axmt610_" + rs["ERP_Key2"].ToString() + ".txt", "ftp://192.168.0.250/" + rs["PlantID"].ToString() + "_axmt610_" + rs["ERP_Key2"].ToString() + ".txt" , "4gl", "4gl");

                    }

                    rs["IsStatus"] = "Complete";


                    rs.Update();



                        MailAddress from = new MailAddress("eip@minaik.com.tw", "Forwarder(審核通知)");
                        MailAddress to = new MailAddress("herzog.lin@minaik.com.tw");

                        if (Plant == "MAP")
                        {
                            MailAddress cc = new MailAddress("nico.huang@minaik.com.tw");
                        }
                        else
                        {
                            MailAddress cc = new MailAddress("nico.huang@minaik.com.tw");
                        }
                        MailMessage message = new MailMessage(from, to);
                        message.Subject = "Forwarder(審核通知)";
                        string ques = "";
                        ques = "您好:" + "<br>" +
                               "<br>" +
                               "Forwarder 審核通知~<br>" +
                               "發票編號：" + INV_Num + "<br>" +
                               "出通單號：" + ERP_Key + "<br>" +
                               "價格條件：" + rs["SHIPPING_No"].ToString() + "<br>" +
                               "價格描述：" + rs["SHIPPING_Dec"].ToString() + "<br>" +
                               "廠商名稱：" + rs["FORWARDER_Dec"].ToString() + "<br>" +
                               "=====================================================<br>" +
                               "<a href=http://eip.minaik.com.tw/Shipping/ForwarderView.aspx?ID=" + ForwarderID + ">http://eip.minaik.com.tw/Shipping/ForwarderView.aspx?ID=" + ForwarderID + "</a><br>" +
                               "因本信件為系統自動發送,請勿直接以此郵件回覆。";
                        message.IsBodyHtml = true;
                        message.Body = ques;
                        SmtpClient client = new SmtpClient("192.168.0.12");
                        client.Send(message);                    
                    
                    rs.MoveNext();



                }
                rs.Close();






            }
            else
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open(" Select Pkey,IsStatus From Forwarder Where ID = '" + Request.QueryString["ID"] + "'");

                while (!rs.EOF)
                {
                    rs["IsStatus"] = e.ResultType.ToString();
                    rs.Update();
                    rs.MoveNext();
                }
                rs.Close();

            }
        }
        catch (Exception ex)
        {
            MailAddress from = new MailAddress("eip@minaik.com.tw", "Forwarder(錯誤訊息)");
            MailAddress to = new MailAddress("herzog.lin@minaik.com.tw");
            MailMessage message = new MailMessage(from, to);
            message.Subject = "Forwarder(錯誤訊息)";
            string ques = "";
            ques = "您好:" + "<br>" +
                   "<br>" +
                   "Forwarder 系統發生錯誤~<br>" +
                   "<br>" +
                   "錯誤編號：" + INV_Num + "<br>" +
                   "錯誤檔案：" + FileName + "<br>" +
                   "錯誤訊息：" + ex + "<br><br>" +
                   "因本信件為系統自動發送,請勿直接以此郵件回覆。";
            message.IsBodyHtml = true;
            message.Body = ques;
            SmtpClient client = new SmtpClient("192.168.0.12");
            client.Send(message);
        }
        
    }
    protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
    {

    }
    protected void FlowFeedback1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
    {

    }
    protected void FlowFeedback1_FeedbackComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
    {
            e.NodeComplete = true;
            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "RedirectAfterCommit", "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");

    }


    //檔案上傳
    internal bool Upload(string fileName, string uploadUrl, string UserName, string Password)
    {
        // fileName上傳的檔案 ex : c:\abc.xml , 
        // uploadUrl上傳的FTP伺服器路徑 ftp://127.0.0.1/檔名
        // UserName使用者FTP登入帳號 , 
        // Password使用者登入密碼

        Stream requestStream = null;
        FileStream fileStream = null;
        FtpWebResponse uploadResponse = null;
        try
        {
            FtpWebRequest uploadRequest = (FtpWebRequest)WebRequest.Create(uploadUrl);
            uploadRequest.Method = WebRequestMethods.Ftp.UploadFile;//設定Method上傳檔案
            uploadRequest.Proxy = null;
            if (UserName.Length > 0)//如果需要帳號登入
            {
                NetworkCredential nc = new NetworkCredential(UserName, Password);
                uploadRequest.Credentials = nc; //設定帳號
            }
            requestStream = uploadRequest.GetRequestStream();
            fileStream = File.Open(fileName, FileMode.Open);
            byte[] buffer = new byte[1024];
            int bytesRead;
            while (true)
            {//開始上傳資料流
                bytesRead = fileStream.Read(buffer, 0, buffer.Length);
                if (bytesRead == 0)
                    break;
                requestStream.Write(buffer, 0, bytesRead);
            }
            requestStream.Close();
            uploadResponse = (FtpWebResponse)uploadRequest.GetResponse();
            return true;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            if (uploadResponse != null)
                uploadResponse.Close();
            if (fileStream != null)
                fileStream.Close();
            if (requestStream != null)
                requestStream.Close();
        }
    }
    //檔案上傳


    #region IMultiApproval Members

    public string[] MultiApproval_ResultTypes
    {
        get
        {
            return new string[]{
                    SmoothEnterprise.Flowwork.Control.ReviewResultType.Next.ToString(), 
                    SmoothEnterprise.Flowwork.Control.ReviewResultType.Back.ToString() };
        }
    }

    #endregion


}
}