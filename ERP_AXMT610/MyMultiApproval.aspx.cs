using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net;
using System.IO;
using System.Text;

namespace Smooth8000.HR
{

    public partial class MyMultiApproval : SmoothEnterprise.Web.Page, SmoothEnterprise.Portal.UI.WebPart.IReminder
    {
        //protected void PreRender(object sender, System.EventArgs e)
        //{
        //    Response.Write("<script language='JavaScript'>window.alert('請輸入信用額度超限原因及改善方案！');</script>");

        //}
        public class Global 
        { 
            public static int iVars = 0; 
        } 
        protected void Page_Load(object sender, System.EventArgs e)
        {
            Global.iVars = 0;

            if (this.Request.QueryString["QUERY_status"] == null || this.Request.QueryString["QUERY_status"] == "")
                QUERY_status.Value = "N";
            else
                QUERY_status.Value = this.Request.QueryString["QUERY_status"];

            int colidx = -1;
            for (int i = 0; i < this.DataList1.Columns.Count; i++)
            {
                if (this.DataList1.Columns[i].ID == "DataList1_multiapproval")
                    colidx = i;
            }

            this.DataList1.Columns[colidx].Caption = "<table><tr><td><input type=\"checkbox\" onclick=\"chkallmultiapproval();\" /></td><td style=\"font-family:'Arial';font-size:12px;color:#ffffff;\"> <b>" + this.DataList1.Columns[colidx].Caption + "</b></td></tr></table>";
            string js =
                "<script>" + Environment.NewLine +
                "   function chkallmultiapproval(){" + Environment.NewLine +
                "       var chk = document.getElementsByName(\"chk_multiapproval\");" + Environment.NewLine +
                "       for(i=0;i<chk.length;i++)" + Environment.NewLine +
                "           chk[i].checked=event.srcElement.checked ;" + Environment.NewLine +
                "   }" + Environment.NewLine +
                "</script>" + Environment.NewLine;
            RegisterClientScriptBlock("chkallmultiapproval", js);

           
        }

        protected void Page_PreRender(object sender, System.EventArgs e)
        {

            if (!this.IsPostBack)
            {
                this.KeepURL();

                if (!this.QUERY_ERP_NO.Personalize && this["QUERY_ERP_NO"] != null) this.QUERY_ERP_NO.Text = this["QUERY_ERP_NO"];
                if (!this.QUERY_PLANTID.Personalize && this["QUERY_PLANTID"] != null) this.QUERY_PLANTID.Text = this["QUERY_PLANTID"];
                if (!this.QUERY_SDATE.Personalize && this["QUERY_SDATE"] != null) this.QUERY_SDATE.Text = this["QUERY_SDATE"];
                if (!this.QUERY_SDATE2.Personalize && this["QUERY_SDATE2"] != null) this.QUERY_SDATE2.Text = this["QUERY_SDATE2"];

                if (Request.QueryString["QUERY_SDATE2"] != "")
                {
                    if (this.CurrentUser.LogonID.ToString() == "pearl.hsieh" || this.CurrentUser.LogonID.ToString() == "miranda.chen" || this.CurrentUser.LogonID.ToString() == "frances.lee")
                    //this.QUERY_SDATE.Text = DateTime.Parse(DateTime.Now.ToString("yyyy-01-01")).ToShortDateString();
                    {
                        this.QUERY_SDATE2.Text = DateTime.Parse(DateTime.Now.AddDays(3).ToString()).ToShortDateString();
                    }
                }

                this.Query();
            }
        }

        protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
        {
            
            try
            {
                if (column.ID == "DataList1_approval")
                {
                    cell.LinkURL = rs["reviewerurl"].ToString() + rs["requesturl"].ToString().Substring(rs["requesturl"].ToString().IndexOf("?"));
                }
                if (column.ID == "DataList1_view")
                {
                    cell.LinkURL = "MyApprovalView.aspx?id=" + rs["id"].ToString();
                }
                
                if (column.ID == "DataList1_popupflowview")
                {
                    System.Web.UI.WebControls.Image ib = (System.Web.UI.WebControls.Image)this.DataList1.Columns.GetItem("DataList1_popupflowview").GetControl("IB_popupflowview");
                    ib.Attributes.Add("onclick", GetOnclickScript(ResolveUrl("~/"), rs["RequestUrl"].ToString()));
                    ib.Style.Add("cursor", "hand");
                }
                if (column.ID == "DataColumn8")
                {
                    cell.Value = rs["Reason_user"].ToString();
                }
                if (column.ID == "DataColumn9")
                {
                    cell.Value = rs["Improve_user"].ToString();
                }
                if (column.ID == "DataColumn10")
                {
                    cell.Value = rs["Reason_salse"].ToString();
                }
                if (column.ID == "DataColumn11")
                {
                    cell.Value = rs["Improve_salse"].ToString();
                }
                if (column.ID == "DataList1_pro")
                {


                        //cell.OutputHTML = "<a href=AttachDownload.aspx?hid=" + rs["requesturl"].ToString() + "\"><img src=\"/Lib/Img/icon-image.gif\" border=\"0\"></a>";
                    //cell.OutputHTML = "<a target=\"_blank\" href=http://eip.minaik.com.tw/ERP_AXMT610/FileDownload.aspx?atnu=1&hid=" + rs["requesturl"].ToString().Substring(rs["requesturl"].ToString().IndexOf("=") + 1, 36) + "\"> aa </a>" + "<a target=\"_blank\" href=http://eip.minaik.com.tw/ERP_AXMT610/FileDownload.aspx?atnu=1&hid=" + rs["requesturl"].ToString().Substring(rs["requesturl"].ToString().IndexOf("=") + 1, 36) + "\"> aa </a>";
                    string output="";
                    SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs2.Open("SELECT id,FileName FROM axmt610_File WHERE FileKey='" + rs["eid"].ToString() + "'");
                    while (!rs2.EOF)
                    {
                        output = output + "<a target=\"_blank\" href=http://eip.minaik.com.tw/ERP_AXMT610/FileDownload.aspx?id=" + rs2["id"].ToString() + "\"> " + rs2["FileName"].ToString() + " </a>" + "<br><br>";
                        rs2.MoveNext();

 
                    }
                   rs2.Close();
                   if (output.ToString().Length==0)
                   {
                       output = "---";
                   }
                    
                    cell.OutputHTML = output.ToString();

                }

                if (column.ID == "DataList1_multiapproval")
                {
                    bool EndbledMultiApproval = false;
                    string[] ResultTypes = new string[0];
                    string classname = "";
                    try
                    {
                        classname = SmoothEnterprise.Web.Page.InheritsClass(rs["reviewerurl"].ToString());
                        System.Type FlowViewType = SmoothEnterprise.Utility.Type.GetType(classname);
                        Object obj = FlowViewType.InvokeMember(null,System.Reflection.BindingFlags.CreateInstance, null, null, null);
                        ResultTypes = (string[])FlowViewType.InvokeMember("MultiApproval_ResultTypes", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.Default | System.Reflection.BindingFlags.GetProperty, null, obj, null);
                        EndbledMultiApproval = (ResultTypes.Length > 0);
                    }
                    catch
                    {
                        EndbledMultiApproval = false;
                    }

                    if (rs["reviewdate"] == DBNull.Value && EndbledMultiApproval)
                    {
                            if (Global.iVars.ToString()=="0")
                            {
                                cell.OutputHTML =
                                    "<div id='div_" + rs["reviewerurl"].ToString() + rs["requesturl"].ToString().Substring(rs["requesturl"].ToString().IndexOf("?")) + "' style=\"white-space:nowrap\">" + Environment.NewLine +
                                    "   <table>" + Environment.NewLine +
                                    "       <tr>" + Environment.NewLine +
                                    "           <td width=\"1px\">" + Environment.NewLine +
                                    "               <input type='checkbox' id='chk_multiapproval' name='chk_multiapproval' checked  = 'true'  value='" + rs["id"].ToString() + "'>" + Environment.NewLine +
                                    "           </td>" + Environment.NewLine +
                                    "           <td>" + Environment.NewLine +
                                    "               <select id='resulttype_" + rs["id"].ToString() + "' name='resulttype_" + rs["id"].ToString() + "' style=\"font-size:11px;\">" + Environment.NewLine;

                                for (int i = 0; i < ResultTypes.Length; i++)
                                {
                                    switch (ResultTypes[i])
                                    {
                                        case "Next":
                                            cell.OutputHTML += "                <option value=\"" + SmoothEnterprise.Flowwork.Control.ReviewResultType.Next.ToString() + "\">允許</option>" + Environment.NewLine;
                                            break;
                                        case "Back":
                                            cell.OutputHTML += "                <option value=\"" + SmoothEnterprise.Flowwork.Control.ReviewResultType.Back.ToString() + "\">退回上一關</option>" + Environment.NewLine;
                                            break;
                                        case "Complete":
                                            cell.OutputHTML += "                <option value=\"" + SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete.ToString() + "\">完成</option>" + Environment.NewLine;
                                            break;
                                        case "None":
                                            cell.OutputHTML += "                <option value=\"" + SmoothEnterprise.Flowwork.Control.ReviewResultType.None.ToString() + "\">沒意見</option>" + Environment.NewLine;
                                            break;
                                        case "Return":
                                            cell.OutputHTML += "                <option value=\"" + SmoothEnterprise.Flowwork.Control.ReviewResultType.Return.ToString() + "\">退回重送</option>" + Environment.NewLine;
                                            break;
                                        case "Terminate":
                                            cell.OutputHTML += "                <option value=\"" + SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate.ToString() + "\">退回提案人</option>" + Environment.NewLine;
                                            break;
                                    }
                                }

                                cell.OutputHTML +=
                                    "               </select>" + Environment.NewLine +
                                    "               <input type='hidden' id='url_" + rs["id"].ToString() + "' name='url_" + rs["id"].ToString() + "' value='" + rs["reviewerurl"].ToString() + rs["requesturl"].ToString().Substring(rs["requesturl"].ToString().IndexOf("?")) + "'>" + Environment.NewLine +
                                    "           </td>" + Environment.NewLine +
                                    "       </tr>" + Environment.NewLine +
                                    "   </table>" + Environment.NewLine +
                                    "</div>" + Environment.NewLine;
                            }
                            else
                                cell.OutputHTML = "<div id='div_" + rs["reviewerurl"].ToString() + rs["requesturl"].ToString().Substring(rs["requesturl"].ToString().IndexOf("?")) + "'> 審核中... </div>";
                    }
                    else
                    {
                        cell.CellStyle += "\" align=\"center\"><none a=\"a";
                        cell.OutputHTML = "--";
                    }
                }
            }
            catch (Exception ex)
            {
                this.AddError(this, "", "", ex.Message);
            }
        }

