using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;


/// <summary>
/// VMI_Base 的摘要描述
/// </summary>
public class VMI_Base : SmoothEnterprise.Web.Page
{
    protected string _condition = "";
    protected string _inspectNo = "";
    protected string _inspector = "";
    protected string _models = "";
    protected string _product = "";
    protected string _station = "";
    protected string _inspect_SDt = "";
    protected string _inspect_EDt = "";

    protected string _customer = "";
    protected string _standards = "";
    protected string _inspectdt = "";

    protected DataTable _Inspect = new DataTable();
    protected DataTable _NG = new DataTable();
    protected DataTable _Insulate = new DataTable();
    protected DataTable _MMR = new DataTable();
    protected DataTable _Result = new DataTable();

    protected DataTable _Causes = new DataTable();
    protected DataTable _Position = new DataTable();

    protected NG.Temp _NgTobj;
    protected cut.Temp _insTobj;
    protected MMR.Temp _MMRTobj;
    protected Result.Temp _ResultTobj;
    protected NgCauses.Temp _tempCauses;
    protected NgPosition.Temp _tempPosition;


    protected int _timeStamp;
    protected string _msg;
    protected int _shift = 0;


    public language lang = (language)1;

    public VMI_Base()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public static class Option
    {
        private static string _sql = "select rowid,en,tw,def from eipe.dbo.sys_option where Main = 'VMI' and Kind = '{0}' and display='1'  order by en ";

        public static readonly string Customer = string.Format(_sql, "Customer");
        public static readonly string Models = string.Format(_sql, "Models");
        public static readonly string NG_Causes = string.Format(_sql, "NG_Causes");
        public static readonly string NG_Cav = string.Format(_sql, "NG_Cav");
        public static readonly string Postion = string.Format(_sql, "NG_Postion");
        public static readonly string Product = string.Format(_sql, "Product");
        public static readonly string Process = string.Format(_sql, "Process");
        public static readonly string Quality_Result = string.Format(_sql, "Quality_Result");
        public static readonly string Quality_Type = string.Format(_sql, "Quality_Type");
        public static readonly string Standards = string.Format(_sql, "Standards");
    }


    public language CurrLang
    {
        get
        {
            language curr = (language)1;

            string langVal = Request.Form["ctl00$HeaderControl1$FIELD_language"];

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

    public string tranfer_status(string value)
    {
        return Utility.chnageStatus(value, lang);
    }

    #region UI Control 

    #region get DropDownList 

    public void getNgCauses(DropDownList list)
    {
        ListItem[] Item = Utility.getOPItem(Option.NG_Causes, list.SelectedValue, (language)lang);
        list.Items.Clear();
        list.Items.AddRange(Item);
    }

    //public void getNgCav(DropDownList list)
    //{
    //    ListItem[] Item = Utility.getOPItem(Option.NG_Cav, list.SelectedValue, (language)lang);
    //    list.Items.Clear();
    //    list.Items.AddRange(Item);
    //}

    public void getNgPostion(DropDownList list)
    {
        ListItem[] Item = Utility.getOPItem(Option.Postion, list.SelectedValue, (language)lang);
        list.Items.Clear();
        list.Items.AddRange(Item);
    }

    public void getModel(DropDownList list)
    {
        ListItem[] Item = Utility.getOPItem(Option.Models, list.SelectedValue, (language)lang, false);
        list.Items.Clear();
        list.Items.AddRange(Item);
    }



    public void getQualityType(DropDownList list)
    {
        ListItem[] Item = Utility.getOPItem(Option.Quality_Type, list.SelectedValue, (language)lang);
        list.Items.Clear();
        list.Items.AddRange(Item);

    }

    public void getProduct(DropDownList list)
    {
        ListItem[] Item = Utility.getOPItem(Option.Product, list.SelectedValue, (language)lang, false);
        list.Items.Clear();
        list.Items.AddRange(Item);

    }

    public void getQualityResult(DropDownList list)
    {
        ListItem[] Item = Utility.getOPItem(Option.Quality_Result, list.SelectedValue, (language)lang);
        list.Items.Clear();
        list.Items.AddRange(Item);
    }



    public void getCustomer(DropDownList list)
    {

        ListItem[] Item = Utility.getOPItem(Option.Customer, list.SelectedValue, (language)lang);
        list.Items.Clear();
        list.Items.AddRange(Item);

    }

    public void getStandards(DropDownList list)
    {

        ListItem[] Item = Utility.getOPItem(Option.Standards, list.SelectedValue, (language)lang);
        list.Items.Clear();
        list.Items.AddRange(Item);

    }

    public void getProcess(DropDownList list)
    {

        ListItem[] Item = Utility.getOPItem(Option.Process, list.SelectedValue, (language)lang, false);
        list.Items.Clear();
        list.Items.AddRange(Item);

    }
    #endregion

    protected DropDownList add_cbo(string id, string sql, string selected)
    {
        DropDownList List = new DropDownList();
        List.ID = id;
        List.Items.AddRange(Utility.getOPItem(sql, selected, lang));
        return List;
    }

    protected string getItemName(string id)
    {
        return getItemName(id, (language)lang);
    }

    protected string getItemName(string id, language tag)
    {
        string sql = "select rowid,main,kind,en,tw from eipe.dbo.sys_option where rowid = '" + id + "' ";
        string name = "";

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                name = rd[tag.ToString()].ToString();
            }

            conn.Close();
        }

        return name;
    }

    #endregion 

    protected void UpdateGV(GridView gv, string vsName, DataTable temp)
    {
        DataView view = new DataView(temp);

        gv.DataSource = view;
        gv.DataBind();
        ViewState[vsName] = temp;
    }

    protected string getAccount(string Uid)
    {
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        string sql = string.Format(" select logonid  from eipa.dbo.dguser where id='{0}' ", Uid);
        string logonid = rs.ExecuteScalar(sql).ToString();
        return logonid;
    }

    protected void DelInspect(int index, string vsName, DataTable temp, GridView gv)
    {
        int row = index - 1; //datatable 從0開始

        temp = (DataTable)ViewState[vsName];

        temp.Rows.RemoveAt(index);
        UpdateGV(gv, vsName, temp);


    }

    protected bool isManager()
    {
        bool isPass = false;
        string[] List = { "eileen.wang", "elliot.chang", "xin.huang", "carol.yeh", "Hollow.Lin" };
        string Currect = CurrentUser.LogonID.ToUpper();

        foreach (string ID in List)
        {
            if (Currect == ID.ToUpper())
            {
                isPass = true;
                break;
            }
        }

        return isPass;
    }

