<%@ WebHandler Language="C#" Debug="true" Class="ShowImage" %>

using System;
using System.Web;
using System.IO;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;


public class ShowImage : IHttpHandler
{

    private int SetW = 100;     //�w�]�Ϥ����j�p
    private double w = 0, h = 0;

    public void ProcessRequest(HttpContext context)
    {
        string type = context.Request["type"];
        if (type == "s")
        {

            SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
            {
                string attach = context.Request["attach"];
                string sql = "select * from eipe.dbo.ipqc_Ra_Lab_position where rowid='" + attach + "'";

                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Byte[] PhotoImage = (Byte[])dr["file_attach"];

                    using (System.IO.MemoryStream ms = new System.IO.MemoryStream(PhotoImage))
                    {
                        System.Drawing.Image img = System.Drawing.Image.FromStream(ms);
                        ms.Flush();
                        //�ηs�� Size ���s���
                        System.Drawing.Image thumb = new Bitmap(img, 250, 250);

                        //�N�Ϥ��s�_��
                        thumb.Save(context.Response.OutputStream, img.RawFormat);

                        context.Response.ContentType = Convert.ToString(img.RawFormat);
                    }
                }
            }
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