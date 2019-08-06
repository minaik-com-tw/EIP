namespace SPC
{
    using SmoothEnterprise.Application.UI.WebControl;
    using SmoothEnterprise.Configuration.Constants;
    using SmoothEnterprise.Content.UI.WebControl;
    using SmoothEnterprise.Database;
    using SmoothEnterprise.Security.Authorization;
    using SmoothEnterprise.Security.UI.WebControl;
    using SmoothEnterprise.Utility;
    using SmoothEnterprise.Web;
    using SmoothEnterprise.Web.UI;
    using SmoothEnterprise.Web.UI.HTMLControl;
    using SmoothEnterprise.Web.UI.WebControl;
    using System;
    using System.Text.RegularExpressions;
    using System.Web;
    using System.Web.Configuration;
    using System.Web.Profile;
    using System.Web.SessionState;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    using System.IO;
    using System.Xml;
    using System.Net;
    using System.Threading;

    public  partial class UserCompanyEdit : Page, IRequiresSessionState, IContentAuth, IDataAuth
    {
        private string[] authtypes = new string[] { "50", "70", "90" };
        private string[] authtypesname = new string[] { "Department", "Under Department", "All" };

        private string ftpip = "ftp.minaik.com.tw";
        private string username = "maeipmanager";
        private string password = "administrator";

        /*protected InputButton BUTTON_back;
        protected InputButton BUTTON_delete;
        protected InputButton BUTTON_save;
        protected Descriptor ContentDescriptor;
        protected InputText FIELD_effectdate;
        protected InputText FIELD_email;
        protected InputText FIELD_expiredate;
        protected RadioButtonList FIELD_gender;
        protected SelectGroup FIELD_gid;
        protected InputText FIELD_logonid;
        protected InputText FIELD_name;
        protected InputText FIELD_name1;
        protected InputText FIELD_opwd;
        protected InputFile FIELD_photo;
        protected InputText FIELD_pwd;
        protected InputText FIELD_pwd_confirm;
        protected InputText FIELD_remark;
        protected MultiSelect FIELD_role;
        protected SelectCode FIELD_ucategory;
        protected InputText FIELD_userdomain;
        protected SelectCode FIELD_ustatus;
        protected SelectCode FIELD_utype;
        protected Label LABEL_effectdate;
        protected Label LABEL_email;
        protected Label LABEL_expiredate;
        protected Label LABEL_gender;
        protected Label LABEL_gid;
        protected Label LABEL_logonid;
        protected Label LABEL_name;
        protected Label LABEL_name1;
        protected Label LABEL_photo;
        protected Label LABEL_pwd;
        protected Label LABEL_pwd_confirm;
        protected Label LABEL_remark;
        protected Label LABEL_role;
        protected Label LABEL_ucategory;
        protected Label LABEL_userdomain;
        protected Label LABEL_ustatus;
        protected Label LABEL_utype;
        protected HtmlImage PREVIEW_photo;
        protected HtmlGenericControl tabtitle_Account;
        protected HtmlGenericControl tabtitle_Information;
        protected HtmlTable TB_detail;
        protected HtmlTableRow TRFIELD_pwd;
        protected HtmlTableRow TRFIELD_pwd_confirm;
        protected HtmlTableRow TRFIELD_userdomain;
        protected HtmlTableRow TRLABEL_pwd;
        protected HtmlTableRow TRLABEL_pwd_confirm;
        protected HtmlTableRow TRLABEL_userdomain;
        protected CompareValidator V_FIELD_pwd;*/

        public bool AllowBrowse()
        {
            return false;
        }

        public bool AllowEveryone()
        {
            return false;
        }

        protected void BUTTON_back_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("UserCompany.aspx");
        }

        protected void BUTTON_delete_Click(object sender, EventArgs e)
        {
           // base.Response.Redirect("UserDelete.aspx?id=" + base.Request.QueryString["id"]);
        }

        protected void BUTTON_save_Click(object sender, EventArgs e)
        {
            if (base.IsValid)
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
                    if (regex.IsMatch((this.FIELD_pwd.Text != this.FIELD_opwd.Text) ? this.FIELD_pwd.Text : Encryption.Decode(this.FIELD_pwd.Text)))
                    {
                        DataSet set = new DataSet(DataSetType.OpenUpdate);
                        set.Open("select * from dguser where id='" + base.Request.QueryString["id"] + "'");
                        if (!set.EOF)
                        {
                            if (this.FIELD_utype.Value != "")
                            {
                                set["utype"] = new Guid(this.FIELD_utype.Value);
                            }
                            else
                            {
                                set["utype"] = DBNull.Value;
                            }
                            if (this.FIELD_logonid.Text != "")
                            {
                                set["logonid"] = this.FIELD_logonid.Text;
                            }
                            else
                            {
                                set["logonid"] = DBNull.Value;
                            }
                            if (this.FIELD_name.Text != "")
                            {
                                set["name"] = this.FIELD_name.Text;
                            }
                            else
                            {
                                set["name"] = DBNull.Value;
                            }
                            if (this.FIELD_name1.Text != "")
                            {
                                set["name1"] = this.FIELD_name1.Text;
                            }
                            else
                            {
                                set["name1"] = DBNull.Value;
                            }
                            if (this.FIELD_photo.FileBytes.Length > 0)
                            {
                                set["icon"] = new Thumbneil(this.FIELD_photo.FileBytes, 0, 30).OutputBytes();
                            }
                            if (this.FIELD_pwd.Text != "")
                            {
                                if (this.FIELD_pwd.Text != this.FIELD_opwd.Text)
                                {
                                    set["pwd"] = Encryption.Encode(this.FIELD_pwd.Text);
                                }
                            }
                            else
                            {
                                set["pwd"] = DBNull.Value;
                            }
                            if (this.FIELD_email.Text != "")
                            {
                                set["email"] = this.FIELD_email.Text;
                            }
                            else
                            {
                                set["email"] = DBNull.Value;
                            }
                            if (this.FIELD_gender.SelectedValue.ToString() != "")
                            {
                                set["gender"] = this.FIELD_gender.SelectedValue.ToString();
                            }
                            else
                            {
                                set["gender"] = DBNull.Value;
                            }
                            if (this.FIELD_remark.Text != "")
                            {
                                set["remark"] = this.FIELD_remark.Text;
                            }
                            else
                            {
                                set["remark"] = DBNull.Value;
                            }
                            if (this.FIELD_ucategory.Value != "")
                            {
                                set["ucategory"] = new Guid(this.FIELD_ucategory.Value);
                            }
                            else
                            {
                                set["ucategory"] = DBNull.Value;
                            }
                            if (this.FIELD_ustatus.Value != "")
                            {
                                set["ustatus"] = new Guid(this.FIELD_ustatus.Value);
                            }
                            else
                            {
                                set["ustatus"] = DBNull.Value;
                            }
                            if (this.FIELD_userdomain.Text != "")
                            {
                                set["userdomain"] = this.FIELD_userdomain.Text;
                            }
                            else
                            {
                                set["userdomain"] = DBNull.Value;
                            }
                            if (this.FIELD_effectdate.Text != "")
                            {
                                set["effectdate"] = System.Convert.ToDateTime(this.FIELD_effectdate.Text);
                            }
                            else
                            {
                                set["effectdate"] = DBNull.Value;
                            }
                            if (this.FIELD_expiredate.Text != "")
                            {
                                set["expiredate"] = System.Convert.ToDateTime(this.FIELD_expiredate.Text);
                            }
                            else
                            {
                                set["expiredate"] = DBNull.Value;
                            }

                            set["gid"] = DDgid.SelectedValue;

                            set["comid"] = DdDept.SelectedValue;

                           /* if (this.FIELD_gid.Value != "")
                            {
                                set["gid"] = new Guid(this.FIELD_gid.Value);
                            }
                            else
                            {
                                set["gid"] = DBNull.Value;
                            }
                            */ 
                            if (base.CurrentUser.IsLogin)
                            {
                                set["modifyuid"] = new Guid(base.CurrentUser.ID);
                            }
                            else
                            {
                                set["modifyuid"] = DBNull.Value;
                            }
                            set["modifydate"] = DateTime.Now;
                            set.Update();
                            if (this.FIELD_photo.FileBytes.Length > 0)
                            {
                                set.Open("select * from dgimage where sid='" + base.Request.QueryString["id"] + "'");
                                if (set.EOF)
                                {
                                    set.Add();
                                    set["sid"] = new Guid(base.Request.QueryString["id"]);
                                    if (base.CurrentUser.IsLogin)
                                    {
                                        set["inituid"] = new Guid(base.CurrentUser.ID);
                                    }
                                    set["initdate"] = DateTime.Now;
                                }
                                set["name"] = this.FIELD_name.Text;
                                set["image"] = this.FIELD_photo.FileBytes;
                                if (base.CurrentUser.IsLogin)
                                {
                                    set["modifyuid"] = new Guid(base.CurrentUser.ID);
                                }
                                set["modifydate"] = DateTime.Now;
                                set.Update();
                            }
                            set.ExecuteNonQuery("delete from dgroleuser where uid='" + base.Request.QueryString["id"] + "'");
                            set.Open("select * from dgroleuser where 1=0");
                            for (int i = 0; i < this.FIELD_role.SelectedItems.Length; i++)
                            {
                                set.Add();
                                set["uid"] = new Guid(base.Request.QueryString["id"]);
                                set["rid"] = new Guid(this.FIELD_role.SelectedItems[i].Value);
                                if (base.CurrentUser.IsLogin)
                                {
                                    set["modifyuid"] = new Guid(base.CurrentUser.ID);
                                }
                                set["modifydate"] = DateTime.Now;
                                set.Update();
                            }
                        }
                        set.Close();

                        CreateXML(Request.QueryString["id"]);


                        base.Response.Redirect("UserCompany.aspx");
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
                    base.AddError(this, "BUTTON_save_Click()", "", exception.Message);
                }
            }
        }

        public int CompareAuthTypes(string authtype1, string authtype2)
        {
            return authtype1.CompareTo(authtype2);
        }

        public string DefaultAuthType()
        {
            return this.authtypes[0];
        }

        protected void FIELD_utype_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.TRLABEL_pwd.Visible = false;
            this.TRFIELD_pwd.Visible = false;
            this.TRLABEL_pwd_confirm.Visible = false;
            this.TRFIELD_pwd_confirm.Visible = false;
            this.TRLABEL_userdomain.Visible = false;
            this.TRFIELD_userdomain.Visible = false;
            this.FIELD_userdomain.Required = false;
            if (this.FIELD_utype.Value == UType.SmoothEnterprise.ToString())
            {
                this.TRLABEL_pwd.Visible = true;
                this.TRFIELD_pwd.Visible = true;
                this.TRLABEL_pwd_confirm.Visible = true;
                this.TRFIELD_pwd_confirm.Visible = true;
            }
            else if (this.FIELD_utype.Value == UType.ActiveDirectory.ToString())
            {
                this.FIELD_userdomain.Required = true;
                this.TRLABEL_userdomain.Visible = true;
                this.TRFIELD_userdomain.Visible = true;
            }
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

        public void GrantFor(string authtype)
        {
            object obj2 = new object();
            if (base.CurrentUser.IsLogin)
            {
                obj2 = new DataSet().ExecuteScalar("SELECT gid FROM dguser WHERE id='" + base.CurrentUser.ID + "'");
            }
            string str = (!base.CurrentUser.IsLogin || (obj2 == null)) ? "" : obj2.ToString();
            string str2 = authtype;
            if (str2 != null)
            {
                if (!(str2 == "50"))
                {
                    if (!(str2 == "70"))
                    {
                        if (!(str2 == "90"))
                        {
                            return;
                        }
                        return;
                    }
                }
                else
                {
                    if (str != "")
                    {
                        this.FIELD_gid.ExtendWhere = "id='" + str + "'";
                        return;
                    }
                    this.FIELD_gid.ExtendWhere = "1=0";
                    return;
                }
                if (str != "")
                {
                    this.FIELD_gid.RootId = str;
                }
                else
                {
                    this.FIELD_gid.ExtendWhere = "1=0";
                }
            }
        }

        public bool OnlyEveryone()
        {
            return false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           // this.tabtitle_Account.Attributes["tabtitle"] = base.GetLocalResourceObject("tabtitle_Account").ToString();
           // this.tabtitle_Information.Attributes["tabtitle"] = base.GetLocalResourceObject("tabtitle_Information").ToString();
            this.FIELD_photo.Attributes.Add("onchange", "value==''?" + this.PREVIEW_photo.ClientID + ".src='/lib/img/img-noimage.gif':" + this.PREVIEW_photo.ClientID + ".src=value;");
            DataSet set = new DataSet(DataSetType.OpenRead);
            try
            {
                set.Open("select A.*,B.uid from dgrole A LEFT OUTER JOIN dgroleuser B ON A.id=B.rid and B.uid='" + base.Request.QueryString["id"] + "' ");
                this.FIELD_role.Items.Clear();
                for (int i = 0; i < set.Rows.Count; i++)
                {
                    this.FIELD_role.Items.Add(set.Rows[i]["name"].ToString(), set.Rows[i]["id"].ToString(), set.Rows[i]["uid"].ToString() != "");
                }
                if (!base.IsPostBack)
                {
                    set.Open("select * from dguser where id='" + base.Request.QueryString["id"] + "'");
                    if (!set.EOF)
                    {
                        this.FIELD_utype.Value = set["utype"].ToString();
                        this.FIELD_logonid.Text = set["logonid"].ToString();
                        this.FIELD_name.Text = set["name"].ToString();
                        this.FIELD_name1.Text = set["name1"].ToString();
                        this.PREVIEW_photo.Src = "UserImage.aspx?id=" + set["id"].ToString() + "&photo=1";
                        this.FIELD_pwd.Text = set["pwd"].ToString();
                        this.FIELD_opwd.Text = set["pwd"].ToString();
                        this.FIELD_pwd_confirm.Text = set["pwd"].ToString();
                        this.FIELD_email.Text = set["email"].ToString();
                        this.FIELD_gender.SelectedIndex = this.FIELD_gender.Items.IndexOf(this.FIELD_gender.Items.FindByValue(set["gender"].ToString()));
                        this.FIELD_remark.Text = set["remark"].ToString();
                        this.FIELD_ucategory.Value = set["ucategory"].ToString();
                        this.FIELD_ustatus.Value = set["ustatus"].ToString();
                        this.FIELD_userdomain.Text = set["userdomain"].ToString();
                        if (set["effectdate"].ToString() != "")
                        {
                            this.FIELD_effectdate.Text = DateTime.Parse(set["effectdate"].ToString()).ToShortDateString();
                        }
                        if (set["expiredate"].ToString() != "")
                        {
                            this.FIELD_expiredate.Text = DateTime.Parse(set["expiredate"].ToString()).ToShortDateString();
                        }
                       // this.FIELD_gid.Value = set["gid"].ToString();


                        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        string whereis = "";
                        string comid = "";
                        ds.Open("select comid from dguser where id='" + this.CurrentUser.ID + "'");
                        if (ds["comid"].ToString() != "") comid = ds["comid"].ToString().ToUpper().Trim();
                        ds.Close();

                        if (comid != "MAT")
                        {
                            whereis = " where comid='" + comid + "'";
                            DdDept.SelectedValue = comid;
                            DdDept.Enabled = false;
                            LocComid.Enabled = false;

                        }



                        ds.Open(" select *  from dggroup  " + whereis);
                        while (!ds.EOF)
                        {
                            DDgid.Items.Add(new ListItem(ds["name"].ToString(), ds["id"].ToString()));

                            ds.MoveNext();
                        }

                        ds.Close();

                         
                        

                        DDgid.SelectedValue = set["gid"].ToString();
                        DdDept.SelectedValue = set["comid"].ToString().Trim();
                        empid.Text = set["empid"].ToString();

                    }
                    else
                    {
                        base.Response.Redirect("User.aspx");
                    }
                }

                

            }
            catch
            {
                base.Response.Redirect("User.aspx");
            }
            this.FIELD_utype_SelectedIndexChanged(sender, e);
            this.FIELD_pwd.Attributes.Add("onChange", this.FIELD_pwd_confirm.ClientID + ".value='';");
        }



        //建立XML 檔
        //輸入的參數為 link id

        private void CreateXML(string requid)
        {
            DateTime currentDate = DateTime.Now;
            long elapsedTicks = currentDate.Ticks;

            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs1.Open("select *  from dguser where id='" + requid + "'");
            string filename;
            int DTotal = 0;
            while (!rs1.EOF)
            {
                XmlDocument xdoc = new XmlDocument();
                xdoc.AppendChild(xdoc.CreateXmlDeclaration("1.0", "UTF-8", "yes"));
                // 建立根節點物件並加入 XmlDocument 中 (第 0 層)
                XmlElement rootElement = xdoc.CreateElement("NewDataSet");
                xdoc.AppendChild(rootElement);

                XmlElement eleChild1 = xdoc.CreateElement("NewDataSet");

                 
                XmlElement eleGrandChilds = xdoc.CreateElement("FileType");
                eleGrandChilds.InnerText = "Update";
                rootElement.AppendChild(eleGrandChilds);

                XmlElement eleGrandChild1 = xdoc.CreateElement("id");
                eleGrandChild1.InnerText = rs1["id"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild1);

                XmlElement eleGrandChild2 = xdoc.CreateElement("utype");
				if (LocComid.SelectedValue != "NA")
                {
                    eleGrandChild2.InnerText = "64CA1E7D-B15F-43CB-A33A-D29DB9020892";
                }
                else
                {
                    eleGrandChild2.InnerText = rs1["utype"].ToString().Trim();
                }
				rootElement.AppendChild(eleGrandChild2);

                XmlElement eleGrandChild3 = xdoc.CreateElement("logonid");
                eleGrandChild3.InnerText = rs1["logonid"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild3);

                XmlElement eleGrandChild4 = xdoc.CreateElement("name");
                eleGrandChild4.InnerText = rs1["name"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild4);

                XmlElement eleGrandChild5 = xdoc.CreateElement("userdomain");
                eleGrandChild5.InnerText = rs1["userdomain"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild5);


                XmlElement eleGrandChild6 = xdoc.CreateElement("pwd");
                if (LocComid.SelectedValue != "NA")
                {
                    eleGrandChild6.InnerText = rs1["pwd"].ToString().Trim();
                }
                else
                {
                    eleGrandChild6.InnerText = "";
                }
                rootElement.AppendChild(eleGrandChild6);


                XmlElement eleGrandChild7 = xdoc.CreateElement("pwdhintid");
                eleGrandChild7.InnerText = rs1["pwdhintid"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild7);

                XmlElement eleGrandChild8 = xdoc.CreateElement("pwdhint");
                eleGrandChild8.InnerText = rs1["pwdhint"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild8);

                XmlElement eleGrandChild9 = xdoc.CreateElement("pwdanswer");
                eleGrandChild9.InnerText = rs1["pwdanswer"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild9);

                XmlElement eleGrandChild10 = xdoc.CreateElement("email");
                eleGrandChild10.InnerText = rs1["email"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild10);

                XmlElement eleGrandChild11 = xdoc.CreateElement("remark");
                eleGrandChild11.InnerText = rs1["remark"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild11);

                XmlElement eleGrandChild12 = xdoc.CreateElement("ustatus");
                if (LocComid.SelectedValue != "NA")
                {
                    eleGrandChild12.InnerText = "76CBA823-E891-45D3-8B6C-4724E6C69D5B";
                }
                else
                {
                    eleGrandChild12.InnerText = rs1["ustatus"].ToString().Trim();
                }

                
                rootElement.AppendChild(eleGrandChild12);




                XmlElement eleGrandChild13 = xdoc.CreateElement("effectdate");
                eleGrandChild13.InnerText = rs1["effectdate"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild13);

                XmlElement eleGrandChild14 = xdoc.CreateElement("expiredate");
                eleGrandChild14.InnerText = rs1["expiredate"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild14);

                XmlElement eleGrandChild15 = xdoc.CreateElement("dsn");
                eleGrandChild15.InnerText = rs1["dsn"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild15);

                XmlElement eleGrandChild16 = xdoc.CreateElement("gid");
                if (LocComid.SelectedValue != "NA")
                {
                    eleGrandChild16.InnerText = "";//因為子廠可能不會有這個人的群組
                }
                else
                {
                    eleGrandChild16.InnerText = rs1["gid"].ToString().Trim();
                }
                
               
                rootElement.AppendChild(eleGrandChild16);

                XmlElement eleGrandChild17 = xdoc.CreateElement("ucategory");
                eleGrandChild17.InnerText = rs1["ucategory"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild17);

                XmlElement eleGrandChild18 = xdoc.CreateElement("userpath");
                eleGrandChild18.InnerText = rs1["userpath"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild18);

                /*
                                 ,utype,,,,
                ,,,,,,,,,
                ,,,,,,,
                ,optname2,optvalue2,optsyscontrol2,optname3,optvalue3,optsyscontrol3,inituid
                ,initdate,modifydate,modifyuid,comid,empid,levid,erpid*/


                XmlElement eleGrandChild19 = xdoc.CreateElement("authcode");
                eleGrandChild19.InnerText = rs1["authcode"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild19);

                XmlElement eleGrandChild20 = xdoc.CreateElement("sid");
                eleGrandChild20.InnerText = rs1["sid"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild20);

                XmlElement eleGrandChild21 = xdoc.CreateElement("optname1");
                eleGrandChild21.InnerText = rs1["optname1"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild21);

                XmlElement eleGrandChild22 = xdoc.CreateElement("optvalue1");
                eleGrandChild22.InnerText = rs1["optvalue1"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild22);

                XmlElement eleGrandChild23 = xdoc.CreateElement("optsyscontrol1");
                eleGrandChild23.InnerText = rs1["optsyscontrol1"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild23);

                XmlElement eleGrandChild231 = xdoc.CreateElement("comid");
                eleGrandChild231.InnerText = rs1["comid"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild231);


                XmlElement eleGrandChild24 = xdoc.CreateElement("empid");
                eleGrandChild24.InnerText = rs1["empid"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild24);


                XmlElement eleGrandChild25 = xdoc.CreateElement("levid");
                eleGrandChild25.InnerText = rs1["levid"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild25);


                XmlElement eleGrandChild26 = xdoc.CreateElement("erpid");
                eleGrandChild26.InnerText = rs1["erpid"].ToString().Trim();
                rootElement.AppendChild(eleGrandChild26);
                //lsit  使用者有那些群組
                
                ds.Open("select rid,uid,modifyuid  from dgroleuser where uid='" + requid + "'");
                //先暫時產生一筆
                if (!ds.EOF)
                {

                    XmlElement eleGrandChild27 = xdoc.CreateElement("rid");
                    eleGrandChild27.InnerText = "6D25693F-6B5D-4A5F-8716-D641A335B925"; // ds["rid"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild27);

                    XmlElement eleGrandChild28 = xdoc.CreateElement("ruid");
                    eleGrandChild28.InnerText = ds["uid"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild28);


                    XmlElement eleGrandChild29 = xdoc.CreateElement("rmodifyuid");
                    eleGrandChild29.InnerText = ds["modifyuid"].ToString().Trim();
                    rootElement.AppendChild(eleGrandChild29);





                    //DTotal++;
                    //ds.MoveNext();
                }
                ds.Close();


                //   XmlElement eleGrandChild28 = xdoc.CreateElement("DTotal");
                //   eleGrandChild28.InnerText = DTotal.ToString();
                //   rootElement.AppendChild(eleGrandChild28);

                if (LocComid.SelectedValue != "NA")
                {
                    filename = LocComid.SelectedValue + "dguser" + elapsedTicks.ToString();  // rs1["empid"].ToString();
                }
                else
                {
                    filename = rs1["comid"].ToString().Trim() + "dguser" + elapsedTicks.ToString();  // rs1["empid"].ToString();
                }

               

                // 將建立的 XML 節點儲存為檔案

                xdoc.Save(@"C:\\Admin\\" + filename);
                xdoc.Clone();


                Upload("C:\\Admin\\" + filename, "ftp://"+ftpip+"//" + filename, username, password);
                rs1.MoveNext();
            }
            rs1.Close();
        }
        

        //檔案上傳
        internal bool Upload(string fileName, string uploadUrl, string UserName, string Password)
        {
            // fileName上傳的檔案 ex : c:\abc.xml , 
            // uploadUrl上傳的FTP伺服器路徑 ftp://127.0.0.1/檔名
            // UserName使用者FTP登入帳號 , 
            // Password使用者登入密碼

            Stream requestStream = null;
            FileStream fileStream = null;
            FtpWebResponse uploadResponse = null;
            try
            {
                FtpWebRequest uploadRequest = (FtpWebRequest)WebRequest.Create(uploadUrl);
                uploadRequest.Method = WebRequestMethods.Ftp.UploadFile;//設定Method上傳檔案
                uploadRequest.Proxy = null;
                if (UserName.Length > 0)//如果需要帳號登入
                {
                    NetworkCredential nc = new NetworkCredential(UserName, Password);
                    uploadRequest.Credentials = nc; //設定帳號
                }
                requestStream = uploadRequest.GetRequestStream();
                fileStream = System.IO.File.Open(fileName, FileMode.Open);
                byte[] buffer = new byte[1024];
                int bytesRead;
                while (true)
                {//開始上傳資料流
                    bytesRead = fileStream.Read(buffer, 0, buffer.Length);
                    if (bytesRead == 0)
                        break;
                    requestStream.Write(buffer, 0, bytesRead);
                }
                requestStream.Close();
                uploadResponse = (FtpWebResponse)uploadRequest.GetResponse();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (uploadResponse != null)
                    uploadResponse.Close();
                if (fileStream != null)
                    fileStream.Close();
                if (requestStream != null)
                    requestStream.Close();
            }
        }
        //檔案上傳


        /*
        protected HttpApplication ApplicationInstance
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

