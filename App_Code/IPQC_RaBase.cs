using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// IPQC_Ra 的摘要描述
/// </summary>
public class IPQC_RaBase : SmoothEnterprise.Web.Page
{
    protected string _test_item = "";
    protected string _test_type = "";
    protected string _product = "";
    protected string _unit = "";
    protected string _user = "";

    protected string _dept = "";
    protected string _deptNo = "";
    protected string _dispatch = "";

    protected string _tooling = "";
    protected string _material = "";
    protected string _program = "";
    protected int _sample = 0;
    protected string _equipment = "";
    protected string _week = "";
    protected DateTime _receivedDt;
    protected DateTime _bomDt;
    protected DateTime _manufactureDt;
    protected string _rowid;
    protected string _remark;
    protected status _cStatus;


    public language lang;

    public IPQC_RaBase()
    {

    }

    public static class Option
    {
        private static string _sql = "select rowid,en,tw,def from eipe.dbo.IPQC_Ra_Option where  Kind = '{0}' and display='1'  order by en ";

        public static readonly string Unit = string.Format(_sql, "Data Unit");
        public static readonly string Product = string.Format(_sql, "Product Type");
        public static readonly string Test_Item = string.Format(_sql, "Test Item");
        public static readonly string Test_Type = string.Format(_sql, "Test Type");
        public static readonly string Program = string.Format(_sql, "Program");
        public static readonly string RART = string.Format(_sql, "RART side");
        public static readonly string Material = string.Format(_sql, "Material");
    }

    public static string[] Adminstrator = { "CAROL.YEH", "HERZOG.LIN", "THOMAS.HSIAO", "CAROL" };

    private bool Manage()
    {
        bool isManage = false;

        foreach (string User in Adminstrator)
        {
            if (CurrentUser.LogonID.ToUpper() == User)
            {
                isManage = true;
                break;
            }
        }
        return isManage;
    }

    public static bool isManage
    {
        get
        {
            IPQC_RaBase my = new IPQC_RaBase();
            bool isAdmin = my.Manage();
            return isAdmin;
        }
    }

    public void getProgram(DropDownList List)
    {
        getProgram(List, false);
    }
    public void getProgram(DropDownList List, bool def)
    {
        ListItem[] Item = Utility.getOPItem(Option.Program, List.SelectedValue, (language)lang, def);
        List.Items.Clear();
        List.Items.AddRange(Item);
    }

    public void getTestItem(DropDownList List)
    {
        getTestItem(List, false);
    }
    public void getTestItem(DropDownList List, bool def)
    {
        ListItem[] Item = Utility.getOPItem(Option.Test_Item, List.SelectedValue, (language)lang, def);
        List.Items.Clear();
        List.Items.AddRange(Item);
    }

    public void getTestType(DropDownList List)
    {
        getTestType(List, false);
    }

    public void getTestType(DropDownList List, bool def)
    {
        ListItem[] Item = Utility.getOPItem(Option.Test_Type, List.SelectedValue, (language)lang, false);
        List.Items.Clear();
        List.Items.AddRange(Item);
    }


    public void getProduct(DropDownList List)
    {
        getProduct(List, false);
    }
    public void getProduct(DropDownList List, bool def)
    {
        ListItem[] Item = Utility.getOPItem(Option.Product, List.SelectedValue, (language)lang, def);
        List.Items.Clear();
        List.Items.AddRange(Item);
    }

    public void getMaterial(DropDownList List)
    {
        getMaterial(List, false);
    }
    public void getMaterial(DropDownList List, bool def)
    {
        ListItem[] Item = Utility.getOPItem(Option.Material, List.SelectedValue, (language)lang, def);
        List.Items.Clear();
        List.Items.AddRange(Item);
    }

    public void getMachin(DropDownList List)
    {
        Utility.getMachinV(List);
    }

    public language CurrLang
    {
        get
        {
            language curr = (language)1;

            string langVal = "";

            if (IsPostBack)
            {
                langVal = Request.Form["ctl00$HeaderControl1$FIELD_language"];


                if (string.IsNullOrEmpty(langVal))
                {
                    if (Request.Cookies["userLan"] != null)
                    {
                        langVal = Request.Cookies["userLan"].Value;
                    }
                    else
                    {
                        langVal = curr.ToString();
                    }
                }
            }


            if (langVal.Contains("en"))
            {
                curr = language.en;
            }

            if (langVal.Contains("tw"))
            {
                curr = language.tw;
            }
            return curr;
        }
    }

