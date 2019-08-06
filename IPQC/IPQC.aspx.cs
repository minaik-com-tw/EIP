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

namespace IPQC
{
    public partial class IPQC : SmoothEnterprise.Web.Page
    {
	    protected void Page_Load(object sender, System.EventArgs e)
	    {
		    if(!this.Page.IsPostBack){
                try
                {
                    initdroplist();
                }
                catch(Exception ex)
                {
                    this.AddError(this, "Page_Load", "", ex.Message + ex.StackTrace);
                }

            }
	    }

        private void initdroplist()
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * " +
                        "  FROM EIPE.DBO.IPQC_parameter " +
                        " ORDER BY PARAMETER , SEQ ");
                #region 異常站別
                this.FEILD_STATION.Items.Clear();
                rs.MoveFirst();
                while (!rs.EOF)
                {
                    if (rs["PARAMETER"].ToString().Contains("station"))
                        this.FEILD_STATION.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                    rs.MoveNext();
                }
                #endregion
                #region 產品階段
                this.FIELD_step.Items.Clear();
                rs.MoveFirst();
                while (!rs.EOF)
                {
                    if (rs["PARAMETER"].ToString().Contains("stage"))
                        this.FIELD_step.Items.Add(new ListItem(rs["text"].ToString(), rs["value"].ToString()));
                    rs.MoveNext();
                }
                #endregion
                #region 尺寸
                this.FIELD_SIZE.Items.Clear();
                this.FIELD_SIZE.Items.Add(new ListItem("NA", ""));
                this.FIELD_SIZE.Items.Add(new ListItem("合格", "合格"));
                this.FIELD_SIZE.Items.Add(new ListItem("不合格", "不合格"));
                #endregion
                #region 外觀
                this.FIELD_Appearance.Items.Clear();
                this.FIELD_Appearance.Items.Add(new ListItem("NA", ""));
                this.FIELD_Appearance.Items.Add(new ListItem("合格", "合格"));
                this.FIELD_Appearance.Items.Add(new ListItem("不合格", "不合格"));
                #endregion

                #region 客戶名稱
                rs.Open("SELECT  LID,LCaption  FROM  csc_base_file    where LCaption='NA' and  LActi='Y'");
                if (!rs.EOF)
                {
                    FIELD_customer.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LID"].ToString()));
                }
                rs.Close();

