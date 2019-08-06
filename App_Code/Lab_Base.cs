using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Lab_Base 的摘要描述
/// </summary>
public class Lab_Base : SmoothEnterprise.Web.Page
{
    public string top_color = "#f00000";
    public string bottom_color = "#000000";
    public string top_range = "0";
    public string botton_range = "0";
    public int pass = 0;

    protected language _lang;
    protected status _status = 0;
    protected string _head_id;
    protected string _lab_id;
    protected dtPosit _pos = new dtPosit();
    protected dtTs _ts = new dtTs();




    public Lab_Base()
    {

        _lang = CurrLang;
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

    public string getStr(string key)
    {
        return this.GetLocalResourceObject(key).ToString();
    }

    public string getOptionName(string rowid)
    {
        string text = "";
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string _sql = string.Format("select {1} 'tag' from eipe.dbo.IPQC_Ra_Option where rowid='{0}'  order by en ", rowid, _lang.ToString());
            text = rs.ExecuteScalar(_sql).ToString();
        }

        return text;
    }

    public void getUnit(DropDownList list)
    {
        ListItem[] Item = Utility.getOPItem(IPQC_RaBase.Option.Unit, list.SelectedValue, _lang, false);
        list.Items.Clear();
        list.Items.AddRange(Item);
    }

    protected DropDownList add_cbo(string id, string sql, string selected)
    {
        DropDownList List = new DropDownList();
        List.ID = id;
        List.Items.AddRange(Utility.getOPItem(sql, selected, _lang));
        return List;
    }

    public Button GridBtn(string ID, string Text, string RowIndex)
    {
        Button Btn = new Button();

        Btn.ID = ID;
        Btn.Text = Text;
        Btn.CommandName = ID;
        Btn.CommandArgument = RowIndex;
        Btn.Attributes.CssStyle.Add("padding", "1px 5px");
        Btn.Attributes.CssStyle.Add("margin", "2px 2px");
        Btn.Width = 55;
        Btn.Height = 22;

        return Btn;
    }

