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
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM ERP_FLOW WHERE 1=0");
				rs.Add();
				
 	 	 	 	if (this.FIELD_ERP_NAME.Text!="") rs["ERP_NAME"] = this.FIELD_ERP_NAME.Text ;
 	 	 	 	if (this.FIELD_DEP_NAME.Text!="") rs["DEP_NAME"] = this.FIELD_DEP_NAME.Text ;
 	 	 	 	if (this.FIELD_NO.Text!="") rs["NO"] = this.FIELD_NO.Text ;

                rs["PID"] = PopupUser1.Text;
                if (this.FIELD_PNAME.Text != "") rs["PNAME"] = PopupUser1.ToolTip;
 	 	 	 	if (this.FIELD_PID.Text!="") rs["PID"] = new Guid(this.FIELD_PID.Text) ;
                rs["Company"] = ListComany.SelectedValue;
				rs.Update();
				rs.Close();
				if (sender==this.BUTTON_savenext)
					Response.Redirect("ERPFAdd.aspx");
				else
					Response.Redirect("ERPF.aspx");
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