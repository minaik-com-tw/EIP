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
    public partial class MultiApproval : SmoothEnterprise.Web.Page
{

    public class Global
    {
        public static int iVars = 0;
    } 

	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "Forwarder List Page";
        if (!IsPostBack)
        {
            this.DropDownList1.SelectedValue = "isSend";
            this.DropDownList1.Enabled = false;
        }



        
        this.DataList1.Columns[0].Caption = "<table><tr><td><input type=\"checkbox\" onclick=\"chkallmultiapproval();\" /></td><td style=\"font-family:'Arial';font-size:12px;color:#ffffff;\"> <b>" + this.DataList1.Columns[0].Caption + "</b></td></tr></table>";
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
        	this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{

            /*
            if (column.ID == "DataList1_popupflowview")
            {
                System.Web.UI.WebControls.Image ib = (System.Web.UI.WebControls.Image)this.DataList1.Columns.GetItem("DataList1_popupflowview").GetControl("IB_popupflowview");
                //ib.Attributes.Add("onclick", GetOnclickScript(ResolveUrl("~/"), "AAA"));
                ib.Style.Add("cursor", "hand");
            }
             * */

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





            /*
             if (column.ID == "DataList1_Cdate")
             {
                 DateTime datetime = Convert.ToDateTime(rs["Cdate"].ToString());
                 cell.OutputHTML = datetime.ToString("yyyy/MM/dd");
             }
            */


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

             
            if (column.ID == "DataList1_multiapproval")
            {
                bool EndbledMultiApproval = false;
                string[] ResultTypes = new string[0];
                string classname = "";
                try
                {
                    classname = SmoothEnterprise.Web.Page.InheritsClass(rs["reviewerurl"].ToString());
                    System.Type FlowViewType = SmoothEnterprise.Utility.Type.GetType(classname);
                    Object obj = FlowViewType.InvokeMember(null, System.Reflection.BindingFlags.CreateInstance, null, null, null);
                    ResultTypes = (string[])FlowViewType.InvokeMember("MultiApproval_ResultTypes", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.Default | System.Reflection.BindingFlags.GetProperty, null, obj, null);
                    EndbledMultiApproval = (ResultTypes.Length > 0);
                }
                catch
                {
                    EndbledMultiApproval = false;
                }
              //  Response.Write(classname + ResultTypes.Length.ToString());
                //Response.Write(EndbledMultiApproval);

                if (rs["reviewdate"] == DBNull.Value && EndbledMultiApproval)
                {
                    if (Global.iVars.ToString() == "0")
                    {
                        cell.OutputHTML =
                            "<div id='div_" + rs["reviewerurl"].ToString() + rs["requesturl"].ToString().Substring(rs["requesturl"].ToString().IndexOf("?")) + "' style=\"white-space:nowrap\">" + Environment.NewLine +
                            "   <table>" + Environment.NewLine +
                            "       <tr>" + Environment.NewLine +
                            "           <td width=\"1px\">" + Environment.NewLine +
                            "               <input type='checkbox' id='chk_multiapproval' name='chk_multiapproval' checked  = 'true'  value='" + rs["dgflowid"].ToString() + "'>" + Environment.NewLine +
                            "           </td>" + Environment.NewLine +
                            "           <td>" + Environment.NewLine +
                            "               <select id='resulttype_" + rs["dgflowid"].ToString() + "' name='resulttype_" + rs["dgflowid"].ToString() + "' style=\"font-size:11px;\">" + Environment.NewLine;

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
                            "               <input type='hidden' id='url_" + rs["dgflowid"].ToString() + "' name='url_" + rs["dgflowid"].ToString() + "' value='" + rs["reviewerurl"].ToString() + rs["requesturl"].ToString().Substring(rs["requesturl"].ToString().IndexOf("?")) + "'>" + Environment.NewLine +
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
            Response.Write(ex);
            Response.End();

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


        //string deputysql1 = "select uid from dguserdeputy where deputyuid = '" + this.CurrentUser.ID + "' and (sdate is null or sdate<={ fn NOW() }) and (edate is null or edate>={ fn NOW() }) and (sid is null or (sid is not null and sid=a.fid)) ";
        //string deputysql2 = "select uid from dguserdeputy where deputyuid in (" + deputysql1 + ") and (sdate is null or sdate<={ fn NOW() }) and (edate is null or edate>={ fn NOW() }) and (sid is null or (sid is not null and sid=a.fid))";
        //whereis = " and substring(a.requesturl,37,40)= Forwarder.id  and a.fid  = '2ef6832d-4cb7-42d9-8ce1-26b284382945'  and  (a.revieweruid='" + this.CurrentUser.ID.ToString() + "' or a.revieweruid in (" + deputysql1 + ") or a.revieweruid in (" + deputysql2 + "))";

        string deputysql1 = "select uid from dguserdeputy where deputyuid = '" + this.CurrentUser.ID + "' and (sdate is null or sdate<={ fn NOW() }) and (edate is null or edate>={ fn NOW() }) and (sid is null or (sid is not null and sid=a.fid)) ";
        string deputysql2 = "select uid from dguserdeputy where deputyuid in (" + deputysql1 + ") and (sdate is null or sdate<={ fn NOW() }) and (edate is null or edate>={ fn NOW() }) and (sid is null or (sid is not null and sid=a.fid))";
        whereis = " and substring(a.requesturl,33,40)= Forwarder.id  and a.fid  = '2ef6832d-4cb7-42d9-8ce1-26b284382945'  and  (a.revieweruid='" +  this.CurrentUser.ID + "' or a.revieweruid in (" + deputysql1 + ") or a.revieweruid in (" + deputysql2 + "))";

        

        if (DropDownList1.SelectedValue != "" && DropDownList1.SelectedValue != "X")
        {
            whereis = whereis + " And IsStatus = '" + DropDownList1.SelectedValue + "'";
        }


        if (!String.IsNullOrEmpty(FacType))
        {
            whereis = whereis + " And PlantID like '%" + FacType + "%'";
        }

        if (!String.IsNullOrEmpty(ERPNum1))
        {
            whereis = whereis + " And ERP_Key like '%" + ERPNum1 + "%'";
        }

        if (!String.IsNullOrEmpty(ERPNum2))
        {
            whereis = whereis + " And ERP_Key2 like '%" + ERPNum2 + "%'";
        }

        if (!String.IsNullOrEmpty(PriceM))
        {
            whereis = whereis + " And SHIPPING_No like '%" + PriceM + "%'";
        }

        if (!String.IsNullOrEmpty(FacCode))
        {
            whereis = whereis + " And FORWARDER_Num like '%" + FacCode + "%'";
        }

        if (!String.IsNullOrEmpty(HavNum))
        {
            whereis = whereis + " And HawbNo like '%" + HavNum + "%'";
        }

        if (!String.IsNullOrEmpty(SETD))
        {
            whereis = whereis + " And ETD >= '" + SETD + "'";
        }

        if (!String.IsNullOrEmpty(SATD))
        {
            whereis = whereis + " And ATD >= '" + SATD + "'";
        }

        if (!String.IsNullOrEmpty(SETA))
        {
            whereis = whereis + " And ETA >= '" + SETA + "'";
        }

        if (!String.IsNullOrEmpty(SATAAS))
        {
            whereis = whereis + " And ATAAS >= '" + SATAAS + "'";
        }

        if (!String.IsNullOrEmpty(SATAC))
        {
            whereis = whereis + " And ATAC >= '" + SATAC + "'";
        }

        if (!String.IsNullOrEmpty(INVNum))
        {
            whereis = whereis + " And INV_Num like '%" + INVNum + "%'";
        }

        DataList1.SQL = "SELECT Forwarder.*,a.id  dgflowid,reviewerurl,requesturl,reviewdate FROM Forwarder,dgflowqueue a  where 1 = 1" + whereis;

        //Response.Write(DataList1.SQL);
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
}
}
