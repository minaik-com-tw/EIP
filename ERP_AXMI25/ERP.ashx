<%@ WebHandler Language="C#" Class="ERP" Debug="true" %>

using System;
using System.Web;
using System.IO;

public class ERP : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {

            string filePath = @"\\192.168.0.250\XML";
            string filePath2 = @"\\192.168.0.250\XML_Back";
            string xml = context.Request.QueryString["xml"];
            
                 //req.Append("<b>" + Request.PhysicalPath + "</b>");
            string fileNmae;
                  /*
            if (Directory.Exists(filePath))
            {
                string[] files = Directory.GetFiles(filePath, "*.xml");

                if (!string.IsNullOrEmpty(xml))
                {
                    foreach (string file in files)
                    {
                        context.Response.Write(file + "<br>");
                        string fName = Path.GetFileName(file);

                        if (fName == xml)
                        {
                            string copyf = Path.Combine(filePath2, fName);

                            File.Copy(file, copyf);
                            context.Response.Write("cofy:" + copyf + "<br>");
                            File.Delete(file);
                            context.Response.Write("delete: " + file + "<br>");
                            break;
                        }
                    }
                }

            }
            else
            {
                context.Response.Write(" NOT LOGIN <br>");
            }
            */
        }
        catch (Exception ex)
        {
            context.Response.Write(ex.Message);
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