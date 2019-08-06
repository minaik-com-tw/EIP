/*
 * 2016/3/10 新增labsn 
 */
using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipment
{
    public partial class ShipmentAdd : SmoothEnterprise.Web.Page
    {
        private string db1 = ""; //db主位置 
        private string db2 = ""; //db副位置
        private string db3 = ""; //db副2位置
        public long elapsedTicks;  //尚未轉成正式區的單身唯一值
        private DateTime currentDate;   // DateTime.Now;
        public string copya = "";  //0為正常新增 1為變更單 2為copy單據 
        public string user_who = "";//判斷user是誰,1是業務,2是工程師
        public string jump_check = ""; //判斷是否有error
        public string dep = "";



        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
            {
                db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
                db3 = "[barcode].[dbo]."; //如果不是在Ann本機, 則指定資料庫 

            }


            this.add_user.Text = this.CurrentUser.Name.ToString();


            SmoothEnterprise.Database.DataSet plant = new SmoothEnterprise.Database.DataSet();
            plant.Open("SELECT a.comid comid,b.name groupname from " + db2 + "dguser a left join " + db2 + "dggroup b on a.gid=b.id where a.id='" + this.CurrentUser.ID.ToString() + "' ");
            if (!plant.EOF)
            {
                this.Plant.Text = plant["comid"].ToString();  //取得使用者的廠區
                dep = plant["groupname"].ToString();


            }

            //20180523 carol 換到html  使用
            //BUTTON_save.Attributes.Add("OnClick", "return   h1('" + dep.ToString() + "')"); //如前端javascript檢查有問題,禁止提交頁面//單頭的
            //Button_AddItem.Attributes.Add("OnClick", "return   j1()"); //如前端javascript檢查有問題,禁止提交頁面//單身的
            //Button_UpdateItem.Attributes.Add("OnClick", "return   j1()");


            Page.Title = "NPI送樣流程-新增";
            if (!IsPostBack)
            {
                this.FIELD_Packing.Text = "QTY:" + Environment.NewLine + "NW/GW:" + Environment.NewLine + "CARTON QTY:" + Environment.NewLine + "VIA:" + Environment.NewLine + "Attn to:";

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                //取出 Customer
                this.FIELD_Customer.Items.Add(new ListItem("", ""));
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




                currentDate = DateTime.Now;
                elapsedTicks = currentDate.Ticks;
                this.PK1.Value = elapsedTicks.ToString();
                this.FIELD_Add_date.Text = currentDate.ToString();  //今天日期
                this.ver.Text = "1"; //預設

                gridviewchange(elapsedTicks.ToString());
                #region  變更單據copya=1 複製單據copya=2



                copya = Request.QueryString["copya"].ToString();

                if (copya.ToString() != "0")
                {
                    try
                    {

                        rs.Open(" select max(cast( VER   as   int)) ver,no,customer,c_po,loc,erp_po,erp_item,plant " +
                               "   from " + db1 + "shipment_head a where no=(SELECT no FROM " + db1 + "shipment_head where id='" + Request.QueryString["id"] + "' )  " +
                               "   group by no,customer,c_po,loc,erp_po,erp_item,plant");
                        if (!rs.EOF)
                        {

                            int vera;
                            if (Request.QueryString["copya"].ToString() == "1")
                            {

                                vera = int.Parse(rs["ver"].ToString()) + 1;
                                this.no.Text = rs["no"].ToString();
                                this.ver.Text = vera.ToString();
                                Label32.ForeColor = Color.Gray;
                                Label44.ForeColor = Color.Gray;
                                FIELD_C_demand.BackColor = Color.White;
                                // FIELD_C_demand.Enabled = false;
                                Label21.ForeColor = Color.White;
                                Label22.ForeColor = Color.Red;
                                this.FIELD_ERP_PO.Enabled = false;
                                this.Button_ERPPO.Enabled = false;
                                this.Button_New.Enabled = false;
                                this.FIELD_ERPITEM.Enabled = false;
                            }
                            else
                            {
                                div4.Style.Add("display", "none");


                            }


                            this.FIELD_Customer.Items.Add(new ListItem(rs["Customer"].ToString(), rs["Customer"].ToString()));
                            this.FIELD_Customer.SelectedValue = rs["Customer"].ToString();
                            this.FIELD_Customer.Text = rs["Customer"].ToString();
                            this.FIELD_PO.Text = rs["C_PO"].ToString();
                            //this.FIELD_Purpose.Text = rs["Purpose"].ToString();
                            this.FIELD_loc.Text = rs["loc"].ToString();
                            this.FIELD_ERP_PO.Text = rs["ERP_PO"].ToString();
                            this.FIELD_ERPITEM.Text = rs["erp_item"].ToString();
                            this.Plant.Text = rs["plant"].ToString();


                        }

                        rs.Close();

                        //單身copy,將shipment_body複製到shipment_body_temp

                        SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet();
                        rss.ExecuteNonQuery("delete  from " + db1 + "shipment_body_temp where elapsedTicks='" + elapsedTicks.ToString() + "' ");  //刪除暫存的


                        if (Request.QueryString["copya"].ToString() == "1")  //變更單據要lab_no,enginner_no
                        {
                            rss.ExecuteNonQuery("INSERT INTO " + db1 + "shipment_body_temp (elapsedTicks, item, Component, DWG, Partno, Material, Material2, Material3,  Shipment_type, LV, HV, Qty, C_demand, " +
                                                "C_demand2,  Potential_P, Paper, Packing,purpose2,lab_no,EngineeringTest_No,B_no,Shipment_status,ETD,labsn , Explanation) " +
                                                "SELECT '" + elapsedTicks.ToString() + "', item, Component, DWG, Partno, Material,Material2, Material3,  Shipment_type, LV, HV, Qty, C_demand, " +
                                                "C_demand2,  Potential_P, Paper, Packing,purpose2,lab_no,EngineeringTest_No,B_no,Shipment_status,ETD,labsn , Explanation " +
                                                "FROM " + db1 + "Shipment_body " +
                                                "WHERE aid='" + Request.QueryString["id"] + "' ");
                            //Response.Write("INSERT INTO " + db1 + "shipment_body_temp (elapsedTicks, item, Component, DWG, Partno, Material, Material2, Material3,  Shipment_type, LV, HV, Qty, C_demand, " +
                            //                    "C_demand2,  Potential_P, Paper, Packing,purpose2,lab_no,EngineeringTest_No,B_no,Shipment_status,ETD) " +
                            //                    "SELECT '" + elapsedTicks.ToString() + "', item, Component, DWG, Partno, Material,Material2, Material3,  Shipment_type, LV, HV, Qty, C_demand, " +
                            //                    "C_demand2,  Potential_P, Paper, Packing,purpose2,lab_no,EngineeringTest_No,B_no,Shipment_status,ETD " +
                            //                    "FROM " + db1 + "Shipment_body " +
                            //                    "WHERE aid='" + Request.QueryString["id"] + "' ");


                        }
                        else
                        {
                            rss.ExecuteNonQuery("INSERT INTO " + db1 + "shipment_body_temp (elapsedTicks, item, Component, DWG, Partno, Material, Material2, Material3,  Shipment_type, LV, HV, Qty, C_demand, " +
                                                 "C_demand2,  Potential_P, Paper, Packing,purpose2,labsn , Explanation ) " +
                                                 "SELECT '" + elapsedTicks.ToString() + "', item, Component, DWG, Partno, Material,Material2, Material3,  Shipment_type, LV, HV, Qty, C_demand, " +
                                                 "C_demand2,  Potential_P, Paper, Packing,purpose2,labsn, Explanation " +
                                                 "FROM " + db1 + "Shipment_body " +
                                                 "WHERE aid='" + Request.QueryString["id"] + "' ");


                        }





                        //將shipment_paper複製到shipment_paper_temp
                        rss.ExecuteNonQuery("INSERT INTO " + db1 + "shipment_paper_temp (elapsedTicks,item,shipment_paper_id) select '" + elapsedTicks.ToString() + "', item,shipment_paper_id from " + db1 + "shipment_paper WHERE aid='" + Request.QueryString["id"] + "' ");


                        gridviewchange(elapsedTicks.ToString());

                        rs.Open("SELECT * FROM " + db1 + "Shipment_NPIEngineer WHERE aid='" + Request.QueryString["id"] + "' ");
                        if (!rs.EOF)
                        {
                            if (rs["NPI_Engineer1"].ToString().Length > 0) this.FIELD_osend1.Text = rs["NPI_Engineer1"].ToString();
                            if (rs["NPI_Engineer2"].ToString().Length > 0) { this.FIELD_osend2.Text = rs["NPI_Engineer2"].ToString(); this.FIELD_osend2.Visible = true; }
                            if (rs["NPI_Engineer3"].ToString().Length > 0) { this.FIELD_osend3.Text = rs["NPI_Engineer3"].ToString(); this.FIELD_osend3.Visible = true; }
                            if (rs["NPI_Engineer4"].ToString().Length > 0) { this.FIELD_osend4.Text = rs["NPI_Engineer4"].ToString(); this.FIELD_osend4.Visible = true; }
                            if (rs["NPI_Engineer5"].ToString().Length > 0) { this.FIELD_osend5.Text = rs["NPI_Engineer5"].ToString(); this.FIELD_osend5.Visible = true; }
                        }

                        rs.Close();
                    }
                    catch
                    {

                        Response.Redirect("Shipment.aspx");
                    }

                }
                else
                {
                    div1.Style.Add("display", "none");
                    div2.Style.Add("display", "none");
                    div3.Style.Add("display", "none");
                    div4.Style.Add("display", "none");




                }

                #endregion



            }




        }

        //新增上傳barcode
        protected void Button1_Click(object sender, EventArgs e)
        {
            string FileList = "";
            for (int x = 0; x < this.CheckBoxFile1.Items.Count; x++)
            {
                if (CheckBoxFile1.Items[x].Selected == true)
                {
                    if (FileList == "")
                        FileList = "'" + CheckBoxFile1.Items[x].Value + "'";
                    else
                        FileList = FileList + ",'" + CheckBoxFile1.Items[x].Value + "'";
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
            //String uPath = "D:/Upload/";
            int att_count = 0;

            //String fpath;
            //fpath = "";


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
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet();
                rs.ExecuteNonQuery("Delete FROM " + db1 + " shipment_File WHERE ID in (" + FileList + ")");
            }

            Response.Redirect("Shipmentview.aspx?id=" + Request.QueryString["id"] + "&other=1");
        }

        protected void BUTTON_save_Click(object sender, System.EventArgs e)
        {
            //Response.Write(FIELD_osend1.Text);
            //Response.Write(FIELD_osend2.Text);
            //Response.Write(Request.QueryString["copya"].ToString());
            try
            {
                string sql_select = "";
                if (Request.QueryString["copya"].ToString() == "1")
                {
                    sql_select = " and c_demand2 > convert(char(8), DATEADD(day, -1, getdate()), 112)";  //如果是版本變更, 只需要check c_demand2
                }
                else
                {
                    sql_select = " and c_demand > convert(char(8), DATEADD(day, -1, getdate()), 112) and c_demand2 > convert(char(8), DATEADD(day, -1, getdate()), 112)";
                }


                SmoothEnterprise.Database.DataSet rsb2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rsb2.Open("select b.name depname from " + db2 + "dguser a left join " + db2 + "dggroup b on a.gid=b.id where a.id='" + this.CurrentUser.ID.ToString() + "' ");

                if (!rsb2.EOF)
                {
                    if (rsb2["depname"].ToString().IndexOf("業務") > -1 && Request.QueryString["copya"].ToString() == "0")
                    {
                        //如果是業務打單不用check c_demand及c_demand2
                        SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rsb.Open("SELECT *  FROM " + db1 + "shipment_body_temp  WHERE elapsedticks='" + this.PK1.Value.ToString() + "'");
                        if (!rsb.EOF)
                        {

                        }
                        else
                        {

                            Response.Write("<script language='JavaScript'>window.alert('請輸入單身資料');</script>");
                            div1.Style.Add("display", "block");
                            div2.Style.Add("display", "block");
                            div3.Style.Add("display", "block");
                            jump_check = "1";

                        }
                    }
                    else
                    {
                        SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rsb.Open("SELECT *    FROM " + db1 + "shipment_body_temp  WHERE elapsedticks='" + this.PK1.Value.ToString() + "' " + sql_select.ToString() + " ");
                        if (!rsb.EOF)
                        {

                        }
                        else
                        {

                            //convert(char(8), DATEADD(day, -1, getdate()), 112)

                           DateTime dt =DateTime.Now.AddDays(-1); 
                            Response.Write("<script language='JavaScript'>window.alert('請輸入單身資料或確認MA commitment date(ETD)及MA commitment date revise (ETD)是否大於 " + dt.ToShortDateString() + "');</script>");
                            
                            div1.Style.Add("display", "block");
                            div2.Style.Add("display", "block");
                            div3.Style.Add("display", "block");
                            jump_check = "1";

                        }
                         

                    }

                }



                if (this.jump_check.ToString() != "1")
                {
                    string NO = "";

                    if (Request.QueryString["copya"].ToString() == "1")
                    {
                        NO = this.no.Text;
                    }
                    else
                    {
                        EIPSysSha UseSha = new EIPSysSha();
                        NO = UseSha.GetNewSn("N102", DateTime.Now.ToString("yyMM"));
                    }

                    //新增單頭
                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rs.Open("SELECT * FROM " + db1 + "Shipment_head WHERE 1=0");
                    rs.Add();
                     
                        rs["no"] = NO.ToString();
                        rs["ver"] = this.ver.Text;
                        if (this.FIELD_Customer.Text != "") rs["Customer"] = this.FIELD_Customer.Text;
                        if (this.FIELD_PO.Text != "") rs["C_PO"] = this.FIELD_PO.Text;
                        //if (this.FIELD_Purpose.Text != "") rs["Purpose"] = this.FIELD_Purpose.Text;
                        if (this.FIELD_loc.Text != "") rs["loc"] = this.FIELD_loc.Text;
                        if (this.FIELD_ERP_PO.Text != "") rs["ERP_PO"] = this.FIELD_ERP_PO.Text;
                        if (this.FIELD_ERPITEM.Text != "") rs["ERP_Item"] = this.FIELD_ERPITEM.Text;
                        rs["Add_user"] = this.CurrentUser.ID.ToString();
                        rs["Add_date"] = this.FIELD_Add_date.Text;
                        rs["Plant"] = this.Plant.Text;
                        if (this.FIELD_Sales.Text != "") rs["Sales"] = this.FIELD_Sales.Text;

                        rs["status"] = "N";

//                    Response.Write(NO.ToString()+"','"+ver.Text + "','" + this.FIELD_Customer.Text + "','" + this.FIELD_PO.Text + "','" + FIELD_loc.Text + "','" + this.FIELD_ERP_PO.Text + "','" + this.FIELD_ERPITEM.Text + "','" + this.CurrentUser.ID.ToString() + "','" + this.FIELD_Add_date.Text + "','" + this.Plant.Text + "','" + this.FIELD_Sales.Text);

                        rs.Update();
                        rs.Close();
                     

                    SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                    object objola = onum.ExecuteScalar("SELECT * from " + db1 + "Shipment_head where no='" + NO.ToString() + "' and ver='" + this.ver.Text + "' ");
                    string aid = objola.ToString();  //取得head的aid


                    //將shipment_body_temp加到shipment_body正式區
                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet();
                    rss.ExecuteNonQuery("INSERT INTO " + db1 + "shipment_body (no,ver,elapsedTicks,aid, item, Component, DWG, Partno, Material,Material2,Material3,  Shipment_type, LV, HV, Qty, C_demand, " +
                                     "C_demand2, ETD, Potential_P, Paper, Packing, B_no, Shipment_status,lab_no,engineeringtest_no,purpose2,labsn,Explanation) " +
                                     "SELECT '" + NO.ToString() + "' no,'" + this.ver.Text + "' ver,elapsedTicks,'" + aid.ToString() + "',  item, Component, DWG, Partno, Material,Material2, Material3, Shipment_type, LV, HV, Qty, C_demand, " +
                                     "C_demand2, ETD, Potential_P, Paper, Packing, B_no, Shipment_status,lab_no,engineeringtest_no,purpose2 ,labsn , Explanation " +
                                     "FROM " + db1 + "Shipment_body_temp " +
                                     "WHERE elapsedticks='" + this.PK1.Value.ToString() + "' ");

                    //Response.Write("INSERT INTO " + db1 + "shipment_body (no,ver,elapsedTicks,aid, item, Component, DWG, Partno, Material,Material2,Material3,  Shipment_type, LV, HV, Qty, C_demand, " +
                    //                 "C_demand2, ETD, Potential_P, Paper, Packing, B_no, Shipment_status,lab_no,engineeringtest_no,purpose2,labsn) " +
                    //                 "SELECT '" + NO.ToString() + "' no,'" + this.ver.Text + "' ver,elapsedTicks,'" + aid.ToString() + "',  item, Component, DWG, Partno, Material,Material2, Material3, Shipment_type, LV, HV, Qty, C_demand, " +
                    //                 "C_demand2, ETD, Potential_P, Paper, Packing, B_no, Shipment_status,lab_no,engineeringtest_no,purpose2 ,labsn" +
                    //                 "FROM " + db1 + "Shipment_body_temp " +
                    //                 "WHERE elapsedticks='" + this.PK1.Value.ToString() + "' ");


                    //將shipment_paptr_tem加到shipment_paper
                    rss.ExecuteNonQuery("INSERT INTO " + db1 + "shipment_paper (aid,item,shipment_paper_id) select '" + aid.ToString() + "' no, item,shipment_paper_id from " + db1 + "shipment_paper_temp WHERE elapsedticks='" + this.PK1.Value.ToString() + "' ");
                    //將NPI Engineer寫進資料庫

                    rs.Open("SELECT * FROM " + db1 + "Shipment_NPIEngineer WHERE 1=0");
                    rs.Add();
                    rs["aid"] = aid.ToString();
                    if (this.FIELD_osend1.Text != "") rs["NPI_Engineer1"] = this.FIELD_osend1.Text;
                    if (this.FIELD_osend2.Text != "") rs["NPI_Engineer2"] = this.FIELD_osend2.Text;
                    if (this.FIELD_osend3.Text != "") rs["NPI_Engineer3"] = this.FIELD_osend3.Text;
                    if (this.FIELD_osend4.Text != "") rs["NPI_Engineer4"] = this.FIELD_osend4.Text;
                    if (this.FIELD_osend5.Text != "") rs["NPI_Engineer5"] = this.FIELD_osend5.Text;


                    rs.Update();
                    rs.Close();





                    if (Request.QueryString["copya"].ToString() == "1")  //1為變更單, 變更需通知工程師
                    {
                        SmoothEnterprise.Database.DataSet plant = new SmoothEnterprise.Database.DataSet();
                        plant.Open("SELECT * from " + db1 + "shipment_head  where id='" + Request.QueryString["id"] + "' and add_user<>'" + this.CurrentUser.ID.ToString() + "' ");
                        if (!plant.EOF)
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
                                string change_npi = "";
                                if (rs["aemail"].ToString().Length > 0) change_npi = change_npi + rs["aemail"].ToString() + ",";
                                if (rs["bemail"].ToString().Length > 0) change_npi = change_npi + rs["bemail"].ToString() + ",";
                                if (rs["cemail"].ToString().Length > 0) change_npi = change_npi + rs["cemail"].ToString() + ",";
                                if (rs["demail"].ToString().Length > 0) change_npi = change_npi + rs["demail"].ToString() + ",";
                                if (rs["eemail"].ToString().Length > 0) change_npi = change_npi + rs["eemail"].ToString() + ",";

                                String ques;

                                MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                                MailAddress to = new MailAddress(change_npi.Substring(0, change_npi.Length - 1));

                                MailMessage message = new MailMessage(from, to);

                                ques = " 您好:" + "<br>" +
                                       "<br>" +
                                       "NPI送樣系統有一筆單據變更:" + "<br>" +
                                       "<br>" +
                                       "單號 : " + this.no.Text + " Ver : " + this.ver.Text + "<br>" +
                                       "申請內容 : " + "<a href=\"http://eip.minaik.com.tw/Shipment/Shipment_View.aspx?id=" + Request.QueryString["id"] + "\" >NPI送樣系統了解更多</a>" +
                                       "<br>" +
                                       "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                                       "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                                       "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                                message.Subject = "NPI送樣系統有一筆單據變更,單號:" + this.no.Text + " Ver:" + this.ver.Text;

                                message.IsBodyHtml = true;
                                message.Body = ques;

                                SmtpClient client = new SmtpClient("192.168.0.12");

                                client.Send(message);
                            }

                        }


                    }

                    //2016/4/18 新增上傳barcode file
                    string FileList = "";
                    for (int x = 0; x < this.CheckBoxFile1.Items.Count; x++)
                    {
                        if (CheckBoxFile1.Items[x].Selected == true)
                        {
                            if (FileList == "")
                                FileList = "'" + CheckBoxFile1.Items[x].Value + "'";
                            else
                                FileList = FileList + ",'" + CheckBoxFile1.Items[x].Value + "'";
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

                            rs2["FileKey"] = aid;
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

                    //2016/4/18 新增barcode file 上傳
                    /*
                    #region 動態新增
                    HttpFileCollection files = HttpContext.Current.Request.Files;
                    System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
                    //String uPath = "D:/Upload/";
                    int att_count = 0;

                    //String fpath;
                    //fpath = "";


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

                            rs2["UserType"] = "2";   //附檔為SE Approved Doc


                            rs2["FileKey"] = aid.ToString();
                            rs2["FileName"] = filename;
                            rs2["FileBody"] = fileBytes;
                            rs2["FileType"] = fileExt;
                            rs2.Update();
                        }
                        ifile++;
                    }
                    rs2.Close();

                    Response.Write(InputFile1.FileName.ToString());
                    #endregion
                    */
                    Response.Redirect("Shipmentedit.aspx?id=" + aid.ToString());
                }



            }
            catch (Exception ex)
            {
                this.AddError(this, "BUTTON_save_Click()", "", ex.Message+"<br>"+ex.StackTrace);
            }

        }

        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            this.GoBack();
        }
        protected void Button_ERPPO_Click(object sender, EventArgs e)
        {
            //為了測試
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet();
            rs.ExecuteNonQuery("delete  from " + db1 + "shipment_body_temp where erp_po='" + this.FIELD_ERP_PO.Text + "' ");





            //string sql = "select  distinct oea032,oea10,oao06, " +
            //          "                case when oea044 is null then occ241||occ242||occ243 " +
            //          "                     when oea044 ='MISC' then oap041||oap042||oap043 " +
            //          "                else ocd221||ocd222||ocd223 " +
            //          "                end loc  " +
            //          "      ,oeb01,oeb03,oeb04 ,ima02,ima021 ,oeb12     " +
            //          "   from minaik.oea_file " +
            //          "    left join minaik.oeb_file on oea01=oeb01 " +
            //          "    left join minaik.ima_file on oeb04=ima01 " +
            //          "    left join minaik.oao_file on oeb01=oao01 " +
            //          "    left join minaik.occ_file on oea04=occ01  " +
            //          "    left join minaik.oap_file on oea01=oap01 " +
            //          "    left join minaik.ocd_file on oea04=ocd01 and ocd02=oea044 " +
            //          "  where oea01 = '" + this.FIELD_ERP_PO.Text + "' and (oea01 like '112%' or oea01 like '117%' or oea01 like '111%' or oea01 like '114%' or oea01 like 'SMM%') " +
            //          "     and oao04='1' and oao05='2' and oao03='" + this.FIELD_ERPITEM.Text + "' and oeb03='" + this.FIELD_ERPITEM.Text + "'  ";

            string dba;
            if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
            {
                dba = "IP185";
            }
            else
            {

                dba = "[192.168.0.185]"; //如果不是在Ann本機, 則指定資料庫 
            }

            // 20121005 將occ243,oap043,ocd223 如有null轉成空值, 不然加總起來會出錯

            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            // " case when oea044 is null then occ241+occ242+ISNULL(occ243,'')   " + 2017/08/25 occ241+occ242+ISNULL(occ243,'')  empty so change occ231

            /* 2017/0915 del by carol
            string sql = "select  distinct oea032,oea10,oao06, " +
                 " case when oea044 is null then occ241+occ242+ISNULL(occ243,'')   " +
                 "     when oea044 ='MISC' then oap041+oap042+ISNULL(oap043,'')   " +
                 " else ocd221+ocd222+ISNULL(ocd223,'')  " +
                 " end loc   " +
                 " ,oeb01,oeb03,oeb04 ,ima02,ima021 ,oeb12      " +
                 " from " + dba + ".MINAIK.dbo.OEA_FILE  " +
                 " left join " + dba + ".MINAIK.dbo.OEB_FILE on oea01=oeb01  " +
                 " left join " + dba + ".MINAIK.dbo.IMA_FILE on oeb04=ima01  " +
                 " left join " + dba + ".MINAIK.dbo.OAO_FILE on oeb01=oao01  " +
                 " left join " + dba + ".MINAIK.dbo.OCC_FILE on oea04=occ01  " +
                 " left join " + dba + ".MINAIK.dbo.OAP_FILE on oea01=oap01  " +
                 " left join " + dba + ".MINAIK.dbo.OCD_FILE on oea04=ocd01 and ocd02=oea044  " +
                 " where oea01 = '" + this.FIELD_ERP_PO.Text + "' and (oea01 like '112%' or oea01 like '117%' or oea01 like '119%' or oea01 like '111%' or oea01 like '114%' or oea01 like 'SMM%' or oea01 like 'SMB%')  " +
                 " and oao04='1' and oao05='2' and oao03='" + this.FIELD_ERPITEM.Text + "' and oeb03='" + this.FIELD_ERPITEM.Text + "'";
                 */

            string sql = "select  distinct oea032,oea10,oao06, " +
            " case when oea044 is null then ISNULL(occ241,'')+ISNULL(occ242,'')+ISNULL(occ243,'') " +
            " when oea044 ='MISC' then ISNULL(oap041,'')+ISNULL(oap042,'')+ISNULL(oap043,'') " +
            " else ocd221+ocd222+ISNULL(ocd223,'')  " +
            " end loc   " +
            " ,oeb01,oeb03,oeb04 ,ima02,ima021 ,oeb12      " +
            " from " + dba + ".MINAIK.dbo.OEA_FILE  " +
            " left join " + dba + ".MINAIK.dbo.OEB_FILE on oea01=oeb01  " +
            " left join " + dba + ".MINAIK.dbo.IMA_FILE on oeb04=ima01  " +
            " left join " + dba + ".MINAIK.dbo.OAO_FILE on oeb01=oao01  " +
            " left join " + dba + ".MINAIK.dbo.OCC_FILE on oea04=occ01  " +
            " left join " + dba + ".MINAIK.dbo.OAP_FILE on oea01=oap01  " +
            " left join " + dba + ".MINAIK.dbo.OCD_FILE on oea04=ocd01 and ocd02=oea044  " +
            //" where oea01 = '" + this.FIELD_ERP_PO.Text + "' and (oea01 like '112%' or oea01 like '117%' or oea01 like '119%' or oea01 like '111%' or oea01 like '114%' or oea01 like 'SMM%' or oea01 like 'SMB%' )  " +
            " where oea01 = '" + this.FIELD_ERP_PO.Text + "' and (oea01 like '112%' or oea01 like '117%' or oea01 like '119%' or oea01 like '111%' or oea01 like '114%' or oea01 like 'SMM%' or oea01 like 'SMB%'  or oea01 like '1C1%'  )  " + //add 1C1 by Carol 20181229 
            " and oao04='1' and oao05='2' and oao03='" + this.FIELD_ERPITEM.Text + "' and oeb03='" + this.FIELD_ERPITEM.Text + "'";

            rs2.Open(sql);

           
            if (!rs2.EOF)
            {
                this.FIELD_Customer.Items.Add(new ListItem(rs2["oea032"].ToString(), rs2["oea032"].ToString()));
                this.FIELD_Customer.SelectedValue = rs2["oea032"].ToString();
                this.FIELD_PO.Text = rs2["oea10"].ToString();
                if (rs2["loc"].ToString() != "") this.FIELD_loc.Text = rs2["loc"].ToString();

                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rss.Open("SELECT * FROM " + db1 + "shipment_body_temp WHERE 1=0");
                rss.Add();
                rss["elapsedTicks"] = this.PK1.Value;
                rss["ERP_PO"] = rs2["oeb01"].ToString();
                rss["item"] = rs2["oeb03"].ToString();
                rss["partno"] = rs2["oeb04"].ToString();
                rss["component"] = rs2["ima02"].ToString();
                rss["dwg"] = rs2["ima021"].ToString();
                rss["qty"] = rs2["oeb12"].ToString();
                rss["purpose2"] = rs2["oao06"].ToString();



                rss.Update();
                rss.Close();
            }
            //string sql = "SELECT * FROM " + db1 + "shipment_body_temp WHERE  elapsedticks='" + this.PK1.Value.ToString() + "'";
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "test", "alert('確認ERP PO是否正確'); ", true);

            gridviewchange(this.PK1.Value.ToString());





            rs2.Open("SELECT * FROM " + db1 + "shipment_body_temp WHERE  elapsedticks='" + this.PK1.Value.ToString() + "' ");
            if (!rs2.EOF)
            {
                div1.Style.Add("display", "block");
                div2.Style.Add("display", "block");
                div3.Style.Add("display", "block");
                this.FIELD_ERP_PO.Enabled = false;
                this.GridView1.Visible = true;
                this.Button_ERPPO.Enabled = false;
                this.Button_New.Enabled = false;
                this.FIELD_Customer.Enabled = true;
                this.FIELD_loc.Enabled = true;
                this.FIELD_PO.Enabled = true;
                this.FIELD_ERPITEM.Enabled = false;
                //this.FIELD_Purpose.Enabled = true;

            }
            else
            {

                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "test", "alert('確認ERP PO是否正確'); ", true);

            }
            //this.Label10.Text="select oea032,oea10,oao06, CASE oea04  WHEN '002' THEN occ232  WHEN '003' THEN occ233  ELSE occ231  END loc "+
            //            ",oeb01,oeb03,oeb04,ima02,ima021,oeb12   " +
            //            " from minaik.oea_file left join minaik.oeb_file on oea01=oeb01  " +
            //            "left join minaik.ima_file on ima01=oeb04  " +
            //            "left join minaik.oao_file on oeb01=oao01 and oeb03=oao03  " +
            //            "left join minaik.occ_file on oea04=occ01  and oao03='1' and oao04='1' and oao05='2'  " +
            //            "where oea01 = '" + this.FIELD_ERP_PO + "' and (oea01 like '112%' or oea01 like '117%')  and oao04='1' and oao05='2'   ";

        }
        protected void Button_New_Click(object sender, EventArgs e)
        {
            this.FIELD_ERP_PO.Text = "";
            div1.Style.Add("display", "block");
            div2.Style.Add("display", "block");
            div3.Style.Add("display", "block");
            //this.FIELD_ERP_PO.Enabled = false;
            this.Button_ERPPO.Enabled = false;
            this.Button_New.Enabled = false;
            //this.FIELD_Customer.Enabled = true;
            //this.FIELD_loc.Enabled = true;
            //this.FIELD_PO.Enabled = true;
            //this.FIELD_Purpose.Enabled = true;
            this.FIELD_ERP_PO.Enabled = false;


        }
        protected void Button_AddItem_Click(object sender, EventArgs e)
        {
            

            this.FIELD_ERP_PO.Enabled = false;
            this.rember_item.Value = "";
            div1.Style.Add("display", "block");
            div2.Style.Add("display", "block");
            div3.Style.Add("display", "block");
            
          if(chk_ETD())
            {
                try
                {
                    
                    //this.FIELD_NPI_Engineer.Text = this.CurrentUser.ID.ToString();
                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rss.Open("SELECT * FROM " + db1 + "shipment_body_temp WHERE 1=0");
                    rss.Add();
                    
                    SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                    object objola = onum.ExecuteScalar("select  ISNULL(MAX(item),'0')+1 item  from " + db1 + "shipment_body_temp where elapsedticks='" + this.PK1.Value.ToString() + "' ");
                    string maxitem = objola.ToString();
                    
                    rss["elapsedTicks"] = this.PK1.Value.ToString();
                    
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
                    if (this.RadioButton1.Checked)
                    {
                        rss["potential_p"] = this.FIELD_Potential_P_choose.Text;
                    }
                    else
                    {
                        rss["potential_p"] = this.FIELD_Potential_P.Text;
                    }
                    if (this.FIELD_Packing.Text != "") rss["packing"] = this.FIELD_Packing.Text;
                    if (this.FIELD_Labno.Text != "") rss["lab_no"] = this.FIELD_Labno.Text;
                    if (this.FIELD_EngineeringTestNo.Text != "") rss["engineeringtest_no"] = this.FIELD_EngineeringTestNo.Text;
                    if (this.FIELD_purpose2.Text != "") rss["purpose2"] = this.FIELD_purpose2.Text;
                    if (this.FIELD_Labsn.Text != "") rss["labsn"] = this.FIELD_Labsn.Text;
                    if (this.FIELD_Explanation.Text != "") rss["Explanation"] = this.FIELD_Explanation.Text;

                    #region 儲存shipment_paper
                    
                    for (int x = 0; x < this.CheckBoxList2.Items.Count; x++)
                    {
                        if (CheckBoxList2.Items[x].Selected == true)
                        {
                            SmoothEnterprise.Database.DataSet st = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            st.Open("SELECT * FROM " + db1 + "shipment_paper_temp WHERE 1=0");
                            st.Add();
                            st["elapsedTicks"] = this.PK1.Value.ToString();
                            st["item"] = maxitem.ToString();
                            st["shipment_paper_id"] = CheckBoxList2.Items[x].Value;

                            st.Update();
                            st.Close();
                        }
                    }

                    #endregion

                    rss.Update();
                    rss.Close();
                    
                    gridviewchange(this.PK1.Value.ToString());
                    
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "test", "$(\"#FIELD_PartNo\").val('');$(\"#FIELD_Component\").val('');$(\"#FIELD_DWG\").val(''); ", true);
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
                    //this.FIELD_Paper.Text = "";
                    this.FIELD_Packing.Text = "QTY:" + Environment.NewLine + "NW/GW:" + Environment.NewLine + "CARTON QTY:" + Environment.NewLine + "VIA:" + Environment.NewLine + "Attn to:";
                    this.FIELD_Shipment_type.Text = "";
                    this.RadioButton1.Checked = true;
                    this.FIELD_Labno.Text = "";
                    this.FIELD_EngineeringTestNo.Text = "";
                    this.FIELD_purpose2.Text = "";
                    this.FIELD_Labsn.Text = "";
                    this.FIELD_Explanation.Text = "";
                    for (int i = 0; i < CheckBoxList2.Items.Count; i++)  //新增完將checkboxlist清除
                    {
                        CheckBoxList2.Items[i].Selected = false;
                    }
                    
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aax", " document.getElementById(\"ctl00_ContentPlaceHolder1_Button_UpdateItem\").style.display = \"none\" ;", true);
                    
                }
                catch (Exception ex)
                {
                    
                }
                } 
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet();
            //rs.ExecuteNonQuery("delete  from " + db1 + "shipment_body_temp where item='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "' and elapsedticks='" + this.PK1.Value.ToString() + "'");

            rs.ExecuteNonQuery("delete  from " + db1 + "shipment_paper_temp where item='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "' and elapsedticks='" + this.PK1.Value.ToString() + "' ");


            this.lab3.Text = ("delete  from " + db1 + "shipment_body_temp where item='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "' and elapsedticks='" + this.PK1.Value.ToString() + "'");
            gridviewchange(this.PK1.Value.ToString());

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string paperlist = "";
                int countpaper = 0;
                SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs3.Open("SELECT shipment_paper_id FROM " + db1 + "shipment_paper_temp where elapsedTicks='" + this.PK1.Value.ToString() + "' and item='" + GridView1.DataKeys[e.Row.RowIndex].Values[0].ToString() + "'");
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

                e.Row.Cells[1].Attributes.Add("onclick", "onGridViewRowSelected('" + e.Row.DataItemIndex + "','" + te2.ToString() + "','" + countpaper + "')");


            }

        }

        protected void Button_UpdateItem_Click(object sender, EventArgs e)
        {
            div1.Style.Add("display", "block");
            div2.Style.Add("display", "block");
            div3.Style.Add("display", "block");
            string msg = "";
            //20121002 mandy提出, MA commitment date(ETD)己輸入不得再次變更
            SmoothEnterprise.Database.DataSet cdemand = new SmoothEnterprise.Database.DataSet();
            object objola = cdemand.ExecuteScalar("SELECT convert(char, c_demand, 112) c_demand FROM " + db1 + "shipment_body_temp WHERE item='" + this.rember_item.Value + "' and elapsedticks='" + this.PK1.Value.ToString() + "'");
            msg = ("SELECT convert(char, c_demand, 112) c_demand FROM " + db1 + "shipment_body_temp WHERE item='" + this.rember_item.Value + "' and elapsedticks='" + this.PK1.Value.ToString() + "' <br> ");

            string csdemand = objola.ToString().Trim();
             
             if(chk_ETD()) 
            {

                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rss.Open("SELECT * FROM " + db1 + "shipment_body_temp WHERE item='" + this.rember_item.Value + "' and elapsedticks='" + this.PK1.Value.ToString() + "' ");
                if (!rss.EOF)
                {


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
                    //if (this.FIELD_Paper.Text != "") rss["paper"] = this.FIELD_Paper.Text;
                    if (this.FIELD_Packing.Text != "") rss["packing"] = this.FIELD_Packing.Text;
                    if (this.FIELD_Labno.Text != "") rss["lab_no"] = this.FIELD_Labno.Text;
                    if (this.FIELD_EngineeringTestNo.Text != "") rss["engineeringtest_no"] = this.FIELD_EngineeringTestNo.Text;
                    if (this.FIELD_purpose2.Text != "") rss["purpose2"] = this.FIELD_purpose2.Text;
                    if (this.FIELD_Labsn.Text != "") rss["labsn"] = this.FIELD_Labsn.Text;
                    if (this.FIELD_Explanation.Text != "") rss["Explanation"] = this.FIELD_Explanation.Text;
                    if (this.RadioButton1.Checked)
                    {
                        rss["Potential_P"] = this.FIELD_Potential_P_choose.Text;
                    }
                    else
                    {
                        rss["Potential_P"] = this.FIELD_Potential_P.Text;
                    }

                    rss.Update();

                    #region 刪掉shipment_paper再新增

                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet();
                    rs.ExecuteNonQuery("delete  from " + db1 + "shipment_paper_temp where item='" + this.rember_item.Value + "' and elapsedticks='" + this.PK1.Value.ToString() + "' ");

                    for (int x = 0; x < this.CheckBoxList2.Items.Count; x++)
                    {
                        if (CheckBoxList2.Items[x].Selected == true)
                        {
                            SmoothEnterprise.Database.DataSet st = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            st.Open("SELECT * FROM " + db1 + "shipment_paper_temp WHERE 1=0");
                            st.Add();
                            st["elapsedTicks"] = this.PK1.Value.ToString();
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


                }
                rss.Close();

                gridviewchange(this.PK1.Value.ToString());

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
                //this.FIELD_Paper.Text = "";
                this.FIELD_Packing.Text = "QTY:" + Environment.NewLine + "NW/GW:" + Environment.NewLine + "CARTON QTY:" + Environment.NewLine + "VIA:" + Environment.NewLine + "Attn to:";
                this.FIELD_Shipment_type.Text = "";
                this.RadioButton1.Checked = true;
                this.rember_item.Value = "";
                this.FIELD_Labno.Text = "";
                this.FIELD_EngineeringTestNo.Text = "";
                this.FIELD_purpose2.Text = "";
                this.FIELD_Labsn.Text = "";
                this.FIELD_Explanation.Text = "";


                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aaa", " document.getElementById(\"ctl00_ContentPlaceHolder1_Button_UpdateItem\").style.display = \"none\" ;", true);
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

        void gridviewchange(string aa)
        {



            SqlDataSource1.SelectCommand = "select elapsedTicks, ERP_PO, item, Component, DWG, Partno, Material,Material2,Material3, " +
                                "Shipment_type, LV, HV, Qty, CONVERT(char, C_demand, 111) AS C_demand, " +
                                "CONVERT(char, C_demand2, 111) AS C_demand2, CONVERT(char, ETD, 111) AS ETD, " +
                                "Potential_P, Paper, Packing, B_no, Shipment_status,lab_no,rowid,engineeringtest_no,c.id cid ,purpose2,lab_no,EngineeringTest_No,B_no,Shipment_status,ETD,labsn,wear.rowno wear_rowno , Explanation ,a.remark     from " +
                                "" + db1 + "shipment_body_temp a left join (select * from " + db2 + "Experiment_head_file where no <>'' and papstatus <> 'V') b on a.lab_no=b.no " +
                                "left join " + db2 + "engineeringtest_head c on a.engineeringtest_no=c.no left outer join eipb.dbo.LAP_Wear_test wear on a.labsn = wear.sn " +
                                "where elapsedTicks='" + aa.ToString() + "'     ";

            
           this.GridView1.DataBind();

        }

        protected void FIELD_Customer_SelectedIndexChanged(object sender, EventArgs e)
        {
            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs2.Open("select loc from " + db1 + "shipment_head where no=(select max(no) from " + db1 + "shipment_head where customer='" + this.FIELD_Customer.Text + "' )");
            if (!rs2.EOF)
            {
                this.FIELD_loc.Text = rs2["loc"].ToString();

            }
            else
            {
                this.FIELD_loc.Text = "";

            }
        }

        public DataTable GetBoxNumbers(object numbers) //lab_no傳參數
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("lab_no", typeof(string)));
            dt.Columns.Add(new DataColumn("rowid", typeof(string)));

            string[] sArray = numbers.ToString().Split(',');
            foreach (string s in sArray)
            {
                DataRow aa = dt.NewRow();
                aa["lab_no"] = s;


                SmoothEnterprise.Database.DataSet rsb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rsb.Open("SELECT rowid  FROM " + db2 + "Experiment_head_file  WHERE no='" + s + "' ");
                if (!rsb.EOF)
                {
                    aa["rowid"] = rsb["rowid"].ToString();
                }

                dt.Rows.Add(aa);

            }
            return dt;
        }


        //ETD 在新增時，需相同，並大於今日 //add by carol 20180626
        public bool chk_ETD()
        {
            bool isPass = true;


             

            string etd1 =string.IsNullOrEmpty( this.FIELD_C_demand.Text)?"": DateTime.ParseExact(this.FIELD_C_demand.Text.ToString(), "yyyyMMdd", null, System.Globalization.DateTimeStyles.AllowWhiteSpaces).ToShortDateString();
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
                    string yday = DateTime.Now.AddDays(-1).ToShortDateString();
                   long etd_dt = DateTime.Parse(etd1).Ticks;
                   long curr = Convert.ToDateTime(yday).Ticks;

                    int d = new TimeSpan(etd_dt - curr).Days;

                    //大於今天
                    if (d > 0)
                    {
                        isPass = true;
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('MA commitment date(ETD)  must be greater than "+ yday+"');", true);
                        isPass = false;
                    } 
                } 
            } 
            return isPass;
        }

    }
}