    protected void copy_inspect(DataRow Row, GridView gv)
    {
        ViewState["copy"] = Row["id"].ToString();

        DropDownList cboType = (DropDownList)gv.Rows[0].FindControl("type");
        cboType.SelectedValue = Row["type"].ToString();

        DropDownList cboProcess = (DropDownList)gv.Rows[0].FindControl("process");
        cboProcess.SelectedValue = Row["station"].ToString();

        TextBox Samples = (TextBox)gv.Rows[0].FindControl("samples");
        Samples.Text = Row["samples"].ToString();

        TextBox ng_count = (TextBox)gv.Rows[0].FindControl("ng_count");
        ng_count.Text = Row["ng_count"].ToString();

        DropDownList Models = (DropDownList)gv.Rows[0].FindControl("models");
        Models.SelectedValue = Row["models"].ToString();

        DropDownList Product = (DropDownList)gv.Rows[0].FindControl("product");
        Product.SelectedValue = Row["product"].ToString();



        //Discovery.Text = Row["discovery_dt"].ToString();

        TextBox Machine = (TextBox)gv.Rows[0].FindControl("machine");
        Machine.Text = Row["machine"].ToString();

        TextBox Tooling = (TextBox)gv.Rows[0].FindControl("tooling");
        Tooling.Text = Row["tooling"].ToString();

        //DropDownList Result = (DropDownList)gv.Rows[0].FindControl("result");
        //Result.SelectedValue = Row["result"].ToString();

        TextBox txtRemark = (TextBox)gv.Rows[0].FindControl("remark");
        txtRemark.Text = Row["remark"].ToString();


        TextBox txtVersion = (TextBox)gv.Rows[0].FindControl("version");
        txtVersion.Text = Row["version"].ToString();

        SmoothEnterprise.Web.UI.HTMLControl.InputText Discovery = (SmoothEnterprise.Web.UI.HTMLControl.InputText)gv.Rows[0].Cells[8].Controls[0];
        string sDiscovery = Row["discovery_dt"].ToString();
        if (!string.IsNullOrEmpty(sDiscovery))
        {
            DateTime dt = Convert.ToDateTime(sDiscovery);
            Discovery.Attributes.Add("value", dt.ToString("yyyy/MM/dd HH:mm:ss"));
        }

        SmoothEnterprise.Web.UI.HTMLControl.InputText Inspector = (SmoothEnterprise.Web.UI.HTMLControl.InputText)gv.Rows[0].FindControl("inspector");
        string Account = getAccount(Row["inspector"].ToString());
        Dictionary<string, string> UserInfo = Utility.GetUserInfo(Account);
        Inspector.Attributes.Add("TITLE", UserInfo["NAME"]);
        Inspector.Attributes.Add("SETFORMATVALUE", UserInfo["LOGONID"]);
        Inspector.Attributes.Add("VALUE", UserInfo["ID"]);

        SmoothEnterprise.Web.UI.HTMLControl.InputText txtDisplay = (SmoothEnterprise.Web.UI.HTMLControl.InputText)gv.Rows[0].FindControl("inspector_display");
        txtDisplay.Attributes.Add("value", UserInfo["NAME"]);

        SmoothEnterprise.Web.UI.HTMLControl.InputText Complete = (SmoothEnterprise.Web.UI.HTMLControl.InputText)gv.Rows[0].Cells[13].Controls[0];
        string sComplate = Row["complate_dt"].ToString();
        if (!string.IsNullOrEmpty(sComplate))
        {
            DateTime dt2 = Convert.ToDateTime(sComplate);
            Complete.Attributes.Add("value", dt2.ToString("yyyy/MM/dd HH:mm:ss"));
        }


    }



    protected void Copy_SubList(string CopyID, string NewID, ref DataTable List)
    {
        DataTable Temp = List.Copy();

        DataRow[] Result = Temp.Select(" inspect_id='" + CopyID + "' ");

        if (Result.Length > 0)
        {
            foreach (DataRow Item in Result)
            {
                Item["Inspect_id"] = NewID;
                List.ImportRow(Item);
            }
        }

        Temp = null;

    }

