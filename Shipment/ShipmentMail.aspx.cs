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
using System.Net.Mail;
using System.Text;
using System.IO;

public partial class ShipmentMail : SmoothEnterprise.Web.Page 
{
    private string db1 = ""; //db主位置 
    private string db2 = ""; //db副位置
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Environment.MachineName.ToString().Trim() != "ANN-LIN")
        {
            db1 = "[EIPB].[dbo]."; //如果不是在Ann本機, 則指定資料庫 
            db2 = "[EIPA].[dbo]."; //如果不是在Ann本機, 則指定資料庫 

        }

       # region 每日報表寄送



        string sql_1 = "SELECT a.id, a.No AS no, a.Ver AS ver, a.Plant, b.item, a.ERP_PO, a.Customer, a.C_PO, Purpose2, a.loc, c.name, CONVERT (char, a.Add_date, 111) AS Add_date, " +
                                    "CASE Status WHEN 'N' THEN '未送審' WHEN 'Y' THEN '送審中' WHEN 'OK' THEN '完成審核' when 'V' then '作廢' ELSE '退回' END AS status, " +
                                    "b.Component, b.DWG, b.Partno, b.Material, d.LCaption, b.LV, b.HV, b.Qty, CONVERT (char, b.C_demand, 111) AS C_demand, " +
                                    "    CONVERT (char, b.C_demand2, 111) AS C_demand2, CONVERT (char, b.ETD, 111) AS ETD, b.Potential_P, b.Paper, b.Packing, " +
                                    "b.B_no, b.Shipment_status,  " +
                                     "case when CONVERT(char, etd, 111)=CONVERT(char, C_demand, 111) " +
                                     "then 'On-time'  " +
                                     "when CONVERT(char, C_demand2, 111)> CONVERT(char, C_demand, 111)  then 'Delay'  " +
                                     "when CONVERT(char, getdate(), 111)< CONVERT(char, C_demand, 111)  then 'In-Progress' " +
                                     "else '' end systemstatus  ,  " +
                                    "CASE WHEN CONVERT(char, C_demand2, 111)> CONVERT(char, C_demand, 111) THEN DATEDIFF (day,CONVERT(datetime,C_demand),CONVERT(datetime,GETDATE())) ELSE '' END  delay, case when e.npiname is null then c.name else e.npiname end npiname  " +
                                    " FROM ( SELECT a.* FROM  " + db1 + "shipment_head a ,( SELECT  no,MAX(ver) as ver from  " + db1 + "Shipment_head  group by  no  ) b WHERE a.no= b.no and a.ver=b.ver)  a " +
                                    "LEFT OUTER JOIN " + db1 + "Shipment_body AS b ON a.id = b.aid " +
                                    "LEFT OUTER JOIN " + db2 + "dguser AS c ON a.Add_user = c.id LEFT OUTER JOIN " + db1 + "NPI_Base_file AS d ON b.Shipment_type = d.LID  " +
                                    "LEFT OUTER JOIN (SELECT Shipment_NPIEngineer.aid, dguser.name AS npiname FROM " + db1 + "Shipment_NPIEngineer  " +
                                    "     LEFT OUTER JOIN " + db2 + "dguser ON Shipment_NPIEngineer.NPI_Engineer1 = dguser.id) AS e ON a.id = e.aid ";

        //明日出貨
       SqlDataSource1.SelectCommand= sql_1.ToString()+ " where CONVERT (char, b.C_demand2, 111)= convert(char, dateadd(d,1,getdate()) , 111)  and status='OK'";
        //今日新增
       SqlDataSource2.SelectCommand = sql_1.ToString() + " where CONVERT (char, add_date, 111)= CONVERT (char, getdate(), 111) and status <> 'V' ";
        //delay項目
       SqlDataSource3.SelectCommand = sql_1.ToString() + " where c_demand<>c_demand2 and status not in('OK','V')";

       SqlDataSource4.SelectCommand = sql_1.ToString() + " where 1=1 "+
                                                         "      and (c_demand is null or c_demand2 is null)  "+
                                                         "      and status not in('OK','V')  "+
                                                         "      and a.Add_date > '2015-10-01'";
       //Response.Write(SqlDataSource3.SelectCommand);

       this.GridView1.DataBind();
       String ques="";

       if (GridView1.Rows.Count != 0)  //判斷gridview有無資料
       {
           ques =  ques+"●" + DateTime.Now.AddDays(1).ToString("yyyy/MM/dd") + "預計出貨項目 : <br>" +
                  "<br>" +
                  GridViewToHtml(GridView1);

       }

       if (GridView2.Rows.Count != 0)  //判斷gridview有無資料
       {
           ques = ques + "●" + DateTime.Now.ToString("yyyy/MM/dd") + "今日新增項目 : <br>" +
                  "<br>" +
                  GridViewToHtml(GridView2);

       }

       if (GridView3.Rows.Count != 0)  //判斷gridview有無資料
       {
           ques = ques + "●" + DateTime.Now.ToString("yyyy/MM/dd") + " Delay項目 : <br>" +
                  "<br>" +
                  GridViewToHtml(GridView3);

       }

       if (GridView4.Rows.Count != 0)  //判斷未維護出貨日期
       {
           ques = ques + "●" + DateTime.Now.ToString("yyyy/MM/dd") + " 未維護出貨日期項目 : <br>" +
                  "<br>" +
                  GridViewToHtml(GridView4);
       }



       if (GridView1.Rows.Count != 0 || GridView2.Rows.Count != 0 || GridView3.Rows.Count != 0 || GridView4.Rows.Count != 0 )
       {

           SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

           rs.Open("select email,name from " + db1 + "shipment_mail_user left join " + db2 + "dguser on id=user_id");
           while (!rs.EOF)
           {
               MailAddress to = new MailAddress(rs["email"].ToString());


                //MailAddress to = new MailAddress("rage.mai@minaik.com.tw");
               MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
               MailAddress bcc = new MailAddress("rage.mai@minaik.com.tw");
               MailMessage message = new MailMessage(from, to);
               message.Bcc.Add(bcc);
                String allques = rs["name"].ToString() + " 您好:" + "<br>" +
                             "<br>" +
                             "產品送樣系統提醒您出貨資訊如下:" + "<br><br>" +
                             "提醒您,欲了解更多可至" + "<a href=\"http://eip.minaik.com.tw/shipment/shipmentreport.aspx\" >(NPI送樣系統查詢)</a><br><br>" +
                             ques.ToString() +
                            "<br>" +
                            "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                            "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                            "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

                message.Subject = "產品送樣系統通知您" + DateTime.Now.AddDays(1).ToString("yyyy/MM/dd") + "出貨資訊";

                message.IsBodyHtml = true;
                message.Body = allques;


                SmtpClient client = new SmtpClient("192.168.0.12");

                client.Send(message);
                rs.MoveNext();
            }
            rs.Close();
       }

       #endregion

       #region 每日未送審提醒通知

       string sel_sql5;
       sel_sql5 = "select 'NPI送樣系統' main,'http://eip.minaik.com.tw/shipment/shipmentEdit.aspx?id='  " +
                 "url,a.id id,b.name name,b.email email,a.no no from " + db1 + "shipment_head a  " +
                 "left join " + db2 + "dguser b on a.add_user=b.id  " +
                 "where status in ('N','NO') and email is not null";

       SmoothEnterprise.Database.DataSet attch5 = new SmoothEnterprise.Database.DataSet();
       attch5.Open(sel_sql5);

       while (!attch5.EOF)
       {

           MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
           MailAddress to = new MailAddress(attch5["email"].ToString());

           MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

           MailMessage message = new MailMessage(from, to);


           string ques4 = attch5["name"].ToString() + " 您好:" + "<br>" +
                  "<br>" +
                  "您有一筆" + attch5["main"].ToString() + "單 " + attch5["no"].ToString() + "未處理,提醒您需處理,謝謝!" + "<br><br>" +
                  attch5["main"].ToString() + "單內容 : " + "<a href=\"" + attch5["url"].ToString() + attch5["id"].ToString() + "\" >至" + attch5["main"].ToString() + "單電子簽核系統查詢</a>" +
                  "<br>" +
                  "<br>" +
                  "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                  "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                  "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

           message.Subject = "提醒-" + attch5["name"].ToString() + "您有一筆" + attch5["main"].ToString() + "單未處理";
           message.IsBodyHtml = true;
           message.Body = ques4;

           SmtpClient client = new SmtpClient("192.168.0.12");

           client.Send(message);

           Response.Write("Mail傳送完畢" + "<br>");

           attch5.MoveNext();
       }

       attch5.Close();

       #endregion

       #region Actual Shipment Date過二個星期,Shipment Status尚未維護-->通知工程師

       string sel_sql6;
       sel_sql6 = "select distinct a.id id,a.no no,case when d.name is null then c.name else d.name end npi_engineer, " +
                 "case when d.email is null then c.email else d.email end email  from " + db1 + "shipment_head a  " +
                 "left join " + db1 + "shipment_body b on a.id=b.aid  " +
                 "left join dguser c on a.add_user=c.id " +
                 "left join (select aid,name,email from " + db1 + "shipment_npiengineer left join dguser on npi_engineer1=id) d on d.aid=a.id " +
                 "where status='OK' and shipment_status is null " +
                 "and DATEDIFF (day,CONVERT(datetime,etd),CONVERT(datetime,getdate())) >=14";

       SmoothEnterprise.Database.DataSet attch6 = new SmoothEnterprise.Database.DataSet();
       attch6.Open(sel_sql6);

       while (!attch6.EOF)
       {

           MailAddress from = new MailAddress("eip@minaik.com.tw", "ePortal(員工入口網站)");
           MailAddress to = new MailAddress(attch6["email"].ToString());

           MailAddress bcc = new MailAddress("ann.lin@minaik.com.tw");

           MailMessage message = new MailMessage(from, to);

           string mmail;
           mmail = attch6["npi_engineer"].ToString() + " 您好:" + "<br>" +
                  "<br>" +
                  "您有一筆NPI送樣系統單據 " + attch6["no"].ToString() + "-Shipment Status尚未維護,提醒您需處理,謝謝!" + "<br><br>" +
                  "內容 : " + "<a href=\"" + "http://eip.minaik.com.tw/shipment/shipmentView.aspx?id=" + attch6["id"].ToString() + "&other=1\" >至NPI送樣系統維護</a>" +
                  "<br>" +
                  "<br>" +
                  "如您想了解更多有關員工入口網站的資訊請點選以下連結進入" + "<br>" +
                  "<a href=\"http://eip.minaik.com.tw/\">員工入口網站</a>" + "<br>" +
                  "感謝您對員工入口網站的支持與愛護，<font Color='red'>。因本信件為系統自動發送,請勿直接以此郵件回覆。</font>";

           message.Subject = "提醒-" + attch6["npi_engineer"].ToString() + "您有一筆NPI送樣系統單據-Shipment Status尚未維護";
           message.IsBodyHtml = true;
           message.Body = mmail;

           SmtpClient client = new SmtpClient("192.168.0.12");

           client.Send(message);

           Response.Write("Mail傳送完畢" + "<br>");

           attch6.MoveNext();
       }

       attch6.Close();

       #endregion

   }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
            //string paperstring = "";
            //SmoothEnterprise.Database.DataSet rss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);


            //rss.Open(" SELECT lcaption paper from Shipment_paper left join NPI_Base_file on shipment_paper_id=lid " +
            //        " where aid='" + e.Row.Cells[0].Text + "' and item='" + e.Row.Cells[4].Text + "' and tid='P' and lacti='Y' ");
            //while (!rss.EOF)
            //{
            //    paperstring = paperstring + rss["paper"].ToString() + " , ";

            //    rss.MoveNext();
            //}
            //rss.Close();

            //e.Row.Cells[25].Text = paperstring.Substring(0, paperstring.Length - 2);

       // }
 

        if (e.Row.RowType == DataControlRowType.DataRow)
        {


            e.Row.Cells[0].Visible = false;　　//隱藏欄位
        }


        if (e.Row.RowType == DataControlRowType.Header)

        {

            e.Row.Cells[0].Visible = false;    //隱藏欄位



        }


    }

    private string GridViewToHtml(GridView gv)  //用gridmail產生html
    {
        StringBuilder sb = new StringBuilder();
        StringWriter sw = new StringWriter(sb);
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        gv.RenderControl(hw);
        return sb.ToString();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        
// •因會產生例外詳細資訊: System.Web.HttpException: 型別 'GridView' 的控制項 'GridView1' 必須置於有 runat=server 的表單標記之中。
//所以必須在程式碼中覆寫VerifyRenderingInServerForm這個方法。


    }


}