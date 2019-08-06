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
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
        {
            db1 = "IP185";
        }
        else
        {
           
            db1 = "[192.168.0.185]"; //如果不是在Ann本機, 則指定資料庫 
        }

        //使用者目前輸入的文字預設以q傳入
        string q = Request["q"] ?? "";
        if (q.Length > 0)
        {
            DataTable t = getStockData();
            DataView dv = new DataView(t);
            //利用LIKE做查詢
            dv.RowFilter = "Symbol LIKE '" + q + "%'";
            dv.Sort = "Key, Symbol";
            List<string> lst = new List<string>();
            lst.Add("");
            foreach (DataRowView drv in dv)
            {
                DataRow r = drv.Row;
                //組裝出前端要用的欄位
                lst.Add(string.Format("{0}|{1}", r["key"], r["symbol"]));
                if (lst.Count >= 10) break;
            }
            //每筆資料間以換行分隔
            Response.Write(string.Join("\n", lst.ToArray()));
        }
       
    }

    private DataTable getStockData()
    {
        

        //如果資料量未多到誇張，將DataTable Cached住
        string CACHE_KEY = "StkTable";
        if (Cache[CACHE_KEY] == null)
        {
            DataTable t = new DataTable();
            t.Columns.Add("Key", typeof(string));
            t.Columns.Add("Symbol", typeof(string));
           // t.Columns.Add("CName", typeof(string));
           // t.Columns.Add("EName", typeof(string));


            SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rsa.Open("select   MSE01,MSE02 from     IP185.MINAIK.dbo.MSE_FILE");
            while (!rsa.EOF)
            {
                t.Rows.Add(rsa["MSE01"].ToString(), rsa["MSE02"].ToString());
                rsa.MoveNext();
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
