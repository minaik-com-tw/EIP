using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Leica 的摘要描述
/// </summary>
public class LeicaBase : MABase
{
    protected string _insp_no = "", _kind = "", _h_operator = "", _product = "", _program = "", _inspect = "", _insp_date = "";
    protected string _test = "", _ts_standard = "", _result = "", _sp_stand = "", _samp_count = "", _insp_count = "", _birthDt = "", _b_opeartor = "", _prod_index;
    protected string _position = "", _vmi_qty = "0", _vmi_judg;
    protected string _ft_qty = "", _ft_jdug = "", _s1 = "", _s2 = "", _s3 = "", _s4 = "", _s5 = "" ;
    public string msg = "",   _insp_time = "", _shape = "", _head_id, _base_id, _ft_rowid;
    
   

    protected data_table lbase, t_ft, vmi, t_vmi, shape, t_shape, track, t_S5,ft_S5 ;
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
            public static string Inspect = string.Format(sql, "Inspect");
            //異常現象 Shape
            public static string Shape = string.Format(sql, "Shape");
            //測試標準 Test Standard
            public static string Test_Standard = string.Format(sql, "Ts_standard");
            //抽樣標準    Sample Standard
            public static string Sample_Standard = string.Format(sql, "Sp_standard");

            //機種 Program
            public static string Program = string.Format(sql, "Program");
            //異常位置 Position
            public static string Position = string.Format(sql, "Position");
            //判定 Judge
            public static string Judge = string.Format(sql, "Judge");
            //測試項目 Test
            public static string Test = string.Format(sql, "Test");


        }
        public class All
        {
            public static string Menu = "Select  name 'rowno' ,name 'en' ,tag 'tw',0 'def' from eipe.dbo.SYS_Category where program='Leica' and kind='Menu'  ";

            public static string Result = string.Format(sql, "Result", "");
            //檢驗別 Inspect
            public static string Inspect = string.Format(sql, "Inspect", "");
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
        }

    }



    protected void Create_Table()
    {
        //thead = new data_table("main", "main_id",  "type", "operator",  "inspect_dt", "product", "program",  "result");
        lbase = new data_table("lbase", "head_id", "inspect_id", "inspect", "insp_count", "samp_count", "standard_id", "standard", "bith_date", "b_operator", "seq", "base_id");
        //--------VMI--------------
        vmi = new data_table("vmi", "base_id", "vmi_id", "position", "position_id", "qty", "judg", "judg_id");
        t_vmi = new data_table("t_vmi", "base_id", "vmi_id", "position", "position_id", "qty", "judg", "judg_id");
        shape = new data_table("shape", "vmi_id", "shape_id", "shape");
        t_shape = new data_table("stemp", "shape_id", "shape");
        //----------------------
        t_ft = new data_table("t_ft", "base_id", "ft_id", "prod_index", "insp_time");

        t_S5 = new data_table("t_S5", "ft_id", "test", "test_id", "ts_standard", "ts_standard_id", "ft_qty", "ft_jdug" ,"ft_jdug_id", "s1", "s2", "s3", "s4", "s5");
        ft_S5 = new data_table("ft_S5", "ft_id", "test", "test_id", "ts_standard", "ts_standard_id", "ft_qty", "ft_jdug", "ft_jdug_id", "s1", "s2", "s3", "s4", "s5");



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
    }

    #region save

    //ViewState[lbase.Name] = lbase.Table;
    //ViewState[vmi.Name] = vmi.Table;
    //ViewState[shape.Name] = shape.Table;

    private void save_base()
    { 
    }


    private void insert_vmi() { }
    private void insert_shape() { }


    #endregion save

    #region  UI

    #region  ddl
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
            Utility.log(ex.Message, ex.StackTrace, ex.Source, sql);
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
        list.Items.Clear();

        string vmi = lang.ToString() == "tw" ? "外觀" : "VMI";
        string pf = lang.ToString() == "tw" ? "功能性" : "Performance";

        list.Items.Add(new ListItem("Select ", ""));
        list.Items.Add(new ListItem(vmi, "VMI"));
        list.Items.Add(new ListItem(pf, "Performance"));

       // getItem(list, SQL.Operator.Inspect, false);
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
        list.Items.Clear();
        string sql = "select j.rowid,o.en,o.tw,o.def from eipe.dbo.sys_option o left join eipe.dbo.Leica_Join j on o.rowid=j.item_id  where o.main='leica' and kind='product' ";
        getItem(list, sql, false);

    }

    public void Join_Program(DropDownList list)
    {
        list.Items.Clear();
        string sql = "select j.rowid,o.en,o.tw,o.def from eipe.dbo.sys_option o left join eipe.dbo.Leica_Join j on o.rowid=j.item_id  where o.main='leica' and kind='program' ";
        getItem(list, sql, false);

    }
    public void Join_Test(DropDownList list)
    {
        list.Items.Clear();
        string sql = "select j.rowid,o.en,o.tw,o.def from eipe.dbo.sys_option o left join eipe.dbo.Leica_Join j on o.rowid=j.item_id  where o.main='leica' and kind='test' ";
        getItem(list, sql, false);

    }
    public void Join_TsSeand(DropDownList list)
    {
        list.Items.Clear();
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

    public void SearchInspect(DropDownList list)
    {
        getItem(list, SQL.All.Inspect, false);
    }

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
        string seach = string.Format(" shape_id ='{0}' ", _shape);

        if (!t_shape.isExist(seach))
        {
            //stemp", "vmi_id", "shape_id", "shape_txt
            t_shape.Table.Rows.Add(_shape, text);
        }
        else
        {
            string js = string.Format("Nomarl.Msg('{0}');", getStr("shape") + " " + getStr("is_exist"));
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "msg", js, true);

        }
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

    #endregion


}
/*
public class Leica_Ft_Shape

{
    Container t;
    public Leica_Ft_Shape(DataRow db)
    {
        t = new Container(db);
    }

    //"vmi_id", "shape_id", "shape"
    public string VMI_Id
    {
        get { return t["vmi_id"]; }
        set { t["vmi_id"] = value; }
    }
    public string Position
    {
        get { return t["position"]; }
        set { t["position"] = value; }
    }
    public string Shape
    {
        get { return t["shape"]; }
        set { t["shape"] = value; }
    }

    /// <summary>
    /// delete Table Leica_Base
    /// </summary>
    public static void Delete(string vmi_id)
    {
        string del_s = string.Format("delete from eipe.dbo.Leica_VMI_Shape where head_id='{0}' ", vmi_id);
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
                string sql = string.Format("select * from eipe.dbo.Leica_VMI_Shape where vmi_id='{0}' ", Vmi_Id);

                ds.Open(sql);
                ds.Add();
                ds["vmi_id"] = VMI_Id;
                ds["shape"] = Shape;
                ds["seq"] = seq;

                ds.Update();
                isInsert = true;
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
                string sql = string.Format("select rowid,insp_count,samp_count,standard_id,bith_date,b_operator,seq from eipe.dbo.Leica_VMI_Shape where vmi_id='{0}' ", Vmi_Id);
                ds.Open(sql);

                if (!string.IsNullOrEmpty(Vmi_Id)) ds["vmi_id"] = Vmi_Id;
                if (!string.IsNullOrEmpty(Seq)) ds["seq"] = Seq;

                ds.Update();
                isUpdate = true;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return isUpdate;
    }
}
*/

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
        get { return t["judg"]; }
        set { t["judg"] = value; }
    }

    public Leica_VMI(DataRow db)
    {
        t = new Container(db);
    }

    /// <summary>
    ///  Delete  eipe.dbo.Leica_VMI
    /// </summary>
    /// <param name="base_id">Base ID</param>
    public static void Delete(string base_id)
    {
        string del_s = string.Format("delete from eipe.dbo.Leica_VMI where base_id='{0}' ", base_id);
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
                ds.Add();
                ds["base_id"] = Base_Id;
                ds["rowid"] = Rowid;
                ds["position"] = Position;
                ds["qty"] = Qty;
                ds["judgment"] = Judgment;

                ds.Update();
                isInsert = true;
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
                string sql = string.Format("select rowid,insp_count,samp_count,standard_id,bith_date,b_operator,seq from eipe.dbo.Leica_VMI where rowid='{0}' ", Rowid);
                ds.Open(sql);

                if (!string.IsNullOrEmpty(Position)) ds["position"] = Position;
                if (!string.IsNullOrEmpty(Qty)) ds["qty"] = Qty;
                if (!string.IsNullOrEmpty(Judgment)) ds["judgment"] = Judgment;

                ds.Update();
                isUpdate = true;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return isUpdate;
    }
}

