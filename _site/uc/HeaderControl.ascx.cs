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
using System.IO;

namespace SmoothEnterprise.Web.Application.Layout
{
    public partial class HeaderControl : System.Web.UI.UserControl, SmoothEnterprise.Language.ILanguage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.BUTTON_search.Attributes["onclick"] = "location.href='" + this.ResolveUrl("~/content/search.aspx") + "?keyword='+escape(" + this.keyword.ClientID + ".value);";
            this.BUTTON_searchmore.Attributes["onclick"] = "location.href='" + this.ResolveUrl("~/content/searchmore.aspx") + "?keyword='+escape(" + this.keyword.ClientID + ".value);";
            this.BUTTON_search.Style["cursor"] = "pointer";
            this.BUTTON_searchmore.Style["cursor"] = "pointer";

            //this.menu_home.Attributes["linkurl"] = this.ResolveUrl("~/");
            //this.menu_addlink.Attributes["linkurl"] = this.ResolveUrl("~/") + "Portal/AddFavorite.aspx?linkurl=" + this.Request.Path;
            //this.menu_profile.Attributes["linkurl"] = this.ResolveUrl("~/") + "Security/MyProfile.aspx";
            //try
            //{
            //    string hp = Server.MapPath(this.ResolveUrl("~/") + "portal/default.aspx");
            //    this.menu_home.Attributes["linkurl"] = this.ResolveUrl("~/") + "portal/default.aspx";
            //    this.menu_news.Attributes["linkurl"] = this.ResolveUrl("~/") + "portal/mynews.aspx";
            //}
            //catch
            //{
            //}




            SmoothEnterprise.Web.User user = new SmoothEnterprise.Web.User();

            if (user.IsLogin)
            {

                login_info4.InnerHtml = "&nbsp;<img id='UserImage' src=\"" + this.ResolveUrl("~/") + "Security/UserImage.aspx?id=" + user.ID + "\" align=absmiddle border=1 height=20>&nbsp;" + this.GetLocalResourceObject("LABEL_Logininfo") + "&nbsp;<b>" + user.Name + "</b>";
                this.BUTTON_logout.Visible = true;
                this.BUTTON_logout.Attributes["onclick"] = "window.location='" + this.ResolveUrl("~/") + "security/logout.aspx?target=" + this.ResolveUrl("~/") + "';";

                //this.logout.InnerHtml = "<a href="+ this.ResolveUrl("~/") + "security/logout.aspx?target=" + this.ResolveUrl("~/") + ">" + this.GetLocalResourceObject("LABEL_logout") + "</a>";
                //this.menu_loginout.InnerHtml = "&nbsp;&nbsp;&nbsp;Logout";

                //this.menu_loginout.Attributes["linkurl"] = this.ResolveUrl("~/") + "security/logout.aspx?target=" + this.ResolveUrl("~/");
                //this.menu_home.Attributes["submenu"] = this.menu_mylinks.ClientID;

                //SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
                //ds.Open("SELECT * FROM dgfavorite WHERE uid='" + user.ID + "' ORDER BY seq");
                //while (!ds.EOF)
                //{
                //    System.Web.UI.HtmlControls.HtmlTableRow menurow = new System.Web.UI.HtmlControls.HtmlTableRow();
                //    System.Web.UI.HtmlControls.HtmlTableCell menucell = new System.Web.UI.HtmlControls.HtmlTableCell();
                //    menurow.Cells.Add(menucell);
                //    menucell = new System.Web.UI.HtmlControls.HtmlTableCell();
                //    menucell.Attributes["class"] = "menuitem";
                //    menucell.Attributes["height"] = "20";
                //    menucell.Attributes["linkurl"] = ds["linkurl"].ToString();
                //    menucell.InnerText = ds["description"].ToString();
                //    menurow.Cells.Add(menucell);
                //    menu_definedlinks.Rows.Add(menurow);
                //    ds.MoveNext();
                //}


            }
            else
            {
                //this.menu_loginout.InnerHtml = "&nbsp;&nbsp;&nbsp;Login";
                //this.menu_loginout.Attributes["linkurl"] = this.ResolveUrl("~/") + "security/login.aspx";
                //this.login_info1.Visible = false;
                //this.login_info2.Visible = false;
                this.login_info3.Visible = false;
                this.login_info4.Visible = false;
                this.BUTTON_logout.Visible = false;
                // this.BUTTON_logout.Visible = false; 
                logout();

            }
            //try
            //{
            //    string hp = Server.MapPath(this.ResolveUrl("~/") + "manager/sendquestion.aspx");
            //    string questionurl = this.ResolveUrl("~/") + "manager/sendquestion.aspx?url=" + Request.Url.LocalPath;
            //    if (Request.Url.Query != "")
            //        questionurl = questionurl + "&query=" + Request.Url.Query.Substring(1);
            //    if ((Request.Url.LocalPath.ToLower() == this.ResolveUrl("~/security/login.aspx").ToLower()) || (Request.Url.LocalPath.ToLower() == this.ResolveUrl("~/manager/sendquestion.aspx")))
            //        questionurl = this.ResolveUrl("~/manager/sendquestion.aspx");
            //    this.menu_sendquestion.Attributes["linkurl"] = questionurl;
            //}
            //catch (Exception ex)
            //{
            //    Response.Write(ex.Message);
            //}

