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

namespace ERP_CXMT310
{
public partial class CXMT310 : SmoothEnterprise.Web.Page
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
	protected void Page_Load(object sender, System.EventArgs e)
	{
        if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
        {
            db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
            db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 

        }
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
            
 	 	 	if(!this.QUERY_no.Personalize && this["QUERY_no"]!=null) this.QUERY_no.Text = this["QUERY_no"];
 	 	 	if(!this.QUERY_plantid.Personalize && this["QUERY_plantid"]!=null) this.QUERY_plantid.Text = this["QUERY_plantid"];
 	 	 	if(!this.QUERY_oqa01.Personalize && this["QUERY_oqa01"]!=null) this.QUERY_oqa01.Text = this["QUERY_oqa01"];
            if (!this.QUERY_oqa02.Personalize && this["QUERY_oqa02"] != null) this.QUERY_oqa02.Text = this["QUERY_oqa02"];
            if (!this.QUERY_oqa02_2.Personalize && this["QUERY_oqa02_21"] != null) this.QUERY_oqa02_2.Text = this["QUERY_oqa02_2"];
        	this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{


            if (column.ID == "DataList1_edit")
            {
                if ((rs["STATUS"].ToString() == "OK") || (rs["STATUS"].ToString() == "V") || (rs["STATUS"].ToString() == "NO"))
                {
                    cell.OutputHTML = "&nbsp;";
                }
                else
                {
                    cell.OutputHTML = "<a href=\"CXMT310Edit.aspx?id=" + rs["id"].ToString() + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
                }
            }

            if (column.ID == "DataList1_view")
            {
                cell.LinkURL = "CXMT310View.aspx?id=" + rs["id"].ToString();
            }


            if (column.ID == "DataList1_status")
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
                if (rs["status"].ToString() == "OK")
                {
                    cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-agree.gif\" border=\"0\">" + "<font color=\"blue\">完成審核</font>";
                }
                if (rs["status"].ToString() == "NO")
                {
                    cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-reject.gif\" border=\"0\">" + "<font color=\"red\">退回至ERP</font>";
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
 	 	if(!this.QUERY_plantid.Personalize) this["QUERY_plantid"] = this.QUERY_plantid.Text ;
 	 	if(!this.QUERY_oqa01.Personalize) this["QUERY_oqa01"] = this.QUERY_oqa01.Text ;
        if (!this.QUERY_oqa02.Personalize) this["QUERY_oqa02"] = this.QUERY_oqa02.Text;
        if (!this.QUERY_oqa02_2.Personalize) this["QUERY_oqa02_2"] = this.QUERY_oqa02_2.Text;
		string whereis = "";

        if (this.QUERY_no.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " no LIKE N'%" + this.QUERY_no.Text + "%'";
        }
        if (this.QUERY_plantid.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " plantid LIKE N'%" + this.QUERY_plantid.Text + "%'";
        }
        if (this.QUERY_oqa01.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " oqa01 LIKE N'%" + this.QUERY_oqa01.Text + "%'";
        }
        if (this.QUERY_oqa02.Text != "" && this.QUERY_oqa02_2.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " CONVERT(varchar(12) , oqa02, 111 ) >= '" + this.QUERY_oqa02.Text + "' and CONVERT(varchar(12) , oqa02, 111 ) <= '" + this.QUERY_oqa02_2.Text + "'"; //+1是因為要讓日期變成後一天的00點00分

        }
        if (this.QUERY_oqa02.Text != "" && this.QUERY_oqa02_2.Text == "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " CONVERT(varchar(12) , oqa02, 111 ) >= CONVERT(datetime,'" + this.QUERY_oqa02.Text + "') ";
        }

        if (this.QUERY_oqa02.Text == "" && this.QUERY_oqa02_2.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " CONVERT(varchar(12) , oqa02, 111 ) <= CONVERT(datetime,'" + this.QUERY_oqa02_2.Text + "') ";

        }
        if (this.QUERY_status.Text != "Filter")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " status LIKE N'%" + this.QUERY_status.Text + "%'";
        }

        //如果是管理者,將不受限制 
        string Au1 = "0";

        //資訊單位,內稽單位
        string Au3 = "0";

        //是否為管理者
        SmoothEnterprise.Database.DataSet cs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        cs.Open("SELECT COUNT(*) as ident   FROM " + db2 + " dgroleuser  where uid='" + this.CurrentUser.ID + "' and  rid='319B0DB6-C4BE-4DAA-8BB8-27415009BF5E'");
        if (!cs.EOF) Au1 = cs["ident"].ToString();

        cs.Close();

        if (this.CurrentUser.LogonID.ToLower() == "yoyo.huang") Au1 = "1";
        //是否為部門主管
        cs.Open("  select COUNT(*)  ident  from " + db2 + "dguser where gid in (select  id from  " + db2 + "dggroup  where name in " +
            " ('資訊部','內部稽核部','會計部,')) and  id='" + this.CurrentUser.ID + "'");
        if (!cs.EOF) Au3 = cs["ident"].ToString();
        cs.Close();

        if ((Au1 == "1") || (Au3 == "1"))
        {
            if (whereis != "")
                whereis = " where " + whereis;

        }
        else
        {
            if (whereis != "")
            {
                whereis = " where " + whereis + " and (user_id='" + this.CurrentUser.ID + "' or b.id='" + this.CurrentUser.ID + "')";

            }
            else
            {
                whereis = " where (user_id='" + this.CurrentUser.ID + "' or b.id='" + this.CurrentUser.ID + "' )";

            }


        }

        DataList1.SQL = "select distinct a.id id,no,ver,plantid,l_azp03,oqa01,convert(char, oqa02, 111) oqa02,ta_oqa010,g_name,g_user,gem02_0,status " +
                        "from " + db1 + "cxmt310_in_head a left join " + db2 + "dguser b on a.g_user=b.erpid   " +
                        "left join (select mid,user_id from " + db1 + "CXMT310_sign a left join " + db2 + "dguser b on a.user_id=b.id) c on a.id=c.mid   " + whereis;

       // Response.Write(DataList1.SQL);
	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("CXMT310Add.aspx");
	}




}
}
