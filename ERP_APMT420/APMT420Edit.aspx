<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="APMT420Edit.aspx.cs" Debug="true" Inherits="ERP_APMT420.APMT420Edit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl.Chart" TagPrefix="cc2" %>

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
         
          var allowed_attachments = 6 - 1;
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

    
    if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_acc").value.length==0)
    {
        alert('會計人員請勿空白')
        return false;  
    }
    
    if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_pur").value.length==0)
    {
        alert('採購人員請勿空白')
        return false;  
    }
    if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_lsend").value.length==0)
    {
        alert('直屬主管請勿空白')
        return false;  
    }
}



    </Script>

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
		Caption="APMT420 Edit Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" Class="Normal">
		<tr>
			<td valign="top">
                <table>
                    <tr>


                    </tr>
                    <tr>
                        <td colspan="8">
                            <table>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_no" runat="server" CssClass="NormalBold" Text="單號編號"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_no" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_pmk04" runat="server" CssClass="NormalBold" Text="請購日期"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk04" runat="server" CssClass="PanelWhite"
                                            FormatType="DateTime" ReadOnly="True">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_pmc03" runat="server" CssClass="NormalBold" Text="供應商"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk09" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pmc03"
                                            runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 81px">
                                        <asp:Label ID="LABEL_l_amt1" runat="server" CssClass="NormalBold" Text="原幣總金額" ForeColor="Red"></asp:Label></td>
                                    <td style="width: 157px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_l_amt1" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" ForeColor="Red">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_pmk01" runat="server" CssClass="NormalBold" Text="請購單號"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk01" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_pmk02" runat="server" CssClass="NormalBold" Text="單據性質"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk02" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_pmk06" runat="server" CssClass="NormalBold" Text="預算編號"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk06" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 81px">
                                        <asp:Label ID="LABEL_l_amt2" runat="server" CssClass="NormalBold" Text="本幣總金額" ForeColor="Red"></asp:Label></td>
                                    <td style="width: 157px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_l_amt2" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" ForeColor="Red">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; height: 23px">
                                        <asp:Label ID="LABEL_pma02_8" runat="server" CssClass="NormalBold" Text="付款條件"></asp:Label></td>
                                    <td style="width: 145px; height: 23px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk20" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pma02_8"
                                            runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 100px; height: 23px">
                                        <asp:Label ID="LABEL_ta_pmk01" runat="server" CssClass="NormalBold" Text="訂單單號"></asp:Label></td>
                                    <td style="width: 145px; height: 23px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_pmk01" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 100px; height: 23px">
                                        <asp:Label ID="LABEL_gem02_5" runat="server" CssClass="NormalBold" Text="收貨部門"></asp:Label></td>
                                    <td style="width: 145px; height: 23px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk14" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_gem02_5"
                                            runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 81px; height: 23px">
                                        <asp:Label ID="LABEL_gen02_3" runat="server" CssClass="NormalBold" Text="請購人員"></asp:Label></td>
                                    <td style="width: 157px; height: 23px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk12" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_gen02_3"
                                            runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_oah02_9" runat="server" CssClass="NormalBold" Text="價格條件"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_oah02_9" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pmk41"
                                            runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_pmk22" runat="server" CssClass="NormalBold" Text="幣別匯率"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk22" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pmk42"
                                            runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_gen02_6" runat="server" CssClass="NormalBold" Text="確認人"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk15" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_gen02_6"
                                            runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 81px">
                                        <asp:Label ID="LABEL_gem02_4" runat="server" CssClass="NormalBold" Text="請購部門"></asp:Label></td>
                                    <td style="width: 157px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_gem02_4" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pmk13"
                                            runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_pmk21" runat="server" CssClass="NormalBold" Text="稅別稅率"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk21" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pmk43"
                                            runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_pme031_1" runat="server" CssClass="NormalBold" Text="送貨地址"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk10" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pme031_1"
                                            runat="server" CssClass="PanelWhite" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 100px">
                                        <asp:Label ID="LABEL_pme031_2" runat="server" CssClass="NormalBold" Text="發票地址"></asp:Label></td>
                                    <td style="width: 145px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmk11" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pme031_2" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 81px">
                                        <asp:Label ID="LABEL_status" runat="server" CssClass="NormalBold" Text="單據狀態"></asp:Label></td>
                                    <td style="width: 157px">
                                        &nbsp;<SmoothEnterpriseWebControl:InputText ID="FIELD_status" runat="server" CssClass="PanelWhite"
                                            ReadOnly="True">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                            </table>
                            <hr />
                            <center>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="bno,pml02"
                                    DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="53px"
                                    PageSize="5" Font-Size="Small" Width="1200px">
                                    <RowStyle BorderColor="Black" Font-Size="Smaller" Height="5px" Wrap="False" />
                                    <Columns>
                                        <asp:BoundField DataField="pml02" HeaderText="項次" ReadOnly="True" SortExpression="pml02" />
                                        <asp:BoundField DataField="pml04" HeaderText="料號" SortExpression="pml04">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml041" HeaderText="品名" SortExpression="pml041">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml07" HeaderText="單位" SortExpression="pml07">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml20" HeaderText="請購量" SortExpression="pml20">
                                            <HeaderStyle Wrap="True" ForeColor="Red" />
                                            <ItemStyle Wrap="True" />
                                            <FooterStyle ForeColor="Red" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml31" HeaderText="原幣單價" SortExpression="pml31">
                                            <HeaderStyle Wrap="False" ForeColor="Red" />
                                            <ItemStyle Wrap="False" />
                                            <FooterStyle ForeColor="Red" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml88" HeaderText="本幣金額" SortExpression="pml88">
                                            <HeaderStyle Wrap="False" ForeColor="Red" />
                                            <ItemStyle Wrap="False" />
                                            <FooterStyle ForeColor="Red" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml40" HeaderText="會科" SortExpression="pml40">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="aag02" HeaderText="會科名稱" SortExpression="aag02">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml67" HeaderText="部門編號" SortExpression="pml67">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gem02" HeaderText="部門名稱" SortExpression="gem02">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml06" HeaderText="備註" SortExpression="pml06">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ta_pml05" HeaderText="固資碼" SortExpression="ta_pml05">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="ta_pml01" HeaderText="技術代碼" SortExpression="ta_pml01">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="ta_pml02" HeaderText="自製代碼" SortExpression="ta_pml02">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="ta_pml06" HeaderText="產品保固" SortExpression="ta_pml06">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fab02" HeaderText="主類別" SortExpression="fab02">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fac02" HeaderText="次類別" SortExpression="fac02">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ta_pml09" HeaderText="耐用年限" SortExpression="ta_pml09">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ta_pml10" HeaderText="殘值" SortExpression="ta_pml10">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml33" HeaderText="交貨date" SortExpression="pml33">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml34" HeaderText="到廠date" SortExpression="pml34">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pml35" HeaderText="到庫date" SortExpression="pml35">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ta_pml11" HeaderText="簽呈號碼" SortExpression="ta_pml11">
                                            <HeaderStyle Wrap="True" />
                                            <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="apb10_sum" HeaderText="已採購金額" SortExpression="apb10_sum">
                                         <HeaderStyle Wrap="True" />
                                         <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="oea01" HeaderText="來源號碼" SortExpression="oea01">
                                         <HeaderStyle Wrap="True" />
                                         <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="oqa13" HeaderText="材料金額" SortExpression="oea01">
                                         <HeaderStyle Wrap="True" />
                                         <ItemStyle Wrap="True" />
                                        </asp:BoundField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" Wrap="False" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Wrap="False" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" Wrap="False" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="X-Small" ForeColor="White"
                                        Height="5px" Wrap="True" />
                                    <AlternatingRowStyle BackColor="#CCCCCC" Wrap="False" />
                                    <EmptyDataRowStyle Wrap="False" />
                                    <EditRowStyle Wrap="False" />
                                </asp:GridView>
                                <asp:HiddenField ID="HFCAP1" runat="server" />
                            
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
                                SelectCommand="SELECT [bno], [pmk01], [pml02], [pml04], [pml041], [pml41], [pml20], [pml07], [ima021], [pml12], [pml121], [pml122], [pml40], [aag02], [pml67], [gem02], [pml06], [pml31], [pml88], [ta_pml05], [ta_pml01], [ta_pml02],  CONVERT(varchar(12) , pml33, 111 ) pml33,CONVERT(varchar(12) , pml34, 111 ) pml34,CONVERT(varchar(12) , pml35, 111 ) pml35 FROM [APMT420_IN_BODY]">
                            </asp:SqlDataSource>
                            </center>
                        </td>
                    </tr>
                </table>
                <hr /><table border="0" >
                    <tbody>
                        <tr>
                            <td style="width: 178px">
                                <asp:Label ID="LABEL_pma02_81" runat="server" CssClass="NormalBold" Text="請選擇夾帶檔案"></asp:Label></td>
                            <td>
                                                    <div id="afterBegin"> </div>
                    <p id="uploadfiles">
                    <SmoothEnterpriseWebControl:InputFile ID="attach1" onchange="addfile()" runat="server" BackColor="#F0F0F0" CssClass="Normal">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    </SmoothEnterpriseWebControl:InputFile>
                    </p></td>
                            <td style="width: 98px">
                                <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Text="己夾帶檔案"></asp:Label></td>
                            <td style="width: 410px">
                                <asp:Panel ID="Panel2" runat="server">
                                <table style="border-top-style: none; border-right-style: none; border-left-style: none;
                                    border-bottom-style: none">
                                    <tr>
                                        <td align="center" style="width: 50px; background-color: black; height: 1px;">
                                            <asp:Label ID="Label5" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="White"
                                                Text="刪除檔案"></asp:Label></td>
                                        <td style="background-color: black; height: 1px;" align="center">
                                            <asp:Label ID="Label4" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="White"
                                                Text="檔案名稱" Height="16px" Width="50px"></asp:Label></td>
                                        <td align="center" style="width: 50px; height: 1px; background-color: black">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 50px; height: 22px">
                                            <asp:CheckBox ID="FIELD_attachmentr1"
                                    runat="server" CssClass="Normal" /></td>
                                        <td style="height: 22px">
                                <asp:Literal ID="FIELD_attachmentd1" runat="server"></asp:Literal></td>
                                        <td align="center" style="width: 50px; height: 22px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 50px">
                                            <asp:CheckBox ID="FIELD_attachmentr2" runat="server"
                                            CssClass="Normal" /></td>
                                        <td>
                                            <asp:Literal ID="FIELD_attachmentd2"
                                        runat="server"></asp:Literal></td>
                                        <td align="center" style="width: 50px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 50px">
                                            <asp:CheckBox
                                                ID="FIELD_attachmentr3" runat="server" CssClass="Normal" /></td>
                                        <td>
                                            <asp:Literal ID="FIELD_attachmentd3" runat="server"></asp:Literal></td>
                                        <td align="center" style="width: 50px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 50px">
                                            <asp:CheckBox ID="FIELD_attachmentr4"
                                                        runat="server" CssClass="Normal" /></td>
                                        <td>
                                            <asp:Literal
                                                    ID="FIELD_attachmentd4" runat="server"></asp:Literal></td>
                                        <td align="center" style="width: 50px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 50px">
                                            <asp:CheckBox ID="FIELD_attachmentr5" runat="server"
                                                                CssClass="Normal" /></td>
                                        <td>
                                            <asp:Literal ID="FIELD_attachmentd5"
                                                            runat="server"></asp:Literal></td>
                                        <td align="center" style="width: 50px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 50px">
                                            <asp:CheckBox ID="FIELD_attachmentr6" runat="server"
                                                                CssClass="Normal" /></td>
                                        <td>
                                            <asp:Literal ID="FIELD_attachmentd6"
                                                            runat="server"></asp:Literal></td>
                                        <td align="center" style="width: 50px">
                                        </td>
                                    </tr>
                                </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 178px">
                                <asp:Label ID="Label7" runat="server" CssClass="NormalBold" Text="是否為急件"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="FIELD_quick" runat="server">
                                    <asp:ListItem>N</asp:ListItem>
                                    <asp:ListItem>Y</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 98px">
                            </td>
                            <td style="width: 410px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 178px">
                                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="是否為電腦類"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="FIELD_computer" runat="server">
                                    <asp:ListItem>N</asp:ListItem>
                                    <asp:ListItem>Y</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 98px">
                                <asp:Label ID="Label6" runat="server" CssClass="NormalBold" Text="軟硬體申請單號"></asp:Label></td>
                            <td style="width: 410px">
                                    <SmoothEnterpriseWebControl:InputText ID="FIELD_computer_no" runat="server" BackColor="#F0F0F0"
                                        ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                        ErrorMessage="Please Input「REMARK」!!" FocusColor="" FormatType="None" HiddenMode="False"
                                        HTMLMode="Advance" IsValid="True" MaxLength="100" meta:resourcekey="FIELD_REMARKResource1"
                                        OnClickMore="" Personalize="False" Required="False" Width="100px">
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td style="width: 178px">
                                <asp:Label ID="Label8" runat="server" CssClass="NormalBold" Height="33px" Text="是否購買化學品或氣體或是外包廠商入廠維修"
                                    Width="176px"></asp:Label></td>
                            <td colspan="3">
                                <asp:DropDownList ID="FIELD_chemistry" runat="server">
                                    <asp:ListItem>N</asp:ListItem>
                                    <asp:ListItem>Y</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 178px">
                                <asp:Label ID="LABEL_oah02_91" runat="server" CssClass="NormalBold" Text="請選擇會計人員"></asp:Label></td>
                            <td colspan="3">
                                <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_acc" runat="server" BackColor="#F0F0F0"
                                    CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                    Gradient-GradientType="Top" ValueField="id" Enabled="False">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    <ErrorStyle BorderStyle="NotSet" />
                                </SmoothEnterpriseWebControlEnterprise:PopupUser>
                                <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 178px">
                                <asp:Label ID="LABEL_pme031_11" runat="server" CssClass="NormalBold" Text="請選擇採購人員"></asp:Label></td>
                            <td colspan="3">
                                <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_pur" runat="server" BackColor="#F0F0F0"
                                    CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                    Gradient-GradientType="Top" ValueField="id">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                        </tr>
                        <tr>
                            <td style="width: 178px">
                                <asp:Label ID="LABEL_pme031_21" runat="server" CssClass="NormalBold" Text="請選擇資訊人員"></asp:Label></td>
                            <td colspan="3">
                                <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_mis" runat="server" BackColor="#F0F0F0"
                                    CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                    Gradient-GradientType="Top" ValueField="id">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                        </tr>
                        <tr>
                            <td style="width: 178px">
                                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="請選擇直屬主管"></asp:Label></td>
                            <td colspan="2">
                                <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_lsend" runat="server" BackColor="#F0F0F0"
                                    CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                    Gradient-GradientType="Top" ValueField="id">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    <ErrorStyle BorderStyle="NotSet" />
                                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                        </tr>
                        <tr>
                            <td style="width: 178px">
                            
                                <asp:Label ID="Label11" runat="server" CssClass="NormalBold" Text="請選擇跨部門主管主管" Width="135px"></asp:Label></td>
                            <td colspan="3" id="xxx">
                                &nbsp;
                                <table>
                                    <tr>
                                        <td rowspan="1" style="width: 33px">
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="增加" /></td>
                                        <td style="width: 140px">
                                            <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_osend1" runat="server"
                                                BackColor="#F0F0F0" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                                                FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                                <ErrorStyle BorderStyle="NotSet" />
                                            </SmoothEnterpriseWebControlEnterprise:PopupUser>
                                            <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_osend2" runat="server"
                                                BackColor="#F0F0F0" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                                                FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id" Visible="False">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControlEnterprise:PopupUser>
                                            <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_osend3" runat="server"
                                                BackColor="#F0F0F0" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                                                FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id" Visible="False">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControlEnterprise:PopupUser>
                                            <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_osend4" runat="server"
                                                BackColor="#F0F0F0" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                                                FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id" Visible="False">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControlEnterprise:PopupUser>
                                            <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_osend5" runat="server"
                                                BackColor="#F0F0F0" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                                                FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id" Visible="False">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControlEnterprise:PopupUser>&nbsp;
                                            
                                            
                                            
                                            </td>
                                    </tr>
                                </table>
                                </td>
                        </tr>
                    </tbody>
                </table>
			</td>
		</tr>
	</table>
    <table border="0" Class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient4" runat="server" TypeName="ERP_Flow4.Flowwork.ERP_Flow41">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient5" runat="server" TypeName="ERP_Flow5.Flowwork.ERP_Flow51">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient6" runat="server" TypeName="ERP_Flow6.Flowwork.ERP_Flow61">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient7" runat="server" TypeName="ERP_Flow7.Flowwork.ERP_Flow71">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient8" runat="server" TypeName="ERP_Flow8.Flowwork.ERP_Flow81">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient9" runat="server" TypeName="ERP_Flow9.Flowwork.ERP_Flow91">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <cc1:Control ID="Control1" runat="server" />
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient10" runat="server" TypeName="ERP_Flow10.Flowwork.ERP_Flow101">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient11" runat="server" TypeName="ERP_Flow11.Flowwork.ERP_Flow111">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient12" runat="server" TypeName="ERP_Flow12.Flowwork.ERP_Flow121">
                </SmoothEnterpriseControlFlowwork:FlowClient><SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient13" runat="server" TypeName="ERP_Flow13.Flowwork.ERP_Flow131">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" ononloadhistory="FlowFeedbackViewer1_OnLoadHistory"><Columns>
