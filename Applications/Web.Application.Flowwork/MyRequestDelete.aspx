<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.MyRequestDelete, App_Web_myrequestdelete.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="Program Name" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight=""
        IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"
            CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <SmoothEnterpriseWebControl:PageJumper ID="PageJumper1" runat="server" ShowPageNumber="True"
        ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
        <ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px"
            BorderStyle="Solid" BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200"
            CssClass=""></ButtonStyle>
        <PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke"
            CssClass=""></PageSelectedStyle>
        <PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px"
            BorderWidth="1px" ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White"
            CssClass=""></PageNumberStyle>
    </SmoothEnterpriseWebControl:PageJumper>
    <table border="0" Class="Normal">
        <tr>
            <td id="LABEL_subject" runat="server" Class="NormalBold">
                標題</td>
        </tr>
        <tr>
            <td Class="Normal">
                <SmoothEnterpriseWebControl:inputtext id="FIELD_subject" runat="server" cssClass="PanelWhite"
                    readonly="True" width="296px"></SmoothEnterpriseWebControl:inputtext>
            </td>
        </tr>
        <tr>
            <td id="LABEL_content" runat="server" Class="NormalBold">
                內容</td>
        </tr>
        <tr>
            <td Class="Normal">
                <SmoothEnterpriseWebControl:inputtext id="FIELD_content" runat="server" cssClass="PanelWhite"
                    readonly="True" width="296px" height="62px" textmode="MultiLine"></SmoothEnterpriseWebControl:inputtext>
            </td>
        </tr>
        <tr>
            <td id="LABEL_flowrequestdate" runat="server" Class="NormalBold">
                送審日期</td>
        </tr>
        <tr>
            <td Class="Normal">
                <SmoothEnterpriseWebControl:inputtext id="FIELD_requestdate" runat="server" cssClass="PanelWhite"
                    readonly="True"></SmoothEnterpriseWebControl:inputtext>
            </td>
        </tr>
        <tr>
            <td id="LABEL_flowname" runat="server" Class="NormalBold">
                審核流程</td>
        </tr>
        <tr>
            <td Class="Normal">
                <SmoothEnterpriseWebControl:inputtext id="FIELD_fid" runat="server" cssClass="PanelWhite" readonly="True"
                    width="296px"></SmoothEnterpriseWebControl:inputtext>
            </td>
        </tr>
        <tr>
            <td id="LABEL_approvestatus" runat="server" Class="NormalBold">
                審核狀態</td>
        </tr>
        <tr>
            <td Class="Normal">
                <SmoothEnterpriseWebControl:inputtext id="FIELD_approvestatus" runat="server" cssClass="PanelWhite"
                    readonly="True"></SmoothEnterpriseWebControl:inputtext>
            </td>
        </tr>
        <tr>
            <td id="LABEL_remark" runat="server" Class="NormalBold">
                個人備註</td>
        </tr>
        <tr>
            <td Class="Normal">
                <SmoothEnterpriseWebControl:inputtext id="FIELD_remark" runat="server" cssClass="PanelWhite"
                    readonly="True"></SmoothEnterpriseWebControl:inputtext>
            </td>
        </tr>
        <tr>
            <td id="LABEL_modifyname" runat="server" Class="NormalBold">
                更新人員</td>
        </tr>
        <tr>
            <td Class="Normal">
                <SmoothEnterpriseWebControl:inputtext id="FIELD_modifyuid" runat="server" cssClass="PanelWhite"
                    readonly="True"></SmoothEnterpriseWebControl:inputtext>
            </td>
        </tr>
        <tr>
            <td id="LABEL_modifydate" runat="server" Class="NormalBold">
                更新日期</td>
        </tr>
        <tr>
            <td Class="Normal">
                <SmoothEnterpriseWebControl:inputtext id="FIELD_modifydate" runat="server" cssClass="PanelWhite"
                    readonly="True"></SmoothEnterpriseWebControl:inputtext>
            </td>
        </tr>
    </table>
    <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" gradient-gradienttype="Bottom"
                    cssClass="NormalBold" backcolor=" #C8C8C8" bordercolor="#606060" borderwidth="1px"
                    borderstyle="Solid" font-names="Arial" font-size="12px" font-bold="True" text="刪除"
                    width="80px" OnClick="DeleteButton_Click"></SmoothEnterpriseWebControl:inputbutton>
                &nbsp;</td>
            <td>
                &nbsp;<SmoothEnterpriseWebControl:inputbutton id="CancelButton" runat="server" backcolor=" #C8C8C8"
                    borderstyle="Solid" borderwidth="1px" bordercolor="#606060" font-size="12px"
                    font-names="Arial" gradient-gradienttype="Bottom" cssClass="NormalBold" width="80px"
                    text="取消" font-bold="True" OnClick="CancelButton_Click"></SmoothEnterpriseWebControl:inputbutton>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
