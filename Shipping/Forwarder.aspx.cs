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
using System.Net.Mail;

namespace Shipping
{
public partial class Forwarder : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "Forwarder List Page";
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{


        //if (!this.IsPostBack)
        //{


        //    this.KeepURL();G
        //    this.Query();
        //}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{
            if (column.ID == "DataList1_chk")
            {
                string keys = "ID" + cell.Rowno.ToString() + "=" + rs["ID"].ToString();
                cell.ClientID = "DataList1_chk_" + cell.Rowno.ToString();
                cell.OutputHTML = "<input type=hidden id=\"DataList1_key_" + cell.Rowno.ToString() + "\" name=\"DataList1_key_" + cell.Rowno.ToString() + "\" value=\"" + keys + "\">";
            }

            if (column.ID == "DataList1_edit")
            {
                if (rs["IsStatus"].ToString().Trim() == "Complete")
                {
                    cell.OutputHTML = "<img src=\"/ManagePDF/images/Lock.jpg\" border=\"0\">";
                }
                else
                {
                    cell.OutputHTML = "<a href=\"ForwarderEdit.aspx?ID=" + rs["ID"].ToString() + "\"><img src=\"/ManagePDF/images/Edit.gif\" border=\"0\" Alt=修改></a>";
                }
             }




             if (column.ID == "DataList1_edit2")
             {
                 if (rs["IsStatus"].ToString().Trim() == "Complete")
                 {
                     cell.OutputHTML = "<img src=\"/ManagePDF/images/Lock.jpg\" border=\"0\">";
                 }
                 else
                 {
                     cell.OutputHTML = "<a href=\"ForwarderEdit.aspx?ID=" + rs["ID"].ToString() + "\"><img src=\"/Shipping/images/Edit.gif\" border=\"0\" Alt=修改></a>";
                 }

             }


             if (column.ID == "DataList1_Send" || column.ID == "DataList1_Send2")
             {
                 cell.OutputHTML = "<a href=\"SendXml.aspx?ID=" + rs["ID"].ToString() + "\"   Onclick=\"return confirm('出貨單號：" + rs["ERP_Key"].ToString() + " \\n確定重新上傳給 Forwarder 嗎?');\" ><img src=\"/Shipping/images/Up.gif\" border=\"0\" Alt=重新上傳></a>";
             }





            
             if (column.ID == "DataList1_Xml")
             {
                 cell.OutputHTML = "<img src=\"/Shipping/images/Xml.png\" border=\"0\" Alt=\"接收狀況\"  width=\"20\"  style=\"cursor:hand\"  Onclick=\"window.showModalDialog('ShowTime.aspx?INV=" + rs["INV_Num"].ToString() + "',self,'scrollbars=yes,width=800,height=200,top=150,left=450');\">";
             }
            


            if (column.ID == "DataList1_view")
            {
                cell.LinkURL = "ForwarderView.aspx?ID=" + rs["ID"].ToString();
            }


            if (column.ID == "DataColumn_IsStatus")
            {
                if (rs["IsStatus"].ToString().Trim() == "waiting")
                    cell.OutputHTML = "未送審";

                if (rs["IsStatus"].ToString().Trim() == "Complete")
                    cell.OutputHTML = "<font color=blue>完成審核</font><img src=\"/Shipping/images/icon-agree.gif\" border=\"0\">";

                if (rs["IsStatus"].ToString().Trim() == "Terminate")
                    cell.OutputHTML = "<font color=red>完成審核</font><img src=\"/Shipping/images/icon-reject.gif\" border=\"0\">";

                if (rs["IsStatus"].ToString().Trim() == "isSend")
                    cell.OutputHTML = "<font color=green>送審中</font><img src=\"/Shipping/images/icon-senddoc.gif\" border=\"0\">";

                if (rs["IsStatus"].ToString().Trim() == "isStop")
                    cell.OutputHTML = "作廢<img src=\"/Shipping/images/delete.gif\" border=\"0\" Alt=作廢>";
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
        string whereis = "";

        DBTransfer fg = new DBTransfer();
        string fac=fg.GetTopfile("select  comid from  dguser where id='"+this.CurrentUser.ID+"'");
       // Response.Write(fac.Trim() + "--");
        
        if (fac.Trim() == "MAT") whereis = "   PlantID='MINAIK' ";
        else whereis = "   PlantID='MAP' ";

		

        string FacType = this.TextBox1.Text;
        string ERPNum1 = this.TextBox2.Text;
        string ERPNum2 = this.TextBox3.Text;
        string PriceM = this.TextBox4.Text;
        string FacCode = this.TextBox5.Text;
        string HavNum = this.TextBox6.Text;
        string SETD = this.InputText0.Text;
        string SATD = this.InputText1.Text;
        string SETA = this.InputText2.Text;
        string SATAAS = this.InputText3.Text;
        string SATAC = this.InputText4.Text;

        string INVNum = this.TextBox7.Text;

        //if (!String.IsNullOrEmpty(FacType))
        //{
        //    whereis = "";
        //    whereis = whereis + " AND  PlantID like '%" + FacType + "%'";
        //}



        if (DropDownList1.SelectedValue != "" && DropDownList1.SelectedValue != "X")
        {
           if (whereis != "") whereis = whereis + " and    IsStatus = '" + DropDownList1.SelectedValue + "'";
            else whereis = whereis + "   IsStatus = '" + DropDownList1.SelectedValue + "'";
        }




        if (!String.IsNullOrEmpty(ERPNum1))
        {
            if (whereis != "") whereis = whereis + " and  ERP_Key like '%" + ERPNum1 + "%'";
            else    whereis =   "   ERP_Key like '%" + ERPNum1 + "%'";
        }

        if (!String.IsNullOrEmpty(ERPNum2))
        {
            if (whereis != "") whereis = whereis + "  and  ERP_Key2 like '%" + ERPNum2 + "%'";
            else whereis = "   ERP_Key2 like '%" + ERPNum2 + "%'";
        }

        if (!String.IsNullOrEmpty(PriceM))
        {
            if (whereis != "") whereis = whereis + "  and  SHIPPING_No like '%" + PriceM + "%'";
            else whereis =   "   SHIPPING_No like '%" + PriceM + "%'";
        }

        if (!String.IsNullOrEmpty(FacCode))
        {
            if (whereis != "") whereis = whereis + " and  (FORWARDER_Num like '%" + FacCode + "%'   or  FORWARDER_Dec  like '%" + FacCode + "%' )"; 
            else whereis = "   (FORWARDER_Num like '%" + FacCode + "%'   or  FORWARDER_Dec  like '%" + FacCode + "%' )";
        }

        if (!String.IsNullOrEmpty(HavNum))
        {
            if (whereis != "") whereis = whereis + " and  HawbNo like '%" + HavNum + "%'";
            else whereis = "  HawbNo like '%" + HavNum + "%'";
       
            
            
        }

        /*if (!String.IsNullOrEmpty(SETD))
        {
            whereis = whereis + "   ETD >= '" + SETD + "'";
        }

        if (!String.IsNullOrEmpty(SATD))
        {
            whereis = whereis + "   ATD >= '" + SATD + "'";
        }

        if (!String.IsNullOrEmpty(SETA))
        {
            whereis = whereis + "   ETA >= '" + SETA + "'";
        }

        if (!String.IsNullOrEmpty(SATAAS))
        {
            whereis = whereis + "   ATAAS >= '" + SATAAS + "'";
        }

        if (!String.IsNullOrEmpty(SATAC))
        {
            whereis = whereis + "   ATAC >= '" + SATAC + "'";
        }
        */
        if (!String.IsNullOrEmpty(INVNum))
        {
            if (whereis != "") whereis = whereis + " and INV_Num like '%" + INVNum + "%'";
            else  whereis = "   INV_Num like '%" + INVNum + "%'";
        }


        if (whereis != "")  whereis="where " + whereis;

        DataList1.SQL = "SELECT top 500 * FROM eipa.dbo.Forwarder  " + whereis + "   order by cdate   desc ";

        Response.Write(DataList1.SQL);
	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("ForwarderAdd.aspx");
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
		Response.Redirect("ForwarderDelete.aspx?"+deletekeys+"&multiple=1");
	}
    protected void Search_Click(object sender, EventArgs e)
    {
        this.Query();
    }
}
}
