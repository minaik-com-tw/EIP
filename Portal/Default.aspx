<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="SmoothEnterprise.Web.Application.Portal.Default" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" %>



<%@ Register Src="uc/CalendarBox.ascx" TagName="CalendarBox" TagPrefix="uc2" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Portal.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<%@ Register Assembly="SmoothEnterpriseT.Web.Control.EnterpriseT, Version=3.0.0.0, Culture=neutral, PublicKeyToken=dd228b3ee1378eb3"
    Namespace="SmoothEnterpriseT.Content.UI.WebControl" TagPrefix="EnterpriseT" %>

<%@ Register TagPrefix="uc1" TagName="ReminderBox" Src="uc/ReminderBox.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ContentRecently" Src="uc/ContentRecently.ascx" %>
<%@ Register TagPrefix="uc1" TagName="NewsBox" Src="uc/NewsBox.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center">
        <tr>
            <td style="width: 100%">

                <EnterpriseT:TCategoryPath ID="CategoryPath2" runat="server"
                    BackColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"
                    Font-Size="11px" Font-Names="Arial" Width="100%" ForeColor="Black" RootURL="~/"
                    CategoryURL="~/portal/" RootName="Home" RequestQueryID="cid" CID="" OnOnClickLink="CategoryPath2_ClickLink" />

                <table cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
                </table>
                <table cellspacing="0" cellpadding="0" width="1008px" border="1">
                    <tr>
                        <td colspan="3" style="vertical-align: top; height: 36px;">
                            <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" align="center"
                                Details="The desciption for this program" Caption="Program Name" Width="100%"
                                CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight=""
                                IconWidth="" meta:resourcekey="ContentDescriptorResource1">
                                <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
                                <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"
                                    CssClass=""></DetailsStyle>
                            </SmoothEnterpriseWebControlEnterprise:Descriptor>

                            <table cellspacing="0" cellpadding="0" width="1014">
                                <tr id="QueryBlock1" runat="server">
                                    <td bgcolor="#c4cde6" style="width: 1360px; height: 1px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2" style="vertical-align: top; width: 138px" id="ba">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Portal/img/title1_1.jpg" />
                            <select name="archivemenu" onchange="window.open(this.options[this.selectedIndex].value,'_blank');" style="width: 180px; height: 17px; background-color: white;">

                                <option selected="selected">請選擇...</option>
                                <option value="http://eip.mam.minaik.com/">員工入口網站MAM</option>
                                <option value="http://eip.matc.minaik.com/">員工入口網站MATC</option>
                                <option value="http://eip.map.minaik.com.tw/">員工入口網站MAP</option>
                                <option value="http://222.92.38.178:1080/portal/default.aspx">員工入口網站MAY</option>
                                <option disabled="disabled">員工入口網站MUM(建中)</option>
                            </select><uc1:ReminderBox ID="ReminderBox1" runat="server"></uc1:ReminderBox>
                            <a href="http://eip.minaik.com.tw/Emp_talk/bulletin.aspx">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Portal/img/emp_mail.jpg" Width="183px" /><br />
                            </a>

                            <a href="http://exmail.minaik.com.tw">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Portal/img/webmail.jpg" Width="183px" /><br />
                            </a>
                            <a href="mailto:Help@minaik.com.tw">
                                <asp:Image ID="Image15" runat="server" ImageUrl="~/Portal/img/性騷擾.jpg" Width="183px" /><br />
                            </a>

                            <a href="\Dkm\dkm.aspx?lid=D0007">
                                <asp:Image ID="Image79" runat="server" ImageUrl="~/Portal/img/trust.gif" Width="183px" /><br />
                            </a>


                            <a href="http://eip.minaik.com.tw/DCM/DCM.aspx?Num=T0005&ID=6d228774-7a27-4eba-8d1f-096bc55b6528">
                                <asp:Image ID="Image7" runat="server" ImageUrl="~/Portal/img/emp.jpg" Width="183px" /><br />
                            </a>

                            <a href="http://hrp.minaik.com.tw/" target="_blank">
                                <asp:Image ID="HR001" runat="server" ImageUrl="~/Portal/img/HR0001.png" Width="183px" AlternateText="銘異人力資源入口網" /><br />
                            </a>


                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Portal/img/title1_2.jpg" /><br />
                            <asp:Image ID="Image32" runat="server" ImageUrl="~/Portal/img/title2_1.jpg" />
                            <asp:DataList ID="DataList3" runat="server" Width="172px">
                                <ItemTemplate>

                                    <asp:Image ID="Image30" runat="server" Height="16px" ImageUrl="~/Portal/img/a1.png" Width="15px" />

                                </ItemTemplate>
                            </asp:DataList>

                            <table style="width: 130%">
                                <tr>
                                    <td style="width: 290px"></td>
                                    <td style="width: 100px">
                                        <a target='_BLANK' href="http://www.storagenewsletter.com/">
                                            <asp:Image ID="Image33" runat="server" ImageUrl="~/Portal/img/more3.gif" ImageAlign="Right" /></a></td>
                                </tr>
                            </table>


                            <asp:Image ID="Image26" runat="server" ImageUrl="~/Portal/img/title1_3.jpg" /><br />
                            <iframe height="115" width="181" frameborder="0" scrolling="no" src="View66110.aspx" style="background-color: #BFEFFF" id="Iframe5"></iframe>
                            <table style="width: 130%">
                                <tr>
                                    <td style="width: 290px"></td>
                                    <td style="width: 100px">
                                        <a target='_BLANK' href="http://eip.minaik.com.tw/bulletin/bulletin.aspx?mid=B0008">
                                            <asp:Image ID="Image29" runat="server" ImageUrl="~/Portal/img/more3.gif" ImageAlign="Right" /></a></td>
                                </tr>
                            </table>
                            <asp:Image ID="Image27" runat="server" ImageUrl="~/Portal/img/title1_4.jpg" /><iframe height="115" width="181" frameborder="0" scrolling="no" src="View64110.aspx" style="background-color: #BFEFFF" id="Iframe6"></iframe>
                            <br />
                            <table style="width: 130%">
                                <tr>
                                    <td style="width: 290px"></td>
                                    <td style="width: 100px">
                                        <a target='_BLANK' href="http://eip.minaik.com.tw/bulletin/bulletin.aspx?mid=B0007">
                                            <asp:Image ID="Image34" runat="server" ImageUrl="~/Portal/img/more3.gif" ImageAlign="Right" /></a></td>
                                </tr>
                            </table>

                            <asp:Image ID="Image19" runat="server" ImageUrl="~/Portal/img/title1_5.jpg" /><br />
                            <asp:Image ID="Image37" runat="server" ImageUrl="~/Portal/img/title2_2.jpg" />

                            <center style="text-align: left">
                                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" Width="180px" Style="font-family: 新細明體; letter-spacing: 1px">
                                    <SelectedItemStyle Font-Size="Small" />
                                    <ItemTemplate>
                                        <asp:Image ID="Image20" runat="server" ImageUrl="~/Portal/img/123.gif" />
                                        <%--<asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>'></asp:Label><br />--%>
                                        <br />
                                    </ItemTemplate>
                                    <ItemStyle Font-Size="X-Small" />
                                </asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
                                    SelectCommand="SELECT subject FROM polling WHERE (id_s = '5') GROUP BY subject"></asp:SqlDataSource>
                            </center>
                            <br />
                            <table style="width: 130%">
                                <tr>
                                    <td style="width: 4080px"></td>
                                    <td style="width: 100px">
                                        <asp:Button ID="Button3" runat="server" PostBackUrl="~/Portal/Polling_in2.aspx" Text="投票己截止" CausesValidation="False" Style="direction: rtl" /></td>
                                </tr>


                            </table>





                        </td>

                        <td rowspan="2" style="vertical-align: text-top">
                            <table cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td style="border-right: #6f99a8 1px solid; padding-right: 2px; border-top: #6f99a8 1px solid; padding-left: 2px; filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55ffffff, endcolorstr=#30316c84); padding-bottom: 2px; border-left: #6f99a8 1px solid; padding-top: 2px; border-bottom: #6f99a8 1px solid; background-color: scrollbar; width: 1000px; height: 0px;">
                                        <table style="font-weight: bold; font-size: 11px; color: #316c84; font-family: Tahoma, Arial"
                                            cellpadding="0">
                                            <tr>
                                                <td id="expandlevel" style="padding-right: 3px; padding-left: 3px; height: 22px;" nowrap="nowrap">
                                                    <asp:Label ID="LABEL_expandlevel" runat="server" meta:resourcekey="LABEL_expandlevelResource1">展開階層</asp:Label>
                                                </td>
                                                <td style="height: 22px">
                                                    <SmoothEnterpriseWebControl:InputSelect ID="ExpandedLevel" runat="server" BackColor="ControlLight"
                                                        BorderColor="CadetBlue" BorderStyle="Solid" BorderWidth="1px" Font-Size="11px"
                                                        Font-Names="Tahoma" ForeColor="Black" Value="3" TextBoxStyle="FlatStyle" ButtonClick="True"
                                                        FadeSpeed="NoFade" Width="96px" ButtonIconUrl="" Editable="False" ErrorMessage=""
                                                        IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                                                        ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                                                        ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                                                        meta:resourcekey="ExpandedLevelResource1" Mode="Single">
                                                        <Items>
                                                            <SmoothEnterpriseWebControl:SelectItem ID="SelectItem1" RowHeight="18" Text="1 level" Selected="False"
                                                                Value="1" IconUrl="img/icon-level1.gif" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                                Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource1"></SmoothEnterpriseWebControl:SelectItem>
                                                            <SmoothEnterpriseWebControl:SelectItem ID="SelectItem2" RowHeight="18" Text="2 levels" Selected="False"
                                                                Value="2" IconUrl="img/icon-level2.gif" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                                Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource2"></SmoothEnterpriseWebControl:SelectItem>
                                                            <SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" RowHeight="18" Text="3 levels" Selected="True"
                                                                Value="3" IconUrl="img/icon-level3.gif" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                                Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource3"></SmoothEnterpriseWebControl:SelectItem>
                                                            <SmoothEnterpriseWebControl:SelectItem ID="SelectItem4" RowHeight="18" Text="All levels" Selected="False"
                                                                Value="0" IconUrl="img/icon-levelall.gif" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                                Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource4"></SmoothEnterpriseWebControl:SelectItem>
                                                        </Items>
                                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                        <Gradient GradientBegin="" GradientEnd=""></Gradient>
                                                    </SmoothEnterpriseWebControl:InputSelect>
                                                </td>
                                                <td id="displaymode" style="padding-right: 3px; padding-left: 3px; height: 22px;" nowrap="nowrap">&nbsp;<asp:Label ID="LABEL_displaymode" runat="server" meta:resourcekey="LABEL_displaymodeResource1">顯示模式</asp:Label>
                                                </td>
                                                <td style="height: 22px">
                                                    <SmoothEnterpriseWebControl:InputSelect ID="ShowCategory" runat="server" BackColor="ControlLight"
                                                        BorderColor="CadetBlue" BorderStyle="Solid" BorderWidth="1px" Font-Size="11px"
                                                        Font-Names="Tahoma" ForeColor="Black" Value="2" TextBoxStyle="FlatStyle" Width="136px"
                                                        ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade"
                                                        IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                                                        ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                                                        ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                                                        meta:resourcekey="ShowCategoryResource1" Mode="Single" Visible="false">
                                                        <Items>
                                                            <SmoothEnterpriseWebControl:SelectItem ID="SelectItem5" RowHeight="18" Text="All categories" Selected="False"
                                                                Value="1" IconUrl="" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                                Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource5"></SmoothEnterpriseWebControl:SelectItem>
                                                            <SmoothEnterpriseWebControl:SelectItem ID="SelectItem6" RowHeight="18" Text="Authorized Contents"
                                                                Selected="True" Value="2" IconUrl="" GroupText="" runat="server" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                                Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource6"></SmoothEnterpriseWebControl:SelectItem>
                                                        </Items>
                                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                        <Gradient GradientBegin="" GradientEnd=""></Gradient>
                                                    </SmoothEnterpriseWebControl:InputSelect>
                                                </td>
                                                <td id="layoutcolumns" style="padding-right: 3px; padding-left: 3px; height: 22px;" nowrap="nowrap">&nbsp;<asp:Label ID="LABEL_layoutcolumns" runat="server" meta:resourcekey="LABEL_layoutcolumnsResource1">區塊</asp:Label></td>
                                                <td style="height: 22px">
                                                    <SmoothEnterpriseWebControl:InputSelect ID="Columns" runat="server" BackColor="ControlLight"
                                                        BorderColor="CadetBlue" BorderStyle="Solid" BorderWidth="1px" Font-Size="11px"
                                                        Font-Names="Tahoma" ForeColor="Black" Value="2" TextBoxStyle="FlatStyle" Width="48px"
                                                        ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade"
                                                        IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                                                        ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                                                        ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                                                        meta:resourcekey="ColumnsResource1" Mode="Single">
                                                        <Items>
                                                            <SmoothEnterpriseWebControl:SelectItem ID="SelectItem7" RowHeight="18" Text="1" Selected="True" Value="1"
                                                                IconUrl="" GroupText="" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                                runat="server" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource7"></SmoothEnterpriseWebControl:SelectItem>
                                                            <SmoothEnterpriseWebControl:SelectItem ID="SelectItem8" RowHeight="18" Text="2" Selected="False" Value="2"
                                                                IconUrl="" GroupText="" Style="filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"
                                                                runat="server" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource8"></SmoothEnterpriseWebControl:SelectItem>

                                                        </Items>
                                                        <ErrorStyle BorderStyle="NotSet" />
                                                        <Gradient GradientBegin="" GradientEnd=""></Gradient>
                                                    </SmoothEnterpriseWebControl:InputSelect>
                                                </td>
                                                <td style="height: 22px">&nbsp;<SmoothEnterpriseWebControl:InputButton ID="ButtonRefresh" runat="server" BackColor="ControlLight"
                                                    BorderColor="Teal" BorderStyle="Solid" BorderWidth="1px" Font-Size="11px" Font-Names="Tahoma"
                                                    ForeColor="#316C84" Width="64px" Font-Bold="True" Text="更新" Height="20px" meta:resourcekey="ButtonRefreshResource1"
                                                    RunAtCient="False">
                                                    <Gradient GradientEnd="White" GradientType="Top" GradientBegin="136, 136, 136"></Gradient>
                                                </SmoothEnterpriseWebControl:InputButton></td>
                                                <td style="height: 22px"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                            <table border='1'>
                                <tr>

                                    <td style="width: 450px; height: 250px">
                                        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="450" height="250">
                                            <%--<param name="movie" value="img/1225.swf" />--%>
                                            <param name="movie" value="img/EIP2_6S.swf">

                                            <param name="wmode" value="opaque">
                                            <param name="quality" value="high">
                                            <!--<embed src="img/EIP2_6S.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="450" height="250" />
                                            -->
                                            <embed src="img/20181225.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="450" height="250" />

                                        </object>
                                    </td>



                                    <td style="background-color: scrollbar;">
                                        <asp:Image ID="Image12" runat="server" ImageUrl="~/Portal/img/title2_10.jpg" />
                                        <iframe height="220" width="180" frameborder="0" scrolling="no" src="ViewTest.aspx" style="background-color: scrollbar" id="1"></iframe>
                                    </td>
                                </tr>
                            </table>
                            ====================================
                           <%-- <EnterpriseT:TCategoryContent ID="CategoryContent1" runat="server" NewWithinDays="0"
                                BackColor="Window" BorderColor="#C0C0FF" BorderStyle="Solid" BorderWidth="1px"
                                Font-Size="11px" Font-Names="Tahoma" Width="100%" Height="1267px" MaxContentCount="5"
                                EnableLog="True" DisplayMode="Mode2" ForeColor="Black" meta:resourcekey="CategoryContent1Resource1" OnOnClickLink="CategoryContent1_OnClickLink">
                                <ContentStyle Gradient="Bottom" DescriptionFont-Size="11px" DescriptionFont-Names="Arial"
                                    BorderWidth="1px" BorderColor="182, 191, 216" DescriptionForeColor="Gray" BorderStyle="Solid"
                                    NameForeColor="Black" NameFont-Size="12px" NameFont-Names="Arial" NameFont-Bold="True"
                                    GradientBegin="Lavender" PaddingSize="5px" BackColor="Silver" GradientEnd="White"
                                    GradientLevel="150" CssClass=""></ContentStyle>
                                <CategoryStyle DescriptionFont-Size="11px" DescriptionFont-Names="Arial" Font-Size="12px"
                                    Font-Names="Arial" DescriptionForeColor="109, 125, 171" NameForeColor="32, 53, 115"
                                    NameFont-Bold="True" GradientBegin="173, 184, 217" PaddingSize="5px" GradientEnd="White"
                                    GradientLevel="50" BorderStyle="NotSet" CssClass=""></CategoryStyle>
                            </EnterpriseT:TCategoryContent>--%>
                            <EnterpriseT:TCategoryContent ID="CategoryContent1" runat="server" OnOnClickLink="CategoryContent1_OnClickLink">
                                <ContentStyle Gradient="Bottom" DescriptionFont-Size="11px" DescriptionFont-Names="Arial"
                                    BorderWidth="1px" BorderColor="182, 191, 216" DescriptionForeColor="Gray" BorderStyle="Solid"
                                    NameForeColor="Black" NameFont-Size="12px" NameFont-Names="Arial" NameFont-Bold="True"
                                    GradientBegin="Lavender" PaddingSize="5px" BackColor="Silver" GradientEnd="White"
                                    GradientLevel="150" CssClass=""></ContentStyle>
                                <CategoryStyle DescriptionFont-Size="11px" DescriptionFont-Names="Arial" Font-Size="12px"
                                    Font-Names="Arial" DescriptionForeColor="109, 125, 171" NameForeColor="32, 53, 115"
                                    NameFont-Bold="True" GradientBegin="173, 184, 217" PaddingSize="5px" GradientEnd="White"
                                    GradientLevel="50" BorderStyle="NotSet" CssClass=""></CategoryStyle>
                            </EnterpriseT:TCategoryContent>
                            =======================================
                        </td>

                    </tr>
            </td>
        </tr>
        <tr>
            <td style="width: 180; vertical-align: top;">
                <table>

                    <tr>
                        <td style="width: 80px; height: 149px;">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Portal/img/MRHsieh.gif" Width="81px" Height="91px" />

                            <center>
                                <hr />
                                <input type="button" value="CEO信箱" onclick='window.open("mailto:kh.hsieh@minaik.com.tw", "_self");'>
                            </center>
                        </td>
                        <td style="width: 100px; height: 149px; background-color: gainsboro; font-size: 12px;">
                            <asp:Image ID="Image13" runat="server" ImageUrl="~/Portal/img/love.png" />&nbsp;CEO的話&gt;&gt;<br />
                            銘異所有親愛的家人大家好,舉凡所有堅固的建築結構,中心的支柱雖是最重要的一個關鍵環節,但其他旁柱或側牆的穩固配合... <a href="http://eip.minaik.com.tw/Portal/CEO.aspx">More</a>
                            <br />

                        </td>
                    </tr>
                </table>
                <uc1:ContentRecently ID="ContentRecently1" runat="server" Visible="false"></uc1:ContentRecently>



                <uc1:NewsBox ID="NewsBox1" runat="server" Visible="false"></uc1:NewsBox>
                <asp:AdRotator ID="AdRotator1" runat="server" Height="7px" Width="164px" AdvertisementFile="/portalad.xml"
                    meta:resourcekey="AdRotator1Resource1" Visible="False"></asp:AdRotator>
                <iframe height="1400" width="181" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="ViewALL.aspx" style="background-color: #BFEFFF" id="Iframe12"></iframe>

    </table>
    <table cellspacing="4" cellpadding="0" style="border-right: silver 1px solid; border-top: silver 1px solid; margin-top: 2px; background-image: url(/lib/img/bg-linesilver.gif); border-left: silver 1px solid; border-bottom: silver 1px solid; background-color: lavender"
        width="1017" id="homepanel"
        runat="server">
        <tr valign="top">
            <td width="1017">
                <SmoothEnterpriseWebControlEnterprise:OnlineUsers ID="OnlineUsers1" runat="server"
                    Font-Size="11px" Font-Names="Tahoma" ForeColor="#404040" Personalize="True" Visible="False"
                    meta:resourcekey="OnlineUsers1Resource1"></SmoothEnterpriseWebControlEnterprise:OnlineUsers>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

