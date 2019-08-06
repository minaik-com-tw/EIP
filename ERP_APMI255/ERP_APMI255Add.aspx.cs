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

namespace ERP_APMI255
{
public partial class ERP_APMI255Add : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "ERP_APMI255 Add Page";
	}

	protected void BUTTON_save_Click(object sender, System.EventArgs e)
	{
		if (this.IsValid)
		{
			try
			{
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM APMI255_IN_HEAD WHERE 1=0");
				rs.Add();
				
 	 	 	 	if (this.FIELD_no.Text!="") rs["no"] = this.FIELD_no.Text ;
 	 	 	 	if (this.FIELD_plantid.Text!="") rs["plantid"] = this.FIELD_plantid.Text ;
 	 	 	 	if (this.FIELD_CompanyName.Text!="") rs["CompanyName"] = this.FIELD_CompanyName.Text ;
 	 	 	 	if (this.FIELD_pmi01.Text!="") rs["pmi01"] = this.FIELD_pmi01.Text ;
 	 	 	 	if (this.FIELD_pmi02.Text!="") rs["pmi02"] = this.FIELD_pmi02.Text ;
 	 	 	 	if (this.FIELD_pmi03.Text!="") rs["pmi03"] = this.FIELD_pmi03.Text ;
 	 	 	 	if (this.FIELD_pmc03_0.Text!="") rs["pmc03_0"] = this.FIELD_pmc03_0.Text ;
 	 	 	 	if (this.FIELD_pmi04.Text!="") rs["pmi04"] = this.FIELD_pmi04.Text ;
 	 	 	 	if (this.FIELD_pmi05.Text!="") rs["pmi05"] = this.FIELD_pmi05.Text ;
 	 	 	 	if (this.FIELD_pmi06.Text!="") rs["pmi06"] = this.FIELD_pmi06.Text ;
 	 	 	 	if (this.FIELD_pmi07.Text!="") rs["pmi07"] = this.FIELD_pmi07.Text ;
 	 	 	 	if (this.FIELD_pmi08.Text!="") rs["pmi08"] = this.FIELD_pmi08.Text ;
 	 	 	 	if (this.FIELD_pmi081.Text!="") rs["pmi081"] = this.FIELD_pmi081.Text ;
 	 	 	 	if (this.FIELD_pmiuser.Text!="") rs["pmiuser"] = this.FIELD_pmiuser.Text ;
 	 	 	 	if (this.FIELD_gen02_1.Text!="") rs["gen02_1"] = this.FIELD_gen02_1.Text ;
 	 	 	 	if (this.FIELD_pmigrup.Text!="") rs["pmigrup"] = this.FIELD_pmigrup.Text ;
 	 	 	 	if (this.FIELD_gem02_2.Text!="") rs["gem02_2"] = this.FIELD_gem02_2.Text ;
 	 	 	 	if (this.FIELD_flowstatus.Text!="") rs["flowstatus"] = this.FIELD_flowstatus.Text ;
 	 	 	 	if (this.FIELD_quick.Text!="") rs["quick"] = this.FIELD_quick.Text ;
 	 	 	 	if (this.FIELD_lsend.Text!="") rs["lsend"] = new Guid(this.FIELD_lsend.Text) ;
 	 	 	 	if (this.FIELD_mpru.Text!="") rs["mpru"] = new Guid(this.FIELD_mpru.Text) ;
 	 	 	 	if (this.FIELD_senduser.Text!="") rs["senduser"] = new Guid(this.FIELD_senduser.Text) ;
 	 	 	 	if (this.FIELD_rember.Text!="") rs["rember"] = this.FIELD_rember.Text ;
 	 	 	 	if (this.FIELD_status.Text!="") rs["status"] = this.FIELD_status.Text ;
				rs.Update();
				rs.Close();
				if (sender==this.BUTTON_savenext)
					Response.Redirect("ERP_APMI255Add.aspx");
				else
					Response.Redirect("ERP_APMI255.aspx");
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