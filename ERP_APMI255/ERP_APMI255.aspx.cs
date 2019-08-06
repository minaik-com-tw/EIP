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

namespace ERP_APMI255
{
    public partial class ERP_APMI255 : SmoothEnterprise.Web.Page
    {
        private string db = "[EIPB].[dbo]."; //db位置(apmi255皆放在EIPB的資料夾
        string eDt = "", sDt = ""; //add by carol 20181227
        protected void Page_Load(object sender, System.EventArgs e)
        {
            //update by carol 20181227
            if (!IsPostBack)
            {
                sDt = DateTime.Now.Year.ToString() + "/01/01";
                eDt = DateTime.Now.ToShortDateString();

            }
            else
            {
                sDt = QUERY_pmi02.Text;
                eDt = QUERY_pmi02_2.Text;
            }

            QUERY_pmi02.Text = sDt;
            QUERY_pmi02_2.Text = eDt;

            //Page.Title = "ERP_APMI255 List Page";
        }

        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.KeepURL();

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
                        cell.OutputHTML = "<a href=\"ERP_APMI255Edit.aspx?id=" + rs["id"].ToString() + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
                    }
                }

                if (column.ID == "DataList1_view")
                {
                    cell.LinkURL = "ERP_APMI255View.aspx?id=" + rs["id"].ToString();
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
                    //if (rs["status"].ToString() == "ERP")
                    //{
                    //    cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-reject.gif\" border=\"0\">"+"<font color=\"red\">退回ERP修改</font>"  ;
                    //}
                }
            }
            catch (Exception ex)
            {
                this.AddError(this, "DataList1_OnRenderCell()", "", ex.Message);
            }
        }

        protected void BUTTON_query_Click(object sender, System.EventArgs e)
        {
            this.Query();
        }

        private void Query()
        {

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

            if (this.QUERY_pmi01.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " pmi01 LIKE N'%" + this.QUERY_pmi01.Text + "%'";
            }

            /* delete by carol 20191227
            if (this.QUERY_pmi02.Text!= "" && this.QUERY_pmi02_2.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " CONVERT(varchar(12) , pmi02, 111 ) >= '" + this.QUERY_pmi02.Text + "' and CONVERT(varchar(12) , pmi02, 111 ) <= DATEADD(day, 1, '" + this.QUERY_pmi02_2.Text + "')"; //+1是因為要讓日期變成後一天的00點00分

            }
            if (this.QUERY_pmi02.Text != "" && this.QUERY_pmi02_2.Text == "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " CONVERT(varchar(12) , pmi02, 111 ) >= CONVERT(datetime,'" + this.QUERY_pmi02.Text + "') ";


            }*/

            //add by carol 20181227
            if (!string.IsNullOrEmpty(sDt))
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + string.Format(" pmi02>= '{0}'  ",sDt);
            }
            //add by carol 20181227
            if (!string.IsNullOrEmpty(eDt))
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + string.Format(" pmi02<= '{0}'  ", eDt);
            }
            
            if (!string.IsNullOrEmpty(sDt))
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " CONVERT(varchar(12) , pmi02, 111 ) >= '" + this.QUERY_pmi02.Text + "' and CONVERT(varchar(12) , pmi02, 111 ) <= DATEADD(day, 1, '" + this.QUERY_pmi02_2.Text + "')"; //+1是因為要讓日期變成後一天的00點00分
            }
            if (this.QUERY_pmc03_0.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " QUERY_pmc03_0 LIKE N'%" + this.QUERY_pmc03_0.Text + "%'";
            }

            if (this.QUERY_status.Text != "Filter")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " status LIKE N'%" + this.QUERY_status.Text + "%'";
            }

            //
            if (!string.IsNullOrEmpty(this.Query_User.Text))
            {

                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " gen02_1 ='" + Utility.GetUName(this.Query_User.Text) + "'";
            }

            SmoothEnterprise.Database.DataSet plant = new SmoothEnterprise.Database.DataSet();
            object planta = plant.ExecuteScalar("select comid from dguser where logonid='" + this.CurrentUser.LogonID.ToString() + "'  ");
            if (planta.ToString().Trim() != "MAT")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " plantid='" + planta.ToString() + "' ";

            }

            if (whereis != "")
                whereis = " WHERE" + whereis;
            DataList1.SQL = "SELECT id,no,plantid,companyname,pmi01,CONVERT(varchar(12) , pmi02, 111 ) pmi02, pmc03_0,pmi05,gen02_1,ta_pmi01,status from " + db + "apmi255_in_head" + whereis + " order by no desc ";

        }



        protected void BUTTON_delete_Click(object sender, System.EventArgs e)
        {
            string deletekeys = "";
            string chkid = this.DataList1.ID + "_chk_";
            string keyid = this.DataList1.ID + "_key_";
            for (int i = 0; i < Page.Request.Form.Count; i++)
                if (Page.Request.Form.AllKeys.GetValue(i).ToString().StartsWith(chkid))
                {
                    if (deletekeys != "")
                        deletekeys += "&" + Page.Request.Form[keyid + Page.Request.Form.AllKeys.GetValue(i).ToString().Substring(chkid.Length)].ToString();
                    else
                        deletekeys += Page.Request.Form[keyid + Page.Request.Form.AllKeys.GetValue(i).ToString().Substring(chkid.Length)].ToString();
                }
            Response.Redirect("ERP_APMI255Delete.aspx?" + deletekeys + "&multiple=1");
        }
    }
}
