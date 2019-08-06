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
public partial class CNEDelete : SmoothEnterprise.Web.Page
{
	private string[] keysqls ;
	
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "CNE Delete Page";
		try
		{
			keysqls = this.SQL.Replace(" OR ",",").Split(',') ;
			this.PageJumper1.TotalPage = keysqls.Length ;
		}
		catch
		{
			Response.Redirect("CNE.aspx");
		}
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
		try
		{
			if (this.PageJumper1.TotalPage<=1)
				this.PageJumper1.Visible = false ;

			SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
			rs.Open("SELECT * FROM CNE WHERE "+keysqls[(this.PageJumper1.CurrentPage -1)]);
			if (!rs.EOF)
			{
				
 	 	 	 	this.FIELD_occa01.Text = rs["occa01"].ToString();
 	 	 	 	this.FIELD_occa36.Text = rs["occa36"].ToString();
 	 	 	 	this.FIELD_occa37.Text = rs["occa37"].ToString();
 	 	 	 	this.FIELD_occa61.Text = rs["occa61"].ToString();
 	 	 	 	this.FIELD_occa63.Text = rs["occa63"].ToString();
 	 	 	 	this.FIELD_ta_occa06.Text = rs["ta_occa06"].ToString();
 	 	 	 	this.FIELD_ta_occa07.Text = rs["ta_occa07"].ToString();
 	 	 	 	this.FIELD_argv2.Text = rs["argv2"].ToString();
 	 	 	 	this.FIELD_occa00.Text = rs["occa00"].ToString();
 	 	 	 	this.FIELD_occano.Text = rs["occano"].ToString();
 	 	 	 	this.FIELD_occa02.Text = rs["occa02"].ToString();
 	 	 	 	this.FIELD_occa03.Text = rs["occa03"].ToString();
 	 	 	 	this.FIELD_occa04.Text = rs["occa04"].ToString();
 	 	 	 	this.FIELD_occa06.Text = rs["occa06"].ToString();
 	 	 	 	this.FIELD_occa07.Text = rs["occa07"].ToString();
 	 	 	 	this.FIELD_occa08.Text = rs["occa08"].ToString();
 	 	 	 	this.FIELD_occa09.Text = rs["occa09"].ToString();
 	 	 	 	this.FIELD_occa11.Text = rs["occa11"].ToString();
 	 	 	 	this.FIELD_occa12.Text = rs["occa12"].ToString();
 	 	 	 	this.FIELD_occa13.Text = rs["occa13"].ToString();
 	 	 	 	this.FIELD_occa14.Text = rs["occa14"].ToString();
 	 	 	 	this.FIELD_occa15.Text = rs["occa15"].ToString();
 	 	 	 	this.FIELD_occa18.Text = rs["occa18"].ToString();
 	 	 	 	this.FIELD_occa19.Text = rs["occa19"].ToString();
 	 	 	 	this.FIELD_occa20.Text = rs["occa20"].ToString();
 	 	 	 	this.FIELD_occa21.Text = rs["occa21"].ToString();
 	 	 	 	this.FIELD_occa23.Text = rs["occa23"].ToString();
 	 	 	 	this.FIELD_occa24.Text = rs["occa24"].ToString();
 	 	 	 	this.FIELD_occa261.Text = rs["occa261"].ToString();
 	 	 	 	this.FIELD_occa262.Text = rs["occa262"].ToString();
 	 	 	 	this.FIELD_occa263.Text = rs["occa263"].ToString();
 	 	 	 	this.FIELD_occa271.Text = rs["occa271"].ToString();
 	 	 	 	this.FIELD_occa272.Text = rs["occa272"].ToString();
 	 	 	 	this.FIELD_occa273.Text = rs["occa273"].ToString();
 	 	 	 	this.FIELD_occa28.Text = rs["occa28"].ToString();
 	 	 	 	this.FIELD_occa29.Text = rs["occa29"].ToString();
 	 	 	 	this.FIELD_occa292.Text = rs["occa292"].ToString();
 	 	 	 	this.FIELD_occa30.Text = rs["occa30"].ToString();
 	 	 	 	this.FIELD_occa302.Text = rs["occa302"].ToString();
 	 	 	 	this.FIELD_occa33.Text = rs["occa33"].ToString();
 	 	 	 	this.FIELD_occa35.Text = rs["occa35"].ToString();
 	 	 	 	this.FIELD_occa38.Text = rs["occa38"].ToString();
 	 	 	 	this.FIELD_occa39.Text = rs["occa39"].ToString();
 	 	 	 	this.FIELD_occa41.Text = rs["occa41"].ToString();
 	 	 	 	this.FIELD_occa42.Text = rs["occa42"].ToString();
 	 	 	 	this.FIELD_occa43.Text = rs["occa43"].ToString();
 	 	 	 	this.FIELD_occa44.Text = rs["occa44"].ToString();
 	 	 	 	this.FIELD_occa45.Text = rs["occa45"].ToString();
 	 	 	 	this.FIELD_occa46.Text = rs["occa46"].ToString();
 	 	 	 	this.FIELD_occa47.Text = rs["occa47"].ToString();
 	 	 	 	this.FIELD_occa48.Text = rs["occa48"].ToString();
 	 	 	 	this.FIELD_occa49.Text = rs["occa49"].ToString();
 	 	 	 	this.FIELD_occa50.Text = rs["occa50"].ToString();
 	 	 	 	this.FIELD_occa51.Text = rs["occa51"].ToString();
 	 	 	 	this.FIELD_occa55.Text = rs["occa55"].ToString();
 	 	 	 	this.FIELD_occa56.Text = rs["occa56"].ToString();
 	 	 	 	this.FIELD_occa62.Text = rs["occa62"].ToString();
 	 	 	 	this.FIELD_occa631.Text = rs["occa631"].ToString();
 	 	 	 	this.FIELD_occa701.Text = rs["occa701"].ToString();
 	 	 	 	this.FIELD_occa702.Text = rs["occa702"].ToString();
 	 	 	 	this.FIELD_occa703.Text = rs["occa703"].ToString();
 	 	 	 	this.FIELD_occa704.Text = rs["occa704"].ToString();
 	 	 	 	this.FIELD_occaacti.Text = rs["occaacti"].ToString();
 	 	 	 	this.FIELD_occauser.Text = rs["occauser"].ToString();
 	 	 	 	this.FIELD_occagrup.Text = rs["occagrup"].ToString();
 	 	 	 	this.FIELD_occa1004.Text = rs["occa1004"].ToString();
 	 	 	 	this.FIELD_occaud15.Text = rs["occaud15"].ToString();
 	 	 	 	this.FIELD_ta_occa0801.Text = rs["ta_occa0801"].ToString();
 	 	 	 	this.FIELD_ta_occa0802.Text = rs["ta_occa0802"].ToString();
 	 	 	 	this.FIELD_ta_occa0803.Text = rs["ta_occa0803"].ToString();
 	 	 	 	this.FIELD_ta_occa0901.Text = rs["ta_occa0901"].ToString();
 	 	 	 	this.FIELD_ta_occa0902.Text = rs["ta_occa0902"].ToString();
 	 	 	 	this.FIELD_ta_occa0903.Text = rs["ta_occa0903"].ToString();
 	 	 	 	this.FIELD_ta_occa10.Text = rs["ta_occa10"].ToString();
 	 	 	 	this.FIELD_ta_occa11.Text = rs["ta_occa11"].ToString();
 	 	 	 	this.FIELD_ta_occa12.Text = rs["ta_occa12"].ToString();
 	 	 	 	this.FIELD_ta_occa14.Text = rs["ta_occa14"].ToString();
 	 	 	 	this.FIELD_ta_occa15.Text = rs["ta_occa15"].ToString();
 	 	 	 	this.FIELD_ta_occa19.Text = rs["ta_occa19"].ToString();
 	 	 	 	this.FIELD_occanote.Text = rs["occanote"].ToString();
			}
			else
			{
				Response.Redirect("CNE.aspx");
			}
		}
		catch (Exception ex)
		{
			this.AddError(this,"Page_PreRender()","",ex.Message);
		}
	}

	private string SQL
	{
		get
		{
			string sql = "";
			string keys = "(occa01=':occa01')";
			string rowid = "";
			for (int i=0; i<Page.Request.QueryString.Count; i++)
			{
				if (Page.Request.QueryString.AllKeys.GetValue(i).ToString().StartsWith("occa01"))
				{
					rowid = Page.Request.QueryString.AllKeys.GetValue(i).ToString().Replace("occa01","");
					if (sql!="")
						sql += " OR "+keys.Replace(":occa01",Request.QueryString["occa01"+rowid]);
					else
						sql += keys.Replace(":occa01",Request.QueryString["occa01"+rowid]);
				}
			}
			return sql;
		}
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		try
		{
			SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
			rs.Open("SELECT * FROM CNE WHERE "+this.SQL);
			while (!rs.EOF)
			{
				rs.Delete();
				rs.MoveNext();
			}
			rs.Update();
			rs.Close();
			Response.Redirect("CNE.aspx");
		}
		catch (Exception ex)
		{
			this.AddError(this,"BUTTON_delete_Click()","",ex.Message);
		}
	}

	protected void BUTTON_cancel_Click(object sender, System.EventArgs e)
	{
		this.GoBack();
	}
}
}