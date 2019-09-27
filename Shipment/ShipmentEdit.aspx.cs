using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using SmoothEnterprise.Security.UI.WebControl;
using SmoothEnterprise.Web.UI.HTMLControl;
using System.Text;
using SmoothEnterprise.Calendar;
using System.Collections.Generic;

/*
 *  此程式的審核者,為參考eipa.dbo.erp_flow 這個Table
 * 2016/1/24 add by rage 增加各NPI的leader 簽核
 * 2016/2/16 modify by rage 取兩個NPI Leader
 * 2016/3/2 add by rage 在john那一組要多加brain簽核
 * 2016/3/24 add by rage 在john那一組要多加brain簽核
 * mark     Date           Aouther     action       Reason                  
 * ----------------------------------------------------------
 * V1.01     2018/01/26    Carol        modify     人事異動，john的簽核改為David Wu，Brain不需簽核 
 * V1.02     2018/05/17    Carol        modify     Mandy: MA commitment  date(ETD)該欄在有值之後，就不得修改
 * V1.03     2018/07/19    Carol        Add     　 業助需求加一remark 在shipment_body , 並將(ETD)檢查修改，
 *                                                 因系統會預設帶出送樣資料，所以 button_update_item 可以不檢查必填欄位
 */

namespace Shipment
{
    public partial class ShipmentEdit : SmoothEnterprise.Web.Page
    {
        private string db1 = ""; //db主位置 
        private string db2 = ""; //db副位置
        private string db3 = ""; //db副2位置
        public string sendyes = ""; //是否己送審 1代表己送審

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
            {
                db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                db3 = "[barcode].[dbo]."; //如果不是在Ann本機, 則指定資料庫 

            }