    protected string save(string lab_id, string head_id, string unit, string receipt_dt, string result, string replay, string filename)
    {
        string guid = "";
        try
        {
            guid = save_Lab(lab_id, head_id, result, replay, filename);
            save_position(guid);
            update_Head_Info(head_id, unit, receipt_dt);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return guid;
    }

    protected string save_Lab(string guid, string head_id, string result, string replay, string files)
    {
        Inspect lab = new Inspect();
        if (string.IsNullOrEmpty(guid))
        {
            guid = Guid.NewGuid().ToString();


            lab.Add(guid, head_id, CurrentUser.ID, result, replay, files);
        }
        else
        {
            lab.Update(guid, CurrentUser.ID, result, replay, files);
        }
        return guid;
    }

    protected void save_position(string lab_id)
    {
        DataTable temp = _pos.Container;
        Position PS = new Position();
        int i = 1;

        if (temp.Rows.Count > 0)
        {
            PS.DelList(lab_id);

            foreach (DataRow Item in temp.Rows)
            {
                string rowid = Item["rowid"].ToString();
                string NewID = Guid.NewGuid().ToString();
                if (!string.IsNullOrEmpty(rowid))
                {
                    if (string.IsNullOrEmpty(PS.rowid))
                    {//沒資料


                        string file_name = Item["file_name"].ToString();
                        string expect_date = Item["expect_date"].ToString();
                        string complate_date = Item["complate_date"].ToString();
                        string rart = Item["rart"].ToString();
                        string average = Item["average"].ToString();
                        string type = Item["type"].ToString();
                        byte[] file = new byte[0];

                        if (type == "t")
                        {//暫存
                            file = getImg(Item["file_attach"].ToString());
                        }
                        else
                        {
                            //解成Byte
                            file = Convert.FromBase64String(Item["file_attach"].ToString());
                        }

                        PS.Add(lab_id, NewID, file_name, file, expect_date, complate_date, rart, average, i);

                        Item["rowid"] = NewID;
                        Item["type"] = "s";
                        Item["file_attach"] = Convert.ToBase64String(file);  //加密成64位元字串
                        tsRsult_Save(rowid, NewID);
                        i++;
                    }

                }

            }
        }
    }

    protected void update_Head_Info(string head_id, string unit, string receipt_dt)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "select * from eipe.dbo.ipqc_ra_head where rowid ='" + head_id + "'";
            rs.Open(sql);

            if (!rs.EOF)
            {
                rs["data_nuit"] = unit;
                rs["receipt_dt"] = receipt_dt;
            }
            rs.Update();
            rs.Close();
        }
    }

    protected byte[] getImg(string path)
    {
        byte[] data = null;

        FileInfo fInfo = new FileInfo(path);
        long length = fInfo.Length;

        using (FileStream fStream = new FileStream(path, FileMode.Open, FileAccess.Read))
        {
            BinaryReader br = new BinaryReader(fStream);
            data = br.ReadBytes((int)length);
        }

        File.Delete(path);

        return data;
    }

    protected void tsRsult_Save(string position, string newID)
    {
        DataRow[] temp = _ts.getList(" position_id='" + position + "' ");

        if (temp.Length > 0)
        {
            Test_result ts_result = new Test_result();
            ts_result.DelList(position);
            int i = 1;
            foreach (DataRow Item in temp)
            {
                string position_id = newID;
                string rowid = Guid.NewGuid().ToString();
                string cav = Item["cav"].ToString();
                string measurement = Item["measurement"].ToString();


                ts_result.Add(rowid, position_id, cav, measurement, i);

                Item["position_id"] = position_id;
                Item["rowid"] = rowid;

                i++;
            }
        }

    }

    public LinkButton ImgButton(string ID, string imgUrl)
    {
        LinkButton lbtn = new LinkButton();
        System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
        img.ImageUrl = imgUrl;
        img.Width = 16;
        img.Height = 16;
        img.Attributes.Add("vertical-align", "middle");
        lbtn.Controls.Add(img);

        return lbtn;
    }

    public void DownloadFile(string ID)
    {
        if (!string.IsNullOrEmpty(ID))
        {
            _pos.getItem(ID);

            if (_pos.type == "s") //s in sql, t is temp
            {
                try
                {
                    base.Response.AddHeader("content-disposition", "attachment;filename=" + Server.UrlPathEncode(_pos.file_name));
                }
                catch
                {
                    base.Response.AddHeader("content-disposition", "attachment;filename=down.");
                    Response.Flush();
                    Response.End();
                }


                base.Response.WriteFile(_pos.file_attach);
                Response.Flush();
                Response.End();
            }
            else
            {
                //t
                DataRow[] Rows = _pos.getList(" rowid='" + ID + "' ");

                if (Rows.Length > 0)
                {
                    string Path = Rows[0]["file_attach"].ToString();
                    string file = Rows[0]["file_name"].ToString();

                    FileInfo fInfo = new FileInfo(Path);
                    long length = fInfo.Length;
                    byte[] data = new byte[length];
                    using (FileStream fs = new FileStream(Path, FileMode.Open, FileAccess.Read))
                    {
                        fs.Read(data, 0, data.Length);

                    }


                    //準備下載檔案 
                    Response.ClearHeaders();
                    Response.Clear();
                    Response.Expires = 0;
                    Response.Buffer = false;
                    Response.ContentType = "Application/save-as";
                    Response.Charset = "utf-8";
                    //透過Header設定檔名 
                    Response.AddHeader("Content-Disposition", "Attachment; filename=" + HttpUtility.UrlEncode(file));
                    Response.BinaryWrite(data);
                    Response.End();

                }

            }
        }
    }

    public static void SendMail(string head_id, string lab_id, string Uid, string RecordNo, string SendDt)
    {


        StringBuilder sb = new StringBuilder();
        Dictionary<string, string> User = Utility.GetUIDInfo(Uid);


        Inspect lab = new global::Inspect();

        lab.GetInfo(lab_id);

        string SubjectTag = "審核";
        string context = "等待你的簽核";
        if (lab.status == (int)status.Stop)
        {
            SubjectTag = "中止";
            context = "已被中止";
        }

        if (lab.status == (int)status.Complete)
        {
            SubjectTag = "審核完成";
            context = "已審核完成";
        }

        if (lab.status == (int)status.Back)
        {
            SubjectTag = "退回";
            context = "已被退回";
        }

        string Subject = "(" + SubjectTag + ") IPQC Ra　實驗室檢驗單 - 單號:" + RecordNo;


        sb.AppendFormat("{0} 您好，<br><br> ", User["NAME"].ToString());
        sb.AppendFormat("IPQC Ra實驗室檢驗單簽核系統內有一筆資料,{0}，詳細資料如下<br><br> ", context);
        sb.AppendFormat("申請單號: {0}<br>", RecordNo);
        sb.AppendFormat("申請日期: {0}<br> ", SendDt);
        if (lab.status == (int)status.Complete)
        {
          string  result = "Pass";
            if (lab.result == 0)
            {
                result = "Pass";
            }
            else if (lab.result == 1)
            {
                result = "Fail";
            }
            else
            {
                result = "OOC";
            }


                sb.AppendFormat("申請結果:{0}<br> ", result);
        }

        sb.AppendFormat("申請內容: {0}IPQC_Ra/lab/labView.aspx?rowid={1}&lab_id={2}<br><br>", Utility.LocalUrl, head_id, lab_id);

        sb.Append("Best Regards,<br>");
        sb.Append("如您想了解更多有關員工入口網站的資訊請點選以下連結進入 <br>");
        sb.Append("<a href=\"" + Utility.LocalUrl + "\">員工入口網站</a><br>");
        sb.Append("感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>");

        Utility.SendMail(User["EMAIL"].ToString(), "ePortal(員工入口網站)", Subject, sb.ToString());

    }

    public static void ReviewerMail(string head_id, string lab_id, string Uid, string RecordNo)
    {
        string Subject = "(催審) IPQC Ra 實驗室資料簽核系統 -單號:" + RecordNo;

        StringBuilder sb = new StringBuilder();
        Dictionary<string, string> User = Utility.GetUIDInfo(Uid);

        sb.AppendFormat("{0} 您好，<br><br> ", User["NAME"].ToString());
        sb.Append("下列單據等待您的簽核<br><br>");
        sb.AppendFormat("申請單號:{0}<br>", RecordNo);
        sb.AppendFormat("申請內容{0}IPQC_Ra/lab/labView.aspx?rowid={1}&lab_id={2}<br><br>", Utility.LocalUrl, head_id, lab_id);

        sb.Append("Best Regards,<br>");
        sb.Append("如您想了解更多有關員工入口網站的資訊請點選以下連結進入 <br>");
        sb.Append("<a href=\"" + Utility.LocalUrl + "\">員工入口網站</a><br>");
        sb.Append("感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>");

        Utility.SendMail(User["EMAIL"].ToString(), "ePortal(員工入口網站)", Subject, sb.ToString());

    }

    protected Inspect getLab(string lab_id)
    {
        Inspect lab = new Inspect();
        if (!string.IsNullOrEmpty(lab_id))
        {
            lab.GetInfo(lab_id);

            _status = (status)lab.status;
            pass = lab.result;
        }
        return lab;
    }

    public void getTsList(string position_id)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {

            string sql = string.Format("select * from eipe.dbo.ipqc_ra_lab_result where position_id='{0}' order by seq", position_id);
            rs.Open(sql);

            while (!rs.EOF)
            {
                string rowid = rs["rowid"].ToString();
                string cav = rs["cav"].ToString();
                string seq = rs["seq"].ToString();
                string measurement = rs["measurement"].ToString();

                _ts.Add(rowid, position_id, cav, measurement, seq);

                rs.MoveNext();
            }
        }
    }


}

