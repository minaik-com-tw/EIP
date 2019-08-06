<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.MyRequestView, App_Web_myrequestview.aspx.cdcab7d2" title="Untitled Page" culture="auto" uiculture="auto" stylesheettheme="Default" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="cc1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
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
        <tr>
            <td valign="top">
                <table>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_requestname" runat="server" Text="提出人" meta:resourcekey="LABEL_requestnameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_requestuid" runat="server" Width="300px"
                                CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_requestuidResource1"
                                OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_flowrequestdate" runat="server" Text="送審日期" meta:resourcekey="LABEL_flowrequestdateResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_requestdate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_requestdateResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_flowname" runat="server" Text="審核流程" meta:resourcekey="LABEL_flownameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_fid" runat="server" Width="300px"
                                CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fidResource1" OnClickMore=""
                                Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_subject" runat="server" Text="標題" meta:resourcekey="LABEL_subjectResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_subject" runat="server" Width="300px"
                                CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_subjectResource1" OnClickMore=""
                                Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_content" runat="server" Text="內容" meta:resourcekey="LABEL_contentResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_content" runat="server" Width="352px"
                                Height="72px" CssClass="PanelWhite" ReadOnly="True" TextMode="MultiLine" ButtonClick="True"
                                ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor=""
                                FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_contentResource1"
                                OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_attachment" runat="server" Text="附件" meta:resourcekey="LABEL_attachmentResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <asp:Literal ID="FIELD_filename" runat="server" meta:resourcekey="FIELD_filenameResource1"></asp:Literal></td>
                    </tr>
                </table>
            </td>
            <td width="5">
            </td>
            <td valign="top">
                <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    Font-Size="12px" BorderColor="Red" BorderWidth="1px" BorderStyle="Solid" BackColor="#F0F0F0"
                    CssClass="Normal" meta:resourcekey="FlowFeedback1Resource1" RedirectURL="" Text=""
                    OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnFlowStop="FlowFeedback1_FlowStop"
                    OnOnLoadData="FlowFeedback1_OnLoadData" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                    <ReplyTemplate>
                        <table class="Normal" border="0">
                            <tr>
                                <td class="NormalBold" valign="top">
                                    <asp:Literal ID="Literal2" runat="server" Text="Addition Approver : " meta:resourcekey="Literal1Resource2"></asp:Literal></td>
                                </td>
                                <td>
                                    <SmoothEnterpriseWebControlEnterprise:PopupUser ID="PopupUser1" runat="server" BackColor="#F0F0F0"
                                        CssClass="Normal" DisplayField="id" FormatType="InputCombo" FormatValueField="logonid"
                                        DisplayFieldHidden="True" Gradient-GradientType="Top" ReadOnly="True" ValueField="id">
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControlEnterprise:PopupUser>
                                </td>
                            </tr>
                            </tr> </tr>
                            <tr>
                                <td class="NormalBold" valign="top">
                                    <asp:Literal ID="Literal1" runat="server" Text="Note : " meta:resourcekey="Literal1Resource1"></asp:Literal></td>
                                <td>
                                    <SmoothEnterpriseWebControl:InputText ID="InputText_note" runat="server" BackColor="#F0F0F0"
                                        Width="226px" CssClass="Normal" Height="39px" TextMode="MultiLine" ButtonClick="True"
                                        ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor=""
                                        FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="InputText_noteResource1"
                                        OnClickMore="" Personalize="False" Required="False">
                                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:InputText></td>
                                <td valign="bottom">
                                    <asp:Button ID="FlowFeedbackButton1" OnClick="FlowFeedback1_Click" runat="server"
                                        CssClass="NormalBold" Text="Submit" meta:resourcekey="FlowFeedbackButton1Resource1">
                                    </asp:Button></td>
                            </tr>
                        </table>
                    </ReplyTemplate>
                    <Results>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult1" Text="Agree" ResultType="Next"
                            meta:resourcekey="flowResult1Resource1" runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult2" Text="Reject" ResultType="Back"
                            meta:resourcekey="flowResult2Resource1" runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                    </Results>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedback>
            </td>
        </tr>
    </table>
    <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
        Font-Size="11px" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" CssClass="Normal"
        meta:resourcekey="FlowFeedbackViewer1Resource1" RequestURL="" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory"
        OnPreRender="FlowFeedbackViewer1_PreRender">
        <Columns>
            <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
            <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
            <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn Label="" FieldName="ReviewerPhoto">
            </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
            <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
            <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
            <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
            <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
            <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
            <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn Label="" FieldName="ResultIcon">
            </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
        </Columns>
        <HistoryTemplate>
            <SmoothEnterpriseWebControl:InputText ID="FIELD_note" runat="server" BackColor="#F0F0F0"
                Columns="50" CssClass="Normal" TextMode="MultiLine" ReadOnly="True">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:InputText>
        </HistoryTemplate>
    </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
    <table class="Normal" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BackButton" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Gradient-GradientType="Bottom"
                    Text="回上頁" Width="80px" meta:resourcekey="BackButtonResource1" RunAtCient="False"
                    OnClick="BackButton_Click">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
