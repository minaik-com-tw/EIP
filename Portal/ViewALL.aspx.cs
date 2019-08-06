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

public partial class Portal_View13110 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string message = "";
        message += "<Image  src='img/title1_6.jpg'  /><br>";
         #region 跑馬燈
        String str = "B0001,B0025,B0002,B0003,B0006,B0012,B0037,B0038,B0016";
        String[] s = str.Split(',');
        foreach (string bb in s)
        {

            SqlConnection messageConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
            //"uid=smooth;pwd=mat2009;Data Source=EC;Initial Catalog=EIP;Integrated Security=True; Integrated Security=SSPI;");

            SqlCommand messageComm = new SqlCommand("select     top   5   id,subject   from  bul_main   where show is null and  id   in   (select          id     from  dbo.bul_main where lclass='A0001' AND MCLASS='"+bb.ToString()+"')   order   by   id   desc", messageConn);
            switch (bb.ToString().Trim())
            {
                case "B0001":
                    message += "<Image  src='img/title2_3.jpg'  /><br><br>";
                     break;

                case "B0025":
                    message += "<Image  src='img/title2_4.jpg'  /><br><br>";
                     break;

                case "B0002":
                    message += "<Image  src='img/title2_5.jpg'  /><br><br>";
                     break;

                case "B0003":
                    message += "<Image  src='img/title2_6.jpg'  /><br><br>";
                     break;

                case "B0006":
                    message += "<Image  src='img/title2_7.jpg'  /><br><br>";
                     break;

                case "B0012":
                    message += "<Image  src='img/title2_8.jpg'  /><br><br>";
                     break;

                case "B0037":
                    message += "<Image  src='img/title2_11.jpg'  /><br><br>";
                     break;

                case "B0038":
                    message += "<Image  src='img/title2_12.jpg'  /><br><br>";
                     break;

                case "B0016":
                    message += "<Image  src='img/title2_9.jpg'  /><br><br>";
                     break;
            }
            messageConn.Open();
            DataSet ds = new DataSet();
            SqlDataReader messageReader = messageComm.ExecuteReader(CommandBehavior.CloseConnection);
            message += "<table cellspacing='0' cellpadding='0' width='180' high='100' border='0'　>";
            while (messageReader.Read())
            {
                message += "&nbsp;&nbsp;";
                message += string.Format("<font size='2'><Image  src='img/123.gif' Width='12px' /> <a target='_BLANK' href=\"http://eip.minaik.com.tw/Bulletin/bulletinView.aspx?id={0}\" >{1}...</> </a>", messageReader[0], CutString(messageReader[1].ToString(), 19));
                message += "<BR>";
            }
            messageReader.Dispose();
            messageConn.Dispose();
            message += "<br><a  target='_BLANK' href='http://eip.minaik.com.tw/bulletin/bulletin.aspx?mid=" + bb.ToString() + "'><Image   src='img/more3.gif' border='0' align='right'  /></a>";
            message += "</table>";
        }
        Response.Write(message);
        //Response.Write("<P ALIGN='RIGHT'><a href=\"ViewTest.aspx?id={0}\"><font size='1'>more");
        ////Literal1.Text = message;
        #endregion
        
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