public class dtPosit
{
    public string lab_id;
    public string rowid;
    public string file_name;
    public string file_attach;
    public string expect_date;
    public string complate_date;
    public string rart;
    public string average;
    public string type;
    private DataTable _Pos = new DataTable();
    private DataRow[] _PosRows;
    public readonly string tag = "position";

    public dtPosit()
    {
        string[] column = { "lab_id", "rowid", "file_name", "file_attach", "expect_date", "complate_date", "rart", "average", "type" };
        init(column);
    }

    private void init(string[] cols)
    {
        foreach (string item in cols)
        {
            _Pos.Columns.Add(item);
        }
    }

    public void Add(string lab_id, string rowid, string file_name, string file_attach, string expect_date, string complate_date, string rart, string average, string type)
    {
        DataRow dr = _Pos.NewRow();
        dr["lab_id"] = lab_id;
        dr["rowid"] = rowid;
        dr["file_name"] = file_name;
        dr["file_attach"] = file_attach;
        dr["expect_date"] = expect_date;
        dr["complate_date"] = complate_date;
        dr["rart"] = rart;
        dr["average"] = average;
        dr["type"] = type;

        _Pos.Rows.Add(dr);
    }

    /// <summary>
    /// rowid 會由系統重取
    /// </summary>
    /// <param name="List"></param>
    public void AddList(DataRow[] List)
    {
        foreach (DataRow Item in List)
        {
            Copy(Item);
        }
    }

