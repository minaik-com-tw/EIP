using SmoothEnterprise.Database;
using SmoothEnterprise.Security.Authorization;
using SmoothEnterprise.Web.UI.HTMLControl; 
using SmoothEnterpriseT.Content.UI.WebControl;

using System;
using System.Collections;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.Xml;

namespace SmoothEnterprise.Web.Application.Portal
{
    // Token: 0x02000002 RID: 2
    public partial class Default : Page, IRequiresSessionState, IDataAuth, IPersonalize, ICustomize
    {
        // Token: 0x17000001 RID: 1
        // (get) Token: 0x06000001 RID: 1 RVA: 0x00002050 File Offset: 0x00000250
         

        // Token: 0x06000003 RID: 3 RVA: 0x00002070 File Offset: 0x00000270
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.HideCategoryPath1(this.Page);
            }
           this.AdRotator1.AdvertisementFile = this.Page.ResolveUrl("~/portalad.xml");
         
            base.ResetURL();
            try
            {
                XmlDocument xmlDocument = new XmlDocument();
                xmlDocument.Load(base.Server.MapPath("~/portalad.xml"));
            }
            catch
            {
                this.adrotator.Visible = false;
            }
            if (!base.IsPostBack && this.Page.Request["cid"] != null)
            {
                this.CategoryContent1.RootCID = this.Page.Request["cid"].ToString();
                this.CategoryPath2.CID = this.Page.Request["cid"].ToString();
            }
            if (!base.IsPostBack && this.Page.Request["cid"] == null)
            {
                this.CategoryPath2.CID = "{687579FF-C822-4B86-BDB8-2B611368E267}";
            }
            try
            {
                this.CategoryContent1.ExpandedLevel = Convert.ToInt32(this.ExpandedLevel.Value);
            }
            catch
            {
                this.CategoryContent1.ExpandedLevel = 1;
            }
            if (base.CurrentAuthType != "99")
            {
                this.ShowCategory.Value = "2";
            }
            string value;
            if ((value = this.ShowCategory.Value) != null)
            {
                if (!(value == "1"))
                {
                    if (value == "2")
                    {
                        this.CategoryContent1.ViewType = 0;
                    }
                }
                else
                {
                    this.CategoryContent1.ViewType = TCategoryContent.ViewTypes.All;
                }
            }
            try
            {
                this.CategoryContent1.Columns = Convert.ToInt32(this.Columns.Value);
            }
            catch
            {
                this.CategoryContent1.Columns = 2;
            }
        }

        // Token: 0x06000004 RID: 4 RVA: 0x00002260 File Offset: 0x00000460
        protected void HideCategoryPath1(System.Web.UI.Control ctrl)
        {
            if (ctrl.ID == "CategoryPath1")
            {
                ctrl.Visible = false;
                return;
            }
            for (int i = 0; i < ctrl.Controls.Count; i++)
            {
                this.HideCategoryPath1(ctrl.Controls[i]);
            }
        }

        // Token: 0x06000005 RID: 5 RVA: 0x000022B0 File Offset: 0x000004B0
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            this.homepanel.Visible = (this.CategoryContent1.RootCID == "");
            this.OnlineUsers1.Visible = (this.CategoryContent1.RootCID == "");
            try
            {
                DataSet dataSet = new DataSet();
                string text = this.CategoryContent1.RootCID;
                if (text == "")
                {
                    text = Guid.Empty.ToString();
                }
                dataSet.Open("select columns, expanded, mode, orderby from dgcategory where id = '" + text + "'");
                if (!dataSet.EOF)
                {
                    if (!this.QueryBlock.Visible)
                    {
                        if (dataSet["columns"] != DBNull.Value)
                        {
                            this.CategoryContent1.Columns = Convert.ToInt32(dataSet["columns"].ToString());
                        }
                        if (dataSet["expanded"] != DBNull.Value)
                        {
                            this.CategoryContent1.ExpandedLevel = Convert.ToInt32(dataSet["expanded"].ToString());
                        }
                        if (dataSet["mode"].ToString() == "1")
                        {
                            this.CategoryContent1.ViewType = TCategoryContent.ViewTypes.All;
                        }
                    }
                    if (dataSet["orderby"] != DBNull.Value)
                    {
                        if (dataSet["orderby"].ToString() == "1")
                        {
                            this.CategoryContent1.OrderType = TCategoryContent.OrderTypes.RecentFirst;
                        }
                        else if (dataSet["orderby"].ToString() == "2")
                        {
                            this.CategoryContent1.OrderType = TCategoryContent.OrderTypes.RecentLast;
                        }
                        else if (dataSet["orderby"].ToString() == "3")
                        {
                            this.CategoryContent1.OrderType = TCategoryContent.OrderTypes.ContentNo;
                        }
                        else if (dataSet["orderby"].ToString() == "4")
                        {
                            this.CategoryContent1.OrderType = TCategoryContent.OrderTypes.ContentName;
                        }
                    }
                }
                dataSet.Close();
            }
            catch
            {
            }
        }

        // Token: 0x06000006 RID: 6 RVA: 0x000024D8 File Offset: 0x000006D8
        protected void CategoryContent1_OnClickLink(object sender, SmoothEnterpriseT.Content.UI.WebControl.TCategoryContentEventArgs e)
        {
            this.CategoryPath2.CID = this.CategoryContent1.RootCID;
        }

       

        // Token: 0x06000008 RID: 8 RVA: 0x00002541 File Offset: 0x00000741
        protected void ButtonEdit_Click(object sender, EventArgs e)
        {
            base.Response.Redirect(base.ResolveUrl("~/content/category.aspx"));
        }

        // Token: 0x06000009 RID: 9 RVA: 0x0000255C File Offset: 0x0000075C
        public string GetAuthName(string authtype)
        {
            string result = authtype;
            try
            {
                this.authnames = base.GetLocalResourceObject("Vs_authnames").ToString().Split(new char[]
                {
                    ','
                });
            }
            catch
            {
            }
            for (int i = 0; i < this.authtypes.Length; i++)
            {
                if (this.authtypes[i] == authtype)
                {
                    result = this.authnames[i];
                }
            }
            return result;
        }

        // Token: 0x0600000A RID: 10 RVA: 0x000025D8 File Offset: 0x000007D8
        public string[] GetAuthTypes()
        {
            return this.authtypes;
        }

        // Token: 0x0600000B RID: 11 RVA: 0x000025E0 File Offset: 0x000007E0
        public int CompareAuthTypes(string authtype1, string authtype2)
        {
            return authtype1.CompareTo(authtype2);
        }

        // Token: 0x0600000C RID: 12 RVA: 0x000025E9 File Offset: 0x000007E9
        public string DefaultAuthType()
        {
            return this.authtypes[0];
        }

        // Token: 0x0600000D RID: 13 RVA: 0x000025F4 File Offset: 0x000007F4
        public void GrantFor(string authtype)
        {
            try
            {
                if (authtype != null)
                {
                    if (!(authtype == "01"))
                    {
                        if (authtype == "50")
                        {
                            this.LABEL_displaymode.Visible = false;
                            this.ShowCategory.Visible = false;
                            this.CategoryContent1.ViewType = 0;
                        }
                    }
                    else
                    {
                        this.QueryBlock.Visible = false;
                        this.QueryBlock1.Visible = false;
                        this.CategoryContent1.ViewType = 0;
                        this.CategoryContent1.ExpandedLevel = 2;
                    }
                }
            }
            catch
            {
            }
        }

        // Token: 0x0600000E RID: 14 RVA: 0x00002690 File Offset: 0x00000890
        public void SetPersonalizeValues(object setvalues)
        {
            try
            {
                Hashtable hashtable = new Hashtable();
                hashtable = (Hashtable)setvalues;
                this.ExpandedLevel.Value = (string)hashtable[this.ExpandedLevel.ClientID];
                this.ShowCategory.Value = (string)hashtable[this.ShowCategory.ClientID];
                try
                {
                    this.Columns.Value = (string)hashtable[this.Columns.ClientID];
                }
                catch
                {
                    this.Columns.Value = "2";
                }
            }
            catch (Exception ex)
            {
                base.Response.Write(ex.Message);
            }
        }

        // Token: 0x0600000F RID: 15 RVA: 0x00002754 File Offset: 0x00000954
        public object GetPersonalizeValues()
        {
            
            return new Hashtable
            {
                {
                    this.ExpandedLevel.ClientID,
                    this.ExpandedLevel.Value
                },
                {
                    this.ShowCategory.ClientID,
                    this.ShowCategory.Value
                },
                {
                    this.Columns.ClientID,
                    this.Columns.Value
                }
            };
        }

        // Token: 0x06000010 RID: 16 RVA: 0x000027BC File Offset: 0x000009BC
        public bool EnablePersonalize()
        {
            return true;
        }

        // Token: 0x06000011 RID: 17 RVA: 0x000027BF File Offset: 0x000009BF
        public string GetCustomizeURL()
        {
            return base.ResolveUrl("~/Portal/Customize/DefaultCustomize.aspx");
        }

        // Token: 0x06000012 RID: 18 RVA: 0x000027CC File Offset: 0x000009CC
        public void SetCustomizeValues(object setvalues)
        {
            //Hashtable hashtable = (Hashtable)setvalues;
            //if (hashtable["FIELD_calendar"] != null && hashtable["FIELD_calendar"].ToString() != "Y")
            //{
            //    this.CalendarBox1.Visible = false;
            //}
            //if (hashtable["FIELD_reminder"] != null && hashtable["FIELD_reminder"].ToString() != "Y")
            //{
            //    this.ReminderBox1.Visible = false;
            //}
            //if (hashtable["FIELD_news"] != null && hashtable["FIELD_news"].ToString() != "Y")
            //{
            //    this.NewsBox1.Visible = false;
            //}
        }

        // Token: 0x04000001 RID: 1
     

        // Token: 0x04000002 RID: 2
         

        // Token: 0x04000003 RID: 3
         

        // Token: 0x04000004 RID: 4
       

        // Token: 0x04000005 RID: 5
        
        // Token: 0x04000006 RID: 6
       
        // Token: 0x04000007 RID: 7
        
        // Token: 0x04000008 RID: 8
      
        // Token: 0x04000009 RID: 9
        

        // Token: 0x0400000A RID: 10
        protected InputButton ButtonEdit;

        // Token: 0x0400000B RID: 11
        protected HtmlTableRow QueryBlock;

        // Token: 0x0400000C RID: 12
        

        // Token: 0x0400000D RID: 13
      

        // Token: 0x0400000E RID: 14
      

        // Token: 0x0400000F RID: 15
        
        // Token: 0x04000010 RID: 16
        

        // Token: 0x04000011 RID: 17
        

        // Token: 0x04000015 RID: 21
        protected HtmlTable adrotator;

        // Token: 0x04000016 RID: 22
        protected string[] authtypes = new string[]
        {
            "01",
            "50",
            "99"
        };

        // Token: 0x04000017 RID: 23
        protected string[] authnames = new string[]
        {
            "Default Contents",
            "Authorized Contents",
            "All Categories"
        };

        protected void Unnamed_OnClickLink(object sender, string id, EventArgs e)
        {

        }

        protected void CategoryPath2_ClickLink(object sender, string id, EventArgs e)
        {
            
                if (id == "")
                {
                    this.CategoryPath2.CID = "{687579FF-C822-4B86-BDB8-2B611368E267}";
                    this.CategoryContent1.RootCID = "";
                    return;
                }
                this.CategoryContent1.RootCID = this.CategoryPath2.CID;
           
        }
    }
}
