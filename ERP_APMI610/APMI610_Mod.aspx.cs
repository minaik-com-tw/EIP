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

public partial class APMI610_Mod : SmoothEnterprise.Web.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string EIPColumn = "";
        string ERPColumn = "";
        string ERPvalue = "";
        string EIPvalue = "";
        string RowCunt="0";
        string Sql="";
        DBTransfer GS = new DBTransfer();
        SmoothEnterprise.Database.DataSet  Ts = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        ds.Open("select top 5 *  from eipb.dbo.apmi610_in where isnull(ERPCheck,'N')='N' and pmca00 like '%U%'  ");
        while (!ds.EOF)
        {
            Ts.Open("SELECT name,REPLACE(name,'a','') Fname,column_id "+
                "  from eipb.sys.columns "+
                "  where   Object_ID = Object_ID('eipb.dbo.APMI610_IN') "+
                "  and  name like '%pmca%'  and column_id not in ('4','5','64','68','84','85','86','87') ");
            while (!Ts.EOF)
            {
                EIPColumn=Ts[1].ToString();
                ERPColumn=EIPColumn.Replace('a',' ');
                if (ERPColumn.Substring(0,1) == "t") ERPColumn = ERPColumn.Replace("t", "ta");

                EIPvalue = ds[Ts[0].ToString()].ToString();
                ERPvalue=GS.GetTopfile("select "+ERPColumn+" from [IP185].[MINAIK].[dbo].[PMC_FILE] where pmc01='"+ds["pmca01"].ToString()+"'");
                //Response.Write("select " + ERPColumn + " from [IP185].[MINAIK].[dbo].[PMC_FILE] where pmc01='" + ds["pmca01"].ToString() + "'");
                if (EIPvalue.IndexOf(':').ToString() != "-1") EIPvalue=EIPvalue.Substring(0, EIPvalue.IndexOf(':')); 

                if (EIPvalue != ERPvalue)
                {
                    Sql = "insert into eipb.dbo.apmi610_mod (rowid,Fnm,eipvalue,erpvalue)values('" + ds["rowid"].ToString() +
                        "','" + Ts[0].ToString() + "','" + EIPvalue + "','" + ERPvalue + "')";
                
                    GS.RunIUSql(Sql);
                    Response.Write(EIPvalue + "---" + ERPvalue + "<br>");
                }
                
                Ts.MoveNext();
            }

            RowCunt = GS.GetTopfile("select count(*) from eipb.dbo.apmi610_mod where rowid='" + ds["rowid"].ToString() + "'");
            if (RowCunt != "0")
            {
                Sql = " update   eipb.dbo.apmi610_in set ERPcheck='Y',Datadiff='Y' where rowid='" + ds["rowid"].ToString() + "'";

            }
            else Sql = " update   eipb.dbo.apmi610_in set ERPcheck='Y' where rowid='" + ds["rowid"].ToString() + "'";

            GS.RunIUSql(Sql);


            ds.MoveNext();
        }
         
    }
}