    protected void save_vmi_inspect_Result(string oInspect, string InspectID)
    {
        if (_Result != null)
        {
            DataRow[] List = _Result.Select(" inspect_id='" + oInspect + "' ");

            if (List.Length > 0)
            {
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    int i = 1;
                    foreach (DataRow Item in List)
                    {
                        string id = Guid.NewGuid().ToString();

                        if (!string.IsNullOrEmpty(id) && !string.IsNullOrEmpty(InspectID))
                        {
                            string sql = "SELECT  id, inspect_id, result, create_dt, seq FROM  [EIPE].[dbo].[VMI_Inspect_Resulat] WHERE 1=0";
                            rs.Open(sql);
                            rs.Add();
                            //id, inspect_id, result, create_dt, seq

                            rs["inspect_id"] = InspectID;
                            rs["id"] = id;
                            rs["result"] = Item["result"].ToString();
                            rs["create_dt"] = DateTime.Now.ToString();
                            rs["seq"] = i;

                            rs.Update();
                            i++;
                        }
                        Item["inspect_id"] = InspectID;
                    }
                    rs.Close();
                }
            }
        }
    }

    protected void save_vmi_inspect_Ng(string oInspect, string InspectID)
    {
        if (_NG != null)
        {
            DataRow[] Result = _NG.Select(" inspect_id='" + oInspect + "' ");

            if (Result.Length > 0)
            {
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    int i = 1;
                    foreach (DataRow Item in Result)
                    {
                        string id = Guid.NewGuid().ToString();

                        DataRow[] i_row = _Insulate.Select(" ng_id='" + Item["id"] + "'"); //舊的id換新的id
                        if (i_row.Length > 0)
                        {
                            i_row[0]["ng_id"] = id;
                        }

                        if (!string.IsNullOrEmpty(id) && !string.IsNullOrEmpty(InspectID))
                        {
                            string sql = " SELECT * FROM eipe.dbo.VMI_inspect_NG  WHERE 1 =0 order by create_dt desc ,seq desc ";
                            rs.Open(sql);
                            rs.Add();

                            rs["inspect_id"] = InspectID;
                            rs["id"] = id;
                            rs["ng_cav"] = Item["ng_cav"].ToString();
                            rs["create_dt"] = DateTime.Now.ToString();
                            rs["ng_count"] = string.IsNullOrEmpty(Item["ng_count"].ToString()) ? "0" : Item["ng_count"].ToString();
                            rs["seq"] = i;

                            save_vmi_NG_Causes(Item["id"].ToString(), id);
                            save_vmi_NG_Position(Item["id"].ToString(), id);

                            rs.Update();
                            i++;
                        }
                        Item["inspect_id"] = InspectID;
                    }
                    rs.Close();
                }
            }
        }
    }

    protected void save_vmi_insulate(string oInspect, string InspectID)
    {

        if (_Insulate != null)
        {
            int i = 1;
            DataRow[] Result = _Insulate.Select(" inspect_id='" + oInspect + "'");

            if (Result.Length > 0)
            {
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    foreach (DataRow Item in Result)
                    {
                        string id = Guid.NewGuid().ToString();

                        if (!string.IsNullOrEmpty(id) && !string.IsNullOrEmpty(InspectID))
                        {
                            string sql = "SELECT *  FROM  [EIPE].[dbo].[VMI_Insulation] WHERE 1=0";
                            rs.Open(sql);
                            rs.Add();
                            string startDt = Item["start_time"].ToString();
                            string endDt = Item["end_time"].ToString();

                            rs["id"] = id;
                            rs["inspect_id"] = InspectID;
                            rs["insulation_no"] = Item["insulationNo"].ToString();
                            rs["spearate_no"] = Item["spearateNo"].ToString();

                            if (!string.IsNullOrEmpty(startDt))
                            {
                                rs["start_time"] = Item["start_time"].ToString();
                            }

                            if (!string.IsNullOrEmpty(endDt))
                            {
                                rs["end_time"] = Item["end_time"].ToString();
                            }

                            rs["ng_id"] = Item["ng_id"].ToString();
                            rs["create_dt"] = DateTime.Now.ToString();
                            rs["seq"] = i;
                            rs.Update();
                            i++;
                        }

                        Item["inspect_id"] = InspectID;
                    }
                    rs.Close();
                }
            }
        }
    }

    protected void save_vmi_MMR(string oInspect, string InspectID)
    {
        
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "select * from eipe.dbo.vmi_mmr where inspect_id='" + oInspect + "'";
            rs.Open(sql);
            if (!rs.EOF)
            {
                rs["inspect_id"] = InspectID;
                rs.Update();
              //  Utility.log(string.Format(" 528 MMR:o_inspect={0}, n_inspect={1}", oInspect, InspectID));
            }
        }
    }

    protected void save_vmi_inspect(string Head_id)
    {
        if (_Inspect != null)
        {
            Del_DB(string.Format(" delete  eipe.dbo.VMI_Inspect where head_id='{0}' ", Head_id));

            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                int i = 1;
                foreach (DataRow Item in _Inspect.Rows)
                {
                    if (Item != null)
                    {
                        string o_Inspect = Item["id"].ToString();

                        if (!string.IsNullOrEmpty(o_Inspect))
                        {
                            
                            string sqdef = "SELECT * FROM  [EIPE].[dbo].[VMI_Inspect] WHERE 1=0";
                            rs.Open(sqdef);
                            rs.Add();
                            string InspectID = Guid.NewGuid().ToString();

                           

                            rs["id"] = InspectID;
                            rs["head_id"] = Head_id;
                            rs["seq"] = i;
                            rs["type"] = Item["type"].ToString();
                            rs["station"] = Item["station"].ToString();
                            rs["samples"] = Item["samples"].ToString();
                            rs["ng_count"] = Item["ng_count"].ToString();
                            rs["models"] = Item["models"].ToString();
                            rs["product"] = Item["product"].ToString();

                            rs["machine"] = Item["machine"].ToString();
                            rs["tooling"] = Item["tooling"].ToString();
                            //rs["result"] = Item["result"].ToString();
                            rs["inspector"] = Item["inspector"].ToString();

                            rs["remark"] = Item["remark"].ToString();
                            rs["version"] = Item["version"].ToString();
                            rs["create_dt"] = DateTime.Now.ToString();

                            string complate = Item["complate_dt"].ToString();
                            if (!string.IsNullOrEmpty(complate))
                            {
                                rs["complate_dt"] = complate;
                            }

                            string discovery = Item["discovery_dt"].ToString();
                            if (!string.IsNullOrEmpty(discovery))
                            {
                                rs["discovery_dt"] = discovery;
                            }

                            rs.Update();
                            rs.Close();

                            Del_DB(string.Format(" delete  eipe.dbo.vmi_inspect_ng where inspect_id='{0}' ", o_Inspect));
                            save_vmi_inspect_Ng(o_Inspect, InspectID);
                            ViewState[_NgTobj.Tag] = _NG;

                            Del_DB(string.Format(" delete  eipe.dbo.vmi_insulation where inspect_id='{0}' ", o_Inspect));
                            save_vmi_insulate(o_Inspect, InspectID);
                            ViewState[_insTobj.Tag] = _Insulate;

                            
                            save_vmi_MMR(o_Inspect, InspectID);
                            //ViewState[_MMRTobj.Tag] = _MMR;

                            Del_DB(string.Format(" delete  eipe.dbo.VMI_Inspect_Resulat where inspect_id='{0}' ", o_Inspect));
                            save_vmi_inspect_Result(o_Inspect, InspectID);
                            ViewState[_ResultTobj.Tag] = _Result;

                            Item["id"] = InspectID;

                            i++;
                        }


                    }
                }


            }
        }

    }

    protected void save_vmi_NG_Position(string ng_id, string new_Ng_id)
    {
        if (_Inspect != null)
        {
            Del_DB(string.Format(" delete  eipe.dbo.VMI_NG_Position where ng_id='{0}' ", ng_id));

            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                int i = 1;
                DataRow[] p_Row = _Position.Select(" ng_id='" + ng_id + "'");
                foreach (DataRow Item in p_Row)
                {
                    string seq = "select * from  eipe.dbo.VMI_NG_Position where 1=0";
                    rs.Open(seq);
                    rs.Add();
                    rs["id"] = Guid.NewGuid().ToString();
                    rs["ng_id"] = new_Ng_id;
                    rs["position"] = Item["ng_position"];
                    rs["create_dt"] = DateTime.Now.ToString();
                    rs["seq"] = i;
                    rs.Update();
                    i++;
                }
                rs.Close();
            }
        }
    }

    protected void save_vmi_NG_Causes(string ng_id, string new_Ng_id)
    {
        if (_Inspect != null)
        {
            Del_DB(string.Format(" delete  eipe.dbo.VMI_NG_Causes where ng_id='{0}' ", ng_id));

            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                int i = 1;
                DataRow[] c_Row = _Causes.Select(" ng_id='" + ng_id + "'");
                foreach (DataRow Item in c_Row)
                {
                    string seq = "select * from  eipe.dbo.VMI_NG_Causes where 1=0";
                    rs.Open(seq);
                    rs.Add();
                    rs["id"] = Guid.NewGuid().ToString();
                    rs["ng_id"] = new_Ng_id;
                    rs["causes"] = Item["ng_causes"];
                    rs["create_dt"] = DateTime.Now.ToString();
                    rs["seq"] = i;
                    rs.Update();
                    i++;
                }
                rs.Close();
            }
        }
    }

    #region sub list

    protected string getNgList(DataRow[] List)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"t1\" style=\"width:300px; border: 1px solid #808080; margin: 10px 10px;text-align:left\">");
        sb.Append("<div style=\"background-color: #E5404C; font-size:14px; text-align: center; color: #ffffff; width: 100%;padding:1px 0px\">NG</div>");
        sb.Append("<div><table cellspacing=\"0\" cellpadding=\"0\" rules=\"all\" border=\"1\" id=\"gv_ng\" style=\"color:#333333;border-color:Gray;border-width:1px;border-style:Solid;width:100%;border-collapse:collapse;\">");
        sb.AppendFormat("<tr class=\"sub_th\" ><th>{0}</th><th>{1}</th><th>{2}</th><th>{3}</th></tr>", getStr("ng_cav"), getStr("ng_causes"), getStr("ng_postion"), getStr("ng_number"));
        int i = 0;
        foreach (DataRow Item in List)
        {
            string tr_style = " style=\"color:#4A3C8C;background-color:#FCEDEE;font-size:11px;\"";

            if ((i % 2) == 0)
            {
                tr_style = "style=\"color:#4A3C8C;background-color:White;font-size:11px;\"";
            }

            string ng_cav = Item["ng_cav"].ToString();
            string id = Item["id"].ToString();
            string inspect_id = Item["inspect_id"].ToString();

            string ng_causes = getHtml(_Causes, Item["id"].ToString());
            string ng_postion = getHtml(_Position, Item["id"].ToString());
            string ng_count = string.IsNullOrEmpty(Item["ng_count"].ToString()) ? "0" : Item["ng_count"].ToString();

            sb.Append("<tr " + tr_style + " class=\"sub_td\" ><td>" + ng_cav + "</td><td><div class=\"subItem\" >" + ng_causes + "</div></td><td><div class=\"subItem\" >" + ng_postion + "</div></td><td><div class=\"subItem\" >" + ng_count + "</div></td></tr>");
            i++;
        }
        sb.Append("</table></div></div>");
        return sb.ToString();
    }

    private string getHtml(DataTable temp, string ng_id)
    {
        StringBuilder sb = new StringBuilder();
        DataRow[] Row = temp.Select(" ng_id='" + ng_id + "'");

        if (Row.Length > 0)

            foreach (DataRow Item in Row)
            {
                if (!string.IsNullOrEmpty(sb.ToString()))
                {
                    sb.Append("<br>");
                }
                sb.Append(Item["text"]);
            }
        return sb.ToString();
    }

    protected string getInsulateList(DataRow[] List)
    {
        string InsulateNo = "";
        int i = 0;
        StringBuilder sb = new StringBuilder();
        foreach (DataRow Item in List)
        {
            string tr_style = "style=\"color:#4A3C8C;background-color:#D2E3F1;font-size:11px;\"";
            if ((i % 2) == 0)
            {
                tr_style = "style=\"color:#4A3C8C;background-color:White;font-size:11px;\"  ";
            }

            InsulateNo = Item["insulationNO"].ToString();

            DataRow[] ng_row = _NG.Select(" id='" + Item["ng_id"] + "'");
            string ng_cav = "";
            if (ng_row.Length > 0)
            {
                ng_cav = ng_row[0]["ng_cav"].ToString();
            }

            sb.Append("<tr " + tr_style + " class=\"sub_td\" ><td >" + Item["start_time"] + "</td><td >" + Item["end_time"] + "</td><td >" + ng_cav + "</td></tr>");
            i++;
        }

        StringBuilder show = new StringBuilder();
        show.Append("<div class=\"t1\" style=\"width: 300px; border: 1px solid #808080; margin: 10px 10px;text-align:left;position: relative\">");
        show.AppendFormat("<div style =\"float:right;position:absolute;color:#fcff00;right:10px;position-bottom:2px\" >{0}</div>", InsulateNo);
        show.AppendFormat("<div style=\"width: 300px;width:20px;background-color: #84B3DA; font-size: 14px; text-align: center; color: #ffffff; width: 100%;padding:1px 0px;z-index:1\"><div>{0}</div> </div>", getStr("insulation_record"));
        show.Append(" <table cellspacing=\"0\" cellpadding=\"0\" rules=\"all\" border=\"1\" id=\"gv_Insulate\" style=\"color:#333333;border-color:Gray;border-width:1px;border-style:Solid;width:100%;border-collapse:collapse;\">");
        show.Append("<tr class=\"sub_th\" style=\"font-size:11px;heigth:10px\" ><th style=\"width:30%\" >" + getStr("start_time") + "</th><th style=\"width:30%\" >" + getStr("end_time") + "</th><th style=\"width:40%\" >" + getStr("ng_cav") + "</th></tr>");
        show.Append(sb.ToString());
        show.Append("</table>");
        show.Append("</div></div>");

        return show.ToString();
    }
    protected string getMMRList(DataRow[] List)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"t1\" style=\"width: 300px; border: 1px solid #808080; margin: 10px 10px;text-align:left\">");
        sb.Append("<div style=\"background-color: #BAD9B5; font-size:16px; text-align: center; color: #ffffff; width:100%\" class=\"ML\" ML_Tag=\"mmr\" > Mold Maintenance Record</div>");
        sb.Append("<div><table cellspacing=\"0\" cellpadding=\"0\" rules=\"all\" border=\"1\" id=\"gv_Insulate\" style=\"color:#333333;border-color:Gray;border-width:1px;border-style:Solid;width:100%;border-collapse:collapse;\">");
        sb.Append("<tr class=\"sub_th\" ><th style=\"width:40%\">" + getStr("mmr_no") + "</th><th style=\"width:60%\">" + getStr("attach") + "</th></tr>");

        int i = 0;
        foreach (DataRow Item in List)
        {
            string tr_style = "style=\"color:#4A3C8C;background-color:#ECF4EA;font-size:11px;\"";

            if ((i % 2) == 0)
            {
                tr_style = "style=\"color:#4A3C8C;background-color:White;font-size:11px;\"";
            }

            Label labfile = new Label();

            sb.Append("<tr " + tr_style + " class=\"sub_td\" ><td><p style=\"color:#D17132\" >" + Item["mmrno"] + "</p></td><td><a>" + Item["filename"] + "<a></td></tr>");
            i++;
        }

        sb.Append("</table></div></div>");
        return sb.ToString();
    }

    #endregion

    #region setList

    protected void setMMR(string HeadID)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            try
            {
                string sql = string.Format("select m.* from eipe.dbo.VMI_MMR m left join eipe.dbo.VMI_inspect i on m.inspect_id=i.id   where  i.head_id='{0}'   ", HeadID);
                rs.Open(sql);

                while (!rs.EOF)
                {
                    string id = rs["id"].ToString();
                    string MMRNo = rs["MMRNo"].ToString();
                    string remark = rs["remark"].ToString();
                    string filename = rs["filename"].ToString();
                    string attach = rs["attach"].ToString();

                    string inspect_id = rs["inspect_id"].ToString();

                    _MMRTobj.AddTemp(id, inspect_id, "", remark, filename, attach, MMRNo, "s"); //type=s in SQL
                    rs.MoveNext();
                }
                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

    protected void setInsulate(string HeadID)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            try
            {
                string sql = string.Format("  select ins.id,ins.insulation_no,ins.spearate_no,convert(varchar(20),ins.start_time,120) 'start_time' ,convert(varchar(20),ins.end_time,120) 'end_time',ng_id ,i.id 'inspect_id' from eipe.dbo.VMI_Insulation ins left join eipe.dbo.VMI_Inspect i on ins.inspect_id=i.id where i.head_id='{0}'   order by ins.create_dt desc  ", HeadID);
                rs.Open(sql);

                while (!rs.EOF)
                {
                    string id = rs["id"].ToString();
                    string insulation_no = rs["insulation_no"].ToString();
                    string spearate_no = rs["spearate_no"].ToString();
                    string start_time = rs["start_time"].ToString();
                    string end_time = rs["end_time"].ToString();
                    string ng_id = rs["ng_id"].ToString();
                    string inspect_id = rs["inspect_id"].ToString();

                    _insTobj.AddTemp(id, insulation_no, inspect_id, spearate_no, start_time, end_time, ng_id);
                    rs.MoveNext();
                }
                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

    protected void setNg(string HeadID)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            try
            {
                string sql = string.Format("select  n.* from eipe.dbo.vmi_inspect_ng n left join eipe.dbo.vmi_inspect i on n.inspect_id=i.id  where i.head_id='{0}' order by seq  ", HeadID);
                rs.Open(sql);

                while (!rs.EOF)
                {
                    string id = rs["id"].ToString();
                    string ng_cav = rs["ng_cav"].ToString();

                    string seq = rs["seq"].ToString();
                    string inspect_id = rs["inspect_id"].ToString();
                    string count = rs["ng_count"].ToString();

                    _NgTobj.AddTemp(id, inspect_id, seq, ng_cav, "", "", count);

                    setNgCauses(id);
                    setNgPosition(id);

                    rs.MoveNext();
                }
                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }

    protected void setResult(string HeadID)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            try
            {
                string sql = string.Format("select  r.* from eipe.dbo.VMI_Inspect_Resulat r left join eipe.dbo.vmi_inspect i on r.inspect_id=i.id  where i.head_id='{0}' order by seq  ", HeadID);
                rs.Open(sql);

                while (!rs.EOF)
                {
                    string id = rs["id"].ToString();
                    string result = rs["result"].ToString();
                    string inspect_id = rs["inspect_id"].ToString();


                    _ResultTobj.AddTemp(id, inspect_id, result, "");

                    rs.MoveNext();
                }
                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }

    protected void setNgPosition(string ng_id)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            try
            {
                string sql = string.Format("SELECT id,ng_id,position,create_dt,seq FROM eipe.dbo.VMI_NG_Position where ng_id='{0}' order by  create_dt desc ,seq desc  ", ng_id);
                rs.Open(sql);

                while (!rs.EOF)
                {
                    string id = rs["id"].ToString();
                    string position = rs["position"].ToString();
                    string text = getItemName(position);


                    _tempPosition.AddTemp(id, ng_id, position, text);

                    rs.MoveNext();
                }
                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }

    protected void setNgCauses(string ng_id)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            try
            {
                string sql = string.Format("SELECT id,ng_id,Causes,create_dt,seq FROM eipe.dbo.VMI_NG_Causes where ng_id='{0}' order by  create_dt desc ,seq desc  ", ng_id);
                rs.Open(sql);

                while (!rs.EOF)
                {
                    string id = rs["id"].ToString();
                    string Causes = rs["Causes"].ToString();
                    string text = getItemName(Causes);


                    _tempCauses.AddTemp(id, ng_id, Causes, text);

                    rs.MoveNext();
                }
                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }


    #endregion setList

    protected void outData(string inpectid)
    {
        StringBuilder sNG = new StringBuilder();
        StringBuilder sInsulate = new StringBuilder();
        StringBuilder sMMR = new StringBuilder();

        if (_NG.Rows.Count > 0)
        {
            StringBuilder sb = new StringBuilder();
            DataRow[] NgList = _NG.Select("inspect_id='" + inpectid + "' ");
            if (NgList.Length > 0)
            {
                Session["Ng_" + inpectid] = NgList;

                DataTable tempC = new DataTable();
                NgCauses.Temp c_temp = new NgCauses.Temp(tempC);

                DataTable tempP = new DataTable();
                NgPosition.Temp p_temp = new NgPosition.Temp(tempP);

                foreach (DataRow Item in NgList)
                {
                    DataRow[] c_list = _Causes.Select(" ng_id ='" + Item["id"].ToString() + "' ");
                    DataRow[] p_list = _Position.Select(" ng_id ='" + Item["id"].ToString() + "' ");

                    foreach (DataRow c in c_list)
                    {
                        tempC.ImportRow(c);
                    }

                    foreach (DataRow p in p_list)
                    {
                        tempP.ImportRow(p);
                    }
                }
                Session["c_" + inpectid] = tempC;
                Session["p_" + inpectid] = tempP;
            }


        }
        if (_Insulate.Rows.Count > 0)
        {
            StringBuilder sb = new StringBuilder();
            //id,inspect_id,ng_id,insulationNo,spearateNo, start_time,end_time
            DataRow[] InsulateList = _Insulate.Select("inspect_id='" + inpectid + "' ");


            if (InsulateList.Length > 0)
            {

                Session["Insulate_" + inpectid] = InsulateList;
            }
        }

        if (_MMR.Rows.Count > 0)
        {
            StringBuilder sb = new StringBuilder();
            DataRow[] MMRList = _MMR.Select("inspect_id='" + inpectid + "' ");

            if (MMRList.Length > 0)
            {
                Session["MMR_" + inpectid] = MMRList;
            }
        }
    }

    protected void Del_DB(string sql)
    {
        DBTransfer fs = new DBTransfer();
        fs.RunIUSql(sql);
    }

    protected void UpdataStatus(string guid, status type)
    {
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);



        rs.Open("SELECT * FROM  EIPE.dbo.VMI_Head WHERE id='" + Request.QueryString["rowid"].ToString() + "' ");
        if (!rs.EOF)
        {
            rs["status"] = type;
            rs["send_date"] = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            rs.Update();

        }
        rs.Close();
    }

    public string getStr(string key)
    {
        return this.GetLocalResourceObject(key).ToString();
    }

    public LinkButton ImgButton(string ID, string imgUrl)
    {
        LinkButton lbtn = new LinkButton();
        Image img = new Image();
        img.ImageUrl = imgUrl;
        img.Width = 16;
        img.Height = 16;
        img.Attributes.Add("vertical-align", "middle");
        lbtn.Controls.Add(img);

        return lbtn;
    }

    public void Result_Del(string result_id)
    {
        DataRow[] List = _Result.Select(" id='" + result_id + "'");

        if (List.Length > 0)
        {
            foreach (DataRow Item in List)
            {
                _Result.Rows.Remove(Item);
            }
        }
    }

    protected DataTable del_NgItem(DataTable temp, string ng_id)
    {
        DataRow[] List = temp.Select("ng_id='" + ng_id + "'");

        if (List.Length > 0)
        {
            foreach (DataRow Item in List)
            {
                temp.Rows.Remove(Item);
            }
        }

        return temp;
    }

    public static void getMailGp(DropDownList cbo)
    {
        cbo.Items.Add(new ListItem("daily", "daily"));
        cbo.Items.Add(new ListItem("daily_cc", "daily_cc"));
        cbo.Items.Add(new ListItem("mmr", "mmr"));
        cbo.Items.Add(new ListItem("mmr_cc", "mmr_cc"));
        cbo.Items.Add(new ListItem("tooling", "tooling"));
        cbo.Items.Add(new ListItem("Tooling_cc", "Tooling_cc"));
        cbo.Items.Add(new ListItem("tracing", "tracing"));
        cbo.Items.Add(new ListItem("tracing_cc", "tracing_cc"));
        cbo.Items.Add(new ListItem("weekly", "weekly"));
        cbo.Items.Add(new ListItem("weekly_cc", "weekly_cc"));
    }

}

