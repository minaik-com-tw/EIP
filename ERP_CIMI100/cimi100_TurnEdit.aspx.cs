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
using System.Threading;

namespace ERP_CIMI100
{
    public partial class cimi100_TurnEdit : SmoothEnterprise.Web.Page
    {
        private string db1 = ""; //db主位置 
        private string db2 = ""; //db副位置
        private string db3 = ""; //db副2位置
        private string class_no = ""; //2拋轉3變更
        public string error = "";
        protected void Page_Load(object sender, System.EventArgs e)
        {
            //Response.Write(Request.RawUrl);

            class_no = Request.QueryString["class_no"];

            if (Environment.MachineName.ToString().Trim() != "ANN-LIN") //如果不是在Ann本機, 則指定資料庫 
            {
                db1 = "[EIPB].[dbo].";
                db2 = "[EIPA].[dbo].";
                db3 = "[192.168.0.185].[dbo].";

            }
            try
            {
                error = "";

                if (!this.IsPostBack)
                {

                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                    rs.Open("SELECT   bass_no,name FROM " + db1 + "cimi100_base where class_no='plantid' and bass_no <> 'ALL' order by order_no");
                    while (!rs.EOF)
                    {
                        CheckBoxList2.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();


                    rs.Open("SELECT a.*,b.name bname FROM " + db1 + "cimi100_main a left join " + db2 + "dguser b on a.add_user=b.id WHERE a.id='" + Request.QueryString["id"] + "' ");
                    if (!rs.EOF)
                    {
                        this.FIELD_NO.Text = rs["no"].ToString();
                        this.FIELD_add_user.Text = rs["bname"].ToString();
                        this.FIELD_plantid.Text = rs["plantid"].ToString();
                        this.FIELD_DCC.Text = rs["DCC"].ToString();

                        if (rs["status"].ToString().Trim() == "Y")
                        {
                            this.InputButton1.Enabled = true;
                            this.Button_UpdateItem.Enabled = false;
                            this.Button_AddItem.Enabled = false;
                            this.BUTTON_save.Enabled = false;
                            this.InputButton2.Enabled = false;

                        }
                        else
                        {
                            this.Button_UpdateItem.Enabled = true;
                            this.Button_AddItem.Enabled = true;
                            this.InputButton1.Enabled = false;


                        }

                        if (rs["status"].ToString().Trim() == "OK")
                        {

                            this.BUTTON_SendRequest.Enabled = false;
                            this.BUTTON_save.Enabled = false;
                            this.InputButton2.Enabled = false;

                        }


                        if (class_no.ToString() == "3")
                        {


                        }
                    }
                    else
                    {
                        Response.Redirect("cimi100.aspx");
                    }
                    rs.Close();

                    //找之前新增的key值
                    rs.Open("select max(elapsedticks) elapsedticks from eipb.dbo.cimi100_turn where no='" + this.FIELD_NO.Text + "'");
                    if (!rs.EOF)
                    {
                        this.PK1.Value = rs["elapsedticks"].ToString();
                    }

                }



                //判段hf_items 
                defmarkdata();


                gridviewchange(this.FIELD_NO.Text);

            }
            catch
            {
                //	Response.Redirect("cimi100.aspx");
            }

            #region 判斷語言
            string userUICulture = Thread.CurrentThread.CurrentUICulture.Name;
            if (userUICulture == "en")
            {
                if (class_no.ToString() == "2") this.title.Text = "Material Toss Turn Application"; else this.title.Text = "Material Change Application";

            }
            else
            {

                if (class_no.ToString() == "2") this.title.Text = "料件拋轉申請單"; else this.title.Text = "料件變更申請單";

            }
            #endregion

            #region 若為3變更,廠區隱形
            if (class_no.ToString() == "3")
            {
                this.CheckBoxList2.Visible = false;
                this.Label8.Visible = false;
            }

            #endregion

            #region 如為mat/map廠區,文管欄位隱形

            if (this.FIELD_plantid.Text.Trim() != "MAM")
            {
                div1.Style.Add("display", "none");


            }


            #endregion
        }

        private void defmarkdata()
        {
            string er = "0";
            hf_items.Text = "Y";
            DBTransfer hs = new DBTransfer();//&& (this.FIELD_plantid.Text=="MAY")
            if (Request.QueryString["class_no"] == "3")
            {

                string sql = "update  a  set a.tc_imi03=MSE01 from  [EIPB].[dbo].[cimi100_turn] a  left join IP185.MINAIK.dbo.MSE_FILE " +
                    "   on  tc_imi031=MSE02 COLLATE Chinese_Taiwan_Stroke_CS_AS   where no='" + this.FIELD_NO.Text + "'" +
                    " and tc_imi031 is not null and  tc_imi03  is null ";

                hs.RunIUSql(sql);



                er = hs.GetTopfile("select COUNT(*) as a1 from  [EIPB].[dbo].[cimi100_turn]    where no='" + this.FIELD_NO.Text + "'" +
                   "  and tc_imi031!='' and  len(isnull(tc_imi03,'0'))<2 ");

                if (er != "0") hf_items.Text = "N";

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
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM " + db1 + "cimi100_main WHERE no='" + this.FIELD_NO.Text + "'");

                rs["edit_date"] = DateTime.Now.ToString();
                rs["edit_user"] = this.CurrentUser.ID.ToString();
                rs["DCC"] = this.FIELD_DCC.Text;


                rs.Update();
                rs.Close();
            }
            gridviewchange(this.FIELD_NO.Text);
        }

        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            this.GoBack("cimi100.aspx", new string[] { "cimi100Delete.aspx" });
        }


