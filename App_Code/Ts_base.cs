using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Ts_base 的摘要描述
/// </summary>
public static class Ts_base
{
    

    public static string getTempNo(string Key, string table)
    {
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        string sql = string.Format("select count (*) 'total' FROM {0}", table);
        int total = int.Parse(rs.ExecuteScalar(sql).ToString()) + 1;

        //Q601-17060060
        string date = DateTime.Now.ToString("yyMM");
        String fnum = String.Format("{0:0000}", total);

        string No = Key + "-" + date + fnum;

        return No;
    }

}