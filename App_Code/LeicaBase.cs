using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Leica 的摘要描述
/// </summary>
public class LeicaBase : MABase
{
    protected string _insp_no = "", _kind = "", _h_operator = "", _product = "", _program = "", _inspect = "", _insp_date = "", _custmer = "";
    protected string _test = "", _ts_standard = "", _result = "", _sp_stand = "", _samp_count = "", _insp_count = "", _birthDt = "", _b_opeartor = "", _prod_index;
    protected string _position = "", _vmi_qty = "0", _vmi_judg,_vmi_time;
    protected string _ft_qty = "", _ft_jdug = "", _s1 = "", _s2 = "", _s3 = "", _s4 = "", _s5 = "";
    public string msg = "", _insp_time = "", _shape = "", _head_id, _base_id, _ft_rowid;
    static string[] Managers = { "eileen.wang", "Casper.Lin" };

    protected string Title = "Leica IPQC生產資訊系統";
    protected data_table lbase, t_ft, vmi, t_vmi, shape, t_shape, track, t_S5, ft_S5, ft, S5;
    protected DataTable db = new DataTable();

    public LeicaBase()
    {

        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //kind 是父層
    public static string[] tree_level = { "Ts_standard", "Test", "Program", "Product", "Kind" };

    public class SQL
    {
        static string sql = "select rowid 'rowno', en,tw ,def from eipe.dbo.Sys_Option where main='Leica' and kind='{0}' order by en ";
        public static string Join = " select  l.rowid 'rowno' ,o.en ,o.tw ,o.def from eipe.dbo.leica_join  l left join eipe.dbo.Sys_Option o on l.item_id=o.rowid where l.parent_id='{0}' order by en ";

        public class Operator
        {
            //類別 Kind
            public static string Kind = string.Format(sql, "Kind");

            //總判定 Result
            public static string Result = string.Format(sql, "Result");
            //檢驗別 Inspect
            // public static string Inspect = string.Format(sql, "Inspect");
            //異常現象 Shape
            public static string Shape = string.Format(sql, "Shape");
            //測試標準 Test Standard
            public static string Test_Standard = string.Format(sql, "Ts_standard");
            //抽樣標準    Sample Standard
            public static string Sample_Standard = string.Format(sql, "Sp_standard");

            //產品 Product
            public static string Product = string.Format(sql, "Product");
            //機種 Program
            public static string Program = string.Format(sql, "Program");
            //異常位置 Position
            public static string Position = string.Format(sql, "Position");
            //判定 Judge
            public static string Judge = string.Format(sql, "Judge");
            //測試項目 Test
            public static string Test = string.Format(sql, "Test");

            public static string Custmer = string.Format(sql, "Custmer");


        }
        public class All
        {
            public static string Menu = "Select  name 'rowno' ,name 'en' ,tag 'tw',0 'def' from eipe.dbo.SYS_Category where program='Leica' and kind='Menu' order by name ";

            public static string Result = string.Format(sql, "Result", "");
            //檢驗別 Inspect
            //public static string Inspect = string.Format(sql, "Inspect", "");
            //異常現象 Shape
            public static string Shape = string.Format(sql, "Shape", "");
            //測試標準 Test Standard
            public static string Test_Standard = string.Format(sql, "Test_Standard", "");
            //抽樣標準    Sample Standard
            public static string Sample_Standard = string.Format(sql, "Sample_Standard", "");
            //類別 Kind
            public static string Kind = string.Format(sql, "Kind", "");
            //產品 Product
            public static string Product = string.Format(sql, "Product", "");
            //機種 Program
            public static string Program = string.Format(sql, "Program", "");
            //異常位置 Position
            public static string Position = string.Format(sql, "Position", "");
            //判定 Judge
            public static string Judge = string.Format(sql, "Judge", "");
            //測試項目 Test
            public static string Test = string.Format(sql, "Test", "");

            public static string Custmer = string.Format(sql, "Custmer", "");
        }

    }



    protected void Create_Table()
    {
        //thead = new data_table("main", "main_id",  "type", "operator",  "inspect_dt", "product", "program",  "result");
        lbase = new data_table("lbase", "head_id", "inspect_id", "inspect", "insp_count", "samp_count", "standard_id", "standard", "bith_date", "b_operator", "seq", "base_id", "curr");
        //--------VMI--------------
        vmi = new data_table("vmi", "base_id", "vmi_id", "position_txt", "position", "qty", "judg_txt", "judgment","vmi_time");
        t_vmi = new data_table("t_vmi", "base_id", "vmi_id", "position_txt", "position", "qty", "judg_txt", "judgment", "vmi_time");
        shape = new data_table("shape", "vmi_id", "shape_txt", "shape", "seq");
        t_shape = new data_table("stemp", "shape_txt", "shape");
        //----------------------
        t_ft = new data_table("t_ft", "base_id", "ft_id", "prod_index", "insp_time");
        ft = new data_table("ft", "base_id", "ft_id", "prod_index", "insp_time");

        t_S5 = new data_table("t_S5", "ft_id", "test", "test_id", "ts_standard", "ts_standard_id", "ft_qty", "ft_jdug", "ft_jdug_id", "s1", "s2", "s3", "s4", "s5");
        ft_S5 = new data_table("ft_S5", "ft_id", "test", "test_id", "ts_standard", "ts_standard_id", "ft_qty", "ft_jdug", "ft_jdug_id", "s1", "s2", "s3", "s4", "s5");
        S5 = new data_table("S5", "ft_id", "test", "test_id", "ts_standard", "ts_standard_id", "ft_qty", "ft_jdug", "ft_jdug_id", "s1", "s2", "s3", "s4", "s5");

    }

    protected void GetTable()
    {
        //thead.Table = (DataTable)ViewState[thead.Name];
        lbase.Table = (DataTable)ViewState[lbase.Name];
        t_ft.Table = (DataTable)ViewState[t_ft.Name];
        vmi.Table = (DataTable)ViewState[vmi.Name];
        t_vmi.Table = (DataTable)ViewState[t_vmi.Name];
        shape.Table = (DataTable)ViewState[shape.Name];
        t_shape.Table = (DataTable)ViewState[t_shape.Name];

        t_ft.Table = (DataTable)ViewState[t_ft.Name];
        t_S5.Table = (DataTable)ViewState[t_S5.Name];
        ft_S5.Table = (DataTable)ViewState[ft_S5.Name];

        S5.Table = (DataTable)ViewState[S5.Name];
        ft.Table = (DataTable)ViewState[ft.Name];
    }

    protected void OutTable()
    {
        //ViewState[thead.Name] = thead.Table;
        ViewState[lbase.Name] = lbase.Table;
        ViewState[vmi.Name] = vmi.Table;
        ViewState[t_vmi.Name] = t_vmi.Table;
        ViewState[t_ft.Name] = t_ft.Table;
        ViewState[shape.Name] = shape.Table;
        ViewState[t_shape.Name] = t_shape.Table;

        ViewState[t_ft.Name] = t_ft.Table;
        ViewState[t_S5.Name] = t_S5.Table;
        ViewState[ft_S5.Name] = ft_S5.Table;

        ViewState[S5.Name] = S5.Table;
        ViewState[ft.Name] = ft.Table;
    }

    #region save

    //ViewState[lbase.Name] = lbase.Table;
    //ViewState[vmi.Name] = vmi.Table;
    //ViewState[shape.Name] = shape.Table;

    private void insert_vmi() { }
    private void insert_shape() { }


    #endregion save

    #region  ddl
    public void getItem(DropDownList list, string sql, string defult)
    {
        if (string.IsNullOrEmpty(defult))
        {
            getItem(list, sql, false);
        }
    }
    public void getItem(DropDownList list, string sql, bool def)
    {
        try
        {

            ListItem[] Item = Utility.getOPItem(sql, list.SelectedValue, lang, def);
            list.Items.Clear();
            list.Items.AddRange(Item);
        }
        catch (Exception ex)
        {
            Utility.log(ex.Message, ex.StackTrace, ex.Source, sql, list.ID);
        }
    }

    protected void ddl_clear(params WebControl[] Controls)
    {
        foreach (WebControl ctl in Controls)
        {
            DropDownList list = (DropDownList)ctl;

            list.Items.Clear();
            list.Enabled = false;
        }
    }

    #region  Operator

    public void OperatorCustmer(DropDownList list, bool def)
    {

        getItem(list, SQL.Operator.Custmer, def);
    }

    public void OperatorProduct(DropDownList list, bool def)
    {

        getItem(list, SQL.Operator.Product, def);
    }

    public void OperatorProgram(DropDownList list, bool def)
    {

        getItem(list, SQL.Operator.Program, def);
    }

    public void OperatorKind(DropDownList list, bool def)
    {

        getItem(list, SQL.Operator.Kind, def);
    }

    public void OperatorResult(DropDownList list, bool def)
    {
        getItem(list, SQL.Operator.Result, false);
    }

    public void OperatorJudg(DropDownList list, bool def)
    {
        getItem(list, SQL.Operator.Judge, false);
    }

    public void OperatorPosition(DropDownList list, bool def)
    {
        getItem(list, SQL.Operator.Position, false);
    }

    public void OperatorShape(DropDownList list, bool def)
    {
        getItem(list, SQL.Operator.Shape, false);
    }

    public void OperatorInpsert(DropDownList list, bool def)
    {
        int index = list.SelectedIndex;


        list.Items.Clear();

        string vmi = lang.ToString() == "tw" ? "外觀" : "VMI";
        string pf = lang.ToString() == "tw" ? "功能性" : "Performance";

        list.Items.Add(new ListItem("Select ", ""));
        list.Items.Add(new ListItem(vmi, "VMI"));
        list.Items.Add(new ListItem(pf, "PF"));

        if (index > 0) //form load 是-1 不設定
        {
            list.Items[index].Selected = true;
        }
        // getItem(list, SQL.Operator.Inspect, false);
    }

    public string GetInspectTxt(string val)
    {
        string result = "";
        string vmi = lang.ToString() == "tw" ? "外觀" : "VMI";
        string pf = lang.ToString() == "tw" ? "功能性" : "Performance";

        if (val == "PF")
        {
            result = pf;
        }
        else
        {
            result = vmi;
        }

        return result;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sql"></param>
    /// <param name="value"></param>
    /// <returns></returns>
    public string GetItemOption(DropDownList list, string value)
    {
        string result = "";
        foreach (ListItem l in list.Items)
        {
            if (l.Value == value)
            {
                result = l.Text;
                break;
            }
        }

        return result;
    }

    public string GetOptionTxt(string rowid)
    {
        string Text = "";

        string sql = string.Format(" select {1} 'text' from eipe.dbo.sys_option where rowid='{0}' ", rowid, lang.ToString());

        Text = Utility.getSingle(sql);

        //using (SqlConnection conn = new SqlConnection(Utility.ConnStr))
        //{
        //    conn.Open();

        //    using (SqlCommand cmd = new SqlCommand(SQL, conn))
        //    {
        //        using (SqlDataReader rd = cmd.ExecuteReader())
        //        {

        //            while (rd.Read())
        //            {
        //                string rowno = rd["rowno"].ToString();
        //                Utility.Debug(value.ToUpper(), rowno.ToUpper());
        //                if (value.ToUpper() == rowno.ToUpper())
        //                {
        //                    Text = (lang.ToString() == "tw") ? rd["tw"].ToString() : rd["en"].ToString();
        //                    break;
        //                }
        //            }
        //        }
        //    }
        //}

        return Text;
    }

    #region Join (enableEventValidation 錯誤解決辦法)
    /*
     * /// 因為在網頁上 ddl_Product 的資料來源源自 leicaconnector.ashx 
    /// 會導致asp.net在傳送網頁時，引發enableEventValidation 驗證 (駭客竄改網頁資料並回傳)
    /// 如https://blog.darkthread.net/blog/kb-about-event-validation-of-asp-net-2-0/所述
    /// ddl_Product的選項的非原生於LeicaAadd中，故網頁強制中止
    /// 
    /// 為解決這個問題，在網頁載入時，將所有屬於product的資料列出，為預設;
    /// 即可解決非原生資料的問題
     */

    /// <summary>
    /// Get Product from Leica_Join ,all item_id
    /// </summary>
    /// <param name="list"></param>
    public void Join_Product(DropDownList list)
    {

        string sql = "select j.rowid,o.en,o.tw,o.def from eipe.dbo.sys_option o left join eipe.dbo.Leica_Join j on o.rowid=j.item_id  where o.main='leica' and kind='product' ";
        getItem(list, sql, false);

    }

    public void Join_Program(DropDownList list)
    {

        string sql = "select j.rowid,o.en,o.tw,o.def from eipe.dbo.sys_option o left join eipe.dbo.Leica_Join j on o.rowid=j.item_id  where o.main='leica' and kind='program' ";
        getItem(list, sql, false);

    }
    public void Join_Test(DropDownList list)
    {

        string sql = "select j.rowid,o.en,o.tw,o.def from eipe.dbo.sys_option o left join eipe.dbo.Leica_Join j on o.rowid=j.item_id  where o.main='leica' and kind='test' ";
        getItem(list, sql, false);

    }
    public void Join_TsSeand(DropDownList list)
    {

        string sql = "select j.rowid,o.en,o.tw,o.def from eipe.dbo.sys_option o left join eipe.dbo.Leica_Join j on o.rowid=j.item_id  where o.main='leica' and kind='ts_standard' ";
        getItem(list, sql, false);
    }

    #endregion Join 

    public void Sample_Standard(DropDownList list, bool def)
    {
        getItem(list, SQL.Operator.Sample_Standard, def);
    }

    public void ddl_join_parent(DropDownList list, string parent_id, bool def)
    {
        string sql = string.Format(SQL.Join, parent_id);

        getItem(list, sql, def);
        list.Enabled = true;
    }

    #endregion

    #region  Search
    public void SearchKind(DropDownList list)
    {
        getItem(list, SQL.All.Kind, false);
    }

    public void SearchResult(DropDownList list)
    {
        getItem(list, SQL.All.Result, false);
    }

    public void SearchProgram(DropDownList list)
    {
        getItem(list, SQL.All.Program, false);
    }

    public void SearchProduct(DropDownList list)
    {
        getItem(list, SQL.All.Product, false);
    }

    //public void SearchInspect(DropDownList list)
    //{
    //    getItem(list, SQL.All.Inspect, false);
    //}

    public void getMenu(DropDownList list)
    {
        DropDownList ddl = new DropDownList();

        string sql = SQL.All.Menu;

        if (!Utility.MIS_Manager(CurrentUser.LogonID))
        {
            sql += "and name <> 'inspect' ";
        }
        getItem(list, sql, false);
    }
    #endregion

    public static string getStandrad(string Standard)
    {
        string value = "";
        if (!string.IsNullOrEmpty(Standard))
        {
            string sql = string.Format("select  {1} 'name' from eipe.dbo.Sys_Option where rowid ='{0}' and main='Leica' ", Standard, "tw");
            value = Utility.getSingle(sql);
        }

        return value;
    }

    #endregion

    #region source

    protected string ddl_Selected(DropDownList list, string parent_id)
    {

        ddl_join_parent(list, parent_id, true);
        list.Enabled = true;
        string value = Utility.getSingle(" SELECT item_id FROM EIPE.DBO.leica_join WHERE ROWID='" + parent_id + "' ");

        return value;
    }

    protected void shape_temp_add(string text)
    {
        string seach = string.Format(" shape ='{0}' ", _shape);

        if (!t_shape.isExist(seach))
        {
            //stemp", "vmi_id", "shape_id", "shape_txt
            t_shape.Table.Rows.Add(text, _shape);
        }
        else
        {
            string js = string.Format("Nomarl.Msg('{0}');", getStr("shape") + " " + getStr("is_exist"));
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "msg", js, true);

        }
    }

    protected void File_list(DataList list)
    {

        DataTable dt;
        using (SqlConnection conn = new SqlConnection(Utility.ConnStr))
        { 
            conn.Open();
            string sql = string.Format("select * from eipe.dbo.leica_file where head_id='{0}' ", _head_id);
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "file");
            dt = ds.Tables["file"]; 
        }

        DataList_Bind(list, dt);

    }


