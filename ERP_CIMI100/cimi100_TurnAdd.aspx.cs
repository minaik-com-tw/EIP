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
public partial class cimi100_TurnAdd : SmoothEnterprise.Web.Page
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    private string db3 = ""; //db副2位置
    private string class_no = ""; //2拋轉3變更
    public long elapsedTicks;  //尚未轉成正式區的單身唯一值
	protected void Page_Load(object sender, System.EventArgs e)
	{
        class_no = Request.QueryString["class_no"];

        if (Environment.MachineName.ToString().Trim() != "ANN-LIN") //如果不是在Ann本機, 則指定資料庫 
        {
            db1 = "[EIPB].[dbo].";
            db2 = "[EIPA].[dbo].";
            db3 = "[192.168.0.185].[dbo].";

        }
        if (!this.IsPostBack)
        {
            elapsedTicks = DateTime.Now.Ticks; //單身為一值
            this.PK1.Value = elapsedTicks.ToString();
            this.FIELD_need_date.Text = DateTime.Now.AddDays(1).ToString();

            
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

            rs.Open("SELECT  comid,name FROM " + db2 + "dguser where id='"+this.CurrentUser.ID.ToString()+"'");  //預設下拉class
            if (!rs.EOF)
            {
                this.FIELD_plantid.Text = rs["comid"].ToString();
                this.FIELD_add_user.Text = rs["name"].ToString();
               
            }
            rs.Close();

            rs.Open("SELECT   bass_no,name FROM " + db1 + "cimi100_base where class_no='plantid' and bass_no <> 'ALL' order by order_no");
            while (!rs.EOF)
            {
                CheckBoxList2.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                rs.MoveNext();
            }
            rs.Close();

            //代入文管,如第一次代預設,之後代入上次登打的人
            //rs.Open("SELECT MAX(ADD_DATE) MAXDATE,DCC FROM " + db1 + "CIMI100_MAIN WHERE ADD_USER='" + this.CurrentUser.ID.ToString() + "' and dcc is not null GROUP BY DCC");
            //if (!rs.EOF)
            //{
            //    this.FIELD_DCC.Text = rs["DCC"].ToString();
            //}
            //else
            //{
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs2.Open("SELECT  pid FROM " + db2 + "erp_flow where erp_name='cimi100' and dep_name='DCC' AND NO='" + this.FIELD_plantid.Text + "'");  //預設下拉class
                if (!rs2.EOF)
                {
                    this.FIELD_DCC.Text = rs2["PID"].ToString();
                }
                rs2.Close();

            //}
            //rs.Close();
            gridviewchange(this.PK1.Value.ToString());

           
        }

        # region 判斷語言
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

        if (this.FIELD_plantid.Text.Trim() != "MAM" )
        {
            div1.Style.Add("display", "none");
            

        }


        #endregion
	}

	protected void BUTTON_save_Click(object sender, System.EventArgs e)
	{
		if (this.IsValid)
		{
			try
			{
                EIPSysSha UseSha = new EIPSysSha();
                string NO = "";
                if (class_no.ToString() == "2")
                {
                    NO = UseSha.GetNewSn("Q302", DateTime.Now.ToString("yyMM")); //Q302 拋轉單 Q303 變更單
                }
                else
                {
                    NO = UseSha.GetNewSn("Q303", DateTime.Now.ToString("yyMM"));

                }
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs.Open("SELECT * FROM " + db1 + "cimi100_main WHERE 1=0");
				rs.Add();

                rs["no"] = NO.ToString();
 	 	 	 	rs["class_no"] = class_no.ToString() ;
                rs["plantid"] = this.FIELD_plantid.Text;
                rs["add_date"] = DateTime.Now.ToString();
                rs["add_user"] = this.CurrentUser.ID.ToString();
                rs["DCC"] = this.FIELD_DCC.Text;
 	 	 	 	
 	 	 	 	
				rs.Update();
				rs.Close();




                SmoothEnterprise.Database.DataSet urs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                urs.Open("SELECT * FROM " + db1 + "cimi100_turn WHERE elapsedTicks='" + this.PK1.Value.ToString() + "' ");
                while (!urs.EOF)
                {

                    urs["no"] = NO.ToString();
                    urs.Update();
                    urs.MoveNext();
                }
                urs.Close();

                SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                object objola = onum.ExecuteScalar("SELECT * from " + db1 + "cimi100_main where no='" + NO.ToString() + "' ");
                string aid = objola.ToString();  //取得head的aid
                Response.Redirect("CIMI100_TurnEdit.aspx?id=" + aid.ToString()+"&class_no="+class_no.ToString());

			}
			catch (Exception ex)
			{
				this.AddError(this,"BUTTON_save_Click()","",ex.Message);
			}
		}
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        this.GoBack();
	}
    protected void Button_AddItem_Click(object sender, EventArgs e)
    {
       // Response.Write("12312#");
        //ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('"+Request.Form["FIELD_DWG"]+"');", true);

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
        rrs.Open("select * from " + db1 + "cimi100_turn where elapsedticks= '" + this.PK1.Value.ToString() + "' and partno='" + Request.Form["FIELD_Partno"].ToString()+ "' ");
        if (!rrs.EOF)
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('料號重覆登打!');", true);
        }
        else if (strPlantidLimmit.Length<2 && class_no=="2")
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "aa1", " alert('請輸入廠區!');", true);

        }
        else
        {
            SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
            object objola = onum.ExecuteScalar("select  ISNULL(MAX(item),'0')+1 item  from " + db1 + "cimi100_turn where elapsedticks='" + this.PK1.Value.ToString() + "' ");
            string maxitem = objola.ToString();

            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
            rs.Open("SELECT * FROM " + db1 + "cimi100_turn WHERE 1=0");
            rs.Add();

            rs["elapsedTicks"] = this.PK1.Value.ToString();
            rs["item"] = maxitem;
            rs["partno"] = Request.Form["FIELD_Partno"];
            rs["component"] = Request.Form["FIELD_Component"];
            rs["dwg"] = Request.Form["FIELD_DWG"];
            rs["turn_plantid"] = strPlantidLimmit.ToString();


            //江的需求 -------------------------

            rs["tc_imi02"] = Request.Form["Textc_imi02"];
            rs["tc_imi021"] = Request.Form["Textc_imi021"];
            rs["tc_imi03"] = Request.Form["Textc_imi03"];

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

        gridviewchange(this.PK1.Value);

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
        rrs.Open("select * from " + db1 + "cimi100_turn where elapsedticks= '" + this.PK1.Value.ToString() + "' and partno='" + Request.Form["FIELD_Partno"].ToString() + "' and item <> '"+this.rember_item.Value.ToString()+"' ");

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
            urs.Open("SELECT * FROM " + db1 + "cimi100_turn WHERE elapsedTicks='" + this.PK1.Value.ToString() + "' and item='" + this.rember_item.Value.ToString() + "' ");
            if (!urs.EOF)
            {

                urs["partno"] = Request.Form["FIELD_Partno"];
                urs["component"] = Request.Form["FIELD_Component"];
                urs["dwg"] = Request.Form["FIELD_DWG"];
                urs["turn_plantid"] = strPlantidLimmit.ToString();

                //江的需求 -------------------------

                urs["tc_imi02"] = Request.Form["Textc_imi02"];
                urs["tc_imi021"] = Request.Form["Textc_imi021"];

                DBTransfer hs = new DBTransfer();
                string markid=hs.GetTopfile("select   MSE01  from     IP185.MINAIK.dbo.MSE_FILE where mse02='" + Request.Form["Textc_imi031"] + "'");
                urs["tc_imi03"] = markid;//Request.Form["Textc_imi03"];

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
        gridviewchange(this.PK1.Value);

        
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            e.Row.Cells[1].Attributes.Add("onclick", "onGridViewRowSelected('" + e.Row.DataItemIndex + "','" + Request.QueryString["class_no"] + "')");

        }
        if (class_no.ToString() == "3")  //若為3變更,廠區隱形
        {
            e.Row.Cells[7].Visible = false;
             
        }

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        gridviewchange(this.PK1.Value.ToString());

    }

    void gridviewchange(string aa)  //change girdview
    {


        SqlDataSource1.SelectCommand = "select  no, item, elapsedTicks, partno, component, dwg, " +
                                       " CASE  WHEN turn_plantid ='' THEN turn_plantid   " +
                                       " ELSE  SUBSTRING(REPLACE(turn_plantid,'@', ','), 0, LEN(turn_plantid)) END  turn_plantid  " +
                                       " from " + db1 + "cimi100_turn where elapsedTicks='" + aa.ToString() + "'  ";



        this.GridView1.DataBind();

    }
}
}