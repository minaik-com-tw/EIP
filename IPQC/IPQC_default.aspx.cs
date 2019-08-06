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

namespace IPQC
{
public partial class IPQC_default : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "IPQC_default List Page";
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
            
        	this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{   
            
            
 	 	 	if(column.ID=="DataList1_edit")
 	 	 	{
 	 	 	 	cell.LinkURL = "IPQC_defaultEdit.aspx?rowno="+rs["rowno"].ToString();
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
        
		string whereis = "";
		
		if (whereis!="")
			whereis = " WHERE" + whereis;
        DataList1.SQL = "SELECT * FROM EIPE.DBO.IPQC_parameter where Parameter != 'customer' and Parameter != 'product' " + whereis + " order by parameter , seq";
	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("IPQC_defaultAdd.aspx");
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
		Response.Redirect("IPQC_defaultDelete.aspx?"+deletekeys+"&multiple=1");
	}
}
}
