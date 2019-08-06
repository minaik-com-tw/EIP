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

namespace ERP_FLOW
{
public partial class ERPFAdd : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "ERPF Add Page";
	}

	protected void BUTTON_save_Click(object sender, System.EventArgs e)
	{
		if (this.IsValid)
		{
			try
			{
				DBTransfer fd=new DBTransfer();
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM ERP_FLOW WHERE 1=0");
				rs.Add();
				
 	 	 	 	if (this.FIELD_ERP_NAME.Text!="") rs["ERP_NAME"] = this.FIELD_ERP_NAME.Text ;
 	 	 	 	if (this.FIELD_DEP_NAME.Text!="") rs["DEP_NAME"] = this.FIELD_DEP_NAME.Text ;
                rs["company"] = ListComany.SelectedValue;
                rs["NO"] = LisType.SelectedValue;
                rs["PNAME"] = fd.GetTopfile("select name from  dguser where id='" + PopupUser1.Text + "'");
                rs["PID"] = PopupUser1.Text;
				rs.Update();
				rs.Close();
				if (sender==this.BUTTON_savenext)
					Response.Redirect("ERPFAccAdd.aspx");
				else
					Response.Redirect("ERPFACC.aspx");
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