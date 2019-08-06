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

namespace ForwarderData
{
public partial class ForwarderData : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)//2
	{
		//Page.Title = "ForwarderData List Page";
	}

	protected void Page_PreRender(object sender, System.EventArgs e)//1
	{
    	if (!this.IsPostBack)//第一頁被呼叫,
    	{
            this.KeepURL();
            
 	 	 	if(!this.QUERY_ta_oga20.Personalize && this["QUERY_ta_oga20"]!=null) this.QUERY_ta_oga20.Text = this["QUERY_ta_oga20"];
 	 	 	if(!this.QUERY_pmc30.Personalize && this["QUERY_pmc30"]!=null) this.QUERY_pmc30.Text = this["QUERY_pmc30"];
        	this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{   
            
            
            if(column.ID=="DataList1_edit")
 	 	 	{
 	 	 	 	cell.LinkURL = "ForwarderiniEdit.aspx?ID="+rs["ID"].ToString();
 	 	 	}
            
		}
		catch (Exception ex)
		{
			this.AddError(this,"DataList1_OnRenderCell()","",ex.Message);
		}		
	}

	protected void BUTTON_query_Click(object sender, System.EventArgs e)
	{
		this.Query();
	}

	private void Query()
	{
        
 	 	if(!this.QUERY_ta_oga20.Personalize) this["QUERY_ta_oga20"] = this.QUERY_ta_oga20.Text ;
 	 	if(!this.QUERY_pmc30.Personalize) this["QUERY_pmc30"] = this.QUERY_pmc30.Text ;
		string whereis = "";
		
 	 	
 	 	if (this.QUERY_ta_oga20.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " ta_oga20 LIKE N'%" + this.QUERY_ta_oga20.Text + "%'";
 	 	}
 	 	if (this.QUERY_pmc30.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " pmc30 LIKE N'%" + this.QUERY_pmc30.Text + "%'";
 	 	}
		if (whereis!="")
			whereis = " WHERE" + whereis;
       // DataList1.SQL = "SELECT     TOP (200) PKey, a.ID, ta_oga20, pmc30, account, password,b.name innm ,a.initdate idate,b.name monm,a.modifydate mdate  " +
       //     " FROM         ForwarderData a  left join dguser b  on   a.inituid=b.id" + whereis;

          DataList1.SQL = "SELECT     TOP (200) PKey, a.ID, ta_oga20, pmc30, account, password,b.name innm ,convert(char(10),a.initdate,120) idate,c.name monm, convert(char(10),a.modifydate,120) mdate" +
              " FROM         ForwarderData a  left join dguser b  on   a.inituid=b.id left join dguser c  on   a.modifyuid=c.id " + whereis;



	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("ForwarderiniAdd.aspx");
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		string deletekeys = "";
		string chkid = this.DataList1.ID+"_chk_";
		string keyid = this.DataList1.ID+"_key_";
		for (int i=0; i<Page.Request.Form.Count; i++)
			if (Page.Request.Form.AllKeys.GetValue(i).ToString().StartsWith(chkid))
			{
				if (deletekeys!="")
					deletekeys += "&"+Page.Request.Form[keyid+Page.Request.Form.AllKeys.GetValue(i).ToString().Substring(chkid.Length)].ToString();
				else
					deletekeys += Page.Request.Form[keyid+Page.Request.Form.AllKeys.GetValue(i).ToString().Substring(chkid.Length)].ToString();
			}
		Response.Redirect("ForwarderDataDelete.aspx?"+deletekeys+"&multiple=1");
	}
}
}
