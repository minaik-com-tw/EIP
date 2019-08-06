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
    public partial class Template1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string CategoryURL = new SmoothEnterprise.Configuration.Parameter().CategoryURL;
                if (CategoryURL != "")
                    this.CategoryPath1.CategoryURL = CategoryURL;
            }
            catch { }
        }
    }
}