    public void getDept(string uid)
    {
        string dept = "";
        uid = uid.Replace("{", "").Replace("}", "");
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" select d.dept_no,d.dept_nm,u.name from lea_hm1emp10 e ");
            sb.Append(" left join dguser u on e.emp_no=u.empid ");
            sb.Append(" left join lea_hm1dept10 d on d.dept_no=e.dept_no");
            sb.AppendFormat(" where u.id='{0}' ", uid);

            rs.Open(sb.ToString());
            if (!rs.EOF)
            {
                _dept = rs["dept_nm"].ToString();
                _user = rs["name"].ToString();
                _deptNo = rs["dept_no"].ToString();
            }
            rs.Close();
        }
    }

    public status setStatus
    {
        set
        {
            IPQC_Ra_Head head = new IPQC_Ra_Head();
            head.UpdataStatus(_rowid, value);
            _cStatus = value;
        }
    }


    public static ListItem[] getKind(string request)
    {
        ListItem[] Item = new ListItem[0];

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
        {
            conn.Open();
            string sqlcmd = " select kind from eipe.dbo.IPQC_Ra_Option where kind<>'Report'  group by kind ";
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "temp");

            DataTable dt = ds.Tables["temp"];

            conn.Close();
            da.Dispose();

            int iCount = dt.Rows.Count + 1;
            Item = new ListItem[iCount];
            Item[0] = new ListItem("Select", "");

            int i = 1;
            foreach (System.Data.DataRow row in dt.Rows)
            {
                string value = row[0].ToString();

                string text = row[0].ToString();

                Item[i] = new ListItem(text, value);

                if (value == request)
                {
                    Item[i].Selected = true;
                }

                i++;
            }

            dt.Dispose();
        }

        return Item;
    }

    private bool save(string rowid)
    {

        bool isPass = true;
        string msg = "";

        if (string.IsNullOrEmpty(_dispatch))
        {
            msg = "Dispatch No ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_tooling))
        {
            msg += "Tooling No ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_test_item))
        {
            msg += "Test Item ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_test_type))
        {
            msg += "Test Type ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_product))
        {
            msg += "Product Type ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_material))
        {
            msg += "Material ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_program))
        {
            msg += "Program Name ";
            isPass = false;
        }

        if (_sample <= 0)
        {
            msg += "Sample Quantity ";
            isPass = false;
        }
        if (string.IsNullOrEmpty(_equipment))
        {
            msg += "Manufacturing Equipment ";
            isPass = false;
        }


        if (isPass == true)
        {
            IPQC_Ra_Head head = new IPQC_Ra_Head();
            head.Insert(rowid, _product, _program, _equipment, _tooling, _test_type, _test_item, _deptNo, _bomDt, _receivedDt, _material, _sample, _remark, _dispatch, "um", CurrentUser.ID);
        }
        else
        {
            string show = "please these item: " + msg;
            ClientScript.RegisterStartupScript(this.GetType(), "", "wrong('" + show + "')", true);
        }

        return isPass;
    }

    /// <summary>
    ///  save IPQC_Ra_Head data
    /// </summary>
    /// <param name="rowid"> guid </param>
    /// <param name="action"> CRUD(Create、Read、Update、Delete) </param>
    /// <returns></returns>
    public bool save(string rowid, string action)
    {

        bool isPass = true;
        string msg = "";



        if (string.IsNullOrEmpty(_tooling))
        {
            msg += "Tooling No ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_test_item))
        {
            msg += "Test Item ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_test_type))
        {
            msg += "Test Type ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_product))
        {
            msg += "Product Type ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_material))
        {
            msg += "Material ";
            isPass = false;
        }

        if (string.IsNullOrEmpty(_program))
        {
            msg += "Program Name ";
            isPass = false;
        }

        if (_sample <= 0)
        {
            msg += "Sample Quantity ";
            isPass = false;
        }



        if (isPass == true)
        {
            IPQC_Ra_Head head = new IPQC_Ra_Head();
            if (action == "c")
            {
                head.Insert(rowid, _product, _program, _equipment, _tooling, _test_type, _test_item, _deptNo, _bomDt, _receivedDt, _material, _sample, _remark, _dispatch, "um", CurrentUser.ID);
            }

            if (action == "u")
            {
                head.Update(rowid, _product, _program, _equipment, _tooling, _test_type, _test_item, _bomDt, _material, _sample, _remark);
            }


        }
        return isPass;
    }

    /// <summary>
    /// send mail by mail server
    /// </summary>
    /// <param name="rowid"></param>
    /// <param name="Uid">dguser id</param>
    /// <param name="RecordNo"> IPQC_Ra Number </param>
    /// <param name="SendDt">Send View Date</param>
    /// <param name="SubjectTag"> Subject Tag, Flow statuc ex:送審 </param>
    public static void SendMail(string rowid, string Uid, string RecordNo, string SendDt, string SubjectTag)
    {


        string Subject = "(" + SubjectTag + ") IPQC Ra檢驗單 - " + RecordNo;

        StringBuilder sb = new StringBuilder();
        Dictionary<string, string> User = Utility.GetUIDInfo(Uid);



        sb.AppendFormat("{0} 您好，<br><br> ", User["NAME"].ToString());
        sb.Append("IPQC Ra電子簽核系統內有一筆資料，詳細內容如下<br><br> ");
        sb.AppendFormat("申請單號: {0}<br>", RecordNo);
        sb.AppendFormat("申請日期: {0}<br> ", SendDt);
        sb.AppendFormat("申請內容: {0}/IPQC_Ra/IPQC_RaView.aspx?rowid={1}<br><br>", Utility.LocalUrl, rowid);
        sb.Append("如您想了解更多有關員工入口網站的資訊請點選以下連結進入 <br>");
        sb.Append("<a href=\"" + Utility.LocalUrl + "\">員工入口網站</a><br>");
        sb.Append("感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>");

        Utility.SendMail(User["EMAIL"].ToString(), "ePortal(員工入口網站)", Subject, sb.ToString());

    }

    public string getOptionName(string rowid)
    {
        string text = "";
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string _sql = string.Format("select {1} 'tag' from eipe.dbo.IPQC_Ra_Option where rowid='{0}'  order by en ", rowid, lang.ToString());
            text = rs.ExecuteScalar(_sql).ToString();
        }

        return text;
    }
    
    public static void getGroup(DropDownList list)
    {
        ListItem[] Option = new ListItem[2];


        Option[0] = new ListItem("Mail", "Mail");
        Option[1] = new ListItem("Maintain", "Maintain");

        foreach (ListItem Item in Option)
        {
            if (Item.Value == list.SelectedValue)
            {
                Item.Selected = true;
            }
        }


        list.Items.AddRange(Option);

    }

    public string getStr(string key)
    {
        return this.GetLocalResourceObject(key).ToString();
    }

    public static string getMachinName(string MachineID)
    {
        string Machine = "";
        if (!string.IsNullOrEmpty(MachineID))
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                string sql = "select  m.machineID,builderspec+'#'+ma_location+' '+masupply+' '+maName+' '+convert(nvarchar(10),builderton) 'en' FROM EIPB.dbo.machine_main m where maName <>'清洗機' and machineID='" + MachineID + "'";
                rs.Open(sql);
                if (!rs.EOF)
                {
                    Machine = rs["en"].ToString();
                }

            }
        }
        return Machine;
    }

}


public class IPQC_Ra_Head
{
    public string id = "";
    public string ra_no = "";
    public string product = "";
    public string program = "";
    public string equipment = "";
    public string tooling_no = "";
    public string test_type = "";
    public string test_item = "";
    public string applied_dep = "";
    public DateTime manufacture_dt = DateTime.Now;
    public DateTime received_dt;
    public string material = "";
    public string sample = "";
    public string data_nuit = "";
    public string remark = "";
    public int status = 0;
    public string send_dt = "";
    public string employee = "";
    public string dispatch_no = "";
    public string week = "";
    public string receipt_dt;

    public void Insert(string rowid, string product, string program, string equipment, string tooling_no, string test_type, string test_item, string applied_dep, DateTime bom_dt, DateTime received_dt, string material, int sample, string remark, string dispatch_no, string unit, string employee)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT rowid,ra_no,product,program,equipment,tooling_no,test_type,test_item,applied_dep,manufacture_dt,received_dt,material,sample, ");
            sb.Append(" data_nuit,remark,status,send_date,employee,dispatch_no  FROM EIPE.dbo.IPQC_Ra_Head where 1=0 ");
            rs.Open(sb.ToString());
            rs.Add();

            rs["rowid"] = rowid;
            rs["product"] = product;
            rs["program"] = program;

            rs["test_type"] = test_type;
            rs["test_item"] = test_item;
            rs["applied_dep"] = applied_dep;
            rs["manufacture_dt"] = bom_dt;
            rs["received_dt"] = received_dt;
            rs["material"] = material;
            rs["sample"] = sample;
            //rs["data_nuit"] = unit;
            rs["remark"] = remark;
            rs["status"] = 0;
            rs["employee"] = employee;
            rs["dispatch_no"] = dispatch_no;
            rs["tooling_no"] = tooling_no;
            /*-------------------------*/
            if (!string.IsNullOrEmpty(equipment))
            {
                rs["equipment"] = equipment;
            }


            EIPSysSha SysNum = new EIPSysSha();
            string IPQC_RaNo = SysNum.GetNewSn("N103", DateTime.Now.ToString("yyMM"));

            rs["ra_no"] = IPQC_RaNo;

            rs.Update();
            rs.Close();
        }
    }

    public void GetInfo(string rowid)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT rowid,ra_no,product,program,equipment,tooling_no,test_type,test_item,applied_dep,manufacture_dt,received_dt,material,sample, ");
            sb.AppendFormat(" data_nuit,remark,status,convert(varchar(10),send_date,121) 'send_date',employee,dispatch_no,receipt_dt  FROM EIPE.dbo.IPQC_Ra_Head where rowid='{0}' ", rowid);
            rs.Open(sb.ToString());
            if (!rs.EOF)
            {
                id = rs["rowid"].ToString();
                product = rs["product"].ToString();
                program = rs["program"].ToString();
                equipment = rs["equipment"].ToString();
                tooling_no = rs["tooling_no"].ToString();
                test_type = rs["test_type"].ToString();
                test_item = rs["test_item"].ToString();
                applied_dep = rs["applied_dep"].ToString();
                manufacture_dt = Convert.ToDateTime(rs["manufacture_dt"]);
                received_dt = Convert.ToDateTime(rs["received_dt"]);
                material = rs["material"].ToString();
                sample = rs["sample"].ToString();
                data_nuit = rs["data_nuit"].ToString();
                remark = rs["remark"].ToString();
                status = Convert.ToInt16(rs["status"]);
                send_dt = rs["send_date"].ToString();
                employee = rs["employee"].ToString();
                dispatch_no = rs["dispatch_no"].ToString();
                ra_no = rs["ra_no"].ToString();
                remark = rs["remark"].ToString();
                receipt_dt = string.IsNullOrEmpty(rs["receipt_dt"].ToString()) ? "" : Convert.ToDateTime(rs["receipt_dt"]).ToShortDateString();
            }
            rs.Close();
        }
    }

    public void Update(string rowid, string product, string program, string equipment, string tooling_no, string test_type, string test_item, DateTime bom_dt, string material, int sample, string remark)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT rowid,ra_no,product,program,equipment,tooling_no,test_type,test_item,applied_dep,manufacture_dt,received_dt,material,sample, ");
            sb.AppendFormat(" data_nuit,remark,status,send_date,employee,dispatch_no  FROM EIPE.dbo.IPQC_Ra_Head where rowid='{0}' ", rowid);
            rs.Open(sb.ToString());


            rs["product"] = product;
            rs["program"] = program;

            rs["tooling_no"] = tooling_no;
            rs["test_type"] = test_type;
            rs["test_item"] = test_item;
            rs["manufacture_dt"] = bom_dt;
            rs["material"] = material;
            rs["sample"] = sample;
            rs["remark"] = remark;

            if (!string.IsNullOrEmpty(equipment))
            {
                rs["equipment"] = equipment;
            }

            rs.Update();
            rs.Close();
        }
    }

    public void UpdataStatus(string rowid, status type)
    {
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);

        rs.Open("SELECT * FROM  EIPE.dbo.IPQC_Ra_Head WHERE rowid='" + rowid + "' ");
        if (!rs.EOF)
        {
            if (type == global::status.Send)
            {
                rs["send_date"] = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            }

            rs["status"] = type;
            rs["modify_date"] = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            rs.Update();
        }
        rs.Close();
    }

}