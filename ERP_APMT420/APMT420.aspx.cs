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

namespace ERP_APMT420
{
public partial class APMT420 : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "APMT420 List Page";

        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Plant"]))
                this.QUERY_plantID.Text = Request.QueryString["Plant"];

        }

	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
            
 	 	 	if(!this.QUERY_no.Personalize && this["QUERY_no"]!=null) this.QUERY_no.Text = this["QUERY_no"];
 	 	 	if(!this.QUERY_plantID.Personalize && this["QUERY_plantID"]!=null) this.QUERY_plantID.Text = this["QUERY_plantID"];
 	 	 	if(!this.QUERY_pmk01.Personalize && this["QUERY_pmk01"]!=null) this.QUERY_pmk01.Text = this["QUERY_pmk01"];
 	 	 	if(!this.QUERY_pmk04.Personalize && this["QUERY_pmk04"]!=null) this.QUERY_pmk04.Text = this["QUERY_pmk04"];
 	 	 	if(!this.QUERY_gen02_3.Personalize && this["QUERY_gen02_3"]!=null) this.QUERY_gen02_3.Text = this["QUERY_gen02_3"];
 	 	 	if(!this.QUERY_gem02_4.Personalize && this["QUERY_gem02_4"]!=null) this.QUERY_gem02_4.Text = this["QUERY_gem02_4"];
 	 	 	//if(!this.QUERY_status.Personalize && this["QUERY_status"]!=null) this.QUERY_status.Text = this["QUERY_status"];
        	this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{   
            
            
 	 	 	if(column.ID=="DataList1_edit")
 	 	 	{
                cell.LinkURL = "APMT420Edit.aspx?id=" + rs["id"].ToString();
 	 	 	}
            
 	 	 	if(column.ID=="DataList1_view")
 	 	 	{
                cell.LinkURL = "APMT420View.aspx?id=" + rs["id"].ToString();
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
        
 	 	if(!this.QUERY_no.Personalize) this["QUERY_no"] = this.QUERY_no.Text ;
 	 	if(!this.QUERY_plantID.Personalize) this["QUERY_plantID"] = this.QUERY_plantID.Text ;
 	 	if(!this.QUERY_pmk01.Personalize) this["QUERY_pmk01"] = this.QUERY_pmk01.Text ;
 	 	if(!this.QUERY_pmk04.Personalize) this["QUERY_pmk04"] = this.QUERY_pmk04.Text ;
 	 	if(!this.QUERY_gen02_3.Personalize) this["QUERY_gen02_3"] = this.QUERY_gen02_3.Text ;
 	 	if(!this.QUERY_gem02_4.Personalize) this["QUERY_gem02_4"] = this.QUERY_gem02_4.Text ;
 	 	//if(!this.QUERY_status.Personalize) this["QUERY_status"] = this.QUERY_status.Text ;
		string whereis = "";

        if (this.QUERY_no.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " no LIKE N'%" + this.QUERY_no.Text + "%'";
        }
 	 	if (this.QUERY_plantID.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " a.plantID LIKE N'%" + this.QUERY_plantID.Text + "%'";
 	 	}
 	 	if (this.QUERY_pmk01.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " b.pmk01 LIKE N'%" + this.QUERY_pmk01.Text + "%'";
 	 	}
        if (this.QUERY_pmk04.Text != "" && this.QUERY_pmk041.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " CONVERT(varchar(12) , a.pmk04, 111 ) >= '" + this.QUERY_pmk04.Text + "' and CONVERT(varchar(12) , a.pmk04, 111 ) <= DATEADD(day, 1, '" + this.QUERY_pmk041.Text + "')"; //+1是因為要讓日期變成後一天的00點00分

        }
        if (this.QUERY_pmk04.Text != "" && this.QUERY_pmk041.Text == "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " CONVERT(varchar(12) , a.pmk04, 111 ) >= CONVERT(datetime,'" + this.QUERY_pmk04.Text + "') ";


        }
        if (this.QUERY_pmk04.Text == "" && this.QUERY_pmk041.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " CONVERT(varchar(12) , a.pmk04, 111 ) <= CONVERT(datetime,'" + this.QUERY_pmk041.Text + "') ";

        }
 	 	if (this.QUERY_gen02_3.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " gen02_3 LIKE N'%" + this.QUERY_gen02_3.Text + "%'";
 	 	}
 	 	if (this.QUERY_gem02_4.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " gem02_4 LIKE N'%" + this.QUERY_gem02_4.Text + "%'";
 	 	}
        if (this.QUERY_pur.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " name LIKE N'%" + this.QUERY_pur.Text + "%'";
        }
        if (this.QUERY_status.Text != "Filter")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " status LIKE N'%" + this.QUERY_status.Text + "%'";
 	 	}
		if (whereis!="")
            whereis = " WHERE  " + whereis;
        
            //Response.Write("SELECT a.id id,a.no no,a.plantid plantid,a.pmk01 pmk01,a.pmk02 pmk02,CONVERT(varchar(12) , a.pmk04, 111 ) pmk04,a.pmk06 pmk06,a.pmk12 pmk12,a.gen02_3 gen02_3,a.pmk13 pmk13,a.gem02_4 gem02_4,a.status status,c.name name, convert(char, d.reviewdate, 120) reviewdate,a.pmc03 FROM APMT420_IN_HEAD a LEFT JOIN APMT420_IN_BODY b ON NO=BNO left join dguser c on a.pur=c.id left join dgflowlog d on UPPER(substring(d.requesturl,34,60))=a.id and reviewerurl='/erp_apmt420/apmt420view.aspx' and status='Y' and text='ERP請購單電子簽核' and resulttype='complete' " + whereis + " group by a.no,a.plantid,a.pmk01,a.pmk02,a.pmk04,a.pmk06,a.pmk12,a.gen02_3,a.pmk13,a.gem02_4,a.status,a.id,c.name,d.reviewdate,a.pmc03 ");
        
            //Response.Write("SELECT a.id id,a.no no,a.plantid plantid,a.pmk01 pmk01,a.pmk02 pmk02,CONVERT(varchar(12) , a.pmk04, 111 ) pmk04,a.pmk06 pmk06,a.pmk12 pmk12,a.gen02_3 gen02_3,a.pmk13 pmk13,a.gem02_4 gem02_4,a.status status,c.name name, convert(char, d.initdate, 120) initdate,a.pmc03 FROM APMT420_IN_HEAD a LEFT JOIN APMT420_IN_BODY b ON NO=BNO left join dguser c on a.pur=c.id left join dgflowlog d on UPPER(substring(d.requesturl,34,60))=a.id and reviewerurl='/erp_apmt420/apmt420view.aspx' and status='Y' and text='ERP請購單電子簽核' " + whereis + " group by a.no,a.plantid,a.pmk01,a.pmk02,a.pmk04,a.pmk06,a.pmk12,a.gen02_3,a.pmk13,a.gem02_4,a.status,a.id,c.name,d.initdate,a.pmc03 ");

        DataList1.SQL = "SELECT a.id id,a.no no,a.plantid plantid,a.pmk01 pmk01,a.pmk02 pmk02,CONVERT(varchar(12) , a.pmk04, 111 ) pmk04,a.pmk06 pmk06,a.pmk12 pmk12,a.gen02_3 gen02_3,a.pmk13 pmk13,a.gem02_4 gem02_4,CASE (a.status )  WHEN 'Y' THEN '完成審核'  WHEN 'N' THEN '未送審'  else a.status  END status,c.name name, convert(char, d.reviewdate, 120) reviewdate,a.pmc03 FROM APMT420_IN_HEAD a LEFT JOIN APMT420_IN_BODY b ON NO=BNO left join dguser c on a.pur=c.id left join dgflowlog d on UPPER(substring(d.requesturl,34,60))=a.id  and status='Y' and text='ERP請購單電子簽核' and resulttype='complete' " + whereis + " group by a.no,a.plantid,a.pmk01,a.pmk02,a.pmk04,a.pmk06,a.pmk12,a.gen02_3,a.pmk13,a.gem02_4,a.status,a.id,c.name,d.reviewdate,a.pmc03 ";

        if (this.CurrentUser.LogonID == "herzog.lin")
        {
            Response.Write(DataList1.SQL);
        }
            //DataList1.SQL = "SELECT a.id,no,a.plantid,a.pmk01,pmk02,CONVERT(varchar(12) , pmk04, 111 ) pmk04,pmk06,pmk12,gen02_3,pmk13,gem02_4,status,name FROM APMT420_IN_HEAD a  LEFT JOIN APMT420_IN_BODY b ON NO=BNO left join dguser c on a.pur=c.id " + whereis + "group by no,a.plantid,a.pmk01,pmk02,pmk04,pmk06,pmk12,gen02_3,pmk13,gem02_4,status,a.id,name";
	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("APMT420Add.aspx");
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
		Response.Redirect("APMT420Delete.aspx?"+deletekeys+"&multiple=1");
	}
}
}
