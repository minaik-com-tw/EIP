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

namespace Shipment
{


public partial class Shipment : SmoothEnterprise.Web.Page
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "NPI出貨及送樣流程";
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
            
 	 	 	if(!this.QUERY_No.Personalize && this["QUERY_No"]!=null) this.QUERY_No.Text = this["QUERY_No"];
 	 	 	if(!this.QUERY_Customer.Personalize && this["QUERY_Customer"]!=null) this.QUERY_Customer.Text = this["QUERY_Customer"];
 	 	 	if(!this.QUERY_Add_user.Personalize && this["QUERY_Add_user"]!=null) this.QUERY_Add_user.Text = this["QUERY_Add_user"];
        	this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{   
            

            if (column.ID == "DataList1_edit")
            {
                if ((rs["STATUS"].ToString() == "OK")  || (rs["STATUS"].ToString() == "V"))
                {
                    cell.OutputHTML = "&nbsp;";
                }
                else
                {
                    if ((rs["add_user"].ToString().ToUpper() == this.CurrentUser.ID.ToString().Substring(1, 36) || rs["npiid"].ToString().ToUpper() == this.CurrentUser.ID.ToString().Substring(1, 36)) & rs["status"].ToString() != "V")
                    {
                        cell.OutputHTML = "<a href=\"ShipmentEdit.aspx?id=" + rs["id"].ToString() + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
                    } 
                    else
                    {
                        //代理人可修改使用者單據
                        SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rs2.Open("SELECT b.id bid,b.name name,email FROM "+
                                " dguserdeputy a "+
                                " left join dguser b on a.deputyuid=b.id "+
                                " left join dgflow c on a.sid=c.id   "+
                                " where  a.uid='" + rs["add_user"].ToString().ToUpper() + "'   " +
                                " and   "+
                                " ((a.sid is null and  sdate < GETDATE() and edate is null) or  "+
                                " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate is null) or  "+
                                " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate > GETDATE()) or  " +
                                "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email,b.id");
                        if (!rs2.EOF)
                        {
                            if (rs2["bid"].ToString().ToUpper() == this.CurrentUser.ID.ToString().Substring(1, 36))
                            {
                                cell.OutputHTML = "<a href=\"ShipmentEdit.aspx?id=" + rs["id"].ToString() + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
                           
                            }else{

                                cell.OutputHTML = "&nbsp;";

                            }
                        }
                        else
                        {
                            cell.OutputHTML = "&nbsp;";
                        }
                    }
                }
            }

            if (column.ID == "DataList1_view")
            {
                cell.LinkURL = "ShipmentView.aspx?id=" + rs["id"].ToString();
            }

            if (column.ID == "DataList1_copy")
            {

                cell.OutputHTML = "<a href=\"ShipmentAdd.aspx?id=" + rs["id"].ToString() + "&copya=2\" ><img src=\"/shipment/img/page_copy.png\" border=\"0\"></a>";

            }
            if (column.ID == "DataList1_Other")
            {
                //NPI工程師及助理維護
                if ((rs["STATUS"].ToString() == "OK"))
                {
                    //SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    //rs2.Open("select * from " + db2 + "dgflowlog where requesturl like '%" + rs["id"].ToString() + "' " +
                    //       "and text in ('NPI Engineer','NPI Assistant') and revieweruid='" + this.CurrentUser.ID.ToString() + "'");
                    //if (!rs2.EOF)
                    //{
                        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rss.Open("  SELECT  no,MAX(ver) as ver from  " + db1 + "Shipment_head   where no='" + rs["NO"].ToString() + "' group by  no ");
                        if (rss["ver"].ToString() == rs["ver"].ToString())
                        {
                            cell.OutputHTML = "<a href=\"ShipmentView.aspx?id=" + rs["id"].ToString() + "&other=1\" ><img src=\"/shipment/img/note_edit.png\" border=\"0\"></a>";
                        }
                        else
                        {
                            cell.OutputHTML = "&nbsp;";

                        }
                        
                    //}
                    //else
                    //{
                    //    //if (this.CurrentUser.LogonID.ToString() == "ann.lin")
                    //    //{
                    //    //    cell.OutputHTML = "<a href=\"ShipmentView.aspx?id=" + rs["id"].ToString() + "&other=1\" ><img src=\"/shipment/img/note_edit.png\" border=\"0\"></a>";

                    //    //}
                    //    //else
                    //    //{
                    //    //    cell.OutputHTML = "&nbsp;";
                    //    //}
                    //}
                }
                else
                {
                    cell.OutputHTML = "&nbsp;";

                }

            }
            if (column.ID == "DataList1_Change")
            {

                if ((rs["STATUS"].ToString() == "OK"))  //必須要完成審核, 且ver為最新
                {
                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rss.Open("  SELECT  no,MAX(ver) as ver from  " + db1 + "Shipment_head   where no='" + rs["NO"].ToString() + "' group by  no ");
                    if (!rss.EOF)
                    {
                        if (rss["ver"].ToString() == rs["ver"].ToString())
                        {
                            cell.OutputHTML = "<a href=\"ShipmentAdd.aspx?ID=" + rs["id"].ToString() + "&copya=1\"><img src=\"/shipment/img/page_refresh.png\" border=\"0\"></a>";
                        }
                        else
                        {

                            cell.OutputHTML = "&nbsp;";
                        }
                    }
                }
                else
                {
                    cell.OutputHTML = "&nbsp;";

                }


            }

            if (column.ID == "DataList1_print")
            {
                if ((rs["STATUS"].ToString() != "V"))
                {
                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rss.Open("  SELECT  no,MAX(ver) as ver from  " + db1 + "Shipment_head   where no='" + rs["NO"].ToString() + "' group by  no ");
                    if (!rss.EOF)
                    {
                        if (rss["ver"].ToString() == rs["ver"].ToString())
                        {
                            cell.OutputHTML = "<a href=\"Shipment_print.aspx?id=" + rs["id"].ToString() + "\" ><img src=\"/shipment/img/printer.png\" border=\"0\"></a>";
                        }
                        else
                        {

                            cell.OutputHTML = "&nbsp;";
                        }
                    }
                }
                else
                {
                    cell.OutputHTML = "&nbsp;";

                }
            }

            if (column.ID == "DataList1_Component")
            {
                string paperstring = "";
                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);



                rss.Open(" select Component from " + db1 + "shipment_body where no='" + rs["no"].ToString() + "' and ver='" + rs["ver"].ToString() + "'  group by Component ");
                while (!rss.EOF)
                {
                    paperstring = paperstring + rss["Component"].ToString() + " , ";

                    rss.MoveNext();
                }
                rss.Close();
                if (paperstring.ToString().Length > 0) cell.OutputHTML = paperstring.Substring(0, paperstring.Length - 2); else cell.OutputHTML = "&nbsp;";

               // Response.Write(" select component from " + db1 + "shipment_body where no='" + rs["no"].ToString() + "' and ver='" + rs["ver"].ToString() + "'  group by component ");
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
                //if (rs["status"].ToString() == "ERP")
                //{
                //    cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-reject.gif\" border=\"0\">"+"<font color=\"red\">退回ERP修改</font>"  ;
                //}
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
        
 	 	if(!this.QUERY_No.Personalize) this["QUERY_No"] = this.QUERY_No.Text.Trim() ;

 	 	if(!this.QUERY_Customer.Personalize) this["QUERY_Customer"] = this.QUERY_Customer.Text.Trim();
 	 	if(!this.QUERY_Add_user.Personalize) this["QUERY_Add_user"] = this.QUERY_Add_user.Text.Trim();
		string whereis = "";
		
 	 	if (this.QUERY_No.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " No LIKE N'%" + this.QUERY_No.Text.Trim() + "%'";
 	 	}

 	 	if (this.QUERY_Customer.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " Customer LIKE N'%" + this.QUERY_Customer.Text.Trim() + "%'";
 	 	}
 	 	if (this.QUERY_Add_user.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
            whereis = whereis + " b.name LIKE N'%" + this.QUERY_Add_user.Text.Trim() + "%'";
 	 	}
        if (this.QUERY_Customer_PO.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " C_PO LIKE N'%" + this.QUERY_Customer_PO.Text.Trim() + "%'";
        }
        if (this.QUERY_NPI_Engineer.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + "( b.name LIKE N'%" + this.QUERY_NPI_Engineer.Text.Trim() + "%' or c.name like N'%" + this.QUERY_NPI_Engineer.Text.Trim() + "%')";
        }
        if (this.QUERY_status.Text != "Filter")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " status = N'" + this.QUERY_status.Text.Trim() + "'";
        }
		if (whereis!="")
			whereis = " WHERE" + whereis;
		DataList1.SQL = "SELECT a.id id,no,ver,plant,erp_po,customer,c_po,CONVERT(varchar(12) , add_date, 111 ) add_date, "+
                      "status,b.name username,add_user,ISNULL(c.name,b.name) npiengineer,c.id npiid " +
                      "FROM " + db1 + "Shipment_head a left join " + db2 + "dguser b on a.add_user=b.id  " +
                      "left join (select aid,name,id from " + db1 + "shipment_npiengineer left join " + db2 + "dguser on npi_engineer1=id)  " +
                      "c on a.id=c.aid" + whereis + " order by no desc,add_date";
            
        
	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("ShipmentAdd.aspx?copya=0");
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
		Response.Redirect("ShipmentDelete.aspx?"+deletekeys+"&multiple=1");
	}
}
}
