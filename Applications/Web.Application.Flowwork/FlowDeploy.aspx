<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="FlowDeploy, App_Web_flowdeploy.aspx.cdcab7d2" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="SmoothEnterpriseControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Caption="Program Name" CssClass="Normal" Details="The desciption for this program"
        Gradient="None" Height="40%" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1"
        PaddingSpace="5px" Width="100%">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"
            CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0" class="NormalBold">
        <tr>
            <td>
                <asp:Label ID="LABEL_upload1" runat="server" Text="請按 瀏覽 鍵選擇要上傳之Flow Assembly ....."
                    meta:resourcekey="LABEL_upload1Resource1"></asp:Label>
                &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <font color="#ff0066">
                    <asp:Label ID="LABEL_upload2" runat="server" Text="檔案名稱不能包含下列字元(/,\,&,?,%,#,=,!,@,..)"
                        meta:resourcekey="LABEL_upload2Resource1"></asp:Label>&nbsp;</font>
            </td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputFile ID="FIELD_flowassembly" runat="server" BackColor="#F0F0F0"
                    CssClass="NormalBold" Width="496px" meta:resourcekey="FIELD_flowassemblyResource1">
                    <Gradient GradientEnd="" GradientBegin="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputFile>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Check_Cover" runat="server" CssClass="NormalBold" Visible="False"
                    meta:resourcekey="Check_CoverResource1" />
                <asp:Label ID="LABEL_replacefile" runat="server" Text="取代舊檔案" Visible="False" meta:resourcekey="LABEL_replacefileResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="HiddenJs" runat="server" meta:resourcekey="HiddenJsResource1"></asp:Label><SmoothEnterpriseWebControl:InputButton
                    ID="BUTTON_upload" runat="server" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid"
                    BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                    OnClick="StartUploadButton_Click" RunAtCient="False" Text="開始上傳檔案" meta:resourcekey="BUTTON_uploadResource1">
                    <Gradient GradientEnd="" GradientBegin="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
        <tr>
            <td>
                <asp:HiddenField ID="HIDDEN_flowassembly" runat="server" />
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server" Notes=""
                    RequestPriority="Normal" RequestUID="00000000-0000-0000-0000-000000000000" RequestURL="">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <asp:Label ID="FIELD_errmsg" runat="server" Font-Bold="True"
                    meta:resourcekey="FIELD_errmsgResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControlFlowwork:FlowViewer ID="FlowViewer1" runat="server" BorderColor="Silver"
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Arial" Font-Size="11px" meta:resourcekey="FlowViewer1Resource1"
                    RequestURL="" Width="450px">
                    <ParallelStyle Font-Size="11px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        BorderColor="Black" BackColor="WhiteSmoke"></ParallelStyle>
                    <NodeStyle Font-Size="11px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        BorderColor="Black" PaddingSize="3px" BackColor="White"></NodeStyle>
                </SmoothEnterpriseWebControlFlowwork:FlowViewer>
            </td>
        </tr>
    </table>
    <table class="Normal" border="0">
        <tr>
            <td style="height: 24px">
                <SmoothEnterpriseWebControl:InputButton ID="BackButton" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Width="80px" Text="回上頁" Gradient-GradientType="Bottom"
                    Font-Bold="True" meta:resourcekey="BackButtonResource1" RunAtCient="False" OnClick="BackButton_Click">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <div style="display: none; top: 300px; left: 150px; width: 250px; height: 50px; position: absolute;"
        id="DIV_msg">
        <table class="Normal" border="0" width="100%" height="100%" bgcolor="red">
            <tr>
                <td align="center" valign="middle">
                    <font color="white">Now Deploying <br/>Please Waitting ...</font>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
