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

namespace ERP_AXMT610
{
public partial class AXMT610 : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "AXMT610 List Page";
        //客戶的下拉選單---------------------------------------------------------------------------
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
        this.QUERY_COM.Items.Add("Filter", "");
        ds.Open("SELECT DISTINCT occ02_1 FROM AXMT610_IN_HEAD order by occ02_1 ");
        while (!ds.EOF)
        {
            this.QUERY_COM.Items.Add(ds["occ02_1"].ToString(), ds["occ02_1"].ToString());
            ds.MoveNext();
        }


        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Plant"]))
                QUERY_plantid.Text= Request.QueryString["Plant"];

        }

        //-----------------------------------------------------------------------------------------------
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
            
 	 	 	if(!this.QUERY_no.Personalize && this["QUERY_no"]!=null) this.QUERY_no.Text = this["QUERY_no"];
 	 	 	if(!this.QUERY_plantid.Personalize && this["QUERY_plantid"]!=null) this.QUERY_plantid.Text = this["QUERY_plantid"];
 	 	 	if(!this.QUERY_oga01.Personalize && this["QUERY_oga01"]!=null) this.QUERY_oga01.Text = this["QUERY_oga01"];
 	 	 	if(!this.QUERY_oga02.Personalize && this["QUERY_oga02"]!=null) this.QUERY_oga02.Text = this["QUERY_oga02"];
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
 	 	 	 	//cell.LinkURL = "AXMT610Edit.aspx?id="+rs["id"].ToString();
                if ((rs["STATUS"].ToString() == "完成審核") || (rs["STATUS"].ToString() == "V") )
                {
                    cell.OutputHTML = "&nbsp;";
                }
                else
                {
                    cell.OutputHTML = "<a href=\"AXMT610Edit.aspx?id=" + rs["id"].ToString() + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
                }
 	 	 	}
            
 	 	 	if(column.ID=="DataList1_view")
 	 	 	{
                cell.OutputHTML = "<a href=\"AXMT610View.aspx?id=" + rs["id"].ToString() + "\"><img src=\"/Lib/Img/icon-zoom.gif\" border=\"0\"></a>";
 	 	 	}

            if (column.ID == "DataList1_status")
            {
                if (rs["status"].ToString() == "N")
                {
                    cell.OutputHTML = "<font color=\"orange\">未送審</font>" + "<img src=\"/flowwork/img/icon-senddoc.gif\" border=\"0\">";
                }
                if (rs["status"].ToString() == "Y")
                {
                    cell.OutputHTML = "<font color=\"green\">送審中</font>" + "<img src=\"/Lib/Img/icon-go.gif\" border=\"0\">";
                }
                if (rs["status"].ToString() == "V")
                {
                    cell.OutputHTML = "作廢" + "<img src=\"/ManagePDF/images/delete.gif\" border=\"0\">";
                }
                if (rs["status"].ToString() == "完成審核")
                {
                    cell.OutputHTML = "<font color=\"blue\">完成審核</font>" + "<img src=\"/ManagePDF/images/icon-agree.gif\" border=\"0\">";
                }
                if (rs["status"].ToString() == "退回")
                {
                    cell.OutputHTML = "<font color=\"red\">退回</font>" + "<img src=\"/ManagePDF/images/icon-reject.gif\" border=\"0\">";
                }
            }


            if (column.ID == "DataList1_pro")
            {


                //cell.OutputHTML = "<a href=AttachDownload.aspx?hid=" + rs["requesturl"].ToString() + "\"><img src=\"/Lib/Img/icon-image.gif\" border=\"0\"></a>";
                //cell.OutputHTML = "<a target=\"_blank\" href=http://eip.minaik.com.tw/ERP_AXMT610/FileDownload.aspx?atnu=1&hid=" + rs["requesturl"].ToString().Substring(rs["requesturl"].ToString().IndexOf("=") + 1, 36) + "\"> aa </a>" + "<a target=\"_blank\" href=http://eip.minaik.com.tw/ERP_AXMT610/FileDownload.aspx?atnu=1&hid=" + rs["requesturl"].ToString().Substring(rs["requesturl"].ToString().IndexOf("=") + 1, 36) + "\"> aa </a>";
                string output = "";
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs2.Open("SELECT id,FileName FROM axmt610_File WHERE FileKey='" + rs["id"].ToString() + "'");
                while (!rs2.EOF)
                {
                    output = output + "<a target=\"_blank\" href=http://eip.minaik.com.tw/ERP_AXMT610/FileDownload.aspx?id=" + rs2["id"].ToString() + "\"> " + rs2["FileName"].ToString() + " </a>" + "<br><br>";
                    rs2.MoveNext();


                }
                rs2.Close();
                if (output.ToString().Length == 0)
                {
                    output = "---";
                }

                cell.OutputHTML = output.ToString();

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
 	 	if(!this.QUERY_plantid.Personalize) this["QUERY_plantid"] = this.QUERY_plantid.Text ;
 	 	if(!this.QUERY_oga01.Personalize) this["QUERY_oga01"] = this.QUERY_oga01.Text ;
 	 	if(!this.QUERY_oga02.Personalize) this["QUERY_oga02"] = this.QUERY_oga02.Text ;
 	 	//if(!this.QUERY_status.Personalize) this["QUERY_status"] = this.QUERY_status.Text ;
		string whereis = "";
		
 	 	if (this.QUERY_no.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " no LIKE N'%" + this.QUERY_no.Text + "%'";
 	 	}
 	 	if (this.QUERY_plantid.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " plantid LIKE N'%" + this.QUERY_plantid.Text + "%'";
 	 	}
        if (this.QUERY_plantid2.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " l_azp03 LIKE N'%" + this.QUERY_plantid2.Text + "%'";
        }
 	 	if (this.QUERY_oga01.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " oga01 LIKE N'%" + this.QUERY_oga01.Text + "%'";
 	 	}
        if (this.QUERY_oga02.Text != "" && this.QUERY_oga02_2.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " CONVERT(varchar(12) , oga02, 111 ) >= '" + this.QUERY_oga02.Text + "' and CONVERT(varchar(12) , oga02, 111 ) <= DATEADD(day, 1, '" + this.QUERY_oga02_2.Text + "')"; //+1是因為要讓日期變成後一天的00點00分

        }
        if (this.QUERY_oga02.Text != "" && this.QUERY_oga02_2.Text == "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " CONVERT(varchar(12) , oga02, 111 ) >= CONVERT(datetime,'" + this.QUERY_oga02.Text + "') ";


        }
        if (this.QUERY_COM.Items.ToString() != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + "  occ02_1 like N'%" + QUERY_COM.Value.ToString() + "%'";
        }
        if (this.QUERY_oga02.Text == "" && this.QUERY_oga02_2.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " CONVERT(varchar(12) , oga02, 111 ) <= CONVERT(datetime,'" + this.QUERY_oga02_2.Text + "') ";

        }


        if (InpDeptnm.Text != "")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
            whereis = whereis + " gem02_3 LIKE N'%" + InpDeptnm.Text + "%'";
 	 	}

        if (this.QUERY_status.Text != "Filter")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " status LIKE N'%" + this.QUERY_status.Text + "%'";
 	 	}
        if (whereis != "")
            whereis = " WHERE" + whereis;

        if (this.CurrentUser.LogonID.ToUpper() == "CATHERINE.WU" || this.CurrentUser.LogonID.ToUpper() == "CAROL.YEH" || this.CurrentUser.LogonID.ToString() == "smooth" || this.CurrentUser.LogonID.ToString() == "yc.chen" || this.CurrentUser.LogonID.ToString() == "frances.lee" || this.CurrentUser.LogonID.ToString() == "pearl.hsieh" || this.CurrentUser.LogonID.ToString() == "aifen" || this.CurrentUser.LogonID.ToString() == "al.hong" || this.CurrentUser.LogonID.ToString() == "yoyo.huang" || this.CurrentUser.LogonID.ToString() == "sandy.cheng" || this.CurrentUser.LogonID.ToString() == "jenny.tsai")
        {

            DataList1.SQL = "SELECT id,l_azp03,no,no_order,plantid,programid,oga00,oga01,CONVERT(varchar(12) , oga02, 111 ) oga02,oga03,oga011,occ02_1,gem02_3,gen02_4,status, "+
                            "oga23+' '+format(round(convert(float,convert(varchar(20),oga50)),2),'#,#.00') oga50,"+
                            " format(round(convert(float,convert(varchar(20),tot)),2),'#,#.00') tot,  " +
                            "format(round(convert(float,convert(varchar(20),bal)),2),'#,#.00') bal,"+
                            " format(round(convert(float,convert(varchar(20),l_amt01)),2),'#,#.00')  l_amt01,"+
                            " format(round(convert(float,convert(varchar(20),l_amt02)),2),'#,#.00')  l_amt02,"+
                            " format(round(convert(float,convert(varchar(20),l_amt03)),2),'#,#.00')  l_amt03,  " +
                            "CASE WHEN Reason_user='' OR Reason_user is null THEN '---' ELSE Reason_user END Reason_user,  "+
                            "CASE WHEN Improve_user='' OR Improve_user is null THEN '---' ELSE Improve_user END Improve_user, "+
                            "CASE WHEN Reason_salse='' OR Reason_salse is null THEN '---' ELSE Reason_salse END Reason_salse,  "+
                            "CASE WHEN Improve_salse='' OR Improve_salse is null THEN '---' ELSE Improve_salse END Improve_salse, " +
                             " CASE WHEN annotate_user='' OR annotate_user is null THEN '---' ELSE annotate_user END annotate_user,  " +
                            " CASE WHEN annotate_salse='' OR annotate_salse is null THEN '---' ELSE annotate_salse END annotate_salse  " +
                            "FROM AXMT610_IN_HEAD" + whereis;
        }
        else
        {
            DataList1.SQL = " select * from  " +
                            " (SELECT id,no,no_order,CASE plantid  " +
                            " WHEN 'MINAIK' THEN 'MAT'  " +
                            " ELSE plantid " +
                            " END plantid  " +
                            " ,programid,oga00,oga01,CONVERT(varchar(12) , oga02, 111 ) oga02,oga03,oga011,occ02_1,gem02_3,gen02_4,status, " +
                            " CASE l_azp03 " +
                            " WHEN 'MINAIK' THEN 'MAT'  " +
                            " ELSE l_azp03 " +
                            " END l_azp03,  " +
                            " oga23+' '+format(round(convert(float,convert(varchar(20),oga50)),2),'#,#.00') oga50,   " +
                            " format(round(convert(float,convert(varchar(20),tot)),2),'#,#.00') tot,  " +
                            "format(round(convert(float,convert(varchar(20),bal)),2),'#,#.00') bal," +
                            " format(round(convert(float,convert(varchar(20),l_amt01)),2),'#,#.00')  l_amt01," +
                            " format(round(convert(float,convert(varchar(20),l_amt02)),2),'#,#.00')  l_amt02," +
                            " format(round(convert(float,convert(varchar(20),l_amt03)),2),'#,#.00')  l_amt03,  " +
                           " CASE WHEN Reason_user='' OR Reason_user is null THEN '---' ELSE Reason_user END Reason_user,  " +
                            " CASE WHEN Improve_user='' OR Improve_user is null THEN '---' ELSE Improve_user END Improve_user, " +
                            " CASE WHEN Reason_salse='' OR Reason_salse is null THEN '---' ELSE Reason_salse END Reason_salse,  " +
                            " CASE WHEN Improve_salse='' OR Improve_salse is null THEN '---' ELSE Improve_salse END Improve_salse,  " +
                            " CASE WHEN annotate_user='' OR annotate_user is null THEN '---' ELSE annotate_user END annotate_user,  " +
                            " CASE WHEN annotate_salse='' OR annotate_salse is null THEN '---' ELSE annotate_salse END annotate_salse  " +
                            " FROM AXMT610_IN_HEAD "+ whereis+") a  " +
                            " left join   " +
                            " (SELECT comid bcomid FROM DGUSER WHERE LOGONID='" + this.CurrentUser.LogonID.ToString() + "') b " +
                            " on a.plantid=bcomid " +
                            " left join   " +
                            " (SELECT comid ccomid FROM DGUSER WHERE LOGONID='" + this.CurrentUser.LogonID.ToString() + "') c " +
                            " on a.l_azp03=ccomid " +
                            " where  bcomid is not null or ccomid is not null";
        }
        if (this.CurrentUser.LogonID.ToString() == "herzog.lin")
        {
            Response.Write("herzog only list <br>"+DataList1.SQL);
        }
	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("AXMT610Add.aspx");
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
		Response.Redirect("AXMT610Delete.aspx?"+deletekeys+"&multiple=1");
	}
}
}