    protected void DataList_Bind(DataList list, DataTable db)
    {
        list.DataSource = db;
        list.DataBind();
    }

    protected void GridView_Bind(GridView gv, DataTable db)
    {
        gv.DataSource = db;
        gv.DataBind();
    }



    /// <summary>
    /// 將join的代號轉成sys_option的 rowid 
    /// </summary>
    /// <param name="rowid"></param>
    /// <returns></returns>
    public static string ConvertToOption(string rowid)
    {
        string sql = string.Format(" select item_id from  eipe.dbo.leica_join where rowid='{0}' ", rowid);

        string item = Utility.getSingle(sql);
        return item;
    }

    /// <summary>
    /// 將sys_opiton 轉成Join代號
    /// </summary>
    /// <param name="item_id">sys_opiton rowid</param>
    /// <param name="parentid">join Parent id</param>
    /// <returns></returns>
    protected static string ConvertToJoin(string item_id, string parentid)
    {

        StringBuilder sb = new StringBuilder();

        sb.AppendFormat("  select rowid from eipe.dbo.leica_join c  where  c.item_id = '{0}'", item_id);
        sb.AppendFormat("and parent_id = '{0}' ", parentid);

        string item = Utility.getSingle(sb.ToString());
        return item;
    }


    protected void Upload_Del(string uid)
    {
        string sql = string.Format(" delete from eipe.dbo.leica_file where head_id='{0}' and rowid='{1}' ", _head_id, uid);
        Utility.execDel(sql);
    }