    /// <summary>
    /// rowid 會由系統重取
    /// </summary>
    /// <param name="Item"></param>
    public void Copy(DataRow Item)
    {
        lab_id = Item["lab_id"].ToString();
        rowid = Guid.NewGuid().ToString();
        file_name = Item["file_name"].ToString();
        file_attach = Item["file_attach"].ToString();
        expect_date = Item["expect_date"].ToString();
        complate_date = Item["complate_date"].ToString();
        rart = Item["rart"].ToString();
        average = Item["average"].ToString();
        type = Item["type"].ToString();

        Add(lab_id, rowid, file_name, file_attach, expect_date, complate_date, rart, average, type);
    }

    public DataRow[] getList(string limit)
    {
        _PosRows = _Pos.Select(limit);
        return _PosRows;
    }

    public void getItem(string rowid)
    {
        DataRow[] List = _Pos.Select(" rowid='" + rowid + "' ");
        if (List.Length > 0)
        {
            lab_id = List[0]["lab_id"].ToString();
            rowid = List[0]["rowid"].ToString();
            file_name = List[0]["file_name"].ToString();
            file_attach = List[0]["file_attach"].ToString();

            string expect_date = List[0]["expect_date"].ToString();
            expect_date = string.IsNullOrEmpty(expect_date) ? "" : Convert.ToDateTime(List[0]["expect_date"]).ToShortDateString();
            complate_date = Convert.ToDateTime(List[0]["complate_date"]).ToShortDateString();
            rart = List[0]["rart"].ToString();
            average = List[0]["average"].ToString();
            type = List[0]["type"].ToString();
        }
    }

    public void DelItem(int index)
    {
        _Pos.Rows.RemoveAt(index);
    }

    public DataTable DelList(string limit)
    {
        DataRow[] List = _Pos.Select(limit);

        if (List.Length > 0)
        {
            foreach (DataRow Item in List)
            {
                _Pos.Rows.Remove(Item);
            }
        }
        return _Pos;
    }

    public DataTable Container
    {
        get
        {
            return _Pos;
        }
        set
        {
            _Pos = null;
            _Pos = value;
        }
    }

    public DataRow[] getRows
    {
        get
        {
            return _PosRows;
        }
    }
}

public class dtTs
{

    public string rowid;
    public string position_id;
    public string cav;
    public string measurement;
    public string seq;

    private DataTable _container = new DataTable();
    private DataRow[] _conRows;
    public readonly string tag = "ts_result";

    public dtTs()
    {
        string[] column = { "rowid", "position_id", "measurement", "cav", "seq" };
        init(column);
    }

    private void init(string[] cols)
    {
        foreach (string item in cols)
        {
            _container.Columns.Add(item);
        }
    }

    public void Add(string rowid, string position_id, string cav, string measurement, string seq)
    {
        DataRow dr = _container.NewRow();
        dr["rowid"] = rowid;
        dr["position_id"] = position_id;
        dr["measurement"] = measurement;
        dr["cav"] = cav;
        dr["seq"] = seq;
        _container.Rows.Add(dr);
    }

    /// <summary>
    /// rowid 會由系統重取
    /// </summary>
    /// <param name="List"></param>
    public void AddList(DataRow[] List)
    {
        foreach (DataRow Item in List)
        {
            Copy(Item);
        }
    }

    /// <summary>
    /// rowid 會由系統重取
    /// </summary>
    /// <param name="Item"></param>
    public void Copy(DataRow Item)
    {
        //"rowid", "position_id", "cav", "seq"
        position_id = Item["position_id"].ToString();
        rowid = Guid.NewGuid().ToString();
        cav = Item["cav"].ToString();
        seq = Item["seq"].ToString();
        measurement = Item["measurement"].ToString();

        Add(position_id, rowid, cav, measurement, seq);
    }

    public DataRow[] getList(string limit)
    {
        _conRows = _container.Select(limit);
        return _conRows;
    }

    public void getItem(string rowid)
    {
        //"rowid", "position_id", "cav", "seq" ,"measurement"
        DataRow[] List = _container.Select(" rowid='" + rowid + "' ");
        if (List.Length > 0)
        {
            position_id = List[0]["position_id"].ToString();
            rowid = List[0]["rowid"].ToString();
            cav = List[0]["cav"].ToString();
            measurement = List[0]["measurement"].ToString();
            seq = List[0]["seq"].ToString();

        }
    }