public class Inspect_NG
{
    public string inspect_id;
    public string id;
    public string ng_cav;
    public string ng_casuses;
    public string ng_psition;
    public string create_dt;


    public List<Inspect_NG> getList(string inspect_id)
    {
        List<Inspect_NG> List = new List<Inspect_NG>();

        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string command = " select * from eipe.dbo.vmi_Inspect_NG where inspect_id='" + inspect_id + "' order by create_dt desc  ";
            try
            {
                rs.Open(command);
                while (!rs.EOF)
                {
                    Inspect_NG NG = new Inspect_NG();
                    NG.id = rs["id"].ToString();
                    NG.inspect_id = rs["inspect_id"].ToString();
                    NG.ng_cav = rs["ng_cav"].ToString();
                    NG.ng_casuses = rs["ng_casuses"].ToString();
                    NG.ng_psition = rs["ng_psition"].ToString();
                    NG.create_dt = rs["create_dt"].ToString();

                    rs.MoveNext();
                    List.Add(NG);
                }

                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        return List;
    }

    public Inspect_NG getNg(string id)
    {
        Inspect_NG NG = new Inspect_NG();
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            string command = " select * from eipe.dbo.vmi_Inspect_NG where inspect_id='" + inspect_id + "' order by create_dt desc  ";
            rs.Open(command);

            if (!rs.EOF)
            {
                NG.id = rs["id"].ToString();
                NG.inspect_id = rs["inspect_id"].ToString();
                NG.ng_cav = rs["ng_cav"].ToString();
                NG.ng_casuses = rs["ng_casuses"].ToString();
                NG.ng_psition = rs["ng_psition"].ToString();
                NG.create_dt = rs["create_dt"].ToString();

            }
            rs.Close();
        }
        return NG;
    }

