




namespace SmoothEnterprise.Web.Application.Security
{
    using SmoothEnterprise.Application.UI.WebControl;
    using SmoothEnterprise.Configuration.Constants;
    using SmoothEnterprise.Content.UI.WebControl;
    using SmoothEnterprise.Database;
    using SmoothEnterprise.Security;
    using SmoothEnterprise.Security.Authorization;
    using SmoothEnterprise.Utility;
    using SmoothEnterprise.Web;
    using SmoothEnterprise.Web.UI.HTMLControl;
    using System;
    using System.Text.RegularExpressions;
    using System.Web;
    using System.Web.Configuration;
    using System.Web.Profile;
    using System.Web.SessionState;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ChangePassword : Page, IRequiresSessionState, IContentAuth
    {
       
        
        /*protected InputButton BUTTON_cancel;
        protected InputButton BUTTON_save;
        protected Descriptor ContentDescriptor;
        protected InputText FIELD_id;
        protected InputText FIELD_opwd;
        protected InputText FIELD_pwd;
        protected InputText FIELD_pwd_confirm;
        protected InputText FIELD_pwdanswer;
        protected SelectCode FIELD_pwdhintid;
        protected InputText FIELD_ustatus;
        protected Label LABEL_pwd;
        protected Label LABEL_pwd_confirm;
        protected Label LABEL_pwdanswer;
        protected Label LABEL_pwdhint;
        protected HtmlTable TABLE1;
        protected CompareValidator V_FIELD_opwd;
        protected CompareValidator V_FIELD_pwd_confirm; */

        public bool AllowBrowse()
        {
            return true;
        }

        public bool AllowEveryone()
        {
            return true;
        }

        protected void BUTTON_cancel_Click(object sender, EventArgs e)
        {
            base.Response.Redirect(((base.BackPageUrl == "") || (base.BackPageUrl.ToLower().IndexOf("security/login.aspx") >= 0)) ? "Logout.aspx" : base.BackPageUrl);
        }

        protected void BUTTON_save_Click(object sender, EventArgs e)
        {
            
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs.Open("SELECT * FROM dguser WHERE id='" + this.FIELD_id.Text + "'");
            if (!rs.EOF)
            {
               
                rs["pwd"] = Encryption.Encode(this.FIELD_pwd.Text);
                 
              if (this.FIELD_pwdhintid.Value != "")
                {
                    rs["pwdhintid"] = new Guid(this.FIELD_pwdhintid.Value);
                }
                else
                {
                    rs["pwdhintid"] = DBNull.Value;
                }
                if (this.FIELD_pwdanswer.Text != "")
                {
                    rs["pwdanswer"] = Utility.Encryptor(this.FIELD_pwdanswer.Text);
                }
                else
                {
                    rs["pwdanswer"] = DBNull.Value;
                }
                /* if (new Guid(this.FIELD_ustatus.Text) == UStatus.ChangePassword)
                {
                    rs["ustatus"] = UStatus.Enable;
                }*/
                 if (base.CurrentUser.IsLogin)
                {
                    rs["modifyuid"] = new Guid(base.CurrentUser.ID);
                }
               rs["ustatus"] = "57DADAB8-44CF-4BAA-A40C-324F9F4533A9";
                rs["modifydate"] = DateTime.Now;
                rs.Update();
            }
            rs.Close();

            base.Response.Redirect(((base.BackPageUrl == "") || (base.BackPageUrl.ToLower().IndexOf("security/login.aspx") >= 0)) ? "Logout.aspx" : base.BackPageUrl);
 
            
            /*if (base.IsValid)
            {
                try
                {
                    Regex regex;
                    if (WebConfigurationManager.AppSettings["PasswordCondition"] != null)
                    {
                        regex = new Regex(WebConfigurationManager.AppSettings["PasswordCondition"]);
                    }
                    else
                    {
                        regex = new Regex("");
                    }
                    if (regex.IsMatch(this.FIELD_pwd.Text))
                    {
                        bool flag = false;
                        DataSet set = new DataSet(DataSetType.OpenRead);
                        int result = 0;
                        try
                        {
                            int.TryParse(WebConfigurationManager.AppSettings["PasswordReuseCount"], out result);
                        }
                        catch
                        {
                            result = 0;
                        }
                        set.Open("select top " + result.ToString() + " logresult from dguserlog where ulogtype='" + ULogType.ChgPwd.ToString() + "' and logresult like '%ChangePassword:%' and uid='" + this.FIELD_id.Text + "' order by logondate desc");
                        while (!set.EOF)
                        {
                            if (Encryption.Decode(set["logresult"].ToString().Replace("ChangePassword:", "")).Split(new char[] { ',' })[1] == this.FIELD_pwd.Text)
                            {
                                flag = true;
                            }
                            set.MoveNext();
                        }
                        if (!flag)
                        {
                            DataSet set2 = new DataSet(DataSetType.OpenUpdate);
                            set2.Open("SELECT * FROM dguser WHERE id='" + this.FIELD_id.Text + "'; ");
                            if (this.FIELD_pwd.Text != "")
                            {
                                set2["pwd"] = Encryption.Encode(this.FIELD_pwd.Text);
                            }
                            if (this.FIELD_pwdhintid.Value != "")
                            {
                                set2["pwdhintid"] = new Guid(this.FIELD_pwdhintid.Value);
                            }
                            else
                            {
                                set2["pwdhintid"] = DBNull.Value;
                            }
                            if (this.FIELD_pwdanswer.Text != "")
                            {
                                set2["pwdanswer"] = Utility.Encryptor(this.FIELD_pwdanswer.Text);
                            }
                            else
                            {
                                set2["pwdanswer"] = DBNull.Value;
                            }
                            if (new Guid(this.FIELD_ustatus.Text) == UStatus.ChangePassword)
                            {
                                set2["ustatus"] = UStatus.Enable;
                            }
                            if (base.CurrentUser.IsLogin)
                            {
                                set2["modifyuid"] = new Guid(base.CurrentUser.ID);
                            }
                            set2["modifydate"] = DateTime.Now;
                            set2.Update();
                            set2.Close();
                            Utility.UserLogAdd(base.Request, this.FIELD_id.Text, ULogType.ChgPwd.ToString(), "ChangePassword:" + Encryption.Encode(this.FIELD_opwd.Text + "," + this.FIELD_pwd.Text));
                            if (!(new Guid(this.FIELD_ustatus.Text) == UStatus.ChangePassword))
                            {
                                this.BUTTON_cancel_Click(sender, e);
                            }
                        }
                        else
                        {
                            this.FIELD_pwd.Text = "";
                            this.FIELD_pwd_confirm.Text = "";
                            base.AddError(this, "BUTTON_save_Click", "", base.GetLocalResourceObject("PasswordCannotuseMessageResource1").ToString().Replace("#reusecount#", result.ToString()));
                        }
                    }
                    else
                    {
                        this.FIELD_pwd.Text = "";
                        this.FIELD_pwd_confirm.Text = "";
                        base.AddError(this, "BUTTON_save_Click", "", base.GetLocalResourceObject("PasswordConditionMessageResource1").ToString());
                    }
                }
                catch (Exception exception)
                {
                    base.AddError(this, "BUTTON_save_Click", "", exception.Message);
                }
            }*/
        }

        public bool OnlyEveryone()
        {
            return false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AccTxt.Text = this.CurrentUser.LogonID;

            }
          this.FIELD_id.Text = (base.Request.QueryString["id"] == null) ? "" : base.Request.QueryString["id"];
            /* if (base.CurrentUser.IsLogin)
             {
                this.FIELD_id.Text = base.CurrentUser.ID;
                this.ContentDescriptor.IconURL = "UserImage.aspx?id=" + this.FIELD_id.Text + "&photo=1";
                this.ContentDescriptor.IconHeight = Unit.Pixel(40);
                if (!base.IsPostBack)
                {
                    DataSet set = new DataSet(DataSetType.OpenRead);
                    set.Open(" SELECT * FROM dguser WHERE id='" + this.FIELD_id.Text + "'; ");
                    if (!set.EOF)
                    {
                        this.FIELD_opwd.Text = Encryption.Decode(set["pwd"].ToString());
                        this.FIELD_ustatus.Text = set["ustatus"].ToString();
                        this.FIELD_pwdhintid.Value = set["pwdhintid"].ToString();
                        this.FIELD_pwdanswer.Text = Utility.Decryptor(set["pwdanswer"].ToString());
                    }
                }
            }
            if (base.Request.QueryString["id"] != null)
            {
                new Authentication().Logoff(AuthMode.amWebSmooth);
            }
            this.FIELD_pwd.Attributes.Add("onChange", this.FIELD_pwd_confirm.ClientID + ".Text='';");
        
            */
   }

       /* protected HttpApplication ApplicationInstance
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
        }*/
    }
}

