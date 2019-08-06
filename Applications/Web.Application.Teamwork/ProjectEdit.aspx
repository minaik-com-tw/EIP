<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.ProjectEdit, App_Web_projectedit.aspx.cdcab7d2" theme="Default" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0" Class="Normal">
        <tr>
            <td valign="top">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_code" runat="server" CssClass="NormalBold" Text="專案代碼" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_code" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" ErrorMessage="請輸入「專案代碼」!!" TabIndex="100" MaxLength="50" Required="True">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_name" runat="server" CssClass="NormalBold" Text="名稱" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" ErrorMessage="請輸入「名稱」!!" TabIndex="101" MaxLength="200" Required="True">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_projstatusid" runat="server" CssClass="NormalBold" Text="專案類別" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_projtypeid" runat="server"
                                TextField="name" ValueField="id" CodeType="projtype" CssClass="Normal" BackColor="#F0F0F0"
                                ItemNoneDisplayed="True">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Td1" runat="server" CssClass="NormalBold" Text="專案狀態" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_projstatusid" runat="server"
                                TextField="name" ValueField="id" CodeType="projstatus" CssClass="Normal" BackColor="#F0F0F0"
                                ItemNoneDisplayed="True">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_remark" runat="server" CssClass="NormalBold" Text="說明" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" Width="300px"
                                TextMode="MultiLine" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「說明」!!"
                                TabIndex="102" MaxLength="1073741823" Height="100px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border="0" Class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Width="80px"
                    Text="儲存" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click">
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Width="80px"
                    Text="回上頁" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click">
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click">
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
</asp:Content>