    protected void upload_download(string uid)
    {
        string sql = string.Format(" select * from eipe.dbo.leica_file where head_id='{0}' and rowid='{1}' ", _head_id, uid);
        //using (WebClient wc = new WebClient())
        //{
        //    wc.Encoding = Encoding.UTF8;
        //    wc.("/comm/download_handler.ashx", "GET", "sql="+sql); //Certify_AD_URL是api的URL、response是回傳的參數
        //}
        string url=Utility.LocalUrl+"/comm/download_handler.ashx";
        
        Utility.Send(url, HttpMethod.Get, "sql=" + sql, null);
    }
    #endregion


    #region save

    protected void Save_Base()
    {
        int i = 1;

        // Leica_Base.Delete(main_id);
        foreach (DataRow row in lbase.Table.Rows)
        {
            Leica_Base lb = new Leica_Base(row);
            lb.Head_ID = _head_id;
            lb.Seq = i.ToString();
            lb.Insert();
            i++;
        }
    }

    protected void Save_VMI()
    {
        foreach (DataRow row in vmi.Table.Rows)
        {
            Leica_VMI v = new Leica_VMI(row);
            v.Insert();

            string sql = string.Format("vmi_id='{0}'", v.Rowid);

            DataRow[] shape_row = shape.Table.Select(sql);

            int i = 1;
            foreach (DataRow s in shape_row)
            {

                Leica_VMI_Shape ls = new Leica_VMI_Shape(s);
                ls.Seq = i.ToString();
                ls.Insert();
                i++;
            }
        }
    }

     
    protected void Save_Feature()
    {

        foreach (DataRow row in ft.Table.Rows)
        {
            Leica_Feature Feature = new Leica_Feature(row);
            Feature.Insert();

            string sql = string.Format(" ft_id='{0}'", Feature.FT_ID);

            DataRow[] s5_rs = S5.Table.Select(sql);

            int seq = 1;
            foreach (DataRow s in s5_rs)
            {
                Leica_Ft_Track track = new Leica_Ft_Track(s);
                track.Seq = Convert.ToString(seq++);
                track.Insert();
            }
        }
    }


