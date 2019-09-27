<%@ WebHandler Language="C#" Class="jsonData" %>

using System;
using System.Web;


public class jsonData : IHttpHandler
{

    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    private string db3 = ""; //db 抓oracle資料位置
    private string db4 = ""; //db 抓EIPC資料位置

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string data = "[";//构建的json数据
                          //下面两句是用来测试前台向此页面发出的查询字符
        string querystrname = context.Request.QueryString.GetValues("name")[0];//取查询字符串中namer的值
        string querystage = context.Request.QueryString.GetValues("age")[0];//取查询字符串中age的值
        string querystss = context.Request.QueryString.GetValues("ss")[0];//取查询字符串中ss的值
        float querystjj = float.Parse(context.Request.QueryString.GetValues("jj")[0]);//取查询字符串中jj的值

        if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
        {
            db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
            db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
            db3 = "IP185";
            db4 = "[EIPC].[dbo]."; //如果不是在Ann本機, 則指定資料庫 

        }
        else
        {

            db3 = "[192.168.0.185]"; //如果不是在Ann本機, 則指定資料庫 
        }


        if (querystage.ToString() == "20")  //找下階料的應發數量等資訊
        {

            int t = 1;
            SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            string sqlx = "select BMB03,ima02,CEILING(round((bmb06/bmb07*(1+(bmb08/100))),6)*'" + querystss + "') qpaq,ima63 " +
                      "from " + db3 + ".MINAIK.dbo.BMB_FILE a left join " + db3 + ".MINAIK.dbo.BMA_FILE b on bmb01=bma01  " +
                      "left join " + db3 + ".MINAIK.dbo.IMA_FILE c on bmb03=ima01  " +
                      "where   bma01='" + querystrname.ToString() + "' AND bmb04<=getdate() AND (bmb05 IS NULL OR bmb05>getdate())  " +
                      "union  " +
                      "select bmd04,ima02,CEILING(round((bmb06/bmb07*(1+(bmb08/100))),6)*'" + querystss + "') qpaq,ima63  " +
                      "from " + db3 + ".MINAIK.dbo.BMB_FILE a left join " + db3 + ".MINAIK.dbo.BMA_FILE b on bmb01=bma01  " +
                      "left join " + db3 + ".MINAIK.dbo.BMD_FILE d on  bmb03=bmd01 and ( bmb01=bmd08 or bmd08='ALL')  " +
                      "left join " + db3 + ".MINAIK.dbo.IMA_FILE c on bmd04=ima01  " +
                      "where   bma01='" + querystrname.ToString() + "' AND bmb04<=getdate() AND (bmb05 IS NULL OR bmb05>getdate()) and bmd04 is not null   ";

                Utility.log(sqlx);

                rsa.Open(sqlx);


            while (!rsa.EOF)
            {
                data = data + "{\"name\":\"" + rsa["bmb03"].ToString() + "\",\"age\":\"" + rsa["ima02"].ToString().Replace('"', '&') + "\",\"ss\":\"" + rsa["qpaq"].ToString() + "\",\"jj\":\"" + rsa["ima63"].ToString() + "\"},";

                rsa.MoveNext();
            }
            rsa.Close();
            string sql = rsa.SQL.ToString();
            // context.Response.Write("1:" + sql + "<br>");
            data = data.Substring(0, data.Length - 1); //去除最後一個","
            data = data + "]";
            context.Response.Write(data);

        }

        if (querystage.ToString() == "30") //找此張單據的單身及單身品名
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("select ima01,'aaa' aa ,amount,material_origin,pcs,mail from  engineeringTest_head a left join " +
                   "engineeringTest_body b on a.id=b.aid where aid='" + querystrname.ToString() + "' order by ima01  ");
            //'" + Request.QueryString["text"] + "%' "
            while (!rs.EOF)
            {

                SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rsa.Open("SELECT ima02 from " + db3 + ".MINAIK.dbo.IMA_FILE where ima01 = '" + rs["ima01"].ToString() + "'");
                while (!rsa.EOF)
                {
                    data = data + "{\"name\":\"" + rs["ima01"].ToString() + "\",\"age\":\"" + rsa["ima02"].ToString().Replace('"', '&') + "\",\"ss\":\"" + rs["amount"].ToString() + "\",\"jj\":\"" + rs["pcs"].ToString() + "\",\"ee\":\"" + rs["mail"].ToString() + "\",\"kk\":\"" + rs["material_origin"].ToString() + "\"},";
                    rsa.MoveNext();
                }
                rsa.Close();

                string sql2 = rsa.SQL.ToString();
                // context.Response.Write("2-1:" + sql2 + "<br>");
                rs.MoveNext();

            }

            string sql = rs.SQL.ToString();
            // context.Response.Write("2:" + sql + "<br>");
            rs.Close();

            data = data.Substring(0, data.Length - 1); //去除最後一個","
            data = data + "]";
            context.Response.Write(data);
        }

        if (querystage.ToString() == "40") //找npi專案的小組成員, 加入通知人員mail中
        {
            SmoothEnterprise.Database.DataSet rs4 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs4.Open("select  email from " + db4 + "projectfrom a left join " + db4 + "project_userlimit b on a.pid=b.pid " +
                    "left join dguser c  on b.userid=c.id " +
                    "where dbnum='" + querystrname.ToString() + "' order by logonid ");
            while (!rs4.EOF)
            {
                data = data + "{\"email\":\"" + rs4["email"].ToString() + "\"},";

                rs4.MoveNext();
            }

            string sql = rs4.SQL.ToString();
            //context.Response.Write("3:" + sql + "<br>");

            rs4.Close();
            data = data.Substring(0, data.Length - 1); //去除最後一個","
            data = data + "]";
            context.Response.Write(data);
        }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}