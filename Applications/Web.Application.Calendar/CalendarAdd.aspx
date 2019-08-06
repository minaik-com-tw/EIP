<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.calendarAdd, App_Web_calendaradd.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Src="uc/CalendarNavigator.ascx" TagName="CalendarNavigator" TagPrefix="uc1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table Class="Normal" width="100%" border="0">
        <tr Class="NormalBold">
            <td height="23">
                <asp:Label ID="LABEL_calendarname" runat="server" Text="行事曆名稱" meta:resourcekey="LABEL_calendarnameResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" Width="312px"
                    BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入行事曆名稱" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"
                    ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext></td>
            <tr Class="NormalBold">
                <td>
                    <asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
            </tr>
            <tr>
                <td height="26">
                    <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" Width="312px"
                        BackColor="#F0F0F0" Height="56px" CssClass="Normal" 
                        TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:inputtext></td>
            </tr>
            <tr Class="NormalBold">
                <td>
                    <asp:Label ID="LABEL_calendarcategory" runat="server" Text="行事曆類別" meta:resourcekey="LABEL_calendarcategoryResource1"></asp:Label><font color="#0000a0">(Recommended)</font></td>
            </tr>
            <tr>
                <td>
                    <SmoothEnterpriseWebControl:InputText ID="FIELD_category" runat="server" Width="312px"
                        BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_categoryResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:inputtext></td>
            </tr>
            <tr Class="NormalBold">
                <td>
                    <asp:Label ID="LABEL_privcy" runat="server" Text="預設授權方式" meta:resourcekey="LABEL_privcyResource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <SmoothEnterpriseWebControl:CheckBoxList ID="FIELD_privcy" runat="server" Width="312px"
                        CssClass="Normal" CheckMode="SingleRadio" Column="2" meta:resourcekey="FIELD_privcyResource1" Value="0">
                        <GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
                            Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
                        <Items>
                            <SmoothEnterpriseWebControl:CheckBoxListItem Text="授權全部使用者" Selected="True" Value="0"
                                GroupText="" Description="" meta:resourcekey="CheckBoxListItem1_privcyResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
                            <SmoothEnterpriseWebControl:CheckBoxListItem Text="不授權任何使用者" Selected="False" Value="1"
                                GroupText="" Description="" meta:resourcekey="CheckBoxListItem2_privcyResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
                        </Items>
                        <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:CheckBoxList>
                </td>
            </tr>
            <tr Class="NormalBold">
                <td>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <SmoothEnterpriseWebControl:CheckBoxList ID="FIELD_noinvite" runat="server" CssClass="Normal"
                                    Font-Bold="True" Width="24px" meta:resourcekey="FIELD_noinviteResource1" Value="">
                                    <GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
                                        Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
                                    <Items>
                                        <SmoothEnterpriseWebControl:CheckBoxListItem Text=" " Selected="False" Value="Y"
                                            GroupText="" Description=""></SmoothEnterpriseWebControl:CheckBoxListItem>
                                    </Items>
                                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:CheckBoxList>
                            </td>
                            <td Class="NormalBold">
                                <asp:Label ID="LABEL_noinvite" runat="server" Text="此行事曆不允許被邀請" meta:resourcekey="LABEL_noinviteResource1"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr Class="NormalBold">
                <td height="22" valign="middle">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <SmoothEnterpriseWebControl:CheckBoxList ID="FIELD_enabled" runat="server" CssClass="Normal"
                                    Font-Bold="True" Width="24px" meta:resourcekey="FIELD_enabledResource1" Value="Y">
                                    <GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
                                        Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
                                    <Items>
                                        <SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text=" " Description=""
                                            Value="Y" GroupText=""></SmoothEnterpriseWebControl:CheckBoxListItem>
                                    </Items>
                                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:CheckBoxList>
                            </td>
                            <td Class="NormalBold">
                                <asp:Label ID="LABEL_enablecalendar" runat="server" Text="Enable" meta:resourcekey="LABEL_enablecalendarResource1"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Width="80px"
                        Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                        BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Text="儲存" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                        <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                    </SmoothEnterpriseWebControl:InputButton>&nbsp;
                    <SmoothEnterpriseWebControl:InputButton ID="BUTTON_savenext" runat="server" Font-Names="Arial"
                        Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                        BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Text="儲存後繼續操作" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_savenextResource1" RunAtCient="False">
                        <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                    </SmoothEnterpriseWebControl:InputButton>&nbsp;
                    <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Width="80px"
                        Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                        BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Text="回上頁" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                        <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                    </SmoothEnterpriseWebControl:InputButton></td>
            </tr>
    </table>
</asp:Content>