        protected void BUTTON_approval_Click(object sender, EventArgs e)
        {
            if (Request.Form["chk_multiapproval"] != null && Request.Form["chk_multiapproval"] != "")
            {
                this.BUTTON_approval.Enabled = false;
                string[] chks = Request.Form["chk_multiapproval"].Split(',');

                for (int i = 0; i < chks.Length; i++)
                    RunAjaxName("runflow" + i.ToString(), Request.Form["url_" + chks[i]], "RESULTTYPE=" + Request.Form["resulttype_" + chks[i]], "document.getElementById(\"div_" + Request.Form["url_" + chks[i]] + "\").innerHTML", true);

                this.MultiApprovel_Count.Value = chks.Length.ToString();
                string js =
                    "<script language=\"javascript\">" + Environment.NewLine +
                    "function FlowAutoReview()" + Environment.NewLine +
                    "   {" + Environment.NewLine +
                    "       document.getElementById(\"" + this.MultiApprovel_Count.ClientID + "\").value = document.getElementById(\"" + this.MultiApprovel_Count.ClientID + "\").value -1 ;" + Environment.NewLine +
                    "       if(document.getElementById(\"" + this.MultiApprovel_Count.ClientID + "\").value<=0)" + Environment.NewLine +
                    "       {" + Environment.NewLine +
                    "          var obj=document.getElementById(\"waitview\");" + Environment.NewLine +
                    "          if (obj!=null)" + Environment.NewLine +
                    "          {" + Environment.NewLine +
                    "              obj.style.cursor=\"default\";" + Environment.NewLine +
                    "              obj.style.display=\"none\";" + Environment.NewLine +
                    "           }" + Environment.NewLine +
                    "           location.replace(\"" + Request.Url.ToString() + "\");" + Environment.NewLine +
                    "       }" + Environment.NewLine +
                    "   }" + Environment.NewLine +
                    "</script>" + Environment.NewLine +
                    "<DIV id=\"waitview\" name=\"waitview\" style=\"BACKGROUND-POSITION: 50% 80px; Z-INDEX: 5; FILTER: alpha(opacity=20); LEFT: 0%; BACKGROUND-IMAGE: url(Img/indicator_circle_thickbox.gif); CURSOR: wait; BACKGROUND-REPEAT: no-repeat; POSITION: absolute; TOP: 0; BACKGROUND-COLOR: black ; width:100% ; height:100%;\"></DIV>" + Environment.NewLine;

                this.RegisterClientScriptBlock("FlowAutoReview", js);

                Global.iVars = 1;
            }
            else
            {

                Response.Write("<script language='JavaScript'>window.alert('請點選項目！');</script>");

            }
        }

