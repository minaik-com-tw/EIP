using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
//using System.Data.SqlClient;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using Oracle.DataAccess.Client;

public partial class APMI255_Report : SmoothEnterprise.Web.Page
{
    ReportDocument myReportDoc = new ReportDocument();
    private string db = "[EIPB].[dbo]."; //db位置(apmi255皆放在EIPB的資料夾
    protected void Page_Load(object sender, EventArgs e)
    {
        myReportDoc.Load(Server.MapPath("APMI255_CrystalReport.rpt"));


        TableLogOnInfo logoninfo;


        foreach (CrystalDecisions.CrystalReports.Engine.Table mytable in myReportDoc.Database.Tables)
        {

            logoninfo = mytable.LogOnInfo;
            logoninfo.ConnectionInfo.UserID = "system";
            logoninfo.ConnectionInfo.Password = "manager";
            mytable.ApplyLogOnInfo(logoninfo);
        }
        String ItemName = "";
        if (String.IsNullOrEmpty(Request.QueryString["ItemName"]))
            ItemName = "AH_FRONT_HB";
        else
            ItemName = Request.QueryString["ItemName"];




        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rs.Open("select convert(char, PMI02, 112) pmi02,A.plantid plantid,pmi03,pmj03,pmj05 from " + db + "APMI255_IN_HEAD A " +
               "LEFT JOIN " + db + "APMI255_IN_BODY B ON A.no=B.bno WHERE a.id='" + Request.QueryString["id"] + "' AND pmJ02='" + Request.QueryString["item"] + "'");


        if (!rs.EOF)
        {

            //myReportDoc.SetParameterValue("id1", "20120404");
            //myReportDoc.SetParameterValue("id2", "MAT01");
            //myReportDoc.SetParameterValue("id3", "USD");
            //myReportDoc.SetParameterValue("id4", "S-1000 0001");
            //myReportDoc.SetParameterValue("plantid", "MAY");

            myReportDoc.SetParameterValue("id1", rs["pmi02"].ToString());
            myReportDoc.SetParameterValue("id2", rs["pmi03"].ToString());
            myReportDoc.SetParameterValue("id3", rs["pmj05"].ToString());
            myReportDoc.SetParameterValue("id4", rs["pmj03"].ToString());
            myReportDoc.SetParameterValue("plantid", rs["plantid"].ToString());



        }
        /*
         * 
         * 
         * 
        myReportDoc.SetParameterValue("id", Request.QueryString["ID"]);
        myReportDoc.SetParameterValue("strid", Request.QueryString["ID"], "TypeA");
        myReportDoc.SetParameterValue("strid", Request.QueryString["ID"], "TypeB");
        myReportDoc.SetParameterValue("strid", Request.QueryString["ID"], "TypeC");
        myReportDoc.SetParameterValue("strid", Request.QueryString["ID"], "TypeD");
        */
        CrystalReportViewer1.ReportSource = myReportDoc;
    }

    protected void Page_Unload(object sender, EventArgs e)
    {
        if (myReportDoc == null)
            return;
        else
        {
            myReportDoc.Close();
            myReportDoc.Dispose();
            CrystalReportViewer1.Dispose();
        }
    }
}