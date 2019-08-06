<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="DefaultCustomize, App_Web_defaultcustomize.aspx.dd4e8b7f" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Caption="Program Name" CssClass="Normal" Details="The desciption for this program"
        Gradient="None" Height="40%" IconHeight="" IconWidth="" 
        PaddingSpace="5px" Width="100%" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle BorderStyle="NotSet" CssClass="Medium" Font-Bold="True" />
        <DetailsStyle BorderStyle="NotSet" Font-Names="Arial" Font-Size="11px"
            ForeColor="Gray" />
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0">
        <tr>
            <td class="NormalBold">
                <asp:Label ID="LABEL_calendar" runat="server" 
                    Text="是否顯示行事曆" meta:resourcekey="LABEL_calendarResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:CheckBoxList ID="FIELD_calendar" runat="server" CheckMode="SingleRadio"
                    CssClass="Normal" RadioUnCheck="True"
                    Value="Y" Width="120px" ListDirection="Horizontal" meta:resourcekey="FIELD_calendarResource1">
                    <Items>
                        <SmoothEnterpriseWebControl:CheckBoxListItem Description="" GroupText="" 
                            Selected="True" Text="Yes" Value="Y" />
                        <SmoothEnterpriseWebControl:CheckBoxListItem Description="" GroupText="" 
                            Selected="False" Text="No" Value="N" />
                    </Items>
                    <DescriptionStyle BorderStyle="NotSet" />
                    <GroupHeaderStyle BackColor="Gray" BorderColor="192, 192, 0" BorderStyle="NotSet" Font-Bold="True" ForeColor="White" Gradient="Right" GradientEnd="192, 192, 0"
                        GradientLevel="100" />
                </SmoothEnterpriseWebControl:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="NormalBold">
                <asp:Label ID="LABEL_reminder" runat="server" 
                    Text="是否顯示提醒項目方塊" meta:resourcekey="LABEL_reminderResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:CheckBoxList ID="FIELD_reminder" runat="server" CheckMode="SingleRadio"
                    CssClass="Normal"  RadioUnCheck="True"
                    Value="Y" Width="120px" ListDirection="Horizontal" meta:resourcekey="FIELD_reminderResource1">
                    <Items>
                        <SmoothEnterpriseWebControl:CheckBoxListItem Description="" GroupText="" 
                            Selected="True" Text="Yes" Value="Y" />
                        <SmoothEnterpriseWebControl:CheckBoxListItem Description="" GroupText="" 
                            Selected="False" Text="No" Value="N" />
                    </Items>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                    <GroupHeaderStyle BackColor="Gray" BorderColor="192, 192, 0" BorderStyle="NotSet" Font-Bold="True" ForeColor="White" Gradient="Right" GradientEnd="192, 192, 0"
                        GradientLevel="100" CssClass="" />
                </SmoothEnterpriseWebControl:CheckBoxList>
            </td>
        </tr>
        
         <tr>
            <td class="NormalBold">
                <asp:Label ID="LABEL_news" runat="server" 
                    Text="是否顯示最新消息" meta:resourcekey="LABEL_newsResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:CheckBoxList ID="FIELD_news" runat="server" CheckMode="SingleRadio"
                    CssClass="Normal"  RadioUnCheck="True"
                    Value="Y" Width="120px" ListDirection="Horizontal" meta:resourcekey="FIELD_newsResource1">
                    <Items>
                        <SmoothEnterpriseWebControl:CheckBoxListItem Description="" GroupText="" 
                            Selected="True" Text="Yes" Value="Y" />
                        <SmoothEnterpriseWebControl:CheckBoxListItem Description="" GroupText="" 
                            Selected="False" Text="No" Value="N" />
                    </Items>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                    <GroupHeaderStyle BackColor="Gray" BorderColor="192, 192, 0" BorderStyle="NotSet" Font-Bold="True" ForeColor="White" Gradient="Right" GradientEnd="192, 192, 0"
                        GradientLevel="100" CssClass="" />
                </SmoothEnterpriseWebControl:CheckBoxList>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" 
                    OnClick="BUTTON_save_Click" RunAtCient="False" Text="儲存" Width="80px" meta:resourcekey="BUTTON_saveResource1">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" 
                    OnClick="BUTTON_back_Click" RunAtCient="False" Text="回上頁" Width="80px" meta:resourcekey="BUTTON_backResource1">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
    
</asp:Content>