        protected string RunAjaxName(string reqname, string url, string sendquerystring, string responseclientname, bool autorun)
        {
            string retname = reqname + "_RunAjax()";
            string ajaxjs =
                "<script language=\"javascript\">" + Environment.NewLine +
                "    // Use XMLHttpreq Type" + Environment.NewLine +
                "    var " + reqname + " = false;" + Environment.NewLine +
                "    try" + Environment.NewLine +
                "    {" + Environment.NewLine +
                "        " + reqname + " = new XMLHttpreq();" + Environment.NewLine +
                "    }" + Environment.NewLine +
                "    catch (trymicrosoft)" + Environment.NewLine +
                "    {" + Environment.NewLine +
                "        try" + Environment.NewLine +
                "        {" + Environment.NewLine +
                "            " + reqname + " = new ActiveXObject(\"Msxml2.XMLHTTP\");" + Environment.NewLine +
                "        }" + Environment.NewLine +
                "        catch (othermicrosoft)" + Environment.NewLine +
                "        {" + Environment.NewLine +
                "            try" + Environment.NewLine +
                "            {" + Environment.NewLine +
                "                " + reqname + " = new ActiveXObject(\"Microsoft.XMLHTTP\");" + Environment.NewLine +
                "            }" + Environment.NewLine +
                "            catch (failed)" + Environment.NewLine +
                "            {" + Environment.NewLine +
                "                " + reqname + " = false;" + Environment.NewLine +
                "            }" + Environment.NewLine +
                "        }" + Environment.NewLine +
                "    }" + Environment.NewLine +
                "    if (!" + reqname + ") alert(\"Error initializing XMLHttpreq!\");" + Environment.NewLine +

                "    // Call Run Ajax" + Environment.NewLine +
                "    function " + reqname + "_RunAjax()" + Environment.NewLine +
                "    {" + Environment.NewLine +
                "        " + reqname + ".open(\"POST\",\"" + url + "\", true);" + Environment.NewLine +
                "        " + reqname + ".onreadystatechange = " + reqname + "_Finally ;" + Environment.NewLine +
                "        " + reqname + ".setRequestHeader(\"Content-Type\",\"application/x-www-form-urlencoded\"); " + Environment.NewLine +
                "        " + reqname + ".send(" + (sendquerystring != "" ? "\"" + sendquerystring + "\"" : "null") + ");" + Environment.NewLine +
                "    }" + Environment.NewLine +
                "    " + Environment.NewLine +

                "    // FlowOK" + Environment.NewLine +
                "    function " + reqname + "_Finally()" + Environment.NewLine +
                "    {" + Environment.NewLine +
                "        if (" + reqname + ".readyState == 4)" + Environment.NewLine +
                "        {" + Environment.NewLine +
                "            if (" + reqname + ".status == 200)" + Environment.NewLine +
                "            {" + Environment.NewLine +
                "                try" + Environment.NewLine +
                "                {" + Environment.NewLine +
                (responseclientname != "" ? "                    " + responseclientname + " = \"OK\";" : "") + Environment.NewLine +
                "                   FlowAutoReview();" + Environment.NewLine +
                "                }" + Environment.NewLine +
                "                catch (failed)" + Environment.NewLine +
                "                {" + Environment.NewLine +
                "                    alert(failed.description);" + Environment.NewLine +
                "                }" + Environment.NewLine +
                "            }" + Environment.NewLine +
                "            else" + Environment.NewLine +
                "            {" + Environment.NewLine +
                "                alert(\"status is \" + " + reqname + ".status);" + Environment.NewLine +
                "            }" + Environment.NewLine +
                "        }" + Environment.NewLine +
                "    }" + Environment.NewLine +

                (autorun ? "   window.attachEvent(\"onload\"," + reqname + "_RunAjax);" : "") + Environment.NewLine +

                "</script>" + Environment.NewLine;

            this.RegisterClientScriptBlock(reqname, ajaxjs);
            return retname;
        }