public class Leica_VMI_Shape
{
    Container t;

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
        get { return t["seq"]; }
        set { t["seq"] = value; }
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
                string sql = string.Format("select * from eipe.dbo.Leica_VMI_Shape where vmi_id='{0}' ", VMI_Id);

                ds.Open(sql);
                ds.Add();
                ds["vmi_id"] = VMI_Id;
                ds["seq"] = Seq;
                ds["shape"] = Shape;

                ds.Update();
                isInsert = true;
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
                string sql = string.Format("select rowid,insp_count,samp_count,standard_id,bith_date,b_operator,seq from eipe.dbo.Leica_VMI where rowid='{0}' ", VMI_Id);
                ds.Open(sql);

                if (!string.IsNullOrEmpty(VMI_Id)) ds["vmi"] = VMI_Id;
                if (!string.IsNullOrEmpty(Seq)) ds["seq"] = Seq;
                if (!string.IsNullOrEmpty(Shape)) ds["shape"] = Shape;

                ds.Update();
                isUpdate = true;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return isUpdate;
    }
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
                string sql = string.Format("select * from eipe.dbo.Leica_Base where head_id='{0}' ", Head_ID);

                ds.Open(sql);
                ds.Add();
                ds["head_id"] = Head_ID;
                ds["rowid"] = Guid.NewGuid().ToString();
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
                string sql = string.Format("select rowid,insp_count,samp_count,standard_id,bith_date,b_operator,seq from eipe.dbo.Leica_Base where rowid='{0}' ", _rowid);
                ds.Open(sql);

                if (!string.IsNullOrEmpty(Insp_Count)) ds["insp_count"] = Insp_Count;
                if (!string.IsNullOrEmpty(Samp_Count)) ds["samp_count"] = Samp_Count;
                if (!string.IsNullOrEmpty(Standard_Id)) ds["standard_id"] = Standard_Id;
                if (!string.IsNullOrEmpty(Bith_Date)) ds["bith_date"] = Bith_Date;
                if (!string.IsNullOrEmpty(B_Operator)) ds["b_operator"] = B_Operator;
                if (!string.IsNullOrEmpty(Seq)) ds["seq"] = Seq;

                ds.Update();
                isUpdate = true;
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
    string _rowid = "", _insp_no = "", _kind = "", _h_operator = "", _status = "", _product = "", _program = "", _inspect = "", _result = "", _create_date = "", _create_user = "", _modify_date = "", _modify_user = "";

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
    public string Inspect
    {
        get { return _inspect; }
        set { _inspect = value; }
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
        get { return _modify_user; }
    }

    /// <summary>
    /// delete Table Leica_Base
    /// </summary>
    public static void Delet(string rowid)
    {
        string del_s = string.Format("delete from eipe.dbo.Leica_Head where rowid='{0}' ", rowid);
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
                string sql = string.Format("select  * from eipe.dbo.Leica_Head where rowid='{0}' ", ROWID);
                ds.Open(sql);

                ds.Add();

                ds["rowid"] = ROWID;
                ds["insp_no"] = Insp_No;
                ds["kind"] = Kind;
                ds["h_operator"] = H_Operator;
                ds["status"] = Status;
                ds["product"] = Product;
                ds["program"] = Program;
                ds["inspect"] = Inspect;
                ds["result"] = Result;
                ds["create_date"] = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
                ds["create_user"] = Create_User;
                ds.Update();
                isInsert = true;
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
                string sql = string.Format("select rowid,insp_count,samp_count,standard_id,bith_date,b_operator,seq from eipe.dbo.Leica_Head where rowid='{0}' ", ROWID);
                ds.Open(sql);

                if (!string.IsNullOrEmpty(Kind)) ds["kind"] = Kind;
                if (!string.IsNullOrEmpty(H_Operator)) ds["h_operator"] = H_Operator;
                if (!string.IsNullOrEmpty(Status)) ds["status"] = Status;
                if (!string.IsNullOrEmpty(Product)) ds["product"] = Product;
                if (!string.IsNullOrEmpty(Program)) ds["program"] = Program;
                if (!string.IsNullOrEmpty(Inspect)) ds["inspect"] = Inspect;
                if (!string.IsNullOrEmpty(Result)) ds["result"] = Result;
                ds["modify_date"] = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
                ds["modify_user"] = Modify_User;

                ds.Update();
                isUpdate = true;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return isUpdate;
    }
}


