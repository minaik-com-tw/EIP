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

namespace Shipping
{
public partial class ForwarderDelete : SmoothEnterprise.Web.Page
{
	private string[] keysqls ;
	
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "Forwarder Delete Page";
		try
		{
			keysqls = this.SQL.Replace(" OR ",",").Split(',') ;
			this.PageJumper1.TotalPage = keysqls.Length ;
		}
		catch
		{
			Response.Redirect("Forwarder.aspx");
		}
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
		try
		{
			if (this.PageJumper1.TotalPage<=1)
				this.PageJumper1.Visible = false ;

			SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("Provider=SQLOLEDB.1;Password=123456;Persist Security Info=True;User ID=sa;Data Source=RICK-CHEN;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=RICK-CHEN;Use Encryption for Data=False;Tag with column collation when possible=False;Initial Catalog=Smooth8006;",SmoothEnterprise.Database.DataSetType.OpenRead);
			rs.Open("SELECT * FROM Forwarder WHERE "+keysqls[(this.PageJumper1.CurrentPage -1)]);
			if (!rs.EOF)
			{
				
 	 	 	 	this.FIELD_INV_Num.Text = rs["INV_Num"].ToString();
 	 	 	 	this.FIELD_SHIP_To.Text = rs["SHIP_To"].ToString();
 	 	 	 	this.FIELD_SHIPPING_No.Text = rs["SHIPPING_No"].ToString();
 	 	 	 	this.FIELD_SHIPPING_Dec.Text = rs["SHIPPING_Dec"].ToString();
 	 	 	 	this.FIELD_SHIPPING_Mode.Text = rs["SHIPPING_Mode"].ToString();
 	 	 	 	this.FIELD_SHIPPING_ModeDec.Text = rs["SHIPPING_ModeDec"].ToString();
 	 	 	 	this.FIELD_FORWARDER_Num.Text = rs["FORWARDER_Num"].ToString();
 	 	 	 	this.FIELD_FORWARDER_Dec.Text = rs["FORWARDER_Dec"].ToString();
 	 	 	 	this.FIELD_HawbNo.Text = rs["HawbNo"].ToString();
 	 	 	 	this.FIELD_FitNo.Text = rs["FitNo"].ToString();
 	 	 	 	this.FIELD_ETD.Text = rs["ETD"].ToString();
 	 	 	 	this.FIELD_ATD.Text = rs["ATD"].ToString();
 	 	 	 	this.FIELD_ETA.Text = rs["ETA"].ToString();
 	 	 	 	this.FIELD_ATAAS.Text = rs["ATAAS"].ToString();
 	 	 	 	this.FIELD_ATAC.Text = rs["ATAC"].ToString();
			}
			else
			{
				Response.Redirect("Forwarder.aspx");
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
			string keys = "(ID=':ID')";
			string rowid = "";
			for (int i=0; i<Page.Request.QueryString.Count; i++)
			{
				if (Page.Request.QueryString.AllKeys.GetValue(i).ToString().StartsWith("ID"))
				{
					rowid = Page.Request.QueryString.AllKeys.GetValue(i).ToString().Replace("ID","");
					if (sql!="")
						sql += " OR "+keys.Replace(":ID",Request.QueryString["ID"+rowid]);
					else
						sql += keys.Replace(":ID",Request.QueryString["ID"+rowid]);
				}
			}
			return sql;
		}
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		try
		{
			SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("Provider=SQLOLEDB.1;Password=123456;Persist Security Info=True;User ID=sa;Data Source=RICK-CHEN;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=RICK-CHEN;Use Encryption for Data=False;Tag with column collation when possible=False;Initial Catalog=Smooth8006;",SmoothEnterprise.Database.DataSetType.OpenUpdate);
			rs.Open("SELECT * FROM Forwarder WHERE "+this.SQL);
			while (!rs.EOF)
			{
				rs.Delete();
				rs.MoveNext();
			}
			rs.Update();
			rs.Close();
			Response.Redirect("Forwarder.aspx");
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