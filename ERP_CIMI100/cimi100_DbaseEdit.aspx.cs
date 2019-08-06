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
public partial class cimi100_baseEdit : SmoothEnterprise.Web.Page
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
		try
		{
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
            
				SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                rs2.Open("SELECT * FROM " + db1 + "cimi100_Dbase WHERE id='" + Request.QueryString["id"] + "' ");
				if (!rs2.EOF)
				{

                    this.FIELD_class_no.Text = rs2["class_no"].ToString();
 	 	 	 	 	this.FIELD_bass_no.Text = rs2["bass_no"].ToString();
                    this.FIELD_name.Text = rs2["name"].ToString();
 	 	 	 	 	this.FIELD_contrast_class.Text = rs2["contrast_class"].ToString();
                    this.FIELD_need_user.Text = rs2["need_user"].ToString();
 	 	 	 	 	this.FIELD_status.Text = rs2["status"].ToString();
 	 	 	 	 	this.FIELD_plantid.Text = rs2["plantid"].ToString();
				}												  
				else
				{
					Response.Redirect("cimi100_Dbase.aspx");
				}
			}
		}
		catch
		{
			Response.Redirect("cimi100_Dbase.aspx");
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
                rs.Open("SELECT * FROM " + db1 + "cimi100_Dbase WHERE id='" + Request.QueryString["id"] + "' ");
				if (!rs.EOF)
				{

                    //if (this.FIELD_class_no.Text != "") rs["class_no"] = this.FIELD_class_no.Text;
                    //if (this.FIELD_bass_no.Text != "") rs["bass_no"] = this.FIELD_bass_no.Text;
                    if (this.FIELD_name.Text != "") rs["name"] = this.FIELD_name.Text;
                    if (this.FIELD_contrast_class.Text != "") rs["contrast_class"] = this.FIELD_contrast_class.Text;
                    rs["edit_date"] = DateTime.Now.ToString();
                    rs["edit_user"] = this.CurrentUser.ID.ToString();
                    if (this.FIELD_need_user.Text != "") rs["need_user"] = new Guid(this.FIELD_need_user.Text);
                    if (this.FIELD_order_no.Text != "") rs["order_no"] = this.FIELD_order_no.Text;
                    rs["status"] = this.FIELD_status.Text;
                    if (this.FIELD_plantid.Text != "") rs["plantid"] = this.FIELD_plantid.Text;
					rs.Update();
				}
				rs.Close();
				Response.Redirect("cimi100_Dbase.aspx");
			}
			catch (Exception ex)
			{
				this.AddError(this,"BUTTON_save_Click()","",ex.Message);
			}
		}
	}

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        this.GoBack("cimi100_Dbase.aspx",new string[]{"cimi100_baseDelete.aspx"});
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("cimi100_baseDelete.aspx?id="+Request.QueryString["id"]);
	}
}
}