    public void Add(Inspect_NG Ng)
    {
        Inspect_NG NG = new Inspect_NG();
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            rs.Open("select * from eipe.dbo.vmi_Inspect_NG WHERE 1=0");

            rs.Add();
            rs["id"] = Guid.NewGuid();
            rs["inspect_id"] = Ng.inspect_id;
            rs["ng_casuses"] = Ng.ng_casuses;
            rs["ng_cav"] = Ng.ng_cav;
            rs["ng_psition"] = Ng.ng_psition;
            rs["create_dt"] = DateTime.Now;
            rs.Update();

            rs.Close();
        }
    }

}

public enum shift : int  //在這修改預設的型別
{
    day = 0,
    night = 1
}

#region NG
public class NG
{
    public class Temp
    {

        private DataTable _NG = new DataTable();
        public string Tag = "NG";

        public Temp(DataTable NgTemp)
        {
            _NG = NgTemp;

            if (_NG.Columns.Count < 1)
            {
                initDTable();
            }

        }

        private void initDTable()
        {
            _NG.Columns.Add("inspect_id");
            _NG.Columns.Add("id");
            _NG.Columns.Add("ng_cav");
            _NG.Columns.Add("ng_count");

        }

        public void AddTemp(string id, string inspectid, string seq, string cav, string causes, string postion, string count)
        {

            DataRow dr = _NG.NewRow();
            dr["inspect_id"] = inspectid;
            dr["id"] = id;
            dr["ng_cav"] = cav;
            dr["ng_count"] = count;

            _NG.Rows.Add(dr);
           
        }

