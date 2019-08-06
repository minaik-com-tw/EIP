<%@ WebHandler Language="C#" Class="jsonData" %>

using System;
using System.Web;

public class jsonData : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
       // string data = "[";//构建的json数据
       //////下面两句是用来测试前台向此页面发出的查询字符

        string querystrname = context.Request.QueryString["q"].ToString(); 


            System.Text.StringBuilder data = new System.Text.StringBuilder();
            data.Append("[");
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("select top 10 email from dguser where name <> '' and email like '" + querystrname.ToString() + "%' group by email     ");
            while (!rs.EOF)
            {
                data.Append("{\"id\":\"" + rs["email"].ToString() + "\",\"name\":\"" + rs["email"].ToString() + "\"},");
                rs.MoveNext();
            }
            rs.Close();
            data.Remove(data.Length - 1, 1);
            data.Append("]");
            context.Response.Write(data);


    }

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }

}