        protected void Button_AddItem_Click(object sender, EventArgs e)
        {
            //拋轉的廠區
            string strPlantidLimmit = "";
            string plantid_list = "";
            for (int x = 0; x < this.CheckBoxList2.Items.Count; x++)
            {
                if (CheckBoxList2.Items[x].Selected == true)
                {
                    strPlantidLimmit = strPlantidLimmit + CheckBoxList2.Items[x].Value + "@";
                    if (plantid_list == "")
                    {
                        plantid_list = "'" + CheckBoxList2.Items[x].Value + "'";
                    }
                    else
                    {
                        plantid_list = plantid_list + ",'" + CheckBoxList2.Items[x].Value + "'";
                    }
                }
            }
            SmoothEnterprise.Database.DataSet rrs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rrs.Open("select * from eipb.dbo.cimi100_turn where elapsedticks= '" + this.PK1.Value.ToString() + "' and partno='" + Request.Form["FIELD_Partno"].ToString() + "' ");
            if (!rrs.EOF)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('料號重覆登打!');", true);
            }
            else if (strPlantidLimmit.Length < 2 && class_no == "2")
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('請輸入廠區!');", true);

            }
            else
            {

                SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                object objola = onum.ExecuteScalar("select  ISNULL(MAX(item),'0')+1 item  from eipb.dbo.cimi100_turn where elapsedticks='" + this.PK1.Value.ToString() + "' ");
                string maxitem = objola.ToString();

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM eipb.dbo.cimi100_turn WHERE 1=0");
                rs.Add();
                rs["no"] = this.FIELD_NO.Text;
                rs["elapsedTicks"] = this.PK1.Value.ToString();
                rs["item"] = maxitem;
                rs["partno"] = Request.Form["FIELD_Partno"];
                rs["component"] = Request.Form["FIELD_Component"];
                rs["dwg"] = Request.Form["FIELD_DWG"];
                rs["turn_plantid"] = strPlantidLimmit.ToString();


                //江的需求 -------------------------

                rs["tc_imi02"] = Request.Form["Textc_imi02"];
                rs["tc_imi021"] = Request.Form["Textc_imi021"];
                // rs["tc_imi03"] = Request.Form["Textc_imi03"];
                DBTransfer hs = new DBTransfer();
                string markid = hs.GetTopfile("select   MSE01  from     IP185.MINAIK.dbo.MSE_FILE where mse02='" + Request.Form["Textc_imi031"] + "'");
                rs["tc_imi03"] = markid;
                rs["tc_imi031"] = Request.Form["Textc_imi031"];
                //--------------------------------

                rs.Update();
                rs.Close();
            }

            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aax", " document.getElementById(\"ctl00_ContentPlaceHolder1_Button_UpdateItem\").style.display = \"none\" ;", true);
            for (int i = 0; i < CheckBoxList2.Items.Count; i++)  //新增完將checkboxlist清除
            {
                CheckBoxList2.Items[i].Selected = false;
            }

