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

public partial class UI_TEST_Getid2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string name = this.userName.Text;
        this.SqlDataSource1.SelectCommand = GetSQLstring(name);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string name = this.userName.Text;
        this.SqlDataSource1.SelectCommand = GetSQLstring(name);
         this.GridView1.DataBind();
       // Response.Write(GetSQLstring(group, name));
    }
     

    public string GetSQLstring( string name)
    {
       // string SQLCommand = "SELECT id, logonid, name, email FROM dguser Where 1 = 1";
        
        
        string SQLCommand = " ";
       if(name!=""){
 
             SQLCommand = " SELECT pmd07  FROM [IP185].[MINAIK].[dbo].[PMD_FILE] where pmd02='財務部' " + 
            "  and pmd07 like '"+name+"%'   group by pmd07 order by pmd07 asc ";  
      
       }
         
       return SQLCommand;
    }




    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {     //ctl00_ContentPlaceHolder1_WebUserControl1_NA01
          // TextBox2.Text = GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Values[1].ToString();
         Response.Write("<script>var pWindow = window.dialogArguments;");

         Response.Write("pWindow.document.getElementById('ctl00_ContentPlaceHolder1_email" + Request.QueryString["id"].ToString() + "').value ='" +
             GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Values[0].ToString()+"'  ;");
         //Response.Write("pWindow.document.getElementById('ctl00_ContentPlaceHolder1_email" + Request.QueryString["id"].ToString() + "').value ='5';"); 
        
         Response.Write("window.close(); </script>");  
  
        
        

    }
    protected void userGroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {

         

    }
}
