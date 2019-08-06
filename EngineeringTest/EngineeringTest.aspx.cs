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

namespace EngineeringTest
{
public partial class EngineeringTest : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "EngineeringTest List Page";
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
            
 	 	 	if(!this.QUERY_no.Personalize && this["QUERY_no"]!=null) this.QUERY_no.Text = this["QUERY_no"];
 	 	 	if(!this.QUERY_cima01.Personalize && this["QUERY_cima01"]!=null) this.QUERY_cima01.Text = this["QUERY_cima01"];
 	 	 	if(!this.QUERY_makes_no.Personalize && this["QUERY_makes_no"]!=null) this.QUERY_makes_no.Text = this["QUERY_makes_no"];
 	 	 	if(!this.QUERY_add_user.Personalize && this["QUERY_add_user"]!=null) this.QUERY_add_user.Text = this["QUERY_add_user"];
 	 	 	if(!this.QUERY_add_date.Personalize && this["QUERY_add_date"]!=null) this.QUERY_add_date.Text = this["QUERY_add_date"];
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
                if (this.CurrentUser.ID.ToString().Substring(1, 36) == rs["add_user2"].ToString().ToUpper() && rs["status"].ToString() != "V")
                {

                    cell.OutputHTML = "<a href=\"EngineeringTestEdit.aspx?id=" + rs["id"].ToString() + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";

                }
                else
                {
                    cell.OutputHTML = "&nbsp;";

                }
 	 	 	}

           if (column.ID == "DataList1_makes_no")
          {
              cell.OutputHTML = "<a href=\"EngineeringTestReport.aspx?id=" + rs["id"].ToString() + "\">" + rs["makes_no"].ToString() + "</a>";

          }
 	 	 	if(column.ID=="DataList1_view")
 	 	 	{
 	 	 	 	cell.LinkURL = "EngineeringTestView.aspx?id="+rs["id"].ToString();
 	 	 	}
            //列印小卡
            if (column.ID == "DataList1_print")
            {
                //if (rs["status"].ToString() == "完成審核")
                //{
                cell.OutputHTML = "<a target='_new' href=\"http://rs.minaik.com.tw/MBCS_report/MBCS_report_page.aspx?id=" + rs["id"].ToString() + "\"><img src=\"/ManagePDF/images/File.gif\" border=\"0\"></a>";
                //}
                //cell.LinkURL = "EngineeringTestView.aspx?id=" + rs["id"].ToString();
            }

            if (column.ID == "DataList1_status")
            {
                if (rs["status"].ToString() == "N")
                {
                    cell.OutputHTML = "<font color=\"orange\">未送審</font>" + "<img src=\"./Image/icon-senddoc.gif\" border=\"0\">";
                }
                if (rs["status"].ToString() == "Y")
                {
                    cell.OutputHTML = "<font color=\"green\">送審中</font>" + "<img src=\"./Image/icon-go.gif\" border=\"0\">";
                }
                if (rs["status"].ToString() == "V")
                {
                    cell.OutputHTML = "作廢" + "<img src=\"./Image/delete.gif\" border=\"0\">";
                }
                if (rs["status"].ToString() == "完成審核")
                {
                    cell.OutputHTML = "<font color=\"blue\">完成審核</font>" + "<img src=\"./Image/icon-agree.gif\" border=\"0\">";
                }
                if (rs["status"].ToString() == "退回")
                {
                    cell.OutputHTML = "<font color=\"red\">退回</font>" + "<img src=\"./Image/icon-reject.gif\" border=\"0\">";
                }
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
 	 	if(!this.QUERY_cima01.Personalize) this["QUERY_cima01"] = this.QUERY_cima01.Text ;
 	 	if(!this.QUERY_makes_no.Personalize) this["QUERY_makes_no"] = this.QUERY_makes_no.Text ;
 	 	if(!this.QUERY_add_user.Personalize) this["QUERY_add_user"] = this.QUERY_add_user.Text ;
 	 	if(!this.QUERY_add_date.Personalize) this["QUERY_add_date"] = this.QUERY_add_date.Text ;
 	 	//if(!this.QUERY_status.Personalize) this["QUERY_status"] = this.QUERY_status.Text ;
		string whereis = " 1=1";
		
 	 	if (this.QUERY_no.Text.Trim()!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " no LIKE N'%" + this.QUERY_no.Text + "%'";
 	 	}
 	 	if (this.QUERY_cima01.Text.Trim()!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " cima01 LIKE N'%" + this.QUERY_cima01.Text + "%'";
 	 	}
 	 	if (this.QUERY_makes_no.Text.Trim()!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " makes_no LIKE N'%" + this.QUERY_makes_no.Text + "%'";
 	 	}
 	 	if (this.QUERY_add_user.Text.Trim()!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " add_user LIKE N'%" + this.QUERY_add_user.Text + "%'";
 	 	}
        if (this.QUERY_ccima01.Text.Trim() != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " SUBSTRing(cima01,3,2) LIKE N'%" + this.QUERY_ccima01.Text + "%'";
        }
        if (this.QUERY_add_date.Text.Trim() != "" && this.QUERY_add_date2.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " add_date >= CONVERT(datetime,'" + this.QUERY_add_date.Text + "') and add_date <= CONVERT(datetime,'" + this.QUERY_add_date2.Text + "')+1"; //+1是因為要讓日期變成後一天的00點00分

        }
        if (this.QUERY_add_date.Text.Trim() != "" && this.QUERY_add_date.Text == "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " add_date >= CONVERT(datetime,'" + this.QUERY_add_date.Text + "') ";


        }
        if (this.QUERY_add_date.Text.Trim() == "" && this.QUERY_add_date2.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " add_date <= CONVERT(datetime,'" + this.QUERY_add_date2.Text + "') ";

        }

        if (this.QUERY_status.Text.Trim() != "Filter")
        {
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " status LIKE N'%" + this.QUERY_status.Text + "%'";
 	 	}
		if (whereis!="")
			whereis = " WHERE" + whereis;
		DataList1.SQL = "select a.id,no,plantid, "+
                     " CASE (rd_level)  WHEN '1' THEN '工程試作'  WHEN '2' THEN '小量生產'  else rd_level  END rd_level "+
                     " ,cima01,cima02,oduction_amount,convert(char, add_date, 111) add_date, "+
                     " name add_user,add_user add_user2,convert(char, expect_date, 111) expect_date,makes_no,convert(char, try_date, 111) try_date, " +
                     " status " +
                     " from EngineeringTest_head a left join dguser b on a.add_user=b.id" + whereis + " order by no desc";

        //Response.Write(DataList1.SQL);
	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("EngineeringTestAdd.aspx");
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
		Response.Redirect("EngineeringTestDelete.aspx?"+deletekeys+"&multiple=1");
	}
}
}
