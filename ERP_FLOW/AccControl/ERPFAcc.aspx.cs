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
public partial class ERPF : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "ERPF List Page";
        if (!IsPostBack)
        {
            DrpList.Items.Add(new ListItem("NA", "NA"));
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            ds.Open(" SELECT ERP_NAME FROM ERP_FLOW group by ERP_NAME  " +
                "   order by ERP_NAME asc ");
            while (!ds.EOF)
            {

                DrpList.Items.Add(new ListItem(ds[0].ToString(), ds[0].ToString()));
                ds.MoveNext();
            }

        }
	}
  
	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
            
 	 	   if(!this.QUERY_DEP_NAME.Personalize && this["QUERY_DEP_NAME"]!=null) this.QUERY_DEP_NAME.Text = this["QUERY_DEP_NAME"];
 	 	 	if(!this.QUERY_PID.Personalize && this["QUERY_PID"]!=null) this.QUERY_PID.Text = this["QUERY_PID"];
        	this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{   
            
            
 	 	 	if(column.ID=="DataList1_edit")
 	 	 	{
 	 	 	 	cell.LinkURL = "ERPFAccEdit.aspx?ERPID="+rs["ERPID"].ToString();
 	 	 	}
            
		}
		catch (Exception ex)
		{
			this.AddError(this,"DataList1_OnRenderCell()","",ex.Message);
		}		
	}

	protected void BUTTON_query_Click(object sender, System.EventArgs e)
	{
		this.Query();
	}

	private void Query()
	{
        
 	 	 if(!this.QUERY_DEP_NAME.Personalize) this["QUERY_DEP_NAME"] = this.QUERY_DEP_NAME.Text ;
 	 	if(!this.QUERY_PID.Personalize) this["QUERY_PID"] = this.QUERY_PID.Text ;
        string whereis = " company='MINAIK' and ERP_NAME='apmt420' and  dep_name='ACC' ";
		
        //if (this.QUERY_ERP_NAME.Text!="")
        //{
        //    if (whereis!="")
        //        whereis = whereis + " AND";
        //    whereis = whereis + " ERP_NAME LIKE N'%" + this.QUERY_ERP_NAME.Text + "%'";
        //}
 	 	if (this.QUERY_DEP_NAME.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " DEP_NAME LIKE N'%" + this.QUERY_DEP_NAME.Text + "%'";
 	 	}
 	 	if (this.QUERY_PID.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " PID = '" + this.QUERY_PID.Text + "'";
 	 	}
		if (whereis!="")
			whereis = " WHERE" + whereis;
        DataList1.SQL = "SELECT company,erpid,erp_name,dep_name, case no when '1' then 'EXP:費用請購 第一關'  " +
            " when '1_2' then 'EXP:費用請購 第二關' " +
            " when '1_3' then 'EXP:費用請購 第三關' " +
            " when '2'   then 'CAP:資產請購 第一關'  " +
            " when '2_2' then 'CAP:資產請購 第二關' " +
            " when '2_3' then 'CAP:資產請購 第三關' " +
            " end no,pname  "+
            " FROM ERP_FLOW" + whereis;
	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("ERPFAccAdd.aspx");
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
		Response.Redirect("ERPFDelete.aspx?"+deletekeys+"&multiple=1");
	}
}
}
