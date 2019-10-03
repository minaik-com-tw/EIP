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

        if (type == "reload")
        {
            string kind = context.Request.Params["kind"];
            string product = context.Request.Params["product"];
            string program = context.Request.Params["program"];
            string ts = context.Request.Params["ts"];
            string tssd = context.Request.Params["tssd"];

            List<OPs> os = GetReload(kind, product, program, ts, tssd);
            json= Utility.toJson(os);
        }
        if (type == "option")
        {
            string parent_id = context.Request.Params["parent_id"];

            if (!string.IsNullOrEmpty(parent_id))
            {
                List<Option> o = getOption(parent_id, null);
                json= Utility.toJson(o);

            }
        }

        if (type == "standard")
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

    public List<Option> getOption(string parent_id, string next_selected)
    {
        string sql = string.Format(" select  l.rowid 'rowno' ,o.en ,o.tw ,o.def from eipe.dbo.leica_join  l left join eipe.dbo.Sys_Option o on l.item_id=o.rowid where l.parent_id='{0}' and o.display='1' order by en", parent_id);
        string lg = lang.ToString();
        List<Option> options = new List<Option>();
        using (SqlConnection con = new SqlConnection(Utility.ConnStr))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader rd = cmd.ExecuteReader();

            Option o = new Option();
            o.selected = false;
            o.text = "select";
            o.value = "";
            options.Add(o);

            while (rd.Read())
            {
                o = new Option();
                o.selected = false;
                if (!string.IsNullOrEmpty(next_selected))
                {
                    o.selected = next_selected == rd["rowno"].ToString() ? true : false;
                }

                o.text = rd[lg].ToString();
                o.value = rd["rowno"].ToString();

                options.Add(o);
            } 
            con.Close(); 
        } 
        return options;
    }

    private List<OPs> GetReload(string kind, string product, string program, string ts, string tssd)
    {
        List<OPs> l = new List<OPs>();

        if (!string.IsNullOrEmpty(kind) && !string.IsNullOrEmpty(product))
        {
            OPs k = new OPs();
            k.name = "kind";
            k.op = getOption(kind, product);
            l.Add(k);
        }

        if (!string.IsNullOrEmpty(product) && !string.IsNullOrEmpty(program))
        {
            OPs pd = new OPs();
            pd.name = "product";
            pd.op = getOption(product, program);
            l.Add(pd);
        }

        if (!string.IsNullOrEmpty(program) && !string.IsNullOrEmpty(ts))
        {
            OPs pg = new OPs();
            pg.name = "program";
            pg.op = getOption(program, ts);
            l.Add(pg);
        }

        if (!string.IsNullOrEmpty(ts) && !string.IsNullOrEmpty(tssd))
        {
            OPs t = new OPs();
            t.name = "test";
            t.op = getOption(ts, tssd);
            l.Add(t);
        } 
        return l.Count > 0 ? l : null;

    } 
}



public class Option
{

    public string text;
    public string value;
    public bool selected;

}

public class OPs
{
    public string name;
    public List<Option> op;
}
