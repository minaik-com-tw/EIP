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
public partial class ERPFEdit : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "ERPF Edit Page";
		try
		{
			if (!this.IsPostBack)
			{
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
				rs.Open("SELECT * FROM ERP_FLOW WHERE ERPID='"+ Request.QueryString["ERPID"] +"' ");
				if (!rs.EOF)
				{
					
 	 	 	 	 	this.FIELD_ERP_NAME.Text = rs["ERP_NAME"].ToString();
 	 	 	 	 	this.FIELD_DEP_NAME.Text = rs["DEP_NAME"].ToString();
                    LisType.SelectedValue = rs["NO"].ToString().Trim();
                    PopupUser1.Text = rs["PID"].ToString();
                    ListComany.SelectedItem.Text = rs["company"].ToString();
				}												  
				else
				{
					Response.Redirect("ERPF.aspx");
				}
			}
		}
		catch
		{
			Response.Redirect("ERPF.aspx");
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
                DBTransfer cs=new DBTransfer();
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM ERP_FLOW WHERE ERPID='"+ Request.QueryString["ERPID"] +"' ");
				if (!rs.EOF)
				{
					
 	 	 	 	 	//if (this.FIELD_ERP_NAME.Text!="") rs["ERP_NAME"] = this.FIELD_ERP_NAME.Text ; else rs["ERP_NAME"] = System.DBNull.Value ;
 	 	 	 	 	//if (this.FIELD_DEP_NAME.Text!="") rs["DEP_NAME"] = this.FIELD_DEP_NAME.Text ; else rs["DEP_NAME"] = System.DBNull.Value ;

                    rs["company"] = ListComany.SelectedValue;
                    rs["NO"] =LisType.SelectedValue;
                    rs["PNAME"] = cs.GetTopfile("select name from dguser where id='" + PopupUser1.Text + "'");
                    rs["PID"] = PopupUser1.Text;
					rs.Update();
				}
				rs.Close();
				Response.Redirect("ERPFAcc.aspx");
			}
			catch (Exception ex)
			{
				this.AddError(this,"BUTTON_save_Click()","",ex.Message);
			}
		}
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        this.GoBack("ERPFAcc.aspx",new string[]{"ERPFDelete.aspx"});
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
        DBTransfer fd = new DBTransfer();
        fd.RunIUSql("delete from ERP_FLOW WHERE erpid='"+Request.QueryString[0]+"'");
        
    Response.Redirect("ERPFAcc.aspx");
	}
}
}