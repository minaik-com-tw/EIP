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

namespace ERP_CBGI014
{
public partial class CBGI014 : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "CBGI014 List Page";
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
            
 	 	 	if(!this.QUERY_PlantId.Personalize && this["QUERY_PlantId"]!=null) this.QUERY_PlantId.Text = this["QUERY_PlantId"];
 	 	 	if(!this.QUERY_tc_cba00.Personalize && this["QUERY_tc_cba00"]!=null) this.QUERY_tc_cba00.Text = this["QUERY_tc_cba00"];
 	 	 	if(!this.QUERY_gem02_0.Personalize && this["QUERY_gem02_0"]!=null) this.QUERY_gem02_0.Text = this["QUERY_gem02_0"];
 	 	 	if(!this.QUERY_sn.Personalize && this["QUERY_sn"]!=null) this.QUERY_sn.Text = this["QUERY_sn"];
 	 	 	//if(!this.QUERY_Status.Personalize && this["QUERY_Status"]!=null) this.QUERY_Status.Text = this["QUERY_Status"];
        	this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{

            if (column.ID == "DataList1_Status")
            {

                if (rs["status"].ToString() == "N")
                {
                    cell.OutputHTML = "<img src=\"/flowwork/img/icon-senddoc.gif\" border=\"0\">" + "<font color=\"orange\">未送審</font>";
                }
                if (rs["status"].ToString() == "Y")
                {
                    cell.OutputHTML = "<img src=\"/Lib/Img/icon-go.gif\" border=\"0\">" + "<font color=\"green\">送審中</font>";
                }
                if (rs["status"].ToString() == "V")
                {
                    cell.OutputHTML = "<img src=\"/ManagePDF/images/delete.gif\" border=\"0\">" + "作廢";
                }
                if (rs["status"].ToString() == "C")
                {
                    cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-agree.gif\" border=\"0\">" + "<font color=\"blue\">完成審核</font>";
                }
                if (rs["status"].ToString() == "T")
                {
                    cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-reject.gif\" border=\"0\">" + "<font color=\"red\">退回</font>";
                }
                if (rs["status"].ToString() == "E")
                {
                    cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-reject.gif\" border=\"0\">" + "<font color=\"red\">退回至ERP</font>";
                }
            }

            if (column.ID == "DataColnm")
            {
                if ((rs["status"].ToString().Trim() == "Y") || (rs["status"].ToString().Trim() == "R")) cell.Value = rs["name"].ToString();
            }


 	 	 	if(column.ID=="DataList1_edit")
 	 	 	{
                //Response.Write(this.CurrentUser.Name + "--<br>");

                if ((rs["status"].ToString() == "C") || (this.CurrentUser.Name != rs["gen02_1"].ToString().ToUpper() )) 
                {
                    cell.OutputHTML = "&nbsp;";
                }
                else
                {
                    cell.OutputHTML = "<a href=\"CBGI014Edit.aspx?rowid=" + rs["rowid"].ToString() + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
                }
                
                 
 	 	 	}
            
 	 	 	if(column.ID=="DataList1_view")
 	 	 	{
                if(rs["tc_cba02"].ToString().Substring(0,1)=="1")
 	 	 	 	cell.LinkURL = "CBGI014View.aspx?rowid="+rs["rowid"].ToString();
            else cell.LinkURL = "CBGI014_ACCView.aspx?rowid=" + rs["rowid"].ToString();
                
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
        
 	 	if(!this.QUERY_PlantId.Personalize) this["QUERY_PlantId"] = this.QUERY_PlantId.Text ;
 	 	if(!this.QUERY_tc_cba00.Personalize) this["QUERY_tc_cba00"] = this.QUERY_tc_cba00.Text ;
 	 	if(!this.QUERY_gem02_0.Personalize) this["QUERY_gem02_0"] = this.QUERY_gem02_0.Text ;
 	 	if(!this.QUERY_sn.Personalize) this["QUERY_sn"] = this.QUERY_sn.Text ;
 	 	//if(!this.QUERY_Status.Personalize) this["QUERY_Status"] = this.QUERY_Status.Text ;
		string whereis = "";
		
 	 	if (this.QUERY_PlantId.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " a.PlantId LIKE N'%" + this.QUERY_PlantId.Text + "%'";
 	 	}
 	 	if (this.QUERY_tc_cba00.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " a.tc_cba00 LIKE N'%" + this.QUERY_tc_cba00.Text + "%'";
 	 	}
 	 	if (this.QUERY_gem02_0.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " a.gem02_0 LIKE N'%" + this.QUERY_gem02_0.Text + "%'";
 	 	}
 	 	if (this.QUERY_sn.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " a.sn LIKE N'%" + this.QUERY_sn.Text + "%'";
 	 	}

        if (QUERY_status.SelectedValue != "Filter")
        {
            if (whereis != "")
                whereis = whereis + " AND";

            whereis = whereis + " a.status='" + QUERY_status.SelectedValue + "'";

        }

        if (ListType.SelectedValue != "Filter")
        {
            if (whereis != "")
                whereis = whereis + " AND";

            whereis = whereis + " a.tc_cba02 like '%" + ListType.SelectedValue + "%'";

        }

        


        //if (this.QUERY_Status.Text!="")
        //{
        //    if (whereis!="")
        //        whereis = whereis + " AND";
        //    whereis = whereis + " a.Status LIKE N'%" + this.QUERY_Status.Text + "%'";
        //}
		if (whereis!="")
			whereis = " WHERE" + whereis;
        DataList1.SQL = "SELECT a.*,t.name FROM eipb.dbo.CBGI014_Head a inner join ( " +
            " SELECT file_sn,MAX(ver)tver FROM eipb.dbo.CBGI014_Head  group by file_sn) "+
            " b on a.File_sn=b.File_sn and a.ver=b.tver " + 
                     "left join (select  rowid ad,appid  from [EIPB].[dbo].[doulog] x " + 
             "           inner join (   " + 
             "select rowid ad,MAX(appdate) datei  from [EIPB].[dbo].[doulog]   " + 
             "where appdate is not null group by  rowid ) y    " + 
             "on x.rowid=y.ad and x.appdate=y.datei )z on a.rowid=z.ad " +
              "left join EIPA.dbo.dguser t on z.appid=t.id  " +  whereis;

         //DataList1.SQL = "SELECT * FROM eipb.dbo.CBGI014_Head   "+  whereis;


        //Response.Write(DataList1.SQL);
	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("CBGI014Add.aspx");
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
		Response.Redirect("CBGI014Delete.aspx?"+deletekeys+"&multiple=1");
	}


    protected void InputButton1_Click(object sender, EventArgs e)
    {
        if (!this.QUERY_PlantId.Personalize) this["QUERY_PlantId"] = this.QUERY_PlantId.Text;
        if (!this.QUERY_tc_cba00.Personalize) this["QUERY_tc_cba00"] = this.QUERY_tc_cba00.Text;
        if (!this.QUERY_gem02_0.Personalize) this["QUERY_gem02_0"] = this.QUERY_gem02_0.Text;
        if (!this.QUERY_sn.Personalize) this["QUERY_sn"] = this.QUERY_sn.Text;
        //if(!this.QUERY_Status.Personalize) this["QUERY_Status"] = this.QUERY_Status.Text ;
        string whereis = "";

        if (this.QUERY_PlantId.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " a.PlantId LIKE N'%" + this.QUERY_PlantId.Text + "%'";
        }
        if (this.QUERY_tc_cba00.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " a.tc_cba00 LIKE N'%" + this.QUERY_tc_cba00.Text + "%'";
        }
        if (this.QUERY_gem02_0.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " a.gem02_0 LIKE N'%" + this.QUERY_gem02_0.Text + "%'";
        }
        if (this.QUERY_sn.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " a.sn LIKE N'%" + this.QUERY_sn.Text + "%'";
        }

        if (QUERY_status.SelectedValue != "Filter")
        {
            if (whereis != "")
                whereis = whereis + " AND";

            whereis = whereis + " a.status='" + QUERY_status.SelectedValue + "'";

        }

        if (ListType.SelectedValue != "Filter")
        {
            if (whereis != "")
                whereis = whereis + " AND";

            whereis = whereis + " a.tc_cba02 like '%" + ListType.SelectedValue + "%'";

        }




        //if (this.QUERY_Status.Text!="")
        //{
        //    if (whereis!="")
        //        whereis = whereis + " AND";
        //    whereis = whereis + " a.Status LIKE N'%" + this.QUERY_Status.Text + "%'";
        //}
        if (whereis != "")
            whereis = " WHERE" + whereis;
        DataList1.SQL = "SELECT a.*,t.name FROM eipb.dbo.CBGI014_Head a left join "+
             "  (select  rowid ad,appid  from [EIPB].[dbo].[doulog] x " +
             "           inner join (   " +
             "select rowid ad,MAX(appdate) datei  from [EIPB].[dbo].[doulog]   " +
             "where appdate is not null group by  rowid ) y    " +
             "on x.rowid=y.ad and x.appdate=y.datei )z on a.rowid=z.ad " +
              "left join EIPA.dbo.dguser t on z.appid=t.id  " + whereis;

    }
}
}