            //Page.Title = "NPI送樣流程-修改";
            BUTTON_save.Attributes.Add("OnClick", "return check()");
            Button_AddItem.Attributes.Add("OnClick", "return   j1()"); //如前端javascript檢查有問題,禁止提交頁面//單身的
            //Button_UpdateItem.Attributes.Add("OnClick", "return   j1()"); //upate 因為預設資料，所以可以不填 keywrod 20180719 carol
            try
            {


                if (!this.IsPostBack)
                {

                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                    //取出 Customer
                    rs.Open("SELECT   LID,LCaption FROM " + db1 + "[NPI_Base_file] where TID='C' and LActi='Y' order by  LCaption asc");
                    while (!rs.EOF)
                    {
                        this.FIELD_Customer.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LCaption"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT   LID,LCaption FROM " + db1 + "[NPI_Base_file] where TID='S' and LActi='Y' order by  LCaption asc");
                    while (!rs.EOF)
                    {
                        this.FIELD_Shipment_type.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LID"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT   LID,LCaption FROM " + db1 + "[NPI_Base_file] where TID='E' and LActi='Y' order by  LCaption asc");
                    while (!rs.EOF)
                    {
                        this.FIELD_Potential_P_choose.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LCaption"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    this.FIELD_Material.Items.Add(new ListItem("NA", "NA"));
                    this.FIELD_Material2.Items.Add(new ListItem("NA", "NA"));
                    this.FIELD_Material3.Items.Add(new ListItem("NA", "NA"));

                    rs.Open("SELECT lcaption  FROM " + db3 + "[bar_base_file]  where TID='G' and LActi='Y' and comid='MAT'");
                    while (!rs.EOF)
                    {

                        this.FIELD_Material.Items.Add(new ListItem(rs["lcaption"].ToString(), rs["lcaption"].ToString()));
                        this.FIELD_Material2.Items.Add(new ListItem(rs["lcaption"].ToString(), rs["lcaption"].ToString()));
                        this.FIELD_Material3.Items.Add(new ListItem(rs["lcaption"].ToString(), rs["lcaption"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();




                    SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs3.Open("SELECT * FROM " + db1 + "NPI_Base_file where TID='P'");
                    while (!rs3.EOF)
                    {
                        //DropDownList1.Items.Add(new ListItem(rs3["dept_nm"].ToString(), rs3["dept_no"].ToString()));
                        CheckBoxList2.Items.Add(new ListItem(rs3["LCaption"].ToString(), rs3["LID"].ToString()));
                        rs3.MoveNext();
                    }
                    rs3.Close();

                    /*V1.02 del
                        rs.Open("SELECT a.id, a.No, a.Ver, a.ERP_PO,a.ERP_ITEM,a.Sales, a.Customer, a.C_PO, a.Purpose, a.loc, a.Add_user, a.Add_date, a.Status, b.name bname,plant " +
                            "FROM  " + db1 + "Shipment_head AS a  " +
                            "LEFT OUTER JOIN" + db2 + "dguser AS b ON a.add_user = b.id " +
                            "WHERE (a.id = '" + Request.QueryString["id"] + "')");

                    */
                    //V1.02 add

                    StringBuilder sb = new StringBuilder();
                    sb.Append("select a.id, a.no, a.ver, a.erp_po,a.erp_item,a.sales, a.customer, a.c_po, a.purpose, a.loc, ");
                    sb.Append("a.add_user,  a.add_date,a.status, b.name bname,c.C_demand,c.C_demand2,plant,b.remark  from [eipb].[dbo].shipment_head as a  "); //v1.03
                    sb.Append("left join[eipa].[dbo].dguser as b on a.add_user = b.id  ");
                    sb.Append("left join  [EIPB].[dbo].Shipment_body c on a.No=c.No ");
                    sb.AppendFormat("where a.id = '{0}' ", Request.QueryString["id"].ToString());

                    rs.Open(sb.ToString());

                    if (!rs.EOF)
                    {

                        this.FIELD_Customer.Items.Add(new ListItem(rs["Customer"].ToString(), rs["Customer"].ToString()));
                        this.FIELD_Customer.Text = rs["Customer"].ToString();
                        this.FIELD_PO.Text = rs["C_PO"].ToString();
                        //this.FIELD_Purpose.Text = rs["Purpose"].ToString();
                        this.FIELD_loc.Text = rs["loc"].ToString();
                        this.FIELD_ERP_PO.Text = rs["ERP_PO"].ToString();
                        this.FIELD_ERPITEM.Text = rs["ERP_ITEM"].ToString();
                        this.add_user.Text = rs["bname"].ToString();
                        this.FIELD_Add_date.Text = rs["add_date"].ToString();
                        this.no.Text = rs["no"].ToString();
                        this.ver.Text = rs["ver"].ToString();
                        this.Plant.Text = rs["plant"].ToString();
                        this.FIELD_Sales.Text = rs["Sales"].ToString();

                        if (rs["status"].ToString().Trim() == "Y")
                        {
                            this.InputButton1.Enabled = true;
                            this.Button_UpdateItem.Visible = false;
                            this.Button_AddItem.Visible = false;
                            this.BUTTON_save.Enabled = false;
                            this.InputButton2.Enabled = false;
                            this.InputFile1.Visible = false;

                        }
                        else
                        {
                            this.Button_UpdateItem.Visible = true;
                            this.Button_AddItem.Visible = true;
                            this.InputButton1.Enabled = false;


                        }

                        if (rs["status"].ToString().Trim() == "OK")
                        {

                            this.BUTTON_SendRequest.Visible = false;
                            this.BUTTON_save.Enabled = false;
                            this.InputButton2.Enabled = false;
                            this.InputFile1.Visible = false;

                        }

                        this.FIELD_Packing.Text = "QTY:" + Environment.NewLine + "NW/GW:" + Environment.NewLine + "CARTON QTY:" + Environment.NewLine + "VIA:" + Environment.NewLine + "Attn to:";


                        if (rs["ver"].ToString() != "1")
                        {

                            Label32.ForeColor = Color.Gray;
                            FIELD_C_demand.BackColor = Color.White;
                            FIELD_C_demand.Enabled = false;
                            Label21.ForeColor = Color.White;
                            Label22.ForeColor = Color.Red;
                        }

                        //v1.0.2 add 
                        string c_demand = rs["c_demand"].ToString();

                        FIELD_C_demand.Enabled = string.IsNullOrEmpty(c_demand) ? true : false;
                        FIELD_C_demand.Text = string.IsNullOrEmpty(c_demand) ? "" : Convert.ToDateTime(rs["c_demand"].ToString()).ToString("yyyyMMdd");
                        FIELD_C_demand2.Text = string.IsNullOrEmpty(rs["c_demand2"].ToString()) ? "" : Convert.ToDateTime(rs["c_demand2"].ToString()).ToString("yyyyMMdd");
                        //v1.0.2 end

                        txt_remark.Text = rs["remark"].ToString(); //v1.03

                    }
                    else
                    {

                        Response.Redirect("Shipment.aspx");
                    }


                    gridviewchange(Request.QueryString["id"]);


                    rs.Open("SELECT * FROM " + db1 + "Shipment_NPIEngineer WHERE aid='" + Request.QueryString["id"] + "' ");
                    if (!rs.EOF)
                    {
                        if (rs["NPI_Engineer1"].ToString().Length > 0) this.FIELD_osend1.Text = rs["NPI_Engineer1"].ToString();
                        if (rs["NPI_Engineer2"].ToString().Length > 0) this.FIELD_osend2.Text = rs["NPI_Engineer2"].ToString(); else this.FIELD_osend2.Visible = false;
                        if (rs["NPI_Engineer3"].ToString().Length > 0) this.FIELD_osend3.Text = rs["NPI_Engineer3"].ToString(); else this.FIELD_osend3.Visible = false;
                        if (rs["NPI_Engineer4"].ToString().Length > 0) this.FIELD_osend4.Text = rs["NPI_Engineer4"].ToString(); else this.FIELD_osend4.Visible = false;
                        if (rs["NPI_Engineer5"].ToString().Length > 0) this.FIELD_osend5.Text = rs["NPI_Engineer5"].ToString(); else this.FIELD_osend5.Visible = false;
                    }

                    //Material由自行填寫轉至下拉式,故設定-------------------------------------------------


                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                    rss.Open("select distinct Material Material_1 from " + db1 + "Shipment_body " +
                            "where aid='" + Request.QueryString["id"] + "' and Material <>'' " +
                            "and Material not in (SELECT lcaption  FROM " + db3 + "bar_base_file  " +
                            "where TID='G' and LActi='Y' and comid='MAT' ) ");

                    while (!rss.EOF)
                    {
                        this.FIELD_Material.Items.Add(new ListItem(rss["Material_1"].ToString(), rss["Material_1"].ToString()));
                        rss.MoveNext();
                    }
                    rss.Close();

                    //------------------------------------------------------------------------------------

                    //附檔----------------------------------------------------

                    rss.Open("SELECT id,FileName,usertype FROM " + db1 + "shipment_File WHERE FileKey='" + Request.QueryString["ID"] + "' ");
                    while (!rss.EOF)
                    {
                        switch (rss["UserType"].ToString())
                        {
                            case "1":
                                CheckBoxFile1.Items.Add(new ListItem("<img with=\"50%\" src=\"FileDownload.aspx?id=" + rss["id"].ToString() + "\">", rss["id"].ToString()));
                                break;
                            case "2":
                                CheckBoxFile2.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rss["id"].ToString() + "\" target=\"_blank\">" + rss["FileName"].ToString() + "</a>", rss["id"].ToString()));
                                break;
                            case "3":
                                CheckBoxFile3.Items.Add(new ListItem("<img with=\"50%\" src=\"FileDownload.aspx?id=" + rss["id"].ToString() + "\">", rss["id"].ToString()));
                                break;
                        }
                        rss.MoveNext();
                    }
                    rss.Close();

                    btn_test.Visible = Utility.MIS_Manager(CurrentUser.LogonID);
                }
            


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

             
        }

        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.KeepURL();
            }
        }

        protected void BUTTON_save_Click(object sender, System.EventArgs e)
        {
            if (this.IsValid)
            {
                try
                {
                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rs.Open("SELECT * FROM " + db1 + "Shipment_head WHERE id='" + Request.QueryString["id"] + "' ");
                    if (!rs.EOF)
                    {

                        if (this.FIELD_Customer.Text != "") rs["Customer"] = this.FIELD_Customer.Text; else rs["Customer"] = System.DBNull.Value;
                        //if (this.FIELD_Purpose.Text != "") rs["Purpose"] = this.FIELD_Purpose.Text; else rs["Purpose"] = System.DBNull.Value;
                        if (this.FIELD_loc.Text != "") rs["loc"] = this.FIELD_loc.Text; else rs["loc"] = System.DBNull.Value;
                        if (this.FIELD_ERP_PO.Text != "") rs["ERP_PO"] = this.FIELD_ERP_PO.Text; else rs["ERP_PO"] = System.DBNull.Value;
                        if (this.FIELD_Sales.Text != "") rs["Sales"] = this.FIELD_Sales.Text; else rs["Sales"] = System.DBNull.Value;
                        //rs["ADD_USER"] = this.CurrentUser.ID.ToString();

                        rs.Update();
                    }
                    rs.Close();

                    rs.Open("SELECT * FROM " + db1 + "Shipment_NPIEngineer where  aid='" + Request.QueryString["id"] + "'");
                    if (!rs.EOF)
                    {
                        if (this.FIELD_osend1.Text != "") rs["NPI_Engineer1"] = this.FIELD_osend1.Text; else rs["NPI_Engineer1"] = System.DBNull.Value;
                        if (this.FIELD_osend2.Text != "") rs["NPI_Engineer2"] = this.FIELD_osend2.Text; else rs["NPI_Engineer2"] = System.DBNull.Value;
                        if (this.FIELD_osend3.Text != "") rs["NPI_Engineer3"] = this.FIELD_osend3.Text; else rs["NPI_Engineer3"] = System.DBNull.Value;
                        if (this.FIELD_osend4.Text != "") rs["NPI_Engineer4"] = this.FIELD_osend4.Text; else rs["NPI_Engineer4"] = System.DBNull.Value;
                        if (this.FIELD_osend5.Text != "") rs["NPI_Engineer5"] = this.FIELD_osend5.Text; else rs["NPI_Engineer5"] = System.DBNull.Value;
                        rs.Update();
                    }

                    rs.Close();

                    string FileList = "";
                    for (int x = 0; x < this.CheckBoxFile1.Items.Count; x++)
                    {
                        if (this.CheckBoxFile1.Items[x].Selected == true)
                        {
                            if (FileList == "")
                                FileList = "'" + this.CheckBoxFile1.Items[x].Value + "'";
                            else
                                FileList = FileList + ",'" + this.CheckBoxFile1.Items[x].Value + "'";
                        }
                    }
                    for (int x = 0; x < this.CheckBoxFile2.Items.Count; x++)
                    {
                        if (CheckBoxFile2.Items[x].Selected == true)
                        {
                            if (FileList == "")
                                FileList = "'" + CheckBoxFile2.Items[x].Value + "'";
                            else
                                FileList = FileList + ",'" + CheckBoxFile2.Items[x].Value + "'";
                        }
                    }

                    for (int x = 0; x < this.CheckBoxFile3.Items.Count; x++)
                    {
                        if (CheckBoxFile3.Items[x].Selected == true)
                        {
                            if (FileList == "")
                                FileList = "'" + CheckBoxFile3.Items[x].Value + "'";
                            else
                                FileList = FileList + ",'" + CheckBoxFile3.Items[x].Value + "'";
                        }
                    }

                    #region 動態新增
                    HttpFileCollection files = HttpContext.Current.Request.Files;
                    System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
                    int att_count = 0;

                    SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rs2.Open("SELECT * FROM " + db1 + "shipment_File WHERE 1=0");
                    int ifile = 0;
                    foreach (string key in files.AllKeys)
                    {
                        HttpPostedFile postedfile = files[ifile];
                        string filename, fileExt, filePath;
                        filename = System.IO.Path.GetFileName(postedfile.FileName);    //抓取文件名
                        fileExt = System.IO.Path.GetExtension(postedfile.FileName);    //抓取文件附檔名

                        if (postedfile.ContentLength > 0)
                        {
                            rs2.Add();
                            att_count = att_count + 1;
                            String tafilename = "filename" + att_count.ToString();
                            String taattach = "attachment" + att_count.ToString();
                            String tafilexten = "fileexten" + att_count.ToString();

                            byte[] fileBytes = new byte[postedfile.ContentLength];
                            postedfile.InputStream.Read(fileBytes, 0, postedfile.ContentLength);

                            if (key.IndexOf("attach1") > 0)
                            {
                                rs2["UserType"] = "1";    //附檔為BARCODE No.
                            }
                            if (key.IndexOf("InputFile1") > 0)
                            {
                                rs2["UserType"] = "2";   //附檔為SE Approved Doc
                            }
                            if (key.IndexOf("attach2") > 0)
                            {
                                rs2["UserType"] = "3";   //附檔為DCM code 
                            }

                            rs2["FileKey"] = Request.QueryString["id"];
                            rs2["FileName"] = filename;
                            rs2["FileBody"] = fileBytes;
                            rs2["FileType"] = fileExt;
                            rs2.Update();
                        }
                        ifile++;
                    }
                    rs2.Close();
                    #endregion
                    //刪除附檔------------------------------------------------------------------------------------------
                    if (FileList != "")
                    {
                        SmoothEnterprise.Database.DataSet rsD = new SmoothEnterprise.Database.DataSet();
                        rsD.ExecuteNonQuery("Delete FROM " + db1 + " shipment_File WHERE ID in (" + FileList + ")");
                    }
                    //刪除附檔------------------------------------------------------------------------------------------


                    Response.Redirect("Shipmentedit.aspx?id=" + Request.QueryString["id"]);

                }
                catch (Exception ex)
                {
                    this.AddError(this, "BUTTON_save_Click()", "", ex.Message);
                }
            }
        }

        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("Shipment.aspx");
        }


