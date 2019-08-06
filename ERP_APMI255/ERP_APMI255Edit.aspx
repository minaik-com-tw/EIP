<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ERP_APMI255Edit.aspx.cs" Inherits="ERP_APMI255.ERP_APMI255Edit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="SmoothEnterpriseControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script language="javascript"  type="text/javascript" src="<%=ResolveClientUrl("~/sub.js")%>"></script>
    <script language="javascript"  type="text/javascript"">
         
            var allowed_attachments = 5 - 1;
		  var count_attachments = 0 + 1;
		  function addfile()
         {
		  
		    if (allowed_attachments <= 0)
		    {
		        return false;
		    }
		    else
		    {		    
		        count_attachments = count_attachments + 1 ;
		        var attid = "attach"+count_attachments;
                //alert(attid);
		  
                //var uploadfiles=document.getElementById("uploadfiles"),
　　　　        str = '<SmoothEnterpriseWebControl:InputFile runat="server" onchange="addfile()" BackColor="#F0F0F0" CssClass="Normal"> <Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputFile><br />';
　　　　        document.getElementById('uploadfiles').insertAdjacentHTML("beforeEnd",str)
                //uploadfiles.innerHTML+=str;
                allowed_attachments = allowed_attachments - 1;
            
                return false;
            }    
         }
         
 function j1(){ 

    
    if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_lsend").value.length==0)
    {
        alert('直屬主管請勿空白')
        return false;  
    }
//    var aa=document.getElementById("ctl00_ContentPlaceHolder1_FIELD_pmiuser").value
//    var aa2=(aa.substr(0,2));  //截取ERP開頭以判斷廠別
//    var bb=document.getElementById("ctl00_ContentPlaceHolder1_FIELD_flowstatus").value
//    var bb2=(bb.substr(0,1));  //截取ERP開頭以判斷廠別
//    alert(aa2);
//    alert(bb2);
////    if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_mpru").value.length==0 && bb2=="1" && aa2 == "EF")
////    {
////        alert('跨廠採購人員請勿空白 或 請確認跨廠採購人員是否正確!')
////        return false;  
////    }
////alert(aa2)
}
     