            if (!IsPostBack)
            {
                //Response.Write("1");
                //if (Session["CurrentUICulture"] == null){
                if (Request.Cookies["userLan"] != null)
                {
                    //Response.Write("2");
                    this.FIELD_language.Value = Server.HtmlEncode(Request.Cookies["userLan"].Value);
                    Session["CurrentUICulture"] = this.FIELD_language.Value;
                    Request.UserLanguages[0] = this.FIELD_language.Value;
                }
                else
                {
                    this.FIELD_language.Value = Request.UserLanguages[0].ToString();
                }
                //Response.Write(Server.HtmlEncode(Request.Cookies["userLan"].Value));
                // }else{
                //    this.FIELD_language.Value = Session["CurrentUICulture"].ToString();
                //} 

                //***************add by carol 20190605********************/
                string path = Request.FilePath;

                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    string sql = string.Format("select g.ver from eipa.dbo.dgcontent t left join eipa.dbo.dgcategory g on  t.catid=g.id where linkurl = '{0}'", path);

                    rs.Open(sql);

                    if (!rs.EOF)
                    {
                        if (!string.IsNullOrEmpty(rs["ver"].ToString()))
                        {
                            app_version.Value = string.Format("V{0}", rs["ver"].ToString());
                        }

                    }
                }

            }

            /*if (Path.GetFileName(Request.FilePath).ToUpper() == "LOGIN.ASPX")
                this.FIELD_language.Visible = true;
            else
                this.FIELD_language.Visible = false;*/


            //this.date_info.InnerHtml = System.DateTime.Today.ToLongDateString();
        }

        /// <summary>
        /// Add carol 2017/0418 ,authorization failed to the user is logout .
        /// </summary>
        private void logout()
        {
            string userIP = Request.UserHostAddress.ToString();
            string Url = Request.CurrentExecutionFilePath;
            string Param = Request.Url.Query;
            string Login = "/security/login.aspx";


            if (Url != Login)
            {
                //log(string.Format("user={0} url={1}",userIP,Request.Url.AbsoluteUri));

                if (!string.IsNullOrEmpty(Param))
                {
                    Login += Param;
                }

                Response.Redirect(Login);
            }
        }

        protected void searchbtn_ServerClick(object sender, EventArgs e)
        {
            Page.Response.Redirect("~/content/search.aspx?keyword=" + this.keyword.Value);
        }

        protected void searchmorebtn_ServerClick(object sender, EventArgs e)
        {
            Page.Response.Redirect("~/content/searchmore.aspx?keyword=" + this.keyword.Value);
        }

        #region ILanguage Members

        public System.Reflection.Assembly ResourceAssembly
        {
            get
            {
                return SmoothEnterprise.Utility.Type.GetType("SmoothEnterprise.Web.Application.UC.header").Assembly;
            }
        }

        public void ResourceMapping(System.Resources.ResourceManager rm)
        {
            try
            {
                //try
                //{
                //    this.title_personal.InnerHtml = rm.GetString("titlePersonal");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.title_general.InnerHtml = rm.GetString("titleGeneral");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.title_browser.InnerHtml = rm.GetString("titleBrowser");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.title_support.InnerHtml = rm.GetString("titleSupport");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.title_about.InnerHtml = rm.GetString("titleAbout");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.MenuMy.InnerHtml = "&nbsp;&nbsp;" + rm.GetString("menuMy");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.MenuOption.InnerHtml = "&nbsp;&nbsp;" + rm.GetString("menuOption");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.MenuHelp.InnerHtml = "&nbsp;&nbsp;" + rm.GetString("menuHelp");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.menu_home.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuHome");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.menu_profile.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuProfile");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.menu_personalize.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuPersonalize");
                //    this.menu_personalize.Disabled = true;
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.menu_news.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuNews");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.menu_sethome.InnerHtml = "<span onclick=\"this.style.behavior='url(#default#homepage)';this.setHomePage(location.href)\">&nbsp;&nbsp;&nbsp;" + rm.GetString("menuSethome") + "<span>";
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.menu_setfavorite.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuSetfavorite");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.menu_helps.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuHelp");
                //    this.menu_helps.Disabled = true;
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.menu_sendquestion.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuSendquestion");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.menu_product.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuProduct");
                //}
                //catch
                //{
                //}
                //try
                //{
                //    this.menu_dgweb.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuDgweb");
                //}
                //catch
                //{
                //}
                //SmoothEnterprise.Web.User user = new SmoothEnterprise.Web.User();
                //if (user.IsLogin)
                //{
                //    this.menu_loginout.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuLogout");
                //    SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
                //    //if (ds.ExecuteScalar("SELECT COUNT(*) FROM dguser WHERE id='" + user.ID + "' AND icon IS NOT NULL") > 0)
                //    login_info4.InnerHtml = "&nbsp;<img src=\"" + this.ResolveUrl("~/") + "Security/UserImage.aspx?id=" + user.ID + "\" align=absmiddle border=1 height=20>&nbsp;" + rm.GetString("txtLogininfo") + "&nbsp;<b>" + user.Name + "</b>";
                //    //else
                //    //  login_info4.InnerHtml = "&nbsp;&nbsp;&nbsp;<img src=\"/lib/img/icon-info.gif\" align=absmiddle border=0 hspace=5>" + rm.GetString("txtLogininfo") + "&nbsp;<b>" + user.Name + "</b>";
                //}
                //else
                //{
                //    this.menu_loginout.InnerHtml = "&nbsp;&nbsp;&nbsp;" + rm.GetString("menuLogin");
                //}
            }
            catch (Exception ex)
            {
                Response.Write("SmoothEnterprise.Web.Application.UC.header::" + ex.Message + "<br>");
            }
        }

        public string ResourceName
        {
            get
            {
                return "SmoothEnterprise.Web.Application.Resources";
            }
        }

        #endregion

        protected void BUTTON_logout_Click(object sender, EventArgs e)
        {
            //HttpContext.Current.Response.Cache.SetNoStore();
            Response.Redirect("/security/logout.aspx?target=" + this.ResolveUrl("~/"));

        }
        protected void FIELD_language_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Response.Cookies["userLan"].Value = FIELD_language.Value; 
            HttpCookie cookie = new HttpCookie("userLan");
            cookie.Value = FIELD_language.Value;
            cookie.Expires = DateTime.Now.AddMonths(12);
            this.Response.Cookies.Add(cookie);

            BUTTON_logout.Text = this.GetLocalResourceObject("BUTTON_logoutResource1.text").ToString();
            //Response.Write(FIELD_language.Value);     

        }

        public void log(string txt)
        {

            string Dt = DateTime.Now.ToString("yyyyMMdd");

            string show = string.Format("[" + DateTime.Now + "]{0}\r\n", txt);
            File.AppendAllText(@"D:\test\" + Dt + "_logout.txt", show);
        }
    }
}