    #endregion save

    protected Panel getShapeRegion(string guid)
    {
        DataRow[] Rows = shape.Table.Select(string.Format(" vmi_id='{0}' ", guid));
        Panel p = new Panel();
        Label lab_sp = new Label(); //名稱
        string txt = "";
        foreach (DataRow dr in Rows)
        {

            txt += "<p>" + dr["shape_txt"].ToString() + "</p>";
        }

        lab_sp.Text = txt;
        p.Controls.Add(lab_sp);
        return p;
    }

    protected string File_upload(FileUpload fu)
    {
        string result = "";
        try
        {

            if (fu.HasFile == false)
            {
                result = getStr("not_has_file");
            }
            else
            {
                string sql = string.Format("select * from eipe.dbo.leica_file where  file_name='{0}' and head_id='{1}' ", fu.FileName,_head_id);
                using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    ds.Open(sql);
                    if (ds.EOF)
                    {
                        ds.Add();

                        ds["head_id"] = _head_id;
                        ds["rowid"] = Guid.NewGuid();
                        ds["file_name"] = fu.FileName;
                        ds["kind"] = Path.GetExtension(fu.FileName);
                        ds["arguments"] = fu.FileBytes;
                        ds.Update();
                    }
                    else
                    {
                        result = getStr("file_exist");
                    }

                }


            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        return result;
    }

    public static bool isManager(string logonid)
    {
        bool pass = false;

        foreach (string m in Managers)
        {
            if (logonid.ToUpper() == m.ToUpper())
            {
                pass = true;
                break;
            }
        }

        if (!pass)
        {
            pass=Utility.MIS_Manager(logonid);
        }

        return pass;
    }

    public void VMI_List_Head(GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[1].Text = getStr("position");
            e.Row.Cells[2].Text = getStr("shape");
            e.Row.Cells[3].Text = getStr("d_qty");
            e.Row.Cells[4].Text = getStr("judgment");
        }
    }

