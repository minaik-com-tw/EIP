<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Developer.InputSelect, App_Web_inputselect.aspx.87a0902e" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="SmoothEnterprise.Web.UI.HTMLControl.InputSelect" Caption="Class Library"
        Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px"
        IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet">
        </DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table style="width: 80%;">
        <tr>
            <td valign="top">
                <table width="100%" style="background-color: #339933; filter: progid:DXImageTransform.Microsoft.Gradient(startColorStr='#FFFFFFF', endColorStr='#55AAFFAA', gradientType='1');
                    border-right: #000099 1px solid; border-top: #000099 1px solid; border-left: #000099 1px solid;
                    border-bottom: #000099 1px solid;">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;">
                            <asp:Label ID="L_classname" runat="server" Text="類別名稱"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal" style="height:30px">
                            SmoothEnterprise.Web.UI.HTMLControl.<strong>InputSelect</strong>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="5">
            </td>
        </tr>
        <tr>
            <td Class="Normal">
                <table width="100%">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;
                            height: 20px;">
                            <asp:Label ID="L_properties" runat="server" Text="屬性"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid">
                                <tr>
                                    <td width="1%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                    </td>
                                    <td width="20%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                        Name
                                    </td>
                                    <td Class="NormalBold" style="color: #ffffff; background-color: #003300;" align="center">
                                        Description
                                    </td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        Items</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_items" runat="server" Text="下拉選單的項目集合，Item物件屬性請參閱'Item屬性'"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ItemAllDisplayed</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_Itemalldisplayed" runat="server" Text="是否加入&lt;全部&gt;項目"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ItemAll</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_itemall" runat="server" Text="設定&lt;全部&gt;項目的屬性"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ItemNoneDisplayed</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_itemnonedisplayed" runat="server" Text="是否加入-未指定-項目"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ItemNone</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_itemnone" runat="server" Text="設定-未指定-項目的屬性"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        Editable</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_editable" runat="server" Text="是否允許編輯(可輸入字串)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Personalize</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_personalize" runat="server">設定是否啟用個人化功能</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Required</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_required" runat="server">是否啟用空白驗證</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ErrorMessage</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_rrrormessage" runat="server">當驗證失敗時的錯誤訊息</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        Value</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_value" runat="server" Text="取得或設定選取項目的值"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        SelectedItems</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_selecteditems" runat="server" Text="取得選取項目的Item物件"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td Class="Normal">
                <table width="100%">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;
                            height: 20px;">
                            <asp:Label ID="L_properties_item" runat="server" Text="Item屬性"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid">
                                <tr>
                                    <td width="1%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                    </td>
                                    <td width="20%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                        Name
                                    </td>
                                    <td Class="NormalBold" style="color: #ffffff; background-color: #003300;" align="center">
                                        Description
                                    </td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Text</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_item_text" runat="server" Text="設定項目顯示名稱"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Value</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_item_value" runat="server" Text="設定項目的資料值"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        GroupText</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_item_grouptext" runat="server" Text="設定項目的群組名稱，全部項目無設定則不會顯示群組"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        IconUrl</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_item_iconurl" runat="server" Text="設定項目的圖是圖檔連結"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Selected</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_item_selected" runat="server" Text="設定項目的是否預設選取"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Gradient</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_item_gradient" runat="server" Text="設定項目的漸層樣式"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="5">
            </td>
        </tr>
        <tr>
            <td Class="Normal">
                <table width="100%">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;
                            height: 20px;">
                            <asp:Label ID="L_Demo" runat="server" Text="展示"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid">
                                <tr>
                                    <td Class="NormalBold" style="color: #ffffff; background-color: #003300;" align="center">
                                        Style
                                    </td>
                                    <td width="80%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                        Properties Setting
                                    </td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff;" valign="top">
                                        <strong>Default<br />
                                            <SmoothEnterpriseWebControl:InputSelect ID="InputSelect1" runat="server" BackColor="#F0F0F0"
                                                CssClass="Normal" ItemAll-Value="%" TextBoxStyle="ThreeDStyle" Editable="False">
                                                <Items>
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem1" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                        Style="filter: ;" Text="紅" Value="Red" />
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem2" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                        Style="filter: ;" Text="黃" Value="Yellow" />
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                        Style="filter: ;" Text="綠" Value="Green" />
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem4" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                        Style="filter: ;" Text="藍" Value="Blue" />
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem5" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                        Style="filter: ;" Text="紫" Value="Purple" />
                                                </Items>
                                                <ErrorStyle BorderStyle="NotSet" />
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputSelect>
                                        </strong>
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        &lt;Default Setting&gt;</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <strong>Required Select</strong><br />
                                        <SmoothEnterpriseWebControl:InputSelect ID="InputSelect2" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" ItemAll-Value="%" TextBoxStyle="ThreeDStyle" Editable="False"
                                            ErrorMessage="Please Input「Required Select」!!" ItemNoneDisplayed="True" Required="True">
                                            <Items>
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem11" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="紅" Value="Red" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem12" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="黃" Value="Yellow" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem13" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="綠" Value="Green" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem14" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="藍" Value="Blue" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem15" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="紫" Value="Purple" />
                                            </Items>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputSelect>
                                        <strong></strong>
                                        <SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" BackColor="#C8C8C8"
                                            BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                                            Font-Bold="True" Font-Names="Arial" Font-Size="12px" Text="Test">
                                            <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                                        </SmoothEnterpriseWebControl:InputButton></td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Required : true<br />
                                        ErrorMessage : "Please Input「Required Select」!!"</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <strong>ItemGroup<br />
                                        </strong>
                                        <SmoothEnterpriseWebControl:InputSelect ID="InputSelect3" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" ItemAll-Value="%" TextBoxStyle="ThreeDStyle" Editable="False">
                                            <Items>
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem21" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="Group1" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ; background-color: #ff0000; color: #ff0000;" Text="紅" Value="Red" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem22" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="Group1" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ; background-color: #ffff00; color: #ffff00;" Text="黃" Value="Yellow" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem23" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="Group1" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ; background-color: #008000; color: #008000;" Text="綠" Value="Green" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem24" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="Group2" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ; background-color: #0000ff; color: #0000ff;" Text="藍" Value="Blue" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem25" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="Group2" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ; background-color: #800080; color: #800080;" Text="紫" Value="Purple" />
                                            </Items>
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputSelect>
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Items - GroupText : &lt; 設定每個項目的群組名稱 &gt;<br />
                                        <span style="color: #ff0000">ps. 相同的群組名稱會被歸類在同一群組設定中</span></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <strong>ItemStyle<br />
                                            <SmoothEnterpriseWebControl:InputSelect ID="InputSelect4" runat="server" BackColor="#F0F0F0"
                                                CssClass="Normal" ItemAll-Value="%" TextBoxStyle="ThreeDStyle" Editable="False">
                                                <Items>
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem31" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" IconUrl="" RowHeight="18" Selected="False" Style="filter: ;
                                                        background-color: #ff0000;" Text="紅" Value="Red" BackColor="Red" GroupText="" />
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem32" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" IconUrl="" RowHeight="18" Selected="False" Style="filter: ;
                                                        background-color: #ffff00;" Text="黃" Value="Yellow" BackColor="Yellow" GroupText="" />
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem33" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" IconUrl="" RowHeight="18" Selected="False" Style="filter: ;
                                                        background-color: #008000;" Text="綠" Value="Green" BackColor="Green" GroupText="" />
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem34" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" IconUrl="" RowHeight="18" Selected="False" Style="filter: ;
                                                        background-color: #0000ff;" Text="藍" Value="Blue" BackColor="Blue" GroupText="" />
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem35" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" IconUrl="" RowHeight="18" Selected="False" Style="filter: ;
                                                        background-color: #800080;" Text="紫" Value="Purple" BackColor="Purple" GroupText="" />
                                                </Items>
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputSelect>
                                        </strong>
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Items - BackColor : &lt; 設定每個項目的背景顏色屬性 &gt;&nbsp;</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <strong>Editable </strong>(可輸入方塊)<br />
                                        <SmoothEnterpriseWebControl:InputSelect ID="InputSelect5" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" ItemAll-Value="%" TextBoxStyle="ThreeDStyle" Editable="True"
                                            Width="80px">
                                            <Items>
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem41" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="紅" Value="紅" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem42" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="黃" Value="黃" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem43" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="綠" Value="綠" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem44" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="藍" Value="藍" />
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem45" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="紫" Value="紫" />
                                            </Items>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputSelect>
                                        <strong></strong>
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Editable : true<br />
                                        <span style="color: #ff0000">ps. 使用此屬性，因為允許輸入，所以Items的Text必須與Value相同，取值才會一致</span></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <strong>Icon Items<SmoothEnterpriseWebControlEnterprise:SelectIconURL ID="SelectIconURL1"
                                            runat="server" BackColor="#F0F0F0" CssClass="Normal" Editable="True" EditIconDisplayed="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControlEnterprise:SelectIconURL>
                                        </strong>
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Editable : true<br />
                                        EditIconDisplayed : true<br />
                                        Items - IconUrl : &lt; 設定每個項目的圖示連結 &gt;<span style="color: #ff0000"></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 5px">
            </td>
        </tr>
        <tr>
            <td Class="Normal">
                <table width="100%">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;
                            height: 20px;">
                            <asp:Label ID="L_Example" runat="server" Text="程式範例"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid">
                                <tr>
                                    <td Class="NormalBold" style="color: #ffffff; background-color: #003300;" align="center">
                                        Example
                                    </td>
                                    <td width="30%" align="center" Class="NormalBold" style="color: #ffffff; background-color: #003300">
                                        Description</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <span style="color: #339900">// <strong>資料庫來源項目程式設計範例</strong></span><br />
                                        <span style="color: #0000ff">protected void</span> Page_Load(<span style="color: #0000ff">object</span>
                                        sender, System.<span style="color: #339999">EventArgs</span> e)<br />
                                        {<br />
                                        &nbsp; &nbsp; SmoothEnterprise.Database.<span style="color: #339999">DataSet</span>
                                        ds = <span style="color: #0000ff">new</span> SmoothEnterprise.Database.<span style="color: #339999">DataSet</span>();<br />
                                        &nbsp; &nbsp; ds.Open(<span style="color: #cc0000">"SELECT * FROM <strong>Table</strong>
                                            ORDER BY <strong>seq</strong>"</span>);
                                        <br />
                                        &nbsp; &nbsp; <span style="color: #0000ff">while</span> (!ds.EOF)<br />
                                        &nbsp; &nbsp; {<br />
                                        &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #0000ff">this</span>.<strong>InputSelect</strong>.Items.Add(ds[<span
                                            style="color: #cc0000">"<strong>Text</strong>"</span>].ToString(), ds[<span style="color: #cc0000">"<strong>Value</strong>"</span>].ToString());<br />
                                        &nbsp; &nbsp; &nbsp; &nbsp; ds.MoveNext();<br />
                                        &nbsp; &nbsp; }<br />
                                        }</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        本範例以SmoothEnterprise 的資料庫物件DataSet作資料表的查詢功能，使用者可以依個人喜好來使用何種資料庫物件<br />
                                        <br />
                                        使用InpitSelect.Items.Add() Method 將資料庫所得資料加入InputSelect的項目集合中<br />
                                        <br />
                                        <span style="color: #ff0000">ps.此段程式建議再Page_load()事件上處理，並且每一次Postback都必須重新處理</span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
