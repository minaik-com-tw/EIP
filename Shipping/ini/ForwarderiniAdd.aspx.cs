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
public partial class ForwarderDataAdd : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "ForwarderData Add Page";
	}

	protected void BUTTON_save_Click(object sender, System.EventArgs e)
	{
		if (this.IsValid)
		{
			try
			{
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM ForwarderData WHERE 1=0");
				rs.Add();

                rs["initdate"] = DateTime.Now.ToString();
                rs["inituid"] =   this.CurrentUser.ID;


 	 	 	 	if (this.FIELD_ta_oga20.Text!="") rs["ta_oga20"] = this.FIELD_ta_oga20.Text ;
 	 	 	 	if (this.FIELD_pmc30.Text!="") rs["pmc30"] = this.FIELD_pmc30.Text ;
 	 	 	 	if (this.FIELD_account.Text!="") rs["account"] = this.FIELD_account.Text ;
 	 	 	 	if (this.FIELD_password.Text!="") rs["password"] = this.FIELD_password.Text ;
				rs.Update();
				rs.Close();
				if (sender==this.BUTTON_savenext)
					Response.Redirect("ForwarderiniAdd.aspx");
				else
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
        this.GoBack();
	}
}
}