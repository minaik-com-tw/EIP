using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;


public partial class cimi100_autounion : SmoothEnterprise.Web.Page 
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    private string db3 = ""; //db副2位置
    protected void Page_Load(object sender, EventArgs e)
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
    }
    protected void Button_Add_Click(object sender, EventArgs e)
    {

        //上傳檔案
        String fileName = FileUpload1.FileName;
        String savePath = Server.MapPath("~/ERP_CIMI100/excel/");
        String saveResult = savePath + fileName;
        FileUpload1.SaveAs(saveResult);




        //   如果Excel中的第一列為欄名,則寫成
        string serverPath = savePath + FileUpload1.FileName;
        string connectString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + serverPath +
                               ";Extended Properties='Excel 8.0;HDR=YES;IMEX=1;'";
        using (OleDbConnection connection = new OleDbConnection(connectString))
        {
            string commText = "SELECT * FROM [Sheet1$]";
            OleDbCommand command = new OleDbCommand(commText, connection);
            command.Connection.Open();
            DataTable dt = new DataTable();
            OleDbDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                SmoothEnterprise.Database.DataSet dfilers = new SmoothEnterprise.Database.DataSet();
                dfilers.ExecuteNonQuery("insert into " + db1 + "cimi100_autounion (auto_l,auto_industry,machine_number,auto_m,auto_s) VALUES ( '" + reader[0] + "','" + reader[1] + "','" + reader[2] + "','" + reader[3] + "','" + reader[4] + "')");
                SqlDataSource1.SelectCommand = "SELECT * FROM " + db1 + "cimi100_autounion  order by auto_l,auto_industry,machine_number,auto_m,auto_s";
                this.GridView1.DataBind();
            }
            reader.Close();
        } 
    }
}