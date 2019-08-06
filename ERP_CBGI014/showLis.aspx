<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %> 
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Drawing" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        DBTransfer ds = new DBTransfer();
        string rowid=ds.GetTopfile(" select rowid from EIPB.dbo.CBGI014_head a  inner join "+
            " (select File_sn,  MAX(ver)-1 ver   from  EIPB.dbo.CBGI014_head "+
            " where File_sn in ( "+
            " select File_sn from  EIPB.dbo.CBGI014_head "+
            " where rowid='"+Request.QueryString["rowid"]+"') "+
            " group by File_sn ) b on a.File_sn=b.File_sn and a.ver=b.ver ");
        gvBind2(GridView2, rowid);


        /* 
        
        
          SELECT  dowid , tc_cbb03,faj31,fajowner,tc_cbb04,tc_cbb05,aag02,tc_cbb22,tc_cbb06,tc_bgx02,tc_cbb07
 ,tc_bgy02,tc_cbb08,fac02,tc_cbb18,tc_cbb09,tc_cbb091,tc_cbb10,tc_cbb11
 ,tc_cbb12,tc_cbb13f,tc_cbb13,tc_cbb14f,tc_cbb14 
 ,tc_cbb19,tc_cbb15,azf03,tc_cbb16
 ,tc_cbb21,tc_cbb17,tc_cbb171,dstatus,d.rowid,mismemo,itemstatus
 ,convert(char(10),faj26,120) faj26
    FROM eipb.dbo.CBGI014_Head a inner join (  
              select requesturl,MAX(reviewdate) date1,RIGHT(requesturl,36) rowid   from EIPA.dbo.dgflowlog where reviewerurl like '%ERP_CBGI014/CBGI014View%' 
                 and  resulttype='Terminate' group by requesturl,RIGHT(requesturl,36))
                b on convert(char(36),a.rowid)=b.rowid 
                inner join (
                select tc_cba00,tc_cba01,tc_cba02,MAX(date1) date1  from  (select requesturl,MAX(reviewdate) date1,RIGHT(requesturl,36) rowid   from EIPA.dbo.dgflowlog where reviewerurl like '%ERP_CBGI014/CBGI014View%' 
                 and  resulttype='Terminate' group by requesturl,RIGHT(requesturl,36))
                 a left join eipb.dbo.CBGI014_Head b on a.rowid=b.rowid
                 group by tc_cba00,tc_cba01,tc_cba02 ) c on a.tc_cba00=c.tc_cba00 
                 and a.tc_cba01=c.tc_cba01 and a.tc_cba02=c.tc_cba02 and b.date1=c.date1
                 left join eipb.dbo.CBGI014_Body d on a.rowid=d.rowid where d.rowid='ab8f4ba7-02d2-4d35-a2ba-12f624ee4b64'
              
         */
        //  Response.Write(rowid);
    }


    private void gvBind2(GridView gv,string rowid)
    {
        SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString);
         string str = "SELECT  dowid ,sn,tc_cbb03,faj31 " +
  ",fajowner,tc_cbb04,tc_cbb05,aag02,tc_cbb22,tc_cbb06,tc_bgx02,tc_cbb07 " +
  ",tc_bgy02,tc_cbb08,fac02,tc_cbb18,tc_cbb09,tc_cbb091,tc_cbb10,tc_cbb11 " +
  ",tc_cbb12,tc_cbb13f,tc_cbb13,tc_cbb14f,tc_cbb14 " +
  ",tc_cbb19,tc_cbb15,azf03,tc_cbb16 " +
  ",tc_cbb21,tc_cbb17,tc_cbb171,dstatus " +
  ",rowid,mismemo,itemstatus " +
  ",convert(char(10),faj26,120) faj26   FROM [EIPB].[dbo].[CBGI014_Body] where  rowid='" + rowid+ "' order by  tc_cbb03 asc  ";
        
     /*   string str = "SELECT  dowid  ,tc_cbb03,faj31 " +
  ",fajowner,tc_cbb04,tc_cbb05,aag02,tc_cbb22,tc_cbb06,tc_bgx02,tc_cbb07 " +
  ",tc_bgy02,tc_cbb08,fac02,tc_cbb18,tc_cbb09,tc_cbb091,tc_cbb10,tc_cbb11 " +
  ",tc_cbb12,tc_cbb13f,tc_cbb13,tc_cbb14f,tc_cbb14 " +
  ",tc_cbb19,tc_cbb15,azf03,tc_cbb16 " +
  ",tc_cbb21,tc_cbb17,tc_cbb171,dstatus " +
  ",d.rowid,mismemo,itemstatus " +
  ",convert(char(10),faj26,120) faj26    FROM eipb.dbo.CBGI014_Head a inner join (  " +
          "   select requesturl,MAX(reviewdate) date1,RIGHT(requesturl,36) rowid   from EIPA.dbo.dgflowlog where reviewerurl like '%ERP_CBGI014/CBGI014View%' "+
            "        and  resulttype='Terminate' group by requesturl,RIGHT(requesturl,36))  "+
          "         b on convert(char(36),a.rowid)=b.rowid  "+
          "         inner join ( "+
         "          select tc_cba00,tc_cba01,tc_cba02,MAX(date1) date1  from  (select requesturl,MAX(reviewdate) date1,RIGHT(requesturl,36) rowid   from EIPA.dbo.dgflowlog where reviewerurl like '%ERP_CBGI014/CBGI014View%'  "+
          "          and  resulttype='Terminate' group by requesturl,RIGHT(requesturl,36)) "+
           "         a left join eipb.dbo.CBGI014_Head b on a.rowid=b.rowid "+
          "          group by tc_cba00,tc_cba01,tc_cba02 ) c on a.tc_cba00=c.tc_cba00  "+
           "         and a.tc_cba01=c.tc_cba01 and a.tc_cba02=c.tc_cba02 and b.date1=c.date1 "+
           "         left join eipb.dbo.CBGI014_Body d on a.rowid=d.rowid "+
           "         where d.rowid='" + rowid + "'";
        */
        // Response.Write(str);
        SqlDataAdapter da = new SqlDataAdapter(str, conn);
        {
            DataTable dt = new DataTable();
            da.Fill(dt);
            gv.DataSource = dt;
            gv.DataBind();



        }


    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="NormalBold"
            Font-Bold="True" Height="40px" PageSize="30"
            Width="100%" Font-Size="X-Small">
            <RowStyle Height="25px" />
            <Columns>
                <asp:BoundField DataField="tc_cbb03" HeaderText="項次" />
                <asp:BoundField DataField="tc_cbb22" HeaderText="類別" />
                <asp:BoundField DataField="tc_cbb10" HeaderText="數量">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="tc_cbb17" HeaderText="財產編號">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="fajowner" HeaderText="目前使用者">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="faj26" HeaderText="購買日期">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="faj31" HeaderText="已使用年限">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="tc_cbb09" HeaderText="預計新購月份">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="azf03" HeaderText="理由">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="tc_cbb16" HeaderText="專案名稱">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="tc_cbb04" HeaderText="型態" />
                <asp:BoundField DataField="tc_cbb05" HeaderText="會科" />
                <asp:BoundField DataField="aag02" HeaderText="科目名稱" />
                <asp:BoundField DataField="tc_cbb08" HeaderText="次類別" />
                <asp:BoundField DataField="fac02" HeaderText="類別名稱" />
                <asp:BoundField DataField="tc_cbb18" HeaderText="耐用月份" />
                <asp:BoundField DataField="itemstatus" HeaderText="核准否" />
                <asp:BoundField DataField="mismemo" HeaderText="MIS說明" />
            </Columns>
            <HeaderStyle BackColor="DimGray" ForeColor="Yellow" Height="30px" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
