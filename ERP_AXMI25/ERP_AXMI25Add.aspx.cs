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

namespace CNE
{
public partial class CNEAdd : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "CNE Add Page";
	}

	protected void BUTTON_save_Click(object sender, System.EventArgs e)
	{
		if (this.IsValid)
		{
			try
			{
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM CNE WHERE 1=0");
				rs.Add();
				
 	 	 	 	if (this.FIELD_occa01.Text!="") rs["occa01"] = this.FIELD_occa01.Text ;
 	 	 	 	if (this.FIELD_occa36.Text!="") rs["occa36"] = this.FIELD_occa36.Text ;
 	 	 	 	if (this.FIELD_occa37.Text!="") rs["occa37"] = this.FIELD_occa37.Text ;
 	 	 	 	if (this.FIELD_occa61.Text!="") rs["occa61"] = this.FIELD_occa61.Text ;
 	 	 	 	if (this.FIELD_occa63.Text!="") rs["occa63"] = this.FIELD_occa63.Text ;
 	 	 	 	if (this.FIELD_ta_occa06.Text!="") rs["ta_occa06"] = this.FIELD_ta_occa06.Text ;
 	 	 	 	if (this.FIELD_ta_occa07.Text!="") rs["ta_occa07"] = this.FIELD_ta_occa07.Text ;
 	 	 	 	if (this.FIELD_argv2.Text!="") rs["argv2"] = this.FIELD_argv2.Text ;
 	 	 	 	if (this.FIELD_occa00.Text!="") rs["occa00"] = this.FIELD_occa00.Text ;
 	 	 	 	if (this.FIELD_occano.Text!="") rs["occano"] = this.FIELD_occano.Text ;
 	 	 	 	if (this.FIELD_occa02.Text!="") rs["occa02"] = this.FIELD_occa02.Text ;
 	 	 	 	if (this.FIELD_occa03.Text!="") rs["occa03"] = this.FIELD_occa03.Text ;
 	 	 	 	if (this.FIELD_occa04.Text!="") rs["occa04"] = this.FIELD_occa04.Text ;
 	 	 	 	if (this.FIELD_occa06.Text!="") rs["occa06"] = this.FIELD_occa06.Text ;
 	 	 	 	if (this.FIELD_occa07.Text!="") rs["occa07"] = this.FIELD_occa07.Text ;
 	 	 	 	if (this.FIELD_occa08.Text!="") rs["occa08"] = this.FIELD_occa08.Text ;
 	 	 	 	if (this.FIELD_occa09.Text!="") rs["occa09"] = this.FIELD_occa09.Text ;
 	 	 	 	if (this.FIELD_occa11.Text!="") rs["occa11"] = this.FIELD_occa11.Text ;
 	 	 	 	if (this.FIELD_occa12.Text!="") rs["occa12"] = this.FIELD_occa12.Text ;
 	 	 	 	if (this.FIELD_occa13.Text!="") rs["occa13"] = this.FIELD_occa13.Text ;
 	 	 	 	if (this.FIELD_occa14.Text!="") rs["occa14"] = this.FIELD_occa14.Text ;
 	 	 	 	if (this.FIELD_occa15.Text!="") rs["occa15"] = this.FIELD_occa15.Text ;
 	 	 	 	if (this.FIELD_occa18.Text!="") rs["occa18"] = this.FIELD_occa18.Text ;
 	 	 	 	if (this.FIELD_occa19.Text!="") rs["occa19"] = this.FIELD_occa19.Text ;
 	 	 	 	if (this.FIELD_occa20.Text!="") rs["occa20"] = this.FIELD_occa20.Text ;
 	 	 	 	if (this.FIELD_occa21.Text!="") rs["occa21"] = this.FIELD_occa21.Text ;
 	 	 	 	if (this.FIELD_occa23.Text!="") rs["occa23"] = this.FIELD_occa23.Text ;
 	 	 	 	if (this.FIELD_occa24.Text!="") rs["occa24"] = this.FIELD_occa24.Text ;
 	 	 	 	if (this.FIELD_occa261.Text!="") rs["occa261"] = this.FIELD_occa261.Text ;
 	 	 	 	if (this.FIELD_occa262.Text!="") rs["occa262"] = this.FIELD_occa262.Text ;
 	 	 	 	if (this.FIELD_occa263.Text!="") rs["occa263"] = this.FIELD_occa263.Text ;
 	 	 	 	if (this.FIELD_occa271.Text!="") rs["occa271"] = this.FIELD_occa271.Text ;
 	 	 	 	if (this.FIELD_occa272.Text!="") rs["occa272"] = this.FIELD_occa272.Text ;
 	 	 	 	if (this.FIELD_occa273.Text!="") rs["occa273"] = this.FIELD_occa273.Text ;
 	 	 	 	if (this.FIELD_occa28.Text!="") rs["occa28"] = this.FIELD_occa28.Text ;
 	 	 	 	if (this.FIELD_occa29.Text!="") rs["occa29"] = this.FIELD_occa29.Text ;
 	 	 	 	if (this.FIELD_occa292.Text!="") rs["occa292"] = this.FIELD_occa292.Text ;
 	 	 	 	if (this.FIELD_occa30.Text!="") rs["occa30"] = this.FIELD_occa30.Text ;
 	 	 	 	if (this.FIELD_occa302.Text!="") rs["occa302"] = this.FIELD_occa302.Text ;
 	 	 	 	if (this.FIELD_occa33.Text!="") rs["occa33"] = this.FIELD_occa33.Text ;
 	 	 	 	if (this.FIELD_occa35.Text!="") rs["occa35"] = this.FIELD_occa35.Text ;
 	 	 	 	if (this.FIELD_occa38.Text!="") rs["occa38"] = this.FIELD_occa38.Text ;
 	 	 	 	if (this.FIELD_occa39.Text!="") rs["occa39"] = this.FIELD_occa39.Text ;
 	 	 	 	if (this.FIELD_occa41.Text!="") rs["occa41"] = this.FIELD_occa41.Text ;
 	 	 	 	if (this.FIELD_occa42.Text!="") rs["occa42"] = this.FIELD_occa42.Text ;
 	 	 	 	if (this.FIELD_occa43.Text!="") rs["occa43"] = this.FIELD_occa43.Text ;
 	 	 	 	if (this.FIELD_occa44.Text!="") rs["occa44"] = this.FIELD_occa44.Text ;
 	 	 	 	if (this.FIELD_occa45.Text!="") rs["occa45"] = this.FIELD_occa45.Text ;
 	 	 	 	if (this.FIELD_occa46.Text!="") rs["occa46"] = this.FIELD_occa46.Text ;
 	 	 	 	if (this.FIELD_occa47.Text!="") rs["occa47"] = this.FIELD_occa47.Text ;
 	 	 	 	if (this.FIELD_occa48.Text!="") rs["occa48"] = this.FIELD_occa48.Text ;
 	 	 	 	if (this.FIELD_occa49.Text!="") rs["occa49"] = this.FIELD_occa49.Text ;
 	 	 	 	if (this.FIELD_occa50.Text!="") rs["occa50"] = this.FIELD_occa50.Text ;
 	 	 	 	if (this.FIELD_occa51.Text!="") rs["occa51"] = this.FIELD_occa51.Text ;
 	 	 	 	if (this.FIELD_occa55.Text!="") rs["occa55"] = this.FIELD_occa55.Text ;
 	 	 	 	if (this.FIELD_occa56.Text!="") rs["occa56"] = this.FIELD_occa56.Text ;
 	 	 	 	if (this.FIELD_occa62.Text!="") rs["occa62"] = this.FIELD_occa62.Text ;
 	 	 	 	if (this.FIELD_occa631.Text!="") rs["occa631"] = this.FIELD_occa631.Text ;
 	 	 	 	if (this.FIELD_occa701.Text!="") rs["occa701"] = this.FIELD_occa701.Text ;
 	 	 	 	if (this.FIELD_occa702.Text!="") rs["occa702"] = this.FIELD_occa702.Text ;
 	 	 	 	if (this.FIELD_occa703.Text!="") rs["occa703"] = this.FIELD_occa703.Text ;
 	 	 	 	if (this.FIELD_occa704.Text!="") rs["occa704"] = this.FIELD_occa704.Text ;
 	 	 	 	if (this.FIELD_occaacti.Text!="") rs["occaacti"] = this.FIELD_occaacti.Text ;
 	 	 	 	if (this.FIELD_occauser.Text!="") rs["occauser"] = this.FIELD_occauser.Text ;
 	 	 	 	if (this.FIELD_occagrup.Text!="") rs["occagrup"] = this.FIELD_occagrup.Text ;
 	 	 	 	if (this.FIELD_occa1004.Text!="") rs["occa1004"] = this.FIELD_occa1004.Text ;
 	 	 	 	if (this.FIELD_occaud15.Text!="") rs["occaud15"] = this.FIELD_occaud15.Text ;
 	 	 	 	if (this.FIELD_ta_occa0801.Text!="") rs["ta_occa0801"] = this.FIELD_ta_occa0801.Text ;
 	 	 	 	if (this.FIELD_ta_occa0802.Text!="") rs["ta_occa0802"] = this.FIELD_ta_occa0802.Text ;
 	 	 	 	if (this.FIELD_ta_occa0803.Text!="") rs["ta_occa0803"] = this.FIELD_ta_occa0803.Text ;
 	 	 	 	if (this.FIELD_ta_occa0901.Text!="") rs["ta_occa0901"] = this.FIELD_ta_occa0901.Text ;
 	 	 	 	if (this.FIELD_ta_occa0902.Text!="") rs["ta_occa0902"] = this.FIELD_ta_occa0902.Text ;
 	 	 	 	if (this.FIELD_ta_occa0903.Text!="") rs["ta_occa0903"] = this.FIELD_ta_occa0903.Text ;
 	 	 	 	if (this.FIELD_ta_occa10.Text!="") rs["ta_occa10"] = this.FIELD_ta_occa10.Text ;
 	 	 	 	if (this.FIELD_ta_occa11.Text!="") rs["ta_occa11"] = this.FIELD_ta_occa11.Text ;
 	 	 	 	if (this.FIELD_ta_occa12.Text!="") rs["ta_occa12"] = this.FIELD_ta_occa12.Text ;
 	 	 	 	if (this.FIELD_ta_occa14.Text!="") rs["ta_occa14"] = this.FIELD_ta_occa14.Text ;
 	 	 	 	if (this.FIELD_ta_occa15.Text!="") rs["ta_occa15"] = this.FIELD_ta_occa15.Text ;
 	 	 	 	if (this.FIELD_ta_occa19.Text!="") rs["ta_occa19"] = this.FIELD_ta_occa19.Text ;
 	 	 	 	if (this.FIELD_occanote.Text!="") rs["occanote"] = this.FIELD_occanote.Text ;
				rs.Update();
				rs.Close();
				if (sender==this.BUTTON_savenext)
					Response.Redirect("CNEAdd.aspx");
				else
					Response.Redirect("CNE.aspx");
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