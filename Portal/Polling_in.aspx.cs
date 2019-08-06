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

public partial class Polling_in : SmoothEnterprise.Web.Page 
{
    public string message;
    private void Page_Load(object sender, System.EventArgs e)
    {


            if (!IsPostBack)
                AddControls();

           
    }

    protected override void LoadViewState(object savedState)
    {
        base.LoadViewState(savedState);
        if (ViewState["controsladded"] == null)
            AddControls();
    }
    private void GotoDefault()
    {
        //dynamicbutton.Enabled = false;
        //Response.Write("三秒后页面跳转<div id=\"aa\"></div>");//先生成一个用来显示时间倒计时的DIV

        StringBuilder sb = new StringBuilder();//注意添加using引用 System.Text
        sb.Append("<script langage=\"javascript\">"); //用\"转义'

        sb.Append("var i=0;");

        sb.Append("function out()");

        sb.Append("{");


        sb.Append("location.href=\"default.aspx\";");//这里的login.aspx可以随便改成你想转换的页面


        sb.Append("document.getElementById(\"aa\").innerHTML=i; }");

        sb.Append("setInterval(\"out()\",1000); "); //每隔一秒发生

        sb.Append("</script>");

        this.Page.Controls.Add(new LiteralControl(sb.ToString()));
    }
    private void AddControls()
    {
        SqlConnection messageConn1 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        SqlCommand messageComm1 = new SqlCommand("select subject  from polling where  id_s='3' group by subject", messageConn1);


        //message += "<html><body><form id='form1'><br>問卷調查<br>";
        messageConn1.Open();
        SqlDataReader messageReader1 = messageComm1.ExecuteReader(CommandBehavior.CloseConnection);
        while (messageReader1.Read())
        {

           //message=messageReader1[0].ToString();;
            //Label1.Text = messageReader1[0];
            Label1.Text = ">>"+messageReader1[0].ToString();
            //telbox.Text = dr["tel"].ToString(); 
            
        }
        messageReader1.Dispose();
        messageConn1.Dispose();
        SqlConnection messageConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        SqlCommand messageComm = new SqlCommand("select id_c,content  from polling where id_s='3'", messageConn);


        messageConn.Open();
        SqlDataReader messageReader = messageComm.ExecuteReader(CommandBehavior.CloseConnection);
        RadioButtonList dynamictextbox = new RadioButtonList();
        while (messageReader.Read())
        {

            string test;
            string testvalue;
            // 如果查詢出來的資料不只一筆時,要加迴圈 (dr.FieldCount->計算筆數)
            for (int j = 1; j < messageReader.FieldCount; j++)
            {
                test = messageReader[1].ToString();
                testvalue = messageReader[0].ToString();
                dynamictextbox.Items.Add(new ListItem(testvalue + "." + test, testvalue));

            }
        }

        messageReader.Dispose();
        messageConn.Dispose();

        dynamictextbox.ID = "dynamictextbox";
        Button dynamicbutton = new Button();
        dynamicbutton.Click += new System.EventHandler(dynamicbutton_Click);
        dynamicbutton.Text = "投票己截止";
        Panel1.Controls.Add(dynamictextbox);
        Panel1.Controls.Add(new LiteralControl("<BR>"));
        Panel1.Controls.Add(new LiteralControl("<BR>"));
        Panel1.Controls.Add(dynamicbutton);

        TextBox dynamictextboxa = new TextBox();
        dynamictextboxa.Text = "(請輸入您的意見! 您的意見是我們進步的來源喔^ ^)";
        dynamictextboxa.ID = "dynamictextboxa";
        dynamictextboxa.Width = 500;
        dynamictextboxa.Height = 100;
        Panel1.Controls.Add(dynamictextboxa);
        Panel1.Controls.Add(new LiteralControl("<BR>"));
        Panel1.Controls.Add(new LiteralControl("<BR>"));
        Panel1.Controls.Add(dynamicbutton);

        ViewState["controlsadded"] = true;
    }

    private void dynamicbutton_Click(Object sender, System.EventArgs e)
    {




        String strSQL = "select name  from polling_in where name='" + this.CurrentUser.LogonID + "' and id_p='3'";
        string connstr;
        //Response.Write(strSQL);
        connstr = (System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);                  //連線資料
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();
        SqlCommand cmd = new SqlCommand(strSQL, conn);
        //cmd.Connection.Open();                              //打開連線
        SqlDataReader dr = cmd.ExecuteReader();             //讀取內容
        Response.Write("<script language='JavaScript'>window.alert('投票已截止囉!');</script>");
        if (dr.Read())
        {
            //Response.Write("<script language='JavaScript'>window.alert('你己經投票過囉');</script>");
           // Response.Write("<script language='JavaScript'>window.alert('投票已截止囉!');</script>");
            //GotoDefault();
        }
        else
        {
            
            RadioButtonList tb = new RadioButtonList();
            tb = (RadioButtonList)(Panel1.FindControl("dynamictextbox"));
            //Label1.Text = tb.Text;
            if (this.CurrentUser.LogonID == "")
            {
                Response.Write("<script language='JavaScript'>window.alert('請先登入!');</script>");
                GotoDefault();
            }
            else if (tb.Text == "")
            {
                Response.Write("<script language='JavaScript'>window.alert('請輸入選項!');</script>");
            }
            else
            {
                Response.Write("<script language='JavaScript'>window.alert('投票成功,謝謝你的投票!');</script>");
                TextBox ta = new TextBox();
                ta = (TextBox)(Panel1.FindControl("dynamictextboxa"));
                //string connstr;
                //string con = "";
                //con = RadioButtonList1.SelectedItem.Value;
                //Response.Write(con);
                //connstr = ("Data Source=ANNLINV\\SQLEXPRESS;Initial Catalog=TTA3;Integrated Security=True; Integrated Security=SSPI;");
                SqlConnection connection = new SqlConnection(connstr);
                SqlCommand DataCommand = new SqlCommand();
                DateTime d = DateTime.Now;
                //Response.Write("Date = " +d.Date.ToString() + "<BR>");
                DataCommand.CommandText = "insert into polling_in(id_p,id_c,name,date,comment)values('3','" + tb.Text + "','" + this.CurrentUser.LogonID + "','" + d.ToString("yyyyMMdd") + "','" + ta.Text + "')";
                //Response.Write(ta.Text);
                //Response.Write(DataCommand.CommandText);
                DataCommand.Connection = connection;
                connection.Open();
                DataCommand.ExecuteNonQuery();
                connection.Close();

                //Response.Write("<script language='JavaScript'>window.alert('投票已截止囉!');</script>");
                GotoDefault();

                

            }
        }

    }



}