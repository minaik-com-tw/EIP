<%@ WebHandler Language="C#" Class="join_save" %>

using System;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Collections.Generic;

public class join_save : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {

        string parent_id = "", item_id = "";
        int status = 1;
        item_id = context.Request.Form["item_id"];
        parent_id = context.Request.Form["parent_id"];
        string child_tag = context.Request.Form["child_tag"];
        string user = context.Request.Form["user"];
        string action = context.Request.Form["action"];
        string[] list = string.IsNullOrEmpty(item_id) ? null : item_id.Split(',');

        //request.Method
        if (context.Request.HttpMethod == "GET")
        { }
        else if (context.Request.HttpMethod == "POST")
        {
            if (!string.IsNullOrEmpty(parent_id))
            {
                if (action == "del")
                {

                    if (!string.IsNullOrEmpty(item_id))
                    {
                        foreach (string item in list)
                        {

                            string sql = string.Format("select j.rowid from eipe.dbo.leica_join j  where  item_id='{0}' and parent_id='{1}' ", item,parent_id);

                            using (SqlConnection con = new SqlConnection(DBTransfer.Constr1))
                            {
                                con.Open();
                                SqlCommand cmd = new SqlCommand(sql, con);
                                SqlDataReader rd = cmd.ExecuteReader();
                                string previous = "";
                                while (rd.Read())
                                {
                                    previous = rd["rowid"].ToString();
                                    del_Next(previous);
                                }

                                string del = string.Format("delete from eipe.dbo.leica_join where rowid='{0}' ", item);
                                Utility.execDel(del);
                                con.Close();
                            }



                        }
                    }
                }
                if (action == "add")
                {
                    if (!string.IsNullOrEmpty(item_id))
                    {
                        foreach (string item in list)
                        {
                            string rowid = Guid.NewGuid().ToString();
                            StringBuilder sb = new StringBuilder();
                            sb.Append("INSERT INTO [EIPE].[dbo].[leica_join] ([rowid],[parent_id],[item_id],[modify_user],[modify_date])");
                            sb.AppendFormat("VALUES ( '{0}','{1}','{2}','{3}','{4}')", rowid, parent_id, item, user, DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));
                            Utility.SQL_Exec(sb.ToString());
                        }
                    }
                }
                status = 0; //新增成功
            }
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(status);

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }


    private void del_Next(string parent_id)
    {


        string sql = string.Format("select j.rowid from eipe.dbo.leica_join j  where  parent_id='{0}'", parent_id);

        using (SqlConnection con = new SqlConnection(DBTransfer.Constr1))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                string previous = rd["rowid"].ToString();
                del_Next(previous);
            }

            con.Close();

            string del = string.Format("delete from eipe.dbo.leica_join where rowid='{0}' ", parent_id);
            Utility.execDel(del);
        }

    }

}