        protected void Button_ERPPO_Click(object sender, EventArgs e)
        {

        }
        protected void Button_New_Click(object sender, EventArgs e)
        {

        }
        protected void Button_AddItem_Click(object sender, EventArgs e)
        {



            //rss["aid"] = Request.QueryString["id"];
            //rss["no"] = this.no.Text;
            //rss["ver"] = this.ver.Text;
            //rss["item"] = maxitem.ToString();
            //rss["partno"] = Request.Form["FIELD_Partno"];
            //rss["component"] = Request.Form["FIELD_Component"];
            //rss["dwg"] = Request.Form["FIELD_DWG"];
            //rss["qty"] = this.FIELD_Qty.Text;
            //if (this.FIELD_Material.Text != "") rss["material"] = this.FIELD_Material.Text;
            //if (this.FIELD_Material2.Text != "") rss["material2"] = this.FIELD_Material2.Text;
            //if (this.FIELD_Material3.Text != "") rss["material3"] = this.FIELD_Material3.Text;
            //if (this.FIELD_Shipment_type.Text != "") rss["shipment_type"] = this.FIELD_Shipment_type.Text;
            //if (this.FIELD_LV.Text != "") rss["lv"] = this.FIELD_LV.Text;
            //if (this.FIELD_HV.Text != "") rss["hv"] = this.FIELD_HV.Text;

            //if (this.FIELD_C_demand.Text != "") rss["c_demand"] = DateTime.ParseExact(this.FIELD_C_demand.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces);
            //if (this.FIELD_C_demand2.Text != "") rss["c_demand2"] = DateTime.ParseExact(this.FIELD_C_demand2.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces);

            //if (this.FIELD_ETD.Text != "") rss["ETD"] = this.FIELD_ETD.Text;
            //if (this.FIELD_Packing.Text != "") rss["packing"] = this.FIELD_Packing.Text;
            //if (this.FIELD_Labno.Text != "") rss["labno"] = this.FIELD_Labno.Text;
            //if (this.FIELD_EngineeringTestNo.Text != "") rss["EngineeringTest_No"] = this.FIELD_EngineeringTestNo.Text;
            //if (this.FIELD_purpose2.Text != "") rss["purpose2"] = this.FIELD_purpose2.Text;
            //if (this.FIELD_Labsn.Text != "") rss["labsn"] = this.FIELD_Labsn.Text;
            //if (this.RadioButton1.Checked)
            //{
            //    rss["potential_p"] = this.FIELD_Potential_P_choose.Text;
            //}
            //else
            //{
            //    rss["potential_p"] = this.FIELD_Potential_P.Text;
            //}



            if (chk_ETD())
            {
                string remark = txt_remark.Text; //v1.03
                this.rember_item.Value = "";

                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rss.Open("SELECT * FROM " + db1 + "shipment_body WHERE 1=0");
                rss.Add();

                SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                object objola = onum.ExecuteScalar("select  ISNULL(MAX(item),'0')+1 item  from " + db1 + "shipment_body where aid='" + Request.QueryString["id"] + "' ");
                string maxitem = objola.ToString();

                rss["aid"] = Request.QueryString["id"];
                rss["no"] = this.no.Text;
                rss["ver"] = this.ver.Text;
                rss["item"] = maxitem.ToString();
                rss["partno"] = Request.Form["FIELD_Partno"];
                rss["component"] = Request.Form["FIELD_Component"];
                rss["dwg"] = Request.Form["FIELD_DWG"];
                rss["qty"] = this.FIELD_Qty.Text;
                if (this.FIELD_Material.Text != "") rss["material"] = this.FIELD_Material.Text;
                if (this.FIELD_Material2.Text != "") rss["material2"] = this.FIELD_Material2.Text;
                if (this.FIELD_Material3.Text != "") rss["material3"] = this.FIELD_Material3.Text;
                if (this.FIELD_Shipment_type.Text != "") rss["shipment_type"] = this.FIELD_Shipment_type.Text;
                if (this.FIELD_LV.Text != "") rss["lv"] = this.FIELD_LV.Text;
                if (this.FIELD_HV.Text != "") rss["hv"] = this.FIELD_HV.Text;
                if (this.FIELD_C_demand.Text != "") rss["c_demand"] = DateTime.ParseExact(this.FIELD_C_demand.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces);
                if (this.FIELD_C_demand2.Text != "") rss["c_demand2"] = DateTime.ParseExact(this.FIELD_C_demand2.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces);

                if (this.FIELD_ETD.Text != "") rss["ETD"] = this.FIELD_ETD.Text;

                if (this.FIELD_Packing.Text != "") rss["packing"] = this.FIELD_Packing.Text;
                if (this.FIELD_Labno.Text != "") rss["lab_no"] = this.FIELD_Labno.Text;
                if (this.FIELD_EngineeringTestNo.Text != "") rss["engineeringtest_no"] = this.FIELD_EngineeringTestNo.Text;
                if (this.FIELD_purpose2.Text != "") rss["purpose2"] = this.FIELD_purpose2.Text;
                if (this.FIELD_Labsn.Text != "") rss["labsn"] = this.FIELD_Labsn.Text;
                if (this.FIELD_Explanation.Text != "") rss["Explanation"] = this.FIELD_Explanation.Text;
                if (this.RadioButton1.Checked)
                {
                    rss["potential_p"] = this.FIELD_Potential_P_choose.Text;
                }
                else
                {
                    rss["potential_p"] = this.FIELD_Potential_P.Text;
                }

                rss["remark"] = remark;//v1.03

                rss.Update();
                rss.Close();
                gridviewchange(Request.QueryString["id"]);

                #region 儲存shipment_paper

                for (int x = 0; x < this.CheckBoxList2.Items.Count; x++)
                {
                    if (CheckBoxList2.Items[x].Selected == true)
                    {
                        SmoothEnterprise.Database.DataSet st = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        st.Open("SELECT * FROM EIPB.DBO.shipment_paper WHERE 1=0");
                        st.Add();
                        st["aid"] = Request.QueryString["id"];
                        st["item"] = maxitem.ToString();
                        st["shipment_paper_id"] = CheckBoxList2.Items[x].Value;

                        st.Update();
                        st.Close();
                    }
                }

                #endregion

                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "test", "$(\"#FIELD_PartNo\").val('');$(\"#FIELD_Component\").val('');$(\"#FIELD_DWG\").val('');", true);
                this.FIELD_Qty.Text = "";
                this.FIELD_Material.Text = "NA";
                this.FIELD_Material2.Text = "NA";
                this.FIELD_Material3.Text = "NA";
                this.FIELD_Shipment_type.Text = "";
                this.FIELD_LV.Text = "";
                this.FIELD_HV.Text = "";
                this.FIELD_C_demand.Text = "";
                this.FIELD_C_demand2.Text = "";
                this.FIELD_ETD.Text = "";
                this.FIELD_Potential_P.Text = "";
                this.FIELD_Packing.Text = "QTY:" + Environment.NewLine + "NW/GW:" + Environment.NewLine + "CARTON QTY:" + Environment.NewLine + "VIA:" + Environment.NewLine + "Attn to:";
                this.FIELD_Shipment_type.Text = "";
                this.RadioButton1.Checked = true;
                this.FIELD_Potential_P_choose.Text = "";
                this.FIELD_Labno.Text = "";
                this.FIELD_EngineeringTestNo.Text = "";
                this.FIELD_purpose2.Text = "";
                this.FIELD_Labsn.Text = "";
                this.FIELD_Explanation.Text = "";
                for (int i = 0; i < CheckBoxList2.Items.Count; i++)  //新增完將checkboxlist清除
                {
                    CheckBoxList2.Items[i].Selected = false;
                }
            }
        }
        protected void Button_UpdateItem_Click(object sender, EventArgs e)
        {
            Console.WriteLine("Button_UpdateItem");
            //20121002 mandy提出, MA commitment date(ETD)己輸入不得再次變更
            /*/ V1.0.2 mandy重新提出，故於載入form  就鎖死
            SmoothEnterprise.Database.DataSet cdemand = new SmoothEnterprise.Database.DataSet();
            object objola = cdemand.ExecuteScalar("SELECT convert(char, c_demand, 112) c_demand FROM " + db1 + "shipment_body WHERE item='" + this.rember_item.Value + "' and aid='" + Request.QueryString["id"] + "'");
            string csdemand = objola.ToString();


            if (csdemand.Trim().ToString() != "" &&
                !csdemand.Trim().ToString().ToUpper().Contains("NULL") &&
                csdemand.Trim().ToString() != this.FIELD_C_demand.Text.Trim().ToString())
                if (string.IsNullOrEmpty())
                {
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('MA commitment date(ETD) 不得變更');", true);
                }
                else
                */
            try
            {

                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rss.Open("SELECT * FROM " + db1 + "shipment_body WHERE item='" + this.rember_item.Value + "' and aid='" + Request.QueryString["id"] + "'  ");


                if (!rss.EOF)
                {
                    string C_demand = string.IsNullOrEmpty(this.FIELD_C_demand.Text) ? "" : DateTime.ParseExact(FIELD_C_demand.Text, "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces).ToShortDateString(); //v1.0.2
                    string C_demand2 = string.IsNullOrEmpty(this.FIELD_C_demand2.Text) ? "" : DateTime.ParseExact(FIELD_C_demand2.Text, "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces).ToShortDateString();//v1.0.2

                    rss["partno"] = Request.Form["FIELD_Partno"];
                    rss["component"] = Request.Form["FIELD_Component"];
                    rss["dwg"] = Request.Form["FIELD_DWG"];
                    rss["qty"] = this.FIELD_Qty.Text;
                    if (this.FIELD_Material.Text != "") rss["material"] = this.FIELD_Material.Text;
                    if (this.FIELD_Material2.Text != "") rss["material2"] = this.FIELD_Material2.Text;
                    if (this.FIELD_Material3.Text != "") rss["material3"] = this.FIELD_Material3.Text;
                    if (this.FIELD_Shipment_type.Text != "") rss["shipment_type"] = this.FIELD_Shipment_type.Text;
                    if (this.FIELD_LV.Text != "") rss["lv"] = this.FIELD_LV.Text;
                    if (this.FIELD_HV.Text != "") rss["hv"] = this.FIELD_HV.Text;
                    //v1.0.2 del
                    //if (this.FIELD_C_demand.Text != "") rss["c_demand"] =DateTime.ParseExact(this.FIELD_C_demand.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces);
                    //if (this.FIELD_C_demand2.Text != "") rss["c_demand2"] = DateTime.ParseExact(this.FIELD_C_demand2.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces);

                    //v1.0.2 add 

                    if (!string.IsNullOrEmpty(C_demand))
                    {
                        if (chk_ETD_revise())
                        {

                            rss["c_demand"] = C_demand;
                            rss["c_demand2"] = C_demand2;
                        }
                        else
                        {
                            return;
                        }
                    }

                    if (this.FIELD_ETD.Text != "") rss["ETD"] = this.FIELD_ETD.Text;

                    if (this.FIELD_Packing.Text != "") rss["packing"] = this.FIELD_Packing.Text;
                    if (this.FIELD_Labno.Text != "") rss["lab_no"] = this.FIELD_Labno.Text;
                    if (this.FIELD_EngineeringTestNo.Text != "") rss["engineeringtest_no"] = this.FIELD_EngineeringTestNo.Text;
                    if (this.FIELD_purpose2.Text != "") rss["purpose2"] = this.FIELD_purpose2.Text;
                    if (this.FIELD_Labsn.Text != "") rss["labsn"] = this.FIELD_Labsn.Text;
                    if (this.FIELD_Explanation.Text != "") rss["Explanation"] = this.FIELD_Explanation.Text;
                    if (this.RadioButton1.Checked)
                    {
                        rss["potential_p"] = this.FIELD_Potential_P_choose.Text;
                    }
                    else
                    {
                        rss["potential_p"] = this.FIELD_Potential_P.Text;
                    }
                    string remark = txt_remark.Text;//v1.03
                    rss["remark"] = remark;//v1.03

                    rss.Update();

                    #region 刪掉shipment_paper再新增

                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet();
                    rs.ExecuteNonQuery("delete  from " + db1 + "shipment_paper where item='" + this.rember_item.Value + "' and aid='" + Request.QueryString["id"] + "' ");

                    for (int x = 0; x < this.CheckBoxList2.Items.Count; x++)
                    {
                        if (CheckBoxList2.Items[x].Selected == true)
                        {
                            SmoothEnterprise.Database.DataSet st = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            st.Open("SELECT * FROM " + db1 + "shipment_paper WHERE 1=0");
                            st.Add();
                            st["aid"] = Request.QueryString["id"];
                            st["item"] = this.rember_item.Value;
                            st["shipment_paper_id"] = CheckBoxList2.Items[x].Value;

                            st.Update();
                            st.Close();
                        }
                    }

                    #endregion

                    for (int i = 0; i < CheckBoxList2.Items.Count; i++)  //新增完將checkboxlist清除
                    {
                        CheckBoxList2.Items[i].Selected = false;
                    }


                    rss.Close();

                    gridviewchange(Request.QueryString["id"]);

                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "test", "$(\"#FIELD_PartNo\").val('');$(\"#FIELD_Component\").val('');$(\"#FIELD_DWG\").val('');", true);
                    this.FIELD_Qty.Text = "";
                    this.FIELD_Material.Text = "NA";
                    this.FIELD_Material2.Text = "NA";
                    this.FIELD_Material3.Text = "NA";
                    this.FIELD_Shipment_type.Text = "";
                    this.FIELD_LV.Text = "";
                    this.FIELD_HV.Text = "";
                    this.FIELD_C_demand.Text = "";
                    this.FIELD_C_demand2.Text = "";
                    this.FIELD_ETD.Text = "";
                    this.FIELD_Potential_P.Text = ""; ;
                    this.FIELD_Packing.Text = "QTY:" + Environment.NewLine + "NW/GW:" + Environment.NewLine + "CARTON QTY:" + Environment.NewLine + "VIA:" + Environment.NewLine + "Attn to:";
                    this.FIELD_Shipment_type.Text = "";
                    this.RadioButton1.Checked = true;
                    this.rember_item.Value = "";
                    this.FIELD_Potential_P_choose.Text = "";
                    this.FIELD_Labno.Text = "";
                    this.FIELD_EngineeringTestNo.Text = "";
                    this.FIELD_Labsn.Text = "";
                    this.FIELD_Explanation.Text = "";

                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aaa", " document.getElementById(\"ctl00_ContentPlaceHolder1_Button_UpdateItem\").style.display = \"none\" ;", true);
                }
            }
            catch (Exception ex)
            {
                //lab_msg.Text = ex.Message;
            }
        }

        private bool chk_ETD_revise()
        {
            bool isPass = false;

            string etd2 = string.IsNullOrEmpty(this.FIELD_C_demand2.Text) ? "" : DateTime.ParseExact(this.FIELD_C_demand2.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces).ToShortDateString();

            if (!string.IsNullOrEmpty(etd2))
            {
                string yday = DateTime.Now.AddDays(-1).ToShortDateString();
                long etd_dt = DateTime.Parse(etd2).Ticks;
                long curr = DateTime.Parse(yday).Ticks;

                int d = new TimeSpan(etd_dt - curr).Days;

                //大於今天
                if (d > 0)
                {
                    isPass = true;
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('MA commitment date revise(ETD) must be greater than today');", true);
                    isPass = false;
                }
            }

            return isPass;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet();
            //rs.ExecuteNonQuery("delete  " + db1 + "shipment_body where item='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "' and aid='" + Request.QueryString["id"] + "'");
            //string sql="delete  from " + db1 + "shipment_paper where item='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "' and aid='" + Request.QueryString["id"] + "' ";

            //送樣基本資料
            string sql = "delete  from " + db1 + "shipment_body where item='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "' and aid='" + Request.QueryString["id"] + "' ";
            rs.ExecuteNonQuery(sql);

            //Shipment Paper 項目
            string sql2 = "delete  from " + db1 + "shipment_paper where item='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "' and aid='" + Request.QueryString["id"] + "' ";
            rs.ExecuteNonQuery(sql2);

            gridviewchange(Request.QueryString["id"]);



        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {


            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("select * from " + db1 + "shipment_head where id= '" + Request.QueryString["id"] + "' ");
            if (!rs.EOF)
            {
                if (rs["status"].ToString() == "Y" || rs["status"].ToString() == "OK")
                {
                    e.Row.Cells[0].Enabled = false;
                }
                else
                {
                    e.Row.Cells[0].Enabled = true;
                }

                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    string paperlist = "";
                    int countpaper = 0;

                    DataRowView drv = (DataRowView)e.Row.DataItem;




                    SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs3.Open("SELECT shipment_paper_id FROM " + db1 + "shipment_paper where aid='" + Request.QueryString["id"] + "' and item='" + GridView1.DataKeys[e.Row.RowIndex].Values[0].ToString() + "'");
                    while (!rs3.EOF)
                    {
                        paperlist = paperlist + rs3["shipment_paper_id"] + "@";

                        countpaper = countpaper + 1;

                        rs3.MoveNext();
                    }
                    rs3.Close();
                    string text = "";
                    string te2 = "";
                    for (int x = 0; x < CheckBoxList2.Items.Count; x++)
                    {
                        if (paperlist.ToString().IndexOf(CheckBoxList2.Items[x].Value).ToString() != "-1")
                        {

                            te2 = te2 + x + "@";


                        }
                    }

                    e.Row.Cells[1].Attributes.Add("onclick", "return onGridViewRowSelected('" + e.Row.DataItemIndex + "','" + te2.ToString() + "','" + countpaper + "',+'" + rs["status"].ToString() + "')");


                    GetBoxNumbers(e.Row.Cells[19], drv["lab_no"].ToString());
                }
            }

        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " document.getElementById(\"ctl00_ContentPlaceHolder1_Button_UpdateItem\").style.display = \"none\" ;", true);

            if (FIELD_osend2.Visible == true)
            {
                if (FIELD_osend3.Visible == true)
                {
                    if (FIELD_osend4.Visible == true)
                    {
                        if (FIELD_osend5.Visible == true)
                        {

                        }
                        else
                        {
                            this.FIELD_osend5.Visible = true;
                        }
                    }
                    else
                    {
                        this.FIELD_osend4.Visible = true;
                    }
                }
                else
                {
                    this.FIELD_osend3.Visible = true;
                }
            }
            else
            {
                this.FIELD_osend2.Visible = true;

            }
        }
        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            //div2.Style.Add("display", "block");
            //this.ImageButton3.Visible = false;
        }

        protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            try
            {
                SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rsb.Open("SELECT *  FROM " + db1 + "shipment_body  WHERE aid='" + Request.QueryString["id"] + "' ");
                //Response.Write(rsb.SQL+"<br/>");
                if (!rsb.EOF)
                {
                    SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rb.Open("SELECT * FROM " + db1 + "Shipment_head WHERE id='" + Request.QueryString["id"] + "'  ");
                    //Response.Write(rb.SQL+"<br/>");
                    while (!rb.EOF)
                    {
                        rb["STATUS"] = "Y";
                        //rb["ADD_USER"] = this.CurrentUser.ID.ToString();

                        rb.Update();
                        rb.MoveNext();

                    }
                    rb.Close();

                    managerlevel aa = new managerlevel(); //引用managerlevel class
                    ArrayList all = new ArrayList();  //all arraylist
                    ArrayList managerid = new ArrayList();  //主管id arraylist
                    ArrayList managerlv = new ArrayList();  //主管階級 arraylist
                    ArrayList managernm = new ArrayList();  //主管職稱 arraylist

                    this.InputButton2.Enabled = false;
                    this.BUTTON_save.Enabled = false;

                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                    ArrayList NPIEngineer = new ArrayList();
                    #region 第一個節點,NPIEngineer多人
                    if (this.FIELD_osend1.Text.ToString().Length > 0)
                    {

                        if (this.FIELD_osend1.Text.ToString().Length > 0) NPIEngineer.Add(this.FIELD_osend1.Text);
                        if (this.FIELD_osend2.Text.ToString().Length > 0) NPIEngineer.Add(this.FIELD_osend2.Text);
                        if (this.FIELD_osend3.Text.ToString().Length > 0) NPIEngineer.Add(this.FIELD_osend3.Text);
                        if (this.FIELD_osend4.Text.ToString().Length > 0) NPIEngineer.Add(this.FIELD_osend4.Text);
                        if (this.FIELD_osend5.Text.ToString().Length > 0) NPIEngineer.Add(this.FIELD_osend5.Text);
                        string npia = "";
                        string npib = "";


                        for (int i = 0; i < NPIEngineer.Count; i++)
                        {
                            for (int j = i + 1; j < NPIEngineer.Count; j++)  //歷遍arraylist並刪除重覆
                            {
                                if (NPIEngineer[i].Equals(NPIEngineer[j]))
                                {
                                    NPIEngineer.RemoveAt(j);
                                    j--;
                                }
                            }
                            npia = npia + NPIEngineer[i] + "@";
                            npib = npib + "NPI Engineer" + "@";
                        }

                        managerid.Add(npia);
                        managernm.Add(npib);

                    }
                    #endregion
                    //2016/1/24 add by rage 增加各NPI的leader 簽核
                    //rs.Open("SELECT dep_name,pid  FROM " + db2 + "erp_flow where  erp_name='shipment' and dep_name in ('NPI Assistant','NPI Leader','QA Leader')  order by no");
                    rs.Open("SELECT dep_name,pid  FROM " + db2 + "erp_flow where  erp_name='shipment' and dep_name in ('NPI Assistant','QA Leader')  order by no");

                    while (!rs.EOF)
                    {

                        managerid.Add(rs["pid"].ToString().Trim());
                        managernm.Add(rs["dep_name"].ToString().Trim());
                        rs.MoveNext();
                    }
                    rs.Close();
                    //如果沒有選取工程師的話就是自動選取key單的工程師
                    string Npi_engneer = "";
                    if (NPIEngineer.Count == 0)
                    {

                        string commandnpiengneer = "SELECT  a.Add_user " +
                                                   " FROM  eipb.dbo.Shipment_head AS a LEFT OUTER JOIN " +
                                                   "  eipa.dbo.dguser AS b ON a.add_user = b.id " +
                                                   " WHERE (a.id = '" + Request.QueryString["id"].ToString() + "')";
                        Npi_engneer = rs.ExecuteScalar(commandnpiengneer).ToString();
                        rs.Close();
                    }
                    else
                        Npi_engneer = NPIEngineer[0].ToString();
                    //2016/1/24 add by rage 增加各NPI的leader 簽核
                    //2016/2/16 modify by rage 取兩個NPI Leader
                    //2016/4/27 modify by rage 拿掉David Wu的簽核流程
                    rs.Open("SELECT DEP_OWNER , GID , DEP_NAME , GL.LEVEL_SHORT " +
                            "  FROM EIPB.DBO.DG_GROUP_LEVEL GL  " +
                            " WHERE GL.GID IN (  " +
                            "    SELECT gid   " +
                            "      FROM dguser U  " +
                            "     WHERE U.id = '" + Npi_engneer + "')  " +
                            //"   AND GL.LEVEL_SHORT < 9 " + V1.01 David Wu 的級別在 9
                            "AND GL.LEVEL_SHORT <=9 " +
                            " ORDER BY SEQ");

                    int npileader_count = 1;

                    //2016/3/24 add by rage 在john那一組要多加brain簽核

                    /* V1.01
                     * 2018/0126 Carol
                    while (!rs.EOF)
                    {
                        if (rs["DEP_NAME"].ToString().ToUpper().Contains("開發一部(蔣)"))
                        {
                            managerid.Add("85A9F92B-D9B2-4D16-96D6-BD623D673246");
                            managernm.Add("NPI Leader");
                        }
                        rs.MoveNext();
                    }
                    rs.MoveFirst();
                        */

                    while (!rs.EOF)
                    {
                        //9C0F5A95-484A-4BE9-92AB-2ED1ECFA8924  蔣有為 目前都不簽 2018/04/09 by  Carol
                        string Leader = rs["DEP_OWNER"].ToString().ToUpper();
                        if (Leader != "9C0F5A95-484A-4BE9-92AB-2ED1ECFA8924")
                        {
                            managerid.Add(Leader);
                            managernm.Add("NPI Leader" + npileader_count.ToString());

                            npileader_count++;
                        }
                        rs.MoveNext();
                    }

                    rs.Close();



                    //sharflow12_3.Flowwork.sharflow12_31 flow = new sharflow12_3.Flowwork.sharflow12_31();
                    sharflow12_2.Flowwork.sharflow12_21 flow = new sharflow12_2.Flowwork.sharflow12_21();
                    //sharflow12.Flowwork.sharflow121 flow = new sharflow12.Flowwork.sharflow121();
                    FlowClient1.Text = "NPI送樣流程";  //更改流程名稱
                    switch (managerid.Count)  //依舊arraylist裡面有幾個,來判斷走那條flow
                    {

                        case 1:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 2:
                            e.NextNode = flow.sharflow12_2Node2;
                            break;

                        case 3:
                            e.NextNode = flow.sharflow12_2Node4;
                            break;

                        case 4:
                            e.NextNode = flow.sharflow12_2Node7;
                            break;

                        case 5:
                            e.NextNode = flow.sharflow12_2Node11;
                            break;

                        case 6:
                            e.NextNode = flow.sharflow12_2Node16;
                            break;

                        case 7:
                            e.NextNode = flow.sharflow12_2Node22;
                            break;

                        case 8:
                            e.NextNode = flow.sharflow12_2Node29;
                            break;

                        case 9:
                            e.NextNode = flow.sharflow12_2Node37;
                            break;

                        case 10:
                            e.NextNode = flow.sharflow12_2Node46;
                            break;

                        case 11:
                            e.NextNode = flow.sharflow12_2Node56;
                            break;

                        case 12:
                            e.NextNode = flow.sharflow12_2Node67;
                            break;
                    }
                    e.NextNode.ReviewerURL = "/Shipment/ShipmentView.aspx";

                    int count = 0;
                    foreach (string i in managerid)  //將簽核人員id塞進flow
                    {
                        this.FlowClient1.AddParameter("USER" + count.ToString(), i);
                        //Response.Write("USER" + count.ToString() + ")" + i + "<br>");
                        count++;
                    }

                    count = 0;

                    foreach (string i in managernm)  //將簽核人員職稱塞進flow
                    {
                        this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
                        //Response.Write("USERTITLE" + count.TocString() + ")" + i + "<br>");
                        count++;
                    }

                    #region 寄mail(審核人及代理人)
                    if (this.FIELD_osend1.Text.ToString().Length > 0)
                    {
                        rs.Open("select a.name aname,a.email aemail,b.name bname,b.email bemail, " +
                               "c.name cname,c.email cemail,d.name dname ,d.email demail,e.name ename,e.email eemail " +
                               "from " + db1 + "Shipment_NPIEngineer " +
                               "left join " + db2 + "dguser a on npi_engineer1=a.id " +
                               "left join " + db2 + "dguser b on npi_engineer2=b.id " +
                               "left join " + db2 + "dguser c on npi_engineer3=c.id " +
                               "left join " + db2 + "dguser d on npi_engineer4=d.id " +
                               "left join " + db2 + "dguser e on npi_engineer5=e.id " +
                               " WHERE aid='" + Request.QueryString["id"] + "' ");
                        if (!rs.EOF)
                        {
                            ShrFlowMail Backsend = new ShrFlowMail();
                            if (rs["aemail"].ToString().Length > 0) { Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, this.no.Text, rs["aname"].ToString(), rs["aemail"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + ""); Dguserdeputy(this.FIELD_osend1.Text); }
                            if (rs["bemail"].ToString().Length > 0) { Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, this.no.Text, rs["bname"].ToString(), rs["bemail"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + ""); Dguserdeputy(this.FIELD_osend2.Text); }
                            if (rs["cemail"].ToString().Length > 0) { Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, this.no.Text, rs["cname"].ToString(), rs["cemail"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + ""); Dguserdeputy(this.FIELD_osend3.Text); }
                            if (rs["demail"].ToString().Length > 0) { Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, this.no.Text, rs["dname"].ToString(), rs["demail"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + ""); Dguserdeputy(this.FIELD_osend4.Text); }
                            if (rs["eemail"].ToString().Length > 0) { Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, this.no.Text, rs["ename"].ToString(), rs["eemail"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + ""); Dguserdeputy(this.FIELD_osend5.Text); }
                        }
                    }
                    else
                    {


                        ShrFlowMail Backsend = new ShrFlowMail();
                        rs.Open("select name,email,pid from " + db2 + "ERP_FLOW a left join " + db2 + "dguser on PID=id where ERP_NAME='shipment' and DEP_NAME='NPI Assistant' ");
                        if (!rs.EOF)
                        {
                            Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, this.no.Text, rs["name"].ToString(), rs["email"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + ""); Dguserdeputy(rs["pid"].ToString());
                        }


                    }
                    #endregion

                    this.Button_UpdateItem.Visible = false;
                    this.Button_AddItem.Visible = false;
                    this.InputButton1.Enabled = true;
                    this.InputFile1.Visible = false;
                    gridviewchange(Request.QueryString["id"]);
                }
                else
                {

                    Response.Write("<script language='JavaScript'>window.alert('請輸入單身資料！');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + "<br/>" + ex.StackTrace);
            }
        }
        protected void BUTTON_StopRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rb.Open("SELECT * FROM " + db1 + "Shipment_head WHERE id='" + Request.QueryString["id"] + "'  ");
            while (!rb.EOF)
            {
                rb["STATUS"] = "N";

                rb.Update();
                rb.MoveNext();

            }
            rb.Close();

            this.Button_UpdateItem.Visible = true;
            this.Button_AddItem.Visible = true;
            this.InputButton2.Enabled = true;
            this.InputButton1.Enabled = false;
            this.BUTTON_save.Enabled = true;
            this.InputFile1.Visible = true;
            gridviewchange(Request.QueryString["id"]);
        }
        protected void InputButton2_Click(object sender, EventArgs e)
        {
            SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rb.Open("SELECT * FROM " + db1 + "Shipment_head WHERE id='" + Request.QueryString["id"] + "'  ");
            while (!rb.EOF)
            {
                rb["STATUS"] = "V";

                rb.Update();
                rb.MoveNext();

            }
            rb.Close();

            Response.Redirect("Shipment.aspx");
        }
        protected void InputButton1_Click(object sender, EventArgs e)
        {
            ShrFlowMail Backsend = new ShrFlowMail();
            SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rss.Open("select a.*, b.id bid,b.name name, b.email email,c.no no from " + db2 + "dgflowqueue a left join " + db2 + "dguser b on a.revieweruid = b.id " +
                    "left join " + db1 + "shipment_head c on c.id= '" + Request.QueryString["id"] + "' " +
                    "where requesturl like '%" + Request.QueryString["id"] + "' and revieweruid <> " +
                    "'" + System.Guid.Empty.ToString() + "' and reviewdate is null ");
            while (!rss.EOF)
            {

                //Response.Write(rss["name"].ToString()+rss["email"].ToString());
                Backsend.RemindApprove("{ca9348c8-504a-4454-9acc-18c03cfc8189}", this.no.Text, rss["name"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], rss["email"].ToString(), ":NPI送樣", "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + "", "員工入口網站");
                Dguserdeputy2(rss["bid"].ToString());
                rss.MoveNext();
            }
            rss.Close();


        }

        void Dguserdeputy(string userid)  //代理人寄信
        {
            ShrFlowMail Backsend = new ShrFlowMail();

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs.Open(" SELECT b.name name,email FROM " + db2 + "dguserdeputy a left join " + db2 + "dguser b on a.deputyuid=b.id left join " + db2 + "dgflow c on a.sid=c.id  " +
                     " where  a.uid='" + userid + "'  " +
                     " and  " +
                     " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                     " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate is null) or " +  //sharflow12_21 一般流程
                     " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate > GETDATE()) or " +
                     "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");
            while (!rs.EOF)
            {

                Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, this.no.Text, rs["name"].ToString(), rs["email"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + "");
                rs.MoveNext();

            }
            rs.Close();

        }

        void Dguserdeputy2(string userid)  //代理人催審
        {
            ShrFlowMail Backsend = new ShrFlowMail();

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs.Open(" SELECT b.name name,email FROM " + db2 + "dguserdeputy a left join " + db2 + "dguser b on a.deputyuid=b.id left join " + db2 + "dgflow c on a.sid=c.id  " +
                     " where  a.uid='" + userid + "'  " +
                     " and  " +
                     " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                     " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate is null) or " +  //sharflow12_21 一般流程
                     " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate > GETDATE()) or " +
                     "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");
            while (!rs.EOF)
            {

                Backsend.RemindApprove("{ca9348c8-504a-4454-9acc-18c03cfc8189}", this.no.Text, rs["name"].ToString(), "http://eip.minaik.com.tw/Shipment/Shipmentview.aspx?id=" + Request.QueryString["id"], rs["email"].ToString(), ":NPI送樣", "--Customer:" + this.FIELD_Customer.Text + "<BR>--Customer PO:" + this.FIELD_PO.Text + "", "員工入口網站");
                rs.MoveNext();

            }
            rs.Close();

        }

        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            try
            {
                //Label label;
                //object obj = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
                //label = (Label)obj;
                //label.Text = e["Flow_Comment"].ToString();

                SmoothEnterprise.Web.UI.HTMLControl.InputText it2;
                object obj2 = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
                it2 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj2;
                it2.Enabled = true;
                it2.ReadOnly = true;
                it2.Text = (string)e["Flow_Comment"];
            }
            catch { }

            //電子簽章呈現-----------------------------------------------------------------------------------------
            System.Web.UI.WebControls.Image sin1;
            object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
            sin1 = (System.Web.UI.WebControls.Image)obj5;
            //Response.Write((string)e["InputText3"] + "--");
            sin1.ImageUrl = "~/image/" + (string)e["InputText3"] + ".JPG";
        }

        void gridviewchange(string aa)
        {

            string sql = "select aid, '' ERP_PO, item, Component, DWG, Partno, Material, Material2,Material3,  " +
                    "Shipment_type, LV, HV, Qty, CONVERT(char, C_demand, 111) AS C_demand, " +
                    "CONVERT(char, C_demand2, 111) AS C_demand2, CONVERT(char, ETD, 111) AS ETD, " +
                    "Potential_P, Paper, Packing, B_no, Shipment_status,lab_no,engineeringtest_no,c.id cid,purpose2 , labsn,wear.rowno wear_rowno , Explanation ,a.remark from " +
                     " eipb.dbo.shipment_body  a left join (select no from eipA.dbo.Experiment_head_file where no <>''   and papstatus <> 'V' group by no ) b on a.lab_no=b.no " +
                     "left join eipa.dbo.engineeringtest_head c on a.engineeringtest_no=c.no left outer join eipb.dbo.LAP_Wear_test wear on a.labsn = wear.sn " +
                     "where aid='" + Request.QueryString["id"] + "'  ";


            using (SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                ds.SQL = sql;
                ds.Open();

                GridView1.DataSource = ds.GetDataTable;
                this.GridView1.DataBind();

            }

        }

        public void GetBoxNumbers(TableCell cell, string numbers) //lab_no傳參數
        {

           if (!string.IsNullOrEmpty(numbers))
            {
                Table tb = new Table();
                 
                tb.Font.Size = 11;
                TableRow tr;
                int i = 1;
                SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rsb.Open("SELECT rowid ,SamDescription FROM  eipA.dbo.Experiment_head_file WHERE no='" + numbers + "' ");
                System.Diagnostics.Debug.WriteLine(rsb.SQL); 

                    while (!rsb.EOF)
                    {
                        tr = new TableRow();
                        TableCell td = new TableCell();
                      
                        LinkButton lb = new LinkButton();
                        
                        lb.Attributes.Add("seq", i.ToString());

                        lb.Text = numbers;

                        string url = string.Format("/experiment/StaExperimentShow.aspx?rowid={0}", rsb["rowid"]);
                        lb.Attributes.Add("href", url);
                        lb.Attributes.Add("target", "_blank");

                        td.Controls.Add(lb);
                        tr.Cells.Add(td);
                        tb.Rows.Add(tr);
                        
                        i++;
                        rsb.MoveNext(); 
                    }
                     
                cell.Controls.Add(tb);
                cell.Attributes.Add("id", numbers);
            } 
        }


        protected void btn_test_Click(object sender, EventArgs e)
        {
            try
            {
                DBTransfer tf = new DBTransfer();
                SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rsb.Open("SELECT *  FROM " + db1 + "shipment_body  WHERE aid='" + Request.QueryString["id"] + "' ");
                //Response.Write(rsb.SQL+"<br/>");
                if (!rsb.EOF)
                {
                    SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rb.Open("SELECT * FROM " + db1 + "Shipment_head WHERE id='" + Request.QueryString["id"] + "'  ");
                    //Response.Write(rb.SQL+"<br/>");
                    while (!rb.EOF)
                    {
                        rb["STATUS"] = "N";
                        // rb["ADD_USER"] = this.CurrentUser.ID.ToString();

                        rb.Update();
                        rb.MoveNext();

                    }
                    rb.Close();

                    managerlevel aa = new managerlevel(); //引用managerlevel class
                    ArrayList all = new ArrayList();  //all arraylist
                    ArrayList managerid = new ArrayList();  //主管id arraylist
                    ArrayList managerlv = new ArrayList();  //主管階級 arraylist
                    ArrayList managernm = new ArrayList();  //主管職稱 arraylist

                    this.InputButton2.Enabled = false;
                    this.BUTTON_save.Enabled = false;

                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                    ArrayList NPIEngineer = new ArrayList();
                    #region 第一個節點,NPIEngineer多人
                    if (this.FIELD_osend1.Text.ToString().Length > 0)
                    {

                        if (this.FIELD_osend1.Text.ToString().Length > 0) NPIEngineer.Add(this.FIELD_osend1.Text);
                        if (this.FIELD_osend2.Text.ToString().Length > 0) NPIEngineer.Add(this.FIELD_osend2.Text);
                        if (this.FIELD_osend3.Text.ToString().Length > 0) NPIEngineer.Add(this.FIELD_osend3.Text);
                        if (this.FIELD_osend4.Text.ToString().Length > 0) NPIEngineer.Add(this.FIELD_osend4.Text);
                        if (this.FIELD_osend5.Text.ToString().Length > 0) NPIEngineer.Add(this.FIELD_osend5.Text);
                        string npia = "";
                        string npib = "";


                        for (int i = 0; i < NPIEngineer.Count; i++)
                        {
                            for (int j = i + 1; j < NPIEngineer.Count; j++)  //歷遍arraylist並刪除重覆
                            {
                                if (NPIEngineer[i].Equals(NPIEngineer[j]))
                                {
                                    NPIEngineer.RemoveAt(j);
                                    j--;
                                }
                            }
                            npia = npia + NPIEngineer[i] + "@";
                            npib = npib + "NPI Engineer" + "@";
                        }

                        managerid.Add(npia);
                        managernm.Add(npib);

                        string name = tf.GetTopfile("select name from eipa.dbo.dguser where id='" + npia + "' ");

                        Utility.log("1", name, npib);


                    }
                    #endregion
                    //2016/1/24 add by rage 增加各NPI的leader 簽核
                    //rs.Open("SELECT dep_name,pid  FROM " + db2 + "erp_flow where  erp_name='shipment' and dep_name in ('NPI Assistant','NPI Leader','QA Leader')  order by no");
                    rs.Open("SELECT dep_name,pid  FROM " + db2 + "erp_flow where  erp_name='shipment' and dep_name in ('NPI Assistant','QA Leader')  order by no");

                    while (!rs.EOF)
                    {

                        managerid.Add(rs["pid"].ToString().Trim());
                        managernm.Add(rs["dep_name"].ToString().Trim());

                        string name = tf.GetTopfile("select name from eipa.dbo.dguser where id='" + rs["pid"].ToString().Trim() + "' ");

                        Utility.log("2", name, rs["dep_name"].ToString().Trim());
                        rs.MoveNext();
                    }
                    rs.Close();
                    //如果沒有選取工程師的話就是自動選取key單的工程師
                    string Npi_engneer = "";
                    if (NPIEngineer.Count == 0)
                    {

                        string commandnpiengneer = "SELECT  a.Add_user " +
                                                   " FROM  eipb.dbo.Shipment_head AS a LEFT OUTER JOIN " +
                                                   "  eipa.dbo.dguser AS b ON a.add_user = b.id " +
                                                   " WHERE (a.id = '" + Request.QueryString["id"].ToString() + "')";
                        Npi_engneer = rs.ExecuteScalar(commandnpiengneer).ToString();
                        rs.Close();
                    }
                    else
                        Npi_engneer = NPIEngineer[0].ToString();
                    //2016/1/24 add by rage 增加各NPI的leader 簽核
                    //2016/2/16 modify by rage 取兩個NPI Leader
                    //2016/4/27 modify by rage 拿掉David Wu的簽核流程
                    rs.Open("SELECT DEP_OWNER , GID , DEP_NAME , GL.LEVEL_SHORT " +
                            "  FROM EIPB.DBO.DG_GROUP_LEVEL GL  " +
                            " WHERE GL.GID IN (  " +
                            "    SELECT gid   " +
                            "      FROM dguser U  " +
                            "     WHERE U.id = '" + Npi_engneer + "')  " +
                            //"   AND GL.LEVEL_SHORT < 9 " + V1.01 David Wu 的級別在 9
                            "AND GL.LEVEL_SHORT <=9 " +
                            " ORDER BY SEQ");

                    Utility.log(rs.SQL);

                    int npileader_count = 1;

                    //2016/3/24 add by rage 在john那一組要多加brain簽核

                    /* V1.01
                     * 2018/0126 Carol
                    while (!rs.EOF)
                    {
                        if (rs["DEP_NAME"].ToString().ToUpper().Contains("開發一部(蔣)"))
                        {
                            managerid.Add("85A9F92B-D9B2-4D16-96D6-BD623D673246");
                            managernm.Add("NPI Leader");
                        }
                        rs.MoveNext();
                    }
                    rs.MoveFirst();
                        */

                    while (!rs.EOF)
                    {
                        //9C0F5A95-484A-4BE9-92AB-2ED1ECFA8924  蔣有為 目前都不簽 2018/04/09 by  Carol
                        string Leader = rs["DEP_OWNER"].ToString().ToUpper();
                        if (Leader != "9C0F5A95-484A-4BE9-92AB-2ED1ECFA8924")
                        {

                            managerid.Add(Leader);
                            managernm.Add("NPI Leader" + npileader_count.ToString());


                            string name = tf.GetTopfile("select name from eipa.dbo.dguser where id='" + Leader + "' ");

                            Utility.log("3", name, "NPI Leader" + npileader_count.ToString());
                            npileader_count++;
                        }
                        rs.MoveNext();
                    }

                    rs.Close();


                    int count = 0;
                    foreach (string i in managerid)  //將簽核人員id塞進flow
                    {
                        string uid = managerid[count].ToString();
                        string title = managernm[count].ToString();


                        count++;
                    }


                }
                else
                {

                    Response.Write("<script language='JavaScript'>window.alert('請輸入單身資料！');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + "<br/>" + ex.StackTrace);
            }
        }


        //v1.03 在update_item  時有日期才檢查
        //ETD 在新增時，需相同，並大於今日 //add by carol 20180626
        public bool chk_ETD()
        {
            bool isPass = true;
            string etd1 = string.IsNullOrEmpty(this.FIELD_C_demand.Text) ? "" : DateTime.ParseExact(this.FIELD_C_demand.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces).ToShortDateString();
            string etd2 = string.IsNullOrEmpty(this.FIELD_C_demand2.Text) ? "" : DateTime.ParseExact(this.FIELD_C_demand2.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces).ToShortDateString();

            if (etd1 != etd2)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('MA commitment date(ETD)　and　MA commitment date revise(ETD)  are same necessary ');", true);
                isPass = false;
            }
            else
            {
                if (!string.IsNullOrEmpty(etd1))
                {
                    long etd_dt = DateTime.Parse(etd1).Ticks;
                    long curr = DateTime.Now.Ticks;

                    int d = new TimeSpan(etd_dt - curr).Days;

                    //大於今天
                    if (d >= 0)
                    {
                        isPass = true;
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('MA commitment date(ETD)  must be greater than today');", true);
                        isPass = false;
                    }
                }
            }
            return isPass;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
 
        }
    }
}