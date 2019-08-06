<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Developer.DataList, App_Web_datalist.aspx.87a0902e" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="SmoothEnterprise.Web.UI.WebControl.DataList" Caption="Class Library"
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
                            SmoothEnterprise.Web.UI.WebControl.<strong>DataList</strong>
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
                                        Columns</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_columns" runat="server" Text="資料清單的欄位物件集合(請參閱Column屬性)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        SQL</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_sql" runat="server" Text="資料表查詢SQL命令"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ConnectionType</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_connectiontype" runat="server" Text="使用預設或自訂資料庫連線"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ConnectionString</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_connectionstring" runat="server" Text="自訂資料庫連線"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        Connected</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_connected" runat="server" Text="設計階段資料庫連線，設為true時可在設計階段呈現資料，並自動產生Columns屬性設定"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        Personalize</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_personalize" runat="server">設定是否啟用個人化功能及客制欄位顯示功能</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        EnablePrint</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_enableprint" runat="server">設定是否啟用簡易資料列印功能</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        EnableExport</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_enableexport" runat="server">設定是否啟用Execl檔案資料匯出功能</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        RowNumber</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="Label1" runat="server">設定是否顯示資料序號欄位</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        PageSize</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_pagesize" runat="server">設定每頁資料筆數</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ShowPages</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_showpages" runat="server">設定跳頁顯示頁數</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        CurrentRow</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_currentrow" runat="server">目前選擇的資料序號</asp:Label></td>
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
                            <asp:Label ID="L_properties_column" runat="server" Text="Column屬性"></asp:Label></td>
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
                                        Required</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_required" runat="server" Text="設定是否為必要顯示欄位(不可被設為隱藏)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Sortable</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_sortable" runat="server" Text="設定是否啟用欄位排序功能"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Visible</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_visible" runat="server" Text="設定是否隱藏欄位顯示"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        DataName</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_dataname" runat="server" Text="設定與資料庫查詢對應的欄位名稱，會自動連結資料"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        DataType</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_datatype" runat="server" Text="設定欄位類別"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Caption</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_caption" runat="server" Text="設定欄位表頭名稱"></asp:Label></td>
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
                            <table width="100%">
                                <tr>
                                    <td width="1%">
                                        <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="Gray"
                                            BorderStyle="solid" BorderWidth="1" gridlines="both" PageSize="5" ShowPages="5"
                                            Connected="True" SQL="SELECT * FROM dgtype">
                                            <Columns>
                                                <SmoothEnterpriseWebControl:DataColumn ID="DataList1_ctype" runat="server" Caption="Ctype"
                                                    DataName="ctype" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet"
                                                    Required="True" Sortable="True">
                                                </SmoothEnterpriseWebControl:DataColumn>
                                                <SmoothEnterpriseWebControl:DataColumn ID="DataList1_name" runat="server" Caption="Name"
                                                    DataName="name" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet"
                                                    Required="True" Sortable="True">
                                                </SmoothEnterpriseWebControl:DataColumn>
                                                <SmoothEnterpriseWebControl:DataColumn ID="DataList1_category" runat="server" Caption="Category"
                                                    DataName="category" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet"
                                                    Sortable="True">
                                                </SmoothEnterpriseWebControl:DataColumn>
                                                <SmoothEnterpriseWebControl:DataColumn ID="DataList1_remark" runat="server" Caption="Remark"
                                                    DataName="remark" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet"
                                                    Sortable="True">
                                                </SmoothEnterpriseWebControl:DataColumn>
                                                <SmoothEnterpriseWebControl:DataColumn ID="DataList1_systemcontrol" runat="server"
                                                    Caption="System Control" DataName="systemcontrol" DataStyle-BorderStyle="NotSet"
                                                    DataType="ViewText" HeaderStyle-BorderStyle="NotSet" Sortable="True" Visible="False">
                                                </SmoothEnterpriseWebControl:DataColumn>
                                                <SmoothEnterpriseWebControl:DataColumn ID="DataList1_inituid" runat="server" Caption="Init Uid"
                                                    DataName="inituid" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet"
                                                    Sortable="True" Visible="False">
                                                </SmoothEnterpriseWebControl:DataColumn>
                                                <SmoothEnterpriseWebControl:DataColumn ID="DataList1_initdate" runat="server" Caption="Init Date"
                                                    DataName="initdate" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet"
                                                    Width="50px" Sortable="True" Visible="False">
                                                </SmoothEnterpriseWebControl:DataColumn>
                                                <SmoothEnterpriseWebControl:DataColumn ID="DataList1_modifyuid" runat="server" Caption="Modify Uid"
                                                    DataName="modifyuid" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet"
                                                    Sortable="True" Visible="False">
                                                </SmoothEnterpriseWebControl:DataColumn>
                                                <SmoothEnterpriseWebControl:DataColumn ID="DataList1_modifydate" runat="server" Caption="Modify Date"
                                                    DataName="modifydate" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet"
                                                    Width="50px" Sortable="True" Visible="False">
                                                </SmoothEnterpriseWebControl:DataColumn>
                                            </Columns>
                                            <NavigatorStyle BackColor="224, 224, 224" BorderColor="Silver" BorderStyle="Solid"
                                                BorderWidth="1px" Font-Names="Arial" Font-Size="10px" ForeColor="64, 64, 64"
                                                CssClass="" />
                                            <HeaderStyle BackColor="Silver" BorderStyle="NotSet" CssClass="" />
                                            <SelectStyle BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass="" />
                                            <RowStyle BorderStyle="NotSet" CssClass="" />
                                            <GridLine LineStyle="NotSet" />
                                            <HoverStyle BorderStyle="NotSet" CssClass="" />
                                            <SelectColumnStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:DataList>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid; font-size: 12px;
                                font-family: Sans-Serif, Verdana, Arial, Tahoma;">
                                <tr>
                                    <td width="30%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                        Properties Setting
                                    </td>
                                    <td Class="NormalBold" style="color: #000000; background-color: #003300;" align="center">
                                        <span style="color: #ffffff; background-color: #003300">Description</span></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        &lt;<strong>Default Setting</strong>&gt;<br />
                                        SQL : "SELECT * FROM dgtype"<br />
                                        Connected : true<br />
                                        ShowPages : 5<br />
                                        <br />
                                        &lt;<strong>Columns Setting</strong>&gt;<br />
                                        Sortable : true<br />
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>資料連線與欄位屬性設定步驟 :<br />
                                        </strong>1. 先設定SQL查詢字串<br />
                                        2. 將Connected設為true，便會自動產生Columns<br />
                                        3. 編輯Columns屬性<br />
                                        4. 選擇每個欄位是否必要顯示(Required)或排序功能(Sortable)<br />
                                        5. 選擇每個欄位是否隱藏(Visible)或直接移除<br />
                                        6. 修改每個欄位表頭名稱(Caption)</td>
                                </tr>
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff;">
                                        <strong>AutoFormat :</strong> <span style="color: #000099">[動態展示]</span><strong>&nbsp;<br />
                                        </strong>
                                            <asp:DropDownList ID="DL_autoformat" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_autoformat_SelectedIndexChanged">
                                                <asp:ListItem Value="Default"></asp:ListItem>
                                                <asp:ListItem Value="S020">Gray</asp:ListItem>
                                                <asp:ListItem Value="S030">Steel Blue</asp:ListItem>
                                                <asp:ListItem Value="S040">Cadet Blue</asp:ListItem>
                                                <asp:ListItem Value="S050">Black Golden</asp:ListItem>
                                                <asp:ListItem Value="P010">Blue Fantasy</asp:ListItem>
                                                <asp:ListItem Value="P020">Bird</asp:ListItem>
                                                <asp:ListItem Value="P030">Flower</asp:ListItem>
                                                <asp:ListItem Value="P040">Ocean</asp:ListItem>
                                            </asp:DropDownList><strong> </strong>
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        自動格式化樣式屬性
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>Personalize : </strong><span style="color: #000099">[動態展示]</span>
                                        <br />
                                        <asp:CheckBox ID="CB_personalize" runat="server" Text="true" AutoPostBack="True" OnCheckedChanged="CB_personalize_CheckedChanged" /></td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        啟用後，可在左下角的客製欄位功能鈕做欄位調整動作</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="color: #000000">
            <td style="height: 5px">
            </td>
        </tr>
        <tr style="color: #000000">
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
                                    <td width="50%" align="center" Class="NormalBold" style="color: #ffffff; background-color: #003300">
                                        Description</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <span style="color: #339900">// <strong>修改欄位顯示內容步驟 DataType=ViewText 時:</strong><br />
                                            <span style="color: #000000"><span style="color: #0000ff">protected void</span> DataList1_OnRenderCell(<span style="color: #0000ff">object</span>
                                                sender, System.Data.<span style="color: #339999">DataRowView</span> rs, SmoothEnterprise.Web.UI.WebControl.<span style="color: #339999">DataColumn</span>
                                                column, SmoothEnterprise.Web.UI.WebControl.<span style="color: #339999">DataCell</span> cell, System.<span style="color: #339999">EventArgs</span> e)<br />
                                                {<br />
                                                &nbsp; &nbsp; &nbsp;<span style="color: #0000ff">if</span> (column.ID == <span style="color: #cc0000">"<strong>欄位ID</strong>"</span>)
                                                <br />
                                                &nbsp; &nbsp; {<br />
                                                &nbsp; &nbsp; &nbsp; &nbsp; cell.Value = <span style="color: #cc0000">"<strong>填入要顯示的資料</strong>"</span>;
                                                <br />
                                                &nbsp; &nbsp; }<br />
                                                }</span></span></td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        DataList的OnRenderCell是在每一個Cell產生時會觸發的事件，其傳入的參數說明如下 :<br />
                                        <br />
                                        <span style="color: #339999">DataRowView</span> rs :<br />
                                        由SQL查詢字串所得到目前讀取的單筆資料，<br />
                                        可用rs[<span style="color: #990000">"資料欄位名稱"</span>].ToString()
                                        取得值<br />
                                        <br />
                                        <span style="color: #339999">DataColumn</span> column :<br />
                                        DataList 產生目前資料的Column物件<br />
                                        <br />
                                        <span style="color: #339999">DataCell</span> cell :<br />
                                        DataList 產生目前資料的Cell物件</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
