using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IPQC_GetSinglevel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenRead);
        string command = "SELECT text " +
                         "   FROM EIPA.DBO.dgflowqueue Q "+
                         "   WHERE REQUESTQUERYSTRING = '?rowno="+Request.QueryString["rowno"]+"' "+
                         "   AND QSEQ IS NOT NULL "+
                         "   AND revieweruid = '"+Request.QueryString["UID"]+"'";
        rs.Open(command);
        if (!rs.EOF)
        {
            Response.Write(rs["text"]);
        }
        else
        {
            Response.Write("NA");
        }
    }
}