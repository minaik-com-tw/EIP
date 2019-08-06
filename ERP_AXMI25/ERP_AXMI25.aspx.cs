/* mark     Date Aouther                action     Reason
 * ----------------------------------------------------------
 * V1.0.1  2018/09/11  carol.yeh       add         加入廠別選單
 * V1.0.2  2018/12/19  carol.yeh       add         預設廠別
 * V1.0.3  2019/01/01  carol.yeh       add         因君洋帳號不同故加入 eipa.dbo.dgusererpid join eipa.dbo.dguser
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

namespace CNE
{
    public partial class CNE : SmoothEnterprise.Web.Page
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            //Page.Title = "CNE List Page";
            string Plant = "";
            if (!this.IsPostBack)
            {
                initdroplist();
                //this.Query();

                //V1.0.2
                if (Request.Url.Query.Contains("Plant"))
                {
                    Plant = Request.QueryString["Plant"];
                }

            }
            else
            {
                //V1.0.2
                Plant = ddl_plant.SelectedValue;
            }
            //V1.0.2
            ddl_plant.SelectedValue = Plant;
        }

        protected void initdroplist()
        {
            try
            {
                //this.QUERY_dep_name.Items.Add(new ListItem("請選擇", ""));
                //SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                //string command = "SELECT dept_nm DEPT_NAME , dept_no DEPT_NO "+
                //                 " FROM EIPA.DBO.lea_hm1dept10 "+
                //                 "WHERE dept_nm NOT LIKE '*%'";
                //rs.Open(command);
                //while(!rs.EOF){
                //    this.QUERY_dep_name.Items.Add(new ListItem(rs["DEPT_NAME"].ToString(), rs["DEPT_NO"].ToString()));
                //    rs.MoveNext();
                //}
                //rs.Close();

                this.QUERY_occa00.Items.Add(new ListItem("請選擇", ""));
                this.QUERY_occa00.Items.Add(new ListItem("I:新增", "I"));
                this.QUERY_occa00.Items.Add(new ListItem("U:修改", "U"));
                this.QUERY_occa00.Items.Add(new ListItem("V:生效否", "V"));

                //command = "SELECT AZI01 , AZI02 "+
                //          " FROM [IP185].[MINAIK].[dbo].[AZI_FILE]";
                //rs.Open(command);

                //this.QUERY_occa631.Items.Add(new ListItem("請選擇", ""));
                //while (!rs.EOF)
                //{
                //    this.QUERY_occa631.Items.Add(new ListItem(rs["AZI02"].ToString(), rs["AZI01"].ToString()));
                //    rs.MoveNext();
                //}
                SmoothEnterprise.Database.DataSet rs_temp = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs_temp.Open("EXEC  EIPB.DBO.ERP_AXMI25_QUERY_SP ");

                rs_temp.Close();
                rs_temp.Dispose();


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
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

                if (column.ID == "DataList1_chk")
                {
                    string keys = "ROWNO" + cell.Rowno.ToString() + "=" + rs["ROWNO"].ToString();
                    cell.ClientID = "DataList1_chk_" + cell.Rowno.ToString();
                    cell.OutputHTML = "<input type=hidden id=\"DataList1_key_" + cell.Rowno.ToString() + "\" name=\"DataList1_key_" + cell.Rowno.ToString() + "\" value=\"" + keys + "\">";
                }

                if (column.ID == "DataList1_edit")
                {

                    string owner = rs["USERID"].ToString().ToUpper();

                    if (CurrentUser.ID.ToUpper().Contains(owner))
                    {
                        //isStop
                        if (rs["IsState"].ToString().Trim() != "Complete" && rs["IsState"].ToString().Trim() != "isStop")
                        {
                            cell.OutputHTML = "<a href=\"ERP_AXMI25Edit.aspx?ROWNO=" + rs["ROWNO"].ToString() + "\"><img src=\"/ManagePDF/images/Edit.gif\" border=\"0\" Alt=修改></a>";
                        }
                    }

                   if (Utility.MIS_Manager(CurrentUser.LogonID))
                    {
                        cell.OutputHTML = "<a href=\"ERP_AXMI25Edit.aspx?ROWNO=" + rs["ROWNO"].ToString() + "\"><img src=\"/ManagePDF/images/Edit.gif\" border=\"0\" Alt=修改></a>";
                    }


                    //string userid = "{" + rs["USERID"].ToString().ToUpper() + "}";
                    //bool isuser=this.CurrentUser.ID.ToUpper().Contains(userid); 
                    //if (this.CurrentUser.ID.ToUpper().Contains(userid) )
                    //{
                    //    if (rs["IsState"].ToString().Trim() == "waiting" || rs["IsState"].ToString() == "Terminate" || rs["IsState"].ToString().Trim() == "isSend")
                    //        cell.OutputHTML = "<a href=\"ERP_AXMI25Edit.aspx?ROWNO=" + rs["ROWNO"].ToString() + "\"><img src=\"/ManagePDF/images/Edit.gif\" border=\"0\" Alt=修改></a>";
                    //}

                    //if (Utility.MIS_Manager(CurrentUser.LogonID))
                    //{
                    //    if (rs["IsState"].ToString().Trim() == "waiting" || rs["IsState"].ToString() == "Terminate" || rs["IsState"].ToString().Trim() == "isSend")
                    //        cell.OutputHTML = "<a href=\"ERP_AXMI25Edit.aspx?ROWNO=" + rs["ROWNO"].ToString() + "\"><img src=\"/ManagePDF/images/Edit.gif\" border=\"0\" Alt=修改></a>";
                    //}
                    ////    cell.LinkURL = "ERP_AXMI25Edit.aspx?ROWNO=" + rs["ROWNO"].ToString();
                    ////else
                    //    cell.Clear();



                }

                if (column.ID == "DataList1_view")
                {
                    cell.LinkURL = "ERP_AXMI25View.aspx?ROWNO=" + rs["ROWNO"].ToString();
                }

                if (column.ID == "DataList1_IsStatus")
                {
                    if (rs["IsState"].ToString().Trim() == "waiting")
                        cell.OutputHTML = "未送審";

                    if (rs["IsState"].ToString().Trim() == "Complete")
                        cell.OutputHTML = "<font color=blue>審核完成</font><img src=\"/ManagePDF/images/icon-agree.gif\" border=\"0\">";

                    if (rs["IsState"].ToString().Trim() == "Terminate")
                        cell.OutputHTML = "<font color=red>退回</font><img src=\"/ManagePDF/images/icon-reject.gif\" border=\"0\">";

                    if (rs["IsState"].ToString().Trim() == "isSend")
                        cell.OutputHTML = "<font color=green>送審中</font><img src=\"/ManagePDF/images/icon-senddoc.gif\" border=\"0\">";

                    if (rs["IsState"].ToString().Trim() == "isStop")
                        cell.OutputHTML = "<font color=red>退回ERP</font><img src=\"/ManagePDF/images/delete.gif\" border=\"0\" Alt=退回ERP>";
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
            try
            {


                string whereis = "";
                if (this.QUERY_occa00.SelectedValue.Trim() != "")
                    whereis += " AND occa00 LIKE '%" + this.QUERY_occa00.SelectedValue.Trim() + "%'";
                if (this.QUERY_occa01.Text != "")
                    whereis += " AND occa01 LIKE '%" + this.QUERY_occa01.Text.Trim() + "%'";
                if (this.QUERY_occano.Text != "")
                    whereis += " AND occano LIKE '%" + this.QUERY_occano.Text.Trim() + "%'";
                //if (this.QUERY_argv2.SelectedValue.Trim() != "")
                //    whereis += " AND argv2 LIKE '%" + this.QUERY_argv2.SelectedValue.ToString()+ "%'";
                if (this.QUERY_occa02.Text.Trim() != "")
                    whereis += " AND occa02 LIKE '%" + this.QUERY_occa02.Text.Trim() + "%'";

                if ((this.QUERY_occaud15S.Text.Trim() != "") && (this.QUERY_occaud15E.Text.Trim() != ""))
                    whereis += " AND convert(date , occaud15 , 11) BETWEEN convert(date, '" + this.QUERY_occaud15S.Text.Trim() + "',111) AND convert(date, '" + this.QUERY_occaud15E.Text.Trim() + "',111)";

                if (this.QUERY_occauser.Text.Trim() != "")
                    whereis += " AND u.id LIKE '%" + this.QUERY_occauser.Text.Trim() + "%'";
                if (this.QUERY_state.SelectedValue != "")
                    whereis += " AND isState = '" + this.QUERY_state.SelectedValue + "'";

                //V1.0.1 add
                if (this.ddl_plant.SelectedValue != "")
                    whereis += " AND PlantID = '" + this.ddl_plant.SelectedValue + "'";

                //if (this.QUERY_dep_name.SelectedValue.Trim() != "")
                //    whereis += " AND d.dept_no LIKE '%" + this.QUERY_dep_name.SelectedValue.Trim() + "%'";
                //if (this.QUERY_occa45.Text.Trim() != "")
                //    whereis += " AND occa45 LIKE '%" + this.QUERY_occa45.Text.Trim() + "%'";
                //if (this.QUERY_occa631.Text.Trim() != "")
                //    whereis += " AND occa631 LIKE '%" + this.QUERY_occa631.Text.Trim() + "%'";
                //if (this.QUERY_occa63.Text.Trim() != "")
                //    whereis += " AND occa63 LIKE '%" + this.QUERY_occa63.Text.Trim() + "%'";
                //if (whereis!="")
                //    whereis = " WHERE" + whereis;

                //20190104 delete by carol 
                //DataList1.SQL = "SELECT ERP.* , U.id USERID , U.name , D.dept_no , " +
                //            "       D.dept_nm   ,  AZI.AZI02 Currency ," +
                //            "       CASE SUBSTRING(erp.occa00,1,1) WHEN 'I' THEN 'I:新增' WHEN 'U' THEN 'U:修改' WHEN 'V' THEN 'V:生效否' END APPTYPE " +
                //            "  FROM EIPB.DBO.ERP_AXMI25 ERP ,  " +
                //            "       EIPA.DBO.dguser U, " +
                //            "       EIPA.DBO.lea_hm1emp10 UU,  " +
                //            "       EIPA.DBO.lea_hm1dept10 D ," +
                //            "       [IP185].[MINAIK].[dbo].[AZI_FILE] AZI " +
                //            " WHERE 1=1  " +
                //            "   AND ERP.occa631 = AZI.AZI01  COLLATE Chinese_Taiwan_Stroke_CS_AS " +
                //            "   AND ERP.occauser = U.erpid " +
                //            "   AND SUBSTRING(U.erpid,2,5) = UU.emp_no " +
                //            "   AND UU.dept_no = D.dept_no" + whereis +
                //            " ORDER BY updatetime DESC";


                //20190104 update  by carol   add table dgusererpid
                StringBuilder sb = new StringBuilder();

                sb.Append("  select  ERP.* , U.id USERID , U.name , D.dept_no , D.dept_nm , AZI.AZI02 Currency , ");
                sb.Append(" CASE SUBSTRING(erp.occa00,1,1) WHEN 'I' THEN 'I:新增' WHEN 'U' THEN 'U:修改' WHEN 'V' THEN 'V:生效否' END APPTYPE ");
                sb.Append(" from eipb.dbo.erp_axmi25 erp ");
                sb.Append(" left join  [IP185].[MINAIK].[dbo].[AZI_FILE] azi  on erp.occa631 = azi.azi01 collate chinese_taiwan_stroke_cs_as");
                sb.Append(" left join eipa.dbo.dgusererpid e on erp.occauser = e.erpid ");
                sb.Append(" left join eipa.dbo.dguser u  on  e.id=u.id ");
                sb.Append(" left join eipa.dbo.lea_hm1emp10 uu on substring(u.erpid,2,5) = uu.emp_no");
                sb.Append(" left join eipa.dbo.lea_hm1dept10 d on uu.dept_no = d.dept_no  ");
                sb.AppendFormat(" where 1=1 {0}  order by updatetime desc ", whereis);


                DataList1.SQL = sb.ToString();


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        protected void BUTTON_add_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("ERP_AXMI25Add.aspx");
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
            Response.Redirect("ERP_AXMI25Delete.aspx?" + deletekeys + "&multiple=1");
        }
    }
}
