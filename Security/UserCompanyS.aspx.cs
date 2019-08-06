namespace spc
{
    using SmoothEnterprise.Application.UI.WebControl;
    using SmoothEnterprise.Configuration.Constants;
    using SmoothEnterprise.Content.UI.WebControl;
    using SmoothEnterprise.Database;
    using SmoothEnterprise.Portal.UI.WebPart;
    using SmoothEnterprise.Security.Authorization;
    using SmoothEnterprise.Security.UI.WebControl;
    using SmoothEnterprise.Web;
    using SmoothEnterprise.Web.UI.HTMLControl;
    using SmoothEnterprise.Web.UI.WebControl;
    using System;
    using System.Data;
    using System.Web;
    using System.Web.Profile;
    using System.Web.SessionState;
    using System.Web.UI.WebControls;

    public partial class UserCompany : Page, IRequiresSessionState, IContentAuth, IReminder, IDataAuth
    {
        private string _authwhere = "";
        private string[] authtypes = new string[] { "50", "70", "90" };
        private string[] authtypesname = new string[] { "Department", "Under Department", "All" };
      /*  protected InputButton BUTTON_add;
        protected InputButton BUTTON_delete;
        protected InputButton BUTTON_query;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn chk;
        protected Descriptor ContentDescriptor;
        protected SmoothEnterprise.Web.UI.WebControl.DataList DataList1;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_category;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_effectdate;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_email;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_expiredate;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_gender;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_gid;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_icon;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_iconview;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_initdate;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_inituid;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_logonid;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_modifydate;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_modifyuid;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_name;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_name1;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_ustatus;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn DataList1_utype;
        protected SmoothEnterprise.Web.UI.WebControl.DataColumn edit;
        protected Label LABEL_accstatus;
        protected Label LABEL_category;
        protected Label LABEL_gid;
        protected Label LABEL_logonid;
        protected Label LABEL_name;
        protected SelectGroup QUERY_gid;
        protected InputText QUERY_logonid;
        protected InputText QUERY_name;
        protected SelectCode QUERY_ucategory;
        protected SelectCode QUERY_ustatus;*/

        public bool AllowBrowse()
        {
            return true;
        }

        public bool AllowEveryone()
        {
            return false;
        }

        protected void BUTTON_add_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("UserCompanyAdd.aspx");
        }

        protected void BUTTON_delete_Click(object sender, EventArgs e)
        {
            string str = "";
            string str2 = this.DataList1.ID + "_chk_";
            string str3 = this.DataList1.ID + "_key_";
            for (int i = 0; i < this.Page.Request.Form.Count; i++)
            {
                if (this.Page.Request.Form.AllKeys.GetValue(i).ToString().StartsWith(str2))
                {
                    if (str != "")
                    {
                        str = str + "&" + this.Page.Request.Form[str3 + this.Page.Request.Form.AllKeys.GetValue(i).ToString().Substring(str2.Length)].ToString();
                    }
                    else
                    {
                        str = str + this.Page.Request.Form[str3 + this.Page.Request.Form.AllKeys.GetValue(i).ToString().Substring(str2.Length)].ToString();
                    }
                }
            }
            base.Response.Redirect("UserDelete.aspx?" + str + "&multiple=1");
        }

        protected void BUTTON_query_Click(object sender, EventArgs e)
        {
            this.Query();
        }

        public int CompareAuthTypes(string authtype1, string authtype2)
        {
            return authtype1.CompareTo(authtype2);
        }

        protected void DataList1_OnRenderCell(object sender, DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, DataCell cell, EventArgs e)
        {
            try
            {
                if (column.ID == "edit")
                {
                    cell.LinkURL = "UserCompanyEdit.aspx?id=" + rs["id"].ToString();
                }
                if (column.ID == "DataList1_iconview")
                {
                    cell.LinkURL = "UserProfile.aspx?id=" + rs["id"].ToString();
                }
                if (column.ID == "chk")
                {
                    string str = "id" + cell.Rowno.ToString() + "=" + rs["id"].ToString();
                    cell.ClientID = this.DataList1.ID + "_chk_" + cell.Rowno.ToString();
                    cell.OutputHTML = "<input type=hidden id=\"" + this.DataList1.ID + "_key_" + cell.Rowno.ToString() + "\" name=\"" + this.DataList1.ID + "_key_" + cell.Rowno.ToString() + "\" value=\"" + str + "\">";
                }
                if (column.ID == "DataList1_icon")
                {
                    Image image = (Image) cell.Controls[1];
                    image.BorderWidth = Unit.Pixel(1);
                    image.ImageUrl = "UserImage.aspx?id=" + rs["id"].ToString();
                }
                if (column.ID == "DataList1_ustatus")
                {
                    if (rs["ustatus"].ToString() == UStatus.Enable.ToString())
                    {
                        cell.OutputHTML = "<center><img src='/lib/img/icon-config.gif'></center> ";
                    }
                    else if (rs["ustatus"].ToString() == UStatus.Pending.ToString())
                    {
                        cell.OutputHTML = "<center><img src='/lib/img/icon-lookmore.gif'></center> ";
                    }
                    else if (rs["ustatus"].ToString() == UStatus.ChangePassword.ToString())
                    {
                        cell.OutputHTML = "<center><img src='/lib/img/icon-new.gif'></center> ";
                    }
                    else if (rs["ustatus"].ToString() == UStatus.Disable.ToString())
                    {
                        cell.OutputHTML = "<center><img src='/lib/img/icon-lock.gif'></center> ";
                    }
                    else
                    {
                        cell.OutputHTML = "&nbsp;";
                    }
                }
                if (column.ID == "DataList1_gender")
                {
                    if (rs["gender"].ToString() == "M")
                    {
                        cell.OutputHTML = "<center><img src='" + base.ResolveUrl("~/security/img/icon-boy.gif") + "'></center> ";
                    }
                    else if (rs["gender"].ToString() == "F")
                    {
                        cell.OutputHTML = "<center><img src='" + base.ResolveUrl("~/security/img/icon-girl.gif") + "'></center> ";
                    }
                }
            }
            catch (Exception exception)
            {
                base.AddError(this, "", "", exception.Message);
            }
        }

        protected void DataList1_OnRenderRow(object sender, DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataRow row, EventArgs e)
        {
            this.DataList1.Columns.GetItem("dcustatus").DataType = DataColumnType.UserDefined;
        }

        public string DefaultAuthType()
        {
            return this.authtypes[0];
        }

        public string GetAuthName(string authtype)
        {
            string str = authtype;
            try
            {
                this.authtypesname = base.GetLocalResourceObject("Vs_authtypesname").ToString().Split(new char[] { ',' });
            }
            catch
            {
            }
            for (int i = 0; i < this.authtypes.Length; i++)
            {
                if (this.authtypes[i] == authtype)
                {
                    str = this.authtypesname[i];
                }
            }
            return str;
        }

        public string[] GetAuthTypes()
        {
            return this.authtypes;
        }

        public int GetReminderCount()
        {
            int num = 0;
            try
            {
                SmoothEnterprise.Database.DataSet set = new SmoothEnterprise.Database.DataSet();
                num = (int) set.ExecuteScalar(" SELECT COUNT(logonid) FROM dguser WHERE ustatus='" + UStatus.Pending.ToString() + "' ");
            }
            catch
            {
            }
            return num;
        }

        public string GetReminderText()
        {
            return "待審核使用者";
        }

        public string GetReminderURL()
        {
            return base.ResolveUrl("~/Security/UserCompany.aspx?ustatus=Pending");
        }

        public void GrantFor(string authtype)
        {
            string str = "";
            if (base.CurrentUser.IsLogin)
            {
                object obj2 = new SmoothEnterprise.Database.DataSet().ExecuteScalar("SELECT gid FROM dguser WHERE id='" + base.CurrentUser.ID + "'");
                if (obj2 == null)
                {
                    str = "";
                }
                str = (obj2 == null) ? "" : obj2.ToString();
            }
            string str2 = authtype;
            if (str2 != null)
            {
                if (!(str2 == "50"))
                {
                    if (!(str2 == "70"))
                    {
                        if (str2 == "90")
                        {
                            this.QUERY_gid.ItemAllDisplayed = true;
                            this.QUERY_gid.ItemNoneDisplayed = true;
                        }
                        return;
                    }
                }
                else
                {
                    if (str != "")
                    {
                        this.QUERY_gid.ExtendWhere = "id='" + str + "'";
                        this._authwhere = " A.gid IN(SELECT id FROM dggroup WHERE id='{" + str + "}' OR pids LIKE '%{" + str + "}%')";
                        return;
                    }
                    this.QUERY_gid.ItemNoneDisplayed = true;
                    this.QUERY_gid.ExtendWhere = "1=0";
                    this._authwhere = " A.id='" + base.CurrentUser.ID + "'";
                    return;
                }
                if (str != "")
                {
                    this.QUERY_gid.ItemAllDisplayed = true;
                    this.QUERY_gid.RootId = str;
                    this._authwhere = " A.gid IN(SELECT id FROM dggroup WHERE id='{" + str + "}' OR pids LIKE '%{" + str + "}%')";
                }
                else
                {
                    this.QUERY_gid.ItemNoneDisplayed = true;
                    this.QUERY_gid.ExtendWhere = "1=0";
                    this._authwhere = " A.id='" + base.CurrentUser.ID + "'";
                }
            }
        }

        public bool OnlyEveryone()
        {
            return false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                if (base.Request.QueryString["ustatus"] != null)
                {
                    this.QUERY_logonid.Text = "";
                    this.QUERY_name.Text = "";
                    this.QUERY_gid.Value = "";
                    this.QUERY_ucategory.Value = "";
                    this.QUERY_ustatus.Value = UStatus.Pending.ToString();
                }
                else
                {
                    if (!this.QUERY_logonid.Personalize && (base["QUERY_logonid"] != null))
                    {
                        this.QUERY_logonid.Text = base["QUERY_logonid"];
                    }
                    if (!this.QUERY_name.Personalize)
                    {
                        this.QUERY_name.Text = base["QUERY_name"];
                    }
                    if (!this.QUERY_gid.Personalize)
                    {
                        this.QUERY_gid.Value = base["QUERY_gid"];
                    }
                    if (!this.QUERY_ucategory.Personalize)
                    {
                        this.QUERY_ucategory.Value = base["QUERY_ucategory"];
                    }
                    if (!this.QUERY_ustatus.Personalize)
                    {
                        this.QUERY_ustatus.Value = (base["QUERY_ustatus"] == null) ? "" : base["QUERY_ustatus"];
                    }
                }
                this.Query();
            }
        }

        private void Query()
        {
            if (!this.QUERY_logonid.Personalize)
            {
                base["QUERY_logonid"] = this.QUERY_logonid.Text;
            }
            if (!this.QUERY_name.Personalize)
            {
                base["QUERY_name"] = this.QUERY_name.Text;
            }
            if (!this.QUERY_gid.Personalize)
            {
                base["QUERY_gid"] = this.QUERY_gid.Value;
            }
            if (!this.QUERY_ucategory.Personalize)
            {
                base["QUERY_ucategory"] = this.QUERY_ucategory.Value;
            }
            if (!this.QUERY_ustatus.Personalize)
            {
                base["QUERY_ustatus"] = this.QUERY_ustatus.Value;
            }
            string str = "";
            if (this.QUERY_logonid.Text != "")
            {
                if (str != "")
                {
                    str = str + " and";
                }
                str = str + " A.logonid like N'%" + this.QUERY_logonid.Text + "%'";
            }
            if (this.QUERY_name.Text != "")
            {
                if (str != "")
                {
                    str = str + " and";
                }
                str = str + " A.name like N'%" + this.QUERY_name.Text + "%'";
            }
            if (this.QUERY_gid.Value != "%")
            {
                if (str != "")
                {
                    str = str + " and";
                }
                if (this.QUERY_gid.Value != "")
                {
                    str = str + " A.gid = '" + this.QUERY_gid.Value + "'";
                }
                else
                {
                    str = str + " A.gid IS NULL";
                }
            }
            if (this.QUERY_ucategory.Value != "%")
            {
                if (str != "")
                {
                    str = str + " and";
                }
                if (this.QUERY_ucategory.Value != "")
                {
                    str = str + " A.ucategory = '" + this.QUERY_ucategory.Value + "'";
                }
                else
                {
                    str = str + " A.ucategory IS NULL";
                }
            }
            if (this.QUERY_ustatus.Value != "")
            {
                if (str != "")
                {
                    str = str + " and";
                }
                str = str + " A.ustatus = '" + this.QUERY_ustatus.Value + "'";
            }
            if (this._authwhere != "")
            {
                if (str != "")
                {
                    str = str + " and";
                }
                str = str + this._authwhere;
            }
            if (str != "")
            {
                str = " where" + str;
            }
            this.DataList1.SQL = " SELECT A.*,PG.name AS gid_name,DC.name AS ucategory_name,UTC.name AS utype_name,L.name AS layoutid_name,USC.name AS ustatus_name,IU.name AS inituid_name, MU.name AS modifyuid_name FROM dguser A LEFT OUTER JOIN dggroup PG ON A.gid = PG.id LEFT OUTER JOIN dgcode UTC ON UTC.ctype = 'utype' AND A.utype = UTC.id LEFT OUTER JOIN dglayout L ON A.layoutid = L.id LEFT OUTER JOIN dgcode USC ON USC.ctype = 'ustatus' AND A.ustatus = USC.id LEFT OUTER JOIN dgcode DC ON A.ucategory=DC.id LEFT OUTER JOIN dguser IU ON A.inituid = IU.id LEFT OUTER JOIN dguser MU ON A.modifyuid = MU.id " + str;
        }

      /*  protected HttpApplication ApplicationInstance
        {
            get
            {
                return this.Context.ApplicationInstance;
            }
        }

        protected DefaultProfile Profile
        {
            get
            {
                return (DefaultProfile) this.Context.Profile;
            }
        }
       */
    }
}

