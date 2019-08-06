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

public partial class test : SmoothEnterprise.Web.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = "12312312^1";
        Response.Write(cs.Substring(0,cs.IndexOf('^')));

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        

        if (DropDownList1.SelectedValue != "NA")
        {
            //string ss = "<script> function  autoautos(a1,b1,c1,d1){ "+
            //    "  var x='ACDataSrc_Complex_test.aspx'; "+
            //    "  alert('23123'); " ;
            //    " $('#'+a1).autocomplete(x, "+   
            //    " {"+  
            //    "    extraParams: {PID:c1},"+  
            //     "   delay: 10,"+  
            //    "    width: 500,"+  
            //    "    minChars: 1, "+  
            //    "    matchSubset: false,"+  
            //    "    matchContains: false,"+  
            //    "    cacheLength: 0,"+  
            //    "    noCache: true, "+               
            //    "  autoFill: false,  mustMatch: false  }); } "+
            //    " </script> ";

                
                
                
                
               
           // Response.Write(ss);
        }

        if (DropDownList1.SelectedValue == "1")
        {
            Response.Write("<script> c('1'); autoautos('Model_class','Model_class2','Model_class',true);  </script> ");

        }
        else
        {
            Response.Write("<script> c('2');   autoautos('A7','A7_2','Parts_Class',true); </script> ");
        }


    }
}