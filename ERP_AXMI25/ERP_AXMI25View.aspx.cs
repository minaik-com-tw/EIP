/* 
H201603001   20150311 佩佩要求增加 信用查核 -說明要求財務可以改 by herzog
 * 變更說明1ta_occa1201 分為3個欄位ta_occa1202 , ta_occa1203
 * 因為原先的設計是 ta_occa01 = ta_occa01 + ta_occa02 + ta_occa03
 * 因財務方面需要修改的權利所以會回寫回資料庫中
 * 所以分為3個欄位'
 * 
 * Flow:
 * --------------------------------------------------------------------- 
 * ERP 送簽，將OCCA_File 的資料送出 //user 送出欲修改的Temp資料轉成xml
 * ERP_AXMI25_receive.ashx // 存入DB ERP_AXMI25，ERP_AXMI25_file 　 
 * 記錄財會修改資料　存至 ERP_AXMI25_Temp ，
 * 輸出xml 以ERP_AXMI25_Temp最後的異動為主產出xml to 4GL 再由app拋轉至oracle
 ** ----------------------------------------------------------
 *    mark     Date       Aouther     action       Reason                  
 * ----------------------------------------------------------
 *  V1.0.1  2017/03/28  carol.yeh       Modify      S0001-1703001 
 *  客戶代號電子E化，EIP開放=>股票代號、客戶月結日、客戶付款日這三個欄位，誏財務人員於EIP上KEY IN ，以避免退件重送簽，造成時間、人力增加 。
 *  V1.0.2  2017/11/22   Carol          Modify   S0001-1710004-謝珮真   新增銀行資料頁籤，以利財務人員key in，eip審核完成後將資料回寫至axmi221的銀行資料欄位,直接抓IP185 的資料不走.axhx的資料 
 * 
 *   V1.0.3  2018/04/11   Carol          Modify   謝珮真 3/29來信 為何axmi250信用查核的主要供應商等相關欄位，在axmi221都沒呈現.
 *  
 *  V1.0.4  2018/05/16   Carol          Modify   Ta_occa15 & PlantID  並非同一個，以PlantID為資料更新的位置ex:185.[PlantID].dbo.OCCA,Ta_occa15僅為顯示
 *  
 *  V1.0.5  2018/05/22   Carol          Modify  鎖住save button 僅財會可修改
 *   
 *  V1.0.6  2018/09/11   Carol          Modify  因為user修改資料送單後，財會又將資料改回與OCC相同，故會產生資料不回傳，因為與OCC 相同
 *                                     故所有異動欄位，都依時間儲存於log後，在輸出xml以log異動之欄位為準
 * V1.0.7  2019/01/08   Carol          Modify 因為加入君洋之廠別，修改sql條件 加入廠別, 因為目前MAT&GIT為同單號，必需以rowno為主key不再以occano為主
 * V1.0.8  2019/01/08   Carol          Modify 金額有尾數是小數點，導致回傳oracle會有問題,回傳金額的格式必需為double, 小數六位 ex:0.000000
 * V1.0.9  2019/01/14   Carol          Modify OFIELD_occa61 預設為A，在填寫完OCCA01 無值，需提示user 為必填 ;
 *                                     OCCA33 當新增時，與OCCA01同值回傳; 二者皆因為系統比對的規則 ;所以 加入FIELD_occa33 & FIELD_occa61來比對， 。 
 * V1.0.10  2019/03/15   Carol         TextBox add data attribute 'tag'; tag representative of the datatype ex: tag="Money"  
 * V1.0.11  2019/04/12 carol update    君洋人員收不到信 因帳號問題
 * V1.0.12  2019/06/24 carol update    信用評等 加入廠別  [OCG_FILE]  

*/
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
using System.IO;
using System.Collections.Generic;
using System.Net;
using System.Data.SqlClient;
using System.Text;

