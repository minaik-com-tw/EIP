/*
 * 2016/8/1 add by rage 
 * 原因：因組織問題業二單位會直接送審至財務長
 * 解決方式：如果指的主管是財務長並且是業務單位時，主管指定為阿芳
 * /// <summary>
 *
 * 架構 ERP => EIP 走 Web API 在ERP按下送簽後，由ERP 發動Triiger 至 http://eip.minaik.com.tw/ERP_AXMI25/ERP_AXMI25_receive.ashx?file=交換資料檔
 * 回傳ERP 將檔案傳回192.168.0.250 由 axmi250.exe回寫　ERP 
 * 回寫資料由View 產生，條件是審核完成。
 * 
 * */

/* Mark       Date         Author             Reason                           
* ---------------------------------------------------------------------------------------------------
* V1.0.1       2017/11/22   Carol             S0001-1710004-謝珮真 
* 新增銀行資料頁籤，以利財務人員key in，eip審核完成後將資料回寫至axmi221的銀行資料欄位
* 新增 occ38 occ39  可編輯
* 
* V1.0.7  2018/12/19   Carol          Modify  
* 財會要求失效 => 生效 需要經過謝生先;
* V1.0.8  2019/06/24 carol update    信用評等 加入廠別  [OCG_FILE]  
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
using SmoothEnterprise.Flowwork.UI.WebControl;

namespace CNE
{
    public partial class CNEEdit : SmoothEnterprise.Web.Page
    {
        private bool _NotifyReview = false;
        private string _request = "";
        private string _message = "";
        public string show = "";


        protected string reconvertchar(string s, int charint)
        {
            string[] _s = s.Split('.');
            _s[0] = _s[0].ToString().Replace(",", "");
            _s[1] = _s[1].ToString().PadRight(charint, '0');
            return _s[0] + "." + _s[1];
        }
        protected void Page_Load(object sender, System.EventArgs e)
        {
            //Page.Title = "CNE Edit Page";
            try
            {
                
                if (!this.IsPostBack)
                {
                    
                    initdropfield(); //初始欄位
                    initdata(); //初始資料  

                    Contrast();
                    initupdate();
                    starupscript();
                    //initcharge();


                }

            }
            catch (Exception ex)
            {
                this.AddError(this, "OnLoad", "", ex.Message);
                Response.Write(ex.Message + "<br>" + ex.StackTrace);
            }
        }

        private void initcharge()
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("SELECT G.uid " +
                    "  FROM EIPA.DBO.dguser U, EIPA.DBO.dggroup G " +
                    " WHERE U.gid = G.id " +
                    "   AND empid = (SELECT SUBSTRING(occauser, 2, LEN(OCCAUSER) - 1) " +
                    "                  FROM EIPB.DBO.ERP_AXMI25 " +
                    "                 WHERE ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "')");
            if (!rs.EOF)
            {
                this.FIELD_charge.Text = rs["uid"].ToString();
            }
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

        protected void Contrast()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                string command = " SELECT * " +
                                 //string command = "SELECT occ01 occa01 , occ63 occa63, occ02 occa02,occ03 occa03, " +
                                 //                 "      occ04 occa04,occ06 occa06,occ15 occa15,occ18 occa18, occ19 occa19 , " +
                                 //                 "      occ20 occa20,occ21 occa21,occ231 occa231,occ232 occa232,occ233 occa233,occ241 occa241, " +
                                 //                 "      occ242 occa242,occ243 occa243, OCCACTI ta_occa14,occ28 occa28,occ35 occa35,occ38 occa38,occ39 occa39, " +
                                 //                 "      occ41 occa41,occ42 occa42,occ43 occa43,occ44 occa44,occ45 occa45,occ55 occa55,occ56 occa56 , ta_occ22 ta_occa22 , occ704 occa704 ," +
                                 //                 "      ta_occ23a ta_occ23a,ta_occ23b ta_occa23b,ta_occ23c ta_occa23c,ta_occ24a ta_occa24a,ta_occ24b ta_occa24b,ta_occ24c ta_occa24c," +
                                 //                 "      ta_occ25a ta_occa25a,ta_occ25b ta_occa25b,ta_occ25c ta_occa25c,ta_occ26a ta_occa26a,ta_occ26b ta_occa26b,ta_occ26c ta_occa26c," +
                                 //                 "      ta_occ26d ta_occa26d,ta_occ26e ta_occa26e,ta_occ26f ta_occa26f,ta_occ26g ta_occa26g,ta_occ27 ta_occa27,ta_occ28 ta_occa28," +
                                 //                 "      ta_occ29 ta_occa29" +
                                 //"      --,ta_occ191 ,ta_occ192,ta_occ193 "+
                                 " FROM [IP185].[" + getZone() + "].[dbo].[OCC_FILE]   " +
                                 "WHERE 1=1 " +
                                 "  AND OCC01 = '" + this.FIELD_occa01.Text.Trim() + "'";
                rs.Open(command);

                SmoothEnterprise.Database.DataSet rs1 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                command = " SELECT * " +
                                 //command = "SELECT occa01 , occa63 , occa02 ,occa03 ,occa04 ,substring(occa06,1,1) occa06 ,occa15, " +
                                 //                 "       occa18,occa19,occa20,occa21,occa231,occa232,occa233,occa241,occa242, " +
                                 //                 "      occa243,ta_occa14, " +
                                 //                 "      occa28 , occa35,occa38,occa39,occa41,occa42,occa43,occa44,occa45,substring(occa55,1,1) occa55,occa56  , ta_occa22 ,occa704, " +
                                 //                 "      ta_occa23a,ta_occa23b,ta_occa23c,ta_occa24a,ta_occa24b,ta_occa24c,ta_occa25a," +
                                 //                 "      ta_occa25b,ta_occa25c,ta_occa26a,ta_occa26b,ta_occa26c,ta_occa26d,ta_occa26e,ta_occa26f,ta_occa26g," +
                                 //                 "      ta_occa27,ta_occa28,ta_occa29" +
                                 //"          --,ta_occa191 ,ta_occa192,ta_occa193 "+
                                 "  FROM EIPB.DBO.ERP_AXMI25  " +
                                 " WHERE ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'";
                rs1.Open(command);
                if (!rs.EOF)
                {
                    //Response.Write("TEST<BR/>");
                    for (int i = 0; i < rs.Columns.Count; i++)
                    {
                        //Response.Write("LOOP " + rs.Columns[i].ColumnName + "<BR/>");
                        if (rs.Columns[i].ColumnName.ToUpper().Contains("OCC") ||
                           rs.Columns[i].ColumnName.ToUpper().Contains("TA_OCC"))
                        {
                            //Response.Write("in<BR/>");
                            string colname = rs.Columns[i].ColumnName;
                            string newcolname = colname.ToUpper().IndexOf("OCC") == 0 ? colname.Substring(0, 3) + "a" + colname.Substring(3, colname.Length - 3) :
                                colname.ToUpper().IndexOf("TA_OCC") == 0 ? colname.Substring(0, 6) + "a" + colname.Substring(6, colname.Length - 6) : "";
                            //Response.Write("colname :" + colname + "<BR/>");
                            //Response.Write("newcolname :" + newcolname + "<BR/>");
                            try
                            {
                                if (!rs1[newcolname].ToString().Contains(rs[colname].ToString()) &&
                                    !newcolname.Contains("occa12") &&
                                    !newcolname.Contains("occauser") &&
                                    !newcolname.Contains("occagrup"))
                                {
                                    try
                                    {
                                        ContentPlaceHolder cnt;
                                        cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                                        Label chb = (Label)cnt.FindControl("LABEL_" + newcolname/*rs1.Columns[i].ColumnName*/);
                                        chb.ForeColor = System.Drawing.Color.Red;
                                    }
                                    catch
                                    {
                                        try
                                        {
                                            ContentPlaceHolder cnt;
                                            cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                                            CheckBox chb = (CheckBox)cnt.FindControl("FIELD_" + newcolname /*rs1.Columns[i].ColumnName*/);
                                            chb.ForeColor = System.Drawing.Color.Red;
                                        }
                                        catch (Exception ex)
                                        {
                                            //Response.Write(ex.Message);
                                        }
                                    }
                                }
                            }
                            catch { }
                        }
                    }
                }
                //新增時不用去考慮變紅字
                //else if (rs.Rows.Count == 0)
                //{
                //    for (int i = 0; i < rs.Columns.Count; i++)
                //    {
                //        try
                //        {
                //            ContentPlaceHolder cnt;
                //            cnt = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                //            Label chb = (Label)cnt.FindControl("LABEL_" + rs.Columns[i].ColumnName);
                //            chb.ForeColor = System.Drawing.Color.Red;
                //        }
                //        catch (Exception ex)
                //        {
                //        }
                //    }
                //}
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private string getZone()
        {
            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs2.Open("SELECT TOP 1 PlantID FROM EIPB.DBO.ERP_AXMI25 WHERE rowno='" + Request.QueryString["ROWNO"] + "'");
            if (!rs2.EOF)
                return rs2["PlantID"].ToString();
            else
                return "MINAIK";
        }

        /// <summary>
        /// 上傳傳件
        /// </summary>
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
                //FIELD_argv2
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

                //FIELD_ta_occa11 0:無 1:訂單  2:forecast  3:兩者
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
                /*
                                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                                string command = "SELECT ocg01 " +
                                                 " FROM [IP185].[MINAIK].[dbo].[OCG_FILE] ";
                                rs.Open(command);
                                this.FIELD_occa61.Items.Add(new ListItem("請選擇", ""));
                                while (!rs.EOF)
                                {
                                    this.FIELD_occa61.Items.Add(new ListItem(rs["ocg01"].ToString(), rs["ocg01"].ToString()));
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


                    this.FIELD_occa01.Text = rs["occa01"].ToString();
                    this.FIELD_occa36.Text = rs["occa36"].ToString();
                    this.FIELD_occa37.Checked = bool.Parse(rs["occa37"].ToString() == "N" ? "false" : "true");
                    //this.FIELD_occa56.Checked = bool.Parse(rs["occa56"].ToString() == "N" ? "false" : "true");

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
                        this.FIELD_occa00.Text = "V:生失效";
                    if (rs["occa00"].ToString().Contains("U"))
                        this.FIELD_occa00.Text = "U:修改";
                    if (rs["occa00"].ToString().Contains("I"))
                        this.FIELD_occa00.Text = "I:新增";
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

                    /* del ty  V1.0.8 
                    //this.FIELD_occa61.Text = rs["occa61"].ToString();//V1.0.9
                    */

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
                    this.FIELD_ta_occa10.Text = rs["ta_occa10"].ToString();
                    if (rs["ta_occa11"].ToString().Contains("0"))
                        this.FIELD_ta_occa11.Text = "0:無";
                    if (rs["ta_occa11"].ToString().Contains("1"))
                        this.FIELD_ta_occa11.Text = "1:訂單";
                    if (rs["ta_occa11"].ToString().Contains("2"))
                        this.FIELD_ta_occa11.Text = "2:forecast";
                    if (rs["ta_occa11"].ToString().Contains("3"))
                        this.FIELD_ta_occa11.Text = "3:兩者";
                    //this.FIELD_ta_occa11.SelectedValue = rs["ta_occa11"].ToString().Substring(0,1);

                    this.FIELD_ta_occa14.Text = rs["ta_occa14"].ToString();
                    this.FIELD_ta_occa15.Text = rs["ta_occa15"].ToString();

                    this.FIELD_ta_occa20.Text = rs["ta_occa20"].ToString() + " " + rs["tc_oah02_16"];
                    this.FIELD_ta_occa21.Text = rs["ta_occa21"].ToString();

                    this.FIELD_occanote.Text = rs["occanote"].ToString();
                    this.FIELD_ta_occa1201.Text = rs["ta_occa1201"].ToString();
                    this.FIELD_ta_occa1202.Text = rs["ta_occa1202"].ToString();
                    this.FIELD_ta_occa1203.Text = rs["ta_occa1203"].ToString();
                    this.FIELD_ta_occa191.Text = rs["ta_occa191"].ToString() + rs["ta_occa192"].ToString() + rs["ta_occa193"].ToString();
                    this.FIELD_occa231.Text = rs["occa231"].ToString() + Environment.NewLine + rs["occa232"].ToString() + Environment.NewLine + rs["occa233"].ToString();
                    this.FIELD_occa241.Text = rs["occa241"].ToString() + Environment.NewLine + rs["occa242"].ToString() + Environment.NewLine + rs["occa243"].ToString();
                    this.FIELD_occa45_NOTE.Text = rs["occa45_NOTE"].ToString();

                    this.FIELD_ta_occa22.Checked = rs["ta_occa22"].ToString().Contains("Y");
                    this.FIELD_occa704.Text = rs["occa704"].ToString();

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

                    //銀行資料 V1.0.1
                    this.FIELD_ta_occa01.Text = rs["ta_occa01"].ToString();
                    this.FIELD_ta_occa02.Text = rs["ta_occa02"].ToString();
                    this.FIELD_ta_occa03.Text = rs["ta_occa03"].ToString();
                    this.FIELD_ta_occa04.Text = rs["ta_occa04"].ToString();
                    this.FIELD_ta_occa05.Text = rs["ta_occa05"].ToString();


                    FIELD_occa38.Text = rs["occa38"].ToString();
                    FIELD_occa39.Text = rs["occa39"].ToString();
                    LABEL_occa631.Text = rs["occa631"].ToString();
                    // V1.0.1

                    //Utility.setEnable(false, FIELD_ta_occa01, FIELD_ta_occa02, FIELD_ta_occa03, FIELD_ta_occa04, FIELD_ta_occa05); //del by carol 20190722

                    this.FIELD_charge.Text = string.IsNullOrEmpty(rs["ischarge"].ToString()) ? initchargeid() : rs["ischarge"].ToString();
                    this.FIELD_l_day.Text = rs["l_day"].ToString();

                    if (rs["isState"].ToString().Contains("waiting") || rs["isState"].ToString().Contains("Terminate"))
                    {
                        //del by carol 201907/22
                        //this.BUTTON_save.Enabled = true;
                        //this.BUTTON_delete.Enabled = true;
                    }
                    else
                    {
                        //
                        //if (Utility.MIS_Manager(CurrentUser.LogonID))
                        //{
                        //    this.BUTTON_save.Enabled = false;
                        //    this.BUTTON_delete.Enabled = false;
                        //}
                    }

                    if (rs["l_day"].ToString() == "Y")
                    {
                        this.LABEL_occa45_NOTE.Visible = true;
                        this.FIELD_occa45_NOTE.Visible = true;
                        //setscript();
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

                    //update by V1.0.8
                    if (rs["PlantID"].ToString() == "MATE02") //by MATE02 for test 
                    {
                        this.FIELD_occa61.Items.Add(new ListItem("A", "A"));
                        this.FIELD_occa61.Items.Add(new ListItem("B", "B"));
                    }
                    else
                    {
                        SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                        string command = "SELECT ocg01 " +
                                         " FROM [IP185].[" + rs["PlantID"].ToString() + "].[dbo].[OCG_FILE] ";
                        rs2.Open(command);

                        this.FIELD_occa61.Items.Add(new ListItem("請選擇", ""));
                        while (!rs2.EOF)
                        {
                            this.FIELD_occa61.Items.Add(new ListItem(rs2["ocg01"].ToString(), rs2["ocg01"].ToString()));
                            rs2.MoveNext();
                        }
                        rs2.Close();
                        rs2.Dispose();
                    }

                    this.FIELD_occa61.SelectedValue = rs["occa61"].ToString();
                    //update by V1.0.8 end 
             
                }
                else
                {
                    Response.Redirect("ERP_AXMI25.aspx");
                }

                if (Utility.MIS_Manager(CurrentUser.LogonID))
                {
                    //del by carol 201907/22
                    //this.BUTTON_delete.Enabled = true;
                }



            }
            catch (Exception ex)
            {
                //throw new Exception(ex.Message);
                Response.Write(ex.Message + "<br>" + ex.StackTrace);
            }

        }

        private string initchargeid()
        {
            string initchargeid = "";
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            initchargeid = rs.ExecuteScalar("SELECT G.uid " +
                                            "  FROM EIPA.DBO.dguser U, EIPA.DBO.dggroup G " +
                                            " WHERE U.gid = G.id " +
                                            "   AND empid = (SELECT SUBSTRING(occauser, 2, LEN(OCCAUSER) - 1) " +
                                            "                  FROM EIPB.DBO.ERP_AXMI25 " +
                                            "                 WHERE ROWNO = '" + Request.QueryString["rowno"].ToString() + "') ").ToString();
            #region EDIT BY Rage 2016/8/12 如果指的主管是財務長並且是業務單位時，主管指定為負責業務員編號
            if (isSales() && initchargeid.ToUpper().Contains("AB70A6C0-D106-4636-B1E1-15DFFF9A83C5"))
            {
                initchargeid = rs.ExecuteScalar("SELECT U.ID " +
                                                "      FROM EIPB.DBO.ERP_AXMI25 ERP LEFT OUTER JOIN EIPA.DBO.dguser U " +
                                                "        ON SUBSTRING(ERP.occa04, 2, 5) = U.empid " +
                                                "     WHERE ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'  ").ToString();
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("alert('主管已指定為負責業務員');");
                Response.Write("</script>");
            }
            #endregion
            return initchargeid;
        }

        private bool isSales()
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("SELECT * " +
                    "  FROM EIPA.DBO.dguser U " +
                    " WHERE gid = 'E6DAC05B-303C-47A9-A2FC-E75DBD9660B0'  " +
                    "   AND ID = '" + this.CurrentUser.ID + "'  ");
            if (!rs.EOF)
                return true;
            else
                return false;
        }

        private void setscript()
        {
            //判斷是否由失效改為失效
            if (!(this.FIELD_occa00.Text.Contains("V") && this.FIELD_ta_occa14.Text.Contains("Y")))
            {

                Response.Write("<script type=\"text/javascript\">");
                //Response.Write("            alert('FIELD_occa00 : " + this.FIELD_occa00.Text.Contains("V").ToString()+ "')");
                //Response.Write("            alert('FIELD_ta_occa14 : " + this.FIELD_ta_occa14.Text.Contains("Y") + "')");
                Response.Write("            function check(){ " +
                               "                 if ($(\"#ctl00$ContentPlaceHolder1$FIELD_occa45_NOTE\").length >0) " +
                               "                 { " +
                               "                      alert(\"大於90天的收款原因為必填\"); " +
                               "                      return false; " +
                               "                 } " +
                               "             }");
                Response.Write("</script>");
            }
        }
        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            //Response.Write("-1");
            if (!this.IsPostBack)
            {
                this.KeepURL();

            }
            if (_NotifyReview)
            {
                //Response.Write("-2");
                changeIsState("isSend");
                sendmail();
            }
            SetBtn_Enable();
        }
        private void save_form()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM EIPB.DBO.ERP_AXMI25 WHERE ROWNO='" + Request.QueryString["ROWNO"] + "' ");
                if (!rs.EOF)
                {
                    if (this.FIELD_occa45_NOTE.Text.Trim() != "") rs["occa45_NOTE"] = this.FIELD_occa45_NOTE.Text.Trim();
                    if (this.FIELD_charge.Text != "") rs["ischarge"] = this.FIELD_charge.Text;
                    //if (this.FIELD_occa01.Text != "") rs["occa01"] = this.FIELD_occa01.Text; else rs["occa01"] = System.DBNull.Value;
                    //if (this.FIELD_occa36.Text != "") rs["occa36"] = this.FIELD_occa36.Text; else rs["occa36"] = System.DBNull.Value;
                    //rs["occa37"] = this.FIELD_occa37.Checked ? "Y":"N";
                    //if (this.FIELD_occa61.SelectedValue != "") rs["occa61"] = this.FIELD_occa61.SelectedValue; else rs["occa61"] = System.DBNull.Value;
                    //if (this.FIELD_occa63.Text != "") rs["occa63"] = this.FIELD_occa63.Text; else rs["occa63"] = System.DBNull.Value;
                    //rs["ta_occa06"] = this.FIELD_ta_occa06.Checked ? "Y" : "N";
                    //rs["ta_occa07"] = this.FIELD_ta_occa07.Checked ? "Y" : "N";
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
                    //if (this.FIELD_occa19.Text != "") rs["occa19"] = this.FIELD_occa19.Text; else rs["occa19"] = System.DBNull.Value;
                    //if (this.FIELD_occa20.Text != "") rs["occa20"] = this.FIELD_occa20.Text; else rs["occa20"] = System.DBNull.Value;
                    //if (this.FIELD_occa21.Text != "") rs["occa21"] = this.FIELD_occa21.Text; else rs["occa21"] = System.DBNull.Value;
                    //if (this.FIELD_occa23.Text != "") rs["occa23"] = this.FIELD_occa23.Text; else rs["occa23"] = System.DBNull.Value;
                    //if (this.FIELD_occa24.Text != "") rs["occa24"] = this.FIELD_occa24.Text; else rs["occa24"] = System.DBNull.Value;
                    //if (this.FIELD_occa261.Text != "") rs["occa261"] = this.FIELD_occa261.Text; else rs["occa261"] = System.DBNull.Value;
                    //if (this.FIELD_occa262.Text != "") rs["occa262"] = this.FIELD_occa262.Text; else rs["occa262"] = System.DBNull.Value;
                    //if (this.FIELD_occa263.Text != "") rs["occa263"] = this.FIELD_occa263.Text; else rs["occa263"] = System.DBNull.Value;
                    //if (this.FIELD_occa271.Text != "") rs["occa271"] = this.FIELD_occa271.Text; else rs["occa271"] = System.DBNull.Value;
                    //if (this.FIELD_occa272.Text != "") rs["occa272"] = this.FIELD_occa272.Text; else rs["occa272"] = System.DBNull.Value;
                    //if (this.FIELD_occa273.Text != "") rs["occa273"] = this.FIELD_occa273.Text; else rs["occa273"] = System.DBNull.Value;
                    //if (this.FIELD_occa28.Text != "") rs["occa28"] = this.FIELD_occa28.Text; else rs["occa28"] = System.DBNull.Value;
                    //if (this.FIELD_occa29.Text != "") rs["occa29"] = this.FIELD_occa29.Text; else rs["occa29"] = System.DBNull.Value;
                    //if (this.FIELD_occa292.Text != "") rs["occa292"] = this.FIELD_occa292.Text; else rs["occa292"] = System.DBNull.Value;
                    //if (this.FIELD_occa30.Text != "") rs["occa30"] = this.FIELD_occa30.Text; else rs["occa30"] = System.DBNull.Value;
                    //if (this.FIELD_occa302.Text != "") rs["occa302"] = this.FIELD_occa302.Text; else rs["occa302"] = System.DBNull.Value;
                    //if (this.FIELD_occa33.Text != "") rs["occa33"] = this.FIELD_occa33.Text; else rs["occa33"] = System.DBNull.Value;
                    //if (this.FIELD_occa35.Text != "") rs["occa35"] = this.FIELD_occa35.Text; else rs["occa35"] = System.DBNull.Value;
                    //if (this.FIELD_occa38.Text != "") rs["occa38"] = this.FIELD_occa38.Text; else rs["occa38"] = System.DBNull.Value;
                    //if (this.FIELD_occa39.Text != "") rs["occa39"] = this.FIELD_occa39.Text; else rs["occa39"] = System.DBNull.Value;
                    //if (this.FIELD_occa41.Text != "") rs["occa41"] = this.FIELD_occa41.Text; else rs["occa41"] = System.DBNull.Value;
                    //if (this.FIELD_occa42.Text != "") rs["occa42"] = this.FIELD_occa42.Text; else rs["occa42"] = System.DBNull.Value;
                    //if (this.FIELD_occa43.Text != "") rs["occa43"] = this.FIELD_occa43.Text; else rs["occa43"] = System.DBNull.Value;
                    //if (this.FIELD_occa44.Text != "") rs["occa44"] = this.FIELD_occa44.Text; else rs["occa44"] = System.DBNull.Value;
                    //if (this.FIELD_occa45.Text != "") rs["occa45"] = this.FIELD_occa45.Text; else rs["occa45"] = System.DBNull.Value;
                    //if (this.FIELD_occa46.Text != "") rs["occa46"] = this.FIELD_occa46.Text; else rs["occa46"] = System.DBNull.Value;
                    //if (this.FIELD_occa47.Text != "") rs["occa47"] = this.FIELD_occa47.Text; else rs["occa47"] = System.DBNull.Value;
                    //if (this.FIELD_occa48.Text != "") rs["occa48"] = this.FIELD_occa48.Text; else rs["occa48"] = System.DBNull.Value;
                    //if (this.FIELD_occa49.Text != "") rs["occa49"] = this.FIELD_occa49.Text; else rs["occa49"] = System.DBNull.Value;
                    //if (this.FIELD_occa50.Text != "") rs["occa50"] = this.FIELD_occa50.Text; else rs["occa50"] = System.DBNull.Value;
                    //if (this.FIELD_occa51.Text != "") rs["occa51"] = this.FIELD_occa51.Text; else rs["occa51"] = System.DBNull.Value;
                    //if (this.FIELD_occa55.Text != "") rs["occa55"] = this.FIELD_occa55.Text; else rs["occa55"] = System.DBNull.Value;
                    //rs["occa56"] = this.FIELD_occa56.Checked ? "Y": "N";
                    //if (this.FIELD_occa62.Text != "") rs["occa62"] = this.FIELD_occa62.Text; else rs["occa62"] = System.DBNull.Value;
                    //if (this.FIELD_occa631.Text != "") rs["occa631"] = this.FIELD_occa631.Text; else rs["occa631"] = System.DBNull.Value;
                    //if (this.FIELD_occa701.Text != "") rs["occa701"] = this.FIELD_occa701.Text; else rs["occa701"] = System.DBNull.Value;
                    //if (this.FIELD_occa702.Text != "") rs["occa702"] = this.FIELD_occa702.Text; else rs["occa702"] = System.DBNull.Value;
                    //if (this.FIELD_occa703.Text != "") rs["occa703"] = this.FIELD_occa703.Text; else rs["occa703"] = System.DBNull.Value;
                    //if (this.FIELD_occa704.Text != "") rs["occa704"] = this.FIELD_occa704.Text; else rs["occa704"] = System.DBNull.Value;
                    //if (this.FIELD_occaacti.Text != "") rs["occaacti"] = this.FIELD_occaacti.Text; else rs["occaacti"] = System.DBNull.Value;
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
                    ////if (this.FIELD_ta_occa11.SelectedValue != "") rs["ta_occa11"] = this.FIELD_ta_occa11.SelectedValue; else rs["ta_occa11"] = "";
                    //if (this.FIELD_ta_occa12.Text != "") rs["ta_occa12"] = this.FIELD_ta_occa12.Text; else rs["ta_occa12"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa14.Text != "") rs["ta_occa14"] = this.FIELD_ta_occa14.Text; else rs["ta_occa14"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa15.Text != "") rs["ta_occa15"] = this.FIELD_ta_occa15.Text; else rs["ta_occa15"] = System.DBNull.Value;
                    //if (this.FIELD_ta_occa19.Text != "") rs["ta_occa19"] = this.FIELD_ta_occa19.Text; else rs["ta_occa19"] = System.DBNull.Value;
                    //if (this.FIELD_occanote.Text != "") rs["occanote"] = this.FIELD_occanote.Text; else rs["occanote"] = System.DBNull.Value;
                    rs.Update();
                }
                rs.Close();
                rs.Dispose();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message + "<BR/>" + ex.StackTrace);
            }
            finally
            {

            }
        }

        protected void UpdateFile()
        {
            try
            {
                #region 動態新增

                string FileList = "";
                for (int x = 0; x < this.CheckBoxFile.Items.Count; x++)
                {
                    if (CheckBoxFile.Items[x].Selected == true)
                    {
                        if (FileList == "")
                            FileList = "'" + CheckBoxFile.Items[x].Value + "'";
                        else
                            FileList = FileList + ",'" + CheckBoxFile.Items[x].Value + "'";
                    }

                }


                HttpFileCollection files = HttpContext.Current.Request.Files;
                System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
                //String uPath = "D:/Upload/";
                int att_count = 0;

                //String fpath;
                //fpath = "";

                SmoothEnterprise.Database.DataSet rs5 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs5.Open("SELECT * FROM EIPB.DBO.ERP_AXMI25_updatefile WHERE 1=0");

                for (int ifile = 0; ifile < files.Count; ifile++)
                {
                    HttpPostedFile postedfile = files[ifile];
                    string filename, fileExt, filePath;
                    filename = System.IO.Path.GetFileName(postedfile.FileName);    //抓取文件名
                    fileExt = System.IO.Path.GetExtension(postedfile.FileName);    //抓取文件附檔名

                    if (postedfile.ContentLength > 0)
                    {
                        rs5.Add();
                        att_count = att_count + 1;
                        String tafilename = "filename" + att_count.ToString();
                        String taattach = "attachment" + att_count.ToString();
                        String tafilexten = "fileexten" + att_count.ToString();

                        byte[] fileBytes = new byte[postedfile.ContentLength];
                        postedfile.InputStream.Read(fileBytes, 0, postedfile.ContentLength);
                        rs5["FileName"] = filename;
                        rs5["FileBody"] = fileBytes;
                        rs5["FileType"] = fileExt;
                        rs5["rowno"] = Request.QueryString["ROWNO"].ToString();
                        rs5.Update();
                    }
                }
                rs5.Close();

                if (FileList != "")
                {
                    SmoothEnterprise.Database.DataSet rs_file = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    string command = "Delete FROM EIPB.DBO.ERP_AXMI25_updatefile WHERE ID in (" + FileList + ")";

                    rs_file.ExecuteNonQuery(command);
                    rs_file.Close();
                    rs_file.Dispose();
                }
                #endregion
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            try
            {
                //if (this.FIELD_occa45_NOTE.Visible == false)
                //{
                //    if (this.FIELD_occa45_NOTE.Text.Trim().Length == 0)
                //    {
                //        _message = "請輸入慣用收款條件說明";
                //        Response.Write("<script type=\"text/javascript\">");
                //        Response.Write("alert('" + _message + "')");
                //        //Response.Write("location.href='ERP_AXMI25Edit.aspx?rowno=" + Request.QueryString["rowno"] + "';");
                //        Response.Write("</script>");
                //    }

                //}
                //else
                //{
                if (checkloginuser())
                {
                    save_form();
                    setflow(e);
                    request_click("SendRequest");
                }
                else
                {
                    Response.Write("<script type=\"text/javascript\">");
                    Response.Write("alert('登入有誤請重新登入再行送審')");
                    Response.Write("</script>");
                    return;
                }

                //}                
                //Response.Redirect("ERP_AXMI25Edit.aspx?ROWNO="+Request.QueryString["ROWNO"].ToString());
            }
            catch (Exception ex)
            {

                // this.Response.Write(ex.Message+"<br>");
                // this.Response.Write(ex.StackTrace);
                this.AddError(this, "SendRequest_Click", "", ex.Message + "<br/>" + ex.StackTrace);
            }
        }




        private bool checkloginuser()
        {
            SmoothEnterprise.Database.DataSet rsg = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rsg.Open("SELECT * " +
                     " FROM EIPA.DBO.dguser U  " +
                     "WHERE U.id = '" + this.CurrentUser.ID + "'");
            if (!rsg.EOF)
                return true;
            else
                return false;
        }

        protected void BUTTON_RemindReviewer_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            try
            {
                request_click("Remind");
            }
            catch (Exception ex)
            {
                //this.Response.Write(ex.Message);
                //this.AddError(this,"SendRequest_Click","",ex.Message);
            }
        }
        private void request_click(string e)
        {
            _NotifyReview = true;
            _request = e;
            //this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(),
            //      "RedirectAfterCommit",
            //      "<script language=\"javascript\">window.location='ERP_AXMI25.aspx';</script>");           
        }


        private void setflow(SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            try
            {
                //this.InputButton2.Enabled = false;
                this.BUTTON_SendRequest.Flow = this.FlowClient1;
                //this.InputButton1.Enabled = true;
                //this.BUTTON_save.Enabled = false; //del by carol 201907/22

                ArrayList countlevel = new ArrayList();
                ArrayList jobname = new ArrayList();

                #region 測試用
                //string command = "SELECT * FROM EIPA.DBO.DGUSER U ";
                //SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                //rs.Open(command);

                //測試用-----------------------------------
                //countlevel.Add("A3409158-8CFA-4857-9B54-1962306E0010");
                //jobname.Add("測試用");
                ////-----------------------------------------
                //countlevel.Add("A3409158-8CFA-4857-9B54-1962306E0010");
                //jobname.Add("測試用2");
                #endregion

                SmoothEnterprise.Database.DataSet rsg = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                string command_group = "";
                #region 設定協理以下層級簽核
                //如果未選取主管的話就指定為資料所有者的主管
                string dataowner = returnchargeid();

                getPrefect(ref countlevel, ref jobname, dataowner);

                #endregion
                //throw new Exception(command_group_1);
                //return;
                #region 設定流程簽核


                //新增

                //USDER->USDER主管(協理以上)(前段要請教振豪了)->財務(珮真)->財務資深經理(ann)->財務協理(秀珍)->財務長(曉毓)->CEO(謝R)->財務(珮真)

                //修改/生效

                //USDER->USDER主管(協理以上)(前段要請教振豪了)->財務(珮真)->財務資深經理(ann)->財務協理(秀珍)->財務長(曉毓)->CEO(謝R)


                //失效

                //USDER->USDER主管(協理以上) 前段要請教振豪了)-->財務(珮真)->財務資深經理(ann)->財務協理(秀珍)->財務長(曉毓)


                // V1.0.7
                string args = "";

                switch (FIELD_occa00.Text.Trim().Substring(0, 1))
                {
                    case "I":
                        args = "I";
                        break;
                    case "U":
                        args = "U";
                        break;
                    case "V":
                        if (this.FIELD_ta_occa14.Text.Trim().Contains("N")) //原客戶資料有效否
                            args = "U"; //生效
                        else
                            args = "V"; //失效
                        break;
                }

                command_group = "SELECT U.id ID, EF.level_name, EF.SEQ SEQ " +
                                "  FROM EIPB.DBO.ERP_FLOWSET EF, EIPA.DBO.dguser U , EIPA.DBO.dglevel L " +
                                " WHERE EF.UID = U.id " +
                                "   AND U.levid = L.lnid " +
                                "   AND EF.PROGAME_NAME = 'ERP_AXMI25' " +
                                //"   AND EF.ARGS = '" + FIELD_occa00.Text.Trim().Substring(0, 1) + "' " + V1.0.7
                                "   AND EF.ARGS = '" + args + "' " + //V1.0.7
                                " ORDER BY EF.ARGS , EF.SEQ ";
                rsg.Open(command_group);
                while (!rsg.EOF)
                {
                    countlevel.Add(rsg["id"].ToString());
                    jobname.Add(rsg["level_name"].ToString());
                    rsg.MoveNext();
                }
                rsg.Close();
                rsg.Dispose();
                //財務簽核關卡
                //countlevel.Add("13FEB136-9F48-416A-B495-7C2BE8C3B548");
                //jobname.Add("財務");
                #endregion

                int count = 0;
                foreach (string i in countlevel)
                {
                    this.FlowClient1.AddParameter("USER" + count.ToString(), i);
                    count++;
                }
                count = 0;
                foreach (string i in jobname)
                {
                    this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
                    count++;
                }
                sharflow12.Flowwork.sharflow121 flow = new sharflow12.Flowwork.sharflow121();
                FlowClient1.Text = "客代E化 單號：" + this.FIELD_occano.Text.Trim() + " 客戶：" + this.FIELD_occa02.Text.Trim();  //更改流程名稱
                #region flow set
                switch (count)  //依舊arraylist裡面有幾個,來判斷走那條flow
                {

                    case 1:
                        e.NextNode = flow.sharflow12Node1;
                        break;

                    case 2:
                        e.NextNode = flow.sharflow12Node2;
                        break;

                    case 3:
                        e.NextNode = flow.sharflow12Node4;
                        break;

                    case 4:
                        e.NextNode = flow.sharflow12Node7;
                        break;

                    case 5:
                        e.NextNode = flow.sharflow12Node11;
                        break;

                    case 6:
                        e.NextNode = flow.sharflow12Node16;
                        break;

                    case 7:
                        e.NextNode = flow.sharflow12Node22;
                        break;

                    case 8:
                        e.NextNode = flow.sharflow12Node29;
                        break;

                    case 9:
                        e.NextNode = flow.sharflow12Node37;
                        break;

                    case 10:
                        e.NextNode = flow.sharflow12Node46;
                        break;

                    case 11:
                        e.NextNode = flow.sharflow12Node56;
                        break;

                    case 12:
                        e.NextNode = flow.sharflow12Node67;
                        break;

                    case 13:
                        e.NextNode = flow.sharflow12Node79;
                        break;

                    case 14:
                        e.NextNode = flow.sharflow12Node92;
                        break;

                    case 15:
                        e.NextNode = flow.sharflow12Node106;
                        break;
                }

                e.NextNode.ReviewerURL = "/ERP_AXMI25/ERP_AXMI25View.aspx";

                #endregion
            }
            catch (Exception ext)
            {
                throw new Exception(ext.Message + "<br/>" + ext.StackTrace);
            }
        }

        private void getPrefect(ref ArrayList countlevel, ref ArrayList jobname, string user)
        {
            //1　取得所屬部門及其上級

            StringBuilder sb = new StringBuilder();
            //
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                // string sql = " select '{'+convert(varchar(36),g.id)+'}'+pids  'pids' from  eipa.dbo.dguser u left join eipa.dbo.dggroup g on u.gid = g.id where u.id = '" + user + "' "; //delete by carol 2018/02/22
                string sql = "select case when pids is null then '{'+convert(varchar(36),g.id)+'}'else '{'+convert(varchar(36),g.id)+'}'+pids end 'pids' from  eipa.dbo.dguser u left join eipa.dbo.dggroup g on u.gid = g.id where u.id = '" + user + "' "; //update by carol 2018/02/22

                string depts = rs.ExecuteScalar(sql).ToString();

                //depts={941AB329-DC51-4D42-92C7-9754EED04642}{D49E80D1-C93D-4554-8C10-8E8E6823A835}{8FA12141-0B4C-429D-A5EC-782DB5628F09}{C12ECBD9-B085-45C5-A7EF-38DCF35EE5F3}
                depts = depts.Replace("}{", "','");

                string group = depts.Replace("}", "'").Replace("{", "'"); //所有父層部門

                rs.Close();
                sb = new StringBuilder();

                sb.Append(" SELECT z.id,z.lid,Isnull(ef.level_name, z.lname) 'level_name', z.seq FROM( ");
                sb.Append(" SELECT NAME,id,lid,lname ,seq FROM   ( ");
                sb.Append(" SELECT u.NAME, U.id 'ID', lid, l.lname, -1   SEQ ");
                sb.Append(" FROM   eipa.dbo.dguser U,eipa.dbo.dglevel L ,eipa.dbo.dggroup g ");
                sb.Append(" WHERE  U.levid = L.lnid AND u.gid=g.id  and u.id<> g.uid AND U.id = '{0}' ");
                sb.Append(" UNION SELECT u.NAME,u.id, lid, l.lname, l.lshort ");
                sb.Append(" FROM   eipa.dbo.dggroup g ");
                sb.Append(" LEFT JOIN eipa.dbo.dguser u ON g.uid = u.id ");
                sb.Append(" LEFT JOIN eipa.dbo.dglevel l ON u.levid = l.lnid ");
                sb.Append(" WHERE  g.id IN( {1} ) ");
                sb.Append("    ) x ");
                sb.Append(" )z  LEFT JOIN eipb.dbo.erp_flowset EF  ON z.id = ef.uid AND ef.args = 'I' ");
                sb.Append(" GROUP  BY ef.level_name,z.SEQ,z.lname, z.id, z.lid ");

                sql = string.Format(sb.ToString(), user, group, FIELD_occa00.Text.Trim().Substring(0, 1));
                rs.Open(sql);
                //Response.Write(sql+"<br>");
                while (!rs.EOF)
                {
                    //MyLibrary_AXMT610 Backsend = new MyLibrary_AXMT610();
                    string id = rs["ID"].ToString();
                    string title = rs["LEVEL_NAME"].ToString();

                    if (id.ToUpper() == "AB085F41-F1D0-481E-B725-6A27E468C470") //營運長
                    {
                        break;//跳下一筆
                    }

                    if (id.ToUpper() != "63D0329E-F4C2-44C6-950C-92174D233BED") //總管理處不需加入
                    {
                        countlevel.Add(id);
                        jobname.Add(title);
                    }

                    //若直屬是謝先生，就需要加入
                    if (FIELD_charge.Text.ToUpper() == "63D0329E-F4C2-44C6-950C-92174D233BED")
                    {
                        countlevel.Add(id);
                        jobname.Add(title);

                    }

                    rs.MoveNext();
                }
                rs.Close();
            }
        }

        /* mark by carol 2017/05/08
        private string returnchargeid()
        {
            string id = "";
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            string tempid = rs.ExecuteScalar("SELECT TOP 1 U.id " +
                                                "  FROM EIPA.DBO.dguser U " +
                                                " WHERE U.erpid = '" + this.FIELD_occauser.Text.Substring(0, 6) + "'").ToString();
            id = String.IsNullOrEmpty(this.FIELD_charge.Text) ? tempid : this.FIELD_charge.Text;
            return id;
        }
        */

        //add by carol moidfy check flow    
        private string returnchargeid()
        {
            StringBuilder sb = new StringBuilder();
            string leader = "";
            string applicant = "";
            string user = "";
            using (SqlConnection rs = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString))
            {
                //找出申請人的直屬主管
                sb.Append(" select u.id 'applicant', u.name  ,u2.id 'leader',u2.name  ,g.id  'group',g.name from eipa.dbo.dguser u ");
                sb.Append(" left join eipa.dbo.dggroup g on u.gid = g.id ");
                sb.Append(" left join eipa.dbo.dguser u2 on g.uid = u2.id where u.erpid = '{0}' ");
                string sql = string.Format(sb.ToString(), this.FIELD_occauser.Text.Substring(0, 6));

                rs.Open();
                SqlCommand cmd = new SqlCommand(sql, rs);
                using (SqlDataReader rd = cmd.ExecuteReader())
                {
                    while (rd.Read())
                    {
                        leader = rd["leader"].ToString();
                        applicant = rd["applicant"].ToString();
                    }

                    //指定的主管
                    if (!string.IsNullOrEmpty(this.FIELD_charge.Text))
                    {
                        //等於直屬主管
                        if (this.FIELD_charge.Text == leader)
                        {
                            user = leader;//申請人主管起算
                        }
                        else
                        {

                            user = FIELD_charge.Text;//由指定主管起算
                        }
                    }
                    else
                    {
                        user = applicant;//流程由申請人起算
                    }

                }

                rs.Close();
            }
            return user;
        }

        //private string _returnchargeid()
        //{
        //    string id = "";
        //    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        //    string tempid = rs.ExecuteScalar("SELECT TOP 1 U.id " +
        //                                        "  FROM EIPA.DBO.dguser U " +
        //                                        " WHERE U.erpid = '" + this.FIELD_occauser.Text.Substring(0, 6) + "'").ToString();
        //    id = String.IsNullOrEmpty(this.FIELD_charge.Text) ? tempid : this.FIELD_charge.Text;
        //    return id;
        //}

        protected void changeIsState(string s)
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.ExecuteNonQuery("UPDATE EIPB.DBO.ERP_AXMI25 SET isState = '" + s + "' WHERE ROWNO='" + Request.QueryString["ROWNO"] + "' ");
                rs.Close();
                rs.Dispose();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }




        private bool checkupdata()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT C.* , F.FileName " +
                        "  FROM EIPB.DBO.ERP_AXMI25 C , EIPB.DBO.ERP_AXMI25_File F " +
                        " WHERE C.ROWNO = F.rowno " +
                        "   AND C.ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'");
                string path = @"D:\ERP_CNE";//"D:\\test\\test_rage.txt";
                string filename = rs["FileName"].ToString().Split('.')[0] + ".txt";
                string fullfilename = path + "\\" + filename;
                string zone = rs["PlantID"].ToString()
                        , filed = "", cont = ""
                        , number = rs["occano"].ToString()
                        , apply = rs["occa00"].ToString().Substring(0, 1);
                string content_head = "";// "廠區     欄位名稱 欄位內容  單號  申請性質\r\n";
                contex cob = new contex();

                #region 客戶編號
                if (this.FIELD_occa01.Text.Trim() != rs["occa01"].ToString().Trim())
                {
                    filed = "occa01";
                    cont = this.FIELD_occa01.Text;
                    cob.add(zone, filed, cont, number, apply);
                }
                #endregion
                #region 寬限天數
                if (this.FIELD_occa36.Text.Trim() != rs["occa36"].ToString().Trim())
                {
                    filed = "occa36";
                    cont = this.FIELD_occa36.Text;
                    cob.add(zone, filed, cont, number, apply);
                }
                #endregion
                #region 是否為關係人(y/n)
                if (this.FIELD_occa37.Checked != bool.Parse(rs["occa37"].ToString().Trim() == "N" ? "false" : "true"))
                {
                    filed = "occa37";
                    cont = this.FIELD_occa37.Text;
                    cob.add(zone, filed, cont, number, apply);
                }
                #endregion
                #region 信用評等
                if (this.FIELD_occa61.Text.Trim() != rs["occa61"].ToString().Trim())
                {
                    filed = "occa61";
                    cont = this.FIELD_occa61.Text;
                    cob.add(zone, filed, cont, number, apply);
                }
                #endregion
                #region 信用額度
                if (this.FIELD_occa63.Text.Trim() != rs["occa63"].ToString().Trim())
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

                    filed = "occa63";
                    cont = temp_occa63;
                    cob.add(zone, filed, cont, number, apply);
                }
                #endregion
                #region 關係人回轉否
                if (this.FIELD_ta_occa07.Checked != bool.Parse(rs["ta_occa07"].ToString().Trim() == "N" ? "false" : "true"))
                {
                    filed = "ta_occa07";
                    cont = this.FIELD_ta_occa07.Text;
                    cob.add(zone, filed, cont, number, apply);
                }
                #endregion
                #region 非關係人回轉
                if (this.FIELD_ta_occa06.Text.Trim() != rs["ta_occa06"].ToString().Trim())
                {
                    filed = "ta_occa06";
                    cont = this.FIELD_ta_occa06.Text;
                    cob.add(zone, filed, cont, number, apply);
                }
                #endregion

                //將變更後的值寫入ERP_AXMI25_TEMP TABLE 中
                SmoothEnterprise.Database.DataSet rs_temp = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                string temp_command = "SELECT ROWNO , ID ,zone,field_name,field_value,no,apply_atrribute " +
                                      "  FROM EIPB.DBO.ERP_AXMI25_TEMP  " +
                                      " WHERE 1=0";
                rs_temp.Open(temp_command);

                for (int i = 0; i < cob.count; i++)
                {
                    rs_temp.Add();
                    //Response.Write(Request.QueryString["ROWNO"].ToString()+"<BR/>"+
                    //    Guid.NewGuid().ToString()+"<BR/>"+
                    //    cob.data[i][0].ToString()+"<BR/>"+
                    //    cob.data[i][1].ToString()+"<BR/>"+
                    //    cob.data[i][2].ToString()+"<BR/>"+
                    //    cob.data[i][3].ToString()+"<BR/>"+
                    //    cob.data[i][4].ToString()+"<BR/>"
                    //    );
                    rs_temp["ROWNO"] = Request.QueryString["ROWNO"].ToString();
                    rs_temp["ID"] = Guid.NewGuid().ToString();
                    rs_temp["zone"] = cob.data[i][0].ToString();
                    rs_temp["field_name"] = cob.data[i][1].ToString();
                    rs_temp["field_value"] = cob.data[i][2].ToString();
                    rs_temp["no"] = cob.data[i][3].ToString();
                    rs_temp["apply_atrribute"] = cob.data[i][4].ToString();
                    rs_temp.Update();
                }
                rs_temp.Close();
                //rs_temp.Dispose();
                return true;
            }
            catch (Exception ex)
            {
                //throw new Exception(ex.Message);
                return false;
            }

        }
        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            Label label;
            object obj = this.FlowFeedbackViewer1.HistoryView.FindControl("Show_Comment");
            label = (Label)obj;
            label.Text = e["Flow_Comment"].ToString();
            label.Enabled = true;
            label.ForeColor = System.Drawing.Color.Red;
            label.Font.Bold = true;
            label.Font.Size = 13;


            //電子簽章呈現-----------------------------------------------------------------------------------------
            System.Web.UI.WebControls.Image sin1;
            object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
            sin1 = (System.Web.UI.WebControls.Image)obj5;
            // Response.Write((string)e["Flow_loginID"].ToString() + "---");
            sin1.ImageUrl = "~/image/" + (string)e["Flow_loginID"] + ".JPG";
            if ((string)e["Flow_loginID"].ToString().Length.ToString() == "0")
            {
                sin1.Visible = false;
            }



            System.Web.UI.WebControls.Image sin2;
            object obj6 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image2");
            sin2 = (System.Web.UI.WebControls.Image)obj6;
            if ((string)e["IniReviewer"].ToString().Length.ToString() == "0")
                sin2.Visible = false;
            else
                sin2.Visible = true;
        }

        private bool uploadtoFTP(string fileName, string uploadUrl, string UserName, string Password)
        {
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
                //Response.Write("開始上傳資料流");
                while (true)
                {//開始上傳資料流
                    bytesRead = fileStream.Read(buffer, 0, buffer.Length);
                    if (bytesRead == 0)
                        break;
                    requestStream.Write(buffer, 0, bytesRead);
                }
                //Response.Write("結束上傳資料流");
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

        private bool sendTxt(string s)
        {
            string secmessage = "";
            try
            {
                //\\192.168.0.250\192.168.0.250-d槽\4GL
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs.Open("SELECT C.*  " +
                        //"  FROM EIPB.DBO.ERP_AXMI25 C , EIPB.DBO.ERP_AXMI25_File F " + //carol
                        "  FROM EIPB.DBO.ERP_AXMI25 C " +
                        //" WHERE C.ROWNO = F.rowno " + //carol
                        "   where C.ROWNO = '" + Request.QueryString["ROWNO"].ToString() + "'");
                string path = @"D:\ERP_AXMI250";//"D:\\test\\test_rage.txt";
                string filename = "MINAIK-R_axmi250_" + rs["occano"].ToString() + ".txt";//rs["FileName"].ToString().Split('.')[0] + ".txt";

                string zone = rs["PlantID"].ToString()
                        , filed = "", cont = ""
                        , number = rs["occano"].ToString()
                        , apply = rs["occa00"].ToString().Substring(0, 1);
                string fullfilename = path + "\\" + zone + "-R_axmi250_" + rs["occano"].ToString();
                string content_head = "";// "廠區     欄位名稱 欄位內容  單號  申請性質\r\n";
                contex cob = new contex();
                #region 退回ERP

                // Response.Write(s);

                if (s == "R")
                {
                    filed = "occa1004";
                    cont = s;
                    cob.add(zone, filed, cont, number, apply);
                    secmessage = "退回ERP";
                }
                #endregion
                #region 這裡用不到
                /*
                #region 客戶編號
                if (this.FIELD_occa01.Text.Trim() != rs["occa01"].ToString().Trim())
                {
                    filed = "occa01";
                    cont = this.FIELD_occa01.Text;
                    cob.add(zone, filed, cont, number, apply);
                    secmessage = "客戶編號";
                }
                #endregion
                #region 寬限天數
                if (this.FIELD_occa36.Text.Trim() != rs["occa36"].ToString().Trim())
                {
                    filed = "occa36";
                    cont = this.FIELD_occa36.Text;
                    cob.add(zone, filed, cont, number, apply);
                    secmessage = "寬限天數";
                }
                #endregion
                #region 是否為關係人(y/n)
                if (this.FIELD_occa37.Text.Trim() != rs["occa37"].ToString().Trim())
                {
                    filed = "occa37";
                    cont = this.FIELD_occa37.Text;
                    cob.add(zone, filed, cont, number, apply);
                    secmessage = "是否為關係人";
                }
                #endregion
                #region 信用評等
                if (this.FIELD_occa61.Text.Trim() != rs["occa61"].ToString().Trim())
                {
                    filed = "occa61";
                    cont = this.FIELD_occa61.Text;
                    cob.add(zone, filed, cont, number, apply);
                    secmessage = "信用評等";
                }
                #endregion
                #region 信用額度
                if (this.FIELD_occa63.Text.Trim() != rs["occa63"].ToString().Trim())
                {
                    filed = "occa63";
                    cont = this.FIELD_occa63.Text;
                    cob.add(zone, filed, cont, number, apply);
                    secmessage = "信用額度";
                }
                #endregion
                #region 關係人回轉否
                if (this.FIELD_ta_occa07.Text.Trim() != rs["ta_occa07"].ToString().Trim())
                {
                    filed = "ta_occa07";
                    cont = this.FIELD_ta_occa07.Text;
                    cob.add(zone, filed, cont, number, apply);
                    secmessage = "關係人回轉否";
                }
                #endregion
                #region 非關係人回轉
                if (this.FIELD_ta_occa06.Text.Trim() != rs["ta_occa06"].ToString().Trim())
                {
                    filed = "ta_occa06";
                    cont = this.FIELD_ta_occa06.Text;
                    cob.add(zone, filed, cont, number, apply);
                    secmessage = "非關係人回轉";
                }
                #endregion
                #region 狀態碼 0:開立 (傳過來的時候) 2:完成審核 R:退回(如果退回只要回傳ERP這個值)
                filed = "occa1004";
                cont = "2";
                cob.add(zone, filed, cont, number, apply);
                #endregion

                */
                #endregion

                content_head += cob.display;
                System.IO.StreamWriter file = new StreamWriter(fullfilename, false, System.Text.Encoding.Unicode);
                file.Write(cob.display);
                file.Close();

                uploadtoFTP(fullfilename, @"ftp://192.168.0.250/" + filename, "4gl", "4gl");

                File.Delete(fullfilename);

                return true;
            }
            catch (Exception ex)
            {
                //throw new Exception(ex.Message);
                // Response.Write(ex.Message);
                return false;
            }
        }

        private void sendmail()
        {
            try
            {
                //Response.Write("0");
                if (_request == "Remind")
                {
                    Remind();
                }
                else if (_request == "SendRequest")
                {
                    Approve();
                }
                //#endregion
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        private void Approve()
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
                        rs2.MoveNext();

                    }
                    rs2.Close();
                    #endregion
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

        }

        private void Remind()
        {
            try
            {
                SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                ds.Open("SELECT   revieweruid,name,email  FROM   dgflowqueue a   left join dguser b  " +
                    " on revieweruid=b.id  where requesturl='" + Request.RawUrl.ToString().ToLower().Replace("view", "edit") + "'" +
                    "  and resulttype is null and revieweruid!='00000000-0000-0000-0000-000000000000'");


                //"SELECT top 1 revieweruid,name,email  FROM   dgflowqueue a   left join dguser b " +
                //" on revieweruid=b.id  where requesturl like '%" + Request.QueryString[0] + "%'  order by a.initdate desc");

                while (!ds.EOF)
                {

                    string MId = "{ca9348c8-504a-4454-9acc-18c03cfc8189}";
                    string substring = "";
                    string sub = "";
                    if (this.FIELD_occa00.Text.Contains("U"))
                        substring = "修改";
                    if (this.FIELD_occa00.Text.Contains("V"))
                    {
                        substring = "異動";
                        if (this.FIELD_ta_occa14.Text.Contains("Y"))
                            sub = "原客戶資料失效";
                        else
                            sub = "原客戶資料生效";
                    }
                    if (this.FIELD_occa00.Text.Contains("I"))
                        substring = "新增";
                    string PapCaption = "客戶代號電子E化" + substring + " " + sub;
                    string PID = this.FIELD_occano.Text.Trim();
                    string receivername = ds["name"].ToString();
                    string requesturl = "http://eip.minaik.com.tw/" + Request.RawUrl.ToString().ToLower().Replace("edit", "view");
                    string AppMail = ds["email"].ToString();
                    string body = "";
                    string requestername = this.CurrentUser.Name.ToString();

                    ShrFlowMail ActRem = new ShrFlowMail();
                    ActRem.RemindApprove(MId, PID, receivername, requesturl, AppMail, PapCaption, body, requestername);
                    // ActRem.RemindApprove(MId, PID, receivername, requesturl, "herzog.lin@minaik.com.tw", PapCaption, body, requestername);

                    //   DeputyApprove(ds[0].ToString());

                    ds.MoveNext();


                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        protected void ButStop_Click(object sender, EventArgs e)
        {
            DBTransfer takedata = new DBTransfer();
            string Sql = "update [EIPB].[dbo].[ERP_AXMI25] set   isState='waiting' where  ROWNO='" + Request.QueryString["ROWNO"] + "'";
            takedata.RunIUSql(Sql);
            Sql = "delete  from  dgflowqueue where  requesturl='" + Request.RawUrl.ToString().Trim() + "'";
            //Response.Write(Sql);
            takedata.RunIUSql(Sql);
            //Response.Write(Sql);
            //發信給 該審核點

            this.AddInformation(this, "BUTTON_StopRequest_Click()", "", "已經中止完畢!");
            //BUTTON_save.Enabled = true; //del by carol 201907/22
            //this.BUTTON_delete.Enabled = true; //del by carol 201907/22
            // BUTTON_StopRequest.Enabled = true;

            //PopupUser1.Visible = true;
            //Label9.Visible = true;

            //FileUploadData(Request.QueryString["rowid"].ToString());
        }

        class contex
        {
            private List<string[]> _data = new List<string[]>();
            /// <summary>
            /// display this array data and output in string ;
            /// </summary>
            public string display
            {
                get
                {
                    string _display = "";
                    foreach (string[] s in _data)
                    {
                        foreach (string ss in s)
                        {
                            _display += "" + ss + "|";
                        }
                        _display = _display.Substring(0, _display.Length - 1);
                        _display += "\r\n";
                    }
                    return _display;
                }
            }
            public List<string[]> data
            {
                get
                {
                    return _data;
                }
            }
            public int count
            {
                get
                {
                    return _data.Count;
                }
            }
            /// <summary>
            /// insert a new row
            /// </summary>
            /// <param name="area">廠區</param>
            /// <param name="field">欄位名稱</param>
            /// <param name="fieldcont">欄位內容</param>
            /// <param name="number">單號</param>
            /// <param name="apply">申請性質</param>
            public void add(string area, string field, string fieldcont, string number, string apply)
            {
                try
                {
                    string[] row = new string[] { area, field, fieldcont, number, apply };
                    _data.Add(row);
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message + field);
                }
            }

        }

        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("ERP_AXMI25.aspx");
        }

        protected void BUTTON_delete_Click(object sender, System.EventArgs e)
        {
            try
            {

                updateerp_axmi25();

                sendTxt("R");

                changeIsState("isStop");

                Response.Redirect("ERP_AXMI25Edit.aspx?ROWNO=" + Request.QueryString["ROWNO"]);
            }
            catch (Exception ex)
            {
                this.AddError(this, "BUTTON_delete_Click()", "", ex.Message);
            }
            //Response.Redirect("ERP_AXMI25Delete.aspx?ROWNO=" + Request.QueryString["ROWNO"]);
        }
        private void updateerp_axmi25()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM EIPB.DBO.ERP_AXMI25 WHERE ROWNO = '" + Request.QueryString["ROWNO"] + "'");
                if (!rs.EOF)
                {
                    rs["occa1004"] = "R";
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

        protected void BUTTON_save_Click1(object sender, EventArgs e)
        {
            try
            {
                //Response.Write("click save button");
                save_form();
                UpdateFile();
                Response.Redirect("ERP_AXMI25Edit.aspx?ROWNO=" + Request.QueryString["ROWNO"]);
            }
            catch (Exception ex)
            {
                this.AddError(this, "BUTTON_save_Click()", "", ex.Message);
            }
        }



        private void test(FlowButtonEventArgs e)
        {
            try
            {
                //if (this.FIELD_occa45_NOTE.Visible == false)
                //{
                //    if (this.FIELD_occa45_NOTE.Text.Trim().Length == 0)
                //    {
                //        _message = "請輸入慣用收款條件說明";
                //        Response.Write("<script type=\"text/javascript\">");
                //        Response.Write("alert('" + _message + "')");
                //        //Response.Write("location.href='ERP_AXMI25Edit.aspx?rowno=" + Request.QueryString["rowno"] + "';");
                //        Response.Write("</script>");
                //    }

                //}
                //else
                //{
                //SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e

                if (checkloginuser())
                {
                    save_form();
                    set_T_flow(e);
                    request_click("SendRequest");
                    _NotifyReview = false;
                    changeIsState("isSend");
                }
                else
                {
                    Response.Write("<script type=\"text/javascript\">");
                    Response.Write("alert('登入有誤請重新登入再行送審')");
                    Response.Write("</script>");
                    return;
                }

                //}                
                //Response.Redirect("ERP_AXMI25Edit.aspx?ROWNO="+Request.QueryString["ROWNO"].ToString());
            }
            catch (Exception ex)
            {

                //this.Response.Write(ex.Message);
                this.AddError(this, "SendRequest_Click", "", ex.Message + "<br/>" + ex.StackTrace);
            }
        }

        private void set_T_flow(SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            try
            {
                //this.InputButton2.Enabled = false;
                this.BUTTON_SendRequest.Flow = this.FlowClient1;
                //this.InputButton1.Enabled = true;
                //this.BUTTON_save.Enabled = false; //del by carol 201907/22

                ArrayList countlevel = new ArrayList();
                ArrayList jobname = new ArrayList();
                //string command = "SELECT * FROM EIPA.DBO.DGUSER U ";
                //SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                //rs.Open(command);

                //測試用---------------------------------- -
                string[] tUsers = t_user.Text.Split(',');
                string[] tGags = t_tag.Text.Split(',');

                int x = 0;
                foreach (string u in tUsers)
                {
                    countlevel.Add(u);
                    jobname.Add(tGags[x]);

                    x++;
                }
                #region 設定流程簽核


                //新增

                //USDER->USDER主管(協理以上)(前段要請教振豪了)->財務(珮真)->財務資深經理(ann)->財務協理(秀珍)->財務長(曉毓)->CEO(謝R)->財務(珮真)

                //修改/生效

                //USDER->USDER主管(協理以上)(前段要請教振豪了)->財務(珮真)->財務資深經理(ann)->財務協理(秀珍)->財務長(曉毓)->CEO(謝R)


                //失效

                //USDER->USDER主管(協理以上) 前段要請教振豪了)-->財務(珮真)->財務資深經理(ann)->財務協理(秀珍)->財務長(曉毓)

                string args = "";

                switch (FIELD_occa00.Text.Trim().Substring(0, 1))
                {
                    case "I":
                        args = "I";
                        break;
                    case "U":
                        args = "U";
                        break;
                    case "V":
                        if (this.FIELD_ta_occa14.Text.Trim().Contains("N"))
                            args = "U";
                        else
                            args = "V";
                        break;
                }


                #endregion

                int count = 0;
                foreach (string i in countlevel)
                {
                    this.FlowClient1.AddParameter("USER" + count.ToString(), i);
                    count++;
                }
                count = 0;
                foreach (string i in jobname)
                {
                    this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
                    count++;
                }
                sharflow12.Flowwork.sharflow121 flow = new sharflow12.Flowwork.sharflow121();
                FlowClient1.Text = "客代E化 單號：" + this.FIELD_occano.Text.Trim() + " 客戶：" + this.FIELD_occa02.Text.Trim();  //更改流程名稱

                switch (count)  //依舊arraylist裡面有幾個,來判斷走那條flow
                {

                    case 1:
                        e.NextNode = flow.sharflow12Node1;
                        break;

                    case 2:
                        e.NextNode = flow.sharflow12Node2;
                        break;

                    case 3:
                        e.NextNode = flow.sharflow12Node4;
                        break;

                    case 4:
                        e.NextNode = flow.sharflow12Node7;
                        break;

                    case 5:
                        e.NextNode = flow.sharflow12Node11;
                        break;

                    case 6:
                        e.NextNode = flow.sharflow12Node16;
                        break;

                    case 7:
                        e.NextNode = flow.sharflow12Node22;
                        break;

                    case 8:
                        e.NextNode = flow.sharflow12Node29;
                        break;

                    case 9:
                        e.NextNode = flow.sharflow12Node37;
                        break;

                    case 10:
                        e.NextNode = flow.sharflow12Node46;
                        break;

                    case 11:
                        e.NextNode = flow.sharflow12Node56;
                        break;

                    case 12:
                        e.NextNode = flow.sharflow12Node67;
                        break;

                    case 13:
                        e.NextNode = flow.sharflow12Node79;
                        break;

                    case 14:
                        e.NextNode = flow.sharflow12Node92;
                        break;

                    case 15:
                        e.NextNode = flow.sharflow12Node106;
                        break;
                }

                e.NextNode.ReviewerURL = "/ERP_AXMI25/ERP_AXMI25View.aspx";
            }
            catch (Exception ext)
            {
                throw new Exception(ext.Message + "<br/>" + ext.StackTrace);
            }
        }

        protected void btn_test_Click1(object sender, FlowButtonEventArgs e)
        {
            test(e);
        }

        protected void btn_flow_Click1(object sender, EventArgs e)
        {
            SmoothEnterprise.Flowwork.UI.WebControl.FlowButton x = new FlowButton();

            sflowT();
        }

        private void sflowT()
        {

            try
            {
                //this.InputButton2.Enabled = false;
                this.BUTTON_SendRequest.Flow = this.FlowClient1;
                //this.InputButton1.Enabled = true;
                //this.BUTTON_save.Enabled = false; //del by carol 201907/22

                ArrayList countlevel = new ArrayList();
                ArrayList jobname = new ArrayList();
                //string command = "SELECT * FROM EIPA.DBO.DGUSER U ";
                //SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                //rs.Open(command);

                //測試用-----------------------------------
                //countlevel.Add("A3409158-8CFA-4857-9B54-1962306E0010");
                //jobname.Add("測試用");
                ////-----------------------------------------
                //countlevel.Add("A3409158-8CFA-4857-9B54-1962306E0010");
                //jobname.Add("測試用2");
                SmoothEnterprise.Database.DataSet rsg = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                string command_group = "";
                #region 設定協理以下層級簽核
                //如果未選取主管的話就指定為資料所有者的主管
                string dataowner = returnchargeid();

                getPrefect(ref countlevel, ref jobname, dataowner);

                /********************mark by carol 2017/05/08****************************/
                //string command_group_1 = "SELECT DISTINCT ID , LEVEL_NAME ,MAX(SEQ) SEQ " +
                //                          "      FROM( " +
                //                          "  SELECT U.id ID, L.lname LEVEL_NAME, -1 SEQ " +
                //                          "      FROM EIPA.DBO.dguser U, EIPA.DBO.dglevel L " +
                //                          "      WHERE U.levid = L.lnid " +
                //                          "      AND U.id = '" + dataowner + "' " +
                //                          "      UNION " +
                //                          "  SELECT DISTINCT GL.DEP_OWNER ID, GL.OWNER_LEVEL_NAME LEVEL_NAME, MAX(SEQ) SEQ " +
                //                          "      FROM EIPB.DBO.DG_GROUP_LEVEL GL, EIPA.DBO.dguser U " +
                //                          "      WHERE U.gid = GL.GID " +
                //                          "      AND U.id = '" + dataowner + "' " +
                //                          "      AND GL.DEP_OWNER != '63D0329E-F4C2-44C6-950C-92174D233BED' " +
                //                          "      GROUP BY GL.DEP_OWNER, GL.OWNER_LEVEL_NAME " +
                //                          "      ) AB " +
                //                          "      GROUP BY ID, LEVEL_NAME " +
                //                          "      ORDER BY SEQ";
                //rsg.Open(command_group_1);
                //while (!rsg.EOF)
                //{
                //    //countlevel.Add(this.CurrentUser.ID.Replace("{", "").Replace("}", ""));
                //    countlevel.Add(rsg["id"].ToString());
                //    jobname.Add(rsg["LEVEL_NAME"].ToString());
                //    rsg.MoveNext();
                //}
                //rsg.Close();
                /************************************************/

                #endregion
                //throw new Exception(command_group_1);
                //return;
                #region 設定流程簽核


                //新增

                //USDER->USDER主管(協理以上)(前段要請教振豪了)->財務(珮真)->財務資深經理(ann)->財務協理(秀珍)->財務長(曉毓)->CEO(謝R)->財務(珮真)

                //修改/生效

                //USDER->USDER主管(協理以上)(前段要請教振豪了)->財務(珮真)->財務資深經理(ann)->財務協理(秀珍)->財務長(曉毓)->CEO(謝R)


                //失效

                //USDER->USDER主管(協理以上) 前段要請教振豪了)-->財務(珮真)->財務資深經理(ann)->財務協理(秀珍)->財務長(曉毓)

                string args = "";

                switch (FIELD_occa00.Text.Trim().Substring(0, 1))
                {
                    case "I":
                        args = "I";
                        break;
                    case "U":
                        args = "U";
                        break;
                    case "V":
                        if (this.FIELD_ta_occa14.Text.Trim().Contains("N"))
                            args = "U";
                        else
                            args = "V";
                        break;
                }

                command_group = "SELECT U.id ID, EF.level_name, EF.SEQ SEQ " +
                                "  FROM EIPB.DBO.ERP_FLOWSET EF, EIPA.DBO.dguser U , EIPA.DBO.dglevel L " +
                                " WHERE EF.UID = U.id " +
                                "   AND U.levid = L.lnid " +
                                "   AND EF.PROGAME_NAME = 'ERP_AXMI25' " +
                                "   AND EF.ARGS = '" + FIELD_occa00.Text.Trim().Substring(0, 1) + "' " +
                                " ORDER BY EF.ARGS , EF.SEQ ";
                rsg.Open(command_group);
                while (!rsg.EOF)
                {
                    countlevel.Add(rsg["id"].ToString());
                    jobname.Add(rsg["level_name"].ToString());
                    rsg.MoveNext();
                }
                rsg.Close();
                rsg.Dispose();
                //財務簽核關卡
                //countlevel.Add("13FEB136-9F48-416A-B495-7C2BE8C3B548");
                //jobname.Add("財務");
                #endregion

                int count = 0;
                foreach (string i in countlevel)
                {
                    Response.Write("User:" + countlevel[count] + "<br>");
                    this.FlowClient1.AddParameter("USER" + count.ToString(), i);
                    count++;
                }
                count = 0;
                foreach (string i in jobname)
                {
                    Response.Write("Tital:" + jobname[count] + "<br>");
                    this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
                    count++;
                }

                #region flow set


                #endregion
            }
            catch (Exception ext)
            {
                throw new Exception(ext.Message + "<br/>" + ext.StackTrace);
            }
        }


        private void SetBtn_Enable()
        {
            string sql = "SELECT isState FROM EIPB.DBO.ERP_AXMI25 WHERE ROWNO = '" + Request.QueryString["ROWNO"] + "' ";
            string isState = Utility.getSingle(sql);
             
            Utility.setVisable(true, BUTTON_save, BUTTON_SendRequest, BUTTON_StopRequest, BUTTON_RemindReviewer, BUTTON_delete);

            switch (isState)
            {
                case "isSend"://送審中
                    Utility.setVisable(false, BUTTON_save, BUTTON_SendRequest, BUTTON_delete);
                    break;

                case "waiting": //未送審 
                case "Terminate": //退回
                    Utility.setVisable(false,  BUTTON_StopRequest, BUTTON_RemindReviewer);
                    break;

                case "isStop": //退回ERP 
                case "Complete": //審核完成
                    Utility.setVisable(false, BUTTON_save, BUTTON_SendRequest, BUTTON_StopRequest, BUTTON_RemindReviewer, BUTTON_delete);
                    break;
            }
             
            BUTTON_back.Visible = true;//不論什麼都會有 回上頁

            if (Utility.MIS_Manager(CurrentUser.LogonID))
            {
                Utility.setVisable(true, BUTTON_save, BUTTON_SendRequest, BUTTON_StopRequest, BUTTON_RemindReviewer, BUTTON_delete);
            }
        }



    }

}