</script>  

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="ERP_APMI255 Edit Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor><center>
                    <asp:Image ID="Image1" runat="server" Height="29px" ImageUrl="~/ERP_AXMT610/minaik.gif"
                        Width="32px" /><asp:Label ID="FIELD_CompanyName" runat="server" Font-Bold="True" Font-Names="新細明體"
                        Text="Label"></asp:Label>
    <br />
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="新細明體" meta:resourcekey="Label6Resource1"
                        Text="採購核價申請單"></asp:Label></center>
    <center>
        &nbsp;</center>
    <table>
        <tr style="font-family: Arial">
            <td style="width: 1000px">
                <table border="1" bordercolor="gainsboro" cellpadding="0" cellspacing="0" style="width: 1000px;
                    border-collapse: collapse">
                    <tr>
                        <td style="height: 20px; background-color: whitesmoke">
                            <img height="15" src="img/award_star_gold_2.png" width="15" />
                            <asp:Label ID="Label9" runat="server" CssClass="NormalBold" meta:resourcekey="Label9Resource1"
                                Text="E  R  P    資   訊"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 76px">
                            <table style="width: 996px; height: 113px">
                                <tr>
                                    <td style="width: 14px; height: 10px">
                                    </td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label1Resource1"
                                            Text="單號編號"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_no" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pmk04" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_pmk04Resource1" Text="核價單日期"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_pmi02" runat="server" CssClass="Normal" ErrorMessage="Please Input「Pmi02」!!" MaxLength="0"  FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="LABEL_pmc03" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_pmc03Resource1" Text="廠商"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmi03" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pmc03_0"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 14px; height: 10px">
                                    </td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pmk01" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_pmk01Resource1" Text="ERP核價單號"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmi01" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pme031_1" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_pme031_1Resource1" Text="分量計價"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmi05" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="LABEL_l_amt2" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            ForeColor="Black" meta:resourcekey="LABEL_l_amt2Resource1" Text="簽核流程"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_flowstatus" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 14px; height: 10px">
                                    </td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label12" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label12Resource1"
                                            Text="廠區"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_plantid" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pmk21" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            Text="稅別/稅率"></asp:Label></td>
                                    <td style="width: 145px; height: 10px"><SmoothEnterpriseWebControl:InputText ID="FIELD_pmi08" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="71px">
                                        <ErrorStyle BorderStyle="NotSet" />
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pmi081"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="71px">
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="LABEL_gen02_3" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_gen02_3Resource1" Text="資料所有者"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmiuser" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_gen02_1"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 14px; height: 10px">
                                    </td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_gem02_4" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_gem02_4Resource1" Text="資料所有者部門"></asp:Label></td>
                                    <td style="width: 145px; height: 10px"><SmoothEnterpriseWebControl:InputText ID="FIELD_pmigrup" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="71px">
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_gem02_2"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="71px">
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label22Resource1"
                                            Text="ERP備註"></asp:Label></td>
                                    <td style="width: 145px; height: 10px"><SmoothEnterpriseWebControl:InputText ID="FIELD_pmi04" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Height="17px">
                                        <ErrorStyle BorderStyle="NotSet" />
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label2Resource1"
                                            Text="單據狀態"></asp:Label></td>
                                    <td style="width: 145px; height: 10px"><SmoothEnterpriseWebControl:InputText ID="InputText1" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Height="17px">
                                        <ErrorStyle BorderStyle="NotSet" />
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                            </table>
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1"
                                Font-Size="Small" ForeColor="Black" GridLines="Vertical" Height="53px" PageSize="5"
                                Width="1200px" OnRowCreated="GridView1_RowCreated">
                                <RowStyle BorderColor="Black" Font-Size="Smaller" Height="5px" Wrap="False" />
                                <EmptyDataRowStyle Wrap="False" />
                                <Columns>


                                    <asp:BoundField DataField="pmj02" HeaderText="項次" SortExpression="pmj02" meta:resourcekey="pmj02" />
                                   <asp:TemplateField > 

                                         <ItemTemplate> 
                                        <a href="javascript:void(window.open('http://eip.minaik.com.tw/ERP_APMI255/APMI255_Report.aspx?id=<%#Eval("id")%>&item=<%#Eval("pmj02")%>','_blank','height=400, width=700,toolbar=no,menubar=no'))"> <asp:Image ID="Image1" runat="server" ImageUrl='chart_bar.png'/> </a>
                                         </ItemTemplate>

                                    </asp:TemplateField> 
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server"  ImageUrl='<%# Eval("img1")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    


                                    <asp:BoundField DataField="pmj03" HeaderText="料號" SortExpression="pmj03" meta:resourcekey="pmj03"  />
                                    <asp:BoundField DataField="pmj031" HeaderText="品名" SortExpression="pmj031" meta:resourcekey="pmj031" />
                                    <asp:BoundField DataField="pmj032" HeaderText="規格" SortExpression="pmj032" meta:resourcekey="pmj032" />
                                    <asp:BoundField DataField="pmj05" HeaderText="幣別" SortExpression="pmj05" meta:resourcekey="pmj05" />
                                    <asp:BoundField DataField="pmj06" HeaderText="原單價" SortExpression="pmj06" meta:resourcekey="pmj06" />
                                    <asp:BoundField DataField="pmj06t" HeaderText="原含稅單價" SortExpression="pmj06t" meta:resourcekey="pmj06t" />
                                    <asp:BoundField DataField="pmj07" HeaderText="新單價" SortExpression="pmj07" meta:resourcekey="pmj07" >
                                        <HeaderStyle ForeColor="OrangeRed" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pmj07t" HeaderText="新含稅單價" SortExpression="pmj07t" meta:resourcekey="pmj07t" >
                                        <HeaderStyle ForeColor="OrangeRed" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pmj08" HeaderText="原核准日" SortExpression="pmj08" meta:resourcekey="pmj08" />
                                    <asp:BoundField DataField="pmj09" HeaderText="新生效日起" ReadOnly="True" SortExpression="pmj09" meta:resourcekey="pmj09" />
                                    <asp:BoundField DataField="ta_pmj01" HeaderText="新生效日迄" ReadOnly="True" SortExpression="ta_pmj01" meta:resourcekey="ta_pmj01" />
                                    <asp:BoundField DataField="ima491" HeaderText="LT" SortExpression="ima491" meta:resourcekey="ima491" />
                                    <asp:BoundField DataField="ima46" HeaderText="最少採購量" SortExpression="ima46" meta:resourcekey="ima46" />
                                    <asp:BoundField DataField="pmr03" HeaderText="數量起" SortExpression="pmr03" meta:resourcekey="pmr03" />
                                    <asp:BoundField DataField="pmr04" HeaderText="數量迄" SortExpression="pmr04" meta:resourcekey="pmr04" />
                                    <asp:BoundField DataField="pmr05" HeaderText="單價" SortExpression="pmr05" meta:resourcekey="pmr05" >
                                        <HeaderStyle ForeColor="OrangeRed" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pmr05t" HeaderText="含稅單價" SortExpression="pmr05t" meta:resourcekey="pmr05t" >
                                        <HeaderStyle ForeColor="OrangeRed" />
                                    </asp:BoundField>

                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" Wrap="False" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Wrap="False" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" Wrap="False" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="X-Small" ForeColor="White"
                                    Height="5px" Wrap="True" />
                                <EditRowStyle Wrap="False" />
                                <AlternatingRowStyle BackColor="#CCCCCC" Wrap="False" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
                                SelectCommand="select apmi255_in_head.ID id,img1 ,bno,pmj02,pmj03,pmj031,pmj032,pmj04,pmj05,pmj06,pmj06t,pmj07,pmj07t,pmj08,  pmj09,pmj10,ta_pmj01, ima491,ima46,pmr03,pmr04,pmr05,pmr05t from(select case when pmj06>pmj07 then 'aaa.png' else 'aaa.png' end img1,bno,pmj02,pmj03,pmj031,pmj032,pmj04,pmj05,pmj06,pmj06t,pmj07,pmj07t,pmj08, CONVERT(varchar(12) , pmj09, 111 ) pmj09,pmj10,CONVERT(varchar(12) , ta_pmj01, 111 ) ta_pmj01, ima491,ima46,pmr03,pmr04,pmr05,pmr05t from apmi255_in_body left join apmi255_in_pmr on bno=cno and pmj02=pmr02   left join [EIPB].[dbo].apmi255_in_head on no=bno where bno='P102-12030002'  ) a left join  (select * from csc_attachment) b on a.img1=upname  order by pmr03,pmj02 ">
                            </asp:SqlDataSource>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: whitesmoke">
                            <img height="15" src="img/award_star_gold_2.png" width="15" />
                            <asp:Label ID="Label10" runat="server" CssClass="NormalBold" meta:resourcekey="Label10Resource1"
                                Text="採 購 核 價 維 護"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: white">
                            &nbsp; &nbsp;
                            <asp:Label ID="Label11" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label18" runat="server"
                                    CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label18Resource1" Text="申請人維護"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: white">
                            <table>
                                <tr>
                                    <td style="width: 19px;">
                                    </td>
                                    <td style="width: 118px;">
                                        <asp:Label ID="Label24" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label55Resource1"
                                            Text="是否為急件"></asp:Label></td>
                                    <td colspan="7">
                                        <asp:DropDownList ID="FIELD_quick" runat="server">
                                            <asp:ListItem>N</asp:ListItem>
                                            <asp:ListItem>Y</asp:ListItem>
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 22px">
                                    </td>
                                    <td style="width: 118px; height: 22px">
                                        <asp:Label ID="Label22" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label22Resource1"
                                            Text="備註"></asp:Label></td>
                                    <td colspan="7" style="height: 22px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_rember" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" Width="402px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 19px">
                                    </td>
                                    <td style="width: 118px">
                                        <asp:Label ID="Label23" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label23Resource1"
                                            Text="夾帶檔案"></asp:Label></td>
                                    <td colspan="7"><p id="uploadfiles">