        public DataTable DelTemp(int index)
        {
            int row = index - 1; //datatable 從0開始 
            _NG.Rows.RemoveAt(index);
            return _NG;
        }


        public DataTable DelList(string inspect_id)
        {
            DataRow[] List = _NG.Select(" inspect_id='" + inspect_id + "'");

            if (List.Length > 0)
            {
                foreach (DataRow Item in List)
                {
                    _NG.Rows.Remove(Item);
                }
            }
            return _NG;
        }

        public DataTable DelItem(string id)
        {
            DataRow[] List = _NG.Select(" id='" + id + "'");

            if (List.Length > 0)
            {
                foreach (DataRow Item in List)
                {
                    _NG.Rows.Remove(Item);
                }
            }
            return _NG;
        }

        public DataTable TempDb
        {
            get
            {
                return _NG;
            }
            set
            {
                setTemDb(value);
            }
        }

        private void setTemDb(DataTable db)
        {
            try
            {

                if (db.Columns.Count > 0)
                {
                    _NG = db;
                }
                else
                {
                    throw new DataException("What does “Object reference not set to an instance of an object");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("please refresh web again ");
            }
        }
    }
}
#endregion

#region NgCauses
public class NgCauses
{
    public class Temp
    {

        private DataTable _NgCauses = new DataTable();
        public string Tag = "NgCauses";

