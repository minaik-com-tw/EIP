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
using System.Text;
using System.IO;


namespace EMP_ADD
{
public partial class EMP_ADDDelete : SmoothEnterprise.Web.Page
{
    public string eno;
    public string erev;
    public string emake_no;
    public string whereis;
    protected void Page_Load(object sender, System.EventArgs e)
    {
        try
        {

            //SqlDataSource1.SelectCommand = "select a.EMP_NO EMP_NO, a.EMP_NM EMP_NM, "+
            //                               "sum(a.OT_HR) OT_HR,c.name DEP from emp_add a left join dguser b on b.EMPid=a.EMP_NO left join dggroup c on b.gid=c.id "+
            //                               "where b.logonid='" + this.CurrentUser.LogonID + "' union all select c.name,'合計',SUm(ot_hr),' ' from EMP_ADD left join dguser   " +
            //                               "    on EMPid=EMP_NO where logonid='" + this.CurrentUser.LogonID + "' group by EMP_NO ";
            //this.GridView1.DataBind();




            //SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            //rsa.Open("select logonid from dguser where logonid='ann.lin'");
            //if (!rsa.EOF)
            //{
            //    Response.Write(rsa["logonid"]);
            //}

            //this.GridView1.DataSource = null;
            //this.GridView1.DataBind();
            if (!this.IsPostBack)
            {
                
                if (Request.QueryString["id"] != "")
                {
                    if (whereis != "")
                        whereis = whereis + " AND";
                    whereis = whereis + " a.id= '" + Request.QueryString["id"] + "%'";
                }
                    this.Query();
                //Response.Write("第一次來"+"---------"+whereis);
            }
        }
        catch
        {
            //Response.Redirect("EMP_ADD.aspx");
        }
    }






    protected void BUTTON_query_Click(object sender, EventArgs e)
    {
        this.Query();
    }

    private void Query()
    {


            SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet();
            rs.ExecuteNonQuery("delete engineeringtest_report  ");





            if (this.QUERY_NO.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " no LIKE N'%" + this.QUERY_NO.Text + "%'";
            }
            if (this.QUERY_add_user.Text != "")
            {

                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " add_user LIKE N'%" + this.QUERY_add_user.Text + "%'";
            }
            if (this.QUERY_ccima01.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " SUBSTRing(cima01,3,2) LIKE N'%" + this.QUERY_ccima01.Text + "%'";
            }
            if (this.QUERY_makes_no.Text != "")
            {
                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " makes_no LIKE N'%" + this.QUERY_makes_no.Text + "%'";
            }

            if (this.QUERY_SDATE.Text != "" && this.QUERY_SDATE2.Text != "")
            {

                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " add_date >= CONVERT(datetime,'" + this.QUERY_SDATE.Text + "') and add_date <= CONVERT(datetime,'" + this.QUERY_SDATE2.Text + "')+1"; //+1是因為要讓日期變成後一天的00點00分

            }
            if (this.QUERY_SDATE.Text != "" && this.QUERY_SDATE2.Text == "")
            {

                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " add_date >= CONVERT(datetime,'" + this.QUERY_SDATE.Text + "') ";


            }
            if (this.QUERY_SDATE.Text == "" && this.QUERY_SDATE2.Text != "")
            {

                if (whereis != "")
                    whereis = whereis + " AND";
                whereis = whereis + " add_date <= CONVERT(datetime,'" + this.QUERY_SDATE2.Text + "') ";

            }


            if (whereis != "")
            {
                whereis = " where makes_no is not null  " + whereis;
            }
            else
            {
                whereis = " where makes_no is not null " + whereis;
            }

            

            SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rsa.Open("select no,rev,makes_no from engineeringtest_head a left join dguser b on a.add_user=b.id" + whereis + " order by no desc");

            
            while (!rsa.EOF)
            {
                eno = rsa["no"].ToString();
                erev = rsa["rev"].ToString();
                emake_no = "'" + rsa["makes_no"].ToString() + "'," + emake_no;
                rsa.MoveNext();
            }
            rsa.Close();
            emake_no = emake_no.Substring(0, emake_no.Length - 1);






        SqlDataSource1.SelectCommand=" select no,rev,delivers_amount,a.* from ( select asfa,aima02,asfb05,abima02,asfa03,asfb09,asfa06,  "+
                                     " case when sum(bb.img10) is null then 0 else sum(bb.img10) end bbimg10 ,  "+
                                     " case when sum(cc.img10) is null then 0 else sum(cc.img10) end ccimg10 ,  "+
                                     " case when sum(dd.img10) is null then 0 else sum(dd.img10) end ddimg10,asfb08   "+
                                     " from  "+
                                     " (select sfa01 asfa,a.ima02 aima02,sfb05 asfb05, sfb09 asfb09,b.ima02 abima02,sfa03 asfa03,sfa06 asfa06, sfb08 asfb08  "+
                                     " from IP185.MINAIK.dbo.SFA_FILE,IP185.MINAIK.dbo.SFB_FILE,IP185.MINAIK.dbo.IMA_FILE a,IP185.MINAIK.dbo.IMA_FILE b  "+
                                     "  where sfa01=sfb01 and sfb05=a.ima01 and sfa03=b.ima01 and sfa01 in (" + emake_no.ToString() + ") " +
                                     " group by sfa01,a.ima02,sfb05,b.ima02,sfa03,sfa06,sfb09,sfb08) aa  "+
                                     "  left join ( select * from IP185.MINAIK.dbo.IMG_FILE where img02 IN ('R4','R1')) bb on aa.asfa03=bb.img01  "+
                                     " left join ( select * from IP185.MINAIK.dbo.IMG_FILE where img02='R5') cc on aa.asfb05=cc.img01  "+
                                     " left join ( select * from IP185.MINAIK.dbo.IMG_FILE where img02='R6') dd on aa.asfb05=dd.img01  "+
                                     "  group by asfa,aima02,asfb05,abima02,asfa03,asfa06,asfb09,asfb08) a left join EIPA.dbo.engineeringtest_head b on asfa=makes_no " +
                                     " COLLATE Chinese_Taiwan_Stroke_CI_AS ";   //COLLATE Chinese_Taiwan_Stroke_CI_AS 定序 
             
            this.GridView1.DataBind(); 
    }
   

    public override void VerifyRenderingInServerForm(Control control) 

    {
 
    }
    double mysum1 = 0; 

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

       

    }
}
}