                rs.Open("SELECT * FROM csc_base_file where tid='A' and  LActi='Y' order by LCaption");
                while (!rs.EOF)
                {
                    FIELD_customer.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LID"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
                #endregion
                #region 產品
                this.FIELD_Product.Items.Clear();
                this.FIELD_Product.Items.Add(new ListItem("NA", ""));
                rs.Open("SELECT LID,LCaption FROM csc_base_file where tid='I' and  LActi='Y' ");
                while (!rs.EOF)
                {
                    this.FIELD_Product.Items.Add(new ListItem(rs[1].ToString(), rs[0].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
                #endregion
                #region 專案名稱
                //SELECT * FROM csc_base_file where tid='F' and  LActi='Y'
                string sq3 = "SELECT LCaption , LID FROM csc_base_file where tid='F' and  LActi='Y'";
                rs.Open(sq3);
                this.FIELD_Program.Items.Clear();
                this.FIELD_Program.Items.Add(new ListItem("NA", ""));
                while (!rs.EOF)
                {
                    this.FIELD_Program.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["LID"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
                #endregion

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

        protected void Page_PreRender(object sender, System.EventArgs e)
	    {
    	    if (!this.IsPostBack)
    	    {
                this.KeepURL();
            
        	    this.Query();
    	    }
	    }

	    protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	    {
		    try
		    {   
 	 	 	    if(column.ID=="DataList1_edit")
 	 	 	    {
                    if (rs["inituser"].ToString().ToUpper().Contains(this.CurrentUser.ID.ToUpper().Replace("{", "").Replace("}", "")) || ismanergement(this.CurrentUser.ID))
                    { cell.OutputHTML = "<a href=\"IPQCEdit.aspx?ROWNO=" + rs["ROWNO"].ToString() + "\"><img src=\"/PManagement/images/Edit.gif\" border=\"0\" Alt=修改></a>"; }

                    if (Utility.MIS_Manager(CurrentUser.LogonID))
                    {
                        cell.OutputHTML = "<a href=\"IPQCEdit.aspx?ROWNO=" + rs["ROWNO"].ToString() + "\"><img src=\"/PManagement/images/Edit.gif\" border=\"0\" Alt=修改></a>";
                    }


                }

                if (column.ID=="DataList1_view")
 	 	 	    {
                    cell.LinkURL = "IPQCView.aspx?ROWNO=" + rs["ROWNO"].ToString() ;
 	 	 	    }

                if (column.ID == "DataList1_isState")
                {
                    //Start = 0, Run = 1, End = 2,  Stop = 3, Origin = 4
                    try
                    {
                        int istatus = Convert.ToInt16(rs["isState"]);

                        cell.Value = Utility.chnageStatus(istatus.ToString(), CurrLang);
                    }
                    catch (Exception ex)
                    {
                        cell.Value = rs["isState"].ToString();
                    }
                }

                


            }
            catch (Exception ex)
		    {
			    this.AddError(this,"DataList1_OnRenderCell()","",ex.Message);
		    }		
	    }

        private bool ismanergement(string iD)
        {
            try
            {
                bool result = false;
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet("", SmoothEnterprise.Database.DataSetType.OpenRead);
                string commandstr = "select * "+
                                    "  from eipe.dbo.IPQC_manergement "+
                                    "  where uid = '"+iD+"'";
                rs.Open(commandstr);
                if (!rs.EOF)
                {
                    result = true;
                }
                return result;
            }catch(Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        protected void BUTTON_query_Click(object sender, System.EventArgs e)
	    {
            try
            {
                this.Query();
            }
            catch(Exception ex)
            {
                this.AddError(this, "BUTTON_query_Click" , "",ex.Message+ex.StackTrace);
            }

	    }

	    private void Query()
	    {
            try
            {
                string whereis = "";
                if (!string.IsNullOrEmpty(this.FIELD_sDate.Text.Trim()) || !string.IsNullOrEmpty(this.FIELD_eDate.Text.Trim()))
                {
                    string sDate = string.IsNullOrEmpty(this.FIELD_sDate.Text.Trim()) ? "1900-01-01" : this.FIELD_sDate.Text.Trim();
                    string eDate = string.IsNullOrEmpty(this.FIELD_eDate.Text.Trim()) ? "2999-12-28" : this.FIELD_eDate.Text.Trim();
                    whereis += "AND i.initdate BETWEEN '" + sDate + "' AND '" + eDate + "'";
                }
                if (FIELD_Program.SelectedItem.Text != "NA")
                    whereis += "AND Program_Name = '" + this.FIELD_Program.SelectedValue + "'";
                if (!string.IsNullOrEmpty(this.FEILD_STATION.Text.Trim()))
                    whereis += "AND station like '%" + this.FEILD_STATION.SelectedValue.Trim() + "%'";
                if (FIELD_Product.SelectedItem.Text != "NA")
                    whereis += "AND Product_Name = '" + this.FIELD_Product.SelectedValue + "'";
                if (!string.IsNullOrEmpty(this.FIELD_SIZE.SelectedValue))
                    whereis += "AND Dimension_check like '%" + this.FIELD_SIZE.SelectedValue + "%'";
                if (!string.IsNullOrEmpty(this.FIELD_Appearance.SelectedValue))
                    whereis += "AND Appearance_check like '%" + this.FIELD_Appearance.SelectedValue + "%'";
                if (FIELD_customer.SelectedItem.Text != "NA")
                    whereis += "AND customer = '" + this.FIELD_customer.SelectedValue + "'";
                if (!string.IsNullOrEmpty(this.FIELD_step.Text.Trim()))
                    whereis += "AND Stage like '%" + this.FIELD_step.SelectedValue.Trim() + "%'";
                if (!string.IsNullOrEmpty(this.FIELD_no.Text.Trim()))
                    whereis += "AND IPQC_NO LIKE '%" + this.FIELD_no.Text.Trim() + "%'";
                if (whereis != "")
                    whereis = " WHERE " + whereis.Substring(4, whereis.Length-4);
                if (!this.IsPostBack)
                    whereis = "";
                DataList1.SQL = "SELECT i.*, U.NAME  , CSC.LCaption CUS_CN , CSC_PRO.LCaption PRO, CSC_PRA.LCaption PRA , CSC_PN.LCaption " +
                                "  FROM EIPE.DBO.IPQC i left outer join EIPA.DBO.DGUSER U "+
                                "    ON i.INITUSER = U.ID LEFT OUTER JOIN EIPA.DBO.csc_base_file CSC " +
                                "    ON i.customer = CSC.LID LEFT OUTER JOIN EIPA.DBO.csc_base_file CSC_PRO " +
                                "    ON i.Product_Name = CSC_PRO.LID LEFT OUTER JOIN EIPA.DBO.csc_base_file CSC_PRA " +
                                "    ON i.Program_Name = CSC_PRA.LID LEFT OUTER JOIN EIPA.DBO.csc_base_file CSC_PN " +
                                "    ON i.PN = CSC_PN.LID " + whereis + " ORDER BY   initdate DESC ";
                
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

	    }

	    protected void BUTTON_add_Click(object sender, System.EventArgs e)
	    {
		    Response.Redirect("IPQCAdd.aspx");
	    }

	    protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	    {
		    string deletekeys = "";
		    string chkid = this.DataList1.ID+"_chk_";
		    string keyid = this.DataList1.ID+"_key_";
		    for (int i=0; i<Page.Request.Form.Count; i++)
			    if (Page.Request.Form.AllKeys.GetValue(i).ToString().StartsWith(chkid))
			    {
				    if (deletekeys!="")
					    deletekeys += "&"+Page.Request.Form[keyid+Page.Request.Form.AllKeys.GetValue(i).ToString().Substring(chkid.Length)].ToString();
				    else
					    deletekeys += Page.Request.Form[keyid+Page.Request.Form.AllKeys.GetValue(i).ToString().Substring(chkid.Length)].ToString();
			    }
		    Response.Redirect("IPQCDelete.aspx?"+deletekeys+"&multiple=1");
	    }

        protected void FIELD_customer_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string sq2 = "select cwid,LCaption,tid  from  csc_bom left join  csc_base_file on cwid=lid " +
                    "  where pwid='" + this.FIELD_customer.SelectedValue + "'  and  bomact='Y' and   LActi='Y' and  TID='F' ";
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                string LID = "";
                string LCaption = "";

                rs.Open("SELECT  LID,LCaption  FROM  csc_base_file    where LCaption='NA' and  LActi='Y'");
                if (!rs.EOF)
                {
                    LID = rs[0].ToString();
                    LCaption = rs[1].ToString();
                }
                rs.Close();

                FIELD_Program.Items.Clear();
                sq2 = "select cwid,LCaption,tid  from  csc_bom left join  csc_base_file on cwid=lid " +
                  "  where pwid='" + FIELD_customer.SelectedValue + "'  and  bomact='Y' and   LActi='Y' and  TID='I' ";
                FIELD_Program.Items.Add(new ListItem(LCaption, LID));
                rs.Open(sq2);
                while (!rs.EOF)
                {
                    // profid = rs[1].ToString();
                    FIELD_Program.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["cwid"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();

            }
            catch (Exception ex)
            {
                this.AddError(null, "FIELD_customer_SelectedIndexChanged", "", ex.Message + ex.StackTrace);
            }
        }



        protected void FIELD_Program_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //FIELD_Program.Items.Clear();
                string sq2 = "select cwid,LCaption,tid  from  csc_bom left join  csc_base_file on cwid=lid " +
                   "  where pwid='" + FIELD_Program.SelectedValue + "'  and  bomact='Y' and   LActi='Y' and  TID='F' ";


                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                string LID = "";
                string LCaption = "";

                rs.Open("SELECT  LID,LCaption  FROM  csc_base_file    where LCaption='NA' and  LActi='Y'");
                if (!rs.EOF)
                {
                    LID = rs[0].ToString();
                    LCaption = rs[1].ToString();
                }
                rs.Close();

                FIELD_Product.Items.Add(new ListItem(LCaption, LID));
                rs.Open(sq2);
                while (!rs.EOF)
                {
                    FIELD_Product.Items.Add(new ListItem(rs["LCaption"].ToString(), rs["cwid"].ToString()));
                    rs.MoveNext();
                }
                rs.Close();
            }
            catch (Exception ex)
            {
                this.AddError(null, "", "", ex.Message + ex.StackTrace);
            }
        }

        protected void BUTTON_link_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("../CSM/base/WeBase.aspx");
            }
            catch(Exception ex)
            {
                this.AddError(null, "BUTTON_link_Click","",ex.Message+ex.StackTrace);
            }
        }

        public string getStr(string key)
        {
            return this.GetLocalResourceObject(key).ToString();
        }

        public language CurrLang
        {
            get
            {
                language curr = (language)1;
                string langVal = "";


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
    }
}
