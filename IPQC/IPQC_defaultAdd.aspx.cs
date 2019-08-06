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
public partial class IPQC_defaultAdd : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "IPQC_default Add Page";
	}

	protected void BUTTON_save_Click(object sender, System.EventArgs e)
	{
		if (this.IsValid)
		{
			try
			{
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM EIPE.DBO.IPQC_parameter WHERE 1=0");
				rs.Add();
 	 	 	 	if (this.FIELD_text.Text!="") rs["text"] = this.FIELD_text.Text ;
 	 	 	 	if (this.FIELD_value.Text!="") rs["value"] = this.FIELD_value.Text ;
 	 	 	 	if (this.FIELD_parameter.SelectedValue!="") rs["parameter"] = this.FIELD_parameter.SelectedValue ;
 	 	 	 	if (this.FIELD_SEQ.Text!="") rs["SEQ"] = this.FIELD_SEQ.Text ;
				rs.Update();
				rs.Close();
				if (sender==this.BUTTON_savenext)
					Response.Redirect("IPQC_defaultAdd.aspx");
				else
					Response.Redirect("IPQC_default.aspx");
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