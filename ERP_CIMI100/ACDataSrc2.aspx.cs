using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using Oracle.DataAccess.Client;

public partial class jQueryAutoComp_ACDataSrc : System.Web.UI.Page
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    private string db3 = ""; //db副2位置
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
        {
            db1 = "[EIPB].[dbo].";
            db2 = "[EIPA].[dbo].";
            db3 = "IP185";
        }
        else
        {
           
            db3 = "[192.168.0.185]"; //如果不是在Ann本機, 則指定資料庫 
        }

        //使用者目前輸入的文字預設以q傳入
        string q = Request["q"] ?? "";
        if (q.Length > 0)
        {
             DataTable t = getStockData(Request.QueryString["PID"]);
            DataView dv = new DataView(t);
            //利用LIKE做查詢
            if (Request.QueryString["PID"] == "component")
            {
                dv.RowFilter = "symbol LIKE '%" + q + "%'";
            }
            else if (Request.QueryString["PID"] == "DWG")
            {
                dv.RowFilter = "cname  LIKE '%" + q + "%' ";
            }
            else
            {
                dv.RowFilter = "Key LIKE '%" + q + "%' or symbol LIKE '%" + q + "%' ";
            }
            dv.Sort = "Key, Symbol, Cname";
            List<string> lst = new List<string>();
            lst.Add("");
            foreach (DataRowView drv in dv)
            {
                DataRow r = drv.Row;
                //組裝出前端要用的欄位
                lst.Add(string.Format("{0}|{1}|{2}", r["key"], r["symbol"], r["cname"]));
                if (lst.Count >= 10) break;
            }
            //每筆資料間以換行分隔
            Response.Write(string.Join("\n", lst.ToArray()));
        }
       
    }

    private DataTable getStockData(string pid)
    {
        

        //如果資料量未多到誇張，將DataTable Cached住
        string CACHE_KEY = "StkTable";
        if (Cache[CACHE_KEY] == null)
        {
            DataTable t = new DataTable();
            t.Columns.Add("Key", typeof(string));
            t.Columns.Add("Symbol", typeof(string));
            t.Columns.Add("CName", typeof(string));
            t.Columns.Add("EName", typeof(string));


            SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

            switch (pid)
            {

                case "f_partno":
                    rsa.Open("select    TC_AZF01,TC_AZF02,TC_AZF03 from   " + db3 + ".MINAIK.dbo.TC_AZF_FILE");
                    
                    while (!rsa.EOF)
                    {
                        t.Rows.Add(rsa["TC_AZF01"].ToString(), rsa["TC_AZF02"].ToString(), rsa["TC_AZF03"].ToString());
                        rsa.MoveNext();
                    }
                    break;
                case "FacSn":
                    rsa.Open("select    MSE01,MSE02 from   " + db3 + ".MINAIK.dbo.MSE_FILE order by  MSE01");
                    while (!rsa.EOF)
                    {
                        t.Rows.Add(rsa["MSE01"].ToString(), rsa["MSE01"].ToString(), rsa["MSE02"].ToString());
                        rsa.MoveNext();
                    }

                    break;
                default:
                    rsa.Open("select    ima01,ima02,ima021 from   " + db3 + ".MINAIK.dbo.IMA_FILE");
                    while (!rsa.EOF)
                    {
                        t.Rows.Add( rsa["ima01"].ToString(), rsa["ima02"].ToString(), rsa["ima021"].ToString());   //泛查, 可查料號/品名/規格
                        rsa.MoveNext();
                    }
                    break;

            }
            rsa.Close();

            //放入Cache，保存兩小時
            Cache.Add(CACHE_KEY, t, null, DateTime.Now.AddHours(0),
                System.Web.Caching.Cache.NoSlidingExpiration,
                System.Web.Caching.CacheItemPriority.Normal, null);
        }
        return Cache[CACHE_KEY] as DataTable;
    }


}
