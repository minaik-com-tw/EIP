using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Comm_WebUserControl : System.Web.UI.UserControl
{
    public event EventHandler ButtonClickEvent;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void goBack_btn_OnClick(object sender, EventArgs e)
    {

        if (ButtonClickEvent != null)    // 這一行一定要加,不然如果是null就會出錯.
        { 
            ButtonClickEvent(this, e);//用this是指這個ascx,如果用sender就是指button,如果多control可能會搞混,所以要用this
           Button b =(Button)sender;

            b.Text = "88";
        }

    }



    protected void ma_user_Load(object sender, EventArgs e)
    {
        txt_user.Text = "aaaaxxxxxxx";
    }

    public string text //text為屬性名稱
    {
       
        get { return txt_user.Text; } //取得TextBox1.Text值當做text的值
    }
}