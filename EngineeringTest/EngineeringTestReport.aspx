<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="EngineeringTestReport.aspx.cs" Inherits="EMP_ADD.EMP_ADDDelete" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="EMP_ADD Delete Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0">
        <tr>
            <td>
                <asp:Label ID="LABEL_EMP_NO" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL_EMP_NOResource1"
                    Text="試作單號"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_EMP_NM" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL_EMP_NMResource1"
                    Text="製令單號"></asp:Label></td>
            <td style="width: 78px; height: 19px">Ｅ
                <asp:Label ID="Label21" runat="server" CssClass="NormalBold" Text="料號客戶別"></asp:Label></td>
            <td style="width: 110px">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" meta:resourcekey="Label1Resource1"
                    Text="新增日期(起)"></asp:Label></td>
            <td style="width: 110px">
                <asp:Label ID="Label4" runat="server" CssClass="NormalBold" meta:resourcekey="Label4Resource1"
                    Text="新增日期(迄)"></asp:Label></td>
            <td>
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" meta:resourcekey="Label2Resource1"
                    Text="新增人員"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 25px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_NO" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Personalize="True">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="height: 25px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_makes_no" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Personalize="True">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 78px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_ccima01" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Personalize="True" Width="90px">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 110px; height: 25px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_SDATE" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                    ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                    HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                    OnClickMore="" Personalize="False" Required="False" Width="110px">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 110px; height: 25px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_SDATE2" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                    ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                    HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                    OnClickMore="" Personalize="False" Required="False" Width="110px">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="height: 25px">
                <SmoothEnterpriseWebControlEnterprise:PopupUser id="QUERY_add_user" runat="server"
                    BackColor="#F0F0F0" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                    FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id" Width="105px">
                    <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                    <errorstyle borderstyle="NotSet" />
                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
            <td style="height: 25px">
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" meta:resourcekey="BUTTON_queryResource1"
                    OnClick="BUTTON_query_Click" Text="查詢" Width="80px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField HeaderText="試作單號" DataField="no" SortExpression="no" />
            <asp:BoundField HeaderText="製令編號" DataField="asfa" SortExpression="asfa" />
            <asp:BoundField HeaderText="品名" DataField="aima02" SortExpression="aima02" />
            <asp:BoundField HeaderText="料號" DataField="asfb05" SortExpression="asfb05" />
            <asp:BoundField HeaderText="REV" DataField="rev" SortExpression="rev" />
            <asp:BoundField HeaderText="原料品名" DataField="abima02" SortExpression="abima02" />
            <asp:BoundField HeaderText="原料料號" DataField="asfa03" SortExpression="asfa03" />
            <asp:BoundField HeaderText="發料量" DataField="asfa06" SortExpression="asfa06" />
            <asp:BoundField HeaderText="原料庫存" DataField="bbimg10" SortExpression="bbimg10" />
            <asp:BoundField HeaderText="生產數量" DataField="asfb08" SortExpression="asfb08" />
            <asp:BoundField HeaderText="送樣數量" DataField="delivers_amount" SortExpression="delivers_amount" />
            <asp:BoundField HeaderText="入庫數" DataField="asfb09" SortExpression="asfb09" />
            <asp:BoundField HeaderText="產品庫存" DataField="ccimg10" SortExpression="ccimg10" />
            <asp:BoundField HeaderText="不良品庫存" DataField="ddimg10" SortExpression="ddimg10" />

        </Columns>
        <FooterStyle BackColor="#CCCCCC" Font-Size="X-Small" HorizontalAlign="Center" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="X-Small" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <RowStyle Font-Size="X-Small" HorizontalAlign="Left" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
        SelectCommand="SELECT no, rev,delivers_amount, a.* FROM engineeringtest_report AS a LEFT OUTER JOIN engineeringtest_head AS b ON asfa = makes_no"></asp:SqlDataSource>
    <br />
</asp:Content>