        public Temp(DataTable NgTemp)
        {
            _NgCauses = NgTemp;

            if (_NgCauses.Columns.Count < 1)
            {
                initDTable();
            }
        }

        private void initDTable()
        {
            _NgCauses.Columns.Add("id");
            _NgCauses.Columns.Add("ng_id");
            _NgCauses.Columns.Add("ng_causes");
            _NgCauses.Columns.Add("text");

        }

        public void AddTemp(string id, string ng_id, string ng_causes, string text)
        {
            DataRow dr = _NgCauses.NewRow();

            dr["id"] = id;
            dr["ng_id"] = ng_id;
            dr["ng_causes"] = ng_causes;
            dr["text"] = text;
            _NgCauses.Rows.Add(dr);
        }

        public DataTable DelTemp(int index)
        {
            int row = index - 1; //datatable 從0開始 
            _NgCauses.Rows.RemoveAt(index);
            return _NgCauses;
        }

        public DataTable DelList(string ng_id)
        {
            DataRow[] List = _NgCauses.Select(" ng_id='" + ng_id + "'");

            if (List.Length > 0)
            {
                foreach (DataRow Item in List)
                {
                    _NgCauses.Rows.Remove(Item);
                }
            }
            return _NgCauses;
        }

        public DataTable Copy(string ng_id, DataRow[] CopyList)
        {
            foreach (DataRow Item in CopyList)
            {
                AddTemp(Guid.NewGuid().ToString(), ng_id, Item["ng_causes"].ToString(), Item["text"].ToString());
            }

            return _NgCauses;
        }

        public DataTable TempDb
        {
            get
            {
                return _NgCauses;
            }
            set
            {
                setTemDb(value);
            }
        }

        private void setTemDb(DataTable db)
        {
            try
            {

                if (db.Columns.Count > 0)
                {
                    _NgCauses = db;
                }
                else
                {
                    throw new DataException("What does “Object reference not set to an instance of an object");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("please refresh web again ");
            }
        }
    }

}
#endregion NgCauses

#region NgPosition
public class NgPosition
{
    public class Temp
    {

        private DataTable _NgPosition = new DataTable();
        public string Tag = "NgPosition";

        public Temp(DataTable NgTemp)
        {
            _NgPosition = NgTemp;

            if (_NgPosition.Columns.Count < 1)
            {
                initDTable();
            }
        }

        private void initDTable()
        {
            _NgPosition.Columns.Add("id");
            _NgPosition.Columns.Add("ng_id");
            _NgPosition.Columns.Add("ng_Position");
            _NgPosition.Columns.Add("text");
        }

        public void AddTemp(string id, string ng_id, string ng_Position, string text)
        {
            DataRow dr = _NgPosition.NewRow();

            dr["id"] = id;
            dr["ng_id"] = ng_id;
            dr["ng_Position"] = ng_Position;
            dr["text"] = text;
            _NgPosition.Rows.Add(dr);
        }

        public DataTable DelTemp(int index)
        {
            int row = index - 1; //datatable 從0開始 
            _NgPosition.Rows.RemoveAt(index);
            return _NgPosition;
        }

        public DataTable DelList(string ng_id)
        {
            DataRow[] List = _NgPosition.Select(" ng_id='" + ng_id + "'");

            if (List.Length > 0)
            {
                foreach (DataRow Item in List)
                {
                    _NgPosition.Rows.Remove(Item);
                }
            }
            return _NgPosition;
        }

        public DataTable Copy(string ng_id, DataRow[] CopyList)
        {
            foreach (DataRow Item in CopyList)
            {
                AddTemp(Guid.NewGuid().ToString(), ng_id, Item["ng_Position"].ToString(), Item["text"].ToString());

            }
            return _NgPosition;
        }

        public DataTable TempDb
        {
            get
            {
                return _NgPosition;
            }
            set
            {
                setTemDb(value);
            }
        }

        private void setTemDb(DataTable db)
        {
            try
            {

                if (db.Columns.Count > 0)
                {
                    _NgPosition = db;
                }
                else
                {
                    throw new DataException("What does “Object reference not set to an instance of an object");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("please refresh web again ");
            }
        }
    }

}
#endregion NgPosition

#region MMR
public class MMR
{

    public class Temp
    {
        private DataTable _MMR = new DataTable();
        public string Tag = "MMR";

        public Temp(DataTable Temp)
        {
            _MMR = Temp;

            if (_MMR.Columns.Count < 1)
            {
                initDTable();
            }

        }

        private void initDTable()
        {
            _MMR.Columns.Add("id");
            _MMR.Columns.Add("inspect_id");
            _MMR.Columns.Add("MMRNo");
            _MMR.Columns.Add("recordno");
            _MMR.Columns.Add("remark");
            _MMR.Columns.Add("filename");
            _MMR.Columns.Add("attach");
            _MMR.Columns.Add("type");

        }

