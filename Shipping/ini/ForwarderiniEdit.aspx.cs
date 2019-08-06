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
public partial class ForwarderDataEdit : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "ForwarderData Edit Page";
		try
		{
			if (!this.IsPostBack)
			{
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
				rs.Open("SELECT * FROM ForwarderData WHERE ID='"+ Request.QueryString["ID"] +"' ");
				if (!rs.EOF)
				{
					

 	 	 	 	 	this.FIELD_ta_oga20.Text = rs["ta_oga20"].ToString();
 	 	 	 	 	this.FIELD_pmc30.Text = rs["pmc30"].ToString();
 	 	 	 	 	this.FIELD_account.Text = rs["account"].ToString();
 	 	 	 	 	this.FIELD_password.Text = rs["password"].ToString();
				}												  
				else
				{
					Response.Redirect("Forwarderini.aspx");
				}
			}
		}
		catch
		{
			Response.Redirect("Forwarderini.aspx");
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
				rs.Open("SELECT * FROM ForwarderData WHERE ID='"+ Request.QueryString["ID"] +"' ");
				if (!rs.EOF)
				{

                    rs["modifydate"] = DateTime.Now.ToString();
                    rs["modifyuid"] =  this.CurrentUser.ID;

 	 	 	 	 	if (this.FIELD_ta_oga20.Text!="") rs["ta_oga20"] = this.FIELD_ta_oga20.Text ; else rs["ta_oga20"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_pmc30.Text!="") rs["pmc30"] = this.FIELD_pmc30.Text ; else rs["pmc30"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_account.Text!="") rs["account"] = this.FIELD_account.Text ; else rs["account"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_password.Text!="") rs["password"] = this.FIELD_password.Text ; else rs["password"] = System.DBNull.Value ;
					rs.Update();
				}
				rs.Close();
				Response.Redirect("Forwarderini.aspx");
			}
			catch (Exception ex)
			{
				this.AddError(this,"BUTTON_save_Click()","",ex.Message);
			}
		}
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        this.GoBack("Forwarderini.aspx",new string[]{"ForwarderDataDelete.aspx"});
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("ForwarderDataDelete.aspx?ID="+Request.QueryString["ID"]);
	}
}
}