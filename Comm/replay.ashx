<%@ WebHandler Language="C#" Class="replay" %>

using System;
using System.Web;

public class replay : IHttpHandler
{
    /*通用於各個需要使用回應的資料，type 為類別
    以type為分類 去處理傳入的資料
    */
    public void ProcessRequest(HttpContext context)
    {

        string type = context.Request["type"];

        if (type == "user")
        {
            string uid = context.Request["uid"];
                string obj= context.Request["obj"];
            string result = "{\"error\" :\"uid is error\"}";

            if (!string.IsNullOrEmpty(uid))
            {
                string name = Utility.GetUName(uid).Trim();

                if (name == null)
                {
                    result = "{\"error\" :\"uid is not find\"}";
                }
                else
                {
                        //obj= 元件名稱
                    result = "{\"name\" :\"" + name + "\",\"obj\":\""+obj+"\" }";
                }
            }


            //context.Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(result));
            context.Response.Write(result);

            context.Response.ContentType = "application/json"; //回傳json
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