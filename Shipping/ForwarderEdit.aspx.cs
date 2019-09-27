using System;
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

namespace Shipping
{
public partial class ForwarderEdit : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "Forwarder Edit Page";
		try
		{
			if (!this.IsPostBack)
			{
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
				rs.Open("SELECT * FROM Forwarder WHERE ID='"+ Request.QueryString["ID"] +"' ");
				if (!rs.EOF)
				{
                    this.FIELD_PlantID.Text = rs["PlantID"].ToString();
                    this.ERP_Key.Text = rs["ERP_Key"].ToString();
                    this.ERP_Key2.Text = rs["ERP_Key2"].ToString();
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

                    this.INV_num.Text = rs["INV_Num"].ToString();




                    /*
 	 	 	 	    
                    this.FIELD_Udate.Text = rs["Udate"].ToString();
 	 	 	 	 	this.FIELD_Cdate.Text = rs["Cdate"].ToString();
                      
                    */
				}												  
				else
				{
					Response.Redirect("Forwarder.aspx");
				}
                DBTransfer fg = new DBTransfer();
                string fac=fg.GetTopfile("select comid from  dguser where id='"+this.CurrentUser.ID+"'");
                if (fac == "MAT") PopupUser1.Text = "9254F876-0DE1-41B6-866B-CBFE796F8871";
                else PopupUser1.Text = "515191BF-38DA-44D5-A19A-72B2A0E21E3A";  //彭沛榛
                

			}
		}
		catch
		{
			Response.Redirect("Forwarder.aspx");
		}
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
    	}
	}

	protected void BUTTON_save_Click(object sender, System.EventArgs e)
	{
		if (this.IsValid)
		{
			try
			{
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM Forwarder WHERE ID='"+ Request.QueryString["ID"] +"' ");
				if (!rs.EOF)
				{
					
 	 	 	 	 	if (this.FIELD_SHIP_To.Text!="") rs["SHIP_To"] = this.FIELD_SHIP_To.Text ; else rs["SHIP_To"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_SHIPPING_No.Text!="") rs["SHIPPING_No"] = this.FIELD_SHIPPING_No.Text ; else rs["SHIPPING_No"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_SHIPPING_Dec.Text!="") rs["SHIPPING_Dec"] = this.FIELD_SHIPPING_Dec.Text ; else rs["SHIPPING_Dec"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_SHIPPING_Mode.Text!="") rs["SHIPPING_Mode"] = this.FIELD_SHIPPING_Mode.Text ; else rs["SHIPPING_Mode"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_SHIPPING_ModeDec.Text!="") rs["SHIPPING_ModeDec"] = this.FIELD_SHIPPING_ModeDec.Text ; else rs["SHIPPING_ModeDec"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_FORWARDER_Num.Text!="") rs["FORWARDER_Num"] = this.FIELD_FORWARDER_Num.Text ; else rs["FORWARDER_Num"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_FORWARDER_Dec.Text!="") rs["FORWARDER_Dec"] = this.FIELD_FORWARDER_Dec.Text ; else rs["FORWARDER_Dec"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_HawbNo.Text!="") rs["HawbNo"] = this.FIELD_HawbNo.Text ; else rs["HawbNo"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_FitNo.Text!="") rs["FitNo"] = this.FIELD_FitNo.Text ; else rs["FitNo"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_ETD.Text!="") rs["ETD"] = this.FIELD_ETD.Text ; else rs["ETD"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_ATD.Text!="") rs["ATD"] = this.FIELD_ATD.Text ; else rs["ATD"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_ETA.Text!="") rs["ETA"] = this.FIELD_ETA.Text ; else rs["ETA"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_ATAAS.Text!="") rs["ATAAS"] = this.FIELD_ATAAS.Text ; else rs["ATAAS"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_ATAC.Text!="") rs["ATAC"] = this.FIELD_ATAC.Text ; else rs["ATAC"] = System.DBNull.Value ;
 	 	 	 	 	
                    //if (this.FIELD_Udate.Text!="") rs["Udate"] = this.FIELD_Udate.Text ; else rs["Udate"] = System.DBNull.Value ;
 	 	 	 	 	//if (this.FIELD_Cdate.Text!="") rs["Cdate"] = this.FIELD_Cdate.Text ; else rs["Cdate"] = System.DBNull.Value ;

					rs.Update();
				}
				rs.Close();
				Response.Redirect("Forwarder.aspx");
			}
			catch (Exception ex)
			{
				this.AddError(this,"BUTTON_save_Click()","",ex.Message);
			}
		}
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        this.GoBack("Forwarder.aspx",new string[]{"ForwarderDelete.aspx"});
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("ForwarderDelete.aspx?ID="+Request.QueryString["ID"]);


	}
    protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {
        //
        FlowClient1.TypeName = "sharflow12.Flowwork.sharflow121";
        FlowClient1.Text = "ShppingFlow";

        ArrayList managerid = new ArrayList();  //主管id arraylist
        ArrayList managernm = new ArrayList(); 
        
        managerid.Add(PopupUser1.Text);  //主管id arraylist
        managernm.Add("船務");  //主管職稱 arraylist



        sharflow12.Flowwork.sharflow121 flow = new sharflow12.Flowwork.sharflow121();

        switch (managerid.Count)  //依舊arraylist裡面有幾個,來判斷走那條flow
        {

            case 1:
                e.NextNode = flow.sharflow12Node1;
                break;

            case 2:
                e.NextNode = flow.sharflow12Node2;
                break;

             
        }
        e.NextNode.ReviewerURL = "/Shipping/Forwarderview.aspx";
 
       
        foreach (string i in managerid)  //將簽核人員id塞進flow
        {
            this.FlowClient1.AddParameter("USER0"  , i);

            
        }

        

        foreach (string i in managernm)  //將簽核人員職稱塞進flow
        {
            this.FlowClient1.AddParameter("USERTITLE0"  , i);

            
        }

        
        
        
        
        
        SmoothEnterprise.Database.DataSet rs0 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rs0.Open("SELECT ID,Pkey,IsStatus FROM Forwarder WHERE ID='" + Request.QueryString["ID"] + "'");
        if (!rs0.EOF)
        {
            rs0["IsStatus"] = "isSend";
            rs0.Update();
        }
        rs0.Close();
    }
    protected void BUTTON_StopRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {
        SmoothEnterprise.Database.DataSet rs0 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rs0.Open("SELECT ID,Pkey,IsStatus FROM Forwarder WHERE ID='" + Request.QueryString["ID"] + "'");
        if (!rs0.EOF)
        {
            rs0["IsStatus"] = "waiting";
            rs0.Update();
        }
        rs0.Close();
    }
     
    protected void InputButton1_Click(object sender, EventArgs e)
    {
        MailAddress from = new MailAddress("eip@minaik.com.tw", "Forwarder(審核通知-" + ERP_Key.Text + ")");
        //  MailAddress to=new MailAddress(

        string Errmsg = "您好:" + "<br>" +
                   "<br>" +
                   "時間：" + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss") + "<br><br>" +
                   "出通單號：" + ERP_Key.Text + "<br>" +
                   "發票編號：" + INV_num.Text + "<br>" +
                   "價格條件：" + FIELD_SHIPPING_No.Text + "<br>" +
                   "價格描述：" + FIELD_SHIPPING_Dec.Text + "<br>" +
                   "===================== 明  細  異  動 =====================<br>" + 
                   "====================================================<br>" +
                   "點選下列連結進行審核!!<br>" +
                   "<a href=http://eip.minaik.com.tw/Shipping/ForwarderView.aspx?ID=" + Request.QueryString["id"].ToString() + ">http://eip.minaik.com.tw/Shipping/ForwarderView.aspx?ID=" + Request.QueryString[0].ToString() + "</a><br>" +
                   "因本信件為系統自動發送,請勿直接以此郵件回覆。";

        //MailAddress bcc = new MailAddress("herzog.lin@minaik.com.tw");

        MailAddress to = new MailAddress("cindy.lin@minaik.com.tw");
        MailMessage message = new MailMessage(from, to);
        //message.Bcc.Add(bcc);
        message.Subject = "Forwarder(審核通知)";

        message.IsBodyHtml = true;
        message.Body = Errmsg;
        SmtpClient client = new SmtpClient("192.168.0.12");
        client.Send(message);
    }
}
}