namespace CNE
{
    public partial class CNEView : SmoothEnterprise.Web.Page
    {
        private bool _NotifyReview = false;
        private int Allsn = 0;
        private string _NodeType = "";
        private string flowstep = "";
        private string NextNodeID = "";
        private string modify_user;
        private ERP_Out outInfo;



        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!this.IsPostBack)
            {
                try
                {
                    initdropfield();
                    initdata();

                    //if (CheckCurrectUserFlowis(false))
                    // if (checkuser()) v1.0.5
                    if (Authority(CurrentUser.LogonID, hide_occa00.Value))
                    {
                        UnlockField();
                        initonblur();
                    }
                    //Contrast(Request["ROWNO"].toString()); 

                    Change_Show_Red();

                    initupdate();
                    starupscript();

                    if (Utility.MIS_Manager(CurrentUser.LogonID))
                    {
                        Button1.Visible = true;
                    }


                }
                catch (Exception ex)
                {
                    this.AddError(null, "page_load", "", ex.Message + "<br/>" + ex.StackTrace);
                    //Response.Write(ex.Message+"<br/>"+ex.StackTrace);
                    //Response.Redirect("ERP_AXMI25.aspx");
                }
            }

        }

        private void Change_Show_Red()
        {
            StringBuilder sb = new StringBuilder();
            string occa01 = FIELD_occano.Text;
            string zone = PlantID.Value;
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                //string sql = "select  * from EIPB.dbo.ERP_AXMI25_TEMP where no='" + FIELD_occano.Text + "' "; v1.0.6 

                sb.Append("select tb.* from  (select no, field_name, max(t.modify_date) 'dt' from eipb.dbo.ERP_AXMI25_TEMP t ");
                sb.AppendFormat(" where no = '{0}' group by field_name, no) a ", FIELD_occano.Text);
                sb.Append(" left join eipb.dbo.ERP_AXMI25_TEMP tb on a.field_name = tb.field_name and a.dt = tb.modify_date  ");


                rs.Open(sb.ToString());

                if (!rs.EOF)
                {//有資料

                    while (!rs.EOF)
                    {
                        string col = Convert.ToString(rs["field_name"]).ToUpper();


                        if (exclude(col))//是否為例外欄位
                        {
                            //LABEL_
                            ContentPlaceHolder Content = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");

                            Label lab = (Label)Content.FindControl("LABEL_" + col);


                            if (lab != null)
                            {

                                lab.ForeColor = System.Drawing.Color.Red;
                            }

                            Multitype(col);
                            //else //未完成，不上
                            //{
                            //    Multitype(col);
                            //}
                        }
                        rs.MoveNext();
                    }
                }
                else
                {
                    //沒資料
                    Differ_Column(true);
                }
            }



        }

        private void Multitype(string col)
        {
            //this.FIELD_occa241.Text = rs["occa241"].ToString() + Environment.NewLine + rs["occa242"].ToString() + Environment.NewLine + rs["occa243"].ToString();

            switch (col)
            {
                case "OCCA241":
                case "OCCA242":
                case "OCCA243":
                    LABEL_occa24_.ForeColor = System.Drawing.Color.Red;
                    break;

                case "OCCA231":
                case "OCCA232":
                case "OCCA233":
                    LABEL_occa23_.ForeColor = System.Drawing.Color.Red;
                    break;

                case "ta_occa191":
                case "ta_occa192":
                case "ta_occa193":
                    LABEL_ta_occa19_.ForeColor = System.Drawing.Color.Red;
                    break;

                    //FIELD_ta_occa191
            }
        }

        private void initonblur()
        {
            this.FIELD_ta_occa29.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa29.ClientID + "');");
            this.FIELD_ta_occa23c.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa23c.ClientID + "');");
            this.FIELD_ta_occa24c.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa24c.ClientID + "');");
            this.FIELD_ta_occa25c.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa25c.ClientID + "');");
            this.FIELD_ta_occa26c.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa26c.ClientID + "');");
            this.FIELD_ta_occa26f.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa26f.ClientID + "');");
            this.FIELD_ta_occa23b.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa23b.ClientID + "');");
            this.FIELD_ta_occa24b.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa24b.ClientID + "');");
            this.FIELD_ta_occa25b.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa25b.ClientID + "');");
            this.FIELD_ta_occa26b.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa26b.ClientID + "');");
            this.FIELD_ta_occa26g.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa26g.ClientID + "');");
            this.FIELD_ta_occa26d.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa26d.ClientID + "');");
            this.FIELD_ta_occa26e.Attributes.Add("onblur", "num_format('" + this.FIELD_ta_occa26e.ClientID + "');");
            this.FIELD_occa63.Attributes.Add("onblur", "num_format('" + this.FIELD_occa63.ClientID + "')");
        }
        private void starupscript()
        {
            //FIELD_ta_occa26e   FIELD_occa63


            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa29", "num_format('" + this.FIELD_ta_occa29.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa23c", "num_format('" + this.FIELD_ta_occa23c.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa24c", "num_format('" + this.FIELD_ta_occa24c.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa25c", "num_format('" + this.FIELD_ta_occa25c.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa26c", "num_format('" + this.FIELD_ta_occa26c.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa26f", "num_format('" + this.FIELD_ta_occa26f.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa23b", "num_format('" + this.FIELD_ta_occa23b.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa24b", "num_format('" + this.FIELD_ta_occa24b.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa25b", "num_format('" + this.FIELD_ta_occa25b.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa26b", "num_format('" + this.FIELD_ta_occa26b.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa26g", "num_format('" + this.FIELD_ta_occa26g.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa26d", "num_format('" + this.FIELD_ta_occa26d.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_ta_occa26e", "num_format('" + this.FIELD_ta_occa26e.ClientID + "');", true);
            Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "FIELD_occa63", "num_format('" + this.FIELD_occa63.ClientID + "');", true);


        }
        protected void UnlockField()
        {
            try
            {

                //this.FIELD_occa01.Enabled = true;
                //this.FIELD_occa01.ReadOnly = false;

                //20180810 by carol


                this.FIELD_occa01.ReadOnly = true;

                this.FIELD_occa36.Enabled = true;
                this.FIELD_occa36.ReadOnly = false;
                this.FIELD_occa37.Enabled = true;
                //this.FIELD_occa01.ReadOnly = false;
                this.FIELD_occa61.Enabled = true;
                this.FIELD_occa61_s.Enabled = true; //V1.0.9
                //this.FIELD_occa01.ReadOnly = false;
                this.FIELD_occa63.Enabled = true;
                this.FIELD_occa63.ReadOnly = false;
                this.FIELD_ta_occa06.Enabled = true;
                this.FIELD_ta_occa07.Enabled = true;

                //this.BUTTON_save.Visible = true; v1.0.5
                this.BUTTON_save.Visible = Authority(CurrentUser.LogonID, hide_occa00.Value);



                this.FIELD_ta_occa22.Enabled = true;

                //v1.0.1 start
                this.FIELD_ta_occa1302.ReadOnly = false;
                this.FIELD_ta_occa1301.ReadOnly = false;
                this.FIELD_ta_occa27.ReadOnly = false;
                //v1.0.1end

                //v1.0.2 
                Utility.setEnable(true, FIELD_ta_occa01, FIELD_ta_occa02, FIELD_ta_occa03, FIELD_ta_occa04, FIELD_ta_occa05);

                this.FIELD_occa704.ReadOnly = false;
                if (this.FIELD_occa00.Text.Contains("I"))
                {
                    if (ConfirmUser() || Utility.MIS_Manager(CurrentUser.LogonID))
                    {
                        this.FIELD_occa01.ReadOnly = false;

                        //V1.0.6 非ReadOnly 才會回傳
                        this.FIELD_occa07.ReadOnly = false;
                        this.FIELD_occa09.ReadOnly = false;
                    }
                    this.queryform1.Visible = true;
                }

                this.Btn_XML.Visible = Utility.MIS_Manager(CurrentUser.LogonID);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        private string getZone(string rowno)
        {
            try
            {

                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs2.Open("SELECT TOP 1 PlantID FROM EIPB.DBO.ERP_AXMI25 WHERE rowno='" + rowno + "'");
                if (!rs2.EOF)
                    return rs2["PlantID"].ToString();
                else
                    return "MINAIK";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// 找出不同的資料 取代 Contrast
        /// </summary>
        private void Differ_Column(bool record)
        {
            Dictionary<string, string> dc_EIP = new Dictionary<string, string>();
            Dictionary<string, string> dc_ERP = new Dictionary<string, string>();
            Dictionary<string, string> dc_Temp = new Dictionary<string, string>();

            SmoothEnterprise.Database.DataSet EIP = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            string SQL = " SELECT *" +
                             "  FROM EIPB.DBO.ERP_AXMI25  " +
                                 " WHERE ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'";
            EIP.Open(SQL);
            ////Utility.log(1SQL);
            if (!EIP.EOF)
            {

                string plant = EIP["PlantID"].ToString();
                string occa01 = EIP["occa01"].ToString();
                string action = EIP["occa00"].ToString().Split(':')[0]; // U:修改 只取第一個字元 U
                string ERP_NO = EIP["occano"].ToString();
                //Utility.log(1plant);
                //只有一筆資料 
                //收集EIP的資料
                foreach (DataColumn col in EIP.Columns)
                {
                    string Key = col.ColumnName.ToUpper();
                    string Val = EIP[Key].ToString();
                    dc_EIP.Add(Key, Val);
                }

                // 其他
                string OCC = "";

                if (action == "I")
                {
                    OCC = " SELECT *" +
                                 " FROM [IP185].[" + plant + "].[dbo].[OCCA_FILE]   " +
                                 "WHERE 1=1 " +
                                 "  AND occano = '" + ERP_NO + "'";
                }
                else
                {

                    OCC = " SELECT *" +
                                     " FROM [IP185].[" + plant + "].[dbo].[OCC_FILE]   " +
                                     "WHERE 1=1 " +
                                     "  AND OCC01 = '" + occa01 + "'";


                }

                SmoothEnterprise.Database.DataSet ERP = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                ERP.Open(OCC);
                ////Utility.log(1command);
                if (!ERP.EOF)
                {

                    //只有一筆資料
                    //收集ERP的資料
                    foreach (DataColumn col in ERP.Columns)
                    {
                        string Key = col.ColumnName.ToUpper();
                        string Val = ERP[Key].ToString();
                        dc_ERP.Add(Key, Val);
                    }
                    //------------------------------------------------------------------------
                    //以EIP 為主
                    outInfo = new ERP_Out(); //每次比對都要重新宣告
                    foreach (KeyValuePair<string, string> item in dc_EIP)
                    {
                        string col = item.Key;

                        string name = action == "I" ? col : col.Replace("OCCA", "OCC"); //欄位名稱大寫;

                        //LABEL_occa00
                        ContentPlaceHolder Content = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");

                        Label lab = (Label)Content.FindControl("LABEL_" + col);
                        if (lab != null)
                        {
                            lab.ForeColor = System.Drawing.Color.Black;
                        }



                        //=====================erp=============================
                        if (dc_ERP.ContainsKey(name)) //欄位是在ERP 
                        {
                            string ERP_Val = dc_ERP[name].Trim();
                            string EIP_Val = dc_EIP[col].Trim();


                            TransferFomat(col, ref EIP_Val, ref ERP_Val);

                            if (col == "OCCA12") //創業日，只取日期
                            {
                                if (!string.IsNullOrEmpty(ERP_Val))
                                {
                                    ERP_Val = DateTime.Parse(ERP_Val).ToString("yyyy/MM/dd");
                                }

                                if (!string.IsNullOrEmpty(EIP_Val))
                                {
                                    EIP_Val = DateTime.Parse(EIP_Val).ToString("yyyy/MM/dd");
                                }
                            }


                            if (string.IsNullOrEmpty(EIP_Val))
                            {
                                EIP_Val = "NULL";
                            }

                            if (string.IsNullOrEmpty(ERP_Val))
                            {
                                ERP_Val = "NULL";
                            }
                            if (EIP_Val == "0.000000" && ERP_Val == "NULL")
                            {
                                ERP_Val = EIP_Val;
                            }

                            //值不相等 
                            if (EIP_Val != ERP_Val)
                            {
                                //Utility.log(10, plant, col, EIP_Val, ERP_NO, action);



                                if (exclude(col))//是否為例外欄位
                                {
                                    EIP_Val = EIP_Val == "NULL" ? string.Empty : EIP_Val;

                                    //LABEL_occa00
                                    //ContentPlaceHolder Content = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");

                                    //Label lab = (Label)Content.FindControl("LABEL_" + col);
                                    if (lab != null)
                                    {
                                        lab.ForeColor = System.Drawing.Color.Red;
                                    }

                                    Multitype(col);

                                    outInfo.Add(plant, col, EIP_Val, ERP_NO, action);
                                    if (record)
                                    {
                                        upt_Temp(col, EIP_Val, plant, action, ERP_NO);
                                    }
                                }
                            }

                        }
                    }
                }
            }
        }


        private void TransferFomat(string col, ref string EIP, ref string ERP)
        {
            if (col == "OCCA55" || col == "OCCA06" || col == "TA_OCCA11" || col == "TA_OCCA21")
            {
                string[] Val = EIP.Split(':');
                EIP = Val[0];
            }

            if (col == "OCCAUD15")
            {
                EIP = Convert.ToDateTime(EIP).ToShortDateString();
                ERP = Convert.ToDateTime(ERP).ToShortDateString();

            }

        }

        private void upt_Temp(string Col, string Value, string Plant, string Action, string ERP_NO)
        {
            try
            {
                string uid = Request.QueryString["ROWNO"].ToString();
                StringBuilder sb = new StringBuilder();
                sb.Append("INSERT INTO EIPB.dbo.ERP_AXMI25_TEMP ([ROWNO] ,[ID] ,[zone] ,[field_name] ,[field_value] ,[no] ,[apply_atrribute],[modify_user],[modify_date]) ");
                sb.AppendFormat("VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}') ", new Guid(uid), Guid.NewGuid(), Plant, Col, Value, ERP_NO, Action, CurrentUser.Name, DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));

                DBTransfer db = new DBTransfer();
                db.RunIUSql(sb.ToString());
            }
            catch (Exception ex)
            {
                Utility.log(1, ex.Message);
                throw ex;
            }
        }

        //protected void Contrast(string rowno)
        //{
        //    try
        //    {

        //        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //        string command = " SELECT * " +
        //                         //string command = "SELECT occ01 occa01 , occ63 occa63, occ02 occa02,occ03 occa03, " +
        //                         //                 "      occ04 occa04,occ06 occa06,occ15 occa15,occ18 occa18, occ19 occa19 , " +
        //                         //                 "      occ20 occa20,occ21 occa21,occ231 occa231,occ232 occa232,occ233 occa233,occ241 occa241, " +
        //                         //                 "      occ242 occa242,occ243 occa243, OCCACTI ta_occa14,occ28 occa28,occ35 occa35,occ38 occa38,occ39 occa39, " +
        //                         //                 "      occ41 occa41,occ42 occa42,occ43 occa43,occ44 occa44,occ45 occa45,occ55 occa55,occ56 occa56 , ta_occ22 ta_occa22 , occ704 occa704 ," +
        //                         //                 "      ta_occ23a ta_occ23a,ta_occ23b ta_occa23b,ta_occ23c ta_occa23c,ta_occ24a ta_occa24a,ta_occ24b ta_occa24b,ta_occ24c ta_occa24c," +
        //                         //                 "      ta_occ25a ta_occa25a,ta_occ25b ta_occa25b,ta_occ25c ta_occa25c,ta_occ26a ta_occa26a,ta_occ26b ta_occa26b,ta_occ26c ta_occa26c," +
        //                         //                 "      ta_occ26d ta_occa26d,ta_occ26e ta_occa26e,ta_occ26f ta_occa26f,ta_occ26g ta_occa26g,ta_occ27 ta_occa27,ta_occ28 ta_occa28," +
        //                         //                 "      ta_occ29 ta_occa29" +
        //                         //"      --,ta_occ191 ,ta_occ192,ta_occ193 "+
        //                         " FROM [IP185].[" + getZone(rowno) + "].[dbo].[OCC_FILE]   " +
        //                         "WHERE 1=1 " +
        //                         "  AND OCC01 = '" + this.FIELD_occa01.Text.Trim() + "'";
        //        rs.Open(command);

        //        SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //        command = " SELECT * " +
        //                         //command = "SELECT occa01 , occa63 , occa02 ,occa03 ,occa04 ,substring(occa06,1,1) occa06 ,occa15, " +
        //                         //                 "       occa18,occa19,occa20,occa21,occa231,occa232,occa233,occa241,occa242, " +
        //                         //                 "      occa243,ta_occa14, " +
        //                         //                 "      occa28 , occa35,occa38,occa39,occa41,occa42,occa43,occa44,occa45,substring(occa55,1,1) occa55,occa56  , ta_occa22 ,occa704, " +
        //                         //                 "      ta_occa23a,ta_occa23b,ta_occa23c,ta_occa24a,ta_occa24b,ta_occa24c,ta_occa25a," +
        //                         //                 "      ta_occa25b,ta_occa25c,ta_occa26a,ta_occa26b,ta_occa26c,ta_occa26d,ta_occa26e,ta_occa26f,ta_occa26g," +
        //                         //                 "      ta_occa27,ta_occa28,ta_occa29" +
        //                         //"          --,ta_occa191 ,ta_occa192,ta_occa193 "+
        //                         "  FROM EIPB.DBO.ERP_AXMI25  " +
        //                         " WHERE ROWNO = '" + rowno + "'";
        //        rs1.Open(command);
        //        if (!rs.EOF)
        //        {
        //            //Response.Write("TEST<BR/>");
        //            for (int i = 0; i < rs.Columns.Count; i++)
        //            {
        //                //Response.Write("LOOP " + rs.Columns[i].ColumnName + "<BR/>");
        //                if (rs.Columns[i].ColumnName.ToUpper().Contains("OCC") ||
        //                   rs.Columns[i].ColumnName.ToUpper().Contains("TA_OCC"))
        //                {
        //                    //Response.Write("in<BR/>");
        //                    string colname = rs.Columns[i].ColumnName;
        //                    string newcolname = colname.ToUpper().IndexOf("OCC") == 0 ? colname.Substring(0, 3) + "a" + colname.Substring(3, colname.Length - 3) :
        //                        colname.ToUpper().IndexOf("TA_OCC") == 0 ? colname.Substring(0, 6) + "a" + colname.Substring(6, colname.Length - 6) : "";
        //                    //Response.Write("colname :" + colname + "<BR/>");
        //                    //Response.Write("newcolname :" + newcolname + "<BR/>");
        //                    try
        //                    {
        //                        if (!rs1[newcolname].ToString().Contains(rs[colname].ToString()) &&
        //                            !newcolname.Contains("occa12") &&
        //                            !newcolname.Contains("occauser") &&
        //                            !newcolname.Contains("occagrup"))
        //                        {
        //                            try
        //                            {
        //                                ContentPlaceHolder cnt;
        //                                cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
        //                                Label chb = (Label)cnt.FindControl("LABEL_" + newcolname/*rs1.Columns[i].ColumnName*/);
        //                                chb.ForeColor = System.Drawing.Color.Red;
        //                            }
        //                            catch
        //                            {
        //                                try
        //                                {
        //                                    ContentPlaceHolder cnt;
        //                                    cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
        //                                    CheckBox chb = (CheckBox)cnt.FindControl("FIELD_" + newcolname /*rs1.Columns[i].ColumnName*/);
        //                                    chb.ForeColor = System.Drawing.Color.Red;
        //                                }
        //                                catch (Exception ex)
        //                                {
        //                                    //Response.Write(ex.Message);
        //                                }
        //                            }
        //                        }
        //                    }
        //                    catch { }
        //                }
        //            }
        //        }
        //        //新增時不用去考慮變紅字
        //        //else if (rs.Rows.Count == 0)
        //        //{
        //        //    for (int i = 0; i < rs.Columns.Count; i++)
        //        //    {
        //        //        try
        //        //        {
        //        //            ContentPlaceHolder cnt;
        //        //            cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
        //        //            Label chb = (Label)cnt.FindControl("LABEL_" + rs.Columns[i].ColumnName);
        //        //            chb.ForeColor = System.Drawing.Color.Red;
        //        //        }
        //        //        catch (Exception ex)
        //        //        {
        //        //        }
        //        //    }
        //        //}
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message);
        //    }
        //}
        protected void changeIsState(string s)
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM EIPB.DBO.ERP_AXMI25 WHERE ROWNO='" + Request.QueryString["ROWNO"] + "' ");
                if (!rs.EOF)
                {
                    rs["isState"] = s;
                    rs.Update();
                }
                rs.Close();
                rs.Dispose();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected bool checkuser()
        {
            try
            {
                bool result = false;
                string command_flow = "select a.text , b.id bid, revieweruid from dgflowqueue a left join dguser " +
                                      " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().ToUpper().Trim().Replace("VIEW", "EDIT") +
                                      "'  AND reviewdate IS NULL AND qseq is not null";
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open(command_flow);

                if (!rs.EOF)
                {
                    if ((rs["text"].ToString().Contains("財務1") && (this.FIELD_occa00.Text.Contains("I"))) ||
                        (rs["text"].ToString().Contains("執行長") && (this.FIELD_occa00.Text.Contains("U"))) ||
                        (rs["text"].ToString().Contains("財務長") && (this.FIELD_occa00.Text.Contains("V"))) ||
                        (rs["text"].ToString().Contains("財務")))
                    {
                        result = true;
                    }
                }

                //MIS 可以改
                if (Utility.MIS_Manager(CurrentUser.LogonID))
                {
                    result = true;
                }

                rs.Close();
                rs.Dispose();
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected bool CheckCurrectUserFlowis(bool check)
        {
            try
            {
                bool result = true;
                string command_flow = "select a.text , b.id bid, revieweruid from dgflowqueue a left join dguser " +
                                      " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().ToUpper().Trim().Replace("VIEW", "EDIT") +
                                      "'  AND reviewdate IS NULL AND qseq is not null";
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open(command_flow);
                if (!rs.EOF)
                {
                    //if (this.CurrentUser.ID.ToUpper().Contains(rs["bid"].ToString().ToUpper()) ||
                    //    isAgent(this.CurrentUser.ID.ToUpper()))
                    //{
                    if ((rs["text"].ToString().Contains("財務1") && (this.FIELD_occa00.Text.Contains("I"))) ||
                        (rs["text"].ToString().Contains("執行長") && (this.FIELD_occa00.Text.Contains("U"))) ||
                        (rs["text"].ToString().Contains("財務長") && (this.FIELD_occa00.Text.Contains("V"))))
                    {
                        if (this.FlowFeedback1.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
                        {
                            if (check)
                            {
                                if (this.FIELD_occa01.Text.Trim() == "")
                                {
                                    Response.Write("<script>alert('請輸入客戶代號');</script>");
                                    result = false;
                                }
                                else if (checkdupicat() && this.FIELD_occa00.Text.Contains("I"))
                                {
                                    Response.Write("<script>alert('客戶代號已有重複');</script>");
                                    result = false;
                                }
                            }
                        }
                    }



                    //}
                    //else
                    //    result = false;
                }
                rs.Close();
                rs.Dispose();

                ///add by carol 20180810
                if (ConfirmUser() && this.FIELD_occa00.Text.Contains("I"))
                {

                    if (this.FIELD_occa01.Text.Trim() == "")
                    {
                        //Herzog 於 20180906 拿掉,財務這個先不用給客代
                        //Response.Write("<script>alert('請輸入客戶代號');</script>");
                        //result = false;
                    }
                    else if (checkdupicat() && this.FIELD_occa00.Text.Contains("I"))
                    {
                        Response.Write("<script>alert('客戶代號已有重複');</script>");
                        result = false;
                    }

                    //Utility.log(11, FIELD_occa01.Text, FIELD_occa00.Text, CurrentUser.LogonID);
                }

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private bool checkdupicat()
        {
            try
            {
                bool result = false;
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                string planid = rs2.ExecuteScalar("SELECT PlantID FROM EIPB.DBO.ERP_AXMI25 WHERE ROWNO = '" +
                    Request.QueryString["ROWNO"].ToString() + "' ").ToString();
                rs2.Close();
                rs2.Dispose();
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                string command = "SELECT OCC01 " +
                                 "    FROM [IP185].[" + planid + "].[dbo].[OCC_FILE] " +
                                 "   WHERE OCC01 = '" + this.FIELD_occa01.Text.Trim() + "' ";
                rs.Open(command);

                if ((!rs.EOF))
                    result = true;
                rs.Close();
                rs.Dispose();
                return result;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
                return false;
            }
        }
        protected void initupdate()
        {
            try
            {
                ContentPlaceHolder cnt;
                cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                CheckBoxList chb = (CheckBoxList)cnt.FindControl("CheckBoxFile");
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs2.Open("SELECT id,FileName FROM EIPB.DBO.ERP_AXMI25_UpdateFile WHERE rowno='" + Request.QueryString["ROWNO"] + "'");
                while (!rs2.EOF)
                {
                    this.Label22.Visible = true;
                    chb.Items.Add(new ListItem("<a href=\"FileDownload.aspx?id=" + rs2["id"].ToString() + "\" target=\"_blank\">" + rs2["FileName"].ToString() + "</a>", rs2["id"].ToString()));
                    rs2.MoveNext();
                }
                rs2.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        protected void initdropfield()
        {
            try
            {
                ////FIELD_argv2
                //this.FIELD_argv2.Items.Add(new ListItem("請選擇", ""));
                //this.FIELD_argv2.Items.Add(new ListItem("Y:異動", "Y"));
                //this.FIELD_argv2.Items.Add(new ListItem("N:無異動", "N"));
                //this.FIELD_argv2.Items.Add(new ListItem("V:生失效異動", "V"));

                ////FIELD_occa00 i:新增 u:修改 v:生失效
                //this.FIELD_occa00.Items.Add(new ListItem("請選擇", ""));
                //this.FIELD_occa00.Items.Add(new ListItem("V:生失效", "V"));
                //this.FIELD_occa00.Items.Add(new ListItem("U:修改", "U"));
                //this.FIELD_occa00.Items.Add(new ListItem("I:新增", "I"));

                ////FIELD_occa1004 至eip狀態則依EIP狀態，txt檔的部份～駁回此欄位回傳R，完成審核此欄位回傳1。
                //this.FIELD_occa1004.Items.Add(new ListItem("請選擇", ""));
                //this.FIELD_occa1004.Items.Add(new ListItem("R:駁回", "R"));
                //this.FIELD_occa1004.Items.Add(new ListItem("0:開立", "0"));
                //this.FIELD_occa1004.Items.Add(new ListItem("1:完成審核", "1"));

                ////FIELD_ta_occa11 0:無 1:訂單  2:forecast  3:兩者
                //this.FIELD_ta_occa11.Items.Add(new ListItem("請選擇", ""));
                //this.FIELD_ta_occa11.Items.Add(new ListItem("0:無", "0"));
                //this.FIELD_ta_occa11.Items.Add(new ListItem("1:訂單", "1"));
                //this.FIELD_ta_occa11.Items.Add(new ListItem("2:forecast", "2"));
                //this.FIELD_ta_occa11.Items.Add(new ListItem("3:兩者", "3"));

                //FIELD_occa61
                this.FIELD_ta_occa29.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa23c.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa24c.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa25c.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa26c.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa26f.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa23b.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa24b.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa25b.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa26b.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa26e.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa26g.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_ta_occa26d.Attributes.Add("ontextchange", "num_format(this.id);");
                this.FIELD_occa63.Attributes.Add("ontextchange", "num_format(this.id);");
                /*  V1.0.12  delete 
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                string command = "SELECT ocg01 " +
                                 " FROM [IP185].[MINAIK].[dbo].[OCG_FILE] ";
                rs.Open(command);
                this.FIELD_occa61_s.Items.Add(new ListItem("請選擇", "")); //V1.0.9
                while (!rs.EOF)
                {
                    this.FIELD_occa61_s.Items.Add(new ListItem(rs["ocg01"].ToString(), rs["ocg01"].ToString())); //V1.0.9
                    rs.MoveNext();
                }
                rs.Close();
                rs.Dispose();
                */

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        protected void initdata()
        {
            try
            {

                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT * FROM EIPB.DBO.ERP_AXMI25 WHERE ROWNO='" + Request.QueryString["ROWNO"] + "' ");
                if (!rs.EOF)
                {
                    PlantID.Value = rs["PlantID"].ToString();
                    this.FIELD_occa01.Text = rs["occa01"].ToString();
                    this.FIELD_occa36.Text = rs["occa36"].ToString();
                    this.FIELD_occa37.Checked = bool.Parse(rs["occa37"].ToString() == "N" ? "false" : "true");
                    //this.FIELD_occa56.Checked = bool.Parse(rs["occa56"].ToString() == "N" ? "false" : "true");
/* delete by v1.0.12
                     //this.FIELD_occa61_s.SelectedValue = rs["occa61"].ToString(); //V1.0.9
                    //this.FIELD_occa61.Text = rs["occa61"].ToString();//V1.0.9
*/
                    this.FIELD_occa63.Text = rs["occa63"].ToString();
                    this.FIELD_ta_occa06.Checked = bool.Parse(rs["ta_occa06"].ToString() == "N" ? "false" : "true");
                    this.FIELD_ta_occa07.Checked = bool.Parse(rs["ta_occa07"].ToString() == "N" ? "false" : "true");
                    if (rs["argv2"].ToString().Contains("Y"))
                        this.FIELD_argv2.Text = "Y:異動";
                    if (rs["argv2"].ToString().Contains("N"))
                        this.FIELD_argv2.Text = "N:無異動";
                    if (rs["argv2"].ToString().Contains("V"))
                        this.FIELD_argv2.Text = "V:生失效異動";
                    //this.FIELD_argv2.Text = rs["argv2"].ToString();
                    //this.FIELD_occa00.SelectedValue = rs["occa00"].ToString().Substring(0,1) ;
                    if (rs["occa00"].ToString().Contains("V"))
                    {
                        this.FIELD_occa00.Text = "V:生失效";
                        this.hide_occa00.Value = "V";
                    }
                    if (rs["occa00"].ToString().Contains("U"))
                    {
                        this.FIELD_occa00.Text = "U:修改";
                        this.hide_occa00.Value = "U";
                    }
                    if (rs["occa00"].ToString().Contains("I"))
                    {
                        this.FIELD_occa00.Text = "I:新增";
                        this.hide_occa00.Value = "I";
                    }
                    this.FIELD_occano.Text = rs["occano"].ToString();
                    this.FIELD_occa02.Text = rs["occa02"].ToString();
                    this.FIELD_occa03.Text = rs["occa03"].ToString() + " " + rs["oca02_0"].ToString();
                    this.FIELD_occa04.Text = rs["occa04"].ToString() + " " + rs["gen02_1"].ToString();
                    this.FIELD_occa06.Text = rs["occa06"].ToString();
                    this.FIELD_occa07.Text = rs["occa07"].ToString();
                    this.FIELD_occa08.Text = rs["occa08"].ToString();
                    this.FIELD_occa09.Text = rs["occa09"].ToString();
                    this.FIELD_occa11.Text = rs["occa11"].ToString();
                    this.FIELD_occa12.Text = rs["occa12"].ToString();
                    //this.FIELD_occa13.Text = rs["occa13"].ToString();
                    //this.FIELD_occa14.Text = rs["occa14"].ToString();
                    this.FIELD_occa15.Text = rs["occa15"].ToString();
                    this.FIELD_occa18.Text = rs["occa18"].ToString() + " " + rs["occa19"].ToString();
                    //this.FIELD_occa19.Text = rs["occa19"].ToString();
                    this.FIELD_occa20.Text = rs["occa20"].ToString() + " " + rs["gea02_2"];
                    this.FIELD_occa21.Text = rs["occa21"].ToString() + " " + rs["geb02_3"];

                    //this.FIELD_occa262.Text = rs["occa262"].ToString();
                    //this.FIELD_occa263.Text = rs["occa263"].ToString();
                    //this.FIELD_occa271.Text = rs["occa271"].ToString();
                    //this.FIELD_occa272.Text = rs["occa272"].ToString();
                    //this.FIELD_occa273.Text = rs["occa273"].ToString();
                    this.FIELD_occa28.Text = rs["occa28"].ToString();

                    //this.FIELD_occa23.Text = rs["occa23"].ToString();
                    //this.FIELD_occa24.Text = rs["occa24"].ToString();
                    //this.FIELD_occa261.Text = rs["occa261"].ToString();
                    //this.FIELD_occa29.Text = rs["occa29"].ToString();
                    //this.FIELD_occa292.Text = rs["occa292"].ToString();
                    //this.FIELD_occa30.Text = rs["occa30"].ToString();
                    //this.FIELD_occa302.Text = rs["occa302"].ToString();
                    //this.FIELD_occa33.Text = rs["occa33"].ToString();
                    this.FIELD_occa45.Text = rs["occa45"].ToString() + " " + rs["oag02_6"].ToString();
                    //this.FIELD_occa46.Text = rs["occa46"].ToString();
                    //this.FIELD_occa47.Text = rs["occa47"].ToString();
                    //this.FIELD_occa48.Text = rs["occa48"].ToString();
                    //this.FIELD_occa49.Text = rs["occa49"].ToString();
                    //this.FIELD_occa50.Text = rs["occa50"].ToString();
                    //this.FIELD_occa62.Text = rs["occa62"].ToString();
                    //this.FIELD_occa631.Text = rs["occa631"].ToString();
                    //this.FIELD_occa701.Text = rs["occa701"].ToString();
                    //this.FIELD_occa702.Text = rs["occa702"].ToString();
                    //this.FIELD_occa703.Text = rs["occa703"].ToString();
                    //this.FIELD_occa704.Text = rs["occa704"].ToString();
                    //this.FIELD_occaacti.Text = rs["occaacti"].ToString();
                    //this.FIELD_ta_occa12.Text = rs["ta_occa12"].ToString();
                    //this.FIELD_ta_occa19.Text = rs["ta_occa19"].ToString();

                    this.FIELD_occa35.Text = rs["occa35"].ToString();
                    this.FIELD_ta_occa1301.Text = rs["ta_occa1301"].ToString();
                    this.FIELD_ta_occa1302.Text = rs["ta_occa1302"].ToString();
                    this.FIELD_occa41.Text = rs["occa41"].ToString();
                    this.FIELD_occa42.Text = rs["occa42"].ToString();
                    this.FIELD_occa43.Text = rs["occa43"].ToString() + " " + rs["oab02_4"].ToString();
                    this.FIELD_occa44.Text = rs["occa44"].ToString() + " " + rs["oah02_5"].ToString();

                    //this.FIELD_occa51.Text = rs["occa51"].ToString();
                    this.FIELD_occa55.Text = rs["occa55"].ToString();

                    this.FIELD_ta_occa20.Text = rs["ta_occa20"].ToString() + " " + rs["tc_oah02_16"];
                    this.FIELD_ta_occa21.Text = rs["ta_occa21"].ToString();

                    this.FIELD_occauser.Text = rs["occauser"].ToString() + " " + rs["gen02_13"].ToString();
                    this.FIELD_occagrup.Text = rs["occagrup"].ToString() + " " + rs["gem02_14"].ToString();
 

                    //this.FIELD_occa1004.SelectedValue = rs["occa1004"].ToString().Substring(0,1);
                    this.FIELD_occaud15.Text = Convert.ToDateTime(rs["occaud15"]).ToString("yyyy/MM/dd");
                    this.FIELD_ta_occa0801.Text = rs["ta_occa0801"].ToString() + " " + rs["pmc03_7"].ToString();
                    this.FIELD_ta_occa0802.Text = rs["ta_occa0802"].ToString() + " " + rs["pmc03_8"].ToString();
                    this.FIELD_ta_occa0803.Text = rs["ta_occa0803"].ToString() + " " + rs["pmc03_9"].ToString();
                    this.FIELD_ta_occa0901.Text = rs["ta_occa0901"].ToString() + " " + rs["pma02_10"].ToString();
                    this.FIELD_ta_occa0902.Text = rs["ta_occa0902"].ToString() + " " + rs["pma02_11"].ToString();
                    this.FIELD_ta_occa0903.Text = rs["ta_occa0903"].ToString() + " " + rs["pma02_12"].ToString();


                    this.hidd_ta_occa0801.Value = rs["ta_occa0801"].ToString();
                    this.hidd_ta_occa0802.Value = rs["ta_occa0802"].ToString();
                    this.hidd_ta_occa0803.Value = rs["ta_occa0803"].ToString();
                    this.hidd_ta_occa0901.Value = rs["ta_occa0901"].ToString();
                    this.hidd_ta_occa0902.Value = rs["ta_occa0902"].ToString();
                    this.hidd_ta_occa0903.Value = rs["ta_occa0903"].ToString();

                    this.FIELD_ta_occa10.Text = rs["ta_occa10"].ToString();

                    this.FIELD_ta_occa23a.Text = rs["ta_occa23a"].ToString();
                    this.FIELD_ta_occa23b.Text = rs["ta_occa23b"].ToString();
                    this.FIELD_ta_occa23c.Text = rs["ta_occa23c"].ToString();
                    this.FIELD_ta_occa24a.Text = rs["ta_occa24a"].ToString();
                    this.FIELD_ta_occa24b.Text = rs["ta_occa24b"].ToString();
                    this.FIELD_ta_occa24c.Text = rs["ta_occa24c"].ToString();
                    this.FIELD_ta_occa25a.Text = rs["ta_occa25a"].ToString();
                    this.FIELD_ta_occa25b.Text = rs["ta_occa25b"].ToString();
                    this.FIELD_ta_occa25c.Text = rs["ta_occa25c"].ToString();
                    this.FIELD_ta_occa26a.Text = rs["ta_occa26a"].ToString();
                    this.FIELD_ta_occa26b.Text = rs["ta_occa26b"].ToString();
                    this.FIELD_ta_occa26c.Text = rs["ta_occa26c"].ToString();
                    this.FIELD_ta_occa26d.Text = rs["ta_occa26d"].ToString();
                    this.FIELD_ta_occa26e.Text = rs["ta_occa26e"].ToString();
                    this.FIELD_ta_occa26f.Text = rs["ta_occa26f"].ToString();
                    this.FIELD_ta_occa26g.Text = rs["ta_occa26g"].ToString();
                    this.FIELD_ta_occa27.Text = rs["ta_occa27"].ToString();
                    this.FIELD_ta_occa28.Text = rs["ta_occa28"].ToString();
                    this.FIELD_ta_occa29.Text = rs["ta_occa29"].ToString();

                    if (rs["ta_occa11"].ToString().Contains("0"))
                    {
                        this.FIELD_ta_occa11.Text = "0:無";
                        hidden_ta_occa11.Value = "0";
                    }
                    if (rs["ta_occa11"].ToString().Contains("1"))
                    {
                        this.FIELD_ta_occa11.Text = "1:訂單";
                        hidden_ta_occa11.Value = "1";
                    }
                    if (rs["ta_occa11"].ToString().Contains("2"))
                    {
                        this.FIELD_ta_occa11.Text = "2:forecast";
                        hidden_ta_occa11.Value = "2";
                    }
                    if (rs["ta_occa11"].ToString().Contains("3"))
                    {
                        this.FIELD_ta_occa11.Text = "3:兩者";
                        hidden_ta_occa11.Value = "3";
                    }

                    //this.FIELD_ta_occa11.SelectedValue = rs["ta_occa11"].ToString().Substring(0,1);

                    this.FIELD_ta_occa14.Text = rs["ta_occa14"].ToString();
                    this.FIELD_ta_occa15.Text = rs["ta_occa15"].ToString();

                    this.FIELD_occanote.Text = rs["occanote"].ToString();
                    this.FIELD_ta_occa1201.Text = rs["ta_occa1201"].ToString();
                    this.FIELD_ta_occa1202.Text = rs["ta_occa1202"].ToString();
                    this.FIELD_ta_occa1203.Text = rs["ta_occa1203"].ToString();
                    this.FIELD_ta_occa191.Text = rs["ta_occa191"].ToString() + Environment.NewLine + rs["ta_occa192"].ToString() + Environment.NewLine + rs["ta_occa193"].ToString();
                    this.FIELD_occa231.Text = rs["occa231"].ToString() + Environment.NewLine + rs["occa232"].ToString() + Environment.NewLine + rs["occa233"].ToString();
                    this.FIELD_occa241.Text = rs["occa241"].ToString() + Environment.NewLine + rs["occa242"].ToString() + Environment.NewLine + rs["occa243"].ToString();
                    this.FIELD_occa45_NOTE.Text = rs["occa45_NOTE"].ToString();


                    this.FIELD_ta_occa22.Checked = rs["ta_occa22"].ToString().Contains("Y");
                    this.FIELD_occa704.Text = rs["occa704"].ToString();
                    //if (rs["isState"].ToString().Contains("waiting") ||
                    //    rs["isState"].ToString().Contains("Terminate"))
                    //{
                    //    this.BUTTON_save.Enabled = true;
                    //    this.BUTTON_delete.Enabled = true;
                    //}
                    //else
                    //{
                    //    this.BUTTON_save.Enabled = false;
                    //    this.BUTTON_delete.Enabled = false;
                    //}

                    //銀行資料 V1.0.2

                    this.FIELD_ta_occa01.Text = rs["ta_occa01"].ToString();
                    this.FIELD_ta_occa02.Text = rs["ta_occa02"].ToString();
                    this.FIELD_ta_occa03.Text = rs["ta_occa03"].ToString();
                    this.FIELD_ta_occa04.Text = rs["ta_occa04"].ToString();
                    this.FIELD_ta_occa05.Text = rs["ta_occa05"].ToString();


                    FIELD_occa38.Text = rs["occa38"].ToString();
                    FIELD_occa39.Text = rs["occa39"].ToString();
                    FIELD_occa631.Text = rs["occa631"].ToString();

                    // V1.0.2  end 

                    if (rs["l_day"].ToString() == "Y")
                    {
                        this.LABEL_occa45_NOTE.Visible = true;
                        this.FIELD_occa45_NOTE.Visible = true;

                    }
                    else
                    {
                        this.LABEL_occa45_NOTE.Visible = false;
                        this.FIELD_occa45_NOTE.Visible = false;
                    }


                    if (rs["PlantID"].ToString().ToUpper() == "GIT")
                    {
                        img_mark.ImageUrl = "/gif/GIT.gif"; //size 80%
                        img_mark.Width = 517;
                        img_mark.Height = 88;
                    }
                    else
                    {
                        img_mark.ImageUrl = "/gif/MINAIK02.gif"; //size 70%
                        img_mark.Width = 287;
                        img_mark.Height = 71;
                    }

                    //update by  V1.0.12 
                    SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    string command = "SELECT ocg01 " +
                                     " FROM [IP185].[" + PlantID.Value + "].[dbo].[OCG_FILE] ";
                    rs2.Open(command);
                    this.FIELD_occa61_s.Items.Add(new ListItem("請選擇", "")); //V1.0.9
                    while (!rs2.EOF)
                    {
                        this.FIELD_occa61_s.Items.Add(new ListItem(rs2["ocg01"].ToString(), rs2["ocg01"].ToString())); //V1.0.9
                        rs2.MoveNext();
                    }
                    rs2.Close();
                    rs2.Dispose();

                    this.FIELD_occa61_s.SelectedValue = rs["occa61"].ToString(); //V1.0.9
                    this.FIELD_occa61.Text = rs["occa61"].ToString();//V1.0.9
                    //update by  V1.0.12  end
                }
                else
                {
                    Response.Redirect("ERP_AXMI25.aspx");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            this.GoBack();
        }

        /* carol.yeh 20180510
        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            //手動發mail 給下一關審核者
            try
            {
                //writetofile("Page_PreRender");
                if (_NotifyReview)
                {
                    //sendmail(_NodeType);  //2018/04/23 因為hostory 也有，所以這邊就 刪掉
                    //Response.Write(_NodeType);
                    //UpdateNextNo();
                    //Response.Redirect("ERP_AXMI25.aspx");
                    //this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
                    //      "RedirectAfterCommit",
                    //      "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");
                    //Response.Redirect("/Flowwork/MyApproval.aspx");

                }
            }
            catch (Exception ex)
            {
                this.AddError(null, "Page_preRender", "", ex.Message);
            }

        }
        
            //找不到呼叫 20180510
        private void UpdateNextNo()
        {
            try
            {
                SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                ds.Open(" select revieweruid  from  dgflowqueue   where requesturl = '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") +
                    //"  and revieweruid='" + this.CurrentUser.ID.Substring(1, 36) +
                    "' and  initdate=(select MAX(initdate)   from  dgflowqueue    where requesturl = '" +
                    Request.RawUrl.ToString().Trim().Replace("view", "edit") + "')");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        */
        protected void sendmail(string type)
        {
            try
            {
                switch (type)
                {
                    case "Next":
                        ApproveMail();
                        break;
                    case "Complete":
                        FinishApprove();
                        break;
                    case "Terminate":
                        RejectResult();
                        break;
                    case "Back":
                        ApproveMail();
                        break;
                        //default:
                        //    ApproveMail();
                        //    break;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        private void RejectResult()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rss.Open("SELECT U.name , U.email,U.id " +
                         " FROM EIPB.DBO.ERP_AXMI25 ERP LEFT JOIN EIPA.DBO.DGUSER U  " +
                         "   ON ERP.OCCAUSER = U.erpid " +
                         "WHERE 1=1 " +
                         "  AND ERP.ROWNO = '" + Request.QueryString["rowno"].ToString() + "'   ");
                if (!rss.EOF)
                {

                    //Response.Write("Page_PreRenderA.2<br>");
                    string MId = "{4849B051-F909-481D-AA44-2624A881959B}";
                    string PapCaption = "";
                    string receivername = rss["name"].ToString();
                    string requesturl = "http://eip.minaik.com.tw" + Request.RawUrl.ToString().Trim();
                    string reviewresult = "";
                    if (this.FIELD_occa00.Text.Contains("V"))
                    {
                        PapCaption = @"客戶代號申請單，退回 " + (this.FIELD_ta_occa14.Text.Contains("Y") ? "原生效客戶改為失效" : "原失效客戶改為有效") + "、ERP單號 " + this.FIELD_occano.Text + " 客戶簡稱 " + this.FIELD_occa02.Text;
                    }
                    else
                    {
                        PapCaption = @"客戶代號申請單，退回 " + (this.FIELD_occa00.Text.Contains("I") ? "新增" : "修改") + "、ERP單號 " + this.FIELD_occano.Text + " 客戶簡稱 " + this.FIELD_occa02.Text;
                    }
                    string PID = this.FIELD_occano.Text;//FIELD_pmcsn.Text + addmemo();
                    string AppName = rss["name"].ToString();
                    string purl = "http://eip.minaik.com.tw" + Request.RawUrl.ToString().Trim();
                    string AppMail = rss["email"].ToString();
                    string body = "";
                    ShrFlowMail UseMail = new ShrFlowMail();
                    UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, AppMail, body);
                }
                else
                {
                    Response.Write(rss.SQL);
                }
                rss.Close();
                rss.Dispose();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        private void FinishApprove()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                // V1.0.11 update yb  carol 20190412   君洋人員收不到信
                string command = "SELECT U.name , U.email,ER.occano , ER.ta_occa14 , ER.occa00 " +
                             " FROM EIPB.DBO.ERP_AXMI25 ER " +
                             " LEFT JOIN EIPA.DBO.dgusererpid e  ON e.erpid = er.occauser  " +
                             " LEFT JOIN EIPA.DBO.dguser U  ON e.id = U.id  " +
                             " WHERE 1=1 " +
                             " AND ER.ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'";

                rss.Open(command); // V1.0.11

                //V1.0.11
                //rss.Open("SELECT U.name NAME , U.email,U.id " +
                //         "     FROM EIPB.DBO.ERP_AXMI25 ERP LEFT JOIN EIPA.DBO.DGUSER U " +
                //         "       ON ERP.occauser = U.erpid " +
                //         "    WHERE 1 = 1 " +
                //         "      AND ERP.rowno = ''");
                

                if (!rss.EOF)
                {

                    //Response.Write("Page_PreRenderA.2<br>");
                    string MId = "{4849B051-F909-481D-AA44-2624A881959B}";
                    string PapCaption = "";
                    string receivername = rss["name"].ToString();
                    string requesturl = "http://eip.minaik.com.tw" + Request.RawUrl.ToString().Trim();
                    string reviewresult = "";//審核完成
                    if (this.FIELD_occa00.Text.Contains("V"))
                    {
                        PapCaption = @"客戶代號申請單，審核完成 " + (this.FIELD_ta_occa14.Text.Contains("Y") ? "原生效客戶改為失效" : "原失效客戶改為有效") + "、ERP單號 " + this.FIELD_occano.Text + " 客戶簡稱 " + this.FIELD_occa02.Text;
                    }
                    else
                    {
                        PapCaption = @"客戶代號申請單，審核完成 " + (this.FIELD_occa00.Text.Contains("I") ? "新增" : "修改") + "、ERP單號 " + this.FIELD_occano.Text + " 客戶簡稱 " + this.FIELD_occa02.Text;
                    }
                    string PID = this.FIELD_occano.Text;//FIELD_pmcsn.Text + addmemo();
                    string AppName = rss["name"].ToString();
                    string purl = "http://eip.minaik.com.tw" + Request.RawUrl.ToString().Trim();
                    string AppMail = rss["email"].ToString();
                    string body = "";


                    ShrFlowMail UseMail = new ShrFlowMail();
                    UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, AppMail, body);
                    UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, "pearl.hsieh@minaik.com.tw", body);
                    UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, "carol.yeh@minaik.com.tw", body);

                    //UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, "rage.mai@minaik.com.tw", body); v1.0.1
                    //UseMail.ApproveMail(MId, PapCaption, PID, AppName, urlink, "herzog.lin@minaik.com.tw", body);
                    //  DeputyApprove(rss["revieweruid"].ToString());
                }
                else
                {
                    // Response.Write(rss.SQL);
                }
                rss.Close();
                rss.Dispose();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        private void ApproveMail()
        {
            try
            {
                DBTransfer gd = new DBTransfer();
                //Response.Write("Enter Send Mail");
                SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rss.Open("select   REPLACE(requesturl,'EDIT','VIEW') requesturl,b.name name,email,b.id bid, revieweruid from dgflowqueue a left join dguser" +
                    " b on revieweruid=b.id where requesturl= '" + Request.RawUrl.ToString().Trim().Replace("view", "edit") + "'  AND reviewdate IS NULL AND qseq is not null ");
                if (!rss.EOF)
                {
                    string MId = "{4849B051-F909-481D-AA44-2624A881959B}";
                    string PapCaption = "";

                    if (this.FIELD_occa00.Text.Contains("V"))
                    {
                        PapCaption = @"客戶代號申請單，" + (this.FIELD_ta_occa14.Text.Contains("Y") ? "原生效客戶改為失效" : "原失效客戶改為有效") + "、ERP單號 " + this.FIELD_occano.Text + " 客戶簡稱 " + this.FIELD_occa02.Text;
                    }
                    else
                    {
                        PapCaption = @"客戶代號申請單， " + (this.FIELD_occa00.Text.Contains("I") ? "新增" : "修改") + "、ERP單號 " + this.FIELD_occano.Text + " 客戶簡稱 " + this.FIELD_occa02.Text;
                    }

                    string PID = this.FIELD_occano.Text;//FIELD_pmcsn.Text + addmemo();
                    string AppName = rss["name"].ToString();
                    string purl = "http://eip.minaik.com.tw" + rss["requesturl"].ToString().ToLower().Replace("edit", "View");
                    string AppMail = rss["email"].ToString();
                    string body = "";
                    ShrFlowMail UseMail = new ShrFlowMail();
                    UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, AppMail, body);
                    UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, "rage.mai@minaik.com.tw", body);
                    #region 代理人
                    SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rs2.Open(" SELECT b.name name,email FROM dguserdeputy a left join dguser b on a.deputyuid=b.id left join dgflow c on a.sid=c.id  " +
                             " where  a.uid='" + rss["bid"].ToString() + "'  " +
                             " and  " +
                             " ((a.sid is null and  sdate < GETDATE() and edate is null) or " +
                             " (c.typename like 'ERP_FLOW%' and sdate < GETDATE() and edate is null) or " +
                             " (c.typename like 'ERP_FLOW%' and sdate < GETDATE() and edate > GETDATE()) or " +
                             "  a.sid is null and sdate < GETDATE() and edate  > GETDATE()) group by b.name,email ");
                    while (!rs2.EOF)
                    {
                        //MyLibrary_AXMT610 Backsend = new MyLibrary_AXMT610();
                        UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, rs2["email"].ToString(), body);  //link,name,who mail,titel
                        UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, "rage.mai@minaik.com.tw", body);
                        rs2.MoveNext();

                    }
                    rs2.Close();
                    #endregion
                }
                rss.Close();
                rss.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        //審核-送出
        protected void BUTTON_FlowFeedback_Click(object sender, EventArgs e)
        {
            try
            {
                Utility.log(1, "BUTTON_FlowFeedback_Click:" + FIELD_occano.Text + "," + CurrentUser.Name);
                //save_form();
                if (CheckCurrectUserFlowis(true))
                {

                    this.FlowFeedback1.Commit();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        //該節同意
        protected void FlowFeedback1_FlowNodeComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowNodeCompleteEventArgs e)
        {
            try
            {
                //writetofile("FlowFeedback1_FlowNodeComplete");
                _NotifyReview = true;
                _NodeType = e.ResultType.ToString();

                //Utility.log(11, "FlowFeedback1_FlowNodeComplete:" + FIELD_occano.Text + "," + CurrentUser.Name + "," + _NodeType);

                if (e.ResultType == SmoothEnterprise.Flowwork.Control.ReviewResultType.Next)
                {
                    e.NextNode = e.FlowNode.DefaultNode();
                    //_NodeType = "Next";
                    e.NextNode.ReviewerURL = "/ERP_AXMI25/ERP_AXMI25View.aspx";
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message+"<br/>"+ex.StackTrace+"<br/>");
            }

        }

        protected void BUTTON_save_Click(object sender, System.EventArgs e)
        {
            if (this.IsValid)
            {
                try
                {
                    //if (checkupdata())
                    //{

                    save_form();
                    //UpdateFile();
                    //}
                    //Response.Redirect("ERP_AXMI25.aspx");
                }
                catch (Exception ex)
                {
                    this.AddError(this, "BUTTON_save_Click()", "", ex.Message);
                }
            }
        }

        /// <summary>
        /// 檢查更新的資料
        /// </summary>
        /// <returns></returns>
        //private bool checkupdata()
        //{
        //    try
        //    {
        //        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //        rs.Open("SELECT C.* , F.FileName " +
        //                "  FROM EIPB.DBO.ERP_AXMI25 C , EIPB.DBO.ERP_AXMI25_File F " +
        //                " WHERE C.ROWNO = F.rowno " +
        //                "   AND C.ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'");


        //        string path = @"D:\ERP_CNE";//"D:\\test\\test_rage.txt";
        //        string filename = rs["FileName"].ToString().Split('.')[0] + ".txt";
        //        string fullfilename = path + "\\" + filename;

        //        string zone = rs["PlantID"].ToString()
        //                , filed = "", cont = ""
        //                , number = rs["occano"].ToString()
        //                , apply = rs["occa00"].ToString().Substring(0, 1);
        //        string content_head = "";// "廠區     欄位名稱 欄位內容  單號  申請性質\r\n";

        //        contex cob = new contex();

        //        #region 客戶編號
        //        //if (this.FIELD_occa01.Text.Trim() != rs["occa01"].ToString().Trim())
        //        //{
        //        //if (this.FIELD_occa01.Text.Trim().Length != 0)
        //        //{
        //        filed = "occa01";
        //        cont = this.FIELD_occa01.Text.Trim();
        //        if (cont.Trim() != "")
        //            cob.add(zone, filed, cont, number, apply);
        //        //}
        //        //}
        //        #endregion
        //        #region 寬限天數
        //        //if (this.FIELD_occa36.Text.Trim() != rs["occa36"].ToString().Trim())
        //        //{
        //        //if (this.FIELD_occa36.Text.Trim().Length != 0)
        //        //{
        //        filed = "occa36";
        //        cont = this.FIELD_occa36.Text.Trim();
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        //}
        //        #endregion
        //        #region 是否為關係人(y/n)
        //        //if (this.FIELD_occa37.Checked != bool.Parse(rs["occa37"].ToString().Trim() == "N" ? "false" : "true"))
        //        //{
        //        //if (this.FIELD_occa37.Text.Trim().Length != 0)
        //        //{
        //        filed = "occa37";
        //        cont = this.FIELD_occa37.Checked ? "Y" : "N";
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        //}
        //        #endregion
        //        #region 信用評等
        //        //if (this.FIELD_occa61.Text.Trim() != rs["occa61"].ToString().Trim())
        //        //{
        //        //if (this.FIELD_occa61.Text.Trim().Length != 0)
        //        //{
        //        filed = "occa61";
        //        cont = this.FIELD_occa61.SelectedValue;
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        //}
        //        #endregion
        //        #region 信用額度
        //        //if (this.FIELD_occa63.Text.Trim() != rs["occa63"].ToString().Trim())
        //        //{
        //        //if (this.FIELD_occa63.Text.Trim().Length != 0)
        //        //{
        //        filed = "occa63";
        //        cont = trimformat(this.FIELD_occa63.Text.Trim());
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        //}
        //        #endregion

        //        #region 非關係人回轉
        //        //if (this.FIELD_ta_occa06.Text.Trim() != rs["ta_occa06"].ToString().Trim())
        //        //{
        //        filed = "ta_occa06";
        //        cont = this.FIELD_ta_occa06.Checked ? "Y" : "N";
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        #endregion
        //        #region 關係人回轉否
        //        //if (this.FIELD_ta_occa07.Checked != bool.Parse(rs["ta_occa07"].ToString().Trim() == "N" ? "false" : "true"))
        //        //{
        //        //if (this.FIELD_ta_occa07.Text.Trim().Length != 0)
        //        //{
        //        filed = "ta_occa07";
        //        cont = this.FIELD_ta_occa07.Checked ? "Y" : "N";
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        //}
        //        #endregion
        //        #region 收款客戶編號
        //        //if (this.FIELD_ta_occa06.Text.Trim() != rs["ta_occa06"].ToString().Trim())
        //        //{
        //        filed = "occa07";
        //        cont = this.FIELD_occa07.Text.Trim() == "" ? this.FIELD_occa01.Text.Trim() : this.FIELD_occa07.Text.Trim();
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        #endregion
        //        #region 送貨客戶編號
        //        //if (this.FIELD_ta_occa06.Text.Trim() != rs["ta_occa06"].ToString().Trim())
        //        //{
        //        filed = "occa09";
        //        cont = this.FIELD_occa09.Text.Trim() == "" ? this.FIELD_occa01.Text.Trim() : this.FIELD_occa09.Text.Trim();
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        #endregion
        //        #region DNA否
        //        //if (this.FIELD_ta_occa06.Text.Trim() != rs["ta_occa06"].ToString().Trim())
        //        //{
        //        filed = "ta_occa22";
        //        cont = this.FIELD_ta_occa22.Checked ? "Y" : "N";
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        #endregion
        //        #region DNA說明
        //        //if (this.FIELD_occa704.Text.Trim() != "")
        //        //{
        //        filed = "occa704";
        //        cont = this.FIELD_occa704.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        #endregion

        //        //v1.0.3 add
        //        #region 說明1
        //        //if (this.FIELD_ta_occa06.Text.Trim() != rs["ta_occa06"].ToString().Trim())
        //        //{
        //        filed = "ta_occa1201";
        //        cont = this.FIELD_ta_occa1201.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        #endregion
        //        #region 說明2
        //        //if (this.FIELD_ta_occa06.Text.Trim() != rs["ta_occa06"].ToString().Trim())
        //        //{
        //        filed = "ta_occa1202";
        //        cont = this.FIELD_ta_occa1202.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        #endregion
        //        #region 說明3
        //        //if (this.FIELD_ta_occa06.Text.Trim() != rs["ta_occa06"].ToString().Trim())
        //        //{
        //        filed = "ta_occa1203";
        //        cont = this.FIELD_ta_occa1203.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        //}
        //        #endregion
        //        //v1.0.3

        //        #region 創業日
        //        if (this.FIELD_occa12.Text.Trim().Length != 0)
        //        {
        //            filed = "occa12";
        //            cont = this.FIELD_occa12.Text;
        //            cob.add(zone, filed, cont, number, apply);
        //        }
        //        #endregion
        //        #region 員工人數
        //        filed = "occa15";
        //        cont = this.FIELD_occa15.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 資本額
        //        filed = "ta_occa29";
        //        cont = trimformat(this.FIELD_ta_occa29.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近3 年年度1
        //        filed = "ta_occa23a";
        //        cont = this.FIELD_ta_occa23a.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近3 年年度2
        //        filed = "ta_occa24a";
        //        cont = this.FIELD_ta_occa24a.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近3 年年度3
        //        filed = "ta_occa25a";
        //        cont = this.FIELD_ta_occa25a.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近3 年營業額1
        //        filed = "ta_occa23b";
        //        cont = trimformat(this.FIELD_ta_occa23b.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近3 年營業額2
        //        filed = "ta_occa24b";
        //        cont = trimformat(this.FIELD_ta_occa24b.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近3 年營業額3
        //        filed = "ta_occa25b";
        //        cont = trimformat(this.FIELD_ta_occa25b.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近3 年稅後淨利1
        //        filed = "ta_occa23c";
        //        cont = trimformat(this.FIELD_ta_occa23c.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近3 年稅後淨利2
        //        filed = "ta_occa24c";
        //        cont = trimformat(this.FIELD_ta_occa24b.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近3 年稅後淨利3
        //        filed = "ta_occa25c";
        //        cont = trimformat(this.FIELD_ta_occa25c.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近年度
        //        filed = "ta_occa26a";
        //        cont = this.FIELD_ta_occa26a.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近年度流動資產
        //        filed = "ta_occa26b";
        //        cont = trimformat(this.FIELD_ta_occa26b.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近年度資產總額
        //        filed = "ta_occa26c";
        //        cont = trimformat(this.FIELD_ta_occa26c.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近年度流動負債
        //        filed = "ta_occa26d";
        //        cont = trimformat(this.FIELD_ta_occa26d.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近年度負債總額
        //        filed = "ta_occa26e";
        //        cont = trimformat(this.FIELD_ta_occa26e.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近年度淨資產價值
        //        filed = "ta_occa26f";
        //        cont = trimformat(this.FIELD_ta_occa26f.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 最近年度營業活動淨現金流量
        //        filed = "ta_occa26g";
        //        cont = trimformat(this.FIELD_ta_occa26g.Text);
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        #region 財務說明備註
        //        filed = "ta_occa28";
        //        cont = this.FIELD_ta_occa28.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        //V1.0.1 add
        //        #region 股票代號 
        //        filed = "ta_occa27";
        //        cont = this.FIELD_ta_occa27.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 客戶付款日(二)
        //        filed = "ta_occa1302";
        //        cont = this.FIELD_ta_occa1302.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 客戶月結日(二)
        //        filed = "ta_occa1301";
        //        cont = this.FIELD_ta_occa1301.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        //V1.0.1 end

        //        //V1.0.2 Start
        //        #region 客戶付款日 
        //        filed = "occa38";
        //        cont = this.FIELD_occa38.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 客戶月結日
        //        filed = "occa39";
        //        cont = this.FIELD_occa39.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 帳號
        //        filed = "ta_occa01";
        //        cont = this.FIELD_ta_occa01.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region SWIFT
        //        filed = "ta_occa02";
        //        cont = this.FIELD_ta_occa02.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 電話
        //        filed = "ta_occa03";
        //        cont = this.FIELD_ta_occa03.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 傳真
        //        filed = "ta_occa04";
        //        cont = this.FIELD_ta_occa04.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 地址
        //        filed = "ta_occa05";
        //        cont = this.FIELD_ta_occa05.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion
        //        //V1.0.2 end

        //        //V1.0.3　
        //        #region 主要供應商1 FIELD_ta_occa0801

        //        filed = "ta_occa0801";
        //        cont = this.hidd_ta_occa0801.Value;
        //        cob.add(zone, filed, cont, number, apply);

        //        #endregion

        //        #region 付款條件1 FIELD_ta_occa0901
        //        filed = "ta_occa0901";
        //        cont = this.hidd_ta_occa0901.Value;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 訂單方式 FIELD_ta_occa11
        //        filed = "ta_occa11";
        //        cont = this.hidden_ta_occa11.Value;
        //        cob.add(zone, filed, cont, number, apply);

        //        #endregion

        //        #region 主要供應商2 FIELD_ta_occa0802
        //        filed = "ta_occa0802";
        //        cont = this.hidd_ta_occa0802.Value;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 付款條件2 FIELD_ta_occa0902
        //        filed = "ta_occa0902";
        //        cont = this.hidd_ta_occa0902.Value;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 主要供應商3 FIELD_ta_occa0803
        //        filed = "ta_occa0803";
        //        cont = this.hidd_ta_occa0903.Value;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 付款條件3 FIELD_ta_occa0903
        //        filed = "ta_occa0903";
        //        cont = this.hidd_ta_occa0903.Value;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        #region 銷售產品 FIELD_ta_occa10
        //        filed = "ta_occa10";
        //        cont = this.FIELD_ta_occa10.Text;
        //        cob.add(zone, filed, cont, number, apply);
        //        #endregion

        //        //V1.0.3 end

        //        //將變更後的值寫入ERP_AXMI25_TEMP TABLE 中
        //        SmoothEnterprise.Database.DataSet rs_temp = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);

        //        rs_temp.ExecuteScalar("delete  EIPB.DBO.ERP_AXMI25_TEMP where no='" + this.FIELD_occano.Text.Trim() + "' ");//add by carol 2017/04/17 將temp 刪除，只剩一筆

        //        string temp_command = "SELECT ROWNO , ID ,zone,field_name,field_value,no,apply_atrribute " +
        //                              "  FROM EIPB.DBO.ERP_AXMI25_TEMP  " +
        //                              " WHERE 1=0";
        //        rs_temp.Open(temp_command);

        //        for (int i = 0; i < cob.count; i++)
        //        {
        //            rs_temp.Add();
        //            //Response.Write(Request.QueryString["ROWNO"].ToString()+"<BR/>"+
        //            //    Guid.NewGuid().ToString()+"<BR/>"+
        //            //    cob.data[i][0].ToString()+"<BR/>"+
        //            //    cob.data[i][1].ToString()+"<BR/>"+
        //            //    cob.data[i][2].ToString()+"<BR/>"+
        //            //    cob.data[i][3].ToString()+"<BR/>"+
        //            //    cob.data[i][4].ToString()+"<BR/>"
        //            //    );

        //            rs_temp["ROWNO"] = Request.QueryString["ROWNO"].ToString();
        //            rs_temp["ID"] = Guid.NewGuid().ToString();
        //            rs_temp["zone"] = cob.data[i][0].ToString();
        //            rs_temp["field_name"] = cob.data[i][1].ToString();
        //            rs_temp["field_value"] = cob.data[i][2].ToString();
        //            rs_temp["no"] = cob.data[i][3].ToString();
        //            rs_temp["apply_atrribute"] = cob.data[i][4].ToString();
        //            rs_temp.Update();
        //        }
        //        rs_temp.Close();
        //        rs_temp.Dispose();
        //        //SmoothEnterprise.Database.DataSet rs_DELETE = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        //        //string delete_command = "DELETE EIPB.DBO.ERP_AXMI25_TEMP WHERE ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'";
        //        //rs_DELETE.ExecuteNonQuery(delete_command);
        //        //rs_DELETE.Close();
        //        //rs_DELETE.Dispose();
        //        //rs_temp.Dispose();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message + "<BR/>" + ex.StackTrace);
        //        return false;
        //    }

        //}

        private string to_date(string p)
        {
            DateTime d = DateTime.Parse(p);
            return d.ToString("yyyy/MM/dd");
        }
        private string trimformat(string txt)
        {
            string temp_txt = "";
            temp_txt = txt.Trim() == "" ? "0" : txt.Replace(",", "").Split('.')[0];
            if (txt.Replace(",", "").Split('.').Length > 1)
            {
                temp_txt = temp_txt + "." + txt.Replace(",", "").Split('.')[1].PadRight(6, '0');
            }
            else
            {
                temp_txt = temp_txt + ".000000";
            }
            return temp_txt;
        }

        /// <summary>
        /// 固定欄位，與財會確認，那些欄位確定要開放於EIP 修改 
        /// </summary>
        private void save_form()
        {
            try
            {
                Merge();
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM EIPB.DBO.ERP_AXMI25 WHERE ROWNO='" + Request.QueryString["ROWNO"] + "' ");
                if (!rs.EOF)
                {
                    rs["occa01"] = string.IsNullOrEmpty(this.FIELD_occa01.Text) ? "" : this.FIELD_occa01.Text;
                    // if (this.FIELD_occa01.Text != "") rs["occa01"] = this.FIELD_occa01.Text; else rs["occa01"] = System.DBNull.Value;
                    rs["occa02"] = this.FIELD_occa02.Text.Trim();
                    //rs["occa18"] = this.FIELD_occa18.Text.Trim();
                    if (this.FIELD_occa36.Text != "") rs["occa36"] = this.FIELD_occa36.Text; else rs["occa36"] = System.DBNull.Value;
                    rs["occa37"] = this.FIELD_occa37.Checked ? "Y" : "N";
                    //V1.0.9
                    //if (this.FIELD_occa61.SelectedValue != "") rs["occa61"] = this.FIELD_occa61.SelectedValue; else rs["occa61"] = System.DBNull.Value;
                    rs["occa61"] = this.FIELD_occa61.Text;//V1.0.9

                    if (this.FIELD_occa63.Text != "")
                    {
                        string temp_occa63 = "";
                        temp_occa63 = this.FIELD_occa63.Text.Replace(",", "").Split('.')[0];
                        if (this.FIELD_occa63.Text.Replace(",", "").Split('.').Length > 1)
                        {
                            temp_occa63 = temp_occa63 + "." + this.FIELD_occa63.Text.Replace(",", "").Split('.')[1].PadRight(6, '0');
                        }
                        else
                        {
                            temp_occa63 = temp_occa63 + ".000000";
                        }
                        rs["occa63"] = temp_occa63;
                    }

                    else
                    {
                        rs["occa63"] = System.DBNull.Value;
                    }


                    rs["ta_occa06"] = this.FIELD_ta_occa06.Checked ? "Y" : "N";
                    rs["ta_occa07"] = this.FIELD_ta_occa07.Checked ? "Y" : "N";
                    rs["occa07"] = this.FIELD_occa07.Text.Trim() == "" ? this.FIELD_occa01.Text.Trim() : this.FIELD_occa07.Text.Trim();
                    rs["occa09"] = this.FIELD_occa09.Text.Trim() == "" ? this.FIELD_occa01.Text.Trim() : this.FIELD_occa09.Text.Trim();
                    rs["ta_occa22"] = this.FIELD_ta_occa22.Checked ? "Y" : "N";
                    rs["occa704"] = this.FIELD_occa704.Text.Trim();
                    //
                    rs["occa12"] = this.FIELD_occa12.Text.Trim();
                    rs["occa15"] = this.FIELD_occa15.Text.Trim();
                    rs["ta_occa29"] = trimformat(this.FIELD_ta_occa29.Text.Trim());
                    rs["ta_occa23a"] = this.FIELD_ta_occa23a.Text.Trim();
                    rs["ta_occa24a"] = this.FIELD_ta_occa24a.Text.Trim();
                    rs["ta_occa25a"] = this.FIELD_ta_occa25a.Text.Trim();
                    rs["ta_occa23b"] = trimformat(this.FIELD_ta_occa23b.Text.Trim());
                    rs["ta_occa24b"] = trimformat(this.FIELD_ta_occa24b.Text.Trim());
                    rs["ta_occa25b"] = trimformat(this.FIELD_ta_occa25b.Text.Trim());
                    rs["ta_occa23c"] = trimformat(this.FIELD_ta_occa23c.Text.Trim());
                    rs["ta_occa24c"] = trimformat(this.FIELD_ta_occa24c.Text.Trim());
                    rs["ta_occa25c"] = trimformat(this.FIELD_ta_occa25c.Text.Trim());
                    rs["ta_occa26b"] = trimformat(this.FIELD_ta_occa26b.Text.Trim());
                    rs["ta_occa26a"] = this.FIELD_ta_occa26a.Text.Trim();
                    rs["ta_occa26c"] = trimformat(this.FIELD_ta_occa26c.Text.Trim());
                    rs["ta_occa26d"] = trimformat(this.FIELD_ta_occa26d.Text.Trim());
                    rs["ta_occa26e"] = trimformat(this.FIELD_ta_occa26e.Text.Trim());
                    rs["ta_occa26f"] = trimformat(this.FIELD_ta_occa26f.Text.Trim());
                    rs["ta_occa26g"] = trimformat(this.FIELD_ta_occa26g.Text.Trim());
                    rs["ta_occa28"] = this.FIELD_ta_occa28.Text.Trim();
                    //
                    //H201603001
                    rs["ta_occa1201"] = FIELD_ta_occa1201.Text;
                    rs["ta_occa1202"] = FIELD_ta_occa1202.Text;
                    rs["ta_occa1203"] = FIELD_ta_occa1203.Text;
                    //End-H201603001

                    //v1.0.1 add
                    if (this.FIELD_ta_occa27.Text != "") rs["ta_occa27"] = this.FIELD_ta_occa27.Text; else rs["ta_occa27"] = System.DBNull.Value;
                    if (this.FIELD_ta_occa1302.Text != "") rs["ta_occa1302"] = this.FIELD_ta_occa1302.Text; else rs["ta_occa1302"] = System.DBNull.Value;
                    if (this.FIELD_ta_occa1301.Text != "") rs["ta_occa1301"] = this.FIELD_ta_occa1301.Text; else rs["ta_occa1301"] = System.DBNull.Value;
                    //v1.0.1 end

                    // V1.0.2 add

                    rs["ta_occa01"] = string.IsNullOrEmpty(FIELD_ta_occa01.Text.Trim()) ? "" : FIELD_ta_occa01.Text.Trim();
                    rs["ta_occa02"] = string.IsNullOrEmpty(FIELD_ta_occa02.Text.Trim()) ? "" : FIELD_ta_occa02.Text.Trim();
                    rs["ta_occa03"] = string.IsNullOrEmpty(FIELD_ta_occa03.Text.Trim()) ? "" : FIELD_ta_occa03.Text.Trim();
                    rs["ta_occa04"] = string.IsNullOrEmpty(FIELD_ta_occa04.Text.Trim()) ? "" : FIELD_ta_occa04.Text.Trim();
                    rs["ta_occa05"] = string.IsNullOrEmpty(FIELD_ta_occa05.Text.Trim()) ? "" : FIELD_ta_occa05.Text.Trim();

                    rs["occa38"] = string.IsNullOrEmpty(FIELD_occa38.Text.Trim()) ? "" : FIELD_occa38.Text.Trim();
                    rs["occa39"] = string.IsNullOrEmpty(FIELD_occa39.Text.Trim()) ? "" : FIELD_occa39.Text.Trim();
                    // V1.0.2  end 
                    //rs["occa241"] = string.IsNullOrEmpty(FIELD_occa38.Text.Trim()) ? "" : FIELD_occa38.Text.Trim();

                    //20190114 occa33 與occa01 occa09 occa07同值   V1.0.9
                    rs["occa33"] = string.IsNullOrEmpty(this.FIELD_occa33.Text) ? "" : this.FIELD_occa33.Text; //V1.0.9

                    #region 以下不會去動到
                    //if (this.FIELD_argv2.SelectedValue != "") rs["argv2"] = this.FIELD_argv2.SelectedValue; else rs["argv2"] = "";
                    //if (this.FIELD_occa00.SelectedValue != "") rs["occa00"] = this.FIELD_occa00.SelectedValue; else rs["occa00"] = "";
                    //if (this.FIELD_occano.Text != "") rs["occano"] = this.FIELD_occano.Text; else rs["occano"] = System.DBNull.Value;
                    //if (this.FIELD_occa02.Text != "") rs["occa02"] = this.FIELD_occa02.Text; else rs["occa02"] = System.DBNull.Value;
                    //if (this.FIELD_occa03.Text != "") rs["occa03"] = this.FIELD_occa03.Text; else rs["occa03"] = System.DBNull.Value;
                    //if (this.FIELD_occa04.Text != "") rs["occa04"] = this.FIELD_occa04.Text; else rs["occa04"] = System.DBNull.Value;
                    //if (this.FIELD_occa06.Text != "") rs["occa06"] = this.FIELD_occa06.Text; else rs["occa06"] = System.DBNull.Value;
                    //if (this.FIELD_occa07.Text != "") rs["occa07"] = this.FIELD_occa07.Text; else rs["occa07"] = System.DBNull.Value;
                    //if (this.FIELD_occa08.Text != "") rs["occa08"] = this.FIELD_occa08.Text; else rs["occa08"] = System.DBNull.Value;
                    //if (this.FIELD_occa09.Text != "") rs["occa09"] = this.FIELD_occa09.Text; else rs["occa09"] = System.DBNull.Value;
                    //if (this.FIELD_occa11.Text != "") rs["occa11"] = this.FIELD_occa11.Text; else rs["occa11"] = System.DBNull.Value;
                    //if (this.FIELD_occa12.Text != "") rs["occa12"] = this.FIELD_occa12.Text; else rs["occa12"] = System.DBNull.Value;
                    //if (this.FIELD_occa13.Text != "") rs["occa13"] = this.FIELD_occa13.Text; else rs["occa13"] = System.DBNull.Value;
                    //if (this.FIELD_occa14.Text != "") rs["occa14"] = this.FIELD_occa14.Text; else rs["occa14"] = System.DBNull.Value;
                    //if (this.FIELD_occa15.Text != "") rs["occa15"] = this.FIELD_occa15.Text; else rs["occa15"] = System.DBNull.Value;
                    //if (this.FIELD_occa18.Text != "") rs["occa18"] = this.FIELD_occa18.Text; else rs["occa18"] = System.DBNull.Value;
                    ////if (this.FIELD_occa19.Text != "") rs["occa19"] = this.FIELD_occa19.Text; else rs["occa19"] = System.DBNull.Value;
                    //if (this.FIELD_occa20.Text != "") rs["occa20"] = this.FIELD_occa20.Text; else rs["occa20"] = System.DBNull.Value;
                    //if (this.FIELD_occa21.Text != "") rs["occa21"] = this.FIELD_occa21.Text; else rs["occa21"] = System.DBNull.Value;
                    ////if (this.FIELD_occa23.Text != "") rs["occa23"] = this.FIELD_occa23.Text; else rs["occa23"] = System.DBNull.Value;
                    ////if (this.FIELD_occa24.Text != "") rs["occa24"] = this.FIELD_occa24.Text; else rs["occa24"] = System.DBNull.Value;
                    ////if (this.FIELD_occa261.Text != "") rs["occa261"] = this.FIELD_occa261.Text; else rs["occa261"] = System.DBNull.Value;
                    ////if (this.FIELD_occa262.Text != "") rs["occa262"] = this.FIELD_occa262.Text; else rs["occa262"] = System.DBNull.Value;
                    ////if (this.FIELD_occa263.Text != "") rs["occa263"] = this.FIELD_occa263.Text; else rs["occa263"] = System.DBNull.Value;
                    ////if (this.FIELD_occa271.Text != "") rs["occa271"] = this.FIELD_occa271.Text; else rs["occa271"] = System.DBNull.Value;
                    ////if (this.FIELD_occa272.Text != "") rs["occa272"] = this.FIELD_occa272.Text; else rs["occa272"] = System.DBNull.Value;
                    ////if (this.FIELD_occa273.Text != "") rs["occa273"] = this.FIELD_occa273.Text; else rs["occa273"] = System.DBNull.Value;
                    //if (this.FIELD_occa28.Text != "") rs["occa28"] = this.FIELD_occa28.Text; else rs["occa28"] = System.DBNull.Value;
                    ////if (this.FIELD_occa29.Text != "") rs["occa29"] = this.FIELD_occa29.Text; else rs["occa29"] = System.DBNull.Value;
                    ////if (this.FIELD_occa292.Text != "") rs["occa292"] = this.FIELD_occa292.Text; else rs["occa292"] = System.DBNull.Value;
                    ////if (this.FIELD_occa30.Text != "") rs["occa30"] = this.FIELD_occa30.Text; else rs["occa30"] = System.DBNull.Value;
                    ////if (this.FIELD_occa302.Text != "") rs["occa302"] = this.FIELD_occa302.Text; else rs["occa302"] = System.DBNull.Value;
                    ////if (this.FIELD_occa33.Text != "") rs["occa33"] = this.FIELD_occa33.Text; else rs["occa33"] = System.DBNull.Value;
                    //if (this.FIELD_occa35.Text != "") rs["occa35"] = this.FIELD_occa35.Text; else rs["occa35"] = System.DBNull.Value;
                    //if (this.FIELD_occa38.Text != "") rs["occa38"] = this.FIELD_occa38.Text; else rs["occa38"] = System.DBNull.Value;
                    //if (this.FIELD_occa39.Text != "") rs["occa39"] = this.FIELD_occa39.Text; else rs["occa39"] = System.DBNull.Value;
                    //if (this.FIELD_occa41.Text != "") rs["occa41"] = this.FIELD_occa41.Text; else rs["occa41"] = System.DBNull.Value;
                    //if (this.FIELD_occa42.Text != "") rs["occa42"] = this.FIELD_occa42.Text; else rs["occa42"] = System.DBNull.Value;
                    //if (this.FIELD_occa43.Text != "") rs["occa43"] = this.FIELD_occa43.Text; else rs["occa43"] = System.DBNull.Value;
                    //if (this.FIELD_occa44.Text != "") rs["occa44"] = this.FIELD_occa44.Text; else rs["occa44"] = System.DBNull.Value;
                    ////if (this.FIELD_occa45.Text != "") rs["occa45"] = this.FIELD_occa45.Text; else rs["occa45"] = System.DBNull.Value;
                    ////if (this.FIELD_occa46.Text != "") rs["occa46"] = this.FIELD_occa46.Text; else rs["occa46"] = System.DBNull.Value;
                    ////if (this.FIELD_occa47.Text != "") rs["occa47"] = this.FIELD_occa47.Text; else rs["occa47"] = System.DBNull.Value;
                    ////if (this.FIELD_occa48.Text != "") rs["occa48"] = this.FIELD_occa48.Text; else rs["occa48"] = System.DBNull.Value;
                    ////if (this.FIELD_occa49.Text != "") rs["occa49"] = this.FIELD_occa49.Text; else rs["occa49"] = System.DBNull.Value;
                    ////if (this.FIELD_occa50.Text != "") rs["occa50"] = this.FIELD_occa50.Text; else rs["occa50"] = System.DBNull.Value;
                    //if (this.FIELD_occa51.Text != "") rs["occa51"] = this.FIELD_occa51.Text; else rs["occa51"] = System.DBNull.Value;
                    //if (this.FIELD_occa55.Text != "") rs["occa55"] = this.FIELD_occa55.Text; else rs["occa55"] = System.DBNull.Value;
                    //rs["occa56"] = this.FIELD_occa56.Checked ? "Y" : "N";
                    ////if (this.FIELD_occa62.Text != "") rs["occa62"] = this.FIELD_occa62.Text; else rs["occa62"] = System.DBNull.Value;
                    ////if (this.FIELD_occa631.Text != "") rs["occa631"] = this.FIELD_occa631.Text; else rs["occa631"] = System.DBNull.Value;
                    ////if (this.FIELD_occa701.Text != "") rs["occa701"] = this.FIELD_occa701.Text; else rs["occa701"] = System.DBNull.Value;
                    ////if (this.FIELD_occa702.Text != "") rs["occa702"] = this.FIELD_occa702.Text; else rs["occa702"] = System.DBNull.Value;
                    ////if (this.FIELD_occa703.Text != "") rs["occa703"] = this.FIELD_occa703.Text; else rs["occa703"] = System.DBNull.Value;
                    ////if (this.FIELD_occa704.Text != "") rs["occa704"] = this.FIELD_occa704.Text; else rs["occa704"] = System.DBNull.Value;
                    ////if (this.FIELD_occaacti.Text != "") rs["occaacti"] = this.FIELD_occaacti.Text; else rs["occaacti"] = System.DBNull.Value;
                    //if (this.FIELD_occauser.Text != "") rs["occauser"] = this.FIELD_occauser.Text; else rs["occauser"] = System.DBNull.Value;
                    //if (this.FIELD_occagrup.Text != "") rs["occagrup"] = this.FIELD_occagrup.Text; else rs["occagrup"] = System.DBNull.Value;
                    //if (this.FIELD_occa1004.SelectedValue != "") rs["occa1004"] = this.FIELD_occa1004.SelectedValue; else rs["occa1004"] = "";
                    //if (this.FIELD_occaud15.Text != "") rs["occaud15"] = this.FIELD_occaud15.Text; else rs["occaud15"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa0801.Text != "") rs["ta_occa0801"] = this.FIELD_ta_occa0801.Text; else rs["ta_occa0801"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa0802.Text != "") rs["ta_occa0802"] = this.FIELD_ta_occa0802.Text; else rs["ta_occa0802"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa0803.Text != "") rs["ta_occa0803"] = this.FIELD_ta_occa0803.Text; else rs["ta_occa0803"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa0901.Text != "") rs["ta_occa0901"] = this.FIELD_ta_occa0901.Text; else rs["ta_occa0901"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa0902.Text != "") rs["ta_occa0902"] = this.FIELD_ta_occa0902.Text; else rs["ta_occa0902"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa0903.Text != "") rs["ta_occa0903"] = this.FIELD_ta_occa0903.Text; else rs["ta_occa0903"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa10.Text != "") rs["ta_occa10"] = this.FIELD_ta_occa10.Text; else rs["ta_occa10"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa11.SelectedValue != "") rs["ta_occa11"] = this.FIELD_ta_occa11.SelectedValue; else rs["ta_occa11"] = "";
                    ////if (this.FIELD_ta_occa12.Text != "") rs["ta_occa12"] = this.FIELD_ta_occa12.Text; else rs["ta_occa12"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa14.Text != "") rs["ta_occa14"] = this.FIELD_ta_occa14.Text; else rs["ta_occa14"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa15.Text != "") rs["ta_occa15"] = this.FIELD_ta_occa15.Text; else rs["ta_occa15"] = System.DBNull.Value;
                    ////if (this.FIELD_ta_occa19.Text != "") rs["ta_occa19"] = this.FIELD_ta_occa19.Text; else rs["ta_occa19"] = System.DBNull.Value;
                    //if (this.FIELD_occanote.Text != "") rs["occanote"] = this.FIELD_occanote.Text; else rs["occanote"] = System.DBNull.Value;
                    #endregion
                    rs.Update();
                }
                rs.Close();
                rs.Dispose();

                //v1.0.5
                // Utility.execDel(string.Format("delete EIPB.dbo.ERP_AXMI25_TEMP where NO='{0}' ", FIELD_occano.Text)); //存檔前先清空前次修改 只留最後一次修改的資料

                //Differ_Column(true);



            }
            catch (Exception ex)
            {
                StringBuilder body = new StringBuilder();

                body.AppendFormat("單號＝{0}<br>", FIELD_occano.Text);
                body.AppendFormat("申請狀態＝{0}<br>", FIELD_occa00.Text);
                body.AppendFormat("廠別＝{0}<br>", FIELD_ta_occa15.Text);
                body.AppendFormat("客代＝{0}<br>", FIELD_occa01.Text);
                body.AppendFormat("客戶名稱＝{0}<br>", FIELD_occa02.Text);
                body.Append("flow＝save form<br>");
                body.AppendFormat("user＝{0}<br>", CurrentUser.Name);
                body.AppendFormat("ex＝{0}<br>", ex);
                body.AppendFormat("url:<a href='{0}/ERP_AXMI25/ERP_AXMI25View.aspx?ROWNO={1}' >{2}</a><br>", Utility.LocalUrl, Request.QueryString["ROWNO"], FIELD_occano.Text);

                Utility.SendMail(Utility.MIS_Mail, "eip1@minaik.com.tw", "ERP_AXMI25  Error NO:" + FIELD_occano.Text, body.ToString());



                throw new Exception(ex.Message);
            }
        }

        private void Merge()
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                rs.Open("SELECT  *  FROM EIPB.DBO.ERP_AXMI25 WHERE ROWNO='" + Request.QueryString["ROWNO"] + "' ");

                if (!rs.EOF)
                {

                    string plant = rs["PlantID"].ToString();
                    string occa01 = rs["occa01"].ToString();
                    string action = rs["occa00"].ToString().Split(':')[0]; // U:修改 只取第一個字元 U
                    string ERP_NO = rs["occano"].ToString();
                    //Utility.log(1plant);
                    //只有一筆資料 
                    //收集EIP的資料
                    foreach (DataColumn col in rs.Columns)
                    {
                        string item = col.ColumnName.ToUpper();
                        string dbVal = rs[item].ToString().Trim();
                        bool isInt = false;
                        bool isUnequal = false; //V1.0.8   add
                        double double_V = 0, double_T = 0; //V1.0.8  add

                        try
                        {

                            //0.000000

                            //V1.0.8  start
                            //if (dbVal.Contains(".000000"))
                            //{ isInt = true; } 
                            //dbVal = dbVal.Replace(".000000", "");

                            //if (dbVal.Contains("."))
                            //{
                            //    if (Utility.IsFloat(dbVal))
                            //    {

                            //        isInt = true;
                            //        double_V = double.Parse(dbVal);


                            //        // dbVal = dbVal.Replace(".000000", "").Trim();
                            //        // Utility.log(0, "**", item, dbVal);
                            //    }
                            //}
                            //V1.0.8  end

                            //LABEL_occa00
                            ContentPlaceHolder Content = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");

                            //TextBox tbox = (TextBox)Content.FindControl("FIELD_" + col);

                            Control c = Content.FindControl("FIELD_" + col);

                            if (c != null && (c.GetType().Name == "InputText" || c.GetType().Name == "TextBox"))
                            {
                                TextBox tbox = (TextBox)c;
                                bool read = string.IsNullOrEmpty(tbox.Attributes["readonly"]) ? false : true;

                                 
                                isInt = string.IsNullOrEmpty(tbox.Attributes["tag"]) ? false : tbox.Attributes["tag"] == "Money" ? true : false; //V1.0.10
                              
                                

                                string txtVal = tbox.Text.Trim();
                                //V1.0.8 
                                //txtVal = txtVal.Replace(",000", "000");
                                isUnequal = dbVal != txtVal ? true : false; //V1.0.8 
                                if (isInt)
                                {
                                    if (string.IsNullOrEmpty(dbVal.ToString()))
                                    {
                                        dbVal = "0";
                                    }
                                    double_V = double.Parse(dbVal); //V1.0.10
                                                                    //V1.0.8  start

                                    txtVal = txtVal.Replace(",", string.Empty);
                                    txtVal = string.IsNullOrEmpty(txtVal) ? "0" : txtVal;
                                    double_T = double.Parse(txtVal);

                                    Utility.log(1, item, double_T.ToString(), double_V.ToString(), action, ERP_NO, CurrentUser.Name);
                                    isUnequal = double_T != double_V ? true : false;
                                    //V1.0.8  end
                                }


                                if (isUnequal && !tbox.ReadOnly)
                                {
                                    //V1.0.8  start
                                    if (isInt)
                                    {
                                        txtVal = String.Format("{0:0.000000}", double_T);
                                    }
                                    //V1.0.8  end

                                    upt_Temp(item, txtVal, plant, action, ERP_NO);

                                    Utility.log(1, item, dbVal, txtVal, action, ERP_NO, CurrentUser.Name);

                                    string lab = tbox.ID.Replace("FIELD_", "LABEL_");

                                    Control laber = Content.FindControl(lab);

                                    if (laber != null && laber.GetType().Name == "Label")
                                    {
                                        Label l = (Label)laber;

                                        l.ForeColor = System.Drawing.Color.Red;

                                    }
                                }
                            }

                        }
                        catch (Exception ex)
                        {

                            throw new Exception(ex.Message + "<br>Error textbox : " +item);
                        }
                    }

                }

            }
        }

        //沒有人呼叫
        //protected void UpdateFile()
        //{
        //    try
        //    {
        //        #region 動態新增
        //        HttpFileCollection files = HttpContext.Current.Request.Files;
        //        System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
        //        //String uPath = "D:/Upload/";
        //        int att_count = 0;

        //        //String fpath;
        //        //fpath = "";

        //        SmoothEnterprise.Database.DataSet rs5 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        //        rs5.Open("SELECT * FROM EIPB.DBO.ERP_AXMI25_updatefile WHERE 1=0");

        //        for (int ifile = 0; ifile < files.Count; ifile++)
        //        {
        //            HttpPostedFile postedfile = files[ifile];
        //            string filename, fileExt, filePath;
        //            filename = System.IO.Path.GetFileName(postedfile.FileName);    //抓取文件名
        //            fileExt = System.IO.Path.GetExtension(postedfile.FileName);    //抓取文件附檔名

        //            if (postedfile.ContentLength > 0)
        //            {
        //                rs5.Add();
        //                att_count = att_count + 1;
        //                String tafilename = "filename" + att_count.ToString();
        //                String taattach = "attachment" + att_count.ToString();
        //                String tafilexten = "fileexten" + att_count.ToString();

        //                byte[] fileBytes = new byte[postedfile.ContentLength];
        //                postedfile.InputStream.Read(fileBytes, 0, postedfile.ContentLength);
        //                rs5["FileName"] = filename;
        //                rs5["FileBody"] = fileBytes;
        //                rs5["FileType"] = fileExt;
        //                rs5["rowno"] = Request.QueryString["ROWNO"].ToString();
        //                rs5.Update();
        //            }
        //        }
        //        rs5.Close();
        //        #endregion
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message);
        //    }
        //}

        //結束流程
        protected void FlowFeedback1_FeedbackComplete(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FeedbackCompleteEventArgs e)
        {
            try
            {
                //writetofile("FlowFeedback1_FeedbackComplete");
                _NotifyReview = true;
                this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "RedirectAfterCommit", "<script language=\"javascript\">window.location='/Flowwork/MyApproval.aspx';</script>");

                SmoothEnterprise.Web.UI.HTMLControl.InputText it;
                object obj = this.FlowFeedback1.ReplyView.FindControl("ResTxt");
                it = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj;
                e["Flow_Comment"] = it.Text;
                //電子簽章呈現---------------------------------------------------------------------
                SmoothEnterprise.Web.UI.HTMLControl.InputText it3;
                object obj3 = this.FlowFeedback1.ReplyView.FindControl("Flow_loginID");
                it3 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj3;
                it3.Text = this.CurrentUser.LogonID;
                e["Flow_loginID"] = it3.Text;


                //寫入是否為代理人
                SmoothEnterprise.Web.UI.HTMLControl.InputText it4;
                object obj4 = this.FlowFeedback1.ReplyView.FindControl("IniReviewer");
                it4 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj4;
                e["IniReviewer"] = "代";


                SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                ds.Open(" select revieweruid  from  dgflowqueue   where requesturl like '%" + Request.QueryString[0].ToString() + "%'" +
                    "  and revieweruid='" + this.CurrentUser.ID.Substring(1, 36) +
                    "' and  initdate=(select MAX(initdate)   from  dgflowqueue    where requesturl like '%" +
                    Request.QueryString[0].ToString() + "%')");
                if (!ds.EOF)
                {
                    e["IniReviewer"] = "";
                }
                ds.Close();
                e.NodeComplete = true;
            }
            catch (Exception ex)
            {
                this.AddError(this, "FlowFeedback1_FeedbackComplete()", "", "FlowFeedback1_FeedbackComplete<br/>" + ex.Message);
            }
        }
        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            try
            {
                //writetofile(" FlowFeedbackViewer1_OnLoadHistory :" + Allsn.ToString());
                //writetofile(" _NotifyReview :" + _NotifyReview.ToString());
                //writetofile(" _NodeType :" + _NodeType.ToString());
                if ((Allsn.ToString() == "0") && (_NotifyReview))
                {
                    sendmail(_NodeType);
                    Allsn++;
                }

                Label label;
                object obj = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
                label = (Label)obj;
                label.Text = e["Flow_Comment"].ToString();
                label.ForeColor = System.Drawing.Color.Red;
                label.Font.Bold = true;
                label.Enabled = true;
                label.Font.Size = 13;

                //電子簽章呈現-----------------------------------------------------------------------------------------
                System.Web.UI.WebControls.Image sin1;
                object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
                sin1 = (System.Web.UI.WebControls.Image)obj5;
                //Response.Write((string)e["Flow_loginID"] + "--");
                if ((string)e["Flow_loginID"].ToString().Length.ToString() != "0")
                {
                    sin1.Visible = true;
                }
                else
                {
                    sin1.Visible = false;
                }
                sin1.ImageUrl = "~/image/" + (string)e["Flow_loginID"] + ".JPG";

                System.Web.UI.WebControls.Image sin2;
                object obj6 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image2");
                sin2 = (System.Web.UI.WebControls.Image)obj6;

                if ((string)e["IniReviewer"].ToString().Length.ToString() == "0") sin2.Visible = false;
                else sin2.Visible = true;
            }
            catch { }
        }


        //中止
        protected void FlowFeedback1_FlowStop(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowStopEventArgs e)
        {
            try
            {
                //writetofile("FlowFeedback1_FlowStop");
                //Response.Write("FlowFeedback1_FlowStop");
                SmoothEnterprise.Database.DataSet ds0;

                Utility.log(1, "NO:" + FIELD_occano.Text + "FlowFeedback1_FlowStop name:" + CurrentUser.Name);


                ds0 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                ds0.Open("SELECT * FROM EIPB.DBO.ERP_AXMI25 WHERE  ROWNO ='" + Request.QueryString["ROWNO"] + "' ");
                if (!ds0.EOF)
                {
                    switch (e.ResultType)
                    {
                        case SmoothEnterprise.Flowwork.Control.ReviewResultType.Next:
                            _NodeType = "Next";


                            break;
                        case SmoothEnterprise.Flowwork.Control.ReviewResultType.Complete:
                            _NodeType = "Complete";
                            //把檢查不同欄位的部份在最後一關執行再送出文字檔
                            //checkupdata();
                            //find_different_and_write_to_temptable(Request.QueryString["ROWNO"].ToString()); 
                            //Utility.log(11, "NO:" + FIELD_occano.Text + "XML-OUT_Start");
                            //Differ_Column(false);
                            OutXML("2", Request.QueryString["ROWNO"].ToString());
                            //Utility.log(11, "NO:" + FIELD_occano.Text + "XML-OUT_OK");
                            FinishApprove();
                            //Utility.log(11, "NO:" + FIELD_occano.Text + "FinishApprove-OUT");
                            break;
                        case SmoothEnterprise.Flowwork.Control.ReviewResultType.Terminate:
                            _NodeType = "Terminate";
                            RejectResult();
                            break;
                        case SmoothEnterprise.Flowwork.Control.ReviewResultType.Back:
                            _NodeType = "Back";
                            break;
                        case SmoothEnterprise.Flowwork.Control.ReviewResultType.Return:
                            _NodeType = "Return";
                            RejectResult();
                            break;
                        default:
                            break;
                    }
                    ds0["isState"] = e.ResultType.ToString();
                    ds0.Update();

                    Utility.log(1, "NO:" + FIELD_occano.Text + "isState:" + e.ResultType.ToString());
                }
                ds0.Close();

                //Response.Redirect("http://" + Request.Url.Authority.ToString() + "/Flowwork/MyApproval.aspx");
            }
            catch (Exception ex)
            {
                StringBuilder body = new StringBuilder();

                body.AppendFormat("單號＝{0}<br>", FIELD_occano.Text);
                body.AppendFormat("申請狀態＝{0}<br>", FIELD_occa00.Text);
                body.AppendFormat("廠別＝{0}<br>", FIELD_ta_occa15.Text);
                body.AppendFormat("客代＝{0}<br>", FIELD_occa01.Text);
                body.AppendFormat("客戶名稱＝{0}<br>", FIELD_occa02.Text);
                body.AppendFormat("flow＝{0}<br>", _NodeType);
                body.AppendFormat("審核者＝{0}<br>", CurrentUser.Name);
                body.AppendFormat("url:<a href='{0}/ERP_AXMI25/ERP_AXMI25View.aspx?ROWNO={1}' >{2}</a><br>", Utility.LocalUrl, Request.QueryString["ROWNO"], FIELD_occano.Text);



                Utility.SendMail(Utility.MIS_Mail, "eip1@minaik.com.tw", "ERP_AXMI25  Error NO:" + FIELD_occano.Text, body.ToString());

                this.AddError(this, "FlowFeedback1_FlowStop()", "", "FlowFeedback1_FlowStop<br/>" + ex.Message);
            }

        }
        private bool uploadtoFTP(string fileName, string uploadUrl, string UserName, string Password)
        {
            Stream requestStream = null;
            FileStream fileStream = null;
            FtpWebResponse uploadResponse = null;

            //Utility.log(11, "uploadtoFTP 1", FIELD_occano.Text);

            try
            {

                FtpWebRequest uploadRequest = (FtpWebRequest)WebRequest.Create(uploadUrl);
                uploadRequest.Method = WebRequestMethods.Ftp.UploadFile;//設定Method上傳檔案
                uploadRequest.Proxy = null;

                if (UserName.Length > 0)//如果需要帳號登入
                {
                    NetworkCredential nc = new NetworkCredential(UserName, Password);
                    uploadRequest.Credentials = nc; //設定帳號
                    //Utility.log(11, "uploadtoFTP 2", FIELD_occano.Text);
                }

                requestStream = uploadRequest.GetRequestStream();
                fileStream = File.Open(fileName, FileMode.Open);
                byte[] buffer = new byte[1024];
                int bytesRead;
                //Utility.log(11, "uploadtoFTP 3", FIELD_occano.Text);
                while (true)
                {//開始上傳資料流
                    bytesRead = fileStream.Read(buffer, 0, buffer.Length);
                    if (bytesRead == 0)
                        break;
                    requestStream.Write(buffer, 0, bytesRead);
                }
                //Utility.log(11, "uploadtoFTP 4", FIELD_occano.Text);


                requestStream.Close();
                uploadResponse = (FtpWebResponse)uploadRequest.GetResponse();

                //Utility.log(11, "uploadtoFTP OK", FIELD_occano.Text);
                return true;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + ex.StackTrace + "<br>");

                throw new Exception(ex.Message + "<br>" + ex.StackTrace);
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

        private void OutXML(string contt, string rowno)
        {

            //Utility.log(11, "OutXML 1", FIELD_occano.Text);
            //1.找出不同的值
            //2.存檔 
            StringBuilder sb = new StringBuilder();

            string erp_no = FIELD_occano.Text;
            string action = hide_occa00.Value;
            string plant = PlantID.Value;

            //完成審核後要加上去的 //依舊系統加入
            sb.AppendFormat("{0}|{1}|{2}|{3}|{4}\r\n", plant, "occa1004", contt, erp_no, action); //MINAIK|ta_occa24c|0.000000|101-1810001|U
            //Utility.log(11, "OutXML 2", FIELD_occano.Text);

            //V1.0.6 update 改為記錄所有的log 後，取最後一筆
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                //v1.0.7
                //string sql = string.Format("select tb.* from  (select no, field_name, max(t.modify_date) 'dt' from eipb.dbo.ERP_AXMI25_TEMP t where no = '{0}' group by field_name, no) a left join eipb.dbo.ERP_AXMI25_TEMP tb on a.field_name = tb.field_name and a.dt = tb.modify_date ", erp_no);
                string sql = string.Format("select tb.* from  (select no, field_name, max(t.modify_date) 'dt' from eipb.dbo.ERP_AXMI25_TEMP t where ROWNO  = '{0}' group by field_name, no) a left join eipb.dbo.ERP_AXMI25_TEMP tb on a.field_name = tb.field_name and a.dt = tb.modify_date ", rowno);
                rs.Open(sql);

                while (!rs.EOF)
                {
                    string value = rs["field_value"].ToString();
                    /* V1.0.8
                    if (!string.IsNullOrEmpty(value))
                    {
                        if (value.Contains(".000000"))
                        {
                            value = value.Replace(",", string.Empty);
                        }

                        if (value.Contains("."))
                        {
                            if (Utility.IsFloat(value))
                            {
                                value = value.Replace(",", string.Empty);
                            }
                        }
                    }
                    */



                    sb.AppendFormat("{0}|{1}|{2}|{3}|{4}\r\n", plant, rs["field_name"], rs["field_value"], erp_no, action); //MINAIK|ta_occa24c|0.000000|101-1810001|U 
                    rs.MoveNext();
                }

            }


            //20180911 delete 
            //foreach (ERP_Out o in outInfo.List)
            //{
            //    //file.WriteLine("" + rs["zone"].ToString() + "|" + "" + field_name + "|" + "" + field_value + "|" + "" + rs["no"].ToString() + "|" + "" + rs["apply_atrribute"].ToString().Substring(0, 1) + "");
            //    sb.AppendFormat("{0}|{1}|{2}|{3}|{4}\r\n", o.Plant, o.Column, o.Value, o.ERP_NO, o.Action); //MINAIK|ta_occa24c|0.000000|101-1810001|U
            //    erp_no = o.ERP_NO;
            //    action = o.Action;
            //    plant = o.Plant;
            //}

            //3.上傳FTP
            //Utility.log(11, "OutXML 3", FIELD_occano.Text);
            //檔案路徑 string path = "D:\\ERP_AXMI250"
            string path = "D:\\ERP_AXMI250";
            //檔案名稱 //MINAIK-U_axmi250_101-1810001
            string filename = string.Format("MINAIK-{0}_axmi250_{1}.txt", action, FIELD_occano.Text);
            //Utility.log(11, "OutXML 4", FIELD_occano.Text);

            string file = Path.Combine(path, filename);
            File.Delete(file);
            //Utility.log(11, "OutXML 5", FIELD_occano.Text);


            File.AppendAllText(file, sb.ToString());
            //Utility.log(11, "OutXML 6", FIELD_occano.Text);

            uploadtoFTP(file, @"ftp://192.168.0.250/" + filename, "4gl", "4gl");
            File.Delete(file);
            //Utility.log(11, "OutXML 7", FIELD_occano.Text);
        }

        //private bool _sendTxt(string contt, string rowno)
        //{
        //    int count = 0;
        //    string secmessage = "";


        //    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //    SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //    try
        //    {
        //        string sql = "SELECT ERP.PlantID ZONE ,  " +
        //                 "         FI.FileName ,  " +
        //                 "          ERP.occa00 apply_atrribute , " +
        //                 "         ERP.occano no " +
        //                 "    FROM EIPB.DBO.ERP_AXMI25 ERP , EIPB.DBO.ERP_AXMI25_File FI " +
        //                 "   WHERE 1=1 " +
        //                 "     AND ERP.ROWNO = FI.rowno " +
        //                 "     AND ERP.ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'";

        //        string zone = "", no = "", apply_attr = "", filename = "";
        //        rs2.Open(sql);
        //        if (!rs2.EOF)
        //        {
        //            zone = rs2["zone"].ToString();
        //            no = rs2["no"].ToString();
        //            apply_attr = rs2["apply_atrribute"].ToString().ToString().Substring(0, 1);
        //            filename = rs2["FileName"].ToString().Split('.')[0] + ".txt";
        //        }
        //        rs2.Close();
        //        //\\192.168.0.250\192.168.0.250-d槽\4GL
        //        Dictionary<string, string> Temp = new Dictionary<string, string>();
        //        string path = "D:\\ERP_AXMI250";//"D:\\test\\test_rage.txt";            
        //        string fullfilename = path + "\\" + filename;
        //        FileStream fn = new FileStream(fullfilename, FileMode.Create, FileAccess.Write);
        //        StreamWriter file = new StreamWriter(fn, System.Text.Encoding.Unicode);
        //        //System.IO.StreamWriter file = new StreamWriter(fullfilename, true, System.Text.Encoding.Default);
        //        //file.Write(content_head);


        //        //if (apply_attr == "U")

        //        string content_head = @"";
        //        //if (this.FIELD_occa00.Text.Contains("U"))
        //        //{
        //        rs.Open("SELECT ERP.ROWNO , TEMP.ID ,ERP.PlantID zone , field_name , field_value ,  " +
        //                            "       ERP.occano no, ERP.occa00 apply_atrribute  , AXMI25_FILE.FileName      " +
        //                            "  FROM EIPB.DBO.ERP_AXMI25 ERP " +
        //                            "  LEFT JOIN EIPB.DBO.ERP_AXMI25_TEMP TEMP ON ERP.ROWNO = TEMP.ROWNO" +
        //                            "  LEFT JOIN EIPB.DBO.ERP_AXMI25_File AXMI25_FILE ON ERP.ROWNO = AXMI25_FILE.rowno" +
        //                            " WHERE ERP.ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'");

        //        while (!rs.EOF)
        //        {
        //            if (rs["ID"].ToString() != "")
        //            {
        //                //update by carol 防止欄位重覆寫入
        //                string field_name = rs["field_name"].ToString();
        //                string field_value = (String)rs["field_value"].ToString().Replace("'", "’");
        //                if (!Temp.ContainsKey(field_name))
        //                {
        //                    Temp.Add(field_name, field_value);

        //                    count++;
        //                    // "廠區     欄位名稱 欄位內容  單號  申請性質\r\n";
        //                    file.WriteLine("" + rs["zone"].ToString() + "|" + "" + field_name + "|" + "" + field_value + "|" + "" + rs["no"].ToString() + "|" + "" + rs["apply_atrribute"].ToString().Substring(0, 1) + "");
        //                    //content_head += "\"" + @""+ rs["zone"].ToString() + "\"," + "\"" + rs["field_name"].ToString() + "\"," + "\"" + rs["field_value"].ToString() + "\"," + "\"" + rs["no"].ToString() + "\"," + "\"" + rs["apply_atrribute"].ToString().Substring(0, 1) + "\"" + "\r\n";
        //                }
        //            }

        //            rs.MoveNext();
        //        }

        //        //}
        //        //完成審核後要加上去的
        //        file.WriteLine("" + zone + "|occa1004|" + contt + "|" + no + "|" + apply_attr + "");
        //        //content_head += "\"" + zone + "\",\"occa1004\",\"1\",\""+no+"\",\""+apply_attr+"\""; 


        //        file.Close();
        //        uploadtoFTP(fullfilename, @"ftp://192.168.0.250/" + filename, "4gl", "4gl");
        //        File.Delete(fullfilename);
        //        deletetemptable();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        writetofile(ex.Message + "\r\n" + ex.StackTrace);
        //        throw new Exception(ex.Message + ex.StackTrace);
        //    }
        //    finally
        //    {
        //        rs.Close();
        //        rs.Dispose();
        //        rs2.Dispose();
        //    }
        //}


        //private void writetofile(string message)
        //{
        //    string filepath = @"D:\ERP_AXMI250\MessageLog.txt";
        //    System.IO.StreamWriter file = new StreamWriter(filepath, true, System.Text.Encoding.Unicode);
        //    file.WriteLine(message);
        //    file.Close();
        //}

        //private void deletetemptable()
        //{
        //    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        //    string command = "DELETE EIPB.DBO.ERP_AXMI25_TEMP WHERE ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'";
        //    rs.Open(command);
        //    rs.Close();
        //    rs.Dispose();
        //}


        //找出不一樣的值變寫入至Temptable
        //privae void find_different_and_write_to_temptable(string rowno)
        //{
        //    try
        //    {
        //        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //        string command = "SELECT occ02 occa02,occ03 occa03,ta_occ1301 ta_occa1301,ta_occ1302 ta_occa1302 ," +
        //                         "      occ04 occa04,occ06 occa06,occ15 occa15,occ18 occa18, occ19 occa19 ," +
        //                         "      occ20 occa20,occ21 occa21,occ231 occa231,occ232 occa232,occ233 occa233,occ241 occa241, " +
        //                         "      occ242 occa242,occ243 occa243,occ261 occa261 ,occ262 occa262 , occ263 occa263 , occ28 occa28,occ35 occa35,occ38 occa38,occ39 occa39, " +
        //                         "      occ271 occa271 ,occ272 occa272 , occ273 occa273 , occ29 occa29 , occ292 occa292 ,occ30 occa30 , occ302 occa302 ," +
        //                         "      occ47 occa47 , occ48 occa48 , occ49 occa49 , occ50 occa50 , occ51 occa51 , occ701 occa701 , occ702 occa702 , " +
        //                         "      occ703 occa703,occ704 occa704 ,ta_occ191 ta_occa191 , ta_occ192 ta_occa192 , ta_occ193 ta_occa193 , " +
        //                         "      occ41 occa41,occ42 occa42,occ43 occa43,occ44 occa44,occ45 occa45,occ55 occa55,occ56 occa56 , ta_occ20 ta_occa20, ta_occ21  ta_occa21 , ta_occ22 ta_occa22, " +
        //                         "      ta_occ23a ta_occ23a,ta_occ23b ta_occa23b,ta_occ23c ta_occa23c,ta_occ24a ta_occa24a,ta_occ24b ta_occa24b,ta_occ24c ta_occa24c," +
        //                         "      ta_occ25a ta_occa25a,ta_occ25b ta_occa25b,ta_occ25c ta_occa25c,ta_occ26a ta_occa26a,ta_occ26b ta_occa26b,ta_occ26c ta_occa26c," +
        //                         "      ta_occ26d ta_occa26d,ta_occ26e ta_occa26e,ta_occ26f ta_occa26f,ta_occ26g ta_occa26g,ta_occ27 ta_occa27,ta_occ28 ta_occa28," +
        //                         "      ta_occ29 ta_occa29 " +
        //                         "      ,ta_occ01 ,ta_occ02,ta_occ03,ta_occ04,ta_occ05 " + //V1.0.2
        //                         " FROM [IP185].[" + getZone(rowno) + "].[dbo].[OCC_FILE]   " +
        //                         "WHERE 1=1 " +
        //                         "  AND OCC01 = '" + this.FIELD_occa01.Text.Trim() + "'";
        //        rs.Open(command);

        //        SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //        command = "SELECT  occa02 ,occa03 ,ta_occa1301,ta_occa1302 ," +
        //                         "  occa04 ,substring(occa06,1,1) occa06 ,occa15, occa18,occa19 ," +
        //                         "  occa20,occa21,occa231,occa232,occa233,occa241," +
        //                         "   occa242,occa243,occa261 ,occa262 , occa263 , occa28,occa35,occa38,occa39, " +
        //                         "      occa271 ,occa272 , occa273 , occa29 , occa292 ,occa30 , occa302 ," +
        //                         "      occa47 , occa48 , occa49 , occa50 , occa51 , occa701 , occa702 , " +
        //                         "      occa703,occa704 ,ta_occa191 , ta_occa192 , ta_occa193 ," +
        //                         "      occa41,occa42,occa43,occa44,occa45,substring(occa55,1,1) occa55,occa56 , ta_occa20, substring(ta_occa21,1,1) ta_occa21, ta_occa22, " +
        //                             "      ta_occa23a,ta_occa23b,ta_occa23c,ta_occa24a,ta_occa24b,ta_occa24c,ta_occa25a," +
        //                             "      ta_occa25b,ta_occa25c,ta_occa26a,ta_occa26b,ta_occa26c,ta_occa26d,ta_occa26e,ta_occa26f,ta_occa26g," +
        //                             "      ta_occa27,ta_occa28,ta_occa29 " +
        //                         "      ,ta_occa01 ,ta_occa02,ta_occa03,ta_occa04,ta_occa05 " + //V1.0.2
        //                         "  FROM EIPB.DBO.ERP_AXMI25  " +
        //                         " WHERE OCCA01 = '" + this.FIELD_occa01.Text.Trim() + "'" +
        //                         "   AND OCCANO = '" + this.FIELD_occano.Text.Trim() + "'";
        //        rs1.Open(command);


        //        SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        //        string command_update = "SELECT * " +
        //                                "  FROM EIPB.DBO.ERP_AXMI25_TEMP " +
        //                                " WHERE 1=0 ";
        //        rs2.Open(command_update);

        //        SmoothEnterprise.Database.DataSet rs3 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        //        string command_excute = "SELECT PlantID " +
        //                                "  FROM EIPB.DBO.ERP_AXMI25 " +
        //                                " WHERE ROWNO = '" + rowno + "' ";
        //        string PlantID = rs3.ExecuteScalar(command_excute).ToString();
        //        rs3.Close();
        //        rs3.Dispose();
        //        if (!rs.EOF)
        //        {

        //            for (int i = 0; i < rs.Columns.Count; i++)
        //            {
        //                /*20170616 by carol 
        //                if (!rs[i].ToString().Contains(rs1[i].ToString())) //不同即修改
        //                {
        //                    rs2.Add();
        //                    rs2["ROWNO"] = rowno;
        //                    rs2["ID"] = Guid.NewGuid().ToString();
        //                    rs2["zone"] = PlantID;
        //                    rs2["field_name"] = rs1.Columns[i].ColumnName;
        //                    if (rs.Columns[i].ColumnName.Contains("occa12"))
        //                        rs2["field_value"] = @"" + DateTime.Parse(rs1[i].ToString()).ToString("yyyy/MM/dd");
        //                    else
        //                        rs2["field_value"] = @"" + rs1[i].ToString();
        //                    rs2["no"] = this.FIELD_occano.Text.Trim();
        //                    rs2["apply_atrribute"] = FIELD_occa00.Text.Trim().Substring(0, 1);
        //                    rs2.Update();
        //                }
        //                */


        //                //update by carol.yeh 2017/06/16
        //                string ERP = rs[i].ToString();
        //                string EIP = rs1[i].ToString();

        //                if (ERP != EIP)
        //                {
        //                    rs2.Add();
        //                    rs2["ROWNO"] = rowno;
        //                    rs2["ID"] = Guid.NewGuid().ToString();
        //                    rs2["zone"] = PlantID;
        //                    rs2["field_name"] = rs1.Columns[i].ColumnName;
        //                    if (rs.Columns[i].ColumnName.Contains("occa12"))
        //                        rs2["field_value"] = @"" + DateTime.Parse(rs1[i].ToString()).ToString("yyyy/MM/dd");
        //                    else
        //                        rs2["field_value"] = @"" + rs1[i].ToString();
        //                    rs2["no"] = this.FIELD_occano.Text.Trim();
        //                    rs2["apply_atrribute"] = FIELD_occa00.Text.Trim().Substring(0, 1);
        //                    rs2.Update();
        //                }
        //            }

        //            rs2.Close();
        //            rs2.Dispose();
        //        }
        //        //新增時不用去考慮變紅字
        //        //else if (rs.Rows.Count == 0)
        //        //{
        //        //    for (int i = 0; i < rs.Columns.Count; i++)
        //        //    {
        //        //        try
        //        //        {
        //        //            ContentPlaceHolder cnt;
        //        //            cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
        //        //            Label chb = (Label)cnt.FindControl("LABEL_" + rs.Columns[i].ColumnName);
        //        //            chb.ForeColor = System.Drawing.Color.Red;
        //        //        }
        //        //        catch (Exception ex)
        //        //        {
        //        //        }
        //        //    }
        //        //}
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message + "\r\n rowno :" + rowno);
        //    }
        //}

        protected void Btn_XML_Click(object sender, System.EventArgs e)
        {

            Differ_Column(false);
            OutXML("2", Request.QueryString["ROWNO"].ToString());
        }

        protected void SENDTXT_Click(object sender, System.EventArgs e)
        {
            try
            {
                ////testmail();
                Differ_Column(false);
                //checkupdata();
                //find_different_and_write_to_temptable(Request.QueryString["ROWNO"].ToString());

                OutXML("2", Request.QueryString["ROWNO"].ToString());
                FinishApprove();

            }
            catch (Exception ex)
            {
                this.AddError(null, "sendtxt", "", ex.Message);
            }
        }

        private void testmail()
        {
            try
            {
                string MId = "{4849B051-F909-481D-AA44-2624A881959B}";
                string PapCaption = "";

                if (this.FIELD_occa00.Text.Contains("V"))
                {
                    PapCaption = @"客戶代號申請單，" + (this.FIELD_ta_occa14.Text.Contains("Y") ? "原生效客戶改為失效" : "原失效客戶改為有效") + "、ERP單號 " + this.FIELD_occano.Text + " 客戶簡稱 " + this.FIELD_occa02.Text;
                }
                else
                {
                    PapCaption = @"客戶代號申請單， " + (this.FIELD_occa00.Text.Contains("I") ? "新增" : "修改") + "、ERP單號 " + this.FIELD_occano.Text + " 客戶簡稱 " + this.FIELD_occa02.Text;
                }

                string PID = this.FIELD_occano.Text;//FIELD_pmcsn.Text + addmemo();
                string AppName = "麥東明";
                string purl = "";
                string AppMail = "rage.mai@minaik.com.tw";
                string body = "";
                ShrFlowMail UseMail = new ShrFlowMail();
                UseMail.ApproveMail(MId, PapCaption, PID, AppName, purl, AppMail, body);


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private bool exclude(string col)
        {
            bool isChange = true;

            if (col == "OCCAUSER" || col == "OCCAGRUP" || col == "OCCAUD15" || col == "OCCA1004" || col == "OCCAACTI" || col == "OCCA00") //例外，不更新的欄位
            {
                isChange = false;
            }

            return isChange;

        }

        private bool Authority(string logonid, string apply)
        {
            bool isEnable = false;
            StringBuilder sb = new StringBuilder();
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                sb.Append("SELECT U.id ID, EF.level_name, EF.SEQ SEQ ");
                sb.Append("  FROM EIPB.DBO.ERP_FLOWSET EF, EIPA.DBO.dguser U , EIPA.DBO.dglevel L ");
                sb.Append(" WHERE EF.UID = U.id  AND U.levid = L.lnid AND EF.PROGAME_NAME = 'ERP_AXMI25' ");
                sb.AppendFormat(" and (level_name like '%協理' or level_name like '財務%') and logonid='{0}'  and args='{1}' ", logonid, apply);
                sb.Append("ORDER BY EF.ARGS , EF.SEQ ");

                rs.Open(sb.ToString());
                if (!rs.EOF)
                {
                    isEnable = true;
                }
                else
                {
                    isEnable = Utility.MIS_Manager(logonid);
                }
            }

            return isEnable;
        }


        //登入者是財務１
        private bool ConfirmUser()
        {
            DBTransfer dt = new DBTransfer();


            string sql = "SELECT logonid FROM EIPB.DBO.ERP_FLOWSET EF, EIPA.DBO.dguser U, EIPA.DBO.dglevel L" +
            " WHERE EF.UID = U.id" +
            " AND U.levid = L.lnid" +
            " AND EF.PROGAME_NAME = 'ERP_AXMI25'" +
            " and args = 'I' " +
            " and  level_name='財務1' " +
            " ORDER BY EF.ARGS , EF.SEQ";

            string logonid = dt.GetTopfile(sql);

            return CurrentUser.LogonID == logonid ? true : false;
        }



    }

    //class contex
    //{
    //    private List<string[]> _data = new List<string[]>();
    //    /// <summary>
    //    /// display this array data and output in string ;
    //    /// </summary>
    //    public string display
    //    {
    //        get
    //        {
    //            string _display = "";
    //            foreach (string[] s in _data)
    //            {
    //                foreach (string ss in s)
    //                {
    //                    _display += "\"" + ss + "\"|";
    //                }
    //                _display = _display.Substring(0, _display.Length - 1);
    //                _display += "\r\n";
    //            }
    //            return _display;
    //        }
    //    }
    //    public List<string[]> data
    //    {
    //        get
    //        {
    //            return _data;
    //        }
    //    }
    //    public int count
    //    {
    //        get
    //        {
    //            return _data.Count;
    //        }
    //    }
    //    /// <summary>
    //    /// insert a new row
    //    /// </summary>
    //    /// <param name="area">廠區</param>
    //    /// <param name="field">欄位名稱</param>
    //    /// <param name="fieldcont">欄位內容</param>
    //    /// <param name="number">單號</param>
    //    /// <param name="apply">申請性質</param>
    //    public void add(string area, string field, string fieldcont, string number, string apply)
    //    {
    //        try
    //        {
    //            string[] row = new string[] { area, field, fieldcont, number, apply };
    //            _data.Add(row);
    //        }
    //        catch (Exception ex)
    //        {
    //            throw new Exception(ex.Message + field);
    //        }
    //    }

    //}

    public class ERP_Out
    {

        public string Plant; //廠區
        public string Column; //欄位名稱
        public string Value; //欄位內容
        public string ERP_NO; //單號
        public string Action; //申請性質

        private List<ERP_Out> _list = new List<ERP_Out>();

        /// </summary>
        /// <param name="plant">廠區</param>
        /// <param name="column">欄位名稱</param>
        /// <param name="value">欄位內容</param>
        /// <param name="erp_no">單號</param>
        /// <param name="action">申請性質</param>
        public void Add(string plant, string column, string value, string erp_no, string action)
        {
            ERP_Out o = new ERP_Out();
            o.Plant = plant;
            o.Column = column;
            o.Value = value;
            o.ERP_NO = erp_no;
            o.Action = action;

            _list.Add(o);
        }

        public List<ERP_Out> List
        {
            get
            {
                return _list;
            }
        }


    }

}
