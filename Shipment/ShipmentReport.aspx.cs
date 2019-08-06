

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
    public partial class ShipmentReport : SmoothEnterprise.Web.Page
    {
        public string mail = "";  //是否為定時寄送
        private string db1 = ""; //db主位置 
        private string db2 = ""; //db副位置

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
            {
                db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 

            }
            //Page.Title = "NPI出貨及送樣流程";
            if (Request.QueryString["mail"] == "1")
            {
                mail = "1";

                this.QUERY_c_demand2a.Text = DateTime.Now.ToString();
                this.QUERY_c_demand2b.Text = DateTime.Now.ToString();
                this.Query();
            }

            //Response.Write("select a.id id, a.No no, a.Ver ver,Plant,item, ERP_PO, Customer, C_PO, Purpose, "+
            //"loc, name,CONVERT(char, Add_date, 111) Add_date, case Status when 'N' then '未送審' when 'Y' then '送審中'  "+
            //"when 'OK' then '完成審核' else '退回' end flow_status, Component, DWG, Partno, Material, LCaption shipment_type, LV, HV, Qty, "+
            //"CONVERT(char, C_demand, 111) C_demand, CONVERT(char, C_demand2, 111) C_demand2, CONVERT(char, ETD, 111) ETD, "+
            //"Potential_P, Paper, Packing, B_no, Shipment_status, " + "<br><br>" +
            //"case when CONVERT(char, getdate(), 111)=CONVERT(char, C_demand, 111) then 'On-time' when CONVERT(char,  C_demand2, 111)> CONVERT(char,  C_demand, 111) then 'Delay' else 'In-Progress' end systemstatus " + "<br><br>" +
            //", DATEDIFF (day,CONVERT(datetime,etd),CONVERT(datetime,getdate())) delay,npiname    from shipment_head a left join Shipment_body b on a.id=b.aid    left join dguser c on a.add_user=c.id left join NPI_Base_file d on b.Shipment_type=d.lid    left join (SELECT aid,name npiname FROM Shipment_NPIEngineer left join dguser on npi_engineer1=id) e on a.id=e.aid ");

            //Response.Write("<br>aaa");

        }

        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.KeepURL();

                if (!this.QUERY_No.Personalize && this["QUERY_No"] != null) this.QUERY_No.Text = this["QUERY_No"];
                if (!this.QUERY_Partno.Personalize && this["QUERY_Customer"] != null) this.QUERY_Partno.Text = this["QUERY_Customer"];
                if (!this.QUERY_Add_user.Personalize && this["QUERY_Add_user"] != null) this.QUERY_Add_user.Text = this["QUERY_Add_user"];
                this.Query();
            }
        }

        protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
        {
            try
            {
                if (column.ID == "DataColumn21")
                {
                    string paperstring = "";
                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);



                    rss.Open(" SELECT lcaption paper from " + db1 + "Shipment_paper left join " + db1 + "NPI_Base_file on shipment_paper_id=lid " +
                            " where aid='" + rs["id"].ToString() + "' and item='" + rs["item"].ToString() + "' and tid='P' and lacti='Y' ");
                    while (!rss.EOF)
                    {
                        paperstring = paperstring + rss["paper"].ToString() + " , ";

                        rss.MoveNext();
                    }
                    rss.Close();
                    if (paperstring.ToString().Length > 0) cell.OutputHTML = paperstring.Substring(0, paperstring.Length - 2); else cell.OutputHTML = "&nbsp;";

                }
                if (column.ID == "DataColumn22")
                {
                    string packingstring = "";
                    packingstring = rs["packing"].ToString().Replace("NW/GW:", "<BR>NW/GW:");
                    packingstring = packingstring.Replace("CARTON QTY:", "<BR>CARTON QTY:");
                    packingstring = packingstring.Replace("VIA:", "<BR>VIA:");
                    packingstring = packingstring.Replace("Attn to:", "<BR>Attn to:");

                    cell.OutputHTML = packingstring;
                    cell.Value = "";
                }

                if (column.ID == "DataColumn27")
                {
                    if (rs["npiname"].ToString() == "")
                    {
                        cell.Value = rs["cname"].ToString();
                    }

                }
                if (column.ID == "Lab_NO")
                {
                    string html = "NA";
                    if (!string.IsNullOrEmpty(rs["lab_no"].ToString()))
                    {
                        SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rsb.Open("select rowid,SamDescription from EIPA.dbo.Experiment_head_file  WHERE no='" + rs["lab_no"].ToString() + "' ");
                        int i = 1;
                     
                        while (!rsb.EOF)
                        {
                            string s = rsb["SamDescription"].ToString();
                            string x = rsb["SamDescription"].ToString();
                            if (s.Length > 10)
                            {
                                x = s.Substring(0, 10) + "...";
                            }
                            html += "<p>" + i.ToString() + ".<a href=\"http://eip.minaik.com.tw/experiment/StaExperimentShow.aspx?rowid=" + rsb["rowid"].ToString() + "  \" target= '_BLANK'>" + rs["lab_no"].ToString() + "</a></p> ";
                            i++;
                            rsb.MoveNext();
                        }
                    }
                    cell.OutputHTML = html;

                }

                if (column.ID == "DataColumn32")
                {
                    string testno = rs["EngineeringTest_no"].ToString();
                    cell.OutputHTML = "<a href=\"http://eip.minaik.com.tw/EngineeringTest/EngineeringTestView.aspx?id=" + rs["gid"].ToString() + "  \" target= '_BLANK'>" + testno + "</a>";
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

            if (!this.QUERY_No.Personalize) this["QUERY_No"] = this.QUERY_No.Text;

            if (!this.QUERY_Partno.Personalize) this["QUERY_Customer"] = this.QUERY_Partno.Text;
            if (!this.QUERY_Add_user.Personalize) this["QUERY_Add_user"] = this.QUERY_Add_user.Text;
            string whereis = "";

            if (this.QUERY_No.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " a.No LIKE N'%" + this.QUERY_No.Text + "%'";
            }

            if (this.QUERY_Partno.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " Partno LIKE N'%" + this.QUERY_Partno.Text + "%'";
            }
            if (this.QUERY_Add_user.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " c.name LIKE N'%" + this.QUERY_Add_user.Text + "%'";
            }

            if (this.QUERY_customer_po.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " a.c_po LIKE N'%" + this.QUERY_customer_po.Text + "%'";
            }

            if (this.QUERY_NPI_Engineer.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " c.name LIKE N'%" + this.QUERY_NPI_Engineer.Text + "%' or e.npiname LIKE N'%" + this.QUERY_NPI_Engineer.Text + "%'";
            }


            if (this.QUERY_status.Text != "Filter")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " a.status LIKE N'%" + this.QUERY_status.Text + "%'";
            }

            if (this.QUERY_c_demand2a.Text != "" && this.QUERY_c_demand2b.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " C_demand2 >= CONVERT(datetime,'" + this.QUERY_c_demand2a.Text + "') and C_demand2 <= CONVERT(datetime,'" + this.QUERY_c_demand2b.Text + "')";

            }
            if (this.QUERY_c_demand2a.Text != "" && this.QUERY_c_demand2b.Text == "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " C_demand2 >= CONVERT(datetime,'" + this.QUERY_c_demand2a.Text + "') ";


            }
            if (this.QUERY_c_demand2a.Text == "" && this.QUERY_c_demand2a.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " C_demand2 <= CONVERT(datetime,'" + this.QUERY_c_demand2b.Text + "') ";

            }
            if (whereis != "")
            {
                whereis = " WHERE a.status <> 'V' and  " + whereis;
            }
            else
            {
                whereis = " WHERE a.status <> 'V' ";
            }

            DataList1.SQL = "select a.id id, a.No no, a.Ver ver,Plant,item, ERP_PO, Customer, C_PO,  loc, " +
                         "name,CONVERT(char, a.Add_date, 111) Add_date,  " +
                         "case a.Status when 'N' then '未送審' when 'Y' then '送審中' when 'OK' then '完成審核' when 'V' then '作廢' else '退回' end flow_status,  " +
                         "Component, DWG, Partno, Material, LCaption shipment_type, LV, HV, Qty, CONVERT(char, C_demand, 111) C_demand,  " +
                         "CONVERT(char, C_demand2, 111) C_demand2, CONVERT(char, ETD, 111) ETD, Potential_P, '' Paper, Packing, B_no,  " +
                         "Shipment_status,  " +
                         "case when CONVERT(char, etd, 111)=CONVERT(char, C_demand, 111) " +
                         "then 'On-time'  " +
                         "when CONVERT(char, C_demand2, 111)> CONVERT(char, C_demand, 111)  then 'Delay'  " +
                         "when CONVERT(char, getdate(), 111)< CONVERT(char, C_demand, 111)  then 'In-Progress' " +
                         "else '' end systemstatus  ,  " +
                         "DATEDIFF (day,CONVERT(datetime,etd),CONVERT(datetime,c_demand)) delay,npiname,lab_no,engineeringtest_no,g.id gid,c.name cname,purpose2,shipmentfile " +
                         "from ( SELECT a.* FROM " + db1 + "shipment_head a ,( SELECT  no,MAX(ver) as ver from " + db1 + "Shipment_head  group by  no  ) b " +
                         " WHERE a.no= b.no and a.ver=b.ver)  a  " +
                         "left join " + db1 + "Shipment_body b on a.id=b.aid  " +
                         "left join " + db2 + "dguser c on a.add_user=c.id  " +
                         "left join " + db1 + "NPI_Base_file d on b.Shipment_type=d.lid  " +
                         "left join (SELECT aid,name npiname FROM " + db1 + "Shipment_NPIEngineer left join " + db2 + "dguser on npi_engineer1=id) e on a.id=e.aid  " +
                         " left join (select NO from EIPA.dbo.Experiment_head_file where no <>''  and papstatus <> 'V' GROUP BY NO ) f on lab_no=f.no  " +
                         "left join " + db2 + "engineeringtest_head g on engineeringtest_no=g.no " +
                         " left join (select distinct 'Y' shipmentfile,filekey  from eipb.dbo.shipment_file a left join eipb.dbo.shipment_head b on b.id=a.filekey) h on a.id=h.filekey" + whereis;

            if (this.CurrentUser.LogonID.ToString() == "herzog.lin")
            {
                Response.Write(DataList1.SQL.ToString());
            }
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
            Response.Redirect("ShipmentDelete.aspx?" + deletekeys + "&multiple=1");
        }
    }
}
