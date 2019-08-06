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
using System.Net.Mail;
using System.Text;
using System.IO;
using System.Net;
using System.Threading;

namespace ERP_CIMI100
{
    public partial class cimi100_NewView : SmoothEnterprise.Web.Page
    {
        private string db1 = ""; //db主位置 
        private string db2 = ""; //db副位置
        private string db3 = ""; //db副2位置
        private string class_no = ""; //2拋轉3變更
        public long elapsedTicks;  //尚未轉成正式區的單身唯一值
        private string flowname = "";//流程名稱
        private bool _NotifyReview = false;
        public string style = "0"; //非簽核人員進來,產生料號及勾選erp為.Enabled
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Environment.MachineName.ToString().Trim() != "ANN-LIN") //如果不是在Ann本機, 則指定資料庫 
            {
                db1 = "[EIPB].[dbo].";
                db2 = "[EIPA].[dbo].";
                db3 = "IP185.";

            }
            else
            {

                db3 = "[192.168.0.185]."; //如果不是在Ann本機, 則指定資料庫 
            }
            try
            {
                if (!this.IsPostBack)
                {

                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);


                    #region 單頭單身預設代入

                    rs.Open("SELECT a.*,b.name bname FROM " + db1 + "cimi100_main a left join " + db2 + "dguser b on a.add_user=b.id WHERE a.id='" + Request.QueryString["id"] + "' ");
                    if (!rs.EOF)
                    {
                        this.FIELD_NO.Text = rs["no"].ToString();
                        this.FIELD_add_user.Text = rs["bname"].ToString();
                        this.FIELD_plantid.Text = rs["plantid"].ToString();




                    }

                    string idel_plantid = this.FIELD_plantid.Text.Trim();                                       //預設閒置,閒置需抓各廠區
                    if (idel_plantid.ToString() == "MAT") idel_plantid = "MINAIK";
                    rs.Open("SELECT  AZF01 FROM " + db3 + idel_plantid.ToString() + ".dbo.AZF_FILE WHERE AZF02='H' ");
                    while (!rs.EOF)
                    {
                        this.FIELD_idel.Items.Add(new ListItem(rs["AZF01"].ToString(), rs["AZF01"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();



                    rs.Open("SELECT  max(elapsedticks) elapsedticks FROM " + db1 + "cimi100_new where no= '" + this.FIELD_NO.Text + "' ");
                    if (!rs.EOF)
                    {
                        this.PK1.Value = rs["elapsedticks"].ToString();

                    }

                    rs.Close();

                    //附檔----------------------------------------------------
                    ContentPlaceHolder cnt;
                    cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                    CheckBoxList chb = (CheckBoxList)cnt.FindControl("CheckBoxFile");
                    SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                    rs2.Open("SELECT id,FileName FROM " + db1 + "cimi100_File WHERE FileKey='" + Request.QueryString["ID"] + "' ");
                    while (!rs2.EOF)
                    {
                        chb.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs2["id"].ToString() + "\" target=\"_blank\">" + rs2["FileName"].ToString() + "</a>", rs2["id"].ToString()));
                        rs2.MoveNext();

                    }
                    rs2.Close();

                    gridviewchange(this.FIELD_NO.Text);



                    #endregion
                   
                    #region 基本資料預設



                    rs.Open("SELECT   bass_no,name FROM " + db1 + "cimi100_base where class_no='plantid' and bass_no <> 'ALL' order by order_no");  //預設生產廠區
                    while (!rs.EOF)
                    {
                        p_plantid.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();



                    string plantid = this.FIELD_plantid.Text.Trim();
                    if (this.FIELD_plantid.Text.Trim() == "MAT") plantid = "MINAIK";  //預設產品別
                    rs.Open("select b.bass_no bass_no,b.name name from " + db1 + "cimi100_union a left join " + db1 + "cimi100_base b on a.class_no=b.bass_no" +
                            " where union_plantid='" + plantid.ToString() + "' and b.class_no='Product_class' group by bass_no,name order by bass_no ");
                    while (!rs.EOF)
                    {
                        this.FIELD_product_class.Items.Add(new ListItem(rs["bass_no"].ToString() + ":" + rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();


 

                    rs.Open("SELECT  GFE01 FROM " + db3 + "MINAIK.dbo.GFE_FILE ");  //預設庫存單位
                    while (!rs.EOF)
                    {
                        this.FIELD_Unit.Items.Add(new ListItem(rs["GFE01"].ToString(), rs["GFE01"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

 


                    rs.Open("SELECT  OBB01,OBB02 FROM " + db3 + "MINAIK.dbo.OBB_FILE where obb01 like 'Z%'  ");  //預設產品大類
                    while (!rs.EOF)
                    {
                        this.FIELD_cate1.Items.Add(new ListItem(rs["OBB01"].ToString() + ":" + rs["OBB02"].ToString(), rs["OBB01"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  OBA01,OBA02 FROM " + db3 + "MINAIK.dbo.OBA_FILE where oba01 like 'Y%'  ");  //預設產品中類
                    while (!rs.EOF)
                    {
                        this.FIELD_cate2.Items.Add(new ListItem(rs["OBA01"].ToString() + ":" + rs["OBA02"].ToString(), rs["OBA01"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Packaging_Class' order by bass_no");  //預設包材分類
                    while (!rs.EOF)
                    {
                        this.B2.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        this.AC2.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Consume_class' order by bass_no");  //預設消耗分類
                    while (!rs.EOF)
                    {
                        this.C2.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='DEP_Class' order by bass_no");  //預設部門碼
                    while (!rs.EOF)
                    {
                        this.E5.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='MAP_Product_class' order by bass_no");  //預設MAP產品別
                    while (!rs.EOF)
                    {
                        this.I5.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='MAP_material_class' order by bass_no");  //預設MAP原料產品別
                    while (!rs.EOF)
                    {
                        this.I7.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='MATC_Product_class' order by bass_no");  //預設MATC產品別
                    while (!rs.EOF)
                    {
                        this.J3.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Chemistry_class' order by bass_no");  //預設化學分類
                    while (!rs.EOF)
                    {
                        this.K4.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='agent_class' order by bass_no");  //預設藥水材質區分
                    while (!rs.EOF)
                    {
                       
                       
                        this.Y3.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Brightness_class' order by bass_no");  //預設亮度類別
                    while (!rs.EOF)
                    {
                        this.L4.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        this.M5.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        this.N5.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        this.X4.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        this.Y5.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        this.Z5.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Material_distinguish' order by bass_no");  //預設材質區分
                    while (!rs.EOF)
                    {
                        this.X3.Items.Add(new ListItem(rs["name"].ToString().Trim(), rs["bass_no"].ToString().Trim()));
                        this.L3.Items.Add(new ListItem(rs["name"].ToString().Trim(), rs["bass_no"].ToString().Trim()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Ironmaterial_class' order by bass_no");  //預設鐵材材質
                    while (!rs.EOF)
                    {
                        this.M3.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        this.N3.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        this.Z3.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Glue_class' order by bass_no");  //預設膠種
                    while (!rs.EOF)
                    {
                        this.N4.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        this.Z4.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Glue_class' order by bass_no");  //預設PEG+膠種
                    while (!rs.EOF)
                    {
                        this.O3.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        this.P3.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='AUTO_L' order by bass_no");  //預設自動化大類
                    while (!rs.EOF)
                    {
                        this.Q2.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    //rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='AUTO_M' order by bass_no");  //預設自動化中類
                    //while (!rs.EOF)
                    //{
                    //    this.Q5.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                    //    rs.MoveNext();
                    //}
                    //rs.Close();

                    //rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='AUTO_S' order by bass_no");  //預設自動化小類
                    //while (!rs.EOF)
                    //{
                    //    this.Q6.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                    //    rs.MoveNext();
                    //}
                    //rs.Close();

                    //rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='AUTO_Industry' order by bass_no");  //預設自動化產業別
                    //while (!rs.EOF)
                    //{
                    //    this.Q3.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                    //    rs.MoveNext();
                    //}
                    //rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Product_class_M' order by bass_no");  //預設產品種類(管理服務費)
                    while (!rs.EOF)
                    {
                        this.U3.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Electronic_class' order by bass_no");  //預設電子料種類
                    while (!rs.EOF)
                    {
                        this.V4.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                        rs.MoveNext();
                    }
                    rs.Close();

                    //rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Transaction_class' order by bass_no");  //預設交易方式
                    //while (!rs.EOF)
                    //{
                    //    this.FIELD_Group2.Items.Add(new ListItem(rs["bass_no"].ToString()+":"+rs["name"].ToString(), rs["bass_no"].ToString()));
                    //    rs.MoveNext();
                    //}
                    //rs.Close();

                    rs.Open("SELECT  bass_no,name FROM " + db1 + "cimi100_base where  class_no='Plastic_class' order by bass_no");  //
                    while (!rs.EOF)
                    {
                        this.AB6.Items.Add(new ListItem(rs["name"].ToString().Trim(), rs["bass_no"].ToString().Trim()));
                        rs.MoveNext();
                    }
                    rs.Close();



                    #endregion

                    #region 確認身份是否為簽核人或代理人, 如yes, 可update
                    rs2.Open("  select * from  " + db2 + "dgflowqueue where requesturl like '%" + Request.QueryString["id"] + "%' and revieweruid <>'00000000-0000-0000-0000-000000000000' and resulttype is null"); //找簽核人員
                    if (!rs2.EOF)
                    {
                        if ("{" + rs2["revieweruid"].ToString().ToUpper() + "}" == this.CurrentUser.ID.ToString().ToUpper())
                        {

                            Button_UpdateItem.Enabled = true;
                            style = "1";
                        }
                        else
                        {
                            SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead); //找簽核人員是否=登錄人員
                            rs3.Open(" SELECT b.name name,email FROM " + db2 + "dguserdeputy a left join " + db2 + "dguser b on a.deputyuid=b.id left join " + db2 + "dgflow c on a.sid=c.id  " +
                                     " where  a.uid='" + rs2["revieweruid"].ToString() + "' and b.id='" + this.CurrentUser.ID.ToString() + "' " +
                                     " and  " +
                                     " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                                     " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate is null) or " +  //sharflow12_21 一般流程
                                     " (c.typename = 'sharflow12_21' and sdate < GETDATE() and edate > GETDATE()) or " +
                                     "  a.sid is null and sdate < GETDATE() and edate  > GETDATE())   group by b.name,email ");
                            if (!rs3.EOF)
                            {
                                Button_UpdateItem.Enabled = true;
                                style = "1";
                            }
                            else
                            {
                                Button_UpdateItem.Enabled = false;
                                style = "2";
                                Button1.Enabled = false;
                                this.FIELD_ERP_identical.Enabled = false;

                            }


                        }



                    }
                    else
                    {
                        Button_UpdateItem.Enabled = false;
                        style = "2";
                        Button1.Enabled = false;
                        this.FIELD_ERP_identical.Enabled = false;

                    }

                    if (this.CurrentUser.LogonID.ToString() == "ann.lin") button_txt.Visible = true; this.Button1.Enabled = true;


                    #endregion

                    #region 產生集團碼


                    SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rss.Open("select distinct IMZ01,IMZ02 from  " + db1 + "cimi100_union a  " +
                            "left join  " + db3 + "MINAIK.dbo.IMZ_FILE b on union_group=b.imz01 COLLATE Chinese_Taiwan_Stroke_CS_AS    " +
                            " WHERE IMZ01 NOT IN ('Y','Z','V')   and union_plantid='" + plantid.ToString() + "' order by imz01 ");
                    while (!rss.EOF)
                    {
                        this.FIELD_Group.Items.Add(new ListItem(rss["IMZ01"].ToString() + ":" + rss["IMZ02"].ToString(), rss["IMZ01"].ToString()));
                        rss.MoveNext();
                    }

                    rss.Close();

                    #endregion

                    #region  產生交易方式

                    this.FIELD_Group2.Items.Clear();

                    rss.Open(" select distinct b.bass_no bass_no,name from " + db1 + "cimi100_union a   " +
                    " left join " + db1 + "cimi100_base b on b.class_no='Transaction_class' and bass_no=union_transaction " +
                    " where  union_plantid='" + plantid.ToString() + "'");

                    while (!rss.EOF)
                    {
                        this.FIELD_Group2.Items.Add(new ListItem(rss["bass_no"].ToString() + ":" + rss["name"].ToString(), rss["bass_no"].ToString()));
                        rss.MoveNext();
                    }
                    rss.Close();

                    #endregion

                    #region  產生編碼原則

                    this.FIELD_Coding_Class.Items.Clear();
                    rss.Open("   select distinct b.bass_no bass_no,name from " + db1 + "cimi100_union a  " +
                            "    left join " + db1 + "cimi100_base b on b.class_no='Coding_Class' and bass_no=union_coding " +
                            "    where union_plantid='" + plantid.ToString() + "' " +
                            "    ");
                    while (!rss.EOF)
                    {
                        this.FIELD_Coding_Class.Items.Add(new ListItem(rss["bass_no"].ToString() + ":" + rss["name"].ToString(), rss["bass_no"].ToString()));
                        rss.MoveNext();
                    }
                    rss.Close();

                    #endregion
                    //if (row.Cells[29].Text == "17")
                    //{
                    //    #region 產生自動化

                    //    //if (rs["Coding_Class"].ToString() == "17")
                    //    //{
                    //    this.Q3.Items.Clear();
                    //    this.Q4.Items.Clear();
                    //    #region change自動化產業別
                    //    rss.Open("select distinct b.bass_no bass_no,name from " + db1 + "cimi100_autounion a " +
                    //            "left join " + db1 + "cimi100_base b on  b.class_no='AUTO_Industry' and bass_no=auto_industry where auto_l='" + rs["Q2"].ToString() + "'");
                    //    while (!rss.EOF)
                    //    {
                    //        this.Q3.Items.Add(new ListItem(rss["name"].ToString().Trim(), rss["bass_no"].ToString().Trim()));
                    //        rss.MoveNext();
                    //    }
                    //    rss.Close();
                    //    #endregion

                    //    #region change機台流水號
                    //    rss.Open("select machine_number from " + db1 + "cimi100_autounion where auto_industry='" + rs["Q3"].ToString() + "'");
                    //    while (!rss.EOF)
                    //    {
                    //        this.Q4.Items.Add(new ListItem(rss["machine_number"].ToString().Trim(), rss["machine_number"].ToString().Trim()));
                    //        rss.MoveNext();
                    //    }
                    //    rss.Close();
                    //    #endregion

                    //    //}
                    //    #endregion
                    //    this.Q2.Text = rs["Q2"].ToString();
                    //    this.Q3.Text = rs["Q3"].ToString();
                    //    this.Q4.Text = rs["Q4"].ToString();
                    //}


                }
            }
            catch
            {
                //Response.Redirect("cimi100_New.aspx");
            }
        }

        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            flowname = "料件新增流程";

            //下一關發信
            ShrFlowMail Backsend = new ShrFlowMail();
            if (_NotifyReview)
            {

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("select top 1 REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid from " + db2 + "dgflowqueue a left join " + db2 + "dguser b on revieweruid=b.id where requesturl like '%" + Request.QueryString["id"] + "%'  AND reviewdate IS NULL AND qseq is not null  ");
                if (!rs.EOF)
                {
                    Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", flowname.ToString(), this.FIELD_NO.Text, rs["name"].ToString(), rs["email"].ToString(), "http://eip.minaik.com.tw/ERP_Cimi100/Cimi100_newView.aspx?id=" + Request.QueryString["id"], "--申請人員:" + this.FIELD_add_user.Text.Trim() + "<BR>--廠區:" + this.FIELD_plantid.Text + "");

                    Dguserdeputy(rs["bid"].ToString());
                }
            }

        }

        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            this.GoBack();
        }

        protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
        {
            if (this.FlowFeedback1.ResultType.ToString() == "Next")
            {
                string checkerror = "";
                if (this.CurrentUser.LogonID.ToString() == "killy.wang" || this.CurrentUser.LogonID.ToString() == "amy.mu" || this.CurrentUser.LogonID.ToString() == "elliot.chang")  //需為最後一關文管再check
                {
                    #region check內容


                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs.Open("SELECT  * FROM " + db1 + "cimi100_new where no= '" + this.FIELD_NO.Text.Trim() + "' ");
                    while (!rs.EOF)
                    {
                        //檢核是否有料號
                        if (rs["partno"].ToString().Length == 0)
                        {
                            Response.Write("<script language='JavaScript'>window.alert('項次" + rs["item"].ToString() + ",請輸入料號！');</script>");
                            checkerror = "1";
                        }

                        //檢核是否有產品小類
                        if (rs["cate3"].ToString().Length == 0)
                        {
                            Response.Write("<script language='JavaScript'>window.alert('項次" + rs["item"].ToString() + ",請輸入產品小類！');</script>");
                            checkerror = "1";
                        }

                        //自製  來源碼=’M’ (ima08=’M’)     AND 分群碼(ima06)  in (4,5,8,9) 

                        if (rs["Source_code"].ToString() == "M" && (rs["group_code"].ToString() == "4" || rs["group_code"].ToString() == "5" || rs["group_code"].ToString() == "8" || rs["group_code"].ToString() == "9"))
                        {
                            if (rs["Homemade_code"].ToString().Length == 0)
                            {
                                Response.Write("<script language='JavaScript'>window.alert('項次" + rs["item"].ToString() + ",請輸入自製產品代號！');</script>");
                                checkerror = "1";
                            }
                        }
                        //預測料號 分群碼(ima06)  in (C,S,5,9,G)

                        if (rs["group_code"].ToString() == "C" || rs["group_code"].ToString() == "S" || rs["group_code"].ToString() == "5" || rs["group_code"].ToString() == "9" || rs["group_code"].ToString() == "G")
                        {
                            if (rs["f_partno"].ToString().Length == 0)
                            {
                                Response.Write("<script language='JavaScript'>window.alert('項次" + rs["item"].ToString() + ",請輸入預測料號！');</script>");
                                checkerror = "1";
                            }
                        }


                        rs.MoveNext();
                    }

                    rs.Close();

                    if (checkerror.ToString() == "")
                    {
                        this.FlowFeedback1.Commit();
                    }

                    #endregion
                }
                else
                {
                    #region check內容(助理or子廠文管)

                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    rs.Open("SELECT  * FROM " + db1 + "cimi100_new where no= '" + this.FIELD_NO.Text.Trim() + "' ");
                    while (!rs.EOF)
                    {

                        //檢核是否有產品小類
                        if (rs["cate3"].ToString().Length == 0)
                        {
                            Response.Write("<script language='JavaScript'>window.alert('項次" + rs["item"].ToString() + ",請輸入產品小類！');</script>");
                            checkerror = "1";
                        }
                        //自製  來源碼=’M’ (ima08=’M’)     AND 分群碼(ima06)  in (4,5,8,9) 

                        if (rs["Source_code"].ToString() == "M" && (rs["group_code"].ToString() == "4" || rs["group_code"].ToString() == "5" || rs["group_code"].ToString() == "8" || rs["group_code"].ToString() == "9"))
                        {
                            if (rs["Homemade_code"].ToString().Length == 0)
                            {
                                Response.Write("<script language='JavaScript'>window.alert('項次" + rs["item"].ToString() + ",請輸入自製產品代號！');</script>");
                                checkerror = "1";
                            }
                        }
                        //預測料號 分群碼(ima06)  in (C,S,5,9,G)

                        if (rs["group_code"].ToString() == "C" || rs["group_code"].ToString() == "S" || rs["group_code"].ToString() == "5" || rs["group_code"].ToString() == "9" || rs["group_code"].ToString() == "G")
                        {
                            if (rs["f_partno"].ToString().Length == 0 || rs["f_component"].ToString().Length == 0)
                            {
                                Response.Write("<script language='JavaScript'>window.alert('項次" + rs["item"].ToString() + ",請輸入預測料號！');</script>");
                                checkerror = "1";
                            }
                        }

                        rs.MoveNext();
                    }

                    rs.Close();

                    if (checkerror.ToString() == "")
                    {
                        this.FlowFeedback1.Commit();
                    }

                    #endregion
                }
            }
            else
            {
                this.FlowFeedback1.Commit();

            }
        }
        protected void FIELD_product_class_SelectedIndexChanged(object sender, EventArgs e) //產品別change
        {
            this.FIELD_Group.Items.Clear();
            this.FIELD_Group.Items.Add(new ListItem("", ""));

            #region 產生集團碼

            string plantid = this.FIELD_plantid.Text.Trim();
            if (this.FIELD_plantid.Text.Trim() == "MAT") plantid = "MINAIK";
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("select distinct IMZ01,IMZ02 from  " + db1 + "cimi100_union a  " +
                    "left join  " + db3 + "MINAIK.dbo.IMZ_FILE b on union_group=b.imz01 COLLATE Chinese_Taiwan_Stroke_CS_AS    " +
                    " WHERE IMZ01 NOT IN ('Y','Z','V')  AND class_no='" + this.FIELD_product_class.SelectedItem.Value + "' and union_plantid='" + plantid.ToString() + "' order by imz01 ");
            while (!rs.EOF)
            {
                this.FIELD_Group.Items.Add(new ListItem(rs["IMZ01"].ToString() + ":" + rs["IMZ02"].ToString(), rs["IMZ01"].ToString()));
                rs.MoveNext();
            }

            rs.Close();

            #endregion
        }
        protected void FIELD_Group_SelectedIndexChanged(object sender, EventArgs e)  //集團碼change
        {
            #region  預設代出集團碼基本資料

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("SELECT  IMZ01,IMZ08,IMZ24,IMZ25 FROM " + db3 + "MINAIK.dbo.IMZ_FILE where imz01='" + this.FIELD_Group.SelectedItem.Value + "'  ");
            if (!rs.EOF)
            {
                if (rs["IMZ25"].ToString() != "") this.FIELD_Unit.SelectedValue = rs["IMZ25"].ToString();
                if (rs["IMZ24"].ToString() == "Y") this.FIELD_IQC.Checked = true; else this.FIELD_IQC.Checked = false;
                if (rs["IMZ08"].ToString() != "") this.FIELD_Source_code.SelectedValue = rs["IMZ08"].ToString();
            }
            rs.Close();

            #endregion


            #region  產生交易方式

            this.FIELD_Group2.Items.Clear();
            this.FIELD_Group2.Items.Add(new ListItem("", ""));

            string plantid = this.FIELD_plantid.Text.Trim();
            if (this.FIELD_plantid.Text.Trim() == "MAT") plantid = "MINAIK";  //預設產品別
            rs.Open(" select distinct b.bass_no bass_no,name from " + db1 + "cimi100_union a   " +
            " left join " + db1 + "cimi100_base b on b.class_no='Transaction_class' and bass_no=union_transaction " +
            " where a.class_no='" + this.FIELD_product_class.SelectedItem.Value + "' and union_group='" + this.FIELD_Group.SelectedItem.Value + "'  and union_plantid='" + plantid.ToString() + "' ");

            while (!rs.EOF)
            {
                this.FIELD_Group2.Items.Add(new ListItem(rs["bass_no"].ToString() + ":" + rs["name"].ToString(), rs["bass_no"].ToString()));
                rs.MoveNext();
            }
            rs.Close();

            #endregion

        }

        protected void FIELD_Group2_SelectedIndexChanged(object sender, EventArgs e)
        {
            #region  產生編碼原則

            this.FIELD_Coding_Class.Items.Clear();
            this.FIELD_Coding_Class.Items.Add(new ListItem("", ""));

            string plantid = this.FIELD_plantid.Text.Trim();
            if (this.FIELD_plantid.Text.Trim() == "MAT") plantid = "MINAIK";
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("   select distinct b.bass_no bass_no,name from " + db1 + "cimi100_union a  " +
                    "    left join " + db1 + "cimi100_base b on b.class_no='Coding_Class' and bass_no=union_coding " +
                    "    where a.class_no='" + this.FIELD_product_class.SelectedItem.Value + "' and union_group='" + this.FIELD_Group.SelectedItem.Value + "'  and union_plantid='" + plantid.ToString() + "' " +
                    "    and union_Transaction='" + this.FIELD_Group2.SelectedItem.Value + "'");
            while (!rs.EOF)
            {
                this.FIELD_Coding_Class.Items.Add(new ListItem(rs["bass_no"].ToString() + ":" + rs["name"].ToString(), rs["bass_no"].ToString()));
                rs.MoveNext();
            }
            rs.Close();

            #endregion

        }

        protected void FIELD_Coding_Class_SelectedIndexChanged(object sender, EventArgs e)  //編碼原則change
        {

            //divcontrol();
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", "divjs('" + this.FIELD_Coding_Class.Text + "');", true);

        }
        protected void Button_AddItem_Click(object sender, EventArgs e)
        {

            if (FIELD_check() == true)
            {
                table_field("insert");

            }

            gridviewchange(this.FIELD_NO.Text);


        }
        protected void Button_UpdateItem_Click(object sender, EventArgs e)
        {
            if (FIELD_check() == true)
            {
                table_field("update");

            }
            gridviewchange(this.FIELD_NO.Text);

        }



        void table_field(string data_style)
        {
            //拋轉的廠區
            string strPlantidLimmit = "";
            string plantid_list = "";
            for (int x = 0; x < this.p_plantid.Items.Count; x++)
            {
                if (p_plantid.Items[x].Selected == true)
                {
                    strPlantidLimmit = strPlantidLimmit + p_plantid.Items[x].Value + "@";
                    if (plantid_list == "")
                    {
                        plantid_list = "'" + p_plantid.Items[x].Value + "'";
                    }
                    else
                    {
                        plantid_list = plantid_list + ",'" + p_plantid.Items[x].Value + "'";
                    }
                }
            }

            SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
            object objola = onum.ExecuteScalar("select  ISNULL(MAX(item),'0')+1 item  from " + db1 + "cimi100_new where elapsedticks='" + this.PK1.Value.ToString() + "' ");
            string maxitem = objola.ToString();

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            if (data_style == "insert")
            {
                rs.Open("SELECT * FROM " + db1 + "cimi100_new WHERE 1=0");
                rs.Add();
                rs["item"] = maxitem.ToString();
                rs["elapsedTicks"] = this.PK1.Value.ToString();
            }
            else
            {
                rs.Open("SELECT * FROM " + db1 + "cimi100_new WHERE elapsedTicks='" + this.PK1.Value.ToString() + "' and item='" + this.rember_item.Value.ToString() + "' ");

            }
            rs["no"] = this.FIELD_NO.Text.Trim();
            rs["group_code"] = this.FIELD_Group.Text.Trim();
            rs["product_class"] = this.FIELD_product_class.Text.Trim();
            rs["cate1"] = this.FIELD_cate1.Text.Trim();
            rs["cate2"] = this.FIELD_cate2.Text.Trim();
            rs["cate3"] = Request.Form["cate3"].Trim();
            rs["cate3_2"] = Request.Form["cate3_2"].Trim();
            rs["idle"] = this.FIELD_idel.Text.Trim();
            rs["p_plantid"] = strPlantidLimmit.ToString().Trim();
            rs["component"] = Request.Form["component"].Trim().ToUpper();
            rs["dwg"] = Request.Form["DWG"].Trim();
            rs["f_partno"] = Request.Form["f_partno"].Trim();
            rs["f_component"] = Request.Form["f_component"].Trim();
            rs["f_dwg"] = Request.Form["f_dwg"].Trim();
            rs["unit"] = this.FIELD_Unit.Text.Trim();
            if (this.FIELD_HSF.Checked == true) rs["hsf"] = "Y"; else rs["hsf"] = "N";
            if (this.FIELD_IQC.Checked == true) rs["iqc"] = "Y"; else rs["iqc"] = "N";
            rs["source_code"] = this.FIELD_Source_code.Text.Trim();
            rs["homemade_code"] = Request.Form["homemade_code"].Trim();
            rs["homemade_code2"] = Request.Form["homemade_code2"].Trim();
            //rs["technology_code"] = Request.Form["Technology_code"].Trim();
            //rs["technology_code2"] = Request.Form["Technology_code2"].Trim();
            rs["coding_class"] = this.FIELD_Coding_Class.Text.Trim();
            rs["Customers_class"] = Request.Form["Customers_class"].Trim();
            rs["Customers_class2"] = Request.Form["Customers_class2"].Trim();
            rs["Model_class"] = Request.Form["Model_class"].Trim();
            rs["Model_class2"] = Request.Form["Model_class2"].Trim();
            rs["group_code2"] = this.FIELD_Group2.Text.Trim();

            rs["A1"] = this.FIELD_Group.Text.Trim();
            rs["A2"] = this.FIELD_Group2.Text.Trim();
            rs["A3"] = Request.Form["Customers_class"].Trim();
            rs["A3_2"] = Request.Form["Customers_class2"].Trim();
            rs["A4"] = this.FIELD_product_class.Text.Trim();
            rs["A5"] = "-";
            rs["A6"] = Request.Form["Model_class"].Trim();
            rs["A6_2"] = Request.Form["Model_class2"].Trim();
            rs["A7"] = Request.Form["A7"].Trim();
            rs["A7_2"] = Request.Form["A7_2"].Trim();
            rs["A8"] = this.A8.Text.Trim();
            rs["A9"] = this.A9.Text.Trim();

            rs["B1"] = this.FIELD_Group.Text.Trim();
            rs["B2"] = this.B2.Text.Trim();
            rs["B3"] = this.FIELD_product_class.Text.Trim();
            rs["B4"] = this.B4.Text.Trim();

            rs["C1"] = this.FIELD_Group.Text.Trim();
            rs["C2"] = this.C2.Text.Trim();

            rs["D1"] = this.FIELD_Group.Text.Trim();
            rs["D2"] = this.D2.Text.Trim();

            rs["E1"] = this.FIELD_Group.Text.Trim();
            rs["E2"] = Request.Form["Customers_class"].Trim();
            rs["E2_2"] = Request.Form["Customers_class2"].Trim();
            rs["E3"] = Request.Form["Model_class"].Trim();
            rs["E3_2"] = Request.Form["Model_class2"].Trim();
            rs["E5"] = this.E5.Text.Trim();

            rs["F1"] = this.FIELD_Group.Text.Trim();
            rs["F2"] = Request.Form["Customers_class"].Trim();
            rs["F2_2"] = Request.Form["Customers_class2"].Trim();
            rs["F3"] = Request.Form["Model_class"].Trim();
            rs["F3_2"] = Request.Form["Model_class2"].Trim();
            rs["F4"] = this.F4.Text.Trim();
            rs["F5"] = this.F5.Text.Trim();

            rs["G1"] = this.FIELD_Group.Text.Trim();
            rs["G2"] = Request.Form["Model_class"].Trim();
            rs["G2_2"] = Request.Form["Model_class2"].Trim();
            rs["G3"] = Request.Form["G3"].Trim();
            rs["G3_2"] = Request.Form["G3_2"].Trim();
            rs["G4"] = this.G4.Text.Trim();
            rs["G5"] = this.G5.Text.Trim();
            rs["G6"] = this.G6.Text.Trim();

            rs["H1"] = this.FIELD_Group.Text.Trim();
            rs["H2"] = this.H2.Text.Trim();

            rs["I1"] = this.FIELD_Group.Text.Trim();
            rs["I2"] = this.FIELD_Group2.Text.Trim();
            rs["I3"] = "M";
            rs["I4"] = "0";
            rs["I5"] = this.I5.Text.Trim();
            rs["I6"] = "-";
            rs["I7"] = this.I7.Text.Trim();

            rs["J1"] = this.FIELD_Group.Text.Trim();
            rs["J2"] = this.FIELD_Group2.Text.Trim();
            rs["J3"] = this.J3.Text.Trim();
            rs["J4"] = "-";
            rs["J5"] = this.J5.Text.Trim();
            rs["J6"] = this.J6.Text.Trim();

            rs["K1"] = this.FIELD_Group.Text.Trim();
            rs["K2"] = this.FIELD_Group2.Text.Trim();
            rs["K3"] = "C";
            rs["K4"] = this.K4.Text.Trim();
            rs["K5"] = "-";
            rs["K7"] = this.K7.Text.Trim();

            rs["L1"] = this.FIELD_Group.Text.Trim();
            rs["L2"] = this.FIELD_Group2.Text.Trim();
            rs["L3"] = this.L3.Text.Trim();
            rs["L4"] = this.L4.Text.Trim();
            rs["L5"] = this.L5.Text.Trim();
            rs["L6"] = this.L6.Text.Trim();
            rs["L7"] = this.L7.Text.Trim();

            rs["M1"] = this.FIELD_Group.Text.Trim();
            rs["M2"] = this.FIELD_Group2.Text.Trim();
            rs["M3"] = this.M3.Text.Trim();
            rs["M4"] = "EN";
            rs["M5"] = this.M5.Text.Trim();
            rs["M6"] = this.M6.Text.Trim();
            rs["M7"] = this.M7.Text.Trim();
            rs["M8"] = this.M8.Text.Trim();

            rs["N1"] = this.FIELD_Group.Text.Trim();
            rs["N2"] = this.FIELD_Group2.Text.Trim();
            rs["N3"] = this.N3.Text.Trim();
            rs["N4"] = this.N4.Text.Trim();
            rs["N5"] = this.N5.Text.Trim();
            rs["N6"] = this.N6.Text.Trim();
            rs["N7"] = this.N7.Text.Trim();
            rs["N8"] = this.N8.Text.Trim();

            rs["O1"] = this.FIELD_Group.Text.Trim();
            rs["O2"] = this.FIELD_Group2.Text.Trim();
            rs["O3"] = this.O3.Text.Trim();
            rs["O4"] = "0000";
            rs["O5"] = this.O5.Text.Trim();
            rs["O6"] = "00";

            rs["P1"] = this.FIELD_Group.Text.Trim();
            rs["P2"] = this.FIELD_Group2.Text.Trim();
            rs["P3"] = this.P3.Text.Trim();
            rs["P4"] = "-";
            rs["P5"] = this.P5.Text.Trim();
            rs["P6"] = this.P6.Text.Trim();
            rs["P7"] = "00";

            rs["Q1"] = this.FIELD_Group.Text.Trim();
            rs["Q2"] = this.Q2.Text.Trim();
            rs["Q3"] = this.Q3.Text.Trim();
            rs["Q4"] = this.Q4.Text.Trim();
            rs["Q5"] = this.Q5.Text.Trim();
            rs["Q6"] = this.Q6.Text.Trim();
            rs["Q7"] = "-";

            rs["R1"] = this.FIELD_Group.Text.Trim();
            rs["R2"] = Request.Form["Customers_class"].Trim();
            rs["R2_2"] = Request.Form["Customers_class2"].Trim();
            rs["R3"] = Request.Form["Model_class"].Trim();
            rs["R3_2"] = Request.Form["Model_class2"].Trim();
            rs["R4"] = this.R4.Text.Trim();
            rs["R5"] = this.R5.Text.Trim();

            rs["S1"] = this.FIELD_Group.Text.Trim();
            rs["S2"] = Request.Form["Model_class"].Trim();
            rs["S2_2"] = Request.Form["Model_class2"].Trim();
            rs["S3"] = Request.Form["S3"].Trim();
            rs["S3_2"] = Request.Form["S3_2"].Trim();
            rs["S4"] = "-";
            rs["S5"] = this.S5.Text.Trim();
            rs["S6"] = this.S6.Text.Trim();

            rs["T1"] = this.FIELD_Group.Text.Trim();
            rs["T2"] = Request.Form["Customers_class"].Trim();
            rs["T2_2"] = Request.Form["Customers_class2"].Trim();
            rs["T3"] = Request.Form["Model_class"].Trim();
            rs["T3_2"] = Request.Form["Model_class2"].Trim();
            rs["T4"] = this.T4.Text.Trim();
            rs["T5"] = this.T5.Text.Trim();

            rs["U1"] = this.FIELD_Group.Text.Trim();
            rs["U2"] = Request.Form["Customers_class"].Trim();
            rs["U2_2"] = Request.Form["Customers_class2"].Trim();
            rs["U3"] = this.U3.Text.Trim();
            rs["U4"] = "-";

            rs["V1"] = this.FIELD_Group.Text.Trim();
            rs["V2"] = this.FIELD_Group2.Text.Trim();
            rs["V3"] = "7";
            rs["V4"] = this.V4.Text.Trim();
            rs["V5"] = this.V5.Text.Trim();

            rs["W1"] = this.FIELD_Group.Text.Trim();
            rs["W2"] = this.W2.Text.Trim();

            rs["X1"] = this.FIELD_Group.Text.Trim();
            rs["X2"] = this.FIELD_Group2.Text.Trim();
            rs["X3"] = this.X3.Text.Trim();
            rs["X4"] = this.X4.Text.Trim();
            rs["X5"] = this.X5.Text.Trim();
            rs["X6"] = this.X6.Text.Trim();
            rs["X7"] = this.X7.Text.Trim();
            rs["X8"] = "-W";

            rs["Y1"] = this.FIELD_Group.Text.Trim();
            rs["Y2"] = this.FIELD_Group2.Text.Trim();
            rs["Y3"] = this.Y3.Text.Trim();
            rs["Y4"] = "EN";
            rs["Y5"] = this.Y5.Text.Trim();
            rs["Y6"] = this.Y6.Text.Trim();
            rs["Y7"] = this.Y7.Text.Trim();
            rs["Y8"] = this.Y8.Text.Trim();
            rs["Y9"] = "-W";

            rs["Z1"] = this.FIELD_Group.Text.Trim();
            rs["Z2"] = this.FIELD_Group2.Text.Trim();
            rs["Z3"] = this.Z3.Text.Trim();
            rs["Z4"] = this.Z4.Text.Trim();
            rs["Z5"] = this.Z5.Text.Trim();
            rs["Z6"] = this.Z6.Text.Trim();
            rs["Z7"] = this.Z7.Text.Trim();
            rs["Z8"] = this.Z8.Text.Trim();
            rs["Z9"] = "-W";

            rs["AA1"] = this.FIELD_Group.Text.Trim();
            rs["AA2"] = this.FIELD_Group2.Text.Trim();
            rs["AA3"] = Request.Form["Customers_class"].Trim();
            rs["AA3_2"] = Request.Form["Customers_class2"].Trim();
            rs["AA4"] = this.FIELD_product_class.Text.Trim();
            rs["AA5"] = "-";
            rs["AA6"] = Request.Form["Model_class"].Trim();
            rs["AA6_2"] = Request.Form["Model_class2"].Trim();
            rs["AA7"] = Request.Form["AA7"].Trim();
            rs["AA7_2"] = Request.Form["AA7_2"].Trim();
            rs["AA8"] = this.AA8.Text.Trim();
            rs["AA9"] = this.AA9.Text.Trim();
            rs["AA10"] = this.AA10.Text.Trim();

            rs["AB1"] = this.FIELD_Group.Text.Trim();
            rs["AB2"] = this.FIELD_Group2.Text.Trim();
            rs["AB3"] = Request.Form["Customers_class"].Trim();
            rs["AB3_2"] = Request.Form["Customers_class2"].Trim();
            rs["AB4"] = this.FIELD_product_class.Text.Trim();
            rs["AB5"] = "-";
            rs["AB6"] = this.AB6.Text.Trim();
            rs["AB7"] = "000";

            rs["AC1"] = this.FIELD_Group.Text.Trim();
            rs["AC2"] = this.AC2.Text.Trim();
            rs["AC3"] = this.FIELD_product_class.Text.Trim();
            rs["AC4"] = this.AC4.Text.Trim();
            rs["AC6"] = this.AC6.Text.Trim();
            rs["AC7"] = this.AC7.Text.Trim();

            rs["remark"] = this.FIELD_remark.Text.Trim();

            rs["partno"] = this.FIELD_partno.Text.Trim();
            if (this.FIELD_ERP_identical.Checked == true) rs["ERP_identical"] = "Y"; else rs["ERP_identical"] = "N";

            rs.Update();
            rs.Close();


            this.FIELD_product_class.SelectedIndex = 0;
            this.FIELD_Coding_Class.SelectedIndex = 0;
            this.FIELD_Group.SelectedIndex = 0;
            this.FIELD_Group2.SelectedIndex = 0;
            this.FIELD_Unit.SelectedIndex = 0;
            this.FIELD_idel.SelectedIndex = 0;
            this.FIELD_cate1.SelectedIndex = 0;
            this.FIELD_cate2.SelectedIndex = 0;
            this.FIELD_Source_code.SelectedIndex = 0;


            this.FIELD_ERP_identical.Checked = false;
            this.FIELD_IQC.Checked = false;
            this.FIELD_remark.Text = "";

            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1",
                "$('#component').attr('value',''); " +
                "$('#DWG').attr('value',''); " +
                "$('#Customers_class').attr('value',''); " +
                "$('#Customers_class2').attr('value',''); " +
                "$('#Model_class').attr('value',''); " +
                "$('#Model_class2').attr('value',''); " +
                "$('#cate3').attr('value',''); " +
                "$('#cate3_2').attr('value',''); " +
                "$('#f_partno').attr('value',''); " +
                "$('#f_component').attr('value',''); " +
                "$('#f_dwg').attr('value',''); " +
                "$('#Homemade_code').attr('value',''); " +
                "$('#Homemade_code2').attr('value',''); " +
                //"$('#Technology_code').attr('value',''); " +
                //"$('#Technology_code2').attr('value',''); " +
                "divjs_2();"
             , true);
            gridviewchange(this.FIELD_NO.Text);

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                e.Row.Cells[1].Attributes.Add("onclick", "onGridViewRowSelected('" + e.Row.DataItemIndex + "')");
                //ScriptManager.RegisterStartupScript(UpdatePanel3, this.GetType(), "bind", "onGridViewRowSelected('" + e.Row.DataItemIndex + "')", true);
                //ScriptManager.RegisterStartupScript(UpdatePanel4, this.GetType(), "bind", "onGridViewRowSelected('" + e.Row.DataItemIndex + "')", true);

            }
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("select * from " + db1 + "cimi100_main where id= '" + Request.QueryString["id"] + "' ");
            if (!rs.EOF)
            {
                if (rs["status"].ToString().Trim() == "Y" || rs["status"].ToString().Trim() == "OK")
                {
                    e.Row.Cells[0].Enabled = false;
                    e.Row.Cells[2].Enabled = false;
                }
                else
                {
                    e.Row.Cells[0].Enabled = true;
                    e.Row.Cells[2].Enabled = true;
                }
            }

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)  //copy item
        {
            if (e.CommandName == "Add")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = GridView1.Rows[index];

                this.Label1.Text = row.Cells[4].Text;

                SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                object objola = onum.ExecuteScalar("select  ISNULL(MAX(item),'0')+1 item  from " + db1 + "cimi100_new where elapsedticks='" + this.PK1.Value.ToString() + "' ");
                string maxitem = objola.ToString();

                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet();
                rss.ExecuteNonQuery("insert into " + db1 + "cimi100_new " +
                                    "SELECT      no, '" + maxitem.ToString() + "', elapsedTicks, group_code, product_class, cate1, cate2, cate3, cate3_2, idle, p_plantid, partno, component, dwg, f_partno, f_component, f_dwg, unit, " +
                                    "                       hsf, source_code, homemade_code, homemade_code2, technology_code, technology_code2, iqc, erp_identical, coding_class, Customers_class, Customers_class2,  " +
                                    "                      Model_class, Model_class2, group_code2, A1, A2, A3, A3_2, A4, A5, A6, A6_2, A7, A7_2, A8, A9, B1, B2, B3, B4, B5, C1, C2, C3, D1, D2, E1, E2, E2_2, E3, E3_2, E4, E5,  " +
                                    "                      F1, F2, F2_2, F3, F3_2, F4, F5, G1, G2, G2_2, G3, G3_2, G4, G5, G6, H1, H2, I1, I2, I3, I4, I5, I6, I7, I8, J1, J2, J3, J4, J5, J6, K1, K2, K3, K4, K5, K6, K7, L1, L2, L3, L4, L5, " +
                                    "                       L6, L7, M1, M2, M3, M4, M5, M6, M7, M8, N1, N2, N3, N4, N5, N6, N7, N8, O1, O2, O3, O4, O5, O6, P1, P2, P3, P4, P5, P6, P7, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, R1, R2,  " +
                                    "                      R2_2, R3, R3_2, R4, R5, S1, S2, S2_2, S3, S3_2, S4, S5, S6, T1, T2, T2_2, T3, T3_2, T4, T5, U1, U2, U2_2, U3, U4, U5, V1, V2, V3, V4, V5, W1, W2, X1, X2, X3, X4, X5,  " +
                                    "                      X6, X7, X8, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Z1, Z2, Z3, Z4, Z5, Z6, Z7, Z8, Z9, AA1, AA2, AA3, AA3_2, AA4, AA5, AA6, AA6_2, AA7, AA7_2, AA8, AA9, AA10 " +
                                    "                      , AB1, AB2, AB3, AB4, AB5, AB6, AB7, AB8, AC1, AC2, AC3, AB3_2, AC4, AC5, AC6, AC7,remark " +
                                    "FROM         " + db1 + "cimi100_new where elapsedticks='" + this.PK1.Value + "' and item='" + row.Cells[4].Text + "'  ");

                gridviewchange(this.FIELD_NO.Text);
            }

            if (e.CommandName == "editA")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                rs.Open("SELECT  * FROM " + db1 + "cimi100_new where elapsedticks='" + this.PK1.Value.ToString() + "' and item='" + row.Cells[4].Text + "'");  //預設廠區,使用者
                if (!rs.EOF)
                {

                    #region check 預測料號是否存在

                    if (rs["f_partno"].ToString().Length != 0)
                    {
                        SmoothEnterprise.Database.DataSet rsf = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rsf.Open("select    TC_AZF01,TC_AZF02,TC_AZF03 from   " + db3 + "MINAIK.dbo.TC_AZF_FILE where tc_azf01='"+rs["f_partno"].ToString()+"' ");
                        if (!rsf.EOF)
                        {
                           
                        }
                        else
                        {
                            this.f_partno_check.Text = "此預測料號不存在系統,請自行新增";

                        }
                    }


                    #endregion

                    #region check 產品小類是否存在

                    if (rs["cate3"].ToString().Length != 0)
                    {
                        SmoothEnterprise.Database.DataSet rsf = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rsf.Open("select    TC_OBC01,TC_OBC02 from   " + db3 + "MINAIK.dbo.TC_OBC_FILE where TC_OBC01='" + rs["cate3"].ToString() + "' ");
                        if (!rsf.EOF)
                        {

                        }
                        else
                        {
                            this.cate3_check.Text = "此產品小類不存在系統,請自行新增";

                        }
                    }


                    #endregion




                    //divcontrol(rs["Coding_Class"].ToString());
                    //ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", "divjs('" + rs["Coding_Class"].ToString() + "');", true);


                }
                rs.Close();

                // ScriptManager.RegisterClientScriptBlock(UpdatePanel4, typeof(UpdatePanel), "aa1", " $('#component').attr('value','AAA');$('#Customers_class').attr('value','01');      ", true);

            }

        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            gridviewchange(this.FIELD_NO.Text);
        }

        void gridviewchange(string aa)  //change girdview
        {


            SqlDataSource1.SelectCommand =
              "select no, item, elapsedTicks, group_code, product_class, cate1, cate2, cate3, cate3_2, idle,CASE  WHEN p_plantid ='' THEN p_plantid   " +
              "ELSE  SUBSTRING(REPLACE(p_plantid,'@', ','), 0, LEN(p_plantid)) END  p_plantid, partno, component, dwg, f_partno, f_component, f_dwg, unit, " +
              " hsf, source_code, homemade_code, homemade_code2, technology_code, technology_code2, iqc, erp_identical, coding_class, Customers_class, Customers_class2,  " +
              "Model_class, Model_class2, group_code2, A1, A2, A3, A3_2, A4, A5, A6, A6_2, A7, A7_2, A8, A9, B1, B2, B3, B4, B5, C1, C2, C3, D1, D2, E1, E2, E2_2, E3, E3_2, E4, E5,  " +
              "F1, F2, F2_2, F3, F3_2, F4, F5, G1, G2, G2_2, G3, G3_2, G4, G5, G6, H1, H2, I1, I2, I3, I4, I5, I6, I7, I8, J1, J2, J3, J4, J5, J6, K1, K2, K3, K4, K5, K6, K7, L1, L2, L3, L4, L5, " +
              "L6, L7, M1, M2, M3, M4, M5, M6, M7, M8, N1, N2, N3, N4, N5, N6, N7, N8, O1, O2, O3, O4, O5, O6, P1, P2, P3, P4, P5, P6, P7, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, R1, R2,  " +
              "R2_2, R3, R3_2, R4, R5, S1, S2, S2_2, S3, S3_2, S4, S5, S6, T1, T2, T2_2, T3, T3_2, T4, T5, U1, U2, U2_2, U3, U4, U5, V1, V2, V3, V4, V5, W1, W2, X1, X2, X3, X4, X5,  " +
              "X6, X7, X8, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Z1, Z2, Z3, Z4, Z5, Z6, Z7, Z8, Z9, AA1, AA2, AA3, AA3_2, AA4, AA5, AA6, AA6_2, AA7, AA7_2, AA8, AA9, AA10, " +
              " AB1, AB2, AB3, AB4, AB5, AB6, AB7, AB8, AC1, AC2, AC3, AB3_2, AC4, AC5, AC6, AC7, " +
              "imz02,c.name cname,d.name dname,e.name ename,remark " +
              "from " + db1 + "cimi100_new a " +
              "left join " + db3 + "MINAIK.dbo.IMZ_FILE b on a.group_code=imz01 COLLATE Chinese_Taiwan_Stroke_CS_AS " +
              "left join " + db1 + "cimi100_base c on c.class_no='Coding_Class' and a.Coding_Class=c.bass_no " +
              "left join " + db1 + "cimi100_base d on d.class_no='Product_class' and a.product_class=d.bass_no " +
              "left join " + db1 + "cimi100_base e on e.class_no='Transaction_class' and a.group_code2=e.bass_no " +
              "where a.no='" + this.FIELD_NO.Text + "'  order  by CONVERT(int,item)  ";

            // this.PK1.Value = SqlDataSource1.SelectCommand.ToString();

            this.GridView1.DataBind();

        }

        public void EmptyTextBox(ControlCollection controls)  //欄位清空
        {
            foreach (Control c in controls)
            {
                if (c.Controls.Count > 0)
                {
                    // 递归
                    this.EmptyTextBox(c.Controls);
                }
                else if (c is TextBox)
                {
                    // 服务器控件
                    ((TextBox)c).Text = "";
                }
                else if (c is HtmlInputText)
                {
                    // HTML 控件
                    if (((HtmlInputText)c).ID != "PK1") ((HtmlInputText)c).Value = "";
                }
                else if (c is DropDownList)
                {
                    ((DropDownList)c).Text = "";
                }
                else if (c is CheckBox)
                {
                    ((CheckBox)c).Checked = false;
                }
            }
        }



        //public void divcontrol()
        //{


        //for (int i = 1; i <= 29; i++)  //編碼原則div皆隱形
        //{
        //    HtmlGenericControl div = new HtmlGenericControl();
        //    div = (HtmlGenericControl)UpdatePanel1.FindControl("ww" + i.ToString());
        //    div.Style.Add("display", "block");

        //}

        //if (this.FIELD_Coding_Class.Text != "")
        //{
        //    HtmlGenericControl div = new HtmlGenericControl();
        //    div = (HtmlGenericControl)UpdatePanel1.FindControl("ww" + this.FIELD_Coding_Class.Text);
        //    div.Style.Add("display", "none");

        //}

        //HtmlGenericControl div = new HtmlGenericControl();
        //for (int i = 1; i <= 29; i++)  //先全部隱形
        //{
        //    div = (HtmlGenericControl)UpdatePanel14.FindControl("ww" + i.ToString());
        //    div.Style.Add("display", "none");


        //}
        //if (this.FIELD_Coding_Class.Text != "")
        //{
        //    int coding_no = int.Parse(this.FIELD_Coding_Class.Text.ToString());                 //視編碼原則顯示
        //    div = (HtmlGenericControl)UpdatePanel14.FindControl("ww" + aa.ToString());
        //    div.Style.Add("display", "block");
        //}

        //}







        private bool FIELD_check()
        {

            //拋轉的廠區
            string strPlantidLimmit = "";
            string plantid_list = "";
            for (int x = 0; x < this.p_plantid.Items.Count; x++)
            {
                if (p_plantid.Items[x].Selected == true)
                {
                    strPlantidLimmit = strPlantidLimmit + p_plantid.Items[x].Value + "@";
                    if (plantid_list == "")
                    {
                        plantid_list = "'" + p_plantid.Items[x].Value + "'";
                    }
                    else
                    {
                        plantid_list = plantid_list + ",'" + p_plantid.Items[x].Value + "'";
                    }
                }
            }


            if (FIELD_product_class.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('產品別不得為空');", true);
                return false;
            }
            else if (FIELD_Group.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "a1", " alert('分群碼不得為空');", true);
                return false;
            }
            else if (FIELD_Group2.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "a2", " alert('交易方式不得為空');", true);
                return false;
            }
            else if (FIELD_Coding_Class.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "a3", " alert('副分群碼不得為空');", true);
                return false;
            }
            else if (FIELD_Unit.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "a4", " alert('庫存單位不得為空');", true);
                return false;
            }
            else if (Request.Form["component"].Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "a5", " alert('品名不得為空');", true);
                return false;
            }
            else if (FIELD_cate1.Text.Length == 0 || FIELD_cate2.Text.Length == 0 || FIELD_idel.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "a6", " alert('產品大/中類及閒置分群不得為空');", true);
                return false;
            }
            else if (strPlantidLimmit.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "a6", " alert('至少需選擇一個生產廠別');", true);
                return false;
            }
            else if (Encoding.GetEncoding("utf-8").GetBytes(Request.Form["component"]).Length >= 60 || Encoding.GetEncoding("utf-8").GetBytes(Request.Form["dwg"]).Length >= 60)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "a5", " alert('品名或規格長度不得大於60,目前品名長度為" + Encoding.GetEncoding("utf-8").GetBytes(Request.Form["component"]).Length + ",規格長度為" + Encoding.GetEncoding("big5").GetBytes(Request.Form["dwg"]).Length + "');", true);
                return false;
            }

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("SELECT  * FROM " + db3 + "MINAIK.dbo.IMA_FILE where IMA01='" + this.FIELD_partno.Text.Trim() + "'  ");
            if (!rs.EOF)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('請注意!ERP有相同料號');", true);
                this.FIELD_ERP_identical.Checked = true;
            }
            rs.Close();


            switch (this.FIELD_Coding_Class.Text)
            {

                case "1":
                    if (Request.Form["Customers_class"].Length == 0 || Request.Form["Model_class"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶別,機種別不得為空');", true);
                        return false;
                    }
                    else if (Request.Form["A7"].Length == 0 || this.A9.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('零件別,料別不得為空');", true);
                        return false;

                    }
                    break;

                case "2":
                    if (this.B2.Text.Length == 0 || this.B4.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('包材分類,是否為硬碟不得為空');", true);
                        return false;
                    }
                    break;

                case "3":
                    if (this.C2.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('消耗分類不得為空');", true);
                        return false;
                    }
                    break;

                case "4":
                    if (this.D2.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶圖號不得為空');", true);
                        return false;
                    }
                    break;

                case "5":
                    if (Request.Form["Customers_class"].Length == 0 || Request.Form["Model_class"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶別,機種別不得為空');", true);
                        return false;
                    }
                    else if (this.E5.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('部門碼不得為空');", true);
                        return false;
                    }
                    break;

                case "6":
                    if (Request.Form["Customers_class"].Length == 0 || Request.Form["Model_class"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶別,機種別不得為空');", true);
                        return false;
                    }
                    else if (this.F5.Text.Length != 2)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('設變流水碼不得為空,且需2碼');", true);
                        return false;
                    }
                    break;

                case "7":
                    if (Request.Form["Model_class"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('機種別不得為空');", true);
                        return false;
                    }
                    else if (Request.Form["G3"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('零件不得為空');", true);
                        return false;
                    }
                    else if (this.G4.Text.Length == 0 || this.G5.Text.Length == 0 || this.G6.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('版次/料別/套別不得為空');", true);
                        return false;
                    }
                    break;

                case "8":
                    if (this.H2.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶圖號不得為空');", true);
                        return false;
                    }
                    break;

                case "9":
                    if (this.I5.Text.Length == 0 || this.I7.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('原料產品別/原料分類不得為空');", true);
                        return false;
                    }
                    break;

                case "10":
                    if (this.J3.Text.Length == 0 || this.J5.Text.Length != 2 || this.J6.Text.Length != 4)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('MATC產品別/寬度/厚度不得為空,且寬度為2碼,厚度為4碼');", true);
                        return false;
                    }
                    break;

                case "11":
                    if (this.K4.Text.Length == 0 || this.K7.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('化學分類/型號流水碼不得為空');", true);
                        return false;
                    }
                    break;

                case "12":
                    if (this.L3.Text.Length == 0 || this.L4.Text.Length == 0 || this.L5.Text.Length != 4 || this.L6.Text.Length != 3 || this.L7.Text.Length != 2)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空,且厚度為4碼,料寬3碼,硬度2碼');", true);
                        return false;
                    }
                    break;

                case "13":
                    if (this.M3.Text.Length == 0 || this.M5.Text.Length == 0 || this.M6.Text.Length != 4 || this.M7.Text.Length != 3 || this.M8.Text.Length != 2)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空,且厚度為4碼,料寬3碼,硬度2碼');", true);
                        return false;
                    }
                    break;

                case "14":
                    if (this.N3.Text.Length == 0 || this.N4.Text.Length == 0 || this.N5.Text.Length == 0 || this.N6.Text.Length != 4 || this.N7.Text.Length != 3 || this.N8.Text.Length != 2)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空,且厚度為4碼,料寬3碼,硬度2碼');", true);
                        return false;
                    }
                    break;

                case "15":
                    if (this.O3.Text.Length == 0 || this.O5.Text.Length != 3)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空,且料寬3碼');", true);
                        return false;
                    }
                    break;

                case "16":
                    if (this.P3.Text.Length == 0 || this.P5.Text.Length != 4 || this.P6.Text.Length != 3)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空,且厚度為4碼,料寬3碼');", true);
                        return false;
                    }
                    break;

                case "17":
                    if (this.Q2.Text.Length == 0 || this.Q3.Text.Length == 0 || this.Q4.Text.Length == 0 || this.Q5.Text.Length == 0 || this.Q6.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空');", true);
                        return false;
                    }
                    break;

                case "18":
                    if (Request.Form["Customers_class"].Length == 0 || Request.Form["Model_class"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶別,機種別不得為空');", true);
                        return false;
                    }
                    else if (this.R5.Text.Length != 2)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('設變流水碼不得為空,且為2碼');", true);
                        return false;
                    }

                    break;

                case "19":
                    if (Request.Form["Model_class"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('機種別不得為空');", true);
                        return false;
                    }
                    else if (Request.Form["S3"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('零件不得為空');", true);
                        return false;
                    }
                    else if (this.S5.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('設變流水碼不得為空');", true);
                        return false;

                    }
                    else if (this.S6.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('套別不得為空');", true);
                        return false;

                    }

                    break;

                case "20":
                    if (Request.Form["Customers_class"].Length == 0 || Request.Form["Model_class"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶別,機種別不得為空');", true);
                        return false;
                    }
                    else if (this.T5.Text.Length != 2)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('設變流水碼不得為空,且為2碼');", true);
                        return false;
                    }

                    break;

                case "21":
                    if (Request.Form["Customers_class"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶別不得為空');", true);
                        return false;
                    }
                    else if (this.U3.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('產品種類不得為空');", true);
                        return false;
                    }

                    break;

                case "22":
                    if (this.V4.Text.Length == 0 || this.V5.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空');", true);
                        return false;
                    }


                    break;

                case "23":
                    if (this.W2.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶圖號or規格不得為空');", true);
                        return false;
                    }
                    break;

                case "24":
                    if (this.X3.Text.Length == 0 || this.X4.Text.Length == 0 || this.X5.Text.Length != 4 || this.X6.Text.Length != 3 || this.X7.Text.Length != 2)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空,且厚度為4碼,料寬3碼,硬度2碼');", true);
                        return false;
                    }
                    break;

                case "25":
                    if (this.Y3.Text.Length == 0 || this.Y5.Text.Length == 0 || this.Y6.Text.Length != 4 || this.Y7.Text.Length != 3 || this.Y8.Text.Length != 2)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空,且厚度為4碼,料寬3碼,硬度2碼');", true);
                        return false;
                    }
                    break;

                case "26":
                    if (this.Z3.Text.Length == 0 || this.Z4.Text.Length == 0 || this.Z5.Text.Length == 0 || this.Z6.Text.Length != 4 || this.Z7.Text.Length != 3 || this.Z8.Text.Length != 2)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空,且厚度為4碼,料寬3碼,硬度2碼');", true);
                        return false;
                    }
                    break;

                case "27":
                    if (Request.Form["Customers_class"].Length == 0 || Request.Form["Model_class"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶別,機種別不得為空');", true);
                        return false;
                    }
                    else if (Request.Form["AA7"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('零件別不得為空');", true);
                        return false;
                    }
                    else if (this.AA8.Text.Length != 2 || this.AA9.Text.Length != 2 || this.AA10.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空,且版次/供應商應為2碼');", true);
                        return false;
                    }
                    break;

                case "28":

                    if (Request.Form["Customers_class"].Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('客戶別不得為空');", true);
                        return false;
                    }
                    else if (this.AB6.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('塑膠種類不得為空');", true);
                        return false;

                    }
                    break;

                case "29":
                    if (this.AC2.Text.Length == 0 || this.AC4.Text.Length == 0 || this.AC6.Text.Length == 0 || this.AC7.Text.Length == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('編碼資料中欄位不得為空,且厚度為3碼,料寬3碼,硬度2碼');", true);
                        return false;
                    }
                    else if (this.AC6.Text.Length != 2)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('版次需為2碼');", true);
                        return false;
                    }
                    break;

            }
            return true;
        }
        protected void FlowFeedback1_FeedbackComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
        {
            try
            {
                SmoothEnterprise.Web.UI.HTMLControl.InputText it;
                object obj = this.FlowFeedback1.ReplyView.FindControl("Input_Comment");
                it = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj;
                e["Flow_Comment"] = it.Text;
                //電子簽章呈現---------------------------------------------------------------------
                SmoothEnterprise.Web.UI.HTMLControl.InputText it3;
                object obj3 = this.FlowFeedback1.ReplyView.FindControl("InputText3");
                it3 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj3;
                it3.Text = this.CurrentUser.LogonID;
                e["InputText3"] = it3.Text;

                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
               "RedirectAfterCommit",
               "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");

            }
            catch { }

        }
        protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
        {
            if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
            {

                _NotifyReview = true;
                e.NextNode = e.FlowNode.DefaultNode();
                e.NextNode.ReviewerURL = "/ERP_Cimi100/Cimi100_newView.aspx";
            }

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

                Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", flowname.ToString(), this.FIELD_NO.Text, rs["name"].ToString(), rs["email"].ToString(), "http://eip.minaik.com.tw/ERP_Cimi100/Cimi100_newView.aspx?id=" + Request.QueryString["id"], "--申請人員:" + rs["name"].ToString() + "<BR>--廠區:" + this.FIELD_plantid.Text + "");
                rs.MoveNext();

            }
            rs.Close();

        }

        protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
        {

            flowname = "料件新增系統";

            SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rss.Open("select no,add_user aid,b.email aemail,b.name aname,c.id bid,c.email bemail,c.name baname from  " + db1 + "cimi100_main a  left join  " + db2 + "dguser b on a.add_user=b.id " +
                     "left join " + db2 + "dguser c on a.dcc=c.id  where a.id='" + Request.QueryString["id"] + "'   ");
            if (!rss.EOF)
            {
                if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete)  //完成審核
                {
                    SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rb.Open("SELECT * FROM " + db1 + "cimi100_main WHERE id='" + Request.QueryString["id"] + "'  ");
                    if (!rb.EOF)
                    {
                        rb["STATUS"] = "OK";
                        rb.Update();

                        gridviewchange(this.FIELD_NO.Text);

                        String ques;

                        
                        if (this.FIELD_plantid.Text.Trim() != "MAT") { MailAddress bcc = new MailAddress(rss["bemail"].ToString()); }
                        
                        MailMessage message = new MailMessage();

                        ques = "您好:" + "<br>" +
                                flowname + "已完成審核, 資料如下:" + "<br>" +
                                "單號 : " + this.FIELD_NO.Text + "<br>" +
                               "<br>" + GridViewToHtml(GridView1) + "<br>" +
                               "申請內容 : " +
                               "<a href=\"http://eip.minaik.com.tw/erp_cimi100/cimi100_newView.aspx?id=" + Request.QueryString["id"] + "\" >至" + flowname + "查看</a>" +
                               "<br>" +
                               "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                               "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                               "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                        message.Subject = flowname + "單號 - " + this.FIELD_NO.Text + "己完成審核";

                        message.IsBodyHtml = true;
                        message.Body = ques;
                        message.From = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
                        message.To.Add(rss["aemail"].ToString());
                        if (this.FIELD_plantid.Text.Trim() != "MAT")
                        {
                            message.To.Add(rss["bemail"].ToString());
                        }
                        else
                        {
                            #region 為開發/研發/開發工程, 完成審核寄給助理

                            SmoothEnterprise.Database.DataSet rsx = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                            rsx.Open("select b.name dep_name from " + db1 + "cimi100_main aa left join " + db2 + "dguser a on aa.add_user=a.id left join  " + db2 + "dggroup b on a.gid=b.id where no='" + this.FIELD_NO.Text.Trim() + "'");
                            if (!rsx.EOF)
                            {
                                SmoothEnterprise.Database.DataSet rsx2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                                rsx2.Open("select email from" + db2 + " erp_flow a left join " + db2 + "dguser b on a.pid=b.id where erp_name='cimi100' and dep_name='Assistant' and no like '" + rsx["dep_name"].ToString().Substring(0, 3) + "%'      ");
                                if (!rsx2.EOF)
                                {
                                    message.To.Add(rsx2["email"].ToString());

                                }
                                rsx2.Close();
                            }
                            rsx.Close();

                            #endregion
                        }

                        #region HSF寄信

                        SmoothEnterprise.Database.DataSet rs_hsf = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        rs_hsf.Open("select * from " + db1 + "cimi100_new where  group_code in ('1','A') and p_plantid like '%MINAIK%' AND HSF='Y' and no='" + this.FIELD_NO.Text.Trim() + "'");
                        if (!rs_hsf.EOF)
                        {
                            SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                            rs1.Open("SELECT pname,pid,email FROM " + db2 + "ERP_FLOW left join dguser  on pid=id WHERE ERP_NAME='cimi100' and dep_name='hsf'");
                            if (!rs1.EOF)
                            {
                                message.To.Add(rs1["email"].ToString());

                            }
                            rs1.Close();
                        }
                        rs_hsf.Close();

                        #endregion
                        SmtpClient client = new SmtpClient("192.168.0.12");

                        client.Send(message);

                    }

                    rb.Close();

                    #region 完成審核寄txt給ERP

                    FileStream fs = new FileStream(@"D:\CIMI100_XML\4GL\" + this.FIELD_plantid.Text.ToString().Trim() + "_A-CIMI100_" + this.FIELD_NO.Text.Trim() + ".txt", FileMode.Create, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs, Encoding.Default);
                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    //如為'T','G','K','H', 料號=技術產品
                    rs.Open("SELECT   CASE  WHEN p_plantid ='' THEN p_plantid   ELSE  SUBSTRING(REPLACE(p_plantid,'@', ','), 0, LEN(p_plantid)) END  p_plantid ,  " +
                            "partno,replace(component,'\"','~') component,replace(dwg,'\"','~') dwg , group_code,Source_code, " +
                            "CASE WHEN group_code in ('T','G','K','H') THEN partno ELSE null end Technology_code, " +
                            "Homemade_code,IQC,Unit, " +
                            "cate2,f_partno,cate1,cate3,Idle,Customers_class,hsf,'Y' stateus,ERP_identical  " +
                            "FROM " + db1 + " cimi100_new where no='" + this.FIELD_NO.Text.ToString().Trim() + "' order by item");
                    while (!rs.EOF)
                    {
                        if (rs["ERP_identical"].ToString().Trim() != "Y")
                        {
                            String[] s = rs["p_plantid"].ToString().Split(',');
                            foreach (string bb in s)
                            {
                                sw.WriteLine("\"" + bb.ToString() + "\",\"" + rs["partno"].ToString() + "\",\"" + rs["Component"].ToString() + "\",\"" + rs["dwg"].ToString() + "\",\"" +
                                            rs["group_code"].ToString() + "\",\"" + rs["Source_code"].ToString() + "\",\"" + rs["Technology_code"].ToString() + "\",\"" + rs["Homemade_code"].ToString() + "\",\"" +
                                            rs["IQC"].ToString() + "\",\"" + rs["Unit"].ToString() + "\",\"" + rs["cate2"].ToString() + "\",\"" + rs["f_partno"].ToString() + "\",\"" + rs["cate1"].ToString() + "\",\"" +
                                            rs["cate3"].ToString() + "\",\"" + rs["Idle"].ToString() + "\",\"" + rs["Customers_class"].ToString() + "\",\"" + rs["hsf"].ToString() + "\",\"Y\"   ");

                            }

                            if (rs["p_plantid"].ToString().IndexOf("MINAIK") == -1)  //如生產廠區無MINAIK,需傳一個STATUS N 的TXT
                            {
                                sw.WriteLine("\"MINAIK\",\"" + rs["partno"].ToString() + "\",\"" + rs["Component"].ToString() + "\",\"" + rs["dwg"].ToString() + "\",\"" +
                                            rs["group_code"].ToString() + "\",\"" + rs["Source_code"].ToString() + "\",\"" + rs["Technology_code"].ToString() + "\",\"" + rs["Homemade_code"].ToString() + "\",\"" +
                                            rs["IQC"].ToString() + "\",\"" + rs["Unit"].ToString() + "\",\"" + rs["cate2"].ToString() + "\",\"" + rs["f_partno"].ToString() + "\",\"" + rs["cate1"].ToString() + "\",\"" +
                                            rs["cate3"].ToString() + "\",\"" + rs["Idle"].ToString() + "\",\"" + rs["Customers_class"].ToString() + "\",\"" + rs["hsf"].ToString() + "\",\"N\"   ");


                            }
                        }


                        rs.MoveNext();
                    }
                    rs.Close();

                    sw.Close();
                    fs.Close();
                    Upload("D:\\CIMI100_XML\\4GL\\" + this.FIELD_plantid.Text.ToString().Trim() + "_A-CIMI100_" + this.FIELD_NO.Text + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString().Trim() + "_A-CIMI100_" + this.FIELD_NO.Text + ".txt", "4gl", "4gl");





                    #endregion


                 



                }

                if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate || e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Return)         //退回
                {

                    SmoothEnterprise.Database.DataSet rb = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rb.Open("SELECT * FROM " + db1 + "cimi100_main WHERE id='" + Request.QueryString["id"] + "'  ");
                    if (!rb.EOF)
                    {
                        rb["STATUS"] = "NO";
                        rb.Update();

                    }
                    rb.Close();

                    ShrFlowMail Backsend = new ShrFlowMail();
                    Backsend.RejectResult("5a3f8c87-e0dc-4bbb-8116-661521bfc6c7", flowname.ToString(), this.FIELD_NO.Text, rss["aemail"].ToString(), "--廠區:" + this.FIELD_plantid.Text + "<BR>--申請人員:" + this.FIELD_add_user.Text.Trim(), rss["aname"].ToString(), "http://eip.minaik.com.tw/erp_cimi100/cimi100_newView.aspx?id=" + Request.QueryString["id"], "退回單據");




                }

            }
        }

        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            try
            {
                //意見的呈現-----------------------------------------------------------------------------------------

                SmoothEnterprise.Web.UI.HTMLControl.InputText it2;
                object obj2 = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
                it2 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj2;
                it2.Enabled = true;
                it2.ReadOnly = true;
                it2.Text = (string)e["Flow_Comment"];


                //電子簽章呈現-----------------------------------------------------------------------------------------
                System.Web.UI.WebControls.Image sin1;
                object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
                sin1 = (System.Web.UI.WebControls.Image)obj5;
                sin1.ImageUrl = "~/image/" + (string)e["InputText3"] + ".JPG";

            }
            catch { }
        }

        private string GridViewToHtml(GridView gv)  //用gridmail產生html
        {
            for (int i = 0; i < 240; i++)
            {
                this.GridView1.Columns[i].Visible = false;
            }
            this.GridView1.Columns[4].Visible = true;
            this.GridView1.Columns[13].Visible = true;
            this.GridView1.Columns[14].Visible = true;
            this.GridView1.Columns[15].Visible = true;
            this.GridView1.Columns[16].Visible = true;
            this.GridView1.Columns[21].Visible = true;

            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            gv.RenderControl(hw);
            return sb.ToString();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

            // •因會產生例外詳細資訊: System.Web.HttpException: 型別 'GridView' 的控制項 'GridView1' 必須置於有 runat=server 的表單標記之中。
            //所以必須在程式碼中覆寫VerifyRenderingInServerForm這個方法。


        }

        #region 將ERP的TXT檔案上傳
        internal bool Upload(string fileName, string uploadUrl, string UserName, string Password)
        {
            // fileName上傳的檔案 ex : c:\abc.xml , 
            // uploadUrl上傳的FTP伺服器路徑 ftp://127.0.0.1/檔名
            // UserName使用者FTP登入帳號 , 
            // Password使用者登入密碼

            Stream requestStream = null;
            FileStream fileStream = null;
            FtpWebResponse uploadResponse = null;
            try
            {
                FtpWebRequest uploadRequest = (FtpWebRequest)WebRequest.Create(uploadUrl);
                uploadRequest.Method = WebRequestMethods.Ftp.UploadFile;//設定Method上傳檔案
                uploadRequest.Proxy = null;
                if (UserName.Length > 0)//如果需要帳號登入
                {
                    NetworkCredential nc = new NetworkCredential(UserName, Password);
                    uploadRequest.Credentials = nc; //設定帳號
                }
                requestStream = uploadRequest.GetRequestStream();
                fileStream = File.Open(fileName, FileMode.Open);
                byte[] buffer = new byte[1024];
                int bytesRead;
                while (true)
                {//開始上傳資料流
                    bytesRead = fileStream.Read(buffer, 0, buffer.Length);
                    if (bytesRead == 0)
                        break;
                    requestStream.Write(buffer, 0, bytesRead);
                }
                requestStream.Close();
                uploadResponse = (FtpWebResponse)uploadRequest.GetResponse();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (uploadResponse != null)
                    uploadResponse.Close();
                if (fileStream != null)
                    fileStream.Close();
                if (requestStream != null)
                    requestStream.Close();
            }
        }
        #endregion

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string partno = "";
            string inside_group = ""; //廠內group
            SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rss.Open("select * from " + db1 + "cimi100_new where no='" + this.FIELD_NO.Text + "' and item='" + this.rember_item.Value + "'   ");
            if (!rss.EOF)
            {
                switch (this.FIELD_Coding_Class.Text)
                {

                    case "1":
                        if (rss["a2"].ToString() == "NA") inside_group = rss["a1"].ToString(); else inside_group = rss["a2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["a1"].ToString() + rss["a3"].ToString() + rss["a4"].ToString() + rss["a5"].ToString() + rss["a6"].ToString() + rss["a7"].ToString();
                        if (rss["a8"].ToString().Length == 0) partno = partno.ToString() + Coding_number(partno, 14, 2); else partno = partno + rss["a8"].ToString();
                        partno = partno + rss["a9"];

                        break;

                    case "2":
                        partno = rss["b1"].ToString() + rss["b2"].ToString() + rss["b3"].ToString() + rss["b4"].ToString();
                        partno = partno.ToString() + Coding_number(partno, 7, 4);

                        break;

                    case "3":
                        partno = rss["c1"].ToString() + rss["c2"].ToString();
                        partno = partno.ToString() + Coding_number(partno, 4, 3);

                        break;

                    case "4":
                        partno = rss["d1"].ToString() + rss["d2"].ToString();

                        break;

                    case "5":
                        partno = rss["e1"].ToString() + rss["e2"].ToString() + rss["e3"].ToString();
                        partno = partno.ToString() + Coding_number(partno, 7, 3);
                        partno = partno + rss["e5"];
                        break;

                    case "6":
                        partno = rss["f1"].ToString() + rss["f2"].ToString() + rss["f3"].ToString();
                        if (rss["f4"].ToString().Length == 0) partno = partno + Coding_number(partno, 7, 2); else partno = partno + rss["f4"].ToString();
                        partno = partno + rss["f5"].ToString();
                        break;

                    case "7":
                        partno = rss["g1"].ToString() + rss["g2"].ToString() + rss["g3"].ToString() + rss["g4"].ToString() + rss["g5"].ToString() + rss["g6"].ToString();

                        break;

                    case "8":
                        partno = rss["h1"].ToString() + rss["h2"].ToString();
                        break;

                    case "9":
                        if (rss["i2"].ToString() == "NA") inside_group = rss["i1"].ToString(); else inside_group = rss["i2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["I1"].ToString() + rss["i3"].ToString() + rss["i4"].ToString() + rss["i5"].ToString() + rss["i6"].ToString() + rss["i7"].ToString();
                        partno = partno + Coding_number(partno, 10, 3);
                        break;

                    case "10":
                        if (rss["j2"].ToString() == "NA") inside_group = rss["j1"].ToString(); else inside_group = rss["j2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["J1"].ToString() + rss["j3"].ToString() + rss["j4"].ToString() + rss["j5"].ToString() + rss["j6"].ToString();

                        break;

                    case "11":
                        if (rss["k2"].ToString() == "NA") inside_group = rss["k1"].ToString(); else inside_group = rss["k2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["K1"].ToString() + rss["k3"].ToString() + rss["k4"].ToString() + rss["k5"].ToString();
                        partno = partno+Coding_number(partno, 8, 4) + rss["k7"].ToString();
                        break;

                    case "12":
                        if (rss["l2"].ToString() == "NA") inside_group = rss["l1"].ToString(); else inside_group = rss["l2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["L1"].ToString() + rss["l3"].ToString() + rss["l4"].ToString() + rss["l5"].ToString() + rss["l6"].ToString() + rss["l7"].ToString();
                        break;

                    case "13":
                        if (rss["m2"].ToString() == "NA") inside_group = rss["m1"].ToString(); else inside_group = rss["m2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["M1"].ToString() + rss["m3"].ToString() + rss["m4"].ToString() + rss["m5"].ToString() + rss["m6"].ToString() + rss["m7"].ToString() + rss["m8"].ToString();
                        break;

                    case "14":
                        if (rss["n2"].ToString() == "NA") inside_group = rss["n1"].ToString(); else inside_group = rss["n2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["N1"].ToString() + rss["n3"].ToString() + rss["n4"].ToString() + rss["n5"].ToString() + rss["n6"].ToString() + rss["n7"].ToString() + rss["n8"].ToString();
                        break;

                    case "15":
                        if (rss["o2"].ToString() == "NA") inside_group = rss["o1"].ToString(); else inside_group = rss["o2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["O1"].ToString() + rss["O3"].ToString() + rss["O4"].ToString() + rss["O5"].ToString() + rss["O6"].ToString();
                        break;

                    case "16":
                        if (rss["p2"].ToString() == "NA") inside_group = rss["p1"].ToString(); else inside_group = rss["p2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["P1"].ToString() + rss["P3"].ToString() + rss["P4"].ToString() + rss["P5"].ToString() + rss["P6"].ToString() + rss["P7"].ToString();
                        break;

                    case "17":
                        partno = rss["Q1"].ToString() + rss["Q2"].ToString() + rss["Q3"].ToString() + rss["Q4"].ToString().Substring(0,3) + rss["Q5"].ToString() + rss["Q6"].ToString() + rss["Q7"].ToString();
                        partno = partno + Coding_number(partno, 12, 4);
                        break;

                    case "18":
                        partno = rss["R1"].ToString() + rss["R2"].ToString() + rss["R3"].ToString();
                        if (rss["R4"].ToString().Length == 0) partno = partno + Coding_number(partno, 7, 2); else partno = partno + rss["R4"].ToString();
                        partno = partno + rss["R5"].ToString();
                        break;

                    case "19":
                        partno = rss["S1"].ToString() + rss["S2"].ToString() + rss["S3"].ToString() + rss["S4"].ToString() + rss["S5"].ToString() + rss["S6"].ToString();

                        break;

                    case "20":
                        partno = rss["T1"].ToString() + rss["T2"].ToString() + rss["T3"].ToString();
                        if (rss["T4"].ToString().Length == 0) partno = partno + Coding_number(partno, 7, 2); else partno = partno + rss["T4"].ToString();
                        partno = partno + rss["T5"].ToString();

                        
                        break;

                    case "21":
                        partno = rss["U1"].ToString() + rss["U2"].ToString() + rss["U3"].ToString() + rss["U4"].ToString();
                        partno = partno + Coding_number(partno, 8, 3);

                        break;

                    case "22":
                        if (rss["v2"].ToString() == "NA") inside_group = rss["v1"].ToString(); else inside_group = rss["v2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["V1"].ToString() + rss["V3"].ToString() + rss["V4"].ToString() + rss["V5"].ToString();
                        break;

                    case "23":
                        partno = rss["W1"].ToString() + rss["W2"].ToString();
                        break;

                    case "24":
                        if (rss["x2"].ToString() == "NA") inside_group = rss["x1"].ToString(); else inside_group = rss["x2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["X1"].ToString() + rss["X3"].ToString() + rss["X4"].ToString() + rss["X5"].ToString() + rss["X6"].ToString() + rss["X7"].ToString() + rss["X8"].ToString() ;

                        break;

                    case "25":
                        if (rss["y2"].ToString() == "NA") inside_group = rss["y1"].ToString(); else inside_group = rss["y2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["Y1"].ToString() + rss["Y3"].ToString() + rss["Y4"].ToString() + rss["Y5"].ToString() + rss["Y6"].ToString() + rss["Y7"].ToString() + rss["Y8"].ToString() + rss["Y9"].ToString();
                        break;

                    case "26":
                        if (rss["z2"].ToString() == "NA") inside_group = rss["z1"].ToString(); else inside_group = rss["z2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["Z1"].ToString() + rss["Z3"].ToString() + rss["Z4"].ToString() + rss["Z5"].ToString() + rss["Z6"].ToString() + rss["Z7"].ToString() + rss["Z8"].ToString() + rss["Z9"].ToString();
                        break;

                    case "27":
                        if (rss["aa2"].ToString() == "NA") inside_group = rss["aa1"].ToString(); else inside_group = rss["aa2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["AA1"].ToString() + rss["AA3"].ToString() + rss["AA4"].ToString() + rss["AA5"].ToString() + rss["AA6"].ToString() + rss["AA7"].ToString() + rss["AA8"].ToString() + rss["AA9"].ToString() + rss["AA10"].ToString();

                        break;

                    case "28":
                        if (rss["ab2"].ToString() == "NA") inside_group = rss["ab1"].ToString(); else inside_group = rss["ab2"].ToString().Substring(0, 1);
                        partno = inside_group.ToString() + rss["AB1"].ToString() + rss["AB3"].ToString() + rss["AB4"].ToString() + rss["AB5"].ToString() + rss["AB6"].ToString() + rss["AB7"].ToString();
                        partno = partno + Coding_number(partno, 14, 3);

                        break;

                    case "29":
                        partno = rss["AC1"].ToString() + rss["AC2"].ToString() + rss["AC3"].ToString() + rss["AC4"].ToString();
                        partno = partno + Coding_number(partno, 7, 4);
                        partno = partno + rss["AC6"].ToString() + rss["AC7"].ToString();
                        break;
                }
                partno = partno.ToUpper();
                this.FIELD_partno.Text = partno.ToUpper().Trim();
            }
        }

        private string Coding_number(string a,int b,int c) //至ERP尋找料號,找出MAX的自動編碼並+1  a-->前端料號 b-->從第幾碼取  c-->取幾位
        {
            string partno_like = "";
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
           // rs.Open("SELECT  max(SubString(IMA01," + b + "," + c + ")) imakey FROM " + db3 + "MINAIK.dbo.IMA_FILE where IMA01 like '" + a.ToString() + "%'  ");
            rs.Open("select max(SubString(IMA01," + b + "," + c + ")) IMAKEY  from " +
                    "(SELECT  ima01 COLLATE Chinese_Taiwan_Stroke_CS_AS as ima01  FROM " + db3 + "MINAIK.dbo.IMA_FILE WHERE IMA01 LIKE '" + a.ToString() + "%' " +
                    "union    " +
                    "select partno ima01 from  " + db1 + "cimi100_main a left join " + db1 + "cimi100_new b on a.no=b.no where class_no='1' and status <>'V' and partno is not null  " +
                    "and partno <>'' and partno like '" + a.ToString() + "%' and item <> '" + this.rember_item.Value.ToString().Trim() + "'  ) a ");
            if (!rs.EOF)
            {
                partno_like = rs["imakey"].ToString();
            }
            if (partno_like.Length == 0)
            {
                switch (c)
                {
                    case 2:
                        partno_like = "01";
                        break;

                    case 3:
                        partno_like = "001";
                        break;

                    case 4:
                        partno_like = "0001";
                        break;
                }
            }
            else
            {
                //最大值加1
                DBTransfer hs = new DBTransfer();
                partno_like = hs.GetTopfile("select target=[EIPB].[dbo].[MaterSn] ('" + partno_like + "')");
            }

            return partno_like;
        }

        protected void ExcelButton1_Click(object sender, EventArgs e)
        {

            for (int i = 0; i < 225; i++)
            {
                this.GridView1.Columns[i].Visible = false;
            }
            this.GridView1.Columns[14].Visible = true;
            this.GridView1.Columns[15].Visible = true;
            this.GridView1.Columns[16].Visible = true;
            this.GridView1.Columns[20].Visible = true;

            Response.ClearContent();
            Response.Write("<meta http-equiv=Content-Type content=text/html;charset=utf-8>");
            string excelFileName = this.FIELD_NO.Text+"Excel.xls";
            Response.AddHeader("content-disposition", "attachment;filename=" + Server.UrlEncode(excelFileName));
            Response.ContentType = "application/excel";
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            GridView1.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End(); 
        }

        protected void Q2_SelectedIndexChanged(object sender, EventArgs e)
        {

            this.Q3.Items.Clear();
            this.Q3.Items.Add(new ListItem("", ""));
            #region change自動化產業別
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("select distinct b.bass_no bass_no,name from " + db1 + "cimi100_autounion a " +
                    "left join " + db1 + "cimi100_base b on  b.class_no='AUTO_Industry' and bass_no=auto_industry where auto_l='" + this.Q2.Text + "'");
            while (!rs.EOF)
            {
                this.Q3.Items.Add(new ListItem(rs["name"].ToString().Trim(), rs["bass_no"].ToString().Trim()));
                rs.MoveNext();
            }
            rs.Close();
            #endregion


        }
        protected void Q3_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Q4.Items.Clear();
            this.Q4.Items.Add(new ListItem("", ""));

            #region change機台流水號
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("select machine_number from " + db1 + "cimi100_autounion where auto_industry='" + this.Q3.Text + "'");
            while (!rs.EOF)
            {
                this.Q4.Items.Add(new ListItem(rs["machine_number"].ToString().Trim(), rs["machine_number"].ToString().Trim()));
                rs.MoveNext();
            }
            rs.Close();
            #endregion
        }
        protected void button_txt_Click(object sender, EventArgs e)
        {
            FileStream fs = new FileStream(@"D:\CIMI100_XML\4GL\" + this.FIELD_plantid.Text.ToString().Trim() + "_A-CIMI100_" + this.FIELD_NO.Text.Trim() + ".txt", FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs, Encoding.Default);
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            //如為'T','G','K','H', 料號=技術產品
            rs.Open("SELECT   CASE  WHEN p_plantid ='' THEN p_plantid   ELSE  SUBSTRING(REPLACE(p_plantid,'@', ','), 0, LEN(p_plantid)) END  p_plantid ,  " +
                    "partno,replace(component,'\"','~') component,replace(dwg,'\"','~') dwg , group_code,Source_code, " +
                    "CASE WHEN group_code in ('T','G','K','H') THEN partno ELSE null end Technology_code, " +
                    "Homemade_code,IQC,Unit, " +
                    "cate2,f_partno,cate1,cate3,Idle,Customers_class,hsf,'Y' stateus,ERP_identical  " +
                    "FROM " + db1 + " cimi100_new where no='" + this.FIELD_NO.Text.ToString().Trim() + "' order by item");
            while (!rs.EOF)
            {
                if (rs["ERP_identical"].ToString().Trim() != "Y")
                {
                    String[] s = rs["p_plantid"].ToString().Split(',');
                    foreach (string bb in s)
                    {
                        sw.WriteLine("\"" + bb.ToString() + "\",\"" + rs["partno"].ToString() + "\",\"" + rs["Component"].ToString() + "\",\"" + rs["dwg"].ToString() + "\",\"" +
                                    rs["group_code"].ToString() + "\",\"" + rs["Source_code"].ToString() + "\",\"" + rs["Technology_code"].ToString() + "\",\"" + rs["Homemade_code"].ToString() + "\",\"" +
                                    rs["IQC"].ToString() + "\",\"" + rs["Unit"].ToString() + "\",\"" + rs["cate2"].ToString() + "\",\"" + rs["f_partno"].ToString() + "\",\"" + rs["cate1"].ToString() + "\",\"" +
                                    rs["cate3"].ToString() + "\",\"" + rs["Idle"].ToString() + "\",\"" + rs["Customers_class"].ToString() + "\",\"" + rs["hsf"].ToString() + "\",\"Y\"   ");

                    }

                    if (rs["p_plantid"].ToString().IndexOf("MINAIK") == -1)  //如生產廠區無MINAIK,需傳一個STATUS N 的TXT
                    {
                        sw.WriteLine("\"MINAIK\",\"" + rs["partno"].ToString() + "\",\"" + rs["Component"].ToString() + "\",\"" + rs["dwg"].ToString() + "\",\"" +
                                    rs["group_code"].ToString() + "\",\"" + rs["Source_code"].ToString() + "\",\"" + rs["Technology_code"].ToString() + "\",\"" + rs["Homemade_code"].ToString() + "\",\"" +
                                    rs["IQC"].ToString() + "\",\"" + rs["Unit"].ToString() + "\",\"" + rs["cate2"].ToString() + "\",\"" + rs["f_partno"].ToString() + "\",\"" + rs["cate1"].ToString() + "\",\"" +
                                    rs["cate3"].ToString() + "\",\"" + rs["Idle"].ToString() + "\",\"" + rs["Customers_class"].ToString() + "\",\"" + rs["hsf"].ToString() + "\",\"N\"   ");


                    }
                }


                rs.MoveNext();
            }
            rs.Close();

            sw.Close();
            fs.Close();
            Upload("D:\\CIMI100_XML\\4GL\\" + this.FIELD_plantid.Text.ToString().Trim() + "_A-CIMI100_" + this.FIELD_NO.Text + ".txt", "ftp://192.168.0.250/" + this.FIELD_plantid.Text.ToString().Trim() + "_A-CIMI100_" + this.FIELD_NO.Text + ".txt", "4gl", "4gl");




        }
}
}