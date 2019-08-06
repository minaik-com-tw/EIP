<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="APMT420View.aspx.cs" Inherits="ERP_APMT420.APMT420View" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script language="javascript"  type="text/javascript" src="<%=ResolveClientUrl("~/sub.js")%>"></script>
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="APMT420 View Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" Class="Normal">
		<tr>
			<td valign="top" style="width: 1024px">
				<table>
					
 	 	 	 	 	<tr><td style="width: 100px"><asp:Label ID="LABEL_no" runat="server" CssClass="NormalBold" Text="單號編號"></asp:Label></td>
                             <td style="width: 145px">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_no" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="151px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 100px">
                                 <asp:Label ID="LABEL_pmk04" runat="server" CssClass="NormalBold" Text="請購日期"></asp:Label></td>
                             <td style="width: 145px">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk04" runat="server" CssClass="PanelWhite" ReadOnly="True" FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 100px">
                                 <asp:Label ID="LABEL_pmc03" runat="server" CssClass="NormalBold" Text="供應商"></asp:Label></td>
                             <td style="width: 145px">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk09" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText id="FIELD_pmc03" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 81px">
                                 <asp:Label ID="LABEL_l_amt1" runat="server" CssClass="NormalBold" Text="原幣總金額" ForeColor="Red" Width="79px"></asp:Label></td>
                             <td style="width: 157px">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_l_amt1" runat="server" CssClass="PanelWhite" ReadOnly="True" ForeColor="Red" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                         </tr><tr><td style="width: 100px"><asp:Label ID="LABEL_pmk01" runat="server" CssClass="NormalBold" Text="請購單號"></asp:Label></td>
                             <td style="width: 145px">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk01" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="154px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 100px">
                                 <asp:Label ID="LABEL_pmk02" runat="server" CssClass="NormalBold" Text="單據性質"></asp:Label></td>
                             <td style="width: 145px">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk02" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 100px">
                                 <asp:Label ID="LABEL_pmk06" runat="server" CssClass="NormalBold" Text="預算編號"></asp:Label></td>
                             <td style="width: 145px">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk06" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 81px">
                                 <asp:Label ID="LABEL_l_amt2" runat="server" CssClass="NormalBold" Text="本幣總金額" ForeColor="Red"></asp:Label></td>
                             <td style="width: 157px">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_l_amt2" runat="server" CssClass="PanelWhite" ReadOnly="True" ForeColor="Red" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                         </tr>
 	 	 	 	 	<tr><td style="width: 100px; height: 23px;"><asp:Label ID="LABEL_pma02_8" runat="server" CssClass="NormalBold" Text="付款條件"></asp:Label></td>
                             <td style="width: 145px; height: 23px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk20" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="50px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText id="FIELD_pma02_8" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="90px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 100px; height: 23px;">
                                 <asp:Label ID="LABEL_ta_pmk01" runat="server" CssClass="NormalBold" Text="訂單單號"></asp:Label></td>
                             <td style="width: 145px; height: 23px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_ta_pmk01" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 100px; height: 23px;">
                                 <asp:Label ID="LABEL_gem02_5" runat="server" CssClass="NormalBold" Text="收貨部門"></asp:Label></td>
                             <td style="width: 145px; height: 23px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk14" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText id="FIELD_gem02_5" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 81px; height: 23px;">
                                 <asp:Label ID="LABEL_gen02_3" runat="server" CssClass="NormalBold" Text="請購人員"></asp:Label></td>
                             <td style="width: 157px; height: 23px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk12" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText id="FIELD_gen02_3" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                         </tr>
 	 	 	 	 	<tr><td style="width: 100px;"><asp:Label ID="LABEL_oah02_9" runat="server" CssClass="NormalBold" Text="價格條件"></asp:Label></td>
                             <td style="width: 145px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_oah02_9" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="50px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText id="FIELD_pmk41" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="90px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 100px;">
                                 <asp:Label ID="LABEL_pmk22" runat="server" CssClass="NormalBold" Text="幣別匯率"></asp:Label></td>
                             <td style="width: 145px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk22" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText id="FIELD_pmk42" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 100px;">
                                 <asp:Label ID="LABEL_gen02_6" runat="server" CssClass="NormalBold" Text="確認人"></asp:Label></td>
                             <td style="width: 145px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk15" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText id="FIELD_gen02_6" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 81px;">
                                 <asp:Label ID="LABEL_gem02_4" runat="server" CssClass="NormalBold" Text="請購部門"></asp:Label></td>
                             <td style="width: 157px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_gem02_4" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText id="FIELD_pmk13" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="70px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                         </tr><tr><td style="width: 100px; height: 44px;">
                                 <asp:Label ID="LABEL_pmk21" runat="server" CssClass="NormalBold" Text="稅別稅率"></asp:Label></td>
                             <td style="width: 145px; height: 44px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk21" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="50px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText id="FIELD_pmk43" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="90px" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 100px; height: 44px;">
                                 <asp:Label ID="LABEL_pme031_1" runat="server" CssClass="NormalBold" Text="送貨地址"></asp:Label></td>
                             <td style="width: 145px; height: 44px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk10" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText id="FIELD_pme031_1" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 100px; height: 44px;">
                                 <asp:Label ID="LABEL_pme031_2" runat="server" CssClass="NormalBold" Text="發票地址"></asp:Label></td>
                             <td style="width: 145px; height: 44px;">
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pmk11" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText>
                                 <SmoothEnterpriseWebControl:InputText id="FIELD_pme031_2" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:InputText></td>
                             <td style="width: 81px; height: 44px;">
                                 <asp:Label ID="LABEL_status" runat="server" CssClass="NormalBold" Text="單據狀態"></asp:Label></td>
                             <td style="width: 157px; height: 44px;">
                                 &nbsp;<SmoothEnterpriseWebControl:InputText id="FIELD_status" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                         </tr>
                    <tr>
                        <td colspan="8" style="height: 66px">
                            <hr />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="bno,pml02"
                                DataSourceID="SqlDataSource1" Font-Size="Small" ForeColor="Black" GridLines="Vertical"
                                Height="53px" PageSize="5" Width="1200px">
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
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pml31" HeaderText="原幣單價" SortExpression="pml31">
                                        <HeaderStyle Wrap="False" ForeColor="Red" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pml88" HeaderText="本幣金額" SortExpression="pml88">
                                        <HeaderStyle Wrap="False" ForeColor="Red" />
                                        <ItemStyle Wrap="False" />
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
                                     <asp:BoundField DataField="ta_pml06" HeaderText="產品保固" SortExpression="ta_pml02">
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

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
                                SelectCommand="SELECT [bno], [pmk01], [pml02], [pml04], [pml041], [pml41], [pml20], [pml07], [ima021], [pml12], [pml121], [pml122], [pml40], [aag02], [pml67], [gem02], [pml06], [pml31], [pml88], [ta_pml05], [ta_pml01], [ta_pml02],  CONVERT(varchar(12) , pml33, 111 ) pml33,CONVERT(varchar(12) , pml34, 111 ) pml34,CONVERT(varchar(12) , pml35, 111 ) pml35 FROM [APMT420_IN_BODY]">
                            </asp:SqlDataSource>
                            <table border="0">
                                <tr>
                                    <td style="width: 178px; height: 4px;">
                                        <asp:Label ID="LABEL_pma02_81" runat="server" CssClass="NormalBold" Text="夾帶檔案"></asp:Label></td>
                                    <td colspan="3" style="height: 4px">
                                        <table style="border-top-style: none; border-right-style: none; border-left-style: none;
                                            border-bottom-style: none">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="White"
                                                        Text="檔案名稱" style="background-color: black; text-align: center" Width="222px"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 22px">
                                                    <asp:Literal ID="FIELD_attachmentd1" runat="server"></asp:Literal></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="FIELD_attachmentd2" runat="server"></asp:Literal></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="FIELD_attachmentd3" runat="server"></asp:Literal></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="FIELD_attachmentd4" runat="server"></asp:Literal></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="FIELD_attachmentd5" runat="server"></asp:Literal></td>
                                            </tr>
                                       <tr>
                                                <td>
                                                    <asp:Literal ID="FIELD_attachmentd6" runat="server"></asp:Literal></td>
                                            </tr>
                                       
                                       
                                        </table>
                                        <asp:CheckBox ID="FIELD_attachmentr6" runat="server" CssClass="Normal" Visible="False" />
                                        <asp:CheckBox ID="FIELD_attachmentr5" runat="server" CssClass="Normal" Visible="False" />
                                        <asp:CheckBox ID="FIELD_attachmentr4" runat="server" CssClass="Normal" Visible="False" />
                                        <asp:CheckBox ID="FIELD_attachmentr3" runat="server" CssClass="Normal" Visible="False" />
                                        <asp:CheckBox ID="FIELD_attachmentr2" runat="server" CssClass="Normal" Visible="False" />
                                        <asp:CheckBox ID="FIELD_attachmentr1" runat="server" CssClass="Normal" Visible="False" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 178px">
                                        <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Text="是否為急件"></asp:Label></td>
                                    <td style="width: 93px">
                                        <asp:DropDownList ID="FIELD_QUICK" runat="server">
                                            <asp:ListItem>N</asp:ListItem>
                                            <asp:ListItem>Y</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 95px">
                                    </td>
                                    <td style="width: 7px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px">
                                        <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="是否為電腦類"></asp:Label></td>
                                    <td style="width: 93px">
                                        <asp:DropDownList ID="FIELD_computer" runat="server">
                                            <asp:ListItem>N</asp:ListItem>
                                            <asp:ListItem>Y</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 95px">
                                        <asp:Label ID="Label6" runat="server" CssClass="NormalBold" Text="軟硬體申請單號" Width="117px"></asp:Label></td>
                                    <td style="width: 7px">
                                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="normal" Width="188px">HyperLink</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td style="width: 178px">
                                        <asp:Label ID="Label8" runat="server" CssClass="NormalBold" Height="35px" Text="是否購買化學品或氣體或是外包廠商入廠維修"
                                            Width="174px"></asp:Label></td>
                                    <td style="width: 93px">
                                        <asp:DropDownList ID="FIELD_chemistry" runat="server">
                                            <asp:ListItem>N</asp:ListItem>
                                            <asp:ListItem>Y</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 95px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_computer_no" runat="server" BackColor="#F0F0F0"
                                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                            ErrorMessage="Please Input「REMARK」!!" FocusColor="" FormatType="None" HiddenMode="False"
                                            HTMLMode="Advance" IsValid="True" MaxLength="100" meta:resourcekey="FIELD_REMARKResource1"
                                            OnClickMore="" Personalize="False" Required="False" Width="100px" Visible="False">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 7px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px">
                                        <asp:Label ID="LABEL_oah02_91" runat="server" CssClass="NormalBold" Text="請選擇會計人員" Visible="False"></asp:Label></td>
                                    <td style="width: 93px">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_acc" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" Visible="False" Height="24px" Width="83px">
                                            <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                                            <errorstyle borderstyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                    <td style="width: 95px">
                                    </td>
                                    <td style="width: 7px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px">
                                        <asp:Label ID="LABEL_pme031_11" runat="server" CssClass="NormalBold" Text="請選擇採購人員" Visible="False"></asp:Label></td>
                                    <td style="width: 93px">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_pur" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" Visible="False" Height="22px" Width="80px">
                                            <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                                            <errorstyle borderstyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                    <td style="width: 95px">
                                    </td>
                                    <td style="width: 7px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px">
                                        <asp:Label ID="LABEL_pme031_21" runat="server" CssClass="NormalBold" Text="請選擇資訊人員" Visible="False"></asp:Label></td>
                                    <td style="width: 93px">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_mis" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" Visible="False" Height="19px" Width="79px">
                                            <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                                            <errorstyle borderstyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                    <td style="width: 95px">
                                    </td>
                                    <td style="width: 7px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px">
                                        <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="請選擇直屬主管" Visible="False"></asp:Label></td>
                                    <td style="width: 93px">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_lsend" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" Visible="False" Height="21px" Width="79px">
                                            <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                                            <errorstyle borderstyle="NotSet" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                    <td style="width: 95px">
                                    </td>
                                    <td style="width: 7px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px">
                                        <asp:Label ID="Label11" runat="server" CssClass="NormalBold" Text="請選擇跨部門主管主管" Width="135px" Visible="False"></asp:Label></td>
                                    <td style="width: 93px">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_osend1" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" Visible="False" Height="22px" Width="76px">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                    <td style="width: 95px">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_osend2" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" Visible="False" Height="23px" Width="24px">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                    <td style="width: 7px">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_osend3" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" Visible="False">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                </tr>
                                <tr>
                                    <td style="width: 178px; height: 6px;">
                                    </td>
                                    <td style="width: 93px; height: 6px;">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_osend4" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" Visible="False" Height="24px" Width="74px">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                    <td style="height: 6px; width: 95px;">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_osend5" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" Visible="False" Height="17px" Width="22px">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                   
                                </tr>
                            </table>
                        </td>
                    </tr>
				</table>
			</td>
		</tr>
	</table>
    <table border="0" Class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="Normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnFlowStop="FlowFeedback1_FlowStop" OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" RedirectAfterCommit="False" Width="1024px">
                    <Results>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult1" Text="同意" ResultType="Next"
                            runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult runat="server" ResultType="Back" Text="退回(退至上一關) " />
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult2" Text="退回(退至提案人)  " ResultType="Return"
                            runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                    </Results>
                    <ReplyTemplate>
                        請輸入簽核意見：<br />
                        <SmoothEnterpriseWebControl:InputText ID="Input_Comment" runat="server" BackColor="#F0F0F0"
                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                            ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                            IsValid="True" meta:resourcekey="Input_CommentResource1" OnClickMore="" Personalize="False"
                            Required="False" Width="500px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <SmoothEnterpriseWebControl:InputText ID="InputText3" runat="server" BackColor="#F0F0F0"
                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                            ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                            IsValid="True" meta:resourcekey="InputText3Resource1" OnClickMore="" Personalize="False"
                            Required="False" Visible="False">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <asp:Button ID="BUTTON_FlowFeedback" runat="server" CssClass="NormalBold" meta:resourcekey="BUTTON_FlowFeedbackResource1"
                            OnClick="BUTTON_FlowFeedback_Click" Text="送出" Width="80px" />
                    </ReplyTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedback>
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
        CssClass="Normal" Width="863px">
        <ErrorStyle BorderStyle="NotSet" />
        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
    </SmoothEnterpriseWebControl:InputText><asp:Image id="Image1" runat="server" meta:resourcekey="Image1Resource1"></asp:Image>
</HistoryTemplate>
</SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
                &nbsp;
            </td>
        </tr>
    </table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="PRINT" runat="server" Text="直接列印" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="PRINT_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>