using System;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;

/// <summary>
/// MRS_Base 的摘要描述
/// </summary>
public class MRS_Base : SmoothEnterprise.Web.Page
{
    public string ModID = "";
    public string Modvalue = "";
    public string Modmac = "";
    public string Remark = "";
    public string Modper = "";
    public string Plandate = "";
    public string Actdate = "";
    public string Initdate = "";
    public string ModName = "";
    public string ModCap = "";
    public string ModMaterial = "";
    public string RecordNo = "";

    public readonly string SQL_MRS_Item = " select * from eipe.dbo.MRS_Item  WHERE transfer='{0}' and rowid = '{1}' ";
    public Record getRecord(string rownid)
    {
        Record code = new Record();

        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" select * from eipe.dbo.MRS_record  WHERE Rowid = '" + rownid + "' ");

            rs.Open(sb.ToString());

            if (!rs.EOF)
            {
                
                code.DownDt = Convert.ToDateTime(rs["DownDt"]);
                code.DownPer = rs["DownMan"].ToString();
                code.DownRocord = new Guid(rs["Reason"].ToString());
                code.RecordNo = rs["RecordNo"].ToString();
                code.Qty = Convert.ToInt16(rs["Qty"].ToString());
                code.UpDt = Convert.ToDateTime(rs["UpDt"].ToString());
                code.UpPer = rs["UpMan"].ToString(); 
                code.ModelID= rs["ModID"].ToString();
                code.MacID = rs["MacID"].ToString();
                code.Material = rs["Material"].ToString();
                code.ModCap = rs["ModCap"].ToString();

            }
            rs.Close();
        }
        return code;
    }

    protected void setTestModel(string SQL)
    {
        Tool obj = getMRSDaily(SQL);

        if (obj.ModID == null)
        {
            Response.Redirect("MRS.aspx");
        }
        else
        {
            ModID = ShowNull(obj.ModID);
            Modvalue = ShowNull(obj.ModValue);
            Modmac = ShowNull(getMachine(obj.MachineID));
            Remark = ShowNull(obj.Remark);
            Modper = ShowNull(getMember(obj.ModPer));
            Plandate = ShowNull(obj.PlatDt);
            Actdate = ShowNull(obj.ActDt);
            Initdate = ShowNull(obj.InitDt);
            ModName = ShowNull(getModel(obj.ModID));
            ModMaterial = ShowNull(getMaterial(obj.ModName));
        }
    }
    protected Tool getMRSDaily(string SQL)
    {
        Tool obj = new Tool();

        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        {

            rs.Open(SQL.ToString());

            if (!rs.EOF)
            {
                obj.ModID = rs["ModId"].ToString();
                obj.ModValue = rs["ModValue"].ToString();
                obj.ModName = rs["ModName"].ToString();
                obj.MachineID = rs["ModMac"].ToString();
                obj.Remark = rs["Remark"].ToString();
                obj.ModPer = rs["ModPer"].ToString();
                obj.PlatDt = rs["PlanDate"].ToString();
                obj.ActDt = rs["ActDate"].ToString();
                obj.InitDt = Convert.ToDateTime(rs["initdate"].ToString()).ToShortDateString();


            }
            rs.Close();
        }
        return obj;
    }

    protected void Transfer(string rowid)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            rs.Open(" select * from eipe.dbo.MRS_Item  WHERE rowid = '" + rowid + "' ");

            rs["transfer"] = 1;
            rs.Update();
            rs.Close();
        }
    }



    protected string getRecordNo()
    {
        DateTime FirstDay = DateTime.Now.AddDays(-DateTime.Now.Day + 1);
        DateTime LastDay = DateTime.Now.AddMonths(1).AddDays(-DateTime.Now.AddMonths(1).Day);
        int LastNo = 0;

        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(" select count(Rowid) as LastNo from eipe.dbo.MRS_Record  WHERE  createdt between ('" + FirstDay.ToShortDateString() + " 00:00:00" + "')  and ('" + LastDay.ToShortDateString() + " 23:59:59" + "')");

            rs.Open(sb.ToString());

            if (!rs.EOF)
            {
                LastNo = Convert.ToInt16(rs["LastNo"]);
            }
            rs.Close();
        }

        LastNo++;

        String pnum = (LastNo.ToString()).PadLeft(4, '0');
        pnum = "MRS-" + FirstDay.ToString("yyyyMM-") + pnum;

        return pnum;

    }


    /// <summary>
    /// eet Machine Title by my SQL
    /// </summary>
    /// <param name="Mac">string MacID</param>
    /// <returns></returns>
    public string getMachine(string Mac)
    {
        string Machine = "";

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString))
        {
            string SQL = " SELECT *  FROM   Openquery(mysql,  ' select BaseType,BaseId,BaseName  from  BaseInfo  where BaseType=''I'' and CancelB=''N''  and CONCAT(BaseType,BaseId)=''" + Mac + "'' order by BaseName ')";
            conn.Open();
            SqlCommand cmd = new SqlCommand(SQL, conn);
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                while (rd.Read())
                {
                    Machine = rd["BaseName"].ToString();
                }
                rd.Close();
            }
            conn.Close();
        }
        return Machine;
    }

    // 試模人員
    public string getMember(string Uid)
    {
        string Member = "";

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString))
        {
            string SQL = " SELECT *  FROM   Openquery(mysql, 'select CONCAT(BaseType,BaseId) as ''member'',BaseId,BaseName  from  BaseInfo  where BaseType=''J'' and CancelB=''N'' and CONCAT(BaseType,BaseId)=''" + Uid + "''  order by BaseName ')";
            conn.Open();
            SqlCommand cmd = new SqlCommand(SQL, conn);
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                while (rd.Read())
                {
                    Member = rd["BaseName"].ToString();
                }
                rd.Close();
            }
            conn.Close();
        }
        return Member;
    }


    //模具名稱
    public string getModel(string ModId)
    {

        string Title = "";

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString))
        {
            string SQL = "SELECT *  FROM   Openquery(mysql, '  select Modid  ,Modcap  from ModelSpace2  where Modid=''" + ModId + "''')";

            conn.Open();
            SqlCommand cmd = new SqlCommand(SQL, conn);
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                while (rd.Read())
                {
                    Title = rd["Modcap"].ToString();
                }
                rd.Close();

            }
            conn.Close();
        }
        return Title;
    }

    //原料
    public string getMaterial(string ID)
    {
        string Material = "";

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString))
        {
            string SQL = "SELECT *  FROM   Openquery(mysql, ' select BaseType,BaseId,BaseName  from  BaseInfo  where BaseType=''H'' and CancelB=''N'' and CONCAT(BaseType,BaseId)=''" + ID + "'' ')";

            conn.Open();
            SqlCommand cmd = new SqlCommand(SQL, conn);
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                while (rd.Read())
                {
                    Material = rd["BaseName"].ToString();
                }
                rd.Close();

            }
            conn.Close();
        }
        return Material;
    }

    public ListItem[] getDownReason()
    {
        return getDownReason("");
    }
    public ListItem[] getDownReason(string seletor)
    {
        ListItem[] ItemTag = new ListItem[0];
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        try
        {
            string SQL = "select rowid,name from eipe.dbo.sys_tage where system='MRS' order by seq ";

            rs.Open(SQL);

            int iCount = rs.Rows.Count + 1;
            ItemTag = new ListItem[(iCount)];

            ItemTag[0] = new ListItem("Select", "0");

            int i = 0;
            while (!rs.EOF)
            {
                i += 1;
                ItemTag[i] = new ListItem(rs["name"].ToString(), rs["rowid"].ToString());

                if (rs["rowid"].ToString() == seletor)
                {
                    ItemTag[i].Selected = true;
                }
                rs.MoveNext();

            }

            rs.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return ItemTag;
    }

    public static string ShowNull(string obj)
    {
        string result = "&nbsp";
        if (!string.IsNullOrEmpty(obj))
        {
            result = obj;
        }
        return result;
    }

    protected virtual Tool UpdateTest(string SeqNo)
    {
        Tool obj = new Tool();
        string rowid = getRowID(SeqNo);

        if (!string.IsNullOrEmpty(rowid))
        {
            string sql = string.Format(SQL_MRS_Item, "0", rowid);
            obj = getMRSDaily(sql);
            return obj;
        }
        else
        {
            return null;
        }
    }

    private string getRowID(string SeqNo)
    {
        string rowid = "";

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString))
        {
            string SQL = "select rowid from eipe.dbo.MRS_Item where seq='" + SeqNo + "' and transfer='0' ";
            conn.Open();
            SqlCommand cmd = new SqlCommand(SQL, conn);
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                while (rd.Read())
                {
                    rowid = rd["rowid"].ToString();
                }
                rd.Close();
            }
            conn.Close();
        }
        return rowid;
    }
}

public class Record
{
    public Guid RowID;
    public Guid TestID;
    public string RecordNo;
    public DateTime UpDt;
    public string UpPer;
    public DateTime DownDt;
    public string DownPer;
    public Guid DownRocord;
    public int Qty;
    public string ModelID;
    public string ModCap;
    public string MacID;
    public string Material;
}
public class Tool
{
    public string ModID;
    public string ModName;
    public string ModValue;
    public string MachineID;
    public string Material;
    public string rowid;
    public string Remark;
    public string ModPer;
    public string PlatDt;
    public string ActDt;
    public string InitDt;
    public string Index;
}