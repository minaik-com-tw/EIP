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
            dv.RowFilter = "Key LIKE '" + q + "%'";
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

    private DataTable getStockData()
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


           // string oradb = "Data Source=oracle_9i;User Id=system;Password=manager;";

           // OracleConnection conn1 = new OracleConnection(oradb);
           // conn1.Open();

           // //string sql = "  select   ima01,ima02,ima021     from minaik.ima_file   ";

           // string sql = "  select a.bmb01 bmb01,b.ima02 ima02,b.ima021 ima021,b.ima021 ima0211 from minaik.bmb_file a left join minaik.ima_file b on a.bmb01=b.ima01 where bmb05 is  null  group by a.bmb01,b.ima02,b.ima021   ";


           // OracleCommand query = new OracleCommand(sql, conn1);
           // OracleDataReader dr = query.ExecuteReader();


           //// int t = 1;
           // while (dr.Read())
           // {

           //     t.Rows.Add(dr[0].ToString(), dr[1].ToString(), dr[2].ToString());


           // }

            SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rsa.Open("select a.bmb01 bmb01,b.ima02 ima02,b.ima021 ima021,b.ima021 ima0211 from " + db1 + ".MINAIK.dbo.BMB_FILE a left join " + db1 + ".MINAIK.dbo.IMA_FILE b on a.bmb01=b.ima01 where bmb05 is  null  group by a.bmb01,b.ima02,b.ima021");
            while (!rsa.EOF)
            {
                t.Rows.Add(rsa["bmb01"].ToString(), rsa["ima02"].ToString(), rsa["ima021"].ToString());
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
