<%@ WebHandler Language="C#" Class="Leica_action" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Collections;
using System.Collections.Generic;
using System.Text;

public class Leica_action : LeicaBase, IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {


        string type = context.Request.Params["type"];
        ///_lang = context.Request.Cookies["userLan"].Value;
        string json = "is empty";
        string inspect_qty = "0";
        if (type == "option")
        {
            string parent_id = context.Request.Params["parent_id"];
            if (!string.IsNullOrEmpty(parent_id))
            {
                json = getOption(parent_id);
            }
        }
        else if (type == "standard")
        {
            string stand_id = context.Request.Params["stand_id"];
            string sample = context.Request.Params["sample"];

            if (Utility.IsInteger(sample))
            {
                int iSample = int.Parse(sample);
                if (iSample > 0)
                {
                    json = getStandard(stand_id, sample);
                }
                else
                {
                    json = "0";
                }
            }

        }
        context.Response.ContentType = "application/json";
        context.Response.Write(json);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    public string getStandard(string stand_id, string qty)
    {
        string sql = string.Format(" select value from eipe.dbo.Leica_Standard where Standard_id='{0}' and  max>={1} and min<={1} ", stand_id, qty);
        string result = Utility.getSingle(sql);
        return result;
    }

    public string getOption(string parent_id)
    {
        string sql = string.Format(" select  l.rowid 'rowno' ,o.en ,o.tw ,o.def from eipe.dbo.leica_join  l left join eipe.dbo.Sys_Option o on l.item_id=o.rowid where l.parent_id='{0}' and o.display='1' order by en", parent_id);
        string lg = lang.ToString();
        List<Option> options = new List<Option>();
        using (SqlConnection con = new SqlConnection(Utility.ConnStr))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {
                Option o = new Option();
                o.selected = false;
                o.text = "select";
                o.value = "";
                options.Add(o);
            }

            while (rd.Read())
            {
                Option o = new Option();
                o.selected = (bool)rd["def"];
                o.text = rd[lg].ToString();
                o.value = rd["rowno"].ToString();

                options.Add(o);
            }

            con.Close();

        }
        JavaScriptSerializer js = new JavaScriptSerializer();
        string jsonData = Utility.toJson(options);
        return jsonData;
    }




}



public class Option
{

    public string text;
    public string value;
    public bool selected;

}