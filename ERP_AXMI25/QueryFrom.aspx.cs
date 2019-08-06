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
using System.Data.SqlClient;

public partial class CNE_QueryFrom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            formQuery(0);
        }
    }
    private void formQuery(int page)
    {
        try
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            string PlantID = rs.ExecuteScalar("SELECT PlantID FROM EIPB.DBO.ERP_AXMI25 WHERE ROWNO='" + Request.QueryString["ROWNO"] + "' ").ToString();
            rs.Close();
            rs.Dispose();

            string whereis = "SELECT OCC01 , OCC02 , OCC18  " +
                           " FROM [IP185].[" + PlantID + "].[dbo].[OCC_FILE] " +
                           " where 1=1 ";

            if (this.FIELD_QUERY.Text.Trim() != "")
                whereis += " AND (OCC01 LIKE '" + this.FIELD_QUERY.Text.Trim() + "%' OR OCC02 LIKE '" + 
                    this.FIELD_QUERY.Text.Trim() + "%') ";
            this.SqlDataSource1.SelectCommand = whereis;

            
            GridView1.PageIndex = page;
            GridView1.DataBind();
            Session["Page"] = page;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        formQuery(e.NewPageIndex);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {     //ctl00_ContentPlaceHolder1_WebUserControl1_NA01
        // TextBox2.Text = GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Values[1].ToString();
        try
        {


            Response.Write("<script>var pWindow = window.dialogArguments;");
            Response.Write("pWindow.document.getElementById('ctl00$ContentPlaceHolder1$FIELD_occa01').value ='" +
                GridView1.SelectedRow.Cells[1].Text + "'  ;");
            Response.Write("pWindow.document.getElementById('ctl00$ContentPlaceHolder1$FIELD_occa02').value ='" +
                GridView1.SelectedRow.Cells[2].Text + "'  ;");
            //FIELD_occa18
            Response.Write("pWindow.document.getElementById('ctl00$ContentPlaceHolder1$FIELD_occa18').value ='" +
                GridView1.SelectedRow.Cells[3].Text + "'  ;");
            Response.Write("window.close(); </script>");
        }
        catch (Exception ex)
        {
            Response.Write(GridView1.SelectedRow.Cells[1].ToString());
        }

    }


    protected void BUTTON_QUERY_Click(object sender, EventArgs e)
    {
        try
        {
            formQuery(0);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void GVBind(int page)
    {
       

        
    }
}

