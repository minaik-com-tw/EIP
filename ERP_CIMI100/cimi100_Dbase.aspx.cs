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

namespace ERP_CIMI100
{
public partial class cimi100_base : SmoothEnterprise.Web.Page
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
            db3 = "[barcode].[dbo].";

        }
        if (!this.IsPostBack)
        {
            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

            //預設下拉class
            this.FIELD_class_no.Items.Add(new ListItem("不限分類", ""));
            rs.Open("SELECT   distinct class_no,name FROM " + db1 + "cimi100_class");
            while (!rs.EOF)
            {
                this.FIELD_class_no.Items.Add(new ListItem(rs["name"].ToString(), rs["class_no"].ToString()));
                rs.MoveNext();
            }
            rs.Close();

            //預設下拉廠區
            this.FIELD_plantid.Items.Add(new ListItem("不限廠區", ""));
            rs.Open("SELECT   bass_no,name FROM " + db1 + "cimi100_Dbase where class_no='plantid' order by order_no");
            while (!rs.EOF)
            {
                this.FIELD_plantid.Items.Add(new ListItem(rs["name"].ToString(), rs["bass_no"].ToString()));
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

             this.FIELD_class_no.Text = this["FIELD_class_no"];
 	 	 	 this.FIELD_bass_no.Text = this["QUERY_bass_no"];
             this.FIELD_plantid.Text = this["FIELD_plantid"];
        	 this.Query();
    	}
	}

	protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
	{
		try
		{   
            
            
 	 	 	if(column.ID=="DataList1_edit")
 	 	 	{
 	 	 	 	cell.LinkURL = "cimi100_DbaseEdit.aspx?id="+rs["id"].ToString();
 	 	 	}
            
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

        this["FIELD_class_no"] = this.FIELD_class_no.Text;
 	 	this["QUERY_bass_no"] = this.FIELD_bass_no.Text ;
        this["FIELD_plantid"] = this.FIELD_plantid.Text;
		string whereis = "";

        //if (this.FIELD_class_no.Text != "")
        //{
        //    if (whereis!="")
        //        whereis = whereis + " AND";
        //    whereis = whereis + " a.class_no LIKE N'%" + this.FIELD_class_no.Text + "%'";
        //}
        //if (this.FIELD_bass_no.Text!="")
        //{
        //    if (whereis!="")
        //        whereis = whereis + " AND";
        //    whereis = whereis + " a.name LIKE N'%" + this.FIELD_bass_no.Text + "%'";
        //}

 	 	if (this.FIELD_plantid.Text!="")
 	 	{
 	 	 	if (whereis!="")
 	 	 	 	whereis = whereis + " AND";
            whereis = whereis + " a.plantid LIKE N'%" + this.FIELD_plantid.Text + "%'";
 	 	}
		if (whereis!="")
			whereis = " WHERE" + whereis;
        DataList1.SQL = "SELECT a.*,b.name bname,c.name cname,d.name dname FROM " + db1 + "cimi100_Dbase a left join " + db1 + "cimi100_class b on a.class_no=b.class_no " +
                        "left join " + db2 + "dguser c on a.edit_user=c.id  " +
                        "left join " + db2 + "dguser d on a.need_user=d.id  " + whereis;

        //Response.Write(DataList1.SQL);
	}

	protected void BUTTON_add_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("cimi100_DbaseAdd.aspx");
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
		Response.Redirect("cimi100_baseDelete.aspx?"+deletekeys+"&multiple=1");
	}
}
}