        public void AddTemp(string id, string inspectid, string remark, string RecordNo, string filename, string attach, string MMRNo, string type)
        {
            DataRow dr = _MMR.NewRow();
            dr["id"] = id;
            dr["inspect_id"] = inspectid;
            dr["RecordNo"] = RecordNo;
            dr["MMRNo"] = MMRNo;
            dr["remark"] = remark;
            dr["filename"] = filename;
            dr["attach"] = attach;
            dr["type"] = type;

            _MMR.Rows.Add(dr);
        }

        public DataTable DelTemp(int index)
        {
            int row = index - 1; //datatable 從0開始 
            _MMR.Rows.RemoveAt(index);
            return _MMR;
        }

        public DataTable DelList(string inspect_id)
        {
            DataRow[] List = _MMR.Select(" inspect_id='" + inspect_id + "'");

            if (List.Length > 0)
            {

                foreach (DataRow Item in List)
                {
                    _MMR.Rows.Remove(Item);
                }
            }
            return _MMR;
        }

        public DataTable TempDb
        {
            get
            {
                return _MMR;
            }
            set
            {
                setTemDb(value);
            }
        }

        private void setTemDb(DataTable db)
        {

            try
            {

                if (db.Columns.Count > 0)
                {
                    _MMR = db;
                }


            }
            catch (Exception ex)
            {
                throw new Exception("please refresh web again ");
            }
        }
    }


}
#endregion MMR

#region Result
public class Result
{

    public class Temp
    {
        private DataTable _Result = new DataTable();
        public string Tag = "Result";

        public Temp(DataTable Temp)
        {
            _Result = Temp;

            if (_Result.Columns.Count < 1)
            {
                initDTable();
            }

        }

        private void initDTable()
        {
            _Result.Columns.Add("id");
            _Result.Columns.Add("inspect_id");
            _Result.Columns.Add("result");
            _Result.Columns.Add("text");

        }

        public void AddTemp(string id, string inspectid, string result, string text)
        {
            DataRow dr = _Result.NewRow();
            dr["id"] = id;
            dr["inspect_id"] = inspectid;
            dr["result"] = result;
            dr["text"] = text;

            _Result.Rows.Add(dr);
        }

        public DataTable DelTemp(int index)
        {
            int row = index - 1; //datatable 從0開始 
            _Result.Rows.RemoveAt(index);
            return _Result;
        }

        public DataTable DelList(string inspect_id)
        {
            DataRow[] List = _Result.Select(" inspect_id='" + inspect_id + "'");

            if (List.Length > 0)
            {

                foreach (DataRow Item in List)
                {
                    _Result.Rows.Remove(Item);
                }
            }
            return _Result;
        }

        public DataTable TempDb
        {
            get
            {
                return _Result;
            }
            set
            {
                setTemDb(value);
            }
        }

        private void setTemDb(DataTable db)
        {
            try
            {

                if (db.Columns.Count > 0)
                {
                    _Result = db;
                }


            }
            catch (Exception ex)
            {
                throw new Exception("please refresh web again ");
            }
        }
    }

}
#endregion Result

#region Insulate
public class cut
{
    public class Temp
    {
        private DataTable _Insulate = new DataTable();
        public string Tag = "Insulate";

        public Temp(DataTable Temp)
        {
            _Insulate = Temp;

            if (_Insulate.Columns.Count < 1)
            {
                initDTable();
            }

        }

        private void initDTable()
        {
            _Insulate.Columns.Add("id");
            _Insulate.Columns.Add("inspect_id");
            _Insulate.Columns.Add("ng_id");
            _Insulate.Columns.Add("insulationNo");
            _Insulate.Columns.Add("spearateNo");
            _Insulate.Columns.Add("start_time");
            _Insulate.Columns.Add("end_time");
        }

        /// <summary>
        ///  存入暫存檔,InsulationNO由系統管制，待存檔取得
        /// </summary>
        /// <param name="id"></param>
        /// <param name="inspectid"></param>
        /// <param name="SpearateNo"></param>
        /// <param name="Insulation_Time"></param>
        /// <param name="NgCav"></param>
        /// <param name="NgCauses"></param>
        /// <param name="NgPostion"></param>
        /// <param name="Seq"></param>
        public void AddTemp(string id, string InsulateNo, string inspectid, string SpearateNo, string startTime, string endTime, string ng_id)
        {
            DataRow dr = _Insulate.NewRow();
            dr["id"] = id;
            dr["inspect_id"] = inspectid;
            dr["insulationNo"] = InsulateNo;
            dr["spearateNo"] = SpearateNo;
            dr["start_time"] = startTime;
            dr["end_time"] = endTime;
            dr["ng_id"] = ng_id;

            _Insulate.Rows.Add(dr);
        }

        public DataTable DelList(string inspect_id)
        {
            DataRow[] List = _Insulate.Select(" inspect_id='" + inspect_id + "'");

            if (List.Length > 0)
            {
                foreach (DataRow Item in List)
                {
                    _Insulate.Rows.Remove(Item);
                }
            }
            return _Insulate;
        }

        public DataTable DelItem(int index)
        {
            _Insulate.Rows.RemoveAt(index);
            return _Insulate;
        }

        public DataTable UpdateItem(string id, string inspectid, string SpearateNo, string startTime, string endTime)
        {
            DataRow[] List = _Insulate.Select(" id='" + id + "'");

            if (List.Length > 0)
            {
                foreach (DataRow Item in List)
                {
                    if (!string.IsNullOrEmpty(inspectid))
                    {
                        Item["inspect_id"] = inspectid;
                    }

                    if (!string.IsNullOrEmpty(SpearateNo))
                    {
                        Item["spearateNo"] = SpearateNo;
                    }

                    if (!string.IsNullOrEmpty(startTime))
                    {
                        Item["start_time"] = startTime;
                    }

                    if (!string.IsNullOrEmpty(endTime))
                    {
                        Item["edit_time"] = endTime;
                    }

                }
            }
            return _Insulate;
        }

        public DataTable TempDb
        {
            get
            {
                return _Insulate;
            }
            set
            {
                setTemDb(value);
            }
        }

        private void setTemDb(DataTable db)
        {
            try
            {

                if (db.Columns.Count > 0)
                {
                    _Insulate = db;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("please refresh web again ");
            }
        }
    }
}
#endregion Insulate