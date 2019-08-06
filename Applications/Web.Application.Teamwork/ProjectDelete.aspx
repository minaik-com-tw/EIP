<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.ProjectDelete, App_Web_projectdelete.aspx.cdcab7d2" theme="Default" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <SmoothEnterpriseWebControl:PageJumper ID="PageJumper1" runat="server" ShowPageNumber="True">
        <ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px"
            BorderStyle="Solid" BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200">
        </ButtonStyle>
        <PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke">
        </PageSelectedStyle>
        <PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px"
            BorderWidth="1px" ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White">
        </PageNumberStyle>
    </SmoothEnterpriseWebControl:PageJumper>
    <table border="0" Class="Normal">
        <tr>
            <td valign="top">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_code" runat="server" CssClass="NormalBold" Text="專案代碼" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_code" runat="server" CssClass="PanelWhite"
                                ReadOnly="True">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_name" runat="server" CssClass="NormalBold" Text="名稱" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" CssClass="PanelWhite"
                                ReadOnly="True">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_projtypeid" runat="server" CssClass="NormalBold" Text="專案類別" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_projtypeid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_projstatusid" runat="server" CssClass="NormalBold" Text="專案狀態" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_projstatusid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_remark" runat="server" CssClass="NormalBold" Text="說明" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="300px" Height="100px" TextMode="MultiLine">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Gradient-GradientType="Bottom"
                    CssClass="NormalBold" BackColor=" #C8C8C8" BorderColor="#606060" BorderWidth="1px"
                    BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" Text="刪除"
                    Width="80px" OnClick="BUTTON_delete_Click">
                </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
            <td>
                &nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_cancel" runat="server" BackColor=" #C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold" Width="80px"
                    Text="取消" Font-Bold="True" OnClick="BUTTON_cancel_Click">
                </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