        protected void QueryButton_Click(object sender, EventArgs e)
        {
            this.Query();
        }

        protected void Query()
        {





            
            //------------------------------------------------------------

            string deputysql1 = "select uid from dguserdeputy where deputyuid = '" + this.CurrentUser.ID + "' and (sdate is null or sdate<={ fn NOW() }) and (edate is null or edate>={ fn NOW() }) and (sid is null or (sid is not null and sid=a.fid)) ";
            string deputysql2 = "select uid from dguserdeputy where deputyuid in (" + deputysql1 + ") and (sdate is null or sdate<={ fn NOW() }) and (edate is null or edate>={ fn NOW() }) and (sid is null or (sid is not null and sid=a.fid))";

            string whereis = "a.reviewerurl like '/erp_axmt610/axmt610view.aspx%' and a.requesturl like '/erp_axmt610%'  and a.fid <> a.fnid and a.fid  in ('1F7EBCF7-D202-4866-8C86-53A7D74D624B') and (a.revieweruid='" + this.CurrentUser.ID.ToString() + "' or a.revieweruid in (" + deputysql1 + ") or a.revieweruid in (" + deputysql2 + "))";

            if (QUERY_ERP_NO.Text != "")
            {
                whereis = whereis + " and e.oga01 like N'%" + QUERY_ERP_NO.Text + "%'";
            }
            if (this.QUERY_COM.Items.ToString() != "")
            {
                whereis = whereis + " and e.occ02_1 like N'%" + QUERY_COM.Value.ToString()+ "%'";
            }
            if (QUERY_PLANTID.Text != "")
            {
                whereis = whereis + " and e.PLANTID like N'%" + QUERY_PLANTID.Text + "%'";
            }
            if (this.QUERY_SDATE.Text != "" && this.QUERY_SDATE2.Text != "")
            {

                whereis = whereis + " and e.oga02 >= CONVERT(datetime,'" + this.QUERY_SDATE.Text + "') and e.oga02 <= CONVERT(datetime,'" + this.QUERY_SDATE2.Text + "')"; //+1是因為要讓日期變成後一天的00點00分

            }
            if (this.QUERY_SDATE.Text != "" && this.QUERY_SDATE2.Text == "")
            {
                whereis = whereis + " and e.oga02 >= CONVERT(datetime,'" + this.QUERY_SDATE.Text + "')";
            }

            if (this.QUERY_SDATE.Text == "" && this.QUERY_SDATE2.Text != "")
            {
                whereis = whereis + " and e.oga02 <= CONVERT(datetime,'" + this.QUERY_SDATE2.Text + "')";
            }
            //if (QUERY_status.Value != null && QUERY_status.Value != "all")
            //{
            //    if (QUERY_status.Value == "N")
            //        whereis = whereis + " and a.reviewdate is null";
            //    if (QUERY_status.Value == "Y")
            //        whereis = whereis + " and a.reviewdate is not null";
            //}
            //if (QUERY_pendingday.Text != "")
            //{
            //    whereis = whereis + " and DATEDIFF(day,a.initdate, '" + System.DateTime.Now.ToString("s") + "') >=" + QUERY_pendingday.Text + "";
            //}
            whereis = " where " + whereis;

            string sql = "";
            sql = "select e.oga02 oga02,d.text dtext,a.*,e.no no,e.no_order no_order,e.plantid plantid,e.id eid, "+
                 "e.oga01 oga01,e.occ02_1 occ02_1,e.gem02_3 gem02_3,e.gen02_4 gen02_4,e.oga23+' '+"+
                 " format(round(convert(float,convert(varchar(20),e.oga50)),2),'#,#.00') oga50,   " +
                 " format(round(convert(float,convert(varchar(20),e.tot)),2),'#,#.00') tot,  " +
                 " format(round(convert(float,convert(varchar(20),e.bal)),2),'#,#.00') bal," +
                 " format(round(convert(float,convert(varchar(20),e.l_amt01)),2),'#,#.00')  l_amt01," +
                 " format(round(convert(float,convert(varchar(20),e.l_amt02)),2),'#,#.00')  l_amt02," +
                 " format(round(convert(float,convert(varchar(20),e.l_amt03)),2),'#,#.00')  l_amt03," +
                 " CASE WHEN e.Reason_user='' OR e.Reason_user is null THEN '---' ELSE e.Reason_user END Reason_user, " +
                 "CASE WHEN e.Improve_user='' OR e.Improve_user is null THEN '---' ELSE e.Improve_user END Improve_user, " +
                 "CASE WHEN e.Reason_salse='' OR e.Reason_salse is null THEN '---' ELSE e.Reason_salse END Reason_salse, " +
                 "CASE WHEN e.Improve_salse='' OR e.Improve_salse is null THEN '---' ELSE e.Improve_salse END Improve_salse, " +
                 "CASE WHEN e.l_azp03='' OR e.l_azp03 is null THEN '---' ELSE e.l_azp03 END l_azp03 " +
              "from dgflowqueue a " +
              "left join dguser b on a.requestuid=b.id " +
              "left join dguser c on a.revieweruid=c.id " +
              "left join dgflowqueue d on a.requesturl=d.requesturl and d.fid=d.fnid " +
             "left join AXMT610_IN_HEAD e on UPPER(substring(a.requesturl,34,65))=e.id";






            DataList1.SQL = sql + whereis + " and a.reviewdate is null order by a.initdate";
            
            //客戶的下拉選單---------------------------------------------------------------------------
            string sqls = "";
            sqls = "select distinct(occ02_1) ";
            sqls = sqls + "from dgflowqueue a ";
            sqls = sqls + "left join dguser b on a.requestuid=b.id ";
            sqls = sqls + "left join dguser c on a.revieweruid=c.id ";
            sqls = sqls + "left join dgflowqueue d on a.requesturl=d.requesturl and d.fid=d.fnid ";
            sqls = sqls + "left join AXMT610_IN_HEAD e on UPPER(substring(a.requesturl,34,65))=e.id";
            sqls = sqls + whereis + " and a.reviewdate is null ";
            //if (this.CurrentUser.LogonID.ToString() == "pearl.hsieh")
            //{
            //    Response.Write(sqls.ToString());
            //}
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
            this.QUERY_COM.Items.Add("Filter", "");
            ds.Open(sqls.ToString());
            while (!ds.EOF)
            {
                this.QUERY_COM.Items.Add(ds["occ02_1"].ToString(), ds["occ02_1"].ToString());
                ds.MoveNext();
            }
            //-----------------------------------------------------------------------------------------------

        }

