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
using System.Data.SqlClient;
using System.Text;




public partial class Portal_ViewNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         #region 跑馬燈

        SqlConnection messageConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        //"uid=smooth;pwd=mat2009;Data Source=EC;Initial Catalog=EIP;Integrated Security=True; Integrated Security=SSPI;");

        SqlCommand messageComm = new SqlCommand("select        id,subject  from  bul_main     order   by   id   desc", messageConn);

        string message = "";
        messageConn.Open();
        DataSet ds = new DataSet();
        SqlDataReader messageReader = messageComm.ExecuteReader(CommandBehavior.CloseConnection);
        message += "<table cellspacing='0' cellpadding='0' width='180' high='100' border='0'　>";
        while (messageReader.Read())
        {
            message += string.Format("<font size='2'><Image  src='img/123.gif' Width='12px' /> <a href=\"http://eip.minaik.com.tw/Bulletin/bulletinView.aspx?id{0}\" >{1}...</></a>", messageReader[0], CutString(messageReader[1].ToString(), 15));
            message += "<BR>";
         
            
        }
        messageReader.Dispose();
        messageConn.Dispose();
        message += "<a href=\"ViewTest.aspx?id={0}\"><font size='2'>>> more";
        message += "</table>";
        Response.Write(message);
        //Response.Write("<P ALIGN='RIGHT'><a href=\"ViewTest.aspx?id={0}\"><font size='1'>more");
        ////Literal1.Text = message;
        #endregion

        Response.Write(CutString("2010/02/11~02/20結帳通知-2010/02/23 下午16:00截止", 20) + "<br>");
        Response.Write(CutString("ASSEMBLY RAMP PLASTIC SEQUOIA 量產文件改版", 20));

    }


    public static string CutString(string inputString, int len)
    {


        ASCIIEncoding ascii = new ASCIIEncoding();
        int tempLen = 0;
        string tempString = "";
        byte[] s = ascii.GetBytes(inputString);
        for (int i = 0; i < s.Length; i++)
        {
            if ((int)s[i] == 63)
            {
                tempLen += 2;
            }
            else
            {
                tempLen += 1;
            }

            try
            {
                tempString += inputString.Substring(i, 1);
            }
            catch
            {
                break;
            }

            if (tempLen > len)
                break;
        }
        //如果截过则加上半个省略号
        byte[] mybyte = System.Text.Encoding.Default.GetBytes(inputString);
        if (mybyte.Length > len)
            tempString += "";


        return tempString;
    }

}
