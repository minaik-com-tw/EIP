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
using System.Data.SqlClient;
using System.Configuration;

namespace ERP_CIMI100
{
public partial class cimi100_New : SmoothEnterprise.Web.Page
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    private string db3 = ""; //db副2位置
	protected void Page_Load(object sender, System.EventArgs e)
	{
        if (Environment.MachineName.ToString().Trim() != "ANN-LIN") //如果不是在Ann本機, 則指定資料庫 
        {
            db1 = "[EIPB].[dbo].";
            db2 = "[EIPA].[dbo].";
            db3 = "IP185.";

        }
        else
        {

            db3 = "[192.168.0.185]."; //如果不是在Ann本機, 則指定資料庫 
        }
        if (!this.IsPostBack)
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("SELECT   bass_no,name FROM " + db1 + "cimi100_base where class_no='plantid' and bass_no <>'ALL' order by order_no"); //預設下拉廠區
            while (!rs.EOF)
            {
                this.QUERY_plantid.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                rs.MoveNext();
            }
            rs.Close();
        }
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
            
 	 	 	if(!this.QUERY_no.Personalize && this["QUERY_no"]!=null) this.QUERY_no.Text = this["QUERY_no"];
        	this.Query();

    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{

            if (column.ID == "DataList1_edit")
            {
                if ((rs["STATUS"].ToString() == "OK") || (rs["STATUS"].ToString() == "V"))
                {
                    cell.OutputHTML = "&nbsp;";
                }
                else
                {
                    if (rs["add_user"].ToString().ToUpper() == this.CurrentUser.ID.ToString().Substring(1, 36) & rs["status"].ToString() != "V")
                    {
                        
                        if (rs["class_no"].ToString().Trim() == "1")
                        {
                            cell.OutputHTML = "<a href=\"cimi100_NewEdit.aspx?id=" + rs["id"].ToString() + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
                        }
                        else
                        {
                            cell.OutputHTML = "<a href=\"cimi100_turnEdit.aspx?id=" + rs["id"].ToString() + "&class_no=" + rs["class_no"].ToString() + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";

                        }
                    }
                    else
                    {

                        cell.OutputHTML = "&nbsp;";

                    }
                }
            }

            if (column.ID == "DataList1_view")
            {
                if (rs["class_no"].ToString().Trim() == "1")
                {
                    cell.LinkURL = "cimi100_newView.aspx?id=" + rs["id"].ToString();
                }
                else
                {
                    cell.LinkURL = "cimi100_turnView.aspx?id=" + rs["id"].ToString() + "&class_no=" + rs["class_no"].ToString();
                }

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
                    cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-reject.gif\" border=\"0\">" + "<font color=\"red\">退回提案人</font>";
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
		string whereis = "";
		
 	 	if (this.QUERY_no.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " no LIKE N'%" + this.QUERY_no.Text + "%'";
 	 	}
        if (this.QUERY_add_user.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " b.name like '" + this.QUERY_add_user.Text + "%'";
        }
        if (this.QUERY_status.Text != "Filter")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " status = N'" + this.QUERY_status.Text + "'";
        }
        if (this.QUERY_plantid.Text != "Filter")
        {
            string plantid = this.QUERY_plantid.Text;
            if (plantid.Trim() == "MINAIK") plantid = "MAT";
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " plantid = N'" + plantid.Trim() + "'";
        }
        if (this.QUERY_mode.Text != "Filter")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " class_no = N'" + this.QUERY_mode.Text + "'";
        }
        if (this.QUERY_add_date.Text != "" && this.QUERY_add_date2.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " add_date >= CONVERT(datetime,'" + this.QUERY_add_date.Text + "') and add_date <= CONVERT(datetime,'" + this.QUERY_add_date2.Text + "')+1"; //+1是因為要讓日期變成後一天的00點00分

        }
        if (this.QUERY_add_date.Text != "" && this.QUERY_add_date.Text == "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " add_date >= CONVERT(datetime,'" + this.QUERY_add_date.Text + "') ";


        }
        if (this.QUERY_add_date.Text == "" && this.QUERY_add_date2.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " add_date <= CONVERT(datetime,'" + this.QUERY_add_date2.Text + "') ";

        }

        SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);  //特殊人員看全部
        rs2.Open("select * from " + db2 + "dguser where logonid  not in ('killy.wang','ann.lin','herzog.lin','yoyo.huang','catherine.wu','amy.mu','carol.yeh') and id='" + this.CurrentUser.ID + "'");
        if (!rs2.EOF)
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " plantid = '" + rs2["comid"].ToString().Trim() + "'";
        }

		if (whereis!="")
			whereis = " WHERE" + whereis;
		DataList1.SQL = " SELECT a.id,no, "+
                        " CASE class_no  WHEN '1' THEN '料件新增'  WHEN '2' THEN '料件拋轉'  ELSE  '料件變更' END  class_no_name,class_no, "+
                        " plantid,CONVERT(varchar(12) , add_date, 111 ) add_date,b.name add_name,c.name dcc_name,add_user,dcc,status FROM " + db1 + "CIMI100_MAIN a " +
                        " left join " + db2 + "dguser b on add_user=b.id " +
                        " left join " + db2 + "dguser c on dcc=c.id" + whereis;

	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("cimi100_NewAdd.aspx");
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
		Response.Redirect("cimi100_NewDelete.aspx?"+deletekeys+"&multiple=1");
	}
    protected void BUTTON_add2_Click(object sender, EventArgs e)
    {
        Response.Redirect("cimi100_turnAdd.aspx?class_no=2");
    }
    protected void BUTTON_add3_Click(object sender, EventArgs e)
    {
        Response.Redirect("cimi100_turnAdd.aspx?class_no=3");
    }
}
}
