using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using SmoothEnterprise.Web.UI.WebControl;

/// <summary>
/// MABase 的摘要描述
/// </summary>
public abstract class Option_Base : SmoothEnterprise.Web.Page
{
    protected string _limit = "";
    protected string _type = "";
    protected string _input = "";
    protected int _default = 0;
    protected string _en = "";
    protected string _tw = "";
    protected int _display = 1;
    private string _Main = "";
     

    public Option_Base()
    { 
    }
     
    public System.Web.UI.WebControls.ListItem[] getKind(string request)
    {
        ListItem[] Item = new ListItem[0];

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
        {
            conn.Open();
            string sqlcmd = " select kind from eipe.dbo.sys_option where main='vmi' group by kind ";
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "temp");

            DataTable dt = ds.Tables["temp"];

            conn.Close();
            da.Dispose();

            int iCount = dt.Rows.Count + 1;
            Item = new ListItem[iCount];
            Item[0] = new ListItem("Select", "");

            int i = 1;
            foreach (System.Data.DataRow row in dt.Rows)
            {
                string value = row[0].ToString();

                string text = row[0].ToString();

                Item[i] = new ListItem(text, value);

                if (value == request)
                {
                    Item[i].Selected = true;
                }

                i++;
            }

            dt.Dispose();
        }

        return Item;
    }

    protected void Insert(string type, string en, string tw, int  def,int display)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {

            string sql = " select * from eipe.dbo.sys_option where 1=0 ";
            rs.Open(sql);
            rs.Add();

            rs["rowid"] = Guid.NewGuid().ToString();
            rs["main"] = "VMI";
            rs["Kind"] = type;
            rs["en"] = en;
            rs["tw"] = tw;
            rs["def"] = def;
            rs["display"] = display;

            rs.Update();
            rs.Close();
        }
    }

    protected void updateDefault( string _type)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {

            string sql = " update eipe.dbo.sys_option set def=0 where main='vmi' and kind='" + _type + "' ";
            rs.ExecuteNonQuery(sql);
        }

    }

    
  

}