    protected void s5_Head(GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[1].Text = getStr("item");
            e.Row.Cells[2].Text = getStr("prod_no");
            e.Row.Cells[3].Text = getStr("insp_time");
            e.Row.Cells[4].Text = getStr("ts_stand");
            e.Row.Cells[5].Text = getStr("qty");
            e.Row.Cells[6].Text = getStr("judg");
            e.Row.Cells[7].Text = getStr("insp_time");
            

        }
    }

    protected Table getView(string baseid)
    {
        Table tb = new Table();
        tb = getVim(baseid);

        if (tb.Rows.Count == 0)
        {
            tb = getFtList(baseid);
        }
        return tb;
    }


    private Table getFtList(string baseid)
    {
        Table tb = new Table();
        tb.ID = baseid;
        tb.GridLines = GridLines.None;


        DataRow[] ft_dr = ft.Table.Select(" base_id='" + baseid + "' "); //不重覆
        int i = 0;
        foreach (DataRow f in ft_dr)
        {
            TableRow tr = new TableRow();

            TableCell td = new TableCell();

            //--------------------------------------

            Table view = getFT2(f);

            if (i % 2 == 0)
            {
                view.CssClass = "comicGreen";
            }
            else
            {
                view.CssClass = "comicYellow";
            }

            //--------------------------------------
            td.Controls.Add(view);
            td.Attributes.Add("align", "center");
            tr.Cells.Add(td);
            tb.Rows.Add(tr);
            i++;
        }

        return tb;
    }

    private Table getFT2(DataRow f)
    {
        Table tb = new Table();

        //prod_index insp_time
        TableHeaderRow hr = new TableHeaderRow();


        //hr.CssClass = "ft_hr";

        //t_ft = new data_table("t_ft", "base_id", "ft_id", "prod_index", "insp_time");
        TableHeaderCell hh_prod = new TableHeaderCell();
        hh_prod.Text = f["prod_index"].ToString();
        //colspan="要橫跨的列數"
        hh_prod.ColumnSpan = 4;
        hr.Cells.Add(hh_prod);


        TableHeaderCell hh_time = new TableHeaderCell();
        hh_time.Text = f["insp_time"].ToString();
        hh_time.ColumnSpan = 5;
        hr.Cells.Add(hh_time);
        tb.Rows.Add(hr);


        DataRow[] R_s5 = S5.Table.Select(string.Format(" ft_id='{0}' ", f["ft_id"].ToString()));
        int i = 0;
        foreach (DataRow s in R_s5)
        {
            TableRow tr = new TableRow();

            //tr.CssClass = "s5_even";
            if (i % 2 == 0)
            {
                //  tr.CssClass = "s5_single";
            }


            TableCell td_ts = DefultTc(120);
            td_ts.Text = s["test"].ToString();
            tr.Cells.Add(td_ts);

            TableCell td_ts_st = DefultTc(120);
            td_ts_st.Text = s["ts_standard"].ToString();
            tr.Cells.Add(td_ts_st);

            TableCell td_qty = DefultTc(80);
            td_qty.Text = s["ft_qty"].ToString();
            tr.Cells.Add(td_qty);

            TableCell td_jdug = DefultTc(120);
            td_jdug.Text = s["ft_jdug"].ToString();
            tr.Cells.Add(td_jdug);

            TableCell td_s1 = DefultTc(60);
            td_s1.Text = s["s1"].ToString();
            tr.Cells.Add(td_s1);

            TableCell td_s2 = DefultTc(60);
            td_s2.Text = s["s2"].ToString();
            tr.Cells.Add(td_s2);

            TableCell td_s3 = DefultTc(60);
            td_s3.Text = s["s3"].ToString();
            tr.Cells.Add(td_s3);

            TableCell td_s4 = DefultTc(60);
            td_s4.Text = s["s4"].ToString();
            tr.Cells.Add(td_s4);

            TableCell td_s5 = DefultTc(60);
            td_s5.Text = s["s5"].ToString();
            tr.Cells.Add(td_s5);

            tb.Rows.Add(tr);
            i++;
        }

        return tb;
    }



    protected Table getVim(string baseid)
    {
        Table tb = new Table();
        tb.CssClass = "vmi_tb";
        tb.Attributes.Add("align", "center");

        //"vmi", "head_id", "vmi_id", "position", "position_id", "qty", "judg", "judg_id"
        DataRow[] Vim_dr = vmi.Table.Select(" base_id='" + baseid + "' ");

        if (Vim_dr.Length > 0)
        {
            StringBuilder sb = new StringBuilder();


            int i = 0;
            foreach (DataRow row in Vim_dr)
            {
                TableRow tr = new TableRow();

                TableCell cell01 = DefultTc(80);
                cell01.Text = row["position_txt"].ToString();
                tr.Cells.Add(cell01);


                TableCell cell02 = DefultTc(80);
                cell02.Controls.Add(getShapeRegion(row["vmi_id"].ToString()));
                tr.Cells.Add(cell02);

                TableCell cell03 = DefultTc(60);
                cell03.Text = row["qty"].ToString();
                tr.Cells.Add(cell03);

                TableCell cell04 = DefultTc(80);
                cell04.Text = row["judg_txt"].ToString();
                tr.Cells.Add(cell04);

                TableCell cell05 = DefultTc(80);
                cell05.Text = row["vmi_time"].ToString();
                tr.Cells.Add(cell05);

                tb.Rows.Add(tr);

                i++;
            }
        }
        return tb;
    }

    protected TableCell DefultTc(int width)
    {
        TableCell cell01 = new TableCell(); //Position 
        cell01.Width = width;
        cell01.BorderWidth = 1;
        // cell01.BorderColor = Utility.HexColor("#5d3d21");
        cell01.Style.Add("padding", "2px");

        return cell01;

    }
}

public class Leica_VMI
{
    Container t;
    string _rowid, _head_id;

    public string Base_Id
    {
        get { return t["base_id"]; }
        set { t["base_id"] = value; }
    }

    public string Rowid
    {
        get { return t["vmi_id"]; }
        set { t["vmi_id"] = value; }
    }

    public string Position
    {
        get { return t["position"]; }
        set { t["position"] = value; }
    }

    public string Qty
    {
        get { return t["qty"]; }
        set { t["qty"] = value; }
    }

    public string Judgment
    {
        get { return t["judgment"]; }
        set { t["judgment"] = value; }
    }

    public string VMI_Time
    {
        get { return t["vmi_time"]; }
        set { t["vmi_time"] = value; }
    }

    public Leica_VMI(DataRow db)
    {
        t = new Container(db);
    }

    /// <summary>
    ///  Delete  eipe.dbo.Leica_VMI
    /// </summary>
    /// <param name="base_id">Base ID</param>
    public static void Delete(string Rowid)
    {
        string del_s = string.Format("delete from eipe.dbo.Leica_VMI where rowid='{0}' ", Rowid);
        Utility.execDel(del_s);
    }

    /// <summary>
    /// Insert Table Leica_Base
    /// </summary>
    /// <returns></returns>
    public bool Insert()
    {
        bool isInsert = false;
        try
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select * from eipe.dbo.Leica_VMI where base_id='{0}' and rowid='{1}' ", Base_Id, Rowid);

                ds.Open(sql);
                if (ds.EOF)
                {
                    ds.Add();
                    ds["base_id"] = Base_Id;
                    ds["rowid"] = Rowid;
                    ds["position"] = Position;
                    ds["qty"] = Qty;
                    ds["judgment"] = Judgment;
                    ds["insp_time"] = VMI_Time;
                    ds.Update();
                    isInsert = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return isInsert;
    }
 
}

public class Leica_VMI_Shape
{
    Container t;
    string _seq;

