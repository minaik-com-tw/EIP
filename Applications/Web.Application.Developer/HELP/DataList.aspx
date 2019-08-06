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
                            <asp:Label ID="L_classname" runat="server" Text="���O�W��"></asp:Label></td>
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
                            <asp:Label ID="L_properties" runat="server" Text="�ݩ�"></asp:Label></td>
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
                                        <asp:Label ID="D_columns" runat="server" Text="��ƲM�檺��쪫�󶰦X(�аѾ\Column�ݩ�)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        SQL</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_sql" runat="server" Text="��ƪ�d��SQL�R�O"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ConnectionType</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_connectiontype" runat="server" Text="�ϥιw�]�Φۭq��Ʈw�s�u"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ConnectionString</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_connectionstring" runat="server" Text="�ۭq��Ʈw�s�u"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        Connected</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_connected" runat="server" Text="�]�p���q��Ʈw�s�u�A�]��true�ɥi�b�]�p���q�e�{��ơA�æ۰ʲ���Columns�ݩʳ]�w"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        Personalize</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_personalize" runat="server">�]�w�O�_�ҥέӤH�ƥ\��ΫȨ������ܥ\��</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        EnablePrint</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_enableprint" runat="server">�]�w�O�_�ҥ�²����ƦC�L�\��</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        EnableExport</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_enableexport" runat="server">�]�w�O�_�ҥ�Execl�ɮ׸�ƶץX�\��</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        RowNumber</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="Label1" runat="server">�]�w�O�_��ܸ�ƧǸ����</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        PageSize</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_pagesize" runat="server">�]�w�C����Ƶ���</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ShowPages</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_showpages" runat="server">�]�w������ܭ���</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        CurrentRow</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_currentrow" runat="server">�ثe��ܪ���ƧǸ�</asp:Label></td>
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
                            <asp:Label ID="L_properties_column" runat="server" Text="Column�ݩ�"></asp:Label></td>
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
                                        <asp:Label ID="D_col_required" runat="server" Text="�]�w�O�_�����n������(���i�Q�]������)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Sortable</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_sortable" runat="server" Text="�]�w�O�_�ҥ����Ƨǥ\��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Visible</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_visible" runat="server" Text="�]�w�O�_����������"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        DataName</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_dataname" runat="server" Text="�]�w�P��Ʈw�d�߹��������W�١A�|�۰ʳs�����"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        DataType</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_datatype" runat="server" Text="�]�w������O"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Caption</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_col_caption" runat="server" Text="�]�w�����Y�W��"></asp:Label></td>
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
                            <asp:Label ID="L_Demo" runat="server" Text="�i��"></asp:Label></td>
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
                                        <strong>��Ƴs�u�P����ݩʳ]�w�B�J :<br />
                                        </strong>1. ���]�wSQL�d�ߦr��<br />
                                        2. �NConnected�]��true�A�K�|�۰ʲ���Columns<br />
                                        3. �s��Columns�ݩ�<br />
                                        4. ��ܨC�����O�_���n���(Required)�αƧǥ\��(Sortable)<br />
                                        5. ��ܨC�����O�_����(Visible)�Ϊ�������<br />
                                        6. �ק�C�������Y�W��(Caption)</td>
                                </tr>
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff;">
                                        <strong>AutoFormat :</strong> <span style="color: #000099">[�ʺA�i��]</span><strong>&nbsp;<br />
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
                                        �۰ʮ榡�Ƽ˦��ݩ�
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>Personalize : </strong><span style="color: #000099">[�ʺA�i��]</span>
                                        <br />
                                        <asp:CheckBox ID="CB_personalize" runat="server" Text="true" AutoPostBack="True" OnCheckedChanged="CB_personalize_CheckedChanged" /></td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        �ҥΫ�A�i�b���U�����Ȼs���\��s�����վ�ʧ@</td>
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
                            <asp:Label ID="L_Example" runat="server" Text="�{���d��"></asp:Label></td>
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
                                        <span style="color: #339900">// <strong>�ק������ܤ��e�B�J DataType=ViewText ��:</strong><br />
                                            <span style="color: #000000"><span style="color: #0000ff">protected void</span> DataList1_OnRenderCell(<span style="color: #0000ff">object</span>
                                                sender, System.Data.<span style="color: #339999">DataRowView</span> rs, SmoothEnterprise.Web.UI.WebControl.<span style="color: #339999">DataColumn</span>
                                                column, SmoothEnterprise.Web.UI.WebControl.<span style="color: #339999">DataCell</span> cell, System.<span style="color: #339999">EventArgs</span> e)<br />
                                                {<br />
                                                &nbsp; &nbsp; &nbsp;<span style="color: #0000ff">if</span> (column.ID == <span style="color: #cc0000">"<strong>���ID</strong>"</span>)
                                                <br />
                                                &nbsp; &nbsp; {<br />
                                                &nbsp; &nbsp; &nbsp; &nbsp; cell.Value = <span style="color: #cc0000">"<strong>��J�n��ܪ����</strong>"</span>;
                                                <br />
                                                &nbsp; &nbsp; }<br />
                                                }</span></span></td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        DataList��OnRenderCell�O�b�C�@��Cell���ͮɷ|Ĳ�o���ƥ�A��ǤJ���Ѽƻ����p�U :<br />
                                        <br />
                                        <span style="color: #339999">DataRowView</span> rs :<br />
                                        ��SQL�d�ߦr��ұo��ثeŪ�����浧��ơA<br />
                                        �i��rs[<span style="color: #990000">"������W��"</span>].ToString()
                                        ���o��<br />
                                        <br />
                                        <span style="color: #339999">DataColumn</span> column :<br />
                                        DataList ���ͥثe��ƪ�Column����<br />
                                        <br />
                                        <span style="color: #339999">DataCell</span> cell :<br />
                                        DataList ���ͥثe��ƪ�Cell����</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
