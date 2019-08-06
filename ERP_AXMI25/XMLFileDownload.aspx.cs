﻿using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ManagePDF
{
    public partial class PDFDownLoad : SmoothEnterprise.Web.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (base.Request.QueryString["ROWNO"] != null)
        {
            try
            {
                SmoothEnterprise.Database.DataSet attch = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                attch.Open("SELECT ID,FileBody,FileName FROM EIPB.DBO.ERP_AXMI25_File WHERE (ROWNO = '" + Request.QueryString["ROWNO"] + "')");
                
                if (!attch.EOF)
                
                {
                    try
                    {

                        base.Response.AddHeader("content-disposition", "attachment;filename=" + Server.UrlPathEncode(attch["FileName"].ToString()));

                    }
                    catch
                    {
                        base.Response.AddHeader("content-disposition", "attachment;filename=down.");
                        Response.Flush();
                        Response.End();
                    }

                    base.Response.BinaryWrite((byte[])attch["FileBody"]);
                    Response.Flush();
                    Response.End();
                                       
                }
                Response.Write(attch.SQL);
                attch.Close();
                Response.End();
            }
            catch
            {
            }
        }
        else
        {
            Response.End();
        }

    }

}
}