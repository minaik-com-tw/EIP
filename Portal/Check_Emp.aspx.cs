using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Diagnostics;
using System.ServiceProcess;


public partial class Check_Emp : SmoothEnterprise.Web.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*try
        {

            if (!Page.IsPostBack)
            {
                int n;
                string a = this.CurrentUser.LogonID.ToString();

                if (string.IsNullOrEmpty(a) == false)
                {

                    if (int.TryParse(a, out n))
                    {
                        Response.Write("為作業員");
                        Response.Redirect("/EMP_ADD/EMP_ADD.aspx");

                    }
                    else
                    {
                        if (a.Substring(0, 1).ToString() == "J")
                        {
                            //為Amo人員
                            Response.Write("為Amo人員");
                            Response.Redirect("/Portal/Default.aspx");

                        }
                        else if (int.TryParse(a.Substring(1, 2), out n))
                        {
                            //為外勞
                            Response.Write("為外勞");
                            Response.Redirect("/EMP_ADD/EMP_ADD.aspx");
                        }
                        else
                        {
                            spyprocess(a);
                            
                            //為有mail的人
                            
                            Response.Write("為有mail的人");
                            Response.Redirect("/Portal/Default.aspx");
                            
                        }
                    }


                }
                else
                {
                    
                    Response.Redirect("/Security/Login.aspx?target=/");

                }

            }
            else
            {
                Response.Redirect("/Portal/Default.aspx");

            }
        }
        catch
        {


        }
        */
        Response.Write("check_emp");
        Response.Redirect("/Portal/Default.aspx");
    }

    private void spyprocess(string a)
    {
        //string ips = Request.ServerVariables["REMOTE_ADDR"].ToString();
        //DBTransfer fg = new DBTransfer();
        //string caption = ips;
        //string sql = "insert into spyder_log(caption,inidate,iniuser) values ('" + caption + "',getdate(),'" + this.CurrentUser.ID + "')";
         
        //// Response.Write(sql);
        //fg.RunIUSql(sql);

 
    }
}