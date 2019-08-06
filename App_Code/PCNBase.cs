using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// PCNBase 的摘要描述
/// </summary>
public class PCNBase : MABase
{
    protected DataTable _attach = new DataTable();
    protected DataTable _del = new DataTable();
    public int file_count = 0;
    public PCNBase()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        // 
    }

    protected void Regist_Trigger() {

        foreach (Control ctl in Page.Master.FindControl("ContentPlaceHolder1").Controls)
        {
            //Utility.log(1, ctl.ID.ToString());
            if (ctl.GetType().Name == "UpdatePanel")
            {
                UpdatePanel p = (UpdatePanel)ctl;

                string name = p.ID.Replace("panel_", "btn_");
                string type = p.ID.Replace("panel_", "");

                Button btn = (Button)p.FindControl(name);

                btn.Text = getStr("upload_file");

                //因為fileUpload 在postback 後，上傳功能會鎖住 所以必需要重新註冊
                //https://dotblogs.com.tw/stanley14/2016/08/10/173019 參考這篇 重新註冊 trigger
                PostBackTrigger trigger = new PostBackTrigger();
                trigger.ControlID = btn.ID;
                p.Triggers.Add(trigger);
                ScriptManager.GetCurrent(Page).RegisterPostBackControl(btn);

                if (_attach.Rows.Count > 0)
                {
                    attach_List(type);
                }
            }
        }
    }

    protected class SQL
    {
        public static string Program = string.Format("Select name 'rowno',name 'en' ,name 'tw' from eipe.dbo.SYS_Category where program='{0}' and kind='{1}' order by name ", "PCN", "Main");
        public static string Menu = string.Format("Select name 'rowno',tag 'en' ,tag 'tw' from eipe.dbo.SYS_Category where program='{0}' and kind='{1}' order by name ", "PCN", "Menu");
        //-------------
        public static string Coustomer = string.Format("select en 'rowno', en,tw ,def from eipe.dbo.Sys_Option where main='PCN' and kind='Customer' order by en desc ");//Customer
        public static string Module = string.Format("select  en 'rowno', en,tw ,def from eipe.dbo.Sys_Option where main='PCN' and kind='Program' order by  en desc ");//Program
        public static string Product = string.Format("select  en 'rowno', en,tw ,def from eipe.dbo.Sys_Option where main='PCN' and kind='Product' order by  en desc "); //產品
        public static string Prod_guid = string.Format("select  rowid 'rowno', en,tw ,def from eipe.dbo.Sys_Option where main='PCN' and kind='Product' order by  en desc "); //產品
        public static string Picture = string.Format("select  en 'rowno', en,tw ,def from eipe.dbo.Sys_Option where main='PCN' and kind='Part No.' order by  en desc "); //圖號 Part No.
        public static string Question = string.Format("select  en 'rowno', en,tw ,def from eipe.dbo.Sys_Option where main='PCN' and kind='Stage' order by  en desc "); //Stage 問題階段
        public static string Changed = string.Format("select  en 'rowno', en,tw ,def from eipe.dbo.Sys_Option where main='PCN' and kind='Category' order by  en desc "); //Category 變更類型
        //public static string Result = string.Format("select  en 'rowno', en,tw ,def from eipe.dbo.Sys_Option where main='PCN' and kind='Result' order by kind ");
        public static string Verify = string.Format("select  en 'rowno', en,tw ,def from eipe.dbo.Sys_Option where main='PCN' and kind='Status' order by en desc "); //8D Status

    }



    #region UI controls

    protected void getItem(DropDownList list, string sql)
    {
        getItem(list, sql, true);

    }

    protected void getItem(DropDownList list, string sql, bool def)
    {
        ListItem[] Item = Utility.getOPItem(sql, list.SelectedValue, lang, def);
        list.Items.Clear();
        list.Items.AddRange(Item);

    }

    protected void getMenu(DropDownList list)
    {
        getItem(list, SQL.Menu, false);
    }

    protected void getProgram(DropDownList list)
    {
        getItem(list, SQL.Program, false);

    }

    protected void getStatus(DropDownList ddl)
    {
        Utility.getStatus(ddl, lang);
    }

    protected void getCoustomer(DropDownList ddl)
    {
        getItem(ddl, SQL.Coustomer);
    }

    protected void getModule(DropDownList ddl)
    {
        getItem(ddl, SQL.Module);
    }

    protected void getProduct(DropDownList ddl)
    {
        getItem(ddl, SQL.Product);
    }

    protected void getProdformGuid(DropDownList ddl,string def)
    {     
        ListItem[] Item = Utility.getOPItem(SQL.Prod_guid, "" , lang, false);

        foreach (ListItem op in Item)
        {
            if (op.Text == def)
            {
                op.Selected = true;
                break;
            }
        }

        ddl.Items.Clear();
        ddl.Items.AddRange(Item);
    }

    protected void getQuestion(DropDownList ddl)
    {
        getItem(ddl, SQL.Question);
    }

    protected void getPicture(DropDownList ddl)
    {
        getItem(ddl, SQL.Picture);
    }

    protected void getVerify(DropDownList ddl)
    {
        getItem(ddl, SQL.Verify);
    }

    protected void getChange(DropDownList ddl)
    {
        getItem(ddl, SQL.Changed);
    }

    protected void getRelust(DropDownList ddl)
    {
        ddl.Items.Clear();

        ListItem[] Item = new ListItem[5];

        Item[0] = new ListItem("Select", "");
        Item[1] = new ListItem("Pass", "pass");
        Item[2] = new ListItem("Cancel/Reject", "reject");
        Item[3] = new ListItem("Fail", "fail");
        Item[4] = new ListItem("Other", "other");

        Item[0].Selected = true;

        ddl.Items.Clear();
        ddl.Items.AddRange(Item);
    }
     
    protected string VerifyView(string verify)
    {
        string text = "";
        ListItem[] Item = Utility.getOPItem(SQL.Verify, "", lang, false);

        foreach (ListItem i in Item)
        {
            if (i.Value == verify)
            {
                text = i.Text;
                break;

            }
        }
        return text;

    }
 

    public void getNextSelect(DropDownList ddl, string parent_id)
    {
        if (string.IsNullOrEmpty(parent_id))
        {
          
            ddl.Enabled = false;
            ddl.Items.Clear();
        }
        else
        {
            string SQL = string.Format("select  p.rowid 'rowno',en 'en' ,en 'tw'  from eipe.dbo.pcn_join p left join eipe.dbo.sys_option o on p.item_id=o.rowid where parent_id='{0}'  ", parent_id);
            getItem(ddl, SQL, false);
            ddl.Enabled = true;

        }

        
    }
     
    #endregion UI controls

    #region Upload_File

    public static string File_Srv
    {
        get
        {
            return System.Web.Configuration.WebConfigurationManager.AppSettings["PCN_File"].ToString();
        }
    }

    public static bool PCN_Manager(string id)
    {
        bool isPass = false;

        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string sql = string.Format("select * from eipe.dbo.SYS_Category where rowno='{0}' ", id);

            rs.Open(sql);

            if (!rs.EOF)
            {
                isPass = true;
            }
        }
        return isPass;
    }


    protected void initTemp()
    {
        _attach.Columns.Add("timestanp");
        _attach.Columns.Add("type");
        _attach.Columns.Add("name");
        _attach.Columns.Add("stamp");

        _del.Columns.Add("stamp");
    }

    protected bool attach_Add(string rowid, string type, string name, string stamp)
    {
        bool pass = false;
        string seach = string.Format(" name='{0}' ", name);
        string sub_name = Path.GetExtension(name);
        if (_attach.Select(seach).Length == 0)
        {
            DataRow row = _attach.NewRow();

            row["timestanp"] = rowid;
            row["type"] = type;
            row["name"] = name;
            row["stamp"] = stamp;

            _attach.Rows.Add(row);
            pass = true;
        }

        return pass;

    }

    protected string upload_file(string type)
    {
        string msg = "";
        string f = "file_" + type;

        if (sav_file(type, f, ref msg))
        {
            attach_List(type);
        }

        return msg;
    }

    private bool sav_file(string type, string fileUp, ref string msg)
    {
        bool status = false;
        //ctl00_ContentPlaceHolder1_file_other
        //FileUpload fileU = (FileUpload)Page.Master.FindControl("ContentPlaceHolder1").FindControl(fileUp);

        FileUpload fileU = (FileUpload)Page.Form.FindControl("ContentPlaceHolder1").FindControl(fileUp);



        if (fileU.HasFile != false)
        {
            //3.上傳FTP
            string filename = fileU.FileName;

            // 限制檔案大小，限制為 2MB
            int filesize = fileU.PostedFile.ContentLength / 1024;
            if (filesize > 15360)
            {
                msg = getStr("file_large");

            }
            else
            {

                if (filename.Length > 200)
                {
                    msg = getStr("file_name_long");
                }
                else
                {

                    string subname = Path.GetExtension(filename);
                    string tspan = Utility.GetTSs();
                    string stamp = string.Format("{0}{1}", tspan, subname);
                    string TempPath = Path.Combine(File_Srv, stamp);
                      
                    if (attach_Add(tspan, type, filename, stamp))
                    {
                        fileU.SaveAs(TempPath);
                        msg = getStr("file_ok");
                        status = true;
                    }
                    else
                    {
                        msg = getStr("file_repeat");

                    }
                }
            }

        }

        return status;
    }

 
    protected bool add_file(string rowid)
    {
        bool isOK = false;
        try
        {

            if (_attach.Rows.Count > 0)
            {
                string del = string.Format("delete from eipe.dbo.PCN_file where rowid='{0}'", rowid);
                Utility.execDel(del);

                using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                { 
                    foreach (DataRow row in _attach.Rows)
                    {
                        string type = row["type"].ToString();
                        string name = row["name"].ToString();
                        string stamp = row["stamp"].ToString();


                        string sql = string.Format("select * from eipe.dbo.PCN_file where rowid='{0}' and kind='{1}'  and  files='{2}' ", rowid, type, name);
                        ds.Open(sql);
                        if (ds.EOF)
                        {
                            ds.Add();

                            ds["rowid"] = rowid;
                            ds["kind"] = type;
                            ds["files"] = name;
                            ds["stamp"] = stamp;

                            ds.Update();
                            isOK = true;
                        }
                    }
                }
            }
            else
            {
                isOK = true;
            }


            if (_del.Rows.Count > 0)
            {
                foreach (DataRow r in _del.Rows)
                {
                    string stamp = r["stamp"].ToString();

                    string files = Path.Combine(File_Srv, stamp);

                    if (File.Exists(files))
                    {
                        File.Delete(files);
                    }
                }

                _del.Clear();
            }

        }
        catch (Exception ex)
        {
            isOK = false;
            throw ex;
        }
        return isOK;
    }

    protected void init_attch(string rowid)
    {
        using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string sql = string.Format("select * from eipe.dbo.PCN_File where rowid='{0}' ", rowid);

            ds.Open(sql);

            while (!ds.EOF)
            {
                try
                {

                    attach_Add(Guid.NewGuid().ToString(), ds["kind"].ToString(), ds["files"].ToString(), ds["stamp"].ToString());
                    ds.MoveNext();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        gv_reload();

    }

    protected void attach_List(string type)
    {
        string list = "gv_" + type;

        GridView gv = (GridView)Page.Master.FindControl("ContentPlaceHolder1").FindControl(list);
        gv.AutoGenerateColumns = false;
        gv.Columns.Clear();
        TemplateField field = new TemplateField();
        gv.Columns.Add(field); //cell[0] button
        gv.Columns.Add(field);//cell[1] name
        
        //dt.DefaultView.RowFilter = "classno=654321"  '用DataView去作row的挑選

        _attach.DefaultView.RowFilter = " type='" + type + "'";

        gv.DataSource = _attach.DefaultView;
        gv.DataBind();

        file_count=gv.Rows.Count;

        string obj = "panel_" + type;
        UpdatePanel panel = (UpdatePanel)Page.Master.FindControl("ContentPlaceHolder1").FindControl(obj);
        panel.Update();
    }

    private void gv_reload()
    {
        foreach (Control ctl in Page.Master.FindControl("ContentPlaceHolder1").Controls)
        {
            //Utility.log(1, ctl.ID.ToString());
            if (ctl.GetType().Name == "GridView")
            {
                GridView gv = (GridView)ctl;
                gv.BorderWidth = 0;
                string type = gv.ID.Replace("gv_", "");

                _attach.DefaultView.RowFilter = " type='" + type + "'";

                gv.AutoGenerateColumns = false;

                TemplateField field = new TemplateField();
                gv.Columns.Add(field);

                gv.DataSource = _attach.DefaultView;
                gv.DataBind();

                string obj = "panel_" + type;
                //UpdatePanel panel = (UpdatePanel)Page.Master.FindControl("ContentPlaceHolder1").FindControl(obj);
                //panel.Update();
            }

        }
    }


    #region gv event

    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        string timestanp = e.CommandArgument.ToString();

        string type = e.CommandName;
        DataRow[] rows = _attach.Select("timestanp='" + timestanp + "' ");

        if (rows.Length > 0)
        {

            DataRow ds = _del.NewRow();
            ds["stamp"] = rows[0]["stamp"];
            _del.Rows.Add(ds); 
            _attach.Rows.Remove(rows[0]);
            file_count--;
            attach_List(type);

            //string obj = "panel_" + type;
            //UpdatePanel panel = (UpdatePanel)Page.Master.FindControl("ContentPlaceHolder1").FindControl(obj);
            //panel.Update();
        }
    }



    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            if (Request.FilePath.ToUpper().Contains("VIEW"))
            {
                e.Row.Cells[0].Visible = false;
            }
            else
            {
                e.Row.Cells[0].Text = "Del";
                e.Row.Cells[1].Text = "File";
            }


        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int row = e.Row.RowIndex;
            DataRowView drv = (DataRowView)e.Row.DataItem;

            if (Request.FilePath.ToUpper().Contains("VIEW"))
            {
                string sub = Path.GetExtension(drv[2].ToString());

                if (Utility.isPicture(sub))
                {
                    Image img = new Image();
                    //img.ImageUrl = Path.Combine(PCNBase.File_Srv, drv[3].ToString());
                    string x = Path.Combine(PCNBase.File_Srv, drv[3].ToString());
                    img.ImageUrl = "Download.ashx?files=" + x;

                    img.ToolTip = drv[2].ToString();
                    img.AlternateText= drv[2].ToString();
                    img.Width = 300;
                    img.Height = 168;
                    e.Row.Cells[0].Controls.Add(img);
                }
                else
                {
                    //因為在view中點選附件後，審核資料，會重覆下載資料，所以改用html輸出
                    //LinkButton lbtn = new LinkButton();
                    //lbtn.CommandName = "lbtn_download";
                    //lbtn.ID = "lbtn_download";

                    //lbtn.CommandArgument = e.Row.RowIndex.ToString();
                    //lbtn.PostBackUrl = @"download.ashx?files=" + drv[3].ToString();
                    //lbtn.CommandArgument = row.ToString();
                    //lbtn.CommandName = drv[1].ToString();　

                    string link = string.Format("<A id='{2}' href='download.ashx?files={0}&name={3}'>{1}</A>", drv[3].ToString(), drv[2].ToString().Trim(), drv[1].ToString(), drv[1].ToString());
                    e.Row.Cells[0].Text = link; 
                }

            }
            else
            {

                //ImageButton lbtn = new ImageButton();

                //lbtn.ID = "lbtn_delete";
                //lbtn.CommandArgument = drv[0].ToString();
                //lbtn.CommandName = drv[1].ToString();
                //lbtn.ImageUrl = "/gif/button_drop.png";

                //lbtn.Width = 20;
                //lbtn.Height = 20;

                LinkButton lbtn = new LinkButton();

                lbtn.ID = "lbtn_delete";
                lbtn.CommandArgument = drv[0].ToString();
                lbtn.CommandName = drv[1].ToString();
                lbtn.CssClass = "fa fa-trash fa-2x";
                lbtn.Attributes.Add("alt", "del");
                 
                e.Row.Cells[0].Controls.Add(lbtn);
                e.Row.Cells[0].Style.Add("text-align", "center");

                LinkButton lbtn_down = new LinkButton();
                lbtn_down.CommandName = "lbtn_download";
                lbtn_down.ID = "lbtn_download";

                lbtn_down.CommandArgument = e.Row.RowIndex.ToString();
                lbtn_down.PostBackUrl = @"download.ashx?files=" + System.Web.HttpUtility.UrlDecode(drv[2].ToString());
                lbtn_down.CommandArgument = row.ToString();
                lbtn_down.CommandName = "download";
                lbtn_down.Text = drv[2].ToString().Trim();
                e.Row.Cells[1].Controls.Add(lbtn_down);



            }

        }
    }

    #endregion

    #endregion Upload_File

    protected void Update_8D_Status(status action)
    {

        try
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select * from eipe.dbo.PCN_8D where rowid='{0}' ", _rowid);
                rs.Open(sql);

                if (!rs.EOF)
                {

                    rs["status"] = (int)action;
                    rs["modify_user"] = CurrentUser.Name;
                    rs["modify_date"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    rs.Update();
                    rs.Close();
                }
            }
            _status = (int)action;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void Update_PCN_Status(status action)
    {

        try
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select * from eipe.dbo.PCNM where rowid='{0}' ", _rowid);
                rs.Open(sql);

                if (!rs.EOF)
                {

                    rs["status"] = (int)action;
                    rs["modify_user"] = CurrentUser.Name;
                    rs["modify_date"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    rs.Update();
                    rs.Close();
                }
            }
            _status = (int)action;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected string ccMail()
    {

        string cc = "";
        using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string sql = "select mail from eipe.dbo.PCN_Mail";
            ds.Open(sql);
            List<string> ls = new List<string>();

            while (!ds.EOF)
            {
                ls.Add(ds["mail"].ToString());
                ds.MoveNext();
            }

            cc = string.Join(",", ls.ToArray());
        }

        return cc;
    }

    
    protected string  getDDL(DropDownList ddl, string parent_id , string curr)
    {
        string prev_id = ""; 
        getNextSelect(ddl, parent_id);

        foreach (ListItem item in ddl.Items)
        {
            if (item.Text == curr)
            {
                item.Selected = true;
                prev_id = item.Value;
                break;
            }
        }
        return prev_id;
    }
 


    //tree_level[0]為最後一階  tag=> select kind from eipe.dbo.Sys_Option  where main='PCN' group by kind
    public static string[] tree_level = { "Customer", "Part No.", "Program", "Product"};
    
}