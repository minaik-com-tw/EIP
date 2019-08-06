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

namespace SPC
{
public partial class AreaUser : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "AreaUser List Page";
        


	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
            
 	 	 	if(!this.QUERY_logonid.Personalize && this["QUERY_logonid"]!=null) this.QUERY_logonid.Text = this["QUERY_logonid"];
 	 	 	if(!this.QUERY_name.Personalize && this["QUERY_name"]!=null) this.QUERY_name.Text = this["QUERY_name"];
 	 	 	//if(!this.QUERY_ustatus.Personalize && this["QUERY_ustatus"]!=null) this.QUERY_ustatus.Text = this["QUERY_ustatus"];
 	 	 	if(!this.QUERY_gid.Personalize && this["QUERY_gid"]!=null) this.QUERY_gid.Text = this["QUERY_gid"];
 	 	 	if(!this.QUERY_sid.Personalize && this["QUERY_sid"]!=null) this.QUERY_sid.Text = this["QUERY_sid"];
        	this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{

        try
        {
            if (column.ID == "edit")
            {
                cell.LinkURL = "UserCompanyEdit.aspx?id=" + rs["id"].ToString();
            }
            if (column.ID == "DataList1_iconview")
            {
                cell.LinkURL = "UserProfile.aspx?id=" + rs["id"].ToString();
            }
            if (column.ID == "chk")
            {
                string str = "id" + cell.Rowno.ToString() + "=" + rs["id"].ToString();
                cell.ClientID = this.DataList1.ID + "_chk_" + cell.Rowno.ToString();
                cell.OutputHTML = "<input type=hidden id=\"" + this.DataList1.ID + "_key_" + cell.Rowno.ToString() + "\" name=\"" + this.DataList1.ID + "_key_" + cell.Rowno.ToString() + "\" value=\"" + str + "\">";
            }
            if (column.ID == "DataList1_icon")
            {

                System.Web.UI.WebControls.Image image = (System.Web.UI.WebControls.Image)cell.Controls[1];
                    image.BorderWidth = Unit.Pixel(1);
                    image.ImageUrl = "UserImage.aspx?id=" + rs["id"].ToString();
                
            }
             
            if (column.ID == "DataList1_ustatus")
            {
                //Response.Write("<br>"+rs["ustatus"].ToString() );


                if (rs["ustatus"].ToString().ToUpper() == "9F3FAF7E-F503-42B3-9E3F-62237024A20A")
                {
                    //Response.Write("icon-config");
                    cell.OutputHTML = "<center><img src='/lib/img/icon-lock.gif'></center> ";
                }
                else if (rs["ustatus"].ToString().ToUpper() == "57DADAB8-44CF-4BAA-A40C-324F9F4533A9")
                {
                    //Response.Write("icon-lookmore.gif");
                    cell.OutputHTML = "<center><img src='/lib/img/icon-config.gif'></center> ";
                }
                else if (rs["ustatus"].ToString().ToUpper() == "76CBA823-E891-45D3-8B6C-4724E6C69D5B")
                {
                   // Response.Write("icon-new.gif");
                    cell.OutputHTML = "<center><img src='/lib/img/icon-new.gif'></center> ";
                }
                else
                {
                    cell.OutputHTML = "&nbsp;";
                }


                // else if (rs["ustatus"].ToString() == UStatus.Disable.ToString())
                // {   cell.OutputHTML = "<center><img src='/lib/img/icon-config.gif'></center> ";
                //     cell.OutputHTML = "<center><img src='/lib/img/icon-lock.gif'></center> ";
                //cell.OutputHTML = "<center><img src='/lib/img/icon-lookmore.gif'></center> ";
                // }
            }
            if (column.ID == "DataList1_gender")
            {
                if (rs["gender"].ToString() == "M")
                {
                    cell.OutputHTML = "<center><img src='" + base.ResolveUrl("~/security/img/icon-boy.gif") + "'></center> ";
                }
                else if (rs["gender"].ToString() == "F")
                {
                    cell.OutputHTML = "<center><img src='" + base.ResolveUrl("~/security/img/icon-girl.gif") + "'></center> ";
                }
            }
        }
        catch (Exception exception)
        {
            base.AddError(this, "", "", exception.Message);
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
         
	}

	protected void BUTTON_query_Click(object sender, System.EventArgs e)
	{
		this.Query();
	}

	private void Query()
	{
        
 	 	if(!this.QUERY_logonid.Personalize) this["QUERY_logonid"] = this.QUERY_logonid.Text ;
 	 	if(!this.QUERY_name.Personalize) this["QUERY_name"] = this.QUERY_name.Text ;
        if (!this.QUERY_ustatus.Personalize)
        {
            this["QUERY_ustatus"] = this.QUERY_ustatus.Value;
        }
 	 	if(!this.QUERY_gid.Personalize) this["QUERY_gid"] = this.QUERY_gid.Text ;
 	 	if(!this.QUERY_sid.Personalize) this["QUERY_sid"] = this.QUERY_sid.Text ;
		string whereis = "";
		
 	 	if (this.QUERY_logonid.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " A.logonid LIKE N'%" + this.QUERY_logonid.Text + "%'";
 	 	}
 	 	if (this.QUERY_name.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " A.name LIKE N'%" + this.QUERY_name.Text + "%'";
 	 	}
        if (this.QUERY_ustatus.Value != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";

            whereis = whereis + " A.ustatus = '" + this.QUERY_ustatus.Value + "'";
        }

 	 	if (this.QUERY_gid.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " gid LIKE N'%" + this.QUERY_gid.Text + "%'";
 	 	}
 	 	if (this.QUERY_sid.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " sid LIKE N'%" + this.QUERY_sid.Text + "%'";
 	 	}

        string comid = "";
        SmoothEnterprise.Database.DataSet gs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        gs.Open("select comid from dguser where id='" + this.CurrentUser.ID + "'");
        if (gs["comid"].ToString() != "")
        {
            comid = gs["comid"].ToString().ToUpper().Trim();
            
        }

        if(comid!="MAT")    whereis=whereis+ " and A.comid='"+comid+"'";

		if (whereis!="")
			whereis = " WHERE " + whereis;



        


		DataList1.SQL ="  SELECT A.*,PG.name AS gid_name,DC.name AS ucategory_name,UTC.name AS utype_name,L.name AS "+
            " layoutid_name,USC.name AS ustatus_name,IU.name AS inituid_name, MU.name AS modifyuid_name FROM dguser A "+
            " LEFT OUTER JOIN dggroup PG ON A.gid = PG.id LEFT OUTER JOIN dgcode UTC ON UTC.ctype = 'utype' AND "+
            "A.utype = UTC.id LEFT OUTER JOIN dglayout L ON A.layoutid = L.id LEFT OUTER JOIN dgcode "+
            " USC ON USC.ctype = 'ustatus' AND A.ustatus = USC.id LEFT OUTER JOIN dgcode DC ON A.ucategory=DC.id "+
            " LEFT OUTER JOIN dguser IU ON A.inituid = IU.id LEFT OUTER JOIN dguser MU ON A.modifyuid = MU.id " +  whereis;
      // Response.Write(DataList1.SQL.ToString());
    }

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("UserCompanyAdd.aspx");
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		string deletekeys = "";
		string chkid = this.DataList1.ID+"_chk_";
		string keyid = this.DataList1.ID+"_key_";
		for (int i=0; i<Page.Request.Form.Count; i++)
			if (Page.Request.Form.AllKeys.GetValue(i).ToString().StartsWith(chkid))
			{
				if (deletekeys!="")
					deletekeys += "&"+Page.Request.Form[keyid+Page.Request.Form.AllKeys.GetValue(i).ToString().Substring(chkid.Length)].ToString();
				else
					deletekeys += Page.Request.Form[keyid+Page.Request.Form.AllKeys.GetValue(i).ToString().Substring(chkid.Length)].ToString();
			}
		Response.Redirect("AreaUserDelete.aspx?"+deletekeys+"&multiple=1");
	}
}
}