    public void DelItem(int index)
    {
        _container.Rows.RemoveAt(index);
    }

    public DataTable DelList(string limit)
    {
        DataRow[] List = _container.Select(limit);

        if (List.Length > 0)
        {
            foreach (DataRow Item in List)
            {
                _container.Rows.Remove(Item);
            }
        }
        return _container;
    }

    public DataTable Container
    {
        get
        {
            return _container;
        }
        set
        {
            _container = null;
            _container = value;
        }
    }

    public DataRow[] getRows
    {
        get
        {
            return _conRows;
        }
    }
}

// CRUD(Create、Read、Update、Delete)
public class Position
{
    public string lab_id;
    public string rowid;
    public string file_name;
    public string file_attach;
    public string expect_date;
    public string complate_date;
    public string rart;
    public string average;
    public int seq;


    public void Add(string lab_id, string rowid, string file_name, byte[] file_attach, string expect_date, string complate_date, string rart, string average, int seq)
    {
        try
        {


            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = "select * from eipe.dbo.IPQC_Ra_Lab_Position where 1=0";

                rs.Open(sql);
                rs.Add();

                rs["lab_id"] = lab_id;
                rs["rowid"] = rowid;
                rs["file_name"] = file_name;
                rs["file_attach"] = file_attach;
                //rs["expect_date"] = expect_date;
                rs["complate_date"] = complate_date;
                rs["rart"] = rart;
                rs["average"] = Convert.ToDouble(average);
                rs["seq"] = seq;

                rs.Update();
                rs.Close();


            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void Update(string rowid, string file_name, byte[] file_attach, string expect_date, string complate_date, string rart, string average)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "select * from eipe.dbo.IPQC_Ra_Lab_Position where rowid='" + rowid + "'";
            rs.Open(sql);
            if (!rs.EOF)
            {
                rs["file_name"] = file_name;
                rs["file_attach"] = file_attach;
                rs["expect_date"] = expect_date;
                rs["complate_date"] = complate_date;
                rs["rart"] = rart;
                rs["average"] = average;
            }
            rs.Update();
            rs.Close();
        }
    }

    public void GetInfo(string rowid)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string sql = "select * from eipe.dbo.IPQC_Ra_Lab_Position where rowid='" + rowid + "' ";
            rs.Open(sql);

            if (!rs.EOF)
            {
                rowid = rs["rowid"].ToString();
                file_name = rs["file_name"].ToString();
                file_attach = rs["file_attach"].ToString();
                expect_date = Convert.ToDateTime(rs["expect_date"]).ToShortDateString();
                complate_date = Convert.ToDateTime(rs["complate_date"]).ToShortDateString();
                rart = rs["rart"].ToString();
                average = rs["average"].ToString();
            }

            rs.Update();
            rs.Close();
        }
    }

    public void Del(string rowid)
    {
        string sql = "delete  from eipe.dbo.IPQC_Ra_Lab_Position where id='" + rowid + "' ";
        Utility.execDel(sql);
    }

    public void DelList(string lab_id)
    {
        string sql = "delete from eipe.dbo.IPQC_Ra_Lab_Position where lab_id='" + lab_id + "' ";
        Utility.execDel(sql);
    }

    public static void UpdateStatus(string rowid, status Action)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "select * from eipe.dbo.IPQC_Ra_Lab_Position where rowid='" + rowid + "'";

            rs.Open(sql);

            if (!rs.EOF)
            {

                rs["status"] = Action;
                rs["send_date"] = DateTime.Now;
            }
            rs.Update();
            rs.Close();
        }
    }
}

public class Test_result
{

    public string rowid;
    public string lab_id;
    public string cav;
    public string measurement;
    public string seq;

    public void Add(string rowid, string lab_id, string cav, string measurement, int seq)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "select * from eipe.dbo.ipqc_Ra_lab_result where 1=0";

