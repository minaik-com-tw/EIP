

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

namespace Shipment
{
public partial class ShipmentReport : SmoothEnterprise.Web.Page
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    private string db3 = ""; //db副2位置

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

        if (!this.IsPostBack)
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rs.Open("SELECT   bass_no,name FROM " + db1 + "cimi100_base where class_no='plantid' and bass_no <>'ALL' order by order_no"); //預設下拉廠區
            while (!rs.EOF)
            {
                this.QUERY_plantid.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
                rs.MoveNext();
            }
            rs.Close();
        }

	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
            
 	 	 	if(!this.QUERY_IMA01.Personalize && this["QUERY_No"]!=null) this.QUERY_IMA01.Text = this["QUERY_No"];
 	 	 	if(!this.QUERY_IMA02.Personalize && this["QUERY_Customer"]!=null) this.QUERY_IMA02.Text = this["QUERY_Customer"];
 	 	 	if(!this.QUERY_IMA021.Personalize && this["QUERY_Add_user"]!=null) this.QUERY_IMA021.Text = this["QUERY_Add_user"];
        	this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{
          

		}
		catch (Exception ex)
		{
			this.AddError(this,"DataList1_OnRenderCell()","",ex.Message);
		}		
	}

	protected void BUTTON_query_Click(object sender, System.EventArgs e)
	{
		this.Query();
	}

	private void Query()
	{
        
 	 	if(!this.QUERY_IMA01.Personalize) this["QUERY_No"] = this.QUERY_IMA01.Text ;

 	 	if(!this.QUERY_IMA02.Personalize) this["QUERY_Customer"] = this.QUERY_IMA02.Text ;
 	 	if(!this.QUERY_IMA021.Personalize) this["QUERY_Add_user"] = this.QUERY_IMA021.Text ;
		string whereis = "";
		
 	 	if (this.QUERY_IMA01.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
 	 	 	whereis = whereis + " IMA01 LIKE N'%" + this.QUERY_IMA01.Text + "%'";
 	 	}

 	 	if (this.QUERY_IMA02.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
            whereis = whereis + " IMA02 LIKE N'%" + this.QUERY_IMA02.Text + "%'";
 	 	}
 	 	if (this.QUERY_IMA021.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
            whereis = whereis + " IMA021 LIKE N'%" + this.QUERY_IMA021.Text + "%'";
 	 	}

        if (this.QUERY_IMA09.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " IMA09 LIKE N'%" + this.QUERY_IMA09.Text + "%'";
        }

        if (this.QUERY_IMA10.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " IMA10 LIKE N'%" + this.QUERY_IMA10.Text + "%'";

        } if (this.QUERY_IMA133.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " IMA133 LIKE N'%" + this.QUERY_IMA133.Text + "%'";
        }



        if (this.QUERY_plantid.Text != "Filter")
        {
            string plantid = this.QUERY_plantid.Text;
            if (plantid.Trim() == "MINAIK") plantid = "MAT";
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " plantid = N'" + plantid.Trim() + "'";
        }

        if (this.QUERY_no.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " no LIKE N'%" + this.QUERY_no.Text + "%'";
        }

        if (this.QUERY_add_user.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " cname LIKE N'%" + this.QUERY_add_user.Text + "%'";
        }

        if (this.QUERY_DCC.Text != "")
        {
            if (whereis != "")
                whereis = whereis + " AND";
            whereis = whereis + " dname LIKE N'%" + this.QUERY_DCC.Text + "%'";
        }



        if (whereis != "")
            whereis = " WHERE" + whereis;

        DataList1.SQL = ("select ima01,ima02,ima021,ima133,ima09,ima10,no,b.partno,plantid,cname,dname " +
                         ",case when LEN(e.tc_imi02)>1  then e.tc_imi02 else b.tc_imi02 end  tc_imi02 "+
                         ",case when LEN(e.tc_imi021)>1  then e.tc_imi021 else b.tc_imi021 end  tc_imi021 "+
                         ",case when LEN(e.tc_imi031)>1  then e.tc_imi031 else b.tc_imi031 end  tc_imi031 " +
                         "   from " + db3 + "MINAIK.dbo.IMA_FILE a " +
                         "   left join  " +
                         "   (select a.no no,partno,plantid,c.name cname,d.name dname,tc_imi02,tc_imi021,tc_imi031 from " + db1 + "cimi100_main a  " +
                         "   left join " + db1 + "cimi100_new b on a.no=b.no  " +
                         "   left join " + db2 + "dguser c on add_user=c.id " +
                         "   left join " + db2 + "dguser d on dcc=d.id " +
                         "   where status='OK' and class_no='1') b  " +
                         "   on ima01=partno COLLATE Chinese_Taiwan_Stroke_CS_AS "+
                         "  left join ( select c.partno,tc_imi02,tc_imi021,tc_imi03,tc_imi031  from   [EIPB].[dbo].[cimi100_turn] c "+
                         "   inner join ( "+
                         "  SELECT  b.partno,MAX(a.no) ano "+
                         "    FROM [EIPB].[dbo].[cimi100_main] a inner join  [EIPB].[dbo].[cimi100_turn] b on a.no=b.no "+
                         "     group by b.partno ) d on c.partno=d.partno and  c.no=d.ano "+
                         "  ) e on  IMA01=e.partno  COLLATE Chinese_Taiwan_Stroke_CS_AS  ") + whereis;

        if (this.CurrentUser.LogonID.ToString() == "herzog.lin") Response.Write(DataList1.SQL);
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
		Response.Redirect("ShipmentDelete.aspx?"+deletekeys+"&multiple=1");
	}
}
}
