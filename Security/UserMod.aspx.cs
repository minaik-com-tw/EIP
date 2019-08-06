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

namespace Security
{
public partial class UserModEdit : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "UserMod Edit Page";
		try
		{
			if (!this.IsPostBack)
			{
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
				rs.Open("SELECT * FROM dguser WHERE  id='"+ Request.QueryString["id"] +"' ");
				if (!rs.EOF)
				{
					
 	 	 	 	 	this.FIELD_name.Text = rs["name"].ToString();
 	 	 	 	 	 
				}												  
				else
				{
					Response.Redirect("UserMod.aspx");
				}
			}
		}
		catch
		{
			Response.Redirect("UserMod.aspx");
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
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM dguser WHERE  id='"+ Request.QueryString["id"] +"' ");
				if (!rs.EOF)
				{

                    rs["gid"] = LisDepart.SelectedValue;
                    rs["modifyuid"] = this.CurrentUser.ID;
                    rs["modifydate"] = DateTime.Now.ToString();
					rs.Update();
				}
				rs.Close();
                Response.Redirect("/mismanager/TransEmpData.aspx");
			}
			catch (Exception ex)
			{
				this.AddError(this,"BUTTON_save_Click()","",ex.Message);
			}
		}
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        this.GoBack("UserMod.aspx",new string[]{"UserModDelete.aspx"});
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("UserModDelete.aspx?logonid="+Request.QueryString["logonid"]);
	}
    protected void Button1_Click(object sender, EventArgs e)
    {
        string where = "";
        LisDepart.Items.Clear();
        if (Liscompany.SelectedValue != "NA")
        {
            where = " where a.comid='" + Liscompany.SelectedValue + "'";
        }
       SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
	   rs.Open("SELECT  a.id,a.name+'--'+b.name cname   FROM dggroup a  left join dguser b on uid=b.id  "+where +
           "    order by   a.name");
	   while(!rs.EOF){
           LisDepart.Items.Add(new ListItem(rs[1].ToString(), rs[0].ToString()));
           rs.MoveNext();

       }
        
       
    }
}
}