    public Leica_VMI_Shape(DataRow db)
    {
        t = new Container(db);
    }

    public string VMI_Id
    {
        get { return t["vmi_id"]; }
        set { t["vmi_id"] = value; }
    }
    public string Seq
    {

        set { _seq = value; }
    }
    public string Shape
    {
        get { return t["shape"]; }
        set { t["shape"] = value; }
    }

    /// <summary>
    ///  delete Leica_VMI_Shape by vmi_id
    /// </summary>
    /// <param name="vmi_id"> Leica_VMI rowid</param>
    public static void Delete(string vmi_id)
    {
        string del_s = string.Format("delete from eipe.dbo.Leica_VMI_Shape where vmi_id='{0}' ", vmi_id);
        Utility.execDel(del_s);
    }

    /// <summary>
    /// Insert Table Leica_Base
    /// </summary>
    /// <returns></returns>
    public bool Insert()
    {
        bool isInsert = false;
        try
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select * from eipe.dbo.Leica_VMI_Shape where vmi_id='{0}' and seq='{1}' ", VMI_Id, _seq);

                ds.Open(sql);

                if (ds.EOF)
                {
                    ds.Add();
                    ds["vmi_id"] = VMI_Id;
                    ds["seq"] = _seq;
                    ds["shape"] = Shape;

                    ds.Update();
                    isInsert = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return isInsert;
    }

    ///// <summary>
    ///// Update Table  Leica_Base
    ///// </summary>
    ///// <returns></returns>
    //public bool Update()
    //{
    //    bool isUpdate = false;
    //    try
    //    {
    //        using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
    //        {
    //            string sql = string.Format("select rowid,insp_count,samp_count,standard_id,bith_date,b_operator,seq from eipe.dbo.Leica_VMI where rowid='{0}' ", VMI_Id);
    //            ds.Open(sql);
    //            if (!ds.EOF)
    //            {
    //                if (!string.IsNullOrEmpty(VMI_Id)) ds["vmi"] = VMI_Id;
    //                if (!string.IsNullOrEmpty(Seq)) ds["seq"] = Seq;
    //                if (!string.IsNullOrEmpty(Shape)) ds["shape"] = Shape;

    //                ds.Update();
    //                isUpdate = true;
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //    return isUpdate;
    //}
}

public class Leica_Base
{
    Container t;
    string _rowid, _head_id;
    //lbase = new data_table("lbase", "head_id", "inspect_id", "inspect", "insp_count", "samp_count", "standard_id", "standard", "bith_date", "b_operator","rowid");
    public Leica_Base(DataRow db)
    {
        t = new Container(db);
    }

    public string Head_ID
    {
        get { return t["head_id"]; }
        set { t["head_id"] = value; }
    }
    public string Insp_Count
    {
        get { return t["insp_count"]; }
        set { t["insp_count"] = value; }
    }
    public string Samp_Count
    {
        get { return t["samp_count"]; }
        set { t["samp_count"] = value; }
    }
    public string Standard_Id
    {
        get { return t["standard_id"]; }
        set { t["standard_id"] = value; }
    }
    public string Bith_Date
    {
        get { return t["bith_date"]; }
        set { t["bith_date"] = value; }
    }
    public string B_Operator
    {
        get { return t["b_operator"]; }
        set { t["b_operator"] = value; }
    }
    public string Seq
    {
        get { return t["seq"]; }
        set { t["seq"] = value; }
    }
    public string Base_ID
    {
        get
        {
            return t["base_id"];
        }
        set
        {
            t["base_id"] = value;
        }
    }
    public string Inspect
    {
        get { return t["inspect_id"].ToString(); }
        set { t["inspect_id"] = value; }
    }



    /// <summary>
    /// delete Table Leica_Base
    /// </summary>
    public static void Delete(string head_id)
    {
        string del_s = string.Format("delete from eipe.dbo.Leica_Base where head_id='{0}' ", head_id);
        Utility.execDel(del_s);
    }

