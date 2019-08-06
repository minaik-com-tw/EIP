<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal._Default, App_Web_default.aspx.cdcab7d2" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Src="uc/CalendarBox.ascx" TagName="CalendarBox" TagPrefix="uc2" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Portal.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register TagPrefix="uc1" TagName="ReminderBox" Src="uc/ReminderBox.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ContentRecently" Src="uc/ContentRecently.ascx" %>
<%@ Register TagPrefix="uc1" TagName="NewsBox" Src="uc/NewsBox.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:CategoryPath ID="CategoryPath2" runat="server"
        BackColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"
        Font-Size="11px" Font-Names="Arial" Width="100%" ForeColor="Black" RootURL="~/"
        CategoryURL="~/portal/" RootName="Home" RequestQueryID="cid" CID="" OnOnClickLink="CategoryPath2_ClickLink" />
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="Program Name" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight=""
        IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"
            CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr valign="top">
            <td style="padding-right: 2px">
                <table cellspacing="0" cellpadding="0" width="100%">
                    <tr id="QueryBlock" runat="server">
                        <td style="border-right: #6f99a8 1px solid; padding-right: 2px; border-top: #6f99a8 1px solid;
                            padding-left: 2px; filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55ffffff, endcolorstr=#30316c84);
                            padding-bottom: 2px; border-left: #6f99a8 1px solid; padding-top: 2px; border-bottom: #6f99a8 1px solid;
                            background-color: #c3dfe0">
                            <table style="font-weight: bold; font-size: 11px; color: #316c84; font-family: Tahoma, Arial"
                                cellpadding="0">
                                <tr>
                                    <td id="expandlevel" style="padding-right: 3px; padding-left: 3px; height: 22px;" nowrap="nowrap">
                                        <asp:Label ID="LABEL_expandlevel" runat="server" meta:resourcekey="LABEL_expandlevelResource1">展開階層</asp:Label>
                                    </td>
                                    <td style="height: 22px">
                                        <SmoothEnterpriseWebControl:InputSelect ID="ExpandedLevel" runat="server" BackColor="#D5E8E8"
                                            BorderColor="CadetBlue" BorderStyle="Solid" BorderWidth="1px" Font-Size="11px"
                                            Font-Names="Tahoma" ForeColor="Black" Value="2" TextBoxStyle="FlatStyle" ButtonClick="True"
                                            FadeSpeed="NoFade" Width="96px" ButtonIconUrl="" Editable="False" ErrorMessage=""
                                            IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                                            ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                                            ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                                            meta:resourcekey="ExpandedLevelResource1" Mode="Single">
                                            <Items>
                                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="1 level" Selected="False"
                                                    Value="1" IconUrl="img/icon-level1.gif" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                    Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource1">
                                                </SmoothEnterpriseWebControl:SelectItem>
                                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="2 levels" Selected="True"
                                                    Value="2" IconUrl="img/icon-level2.gif" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                    Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource2">
                                                </SmoothEnterpriseWebControl:SelectItem>
                                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="3 levels" Selected="False"
                                                    Value="3" IconUrl="img/icon-level3.gif" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                    Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource3">
                                                </SmoothEnterpriseWebControl:SelectItem>
                                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="All levels" Selected="False"
                                                    Value="0" IconUrl="img/icon-levelall.gif" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                    Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource4">
                                                </SmoothEnterpriseWebControl:SelectItem>
                                            </Items>
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputSelect>
                                    </td>
                                    <td id="displaymode" style="padding-right: 3px; padding-left: 3px; height: 22px;" nowrap="nowrap">
                                        &nbsp;<asp:Label ID="LABEL_displaymode" runat="server" meta:resourcekey="LABEL_displaymodeResource1">顯示模式</asp:Label>
                                    </td>
                                    <td style="height: 22px">
                                        <SmoothEnterpriseWebControl:InputSelect ID="ShowCategory" runat="server" BackColor="#D5E8E8"
                                            BorderColor="CadetBlue" BorderStyle="Solid" BorderWidth="1px" Font-Size="11px"
                                            Font-Names="Tahoma" ForeColor="Black" Value="2" TextBoxStyle="FlatStyle" Width="136px"
                                            ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade"
                                            IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                                            ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                                            ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                                            meta:resourcekey="ShowCategoryResource1" Mode="Single">
                                            <Items>
                                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="All categories" Selected="False"
                                                    Value="1" IconUrl="" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                    Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource5">
                                                </SmoothEnterpriseWebControl:SelectItem>
                                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="Authorized Contents"
                                                    Selected="True" Value="2" IconUrl="" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                    Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource6">
                                                </SmoothEnterpriseWebControl:SelectItem>
                                            </Items>
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputSelect>
                                    </td>
                                    <td id="layoutcolumns" style="padding-right: 3px; padding-left: 3px; height: 22px;" nowrap="nowrap">
                                        &nbsp;<asp:Label ID="LABEL_layoutcolumns" runat="server" meta:resourcekey="LABEL_layoutcolumnsResource1">區塊</asp:Label></td>
                                    <td style="height: 22px">
                                        <SmoothEnterpriseWebControl:InputSelect ID="Columns" runat="server" BackColor="#D5E8E8"
                                            BorderColor="CadetBlue" BorderStyle="Solid" BorderWidth="1px" Font-Size="11px"
                                            Font-Names="Tahoma" ForeColor="Black" Value="2" TextBoxStyle="FlatStyle" Width="48px"
                                            ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade"
                                            IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                                            ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                                            ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                                            meta:resourcekey="ColumnsResource1" Mode="Single">
                                            <Items>
                                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="1" Selected="False" Value="1"
                                                    IconUrl="" GroupText="" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                    runat="server" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource7">
                                                </SmoothEnterpriseWebControl:SelectItem>
                                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="2" Selected="True" Value="2"
                                                    IconUrl="" GroupText="" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                    runat="server" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource8">
                                                </SmoothEnterpriseWebControl:SelectItem>
                                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="3" Selected="False" Value="3"
                                                    IconUrl="" GroupText="" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                    runat="server" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource9">
                                                </SmoothEnterpriseWebControl:SelectItem>
                                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="4" Selected="False" Value="4"
                                                    IconUrl="" GroupText="" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                    runat="server" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource10">
                                                </SmoothEnterpriseWebControl:SelectItem>
                                            </Items>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputSelect>
                                    </td>
                                    <td style="height: 22px">
                                        &nbsp;<SmoothEnterpriseWebControl:InputButton ID="ButtonRefresh" runat="server" BackColor="#C3DFE0"
                                            BorderColor="Teal" BorderStyle="Solid" BorderWidth="1px" Font-Size="11px" Font-Names="Tahoma"
                                            ForeColor="#316C84" Width="64px" Font-Bold="True" Text="更新" Height="20px" meta:resourcekey="ButtonRefreshResource1"
                                            RunAtCient="False">
                                            <Gradient GradientEnd="White" GradientType="Top" GradientBegin="136, 136, 136"></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton></td>
                                    <td style="height: 22px">
                                        <SmoothEnterpriseWebControl:InputButton ID="ButtonEdit" runat="server" BackColor="CadetBlue"
                                            BorderColor="Teal" BorderStyle="Solid" BorderWidth="1px" Font-Size="11px" Font-Names="Tahoma"
                                            ForeColor="White" Width="64px" Font-Bold="True" Text="管理" Visible="False" meta:resourcekey="ButtonEditResource1"
                                            RunAtCient="False">
                                            <Gradient GradientEnd="" GradientType="Top" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="QueryBlock1" runat="server">
                        <td bgcolor="#c4cde6" height="1">
                        </td>
                    </tr>
                </table>
                <SmoothEnterpriseWebControlEnterprise:CategoryContent ID="CategoryContent1" runat="server"
                    BackColor="#E6E9F3" BorderColor="#B6BFD8" BorderStyle="Solid" BorderWidth="1px"
                    Font-Size="11px" Font-Names="Tahoma" Width="100%" Height="150px" MaxContentCount="5"
                    EnableLog="True" DisplayMode="Mode2" ForeColor="#969FB8" meta:resourcekey="CategoryContent1Resource1" OnOnClickLink="CategoryContent1_OnClickLink">
                    <ContentStyle Gradient="Bottom" DescriptionFont-Size="11px" DescriptionFont-Names="Arial"
                        BorderWidth="1px" BorderColor="182, 191, 216" DescriptionForeColor="Gray" BorderStyle="Solid"
                        NameForeColor="Black" NameFont-Size="12px" NameFont-Names="Arial" NameFont-Bold="True"
                        GradientBegin="Lavender" PaddingSize="5px" BackColor="AliceBlue" GradientEnd="White"
                        GradientLevel="150" CssClass=""></ContentStyle>
                    <CategoryStyle DescriptionFont-Size="11px" DescriptionFont-Names="Arial" Font-Size="12px"
                        Font-Names="Arial" DescriptionForeColor="109, 125, 171" NameForeColor="32, 53, 115"
                        NameFont-Bold="True" GradientBegin="173, 184, 217" PaddingSize="5px" GradientEnd="White"
                        GradientLevel="50" BorderStyle="NotSet" CssClass=""></CategoryStyle>
                </SmoothEnterpriseWebControlEnterprise:CategoryContent>
                <table cellspacing="4" cellpadding="0" style="border-right: silver 1px solid; border-top: silver 1px solid;
                    margin-top: 2px; background-image: url(/lib/img/bg-linesilver.gif); border-left: silver 1px solid;
                    border-bottom: silver 1px solid; background-color: lavender" width="100%" id="homepanel"
                    runat="server">
                    <tr valign="top">
                        <td width="100%">
                            <SmoothEnterpriseWebControlEnterprise:OnlineUsers ID="OnlineUsers1" runat="server"
                                Font-Size="11px" Font-Names="Tahoma" ForeColor="#404040" Personalize="True" Visible="False"
                                meta:resourcekey="OnlineUsers1Resource1"></SmoothEnterpriseWebControlEnterprise:OnlineUsers>
                        </td>
                        <td>
                            <uc1:ContentRecently ID="ContentRecently1" runat="server"></uc1:ContentRecently>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="1%">
                <uc2:CalendarBox ID="CalendarBox1" runat="server" />
                <uc1:ReminderBox ID="ReminderBox1" runat="server"></uc1:ReminderBox>
                <uc1:NewsBox ID="NewsBox1" runat="server"></uc1:NewsBox>
                <table width="182" cellspacing="0" cellpadding="1" style="margin-top: 2px; background-color: darkgray"
                    id="adrotator" runat="server">
                    <tr>
                        <td>
                            <asp:AdRotator ID="AdRotator1" runat="server" Height="40px" Width="180px" AdvertisementFile="/portalad.xml"
                                meta:resourcekey="AdRotator1Resource1"></asp:AdRotator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
