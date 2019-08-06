<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.MyApprovalEdit, App_Web_myapprovaledit.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="Program Name" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0" Class="Normal">
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_id" runat="server" Text="ID" meta:resourcekey="LABEL_idResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_id" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_idResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_text" runat="server" Text="描述" meta:resourcekey="LABEL_textResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_text" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_textResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_fid" runat="server" Text="FID" meta:resourcekey="LABEL_fidResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_fid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fidResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_fnid" runat="server" Text="fnid" meta:resourcekey="LABEL_fnidResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_fnid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fnidResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_requestuid" runat="server" Text="Requestuid" meta:resourcekey="LABEL_requestuidResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_requestuid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_requestuidResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_requesturl" runat="server" Text="Requesturl" meta:resourcekey="LABEL_requesturlResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_requesturl" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_requesturlResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                 <asp:Label ID="LABEL_revieweruid" runat="server" Text="Revieweruid" meta:resourcekey="LABEL_revieweruidResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_revieweruid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_revieweruidResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                 <asp:Label ID="LABEL_reviewerurl" runat="server" Text="Reviewerurl" meta:resourcekey="LABEL_reviewerurlResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_reviewerurl" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewerurlResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_arguments" runat="server" Text="Arguments" meta:resourcekey="LABEL_argumentsResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_arguments" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_argumentsResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_parameters" runat="server" Text="Parameters" meta:resourcekey="LABEL_parametersResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_parameters" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_parametersResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_receivedate" runat="server" Text="接收日期" meta:resourcekey="LABEL_receivedateResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_receivedate" runat="server" FormatType="Date"
                    BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_receivedateResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_reviewdate" runat="server" Text="審核日期" meta:resourcekey="LABEL_reviewdateResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_reviewdate" runat="server" FormatType="Date"
                    BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewdateResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_reviewresult" runat="server" Text="審核結果" meta:resourcekey="LABEL_reviewresultResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_reviewresult" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewresultResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_reviewoptions" runat="server" Text="Reviewoptions" meta:resourcekey="LABEL_reviewoptionsResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_reviewoptions" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewoptionsResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_resulttype" runat="server" Text="Resulttype" meta:resourcekey="LABEL_resulttypeResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_resulttype" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_resulttypeResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_priority" runat="server" Text="重要性" meta:resourcekey="LABEL_priorityResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_priority" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_priorityResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_qseq" runat="server" Text="Qseq" meta:resourcekey="LABEL_qseqResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_qseq" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_qseqResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_inituid" runat="server" Text="建立日期" meta:resourcekey="LABEL_inituidResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_inituid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_inituidResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_initdate" runat="server" Text="建立日期" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_initdate" runat="server" FormatType="Date"
                    BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_initdateResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_modifyuid" runat="server" Text="更新人員" meta:resourcekey="LABEL_modifyuidResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_modifyuid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifyuidResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_modifydate" runat="server" Text="更新日期" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_modifydate" runat="server" FormatType="Date"
                    BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifydateResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="SaveButton" runat="server" Width="80px"
                    Text="儲存" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BackButton" runat="server" Width="80px"
                    Text="回上頁" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