            rs.Open(sql);
            rs.Add();
            if (!rs.EOF)
            {
                rs["rowid"] = rowid;
                rs["position_id"] = lab_id;
                rs["measurement"] = measurement;
                rs["cav"] = cav;
                rs["seq"] = seq;
            }
            rs.Update();
            rs.Close();
        }
    }

    public void Update(string rowid, string cav, string measurement, string seq)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "select * from eipe.dbo.ipqc_Ra_lab_result where rowid='" + rowid + "'";
            rs.Open(sql);

            if (!rs.EOF)
            {
                rs["measurement"] = measurement;
                rs["cav"] = cav;
                rs["seq"] = seq;
            }
            rs.Update();
            rs.Close();
        }
    }

    public void getInfo(string rowid)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string sql = "select * from eipe.dbo.ipqc_Ra_lab_result where rowid='" + rowid + "'";
            rs.Open(sql);
            {
                lab_id = rs["position_id"].ToString();
                rowid = rs["rowid"].ToString();
                cav = rs["cav"].ToString();
                measurement = rs["measurement"].ToString();
                seq = rs["seq"].ToString();
            }
        }
    }

    public void Del(string rowid)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "del  from eipe.dbo.ipqc_Ra_lab_result where rowid='" + rowid + "'";
            rs.ExecuteNonQuery(sql);
        }
    }

    public void DelList(string position_id)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "del  from eipe.dbo.ipqc_Ra_lab_result where lab_id='" + lab_id + "'";
            rs.ExecuteNonQuery(sql);
        }
    }
}

public class Inspect

{
    public string rowid, report_name, report_result, replay;
    public string head_id;
    public int status = 0;
    public int result=0;

    public DateTime send_date = DateTime.Now;

    public void Add(string rowid, string head_id, string modify_user, string result, string replay, string files)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "select * from eipe.dbo.IPQC_Ra_Lab where rowid='" + rowid + "' ";
            rs.Open(sql);
            rs.Add();

            if (rs.EOF == false)
            { //　not data
                rs["rowid"] = rowid;
                rs["head_id"] = head_id;
                rs["status"] = status;

                rs["report_name"] = files;
                rs["report_result"] = result;
                rs["replay"] = replay;

                rs["modify_user"] = modify_user;
                rs["modify_date"] = DateTime.Now;

                if (!string.IsNullOrEmpty(files))
                {
                    string temp = Path.Combine(Path.GetTempPath(), files);
                    rs["report"] = FileContent(temp);
                }
            }

            rs.Update();
            rs.Close();
        }
    }

    private byte[] FileContent(string fileName)
    {
        using (FileStream fs = new FileStream(fileName, FileMode.Open, FileAccess.Read))
        {
            try
            {
                byte[] buffur = new byte[fs.Length];
                fs.Read(buffur, 0, (int)fs.Length);

                return buffur;
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {
                if (fs != null)
                {

                    //关闭资源  
                    fs.Close();
                }
            }
        }
    }

    public void GetInfo(string rowid)
    {
        if (!string.IsNullOrEmpty(rowid))
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                string sql = "select * from eipe.dbo.IPQC_Ra_Lab where rowid='" + rowid + "' ";
                rs.Open(sql);

                if (!rs.EOF)
                {
                    rowid = rs["rowid"].ToString();
                    head_id = rs["head_id"].ToString();
                    result = Convert.ToInt16(rs["result"].ToString());
                    status = Convert.ToInt16(rs["status"].ToString());

                    report_result = rs["report_result"].ToString();
                    replay = rs["replay"].ToString();
                    report_name = rs["report_name"].ToString();

                }
                rs.Update();
                rs.Close();
            }
        }
    }

    public void UpdateStatus(string rowid, status action)
    {
        //// SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            try
            {
                if (!string.IsNullOrEmpty(rowid))
                {
                    string sql = "select * from eipe.dbo.IPQC_Ra_Lab where rowid='" + rowid + "' ";
                    rs.Open(sql);
                    if (!rs.EOF)
                    {
                        rs["status"] = (int)action;
                        rs["send_date"] = send_date;


                        rs.Update();
                        rs.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }


    public void Update(string rowid, string modify_user, string result, string replay, string files)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "select * from eipe.dbo.IPQC_Ra_Lab where rowid='" + rowid + "' ";
            rs.Open(sql);



            rs["report_name"] = files;
            rs["report_result"] = result;
            rs["replay"] = replay;

            rs["modify_user"] = modify_user;
            rs["modify_date"] = DateTime.Now;

            if (!string.IsNullOrEmpty(files))
            {
                string temp = Path.Combine(Path.GetTempPath(), files);
                rs["report"] = FileContent(temp);
            }


            rs.Update();
            rs.Close();
        }
    }

}