            gridviewchange(this.FIELD_NO.Text);
        }
        protected void Button_UpdateItem_Click(object sender, EventArgs e)
        {
            //拋轉的廠區
            string strPlantidLimmit = "";
            string plantid_list = "";
            for (int x = 0; x < this.CheckBoxList2.Items.Count; x++)
            {
                if (CheckBoxList2.Items[x].Selected == true)
                {
                    strPlantidLimmit = strPlantidLimmit + CheckBoxList2.Items[x].Value + "@";
                    if (plantid_list == "")
                    {
                        plantid_list = "'" + CheckBoxList2.Items[x].Value + "'";
                    }
                    else
                    {
                        plantid_list = plantid_list + ",'" + CheckBoxList2.Items[x].Value + "'";
                    }
                }
            }

            SmoothEnterprise.Database.DataSet rrs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rrs.Open("select * from eipb.dbo.cimi100_turn where elapsedticks= '" + this.PK1.Value.ToString() + "' and partno='" + Request.Form["FIELD_Partno"].ToString() + "' and item <> '" + this.rember_item.Value.ToString() + "' ");

            if (!rrs.EOF)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('料號重覆登打!');", true);
            }
            else if (strPlantidLimmit.Length < 2 && class_no == "2")
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('請輸入廠區!');", true);

            }
            else
            {
                SmoothEnterprise.Database.DataSet urs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                urs.Open("SELECT * FROM eipb.dbo.cimi100_turn WHERE elapsedTicks='" + this.PK1.Value.ToString() + "' and item='" + this.rember_item.Value.ToString() + "' ");
                if (!urs.EOF)
                {

                    urs["partno"] = Request.Form["FIELD_Partno"];
                    urs["component"] = Request.Form["FIELD_Component"];
                    urs["dwg"] = Request.Form["FIELD_DWG"];
                    urs["turn_plantid"] = strPlantidLimmit.ToString();
                    //江的需求 -------------------------

                    urs["tc_imi02"] = Request.Form["Textc_imi02"];
                    urs["tc_imi021"] = Request.Form["Textc_imi021"];
                    //urs["tc_imi03"] = Request.Form["Textc_imi03"];
                    DBTransfer hs = new DBTransfer();
                    string markid = hs.GetTopfile("select   MSE01  from     IP185.MINAIK.dbo.MSE_FILE where mse02='" + Request.Form["Textc_imi031"] + "'");
                    urs["tc_imi03"] = markid;

                    urs["tc_imi031"] = Request.Form["Textc_imi031"];
                    //--------------------------------


                    urs.Update();
                }
                urs.Close();
            }
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aaa", " document.getElementById(\"ctl00_ContentPlaceHolder1_Button_UpdateItem\").style.display = \"none\" ;", true);
            for (int i = 0; i < CheckBoxList2.Items.Count; i++)  //新增完將checkboxlist清除
            {
                CheckBoxList2.Items[i].Selected = false;
            }
            gridviewchange(this.FIELD_NO.Text);

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("select * from " + db1 + "cimi100_main where id= '" + Request.QueryString["id"] + "' ");
                if (!rs.EOF)
                {
                    if (rs["status"].ToString().Trim() == "Y" || rs["status"].ToString().Trim() == "OK")
                    {
                        e.Row.Cells[0].Enabled = false;

                    }
                    else
                    {
                        e.Row.Cells[0].Enabled = true;

                        ImageButton ibtn = new ImageButton();
                        ibtn.ID= "btn_del_" + e.Row.RowIndex;
                        ibtn.CommandArgument = e.Row.RowIndex.ToString();
                        ibtn.CommandName = "DelModel";
                        ibtn.ImageUrl = "../shipment/img/button_drop.png";
                        e.Row.Cells[0].Controls.Add(ibtn);
                    }

                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {

                        e.Row.Cells[1].Attributes.Add("onclick", "onGridViewRowSelected('" + e.Row.DataItemIndex + "','" + Request.QueryString["class_no"] + "')");
                    }
                    if (class_no.ToString() == "3")  //若為3變更,廠區隱形
                    {
                        e.Row.Cells[7].Visible = false;

                    }
                    //text-decoration:none

                }
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                Response.Write("<scrip>alert('" + this.FIELD_NO.Text + "')");


                gridviewchange(this.FIELD_NO.Text);
            }
            catch (Exception ex)
            {
                error = string.Format("{0}<br>{1}", ex.Message, ex.StackTrace);
            }

        }

        void gridviewchange(string aa)  //change girdview
        {


            SqlDataSource1.SelectCommand = "select  no, item, elapsedTicks, partno, component, dwg, " +
                                           " CASE  WHEN turn_plantid ='' THEN turn_plantid   " +
                                           " ELSE  SUBSTRING(REPLACE(turn_plantid,'@', ','), 0, LEN(turn_plantid)) END  turn_plantid " +
                                           " ,tc_imi02,tc_imi021,tc_imi03,tc_imi031 as tc_imi03nm from eipb.dbo.cimi100_turn where no='" + aa.ToString() + "'  ";


            //Response.Write(SqlDataSource1.SelectCommand.ToString());
            this.GridView1.DataBind();

        }



        protected void InputButton1_Click(object sender, EventArgs e)
        {
            ShrFlowMail Backsend = new ShrFlowMail();
            SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rss.Open("select a.*, b.id bid,b.name name, b.email email,c.no no from  " + db2 + "dgflowqueue a left join  " + db2 + "dguser b on a.revieweruid = b.id " +
                    "left join  " + db1 + "cimi100_main c on c.id= '" + Request.QueryString["id"] + "' " +
                    "where requesturl like '%" + Request.QueryString["id"] + "%' and revieweruid <> " +
                    "'" + System.Guid.Empty.ToString() + "' and reviewdate is null ");
            while (!rss.EOF)
            {

                Backsend.RemindApprove("{ca9348c8-504a-4454-9acc-18c03cfc8189}", this.FIELD_NO.Text, rss["name"].ToString(), "http://eip.minaik.com.tw/ERP_Cimi100/cimi100_turnView.aspx?id=" + Request.QueryString["id"] + "&class_no=" + Request.QueryString["class_no"], rss["email"].ToString(), this.FlowClient1.Text, "--廠區:" + this.FIELD_plantid.Text + "<BR>--申請人員:" + this.FIELD_add_user.Text.Trim(), "員工入口網站");
                Dguserdeputy(rss["bid"].ToString());
                rss.MoveNext();
            }
            rss.Close();
        }
        protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {

            //如果是 變更 單class_no=3 ,且是 MAY 的單子, 若有廠牌名稱,且要有廠牌ID

            string er = "0";
            //DBTransfer hs = new DBTransfer();//&& (this.FIELD_plantid.Text=="MAY")
            //if(Request.QueryString["class_no"]=="3"){

            // er=hs.GetTopfile("select COUNT(*) as a1 from  [EIPB].[dbo].[cimi100_turn]    where no='"+this.FIELD_NO.Text+"'"+
            //   "  and tc_imi031 is not null and  ISNULL(tc_imi03,'NA')<6 ");

            // }
            //if (er == "0")
            //{

            this.Button_AddItem.Enabled = false;
            this.Button_UpdateItem.Enabled = false;
            this.InputButton1.Enabled = true;
            this.InputButton2.Enabled = false;
            this.BUTTON_save.Enabled = true;





            SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rb.Open("SELECT * FROM " + db1 + "cimi100_main WHERE id='" + Request.QueryString["id"] + "'  ");
            while (!rb.EOF)
            {
                rb["STATUS"] = "Y";

                rb.Update();
                rb.MoveNext();

            }
            rb.Close();

            this.BUTTON_SendRequest.Flow = this.FlowClient1;
            this.InputButton1.Enabled = true;
            this.BUTTON_save.Enabled = false;
            this.InputButton2.Enabled = false;

            managerlevel aa = new managerlevel(); //引用managerlevel class
            ArrayList all = new ArrayList();  //all arraylist
            ArrayList managerid = new ArrayList();  //主管id arraylist
            ArrayList managerlv = new ArrayList();  //主管階級 arraylist
            ArrayList managernm = new ArrayList();  //主管職稱 arraylist

            #region 找集團文管id

            string LDCC = "";
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("SELECT   PID FROM " + db2 + "erp_flow where erp_name='cimi100' and dep_name='DCC' and no='MAT'");
            if (!rs.EOF)
            {
                LDCC = rs["PID"].ToString();
            }
            rs.Close();

            #endregion

            if (this.FIELD_plantid.Text.Trim() == "MAT")
            {
                managerid.Add(LDCC.ToString());
                managernm.Add("集團文管中心");
            }
            else
            {
                managerid.Add(this.FIELD_DCC.Text.ToString());
                managernm.Add("子廠文管中心");

                managerid.Add(LDCC.ToString());
                managernm.Add("集團文管中心");

            }

            sharflow12_2.Flowwork.sharflow12_21 flow = new sharflow12_2.Flowwork.sharflow12_21();
            if (class_no.ToString() == "2") FlowClient1.Text = "料件拋轉流程"; else FlowClient1.Text = "料件變更流程";
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
            e.NextNode.ReviewerURL = "/erp_cimi100/cimi100_turnView.aspx";

            int count = 0;
            foreach (string i in managerid)  //將簽核人員id塞進flow
            {
                this.FlowClient1.AddParameter("USER" + count.ToString(), i);
                // Response.Write("USER" + count.ToString() + ")" + i + "<br>");
                count++;
            }

            count = 0;

            foreach (string i in managernm)  //將簽核人員職稱塞進flow
            {
                this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
                count++;
            }

            ShrFlowMail Backsend = new ShrFlowMail();
            rs.Open("select name,email,id from " + db2 + "dguser  where id='" + this.FIELD_DCC.Text.ToString() + "' ");
            if (!rs.EOF)
            {
                Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, this.FIELD_NO.Text, rs["name"].ToString(), rs["email"].ToString(), "http://eip.minaik.com.tw/ERP_Cimi100/Cimi100_turnView.aspx?id=" + Request.QueryString["id"] + "&class_no=" + Request.QueryString["class_no"], "--廠區:" + this.FIELD_plantid.Text + "<BR>--申請人員:" + this.FIELD_add_user.Text.Trim()); Dguserdeputy(rs["id"].ToString());
            }

            gridviewchange(this.FIELD_NO.Text);

            // }
            //else
            //{
            //hs.RunIUSql("delete from EIPA.dbo.dgflowqueue where requesturl='"+Request.RawUrl+"'") ;
            //   Response.Write("<script>alert('輸入的廠牌名稱/ID 是有問題!');</script>");
            // /ERP_CIMI100/CIMI100_TurnEdit.aspx?id=34ea9fc2-14a7-411b-bfa9-6840ce49f7c5&class_no=3

            //string urlc="
            // Response.Write("delete from EIPA.dbo.dgflowqueue where requesturl='" + Request.RawUrl + "'");
            //}
        }
        protected void InputButton2_Click(object sender, EventArgs e)
        {
            SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rb.Open("SELECT * FROM " + db1 + "cimi100_main WHERE id='" + Request.QueryString["id"] + "'  ");
            while (!rb.EOF)
            {
                rb["STATUS"] = "V";

                rb.Update();
                rb.MoveNext();

            }
            rb.Close();

            Response.Redirect("/erp_cimi100/cimi100.aspx");

        }
        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            try
            {


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
            sin1.ImageUrl = "~/image/" + (string)e["InputText3"] + ".JPG";
        }
        protected void BUTTON_StopRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rb.Open("SELECT * FROM " + db1 + "cimi100_main WHERE id='" + Request.QueryString["id"] + "'  ");
            while (!rb.EOF)
            {
                rb["STATUS"] = "N";

                rb.Update();
                rb.MoveNext();

            }
            rb.Close();

            this.Button_UpdateItem.Enabled = true;
            this.Button_AddItem.Enabled = true;
            this.InputButton2.Enabled = true;
            this.InputButton1.Enabled = false;
            this.BUTTON_save.Enabled = true;
            gridviewchange(this.FIELD_NO.Text);
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

                Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", this.FlowClient1.Text, this.FIELD_NO.Text, rs["name"].ToString(), rs["email"].ToString(), "http://eip.minaik.com.tw/ERP_Cimi100/Cimi100_turnView.aspx?id=" + Request.QueryString["id"] + "&class_no=" + Request.QueryString["class_no"], "--申請人員:" + this.FIELD_add_user.Text.Trim() + "<BR>--廠區:" + this.FIELD_plantid.Text + "");
                rs.MoveNext();

            }
            rs.Close();

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string no = FIELD_NO.Text.ToString();
            if (e.CommandName == "DelModel")
            {
                int index = int.Parse(e.CommandArgument.ToString());

                GridViewRow row = GridView1.Rows[index];
                string item = row.Cells[3].Text;

                string sql = "DELETE FROM eipb.dbo.cimi100_turn WHERE(item = '" + item + "') AND(no ='" + no + "')";
                //error = sql;
                Utility.execDel(sql);
            }

            gridviewchange(no);

        }
    }
}