        protected static string GetOnclickScript(string rooturl, string RequestUrl)
        {
            return "showModalDialog('" + (rooturl.EndsWith("/") ? rooturl : rooturl + "/") + "Flowwork/PopupFlowView.aspx?requesturl=" + SmoothEnterprise.Utility.Encryption.Encode(RequestUrl) + "&type=normal','', 'dialogWidth: 400px; dialogHeight: 400px; resizable: no; help: no; status: no; scroll: auto;');";
        }

        #region IReminder Members

        public string GetReminderText()
        {
            // TODO:  Add MyNews.GetReminderText implementation
            //string GetReminderText = this.GetLocalResourceObject("Vs_GetReminderText").ToString();
            return "等待您處理的審核";
        }

        public int GetReminderCount()
        {
            // TODO:  Add MyNews.GetReminderCount implementation

            int retint = 0;
            try
            {
                SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
                string deputysql1 = "select uid from dguserdeputy where deputyuid = '" + this.CurrentUser.ID + "' and (sdate is null or sdate<={ fn NOW() }) and (edate is null or edate>={ fn NOW() }) and (sid is null or (sid is not null and sid=A.fid)) ";
                string deputysql2 = "select uid from dguserdeputy where deputyuid in (" + deputysql1 + ") and (sdate is null or sdate<={ fn NOW() }) and (edate is null or edate>={ fn NOW() }) and (sid is null or (sid is not null and sid=A.fid))";
                retint = (int)ds.ExecuteScalar("SELECT COUNT(A.text) FROM dgflowqueue A WHERE (A.revieweruid='" + this.CurrentUser.ID.ToString() + "' OR A.revieweruid IN (" + deputysql1 + ") OR A.revieweruid IN (" + deputysql2 + ")) AND A.reviewdate IS NULL");
                ds.Connection.Close();
                ds.Close();
            }
            catch
            {

            }
            return retint;
        }

        public string GetReminderURL()
        {
            // TODO:  Add MyNews.GetReminderURL implementation
            return this.ResolveUrl("~/Flowwork/MyApproval.aspx");
        }

        #endregion

}
}