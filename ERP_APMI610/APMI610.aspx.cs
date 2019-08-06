/* mark     Date Aouther                action     Reason
 * ----------------------------------------------------------
 * V1.0.1  2018/12/19  carol.yeh       add         預設廠別
 */


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
using System.Text;

namespace ERP_APMI610
{
    public partial class APMI610 : SmoothEnterprise.Web.Page
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            //Page.Title = "APMI610 List Page";
            cheRecode("c104532c-6b77-4796-82a3-41c4e40e87b1");

            //Page.Title = "CNE List Page";
            string Plant = "";
            if (!this.IsPostBack)
            {
                //V1.0.1
                if (Request.Url.Query.Contains("Plant"))
                {
                    Plant = Request.QueryString["Plant"];
                }

            }
            else
            {
                //V1.0.12
                Plant = ddl_plant.SelectedValue;
            }
            //V1.0.1
            ddl_plant.SelectedValue = Plant;
        }

        private void cheRecode(string p)
        {

        }

        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.KeepURL();

                if (!this.QUERY_pmcsn.Personalize && this["QUERY_pmcsn"] != null) this.QUERY_pmcsn.Text = this["QUERY_pmcsn"];
                if (!this.QUERY_pmcano.Personalize && this["QUERY_pmcano"] != null) this.QUERY_pmcano.Text = this["QUERY_pmcano"];
                if (!this.QUERY_pmca03.Personalize && this["QUERY_pmca03"] != null) this.QUERY_pmca03.Text = this["QUERY_pmca03"];


                this.Query();
            }
        }

        protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
        {
            try
            {


                if (column.ID == "DataList1_edit")
                {
                    cell.LinkURL = "APMI610Edit.aspx?rowid=" + rs["rowid"].ToString();
                }

                if (column.ID == "DataList1_view")
                {
                    cell.LinkURL = "APMI610View.aspx?rowid=" + rs["rowid"].ToString();
                }

                if (column.ID == "DataColumn3")
                {
                    if (rs["ERPCheck"].ToString() == "Y") cell.OutputHTML = "<font color=\"red\">有</font>";
                    else cell.OutputHTML = "<font color=\"Black\">無</font>";
                }
                if (column.ID == "DataColnmApp")
                {
                    //審者人員

                    StringBuilder sb = new StringBuilder();

                    sb.Append("  SELECT   u.name ");
                    sb.Append(" FROM eipa.[dbo].dgflowqueue f  ");
                    sb.Append(" left join eipa.dbo.dguser u on f.revieweruid=u.id ");
                    sb.Append(" where  revieweruid !='00000000-0000-0000-0000-000000000000' ");
                    sb.AppendFormat(" and requesturl like '%{0}' ", rs["rowid"]);
                    sb.Append(" and  resulttype is null ");

                    cell.OutputHTML = Utility.getSingle(sb.ToString());
                }

                if (column.ID == "TDataColumn1")
                {
                    if (rs["pmca00"].ToString().Substring(0, 1).ToUpper() == "I")
                    {
                        switch (rs["RepReason"].ToString())
                        {
                            case "1":
                                cell.Value = "價格優勢";
                                break;
                            case "2":
                                cell.Value = "交期優勢";
                                break;
                            case "3":
                                cell.Value = "服務優勢";
                                break;
                            case "4":
                                cell.Value = "客戶指定";
                                break;
                            case "5":
                                cell.Value = "唯一供應商";
                                break;
                            case "X":
                                cell.Value = "其他";
                                break;
                        }

                    }
                    else
                    {
                        switch (rs["RepReason"].ToString())
                        {
                            case "1":
                                cell.Value = "銀行資料變更";
                                break;
                            case "2":
                                cell.Value = "付款條件變更";
                                break;
                            case "X":
                                cell.Value = "其他";
                                break;
                        }

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
                    if (rs["status"].ToString() == "C")
                    {
                        cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-agree.gif\" border=\"0\">" + "<font color=\"blue\">完成審核</font>";
                    }
                    if ((rs["status"].ToString() == "T") || (rs["status"].ToString() == "R"))
                    {
                        cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-reject.gif\" border=\"0\">" + "<font color=\"red\">退回</font>";
                    }
                    if (rs["status"].ToString() == "E")
                    {
                        cell.OutputHTML = "<img src=\"/ManagePDF/images/icon-reject.gif\" border=\"0\">" + "<font color=\"red\">退回至ERP</font>";
                    }
                }

                User_Info u = new User_Info();
                u.GetdgUsererPid(rs["pmcauser"].ToString());


                //DataList1_pmcauser
                if (column.ID == "DataList1_pmcauser")
                {

                    cell.Value = u.NAME;
                }

                if (column.ID == "DataList1_pmcagrup")
                {
                    cell.Value = u.DEPT;
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

            if (!this.QUERY_pmcsn.Personalize) this["QUERY_pmcsn"] = this.QUERY_pmcsn.Text;
            if (!this.QUERY_pmcano.Personalize) this["QUERY_pmcano"] = this.QUERY_pmcano.Text;
            if (!this.QUERY_pmca03.Personalize) this["QUERY_pmca03"] = this.QUERY_pmca03.Text;



            string whereis = "";

            if (this.QUERY_pmcsn.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " pmcsn LIKE N'%" + this.QUERY_pmcsn.Text + "%'";
            }
            if (this.QUERY_pmcano.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " pmcano LIKE N'%" + this.QUERY_pmcano.Text + "%'";
            }



            if (this.QUERY_pmca03.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " pmca03 LIKE N'%" + this.QUERY_pmca03.Text + "%'";
            }

            if (TxtIniUser.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " b.name LIKE N'%" + TxtIniUser.Text + "%'";
            }

            if (QUERY_init01.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " pmcaud15>='" + QUERY_init01.Text + "'";

            }

            if (QUERY_init02.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " pmcaud15<='" + QUERY_init02.Text + "'";

            }



            if (QUERY_status.SelectedValue != "Filter")
            {
                if (whereis != "")
                    whereis = whereis + " AND";

                whereis = whereis + " status='" + QUERY_status.SelectedValue + "'";

            }

            //ddl_plant

            if (ddl_plant.SelectedValue != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";

                whereis = whereis + " plantid='" + ddl_plant.SelectedValue + "'";

            }

            if (whereis != "")
                whereis = " WHERE" + whereis;

            //DataList1.SQL = "SELECT a.*,b.name,t.name tnm FROM eipb.dbo.APMI610_IN a left join dguser b  on b.erpid=pmcauser" +
            //    " left join (select  rowid ad,appid  from [EIPB].[dbo].[doulog] x " +
            //     " inner join (  select rowid ad,MAX(appdate) datei  from [EIPB].[dbo].[doulog]   " +
            //     "where appdate is not null group by  rowid ) y    " +
            //     "on x.rowid=y.ad and x.appdate=y.datei )z on a.rowid=z.ad " +
            //      "left join EIPA.dbo.dguser t on z.appid=t.id  " + whereis;


            string sql = "select * from eipb.dbo.APMI610_IN x  " + whereis;




            DataList1.SQL = sql.ToString();
        }

        protected void BUTTON_add_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("APMI610Add.aspx");
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
            Response.Redirect("APMI610Delete.aspx?" + deletekeys + "&multiple=1");
        }
    }
}
