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

namespace SmoothEnterprise.Web.Application.Layout
{
    public partial class FooterControl : System.Web.UI.UserControl
    {
        protected DateTime _second = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.menu_home.Attributes["linkurl"] = this.ResolveUrl("~/");
            this.menu_addlink.Attributes["linkurl"] = this.ResolveUrl("~/") + "Portal/AddFavorite.aspx?linkurl=" + this.Request.Path;
            this.menu_profile.Attributes["linkurl"] = this.ResolveUrl("~/") + "Security/MyProfile.aspx";
            try
            {
                string hp = Server.MapPath(this.ResolveUrl("~/") + "portal/default.aspx");
                this.menu_home.Attributes["linkurl"] = this.ResolveUrl("~/") + "portal/default.aspx";
                this.menu_news.Attributes["linkurl"] = this.ResolveUrl("~/") + "portal/mynews.aspx";
            }
            catch
            {
            }
            SmoothEnterprise.Web.User user = new SmoothEnterprise.Web.User();
            if (user.IsLogin)
            {
                this.menu_loginout.InnerHtml = "&nbsp;&nbsp;&nbsp;" + this.GetLocalResourceObject("LABEL_logout");

                this.menu_loginout.Attributes["linkurl"] = this.ResolveUrl("~/") + "security/logout.aspx?target=" + this.ResolveUrl("~/");
                this.menu_home.Attributes["submenu"] = this.menu_mylinks.ClientID;

                SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
                ds.Open("SELECT * FROM dgfavorite WHERE uid='" + user.ID + "' ORDER BY seq");
                while (!ds.EOF)
                {
                    System.Web.UI.HtmlControls.HtmlTableRow menurow = new System.Web.UI.HtmlControls.HtmlTableRow();
                    System.Web.UI.HtmlControls.HtmlTableCell menucell = new System.Web.UI.HtmlControls.HtmlTableCell();
                    menurow.Cells.Add(menucell);
                    menucell = new System.Web.UI.HtmlControls.HtmlTableCell();
                    menucell.Attributes["Class"] = "MenuItem";
                    menucell.Attributes["Height"] = "20";
                    menucell.Attributes["LinkUrl"] = ds["linkurl"].ToString();
                    //menucell.Attributes["NOWRAP"] = "NOWRAP";
                    menucell.InnerText = ds["description"].ToString();
                    menurow.Cells.Add(menucell);
                    menu_definedlinks.Rows.Add(menurow);
                    ds.MoveNext();
                }
            }
            else
            {
                this.menu_loginout.InnerHtml = "&nbsp;&nbsp;&nbsp;" + this.GetLocalResourceObject("LABEL_login");
                this.menu_loginout.Attributes["linkurl"] = this.ResolveUrl("~/") + "security/login.aspx?target=/";
            }
            try
            {
                string hp = Server.MapPath(this.ResolveUrl("~/") + "manager/sendquestion.aspx");
                string questionurl = this.ResolveUrl("~/") + "manager/sendquestion.aspx?url=" + Request.Url.LocalPath;
                if (Request.Url.Query != "")
                    questionurl = questionurl + "&query=" + Request.Url.Query.Substring(1);
                if ((Request.Url.LocalPath.ToLower() == this.ResolveUrl("~/security/login.aspx").ToLower()) || (Request.Url.LocalPath.ToLower() == this.ResolveUrl("~/manager/sendquestion.aspx")))
                    questionurl = this.ResolveUrl("~/manager/sendquestion.aspx");
                this.menu_sendquestion.Attributes["linkurl"] = questionurl;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            try
            {
                SmoothEnterprise.Utility.Registry Key = new SmoothEnterprise.Utility.Registry();
                ver_info.InnerHtml = "EIP for Microsoft .NET Framework 2.0 ,瀏覽器最適版本IE7,建議最佳解析度為1024*768或以上";// "RELEASE 2.1.00 --  Design by MAT MIS Department";
                //ver_info.InnerHtml = "2.1.00  Design by MAT MIS Department";
            }
            catch (Exception ex)
            {
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.ver_second.InnerHtml = ((TimeSpan)(DateTime.Now - this._second)).TotalSeconds.ToString("N5")+"s";
        }
    }
}