<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
</Columns>
<HistoryTemplate>
    <SmoothEnterpriseWebControl:InputText ID="Show_Comment" runat="server" BackColor="#F0F0F0"
        CssClass="Normal" Width="400px">
        <ErrorStyle BorderStyle="NotSet" CssClass="" />
        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
    </SmoothEnterpriseWebControl:InputText><asp:Image id="Image1" runat="server"></asp:Image>
</HistoryTemplate>
</SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
    &nbsp;
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;&nbsp;<SmoothEnterpriseWebControlFlowwork:SendRequestButton ID="BUTTON_SendRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient11 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px" OnClick="BUTTON_SendRequest_Click">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:SendRequestButton>&nbsp;<SmoothEnterpriseWebControlFlowwork:StopRequestButton ID="BUTTON_StopRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient11 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px" onclick="BUTTON_StopRequest_Click" EnableTheming="True" RunAtCient="False">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:StopRequestButton>&nbsp;<SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton1_Click"
                    Text="催審" Width="80px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_delete_Click" visible="False">
<Gradient GradientType="Bottom" GradientBegin="136, 136, 136" GradientEnd="White"></Gradient>
</SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="InputButton2" runat="server" Text="退回ERP修改" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton2_Click" Enabled="False">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>

	</table>
    <asp:Button ID="Button2"  Visible="false" runat="server" OnClick="Button2_Click" Text="Button" />
	






</asp:Content>