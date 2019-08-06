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
using System.Data.SqlClient;
using System.IO;
using System.Threading;
using System.Text;
using System.Net;

namespace ERP_CBGI014
{
public partial class CBGI014Edit : SmoothEnterprise.Web.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		//Page.Title = "CBGI014 Edit Page";
		//try
        //{
        bool imagedel = true;
			if (!this.IsPostBack)
			{
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead); 
                rs.Open("SELECT * FROM eipb.dbo.CBGI014_Head WHERE rowid='" + Request.QueryString["rowid"] + "' ");
				if (!rs.EOF)
				{
					
 	 	 	 	 	
 	 	 	 	 	this.FIELD_tc_cba00.Text = rs["tc_cba00"].ToString();
 	 	 	 	 	this.FIELD_tc_cba01.Text = rs["tc_cba02"].ToString();
 	 	 	 	 	this.FIELD_gem02_0.Text = rs["gem02_0"].ToString();
 	 	 	 	 	//this.FIELD_tc_cba02.Text = rs["tc_cba02"].ToString();
                    this.FIELD_tc_cbauser.Text = rs["gen02_1"].ToString();
 	 	 	 	 	//this.FIELD_tc_cbagrup.Text = rs["tc_cbagrup"].ToString();
 	 	 	 	 
 	 	 	 	 	this.FIELD_inidate.Text = rs["inidate"].ToString();
 	 	 	 	 
 	 	 	 	 	this.FIELD_sn.Text = rs["sn"].ToString();
 	 	 	 	 	
 	 	 	 	 //	this.FIELD_gen02_1.Text = rs["gen02_1"].ToString();
 	 	 	 	 	this.FIELD_ver.Text = rs["ver"].ToString();

                    DBTransfer fs=new DBTransfer();
                    PopupUser1.Text=fs.GetTopfile("select c.id  from EIPA.dbo.dguser "+
                        " a left join dggroup b on   a.gid=b.id  "+
                        " left join dguser c on b.uid=c.id   where a.id='"+this.CurrentUser.ID+"'");
                    
                    if ((rs["Status"].ToString() == "Y") || (rs["Status"].ToString() == "C"))
                    {
                        BUTTON_save.Visible = false;
                        InputButton1.Visible = false;
                        Label3.Visible = false;
                        PopupUser1.Visible = false;
                        InputButton3.Visible = true;
                        imagedel = false;

                    }
                    else InputButton3.Visible = false;

                    //要設後門好作事
                    if (this.CurrentUser.LogonID == "herzog.lin")
                    {
                        BUTTON_save.Visible = true;
                        BUTTON_save.Text = "儲存(H)";
                        imagedel = true;
                    }
                }												  
				else
				{
					Response.Redirect("CBGI014.aspx");
				}
                displayfile(imagedel);
			}
            
            gvBind(GridView1);
            gvBind2(GridView2);
           // StopProcess(Request.QueryString[0]);


		//}
		//catch
		//{
		//	Response.Redirect("CBGI014.aspx");
		//}
	}

	protected void Page_PreRender(object sender, System.EventArgs e)
	{
    	if (!this.IsPostBack)
    	{
            this.KeepURL();
    	}
	}


    private void gvBind(GridView gv)
    {
        SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        string str = "SELECT   a.nm tc_cbb06 " +
      ",b.nm tc_cbb07,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11 " +
      ",M12,unp,(M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12) sum,(M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12)*unp totalm FROM EIPB.dbo.CBGI014_Sum " +
      "left join EIPB.dbo.CBGI014_Base a on tc_cbb06=a.id " +
      "left join EIPB.dbo.CBGI014_Base b on tc_cbb07=b.id where  rowid='" + Request.QueryString["rowid"] + "'";


        SqlDataAdapter da = new SqlDataAdapter(str, conn);
        {
            DataTable dt = new DataTable();
            da.Fill(dt);
            gv.DataSource = dt;
            gv.DataBind();



        }


    }

    private void gvBind2(GridView gv)
    {
        SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
        string str = "SELECT  dowid ,sn,tc_cbb03,faj31 " +
      ",fajowner,tc_cbb04,tc_cbb05,aag02,tc_cbb22,tc_cbb06,tc_bgx02,tc_cbb07 " +
      ",tc_bgy02,tc_cbb08,fac02,tc_cbb18,tc_cbb09,tc_cbb091,tc_cbb10,tc_cbb11 " +
      ",tc_cbb12,tc_cbb13f,tc_cbb13,tc_cbb14f,tc_cbb14 " +
      ",tc_cbb19,tc_cbb15,azf03,tc_cbb16 " +
      ",tc_cbb21,tc_cbb17,tc_cbb171,dstatus " +
      ",rowid,mismemo,itemstatus " +
      ",convert(char(10),faj26,120) faj26    FROM [EIPB].[dbo].[CBGI014_Body] where  rowid='" + Request.QueryString["rowid"] + "'  order by tc_cbb03 asc";


        SqlDataAdapter da = new SqlDataAdapter(str, conn);
        {
            DataTable dt = new DataTable();
            da.Fill(dt);
            gv.DataSource = dt;
            gv.DataBind();



        }


    }

	protected void BUTTON_save_Click(object sender, System.EventArgs e)
	{
		if (this.IsValid)
		{
			try
			{
				SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
				rs.Open("SELECT * FROM eipb.dbo.CBGI014_Head WHERE rowid='"+ Request.QueryString["rowid"] +"' ");
				if (!rs.EOF)
				{
					


                    //if (this.FIELD_rowid.Text!="") rs["rowid"] = new Guid(this.FIELD_rowid.Text) ; else rs["rowid"] = System.DBNull.Value ;
                    //if (this.FIELD_PlantId.Text!="") rs["PlantId"] = this.FIELD_PlantId.Text ; else rs["PlantId"] = System.DBNull.Value ;
                    //if (this.FIELD_tc_cba00.Text!="") rs["tc_cba00"] = this.FIELD_tc_cba00.Text ; else rs["tc_cba00"] = System.DBNull.Value ;
                    //if (this.FIELD_tc_cba01.Text!="") rs["tc_cba01"] = this.FIELD_tc_cba01.Text ; else rs["tc_cba01"] = System.DBNull.Value ;
                    //if (this.FIELD_gem02_0.Text!="") rs["gem02_0"] = this.FIELD_gem02_0.Text ; else rs["gem02_0"] = System.DBNull.Value ;
                    //if (this.FIELD_tc_cba02.Text!="") rs["tc_cba02"] = this.FIELD_tc_cba02.Text ; else rs["tc_cba02"] = System.DBNull.Value ;
                    //if (this.FIELD_tc_cbauser.Text!="") rs["tc_cbauser"] = this.FIELD_tc_cbauser.Text ; else rs["tc_cbauser"] = System.DBNull.Value ;
                    //if (this.FIELD_tc_cbagrup.Text!="") rs["tc_cbagrup"] = this.FIELD_tc_cbagrup.Text ; else rs["tc_cbagrup"] = System.DBNull.Value ;
                    //if (this.FIELD_File_sn.Text!="") rs["File_sn"] = this.FIELD_File_sn.Text ; else rs["File_sn"] = System.DBNull.Value ;
                    //if (this.FIELD_inidate.Text!="") rs["inidate"] = this.FIELD_inidate.Text ; else rs["inidate"] = System.DBNull.Value ;
                    //if (this.FIELD_moddate.Text!="") rs["moddate"] = this.FIELD_moddate.Text ; else rs["moddate"] = System.DBNull.Value ;
                    //if (this.FIELD_sn.Text!="") rs["sn"] = this.FIELD_sn.Text ; else rs["sn"] = System.DBNull.Value ;
                    //if (this.FIELD_Status.Text!="") rs["Status"] = this.FIELD_Status.Text ; else rs["Status"] = System.DBNull.Value ;
                    //if (this.FIELD_gen02_1.Text!="") rs["gen02_1"] = this.FIELD_gen02_1.Text ; else rs["gen02_1"] = System.DBNull.Value ;
                    //if (this.FIELD_ver.Text!="") rs["ver"] = this.FIELD_ver.Text ; else rs["ver"] = System.DBNull.Value ;
                    rs.Update();
				}
				rs.Close();

                FileUploadData(Request.QueryString["rowid"]);

                displayfile(true);

				//Response.Redirect("CBGI014.aspx");
			}
			catch (Exception ex)
			{
				this.AddError(this,"BUTTON_save_Click()","",ex.Message);
			}
		}
	}
    private void displayfile(bool un)
    {
        string status = "";

        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        string htmlstr = "";
        string detlstr = "";
        Panel2.Controls.Add(new LiteralControl("<table border='1' width='400px' cellpadding='0' cellspacing='0'><tr ><td style='font:8pt;COLOR: yellow; height: 25px; BACKGROUND-COLOR: #848484'>功能</td><td style='font:8pt;COLOR: yellow;height: 20px; background-color: #848484'>附件(下載)</td></tr>"));

        rs.Open("SELECT * FROM [EIPB].[dbo].[upload_attachment] WHERE detid='" + Request.QueryString[0] + "'");
        while (!rs.EOF)
        {

            htmlstr = "<a href='../AttachDownload.aspx?attid=" + rs["attid"] + "&table=[EIPB].[dbo].[upload_attachment]' target=\'_blank\' ><img border='0' width='25' height='25' src='../gif/p12.gif' />" + rs["upname"] + "</a>";
            if (un)
            {
                detlstr = "<a href='CBGI014del.aspx?rowid=" + Request.QueryString[0] + "&W=Edit&attid=" + rs["attid"] + "'  ><img border='0' width='20' height='25' onClick=return j1('" + rs["attid"] + "') src='../gif/button_drop.png' /></a>";

            }


            rs.MoveNext();
            Panel2.Controls.Add(new LiteralControl("<TR class='NormalBold'><TD align='center' style='width: 100px;height: 25px'>"));
            Panel2.Controls.Add(new LiteralControl(detlstr + "</TD><TD width='300px'>"));
            Panel2.Controls.Add(new LiteralControl(htmlstr + "</TD></tr>"));


        }
        Panel2.Controls.Add(new LiteralControl("</table>"));
    }

    private void FileUploadData(string sysid)
    {
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);

        //region 動態新增
        HttpFileCollection files = HttpContext.Current.Request.Files;
        System.Text.StringBuilder strMsg = new System.Text.StringBuilder();
        int att_count = 0;

        for (int ifile = 0; ifile < files.Count; ifile++)
        {
            HttpPostedFile postedfile = files[ifile];
            string filename, fileExt, filePath;
            filename = System.IO.Path.GetFileName(postedfile.FileName);    //抓取文件名
            fileExt = System.IO.Path.GetExtension(postedfile.FileName);    //抓取文件附檔名

            if (postedfile.ContentLength > 0)
            {
                att_count = att_count + 1;

                String tafilename = "ulname" + att_count.ToString();
                String taattach = "ulbody" + att_count.ToString();



                byte[] fileBytes = new byte[postedfile.ContentLength];
                postedfile.InputStream.Read(fileBytes, 0, postedfile.ContentLength);


                rs.Open("SELECT * FROM [EIPB].[dbo].[upload_attachment] WHERE 1=0");
                rs.Add();
                rs["DetId"] = sysid;
                rs["upname"] = filename;
                rs["upfil"] = fileBytes;
                rs["PId"] = "A501";
                rs["attinidate"] = DateTime.Now.ToString();
                rs.Update();
                rs.Close();
                filePath = System.IO.Path.GetFullPath(postedfile.FileName);    //try抓取文件路徑
                // fpath[att_count] = filePath;

            }

        }
    }

	protected void BUTTON_back_Click(object sender, System.EventArgs e)
	{
        Response.Redirect("CBGI014.aspx");
	}

	protected void BUTTON_delete_Click(object sender, System.EventArgs e)
	{
		Response.Redirect("CBGI014Delete.aspx?rowid="+Request.QueryString["rowid"]);
	}

    private string[,] GetResGroup(string gid)
    {
        string[,] data = new string[1, 5];
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        ds.Open("SELECT   a.pid, a.name  an,a.uid, b.name  bn,isnull(lshort,0) lev " +
                " FROM    dggroup a left join  dguser b on a.uid=b.id  left join  eipa.dbo.dglevel c on b.levid=c.lnid " +
                " where a.id='" + gid + "'");

        if (!ds.EOF)
        {
            data[0, 0] = ds[0].ToString();
            data[0, 1] = ds[1].ToString();
            data[0, 2] = ds[2].ToString();
            data[0, 3] = ds[3].ToString();
            data[0, 4] = ds[4].ToString();
        }

        return data;
    }

    protected void BUTTON_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {
        int levid = 0;
        DBTransfer takedata = new DBTransfer();
        SmoothEnterprise.Database.DataSet js = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        //string idnm = "";


        ArrayList managerid = new ArrayList();  //主管id arraylist
        ArrayList managernm = new ArrayList();  //主管職稱 arraylist
        string gid = "";
        string[,] data = new string[1, 5];
        int count = 0;
        string firapp = "";
        string buf = "";
        int t = 0;

        js.Open("select  pid from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc'  "+
            "  and NO  in ('2','2_2')  and company='MINAIK'  order by no asc ");

        while (!js.EOF)
        {
            t++;
            managerid.Add(js[0].ToString());
            managernm.Add("會計"+t.ToString());
            js.MoveNext();
        }


        managerid.Add(PopupUser1.Text);
        managernm.Add("直屬主管");
         

          t = 0;
         
           #region
              js.Open("select gid from eipa.dbo.dguser where id='" + PopupUser1.Text + "'");
              if (!js.EOF)
              {
                  gid = js["gid"].ToString();
                  while (levid <= 10)
                  {
                      //t++;
                      data = GetResGroup(gid);
                      if (data[0, 2] == null) break;
                      else
                      {
                          if (data[0, 2].ToString().ToUpper() == "63D0329E-F4C2-44C6-950C-92174D233BED")
                          {
                              managerid.Add("63D0329E-F4C2-44C6-950C-92174D233BED");
                              managernm.Add("CEO");
                          }
                          else
                          {
                              if (buf != data[0, 2].ToString())
                              {
                                  managerid.Add(data[0, 2].ToString());
                                  managernm.Add(data[0, 1].ToString());
                              }
                              buf = data[0, 2].ToString();

                          }

                          // Response.Write(data[0, 1].ToString() + "--" + data[0, 2].ToString() + "--" + data[0, 0].ToString() + "--" + data[0, 0].ToString() + "<br>");

                          gid = data[0, 0].ToString();
                          levid = Int32.Parse(data[0, 4].ToString());

                      }

                      count++;
                      if (count > 8) break;
                  }
                  //firapp = managerid[0].ToString();
              }
              js.Close();
 
             #endregion

             
              /*
              managerid.Add("FF0678EA-3EAF-4F1F-A012-1C54F93B48E2");
              managernm.Add("會計一");


              managerid.Add("D22FD429-E1EC-431D-99E6-1D7041F8A452");
              managernm.Add("會計主管");



              managerid.Add("AB70A6C0-D106-4636-B1E1-15DFFF9A83C5");
              managernm.Add("財務長");
      */
        //---test --------------------
             // 1 代表是MIS 的單子

              if (FIELD_tc_cba01.Text.Substring(0, 1) == "1")
              {


                  //MIS 主管
                  //managerid.Add("B76FC2D3-7910-4641-A51B-8B6023C567AE");
                  //managernm.Add("MIS 主管");

                  //加SI 
                  string siid = takedata.GetTopfile("SELECT ISNULL(b.si_id,'0DC215C7-0043-4CD6-AC6E-659ECDC88994') FROM eipb.dbo.CBGI014_Head " +
                               " left join [EIPB].[dbo].[Sta_erpdep] b on tc_cba01=b.tip_depno " +
                               " WHERE rowid='" + Request.QueryString[0] + "'");

                  managerid.Add(siid);
                  managernm.Add("SI");
                  //MIS  主管  Review 
                  managerid.Add("B76FC2D3-7910-4641-A51B-8B6023C567AE");
                  managernm.Add("MIS 主管");


                  //判斷有沒有連簽兩次
                  #region
                  for (int i = managerid.Count - 1; i >= 0; i--)
                  {

                      for (int k = 0; k < i; k++)
                      {

                          if (managerid[i].ToString().ToUpper() == managerid[k].ToString().ToUpper())
                          {
                              managerid[k] = "";

                          }

                      }
                  }

                  //砍掉57334E67-59A6-4147-B447-DBCCBC90909A
                  for (int i = managerid.Count - 1; i >= 0; i--)
                  {
                      if (managerid[i].ToString().ToUpper() == "57334E67-59A6-4147-B447-DBCCBC90909A") managerid[i] = "";

                  }

                  for (int i = managerid.Count - 1; i >= 0; i--)
                  {
                      if (managerid[i] == "")
                      {
                          managerid.RemoveAt(i);
                          managernm.RemoveAt(i);
                          //Response.Write("-----<br>");
                      }
                  }
                  #endregion








                  siid = takedata.GetTopfile("SELECT bossApp  FROM eipb.dbo.CBGI014_Head " +
                              " left join [EIPB].[dbo].[Sta_erpdep] b on tc_cba01=b.tip_depno " +
                              " WHERE rowid='" + Request.QueryString[0] + "'");

                  if (siid == "Y")
                  {
                      managerid.Add("57334E67-59A6-4147-B447-DBCCBC90909A");
                      managernm.Add("副營運長");


                  }


              }
              else
              {

                  //判斷有沒有連簽兩次
                  #region
                  for (int i = managerid.Count - 1; i >= 0; i--)
                  {

                      for (int k = 0; k < i; k++)
                      {

                          if (managerid[i].ToString().ToUpper() == managerid[k].ToString().ToUpper())
                          {
                              managerid[k] = "";

                          }

                      }
                  }

                  //砍掉57334E67-59A6-4147-B447-DBCCBC90909A
                  //for (int i = managerid.Count - 1; i >= 0; i--)
                  //{
                  //    if (managerid[i].ToString().ToUpper() == "57334E67-59A6-4147-B447-DBCCBC90909A") managerid[i] = "";

                  //}

                  for (int i = managerid.Count - 1; i >= 0; i--)
                  {
                      if (managerid[i] == "")
                      {
                          managerid.RemoveAt(i);
                          managernm.RemoveAt(i);
                          //Response.Write("-----<br>");
                      }
                  }
                  #endregion




              }






        FlowClient1.TypeName = "sharflow12_2.Flowwork.sharflow12_21";

        sharflow12_2.Flowwork.sharflow12_21 flow = new sharflow12_2.Flowwork.sharflow12_21();
        FlowClient1.Text = "固定資產預算申請單";  //更改流程名稱


        
        string Sqlc = "insert into  [EIPB].[dbo].[doulog](rowid,appid,appdate )values('" + Request.QueryString["rowid"] + "','" +
             managerid[0].ToString() + "',getdate())";
        takedata.RunIUSql(Sqlc);

        switch (managerid.Count)  //依舊arraylist裡面有幾個,來判斷走那條flow
        {

            case 1:
                e.NextNode = flow.sharflow12_2Node1;
                break;

            case 2:
                e.NextNode = flow.sharflow12_2Node2;
                break;

            case 3:
                e.NextNode = flow.sharflow12_2Node4;
                break;
            case 4:
                e.NextNode = flow.sharflow12_2Node7;
                break;

            case 5:
                e.NextNode = flow.sharflow12_2Node11;
                break;
            case 6:
                e.NextNode = flow.sharflow12_2Node16;
                break;
            case 7:
                e.NextNode = flow.sharflow12_2Node22;
                break;
            case 8:
                e.NextNode = flow.sharflow12_2Node29;
                break;
            case 9:
                e.NextNode = flow.sharflow12_2Node37;
                break;
            case 10:
                e.NextNode = flow.sharflow12_2Node46;
                break;
        }

        string purl = "";
        // e.NextNode.ReviewerURL = "/PManagement/DocControlView.aspx";
        if (FIELD_tc_cba01.Text.Substring(0, 1) == "1")
        {
            e.NextNode.ReviewerURL = "/ERP_CBGI014/CBGI014View.aspx";
             purl = "http://eip.minaik.com.tw" + Request.RawUrl.ToLower().Replace("edit", "view");

        }
        else
        {
            e.NextNode.ReviewerURL = "/ERP_CBGI014/CBGI014_AccView.aspx";
              purl = "http://eip.minaik.com.tw/ERP_CBGI014/CBGI014_AccView.aspx";

        }
        count = 0;
        foreach (string i in managerid)  //將簽核人員id塞進flow
        {
            this.FlowClient1.AddParameter("USER" + count.ToString(), i);
            count++;
        }

        count = 0;

        foreach (string i in managernm)  //將簽核人員職稱塞進flow
        {
            this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
            count++;
        }


        //回寫單據狀泰
        string Sql = "update [EIPB].[dbo].[CBGI014_Head] set   status='Y' where  rowid='" + Request.QueryString["rowid"] + "'";
        takedata.RunIUSql(Sql);

      // Response.Write("select name,email from dguser where id='" + managerid[0].ToString() + "'");
        //通知審核者
       js.Open("select name,email from dguser where id='" + managerid[0].ToString() + "'");
        if (!js.EOF)
        {
            string snmemo = FIELD_sn.Text + "-" + FIELD_tc_cba00.Text + "-" + FIELD_ver.Text+"-"+FIELD_tc_cba01.Text ;



            //Response.Write("<br>" + snmemo);
            MailLayout SenReq = new MailLayout();
           
            //Response.Write("<br>" + purl);
            ShrFlowMail Backsend = new ShrFlowMail();
            Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}",FlowClient1.Text, FIELD_sn.Text,
                 js[0].ToString(), js[1].ToString(), purl, "");

        }
        js.Close();
        

        //通知代理人機制
        //  DeputyApprove(managerid[0].ToString());

        displayfile(false);




        BUTTON_save.Enabled = false;
        


        ButStop.Visible = true;

        PopupUser1.Visible = false;
        Label3.Visible = false;
    }

    
    protected void ButStop_Click(object sender, EventArgs e)
    {
        this.BUTTON_save.Visible = true;
        DBTransfer takedata = new DBTransfer();
        string Sql = "update [EIPB].[dbo].[CBGI014_Head] set   status='N' where  rowid='" + Request.QueryString["rowid"] + "'";
        takedata.RunIUSql(Sql);
        Sql = "delete  from  dgflowqueue where  requesturl='" + Request.RawUrl.ToString().Trim() + "'";
        //Response.Write(Sql);

        takedata.RunIUSql(Sql);
        //Response.Write(Sql);
        //發信給 該審核點

        StopProcess(Request.QueryString[0]);




        this.AddInformation(this, "BUTTON_StopRequest_Click()", "", "已經中止完畢!");
        BUTTON_save.Enabled = true;

        // BUTTON_StopRequest.Enabled = true;

        PopupUser1.Visible = true;
        Label3.Visible =   true;

        BUTTON_save.Visible = true;
        InputButton1.Visible = true;


        PopupUser1.Text = takedata.GetTopfile("select c.id  from EIPA.dbo.dguser " +
            " a left join dggroup b on   a.gid=b.id  " +
            " left join dguser c on b.uid=c.id   where a.id='" + this.CurrentUser.ID + "'");
        displayfile(true);
        
    }

    private void StopProcess(string rowid)
    {

        string snmemo = FIELD_sn.Text + "-" + FIELD_tc_cba00.Text + "-" + FIELD_ver.Text + "-" + FIELD_tc_cba01.Text;

        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        ds.Open("SELECT   revieweruid,name,email  FROM   dgflowqueue a   left join dguser b  " +
            " on revieweruid=b.id  where requesturl like '%" + rowid + "%'" +
            "  and resulttype is null and revieweruid!='00000000-0000-0000-0000-000000000000'");
        if (!ds.EOF)
        {

            string MId = "{bb281614-d041-46f9-bee2-76370f440053}";
            string PapCaption = "固定資產預算申請單";
            string PID = snmemo;
            string receivername = ds["name"].ToString();
            string requesturl = "http://eip.minaik.com.tw/ERP_CBGI014/CBGI014Edit.aspx?rowid=" + Request.QueryString[0];
            string AppMail = ds["email"].ToString();
            string body = "";
            string requestername = this.CurrentUser.Name.ToString();

            ShrFlowMail ActRem = new ShrFlowMail();
            ActRem.StopApprove(MId, PID, PapCaption, receivername, requestername, requesturl, "中止", body, "herzog.lin@minaik.com.tw");
            ActRem.StopApprove(MId, PID, PapCaption, receivername, requestername, requesturl, "中止", body, AppMail);


        }
    }
    protected void BUTTON_RemindReviewer_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
    {




    }




    //退回ERP
    protected void InputButton1_Click(object sender, EventArgs e)
    {
        string FMainnm = "";
        string M1 = "";
         string M2 = "";
         string M3 = "";
         string M4 = FIELD_tc_cba01.Text.Substring(0, 1);
        SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        ds.Open("select *  from  [EIPB].[dbo].[CBGI014_Head] where rowid='"+Request.QueryString[0]+"'");
        if (!ds.EOF)
        {

            FMainnm = ds["plantid"].ToString() + "_cbgi014_" + ds["tc_cba00"].ToString() + "_" + ds["tc_cba01"].ToString() + "_" + M4 + ".txt";
            M1 = ds["plantid"].ToString();
            M2=ds["tc_cba00"].ToString();
            M3 = ds["tc_cba01"].ToString();
           
        }
        ds.Close();
        string T = "R";
      //  string FMainnm = FIELD_PlantID.Text.Trim() + "_cbgi014-" + FIELD_pmcano.Text.Trim() + ".txt";


        //傳簽核退回的TXT給ERP  "MINAIK","cbgi014","16A1","13110","1","R"
        FileStream fs = new FileStream(@"D:\\CBGI014_XML\\4GL\\" + FMainnm, FileMode.Create, FileAccess.Write);
        StreamWriter sw = new StreamWriter(fs);
        sw.WriteLine("\"" + M1 + "\",\"cbgi014\",\"" + M2 + "\",\"" + M3 + "\",\"" + M4 + "\",\"" + T + "\"");
       // Response.Write("\"" + M1 + "\",\"cbgi014\",\"" + M2 + "\",\"" + M3 + "\",\"" + M4 + "\",\"" + T + "\"");

        sw.Close();
        fs.Close();
         Upload("D:\\CBGI014_XML\\4GL\\" + FMainnm, "ftp://192.168.0.250/" + FMainnm, "4gl", "4gl");
         
    }

    //將ERP的TXT檔案上傳
    internal bool Upload(string fileName, string uploadUrl, string UserName, string Password)
    {
        // fileName上傳的檔案 ex : c:\abc.xml , 
        // uploadUrl上傳的FTP伺服器路徑 ftp://127.0.0.1/檔名
        // UserName使用者FTP登入帳號 , 
        // Password使用者登入密碼

        Stream requestStream = null;
        FileStream fileStream = null;
        FtpWebResponse uploadResponse = null;
        try
        {
            FtpWebRequest uploadRequest = (FtpWebRequest)WebRequest.Create(uploadUrl);
            uploadRequest.Method = WebRequestMethods.Ftp.UploadFile;//設定Method上傳檔案
            uploadRequest.Proxy = null;
            if (UserName.Length > 0)//如果需要帳號登入
            {
                NetworkCredential nc = new NetworkCredential(UserName, Password);
                uploadRequest.Credentials = nc; //設定帳號
            }
            requestStream = uploadRequest.GetRequestStream();
            fileStream = File.Open(fileName, FileMode.Open);
            byte[] buffer = new byte[1024];
            int bytesRead;
            while (true)
            {//開始上傳資料流
                bytesRead = fileStream.Read(buffer, 0, buffer.Length);
                if (bytesRead == 0)
                    break;
                requestStream.Write(buffer, 0, bytesRead);
            }
            requestStream.Close();
            uploadResponse = (FtpWebResponse)uploadRequest.GetResponse();
            return true;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            if (uploadResponse != null)
                uploadResponse.Close();
            if (fileStream != null)
                fileStream.Close();
            if (requestStream != null)
                requestStream.Close();
        }
    }
    //檔案上傳


    protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
    {
        try
        {
            SmoothEnterprise.Web.UI.HTMLControl.InputText it2;
            object obj2 = this.FlowFeedbackViewer1.HistoryView.FindControl("S_Comment");

            it2 = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj2;
            it2.Enabled = true;
            it2.ReadOnly = true;
            it2.Text = (string)e["Flow_Comment"];



            System.Web.UI.WebControls.Image sin1;
            object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
            sin1 = (System.Web.UI.WebControls.Image)obj5;

            System.Web.UI.WebControls.Image sin2;
            object obj6 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image2");
            sin2 = (System.Web.UI.WebControls.Image)obj6;


            if ((string)e["IniReviewer"].ToString().Length.ToString() == "0") sin2.Visible = false;
            else sin2.Visible = true;

            //Response.Write((string)e["InputText3"].ToString() + "--");
            sin1.Visible = false;  //default image 為Visable=false;
            if ((string)e["InputText3"].ToString().Length.ToString() != "0")
            {
                //判斷圖檔是否存在
                string strupp = "";  //接 歷史的審核人員 logonid
                DirectoryInfo di = new DirectoryInfo("C:\\Inetpub\\E_Portal1\\image");
                FileInfo[] fi = di.GetFiles();
                foreach (FileInfo fiTemp in fi)
                {
                    strupp = (string)e["InputText3"] + ".jpg";
                    //資料一律轉成大寫
                    if (fiTemp.Name.ToUpper() == strupp.ToUpper())
                    {
                        sin1.Visible = true;
                        break;

                    }
                }


            }
            sin1.ImageUrl = "~/image/" + (string)e["InputText3"] + ".JPG";


        }
        catch { }
    }

    //test
    protected void InputButton2_Click(object sender, EventArgs e)
    {
        SmoothEnterprise.Database.DataSet js = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        js.Open("select name,email from dguser where logonid='herzog.lin'");
        if (!js.EOF)
        {
            string snmemo = FIELD_sn.Text + "-" + FIELD_tc_cba00.Text + "-" + FIELD_tc_cba01.Text + "-" + FIELD_ver.Text;



            Response.Write("<br>" + snmemo);
            MailLayout SenReq = new MailLayout();
            string purl = "http://eip.minaik.com.tw" + Request.RawUrl.ToLower().Replace("edit", "view");

            Response.Write("<br>" + purl);
            ShrFlowMail Backsend = new ShrFlowMail();
            Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}",FlowClient1.Text, FIELD_sn.Text,
                 js[0].ToString(), js[1].ToString(), purl, "");

        }
        js.Close();
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            GridViewAddFooter("加總", e);
        }

    }


    internal void GridViewAddFooter(string _strFooterName, GridViewRowEventArgs _gd)
    {
        int co = _gd.Row.Cells.Count;
        TableCellCollection tc = _gd.Row.Cells;
        tc.Clear();
        TableCell tc1;
        for (int i = 0; i < co; i++)
        {
            if (i == 0)
            {
                tc1 = new TableCell();
                tc1.Text = _strFooterName;
                tc.Add(tc1);
            }
            else
            {
                tc.Add(new TableCell());
            }
        }
        _gd.Row.BackColor = System.Drawing.Color.Chocolate;
        _gd.Row.ForeColor = System.Drawing.Color.White;
    }


    internal void GridViewAddFooter_Sum(GridView _gd)
    {
        double sum = 0;
        if (_gd.Rows.Count > 0)
        {
            for (int i = 2; i < _gd.Rows[0].Cells.Count; i++)
            {
                sum = 0;
                if (i.ToString() != "15")
                {
                    for (int j = 0; j < _gd.Rows.Count; j++)
                    {
                        sum +=double.Parse(_gd.Rows[j].Cells[i].Text); 
                            
                       //     int.Parse(_gd.Rows[j].Cells[i].Text);
                        // sum += int.Parse(_gd.Rows[j].Cells[i].Text, NumberStyles.AllowThousands | NumberStyles.AllowDecimalPoint | NumberStyles.AllowLeadingSign);
                    }
                    _gd.FooterRow.Cells[i].Text = sum.ToString("n");
                }
            }
        }
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        GridViewAddFooter_Sum(GridView1);
    }
    protected void InputButton3_Click(object sender, EventArgs e)
    {
           string newsn = FIELD_sn.Text + "-" + FIELD_tc_cba00.Text + "-" + FIELD_ver.Text + "-" + FIELD_tc_cba01.Text;

            string purl = "";
            if (FIELD_tc_cba01.Text.Substring(0, 1) == "1") purl = "http://eip.minaik.com.tw" + Request.RawUrl.ToLower().Replace("edit", "view");
            else
               purl = "http://eip.minaik.com.tw/ERP_CBGI014/CBGI014_AccView.aspx?rowid="+Request.QueryString[0].ToString();

            
        
        
        
            SmoothEnterprise.Database.DataSet js = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

            js.Open("SELECT top 1 b.name,email FROM [EIPA].[dbo].[dgflowqueue] a left join dguser b "+
                "  on revieweruid=b.id   where requesturl like '%"+Request.QueryString[0]+"%' order by a.initdate desc");
            if (!js.EOF)
            {


               // Response.Write("SELECT top 1 b.name,email FROM [EIPA].[dbo].[dgflowqueue] a left join dguser b " +
               // "  on revieweruid=b.id   where requesturl like '%" + Request.QueryString[0] + "%' order by a.initdate desc");
               // string purl = "http://eip.minaik.com.tw" + Request.RawUrl.ToLower().Replace("edit", "view");

                ShrFlowMail Backsend = new ShrFlowMail();
                Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", FlowClient1.Text, newsn,
                js[0].ToString(), "herzog.lin@minaik.com.tw", purl, FlowClient1.Text);

                Backsend.SendMail("{166f4599-5482-4137-8060-eb1b2b82bbdb}", FlowClient1.Text, newsn,
                    js[0].ToString(), js[1].ToString(), purl, FlowClient1.Text);

                Response.Write("<script>alert( '已經通知 "+js[0].ToString()+"先生/小姐 進行審核');</script>");


            }
            js.Close();
    }
}
}