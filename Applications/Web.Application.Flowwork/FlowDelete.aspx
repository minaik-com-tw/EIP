<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.FlowDelete, App_Web_flowdelete.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
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
    <table class="Normal" border="0">
        <tr valign="top">
            <td valign="top">
                <table width="250">
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_flowclassname" runat="server" Text="流程物件名稱" meta:resourcekey="LABEL_flowclassnameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal" height="24">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_typename" runat="server" Width="240px"
                                CssClass="PanelWhite" ReadOnly="True" name="FIELD_typename" ButtonClick="True"
                                ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor=""
                                FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_typenameResource1"
                                OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_flowdescription" runat="server" Text="流程描述" meta:resourcekey="LABEL_flowdescriptionResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal" height="24">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" Width="240px"
                                CssClass="PanelWhite" ReadOnly="True" name="FIELD_name" ButtonClick="True" ButtonIconUrl=""
                                DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None"
                                HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1"
                                OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_remark" runat="server" Text="備註說明" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal" height="24">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" Width="240px"
                                CssClass="PanelWhite" Height="208px" ReadOnly="True" name="FIELD_remark" TextMode="MultiLine"
                                ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
            <td>
                <SmoothEnterpriseWebControlFlowwork:FlowViewer ID="FlowViewer1" runat="server" BackColor="WhiteSmoke"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver" Font-Size="11px" Font-Names="Arial"
                    Width="296px" ForeColor="Silver" Height="360px" meta:resourcekey="FlowViewer1Resource1"
                    RequestURL="">
                    <NodeStyle Font-Size="11px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        GradientLevel="50" Gradient="Bottom" BorderColor="Black" PaddingSize="5px" GradientBegin="Silver"
                        BackColor="White" CssClass=""></NodeStyle>
                    <ParallelStyle Font-Size="11px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        BorderColor="LightGray" BackColor="White" CssClass=""></ParallelStyle>
                </SmoothEnterpriseWebControlFlowwork:FlowViewer>
            </td>
        </tr>
    </table>
    <table class="Normal" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="DeleteButton" runat="server" Gradient-GradientType="Bottom"
                    CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px"
                    BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" Text="刪除"
                    Width="80px" meta:resourcekey="DeleteButtonResource1" RunAtCient="False" OnClick="DeleteButton_Click">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BackButton" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Width="80px" Text="回上頁" Gradient-GradientType="Bottom"
                    Font-Bold="True" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