<asp:CheckBoxList id="CheckBoxFile" runat="server" Font-Size="X-Small">
                             </asp:CheckBoxList>
                    <SmoothEnterpriseWebControl:InputFile ID="attach1" onchange="addfile()" runat="server" BackColor="#F0F0F0" CssClass="Normal">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    </SmoothEnterpriseWebControl:InputFile></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 19px">
                                    </td>
                                    <td style="width: 118px">
                                        <asp:Label ID="Label33" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label33Resource1"
                                            Text="直屬主管"></asp:Label></td>
                                    <td colspan="7">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_lsend" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px">
                                    </td>
                                    <td style="width: 118px">
                                        <asp:Label ID="Label34" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label34Resource1"
                                            Text="跨廠採購人員" Visible="False"></asp:Label></td>
                                    <td colspan="7">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_mpru" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" Visible="False">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 25px">
                                    </td>
                                    <td style="width: 118px; height: 25px">
                                    </td>
                                    <td style="width: 145px; height: 25px">
                                    </td>
                                    <td style="width: 100px; height: 25px">
                                    </td>
                                    <td style="width: 145px; height: 25px">
                                    </td>
                                    <td style="width: 100px; height: 25px">
                                    </td>
                                    <td style="width: 145px; height: 25px">
                                    </td>
                                    <td style="width: 81px; height: 25px">
                                    </td>
                                    <td style="width: 157px; height: 25px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px">
    <table border="0" Class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server" TypeName="sharflow12.Flowwork.sharflow121">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                    <Columns>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" CustomKey="" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                    </Columns>
                    <HistoryTemplate>
                        <SmoothEnterpriseWebControl:InputText ID="Show_Comment" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" Width="400px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText><asp:Image ID="Image1" runat="server" />
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 25px">
	<table border="0" Class="Normal">
		<tr>
			<td style="height: 24px">
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;&nbsp;<SmoothEnterpriseWebControlFlowwork:SendRequestButton ID="BUTTON_SendRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px" OnClick="BUTTON_SendRequest_Click">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:SendRequestButton>&nbsp;<SmoothEnterpriseWebControlFlowwork:StopRequestButton ID="BUTTON_StopRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px" OnClick="BUTTON_StopRequest_Click">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:StopRequestButton>&nbsp;<SmoothEnterpriseWebControl:InputButton
                    ID="InputButton1" runat="server" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid"
                    BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                    OnClick="InputButton1_Click" Text="催審" Width="63px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_ERP" runat="server" Text="退回ERP修改" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_ERP_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
			</td>
		</tr>
	</table>
            </td>
        </tr>
    </table>
</asp:Content>