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
public partial class IPQC_defaultEdit : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "IPQC_default Edit Page";
		try
		{
			if (!this.IsPostBack)
			{
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("",SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM EIPE.DBO.IPQC_parameter WHERE ROWNO = '"+Request.QueryString["rowno"].ToString()+"'");
				if (!rs.EOF)
				{
					
 	 	 	 	 	//this.FIELD_rowno.Text = rs["rowno"].ToString();
 	 	 	 	 	this.FIELD_text.Text = rs["text"].ToString();
 	 	 	 	 	this.FIELD_value.Text = rs["value"].ToString();
 	 	 	 	 	this.FIELD_parameter.SelectedValue = rs["parameter"].ToString();
 	 	 	 	 	this.FIELD_SEQ.Text = rs["SEQ"].ToString();
				}												  
				else
				{
					Response.Redirect("IPQC_default.aspx");
				}
			}
		}
		catch(Exception ex)
		{
			Response.Redirect("IPQC_default.aspx");
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
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM EIPE.DBO.IPQC_parameter WHERE rowno = '"+Request.QueryString["rowno"].ToString()+"'  ");
				if (!rs.EOF)
				{
					
 	 	 	 	 	//if (this.FIELD_rowno.Text!="") rs["rowno"] = this.FIELD_rowno.Text ; else rs["rowno"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_text.Text!="") rs["text"] = this.FIELD_text.Text ; else rs["text"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_value.Text!="") rs["value"] = this.FIELD_value.Text ; else rs["value"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_parameter.Text!="") rs["parameter"] = this.FIELD_parameter.SelectedValue ; else rs["parameter"] = System.DBNull.Value ;
 	 	 	 	 	if (this.FIELD_SEQ.Text!="") rs["SEQ"] = this.FIELD_SEQ.Text ; else rs["SEQ"] = System.DBNull.Value ;
					rs.Update();
				}
				rs.Close();
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
        this.GoBack("IPQC_default.aspx",new string[]{"IPQC_defaultDelete.aspx"});
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("DELETE EIPE.DBO.IPQC_parameter WHERE rowno = '" + Request.QueryString["rowno"].ToString() + "'  ");
                rs.Update();
                rs.Close();
                Response.Redirect("IPQC_default.aspx");
            }
            catch(Exception ex)
            {
                this.AddError(null,"delete","",ex.Message);
            }
		//Response.Redirect("IPQC_defaultDelete.aspx?);
	}
}
}