    /// <summary>
    /// Insert Table Leica_Base
    /// </summary>
    /// <returns></returns>
    public bool Insert()
    {
        bool isInsert = false;
        try
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select * from eipe.dbo.Leica_Base where rowid='{0}' ", Base_ID);

                ds.Open(sql);

                if (ds.EOF)
                {
                    ds.Add();
                    ds["head_id"] = Head_ID;
                    ds["rowid"] = Base_ID;
                    ds["inspect"] = Inspect;
                    ds["insp_count"] = Insp_Count;
                    ds["samp_count"] = Samp_Count;
                    ds["standard_id"] = Standard_Id;
                    ds["bith_date"] = Bith_Date;
                    ds["b_operator"] = B_Operator;
                    ds["seq"] = Seq;

                    ds.Update();
                    isInsert = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return isInsert;
    }

    /// <summary>
    /// Update Table  Leica_Base
    /// </summary>
    /// <returns></returns>
    public bool Update()
    {
        bool isUpdate = false;
        try
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select rowid,insp_count,samp_count,standard_id,bith_date,b_operator,seq from eipe.dbo.Leica_Base where rowid='{0}' ", Base_ID);
                ds.Open(sql);
                if (!ds.EOF)
                {
                    ds["insp_count"] = string.IsNullOrEmpty(Insp_Count) ? "0" : Insp_Count;
                    ds["samp_count"] = string.IsNullOrEmpty(Samp_Count) ? "0" : Samp_Count;
                    ds["standard_id"] = string.IsNullOrEmpty(Standard_Id) ? Guid.Empty.ToString() : Standard_Id;
                    ds["bith_date"] = string.IsNullOrEmpty(Bith_Date) ? "" : Bith_Date;

                    if (!string.IsNullOrEmpty(B_Operator)) ds["b_operator"] = B_Operator;
                    if (!string.IsNullOrEmpty(Seq)) ds["seq"] = Seq;

                    ds.Update();
                    isUpdate = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return isUpdate;
    }

}

public class Leica_Head
{
    string _rowid = "", _insp_no = "", _kind = "", _h_operator = "", _status = "", _product = "", _program = "";
    string _insp_dt = "", _result = "", _create_date = "", _create_user = "", _modify_date = "", _modify_user = "";
    string _custmer;
    public string ROWID
    {
        set { _rowid = value; }
        get { return _rowid; }
    }

    public string Insp_No
    {
        get { return _insp_no; }
        set { _insp_no = value; }
    }
    public string Kind
    {
        get { return _kind; }
        set { _kind = value; }
    }
    public string H_Operator
    {
        get { return _h_operator; }
        set { _h_operator = value; }
    }
    public string Status
    {
        get { return _status; }
        set { _status = value; }
    }
    public string Product
    {
        get { return _product; }
        set { _product = value; }
    }
    public string Program
    {
        get { return _program; }
        set { _program = value; }
    }
    public string Insp_Dt
    {
        get { return Convert.ToDateTime(_insp_dt).ToShortDateString(); }
        set { _insp_dt = value; }
    }
    public string Result
    {
        get { return _result; }
        set { _result = value; }
    }
    public string Create_User
    {
        set { _create_user = value; }
        get { return _create_user; }
    }
    public string Modify_User
    {
        set { _modify_user = value; }

    }

    public string Custmer
    {
        set { _custmer = value; }
        get { return _custmer; }

    }

    /// <summary>
    /// delete Table Leica_Base
    /// </summary>
    public static void Delet(string rowid)
    {
        string del_s = string.Format("delete from eipe.dbo.Leica_Head where rowid='{0}' ", rowid);
        Utility.execDel(del_s);
    }


    public void Query(string rowid)
    {
        using (System.Data.SqlClient.SqlConnection cn = new System.Data.SqlClient.SqlConnection(Utility.ConnStr))
        {
            cn.Open();
            //3.引用SqlCommand物件
            string sql = string.Format("select * from eipe.dbo.Leica_head where rowid='{0}' ", rowid);
            using (SqlCommand command = new SqlCommand(sql, cn))
            {
                using (SqlDataReader rs = command.ExecuteReader())
                {
                    try
                    {
                        while (rs.Read())
                        {
                            //string _rowid = "", _insp_no = "", _kind = "", _h_operator = "", _status = "", _product = "", _program = "", _inspect = "", _result = "", _create_date = "", _create_user = "", _modify_date = "", _modify_user = "";

                            _rowid = rs["rowid"].ToString();
                            _insp_no = rs["insp_no"].ToString();
                            _kind = rs["kind"].ToString();
                            _h_operator = rs["h_operator"].ToString();
                            _status = rs["status"].ToString();
                            _product = rs["product"].ToString();
                            _program = rs["program"].ToString();
                            _result = rs["result"].ToString();
                            _insp_dt = rs["Insp_Dt"].ToString();
                            _custmer = rs["custmer"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    finally
                    {
                        rs.Close();
                    }

                }
            }
        }
    }

    /// <summary>
    /// Insert Table Leica_Base
    /// </summary>
    /// <returns></returns>
    public bool Insert()
    {
        bool isInsert = false;
        try
        {

            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select  * from eipe.dbo.Leica_Head where rowid='{0}' ", ROWID);
                ds.Open(sql);

                if (ds.EOF)
                {
                    ds.Add();

                    ds["rowid"] = ROWID;
                    ds["insp_no"] = Insp_No;
                    ds["kind"] = Kind;
                    ds["h_operator"] = H_Operator;
                    ds["status"] = Status;
                    ds["product"] = Product;
                    ds["program"] = Program;
                    ds["insp_dt"] = Insp_Dt;
                    ds["result"] = Result;
                    ds["create_date"] = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
                    ds["create_user"] = Create_User;
                    ds["custmer"] = Custmer;
                    ds.Update();
                    isInsert = true;
                }
            }
        }
        catch (Exception ex)
        {
            System.Web.HttpContext.Current.Response.Write(ex.Message + "<br>" + ex.StackTrace);
            throw ex;
        }

        return isInsert;
    }

    /// <summary>
    /// Update Table  Leica_Base
    /// </summary>
    /// <returns></returns>
    public bool Update()
    {
        bool isUpdate = false;
        try
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select *  from eipe.dbo.Leica_Head where rowid='{0}' ", ROWID);
                ds.Open(sql);
                if (!ds.EOF)
                {
                    if (Kind != null) ds["kind"] = Kind;
                    if (H_Operator != null) ds["h_operator"] = H_Operator;
                    if (Status != null) ds["status"] = Status;
                    if (Product != null) ds["product"] = Product;
                    if (Program != null) ds["program"] = Program;
                    if (Status != null) ds["insp_dt"] = Insp_Dt;
                    if (Result != null) ds["result"] = Result;
                    if (Custmer != null) ds["custerm"] = Custmer;

                    ds["modify_date"] = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
                    ds["modify_user"] = _modify_user;

                    ds.Update();
                    isUpdate = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return isUpdate;
    }

    /// <summary>
    ///
    /// </summary>
    public static bool Stata_Change(status s, string rowid)
    {
        bool isUpdate = false;
        using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = string.Format("select * from eipe.dbo.Leica_Head where rowid='{0}' ", rowid);
            ds.Open(sql);
            if (!ds.EOF)
            {
                ds["status"] = (int)s;
                ds.Update();
                isUpdate = true;
            }
        }

        return isUpdate;
    }
}

public class Leica_Feature
{
    string _base_id = null, _ft_id = null, prod_index = null, insp_time = null;

    Container t;
    public Leica_Feature(DataRow db)
    {
        t = new Container(db);
    }


    public string Base_ID
    {
        set { t["base_id"] = value; }
        get { return t["base_id"]; }
    }

    public string FT_ID
    {
        get { return t["ft_id"]; }
        set { t["ft_id"] = value; }
    }

    public string Prod_Index
    {
        get { return t["prod_index"]; }
        set { t["prod_index"] = value; }
    }

    public string Insp_Time
    {
        get { return t["insp_time"]; }
        set { t["insp_time"] = value; }
    }

    /// <summary>
    /// delete Table Leica_Base
    /// </summary>
    public static void Delete(string base_id)
    {
        string del_s = string.Format("delete from eipe.dbo.Leica_Feature where base_id='{0}' ", base_id);
        Utility.execDel(del_s);
    }

    /// <summary>
    /// Insert Table Leica_Base
    /// </summary>
    /// <returns></returns>
    public bool Insert()
    {
        bool isInsert = false;
        try
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select  base_id,ft_id,prod_index,insp_time from eipe.dbo.Leica_Feature where ft_id='{0}' ", FT_ID);
                ds.Open(sql);

                if (ds.EOF)
                {
                    ds.Add();

                    ds["ft_id"] = FT_ID;
                    ds["base_id"] = Base_ID;
                    ds["prod_index"] = Prod_Index;
                    ds["insp_time"] = Insp_Time;

                    ds.Update();
                    isInsert = true;
                }
            }
        }
        catch (Exception ex)
        {
            System.Web.HttpContext.Current.Response.Write(ex.Message + "<br>" + ex.StackTrace);
            throw ex;
        }

        return isInsert;
    }

    /// <summary>
    /// Update Table  Leica_Base
    /// </summary>
    /// <returns></returns>
    public bool Update()
    {
        bool isUpdate = false;
        try
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select base_id,rowid,prod_index,insp_time  from eipe.dbo.Leica_Feature where ft_id='{0}' ", FT_ID);
                ds.Open(sql);
                if (!ds.EOF)
                {

                    ds["prod_index"] = Prod_Index;
                    ds["insp_time"] = Insp_Time;

                    ds.Update();
                    isUpdate = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return isUpdate;
    }
}

public class Leica_Ft_Track
{

    string _seq;
    Container t;
    public Leica_Ft_Track(DataRow db)
    {
        t = new Container(db);
    }

    #region colnum

    public string FT_ID
    {
        set { t["ft_id"] = value; }
        get { return t["ft_id"]; }
    }
    public string Seq
    {
        set { _seq = value; }

    }
    public string Test
    {
        get { return t["test_id"]; }
        set { t["test_id"] = value; }
    }
    public string Standard
    {
        get { return t["ts_standard_id"]; }
        set { t["ts_standard_id"] = value; }
    }
    public string Qty
    {
        get { return t["ft_qty"]; }
        set { t["ft_qty"] = value; }
    }
    public string Judgment
    {
        get { return t["ft_jdug_id"]; }
        set { t["ft_jdug_id"] = value; }
    }
    public string S1
    {
        get { return t["s1"]; }
        set { t["s1"] = value; }
    }
    public string S2
    {
        get { return t["s2"]; }
        set { t["s2"] = value; }
    }
    public string S3
    {
        get { return t["s4"]; }
        set { t["s1"] = value; }
    }
    public string S4
    {
        get { return t["s4"]; }
        set { t["s4"] = value; }
    }
    public string S5
    {
        get { return t["s5"]; }
        set { t["s5"] = value; }
    }


    #endregion

    /// <summary>
    /// delete Table Leica_Base
    /// </summary>
    public static void Delete(string ft_id)
    {
        string del_s = string.Format("delete from eipe.dbo.Leica_Ft_Track where ft_id ='{0}' ", ft_id);
        Utility.execDel(del_s);
    }

    /// <summary>
    /// Insert Table Leica_Base
    /// </summary>
    /// <returns></returns>
    public bool Insert()
    {
        bool isInsert = false;
        try
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select  ft_id,seq,test,standard,qty,judgment,s1,s2,s3,s4,s5 from eipe.dbo.Leica_Ft_Track where ft_id='{0}' and seq='{1}' ", FT_ID, _seq);
                ds.Open(sql);

                if (ds.EOF)
                {
                    ds.Add();
                    ds["ft_id"] = FT_ID;
                    ds["seq"] = _seq;
                    ds["test"] = LeicaBase.ConvertToOption(Test);
                    ds["standard"] = LeicaBase.ConvertToOption(Standard);
                    ds["qty"] = Qty;
                    ds["judgment"] = Judgment;
                    ds["s1"] = S1;
                    ds["s2"] = S2;
                    ds["s3"] = S3;
                    ds["s4"] = S4;
                    ds["s5"] = S5;

                    ds.Update();
                    isInsert = true;
                }
            }
        }
        catch (Exception ex)
        {
            System.Web.HttpContext.Current.Response.Write(ex.Message + "<br>" + ex.StackTrace);
            throw ex;
        }

        return isInsert;
    }

    /// <summary>
    /// Update Table  Leica_Base
    /// </summary>
    /// <returns></returns>
    public bool Update()
    {
        bool isUpdate = false;
        try
        {
            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format("select ft_id,seq,test,standard,qty,judgment,s1,s2,s3,s4,s5  from eipe.dbo.Leica_Feature where ft_id='{0}' ", FT_ID);
                ds.Open(sql);

                if (!ds.EOF)
                {
                    ds["test"] = Test;
                    ds["standard"] = Standard;
                    ds["qty"] = Qty;
                    ds["judgment"] = Judgment;
                    ds["s1"] = S1 == null ? "" : S1;
                    ds["s2"] = S2 == null ? "" : S2;
                    ds["s3"] = S3 == null ? "" : S3;
                    ds["s4"] = S4 == null ? "" : S4;
                    ds["s5"] = S5 == null ? "" : S5;

                    ds.Update();
                    isUpdate = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return isUpdate;
    }




}

