<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.ProjectTaskDelete, App_Web_projecttaskdelete.aspx.cdcab7d2" theme="Default" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <SmoothEnterpriseWebControl:PageJumper ID="PageJumper1" runat="server" ShowPageNumber="True">
        <ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px"
            BorderStyle="Solid" BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200">
        </ButtonStyle>
        <PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke">
        </PageSelectedStyle>
        <PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px"
            BorderWidth="1px" ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White">
        </PageNumberStyle>
    </SmoothEnterpriseWebControl:PageJumper>
    <table border="0" Class="Normal">
        <tr>
            <td valign="top" style="height: 1px">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_projid" runat="server" CssClass="NormalBold" Text="�M��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_projid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_projphaseid" runat="server" CssClass="NormalBold" Text="�M�׶��q"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_projphaseid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_tasktypeid" runat="server" CssClass="NormalBold" Text="�u�@���O"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_tasktypeid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_uid" runat="server" CssClass="NormalBold" Text="����"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_uid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_name" runat="server" CssClass="NormalBold" Text="�W��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="300px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_detail" runat="server" CssClass="NormalBold" Text="�u�@����"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_detail" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="300px" Height="135px" TextMode="MultiLine">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_priority" runat="server" CssClass="NormalBold" Text="�u������"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputSelect ID="FIELD_priority" runat="server" CssClass="PanelWhite"
                                ItemAll-Value="%" ErrorMessage="�п�J�u�u�����ǡv!!" Value="" ReadOnly="True">
                                <Items>
                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem1" runat="server" Gradient-GradientBegin=""
                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                         Text="�̰�" Value="1" />
                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem2" runat="server" Gradient-GradientBegin=""
                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                         Text="��" Value="2" />
                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" runat="server" Gradient-GradientBegin=""
                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                         Text="���q" Value="3" />
                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem4" runat="server" Gradient-GradientBegin=""
                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                         Text="�C" Value="4" />
                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem5" runat="server" Gradient-GradientBegin=""
                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                         Text="�ݿ�" Value="5" />
                                </Items>
                                <ErrorStyle BorderStyle="NotSet" />
                                <Gradient GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputSelect>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="1" style="height: 1px">
                <span style="border-right: 1px inset; border-top: 1px inset; font-size: 16px; margin: 0px 3px;
                    border-left: 1px inset; width: 1px; border-bottom: 1px inset; height: 100%" clear="all">
                </span>
            </td>
            <td valign="top" style="height: 1px">
                <table id="Table3">
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_begindate" runat="server" CssClass="NormalBold" Text="�}�l�ɶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_begindate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_plandate" runat="server" CssClass="NormalBold" Text="�p�e�����ɶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_plandate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_planhours" runat="server" CssClass="NormalBold" Text="�p�e�u�@�ɼ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_planhours" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_enddate" runat="server" CssClass="NormalBold" Text="��ڧ����ɶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_enddate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_workhours" runat="server" CssClass="NormalBold" Text="��ڤu�@�ɼ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal" style="height: 26px">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_workhours" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_closedate" runat="server" CssClass="NormalBold" Text="���׮ɶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_closedate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_taskstatus" runat="server" CssClass="NormalBold" Text="�u�@���A"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_taskstatus" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_attachments" runat="server" CssClass="NormalBold" Text="����"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <asp:Literal ID="FIELD_attachments" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_remark" runat="server" CssClass="NormalBold" Text="�Ƶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="300px" Height="50px" TextMode="MultiLine">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
            <td width="1" style="height: 1px">
                <span style="border-right: 1px inset; border-top: 1px inset; font-size: 16px; margin: 0px 3px;
                    border-left: 1px inset; width: 1px; border-bottom: 1px inset; height: 100%" clear="all">
                </span>
            </td>
            <td valign="top" style="height: 1px">
                <table id="Table3">
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_inituid" runat="server" CssClass="NormalBold" Text="�إߤH��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_inituid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_initdate" runat="server" CssClass="NormalBold" Text="�إ߮ɶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_initdate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_modifyuid" runat="server" CssClass="NormalBold" Text="��s�H��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_modifyuid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_modifydate" runat="server" CssClass="NormalBold" Text="��s�ɶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_modifydate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Gradient-GradientType="Bottom"
                    CssClass="NormalBold" BackColor=" #C8C8C8" BorderColor="#606060" BorderWidth="1px"
                    BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" Text="�R��"
                    Width="80px" OnClick="BUTTON_delete_Click">
                </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
            <td>
                &nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_cancel" runat="server" BackColor=" #C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold" Width="80px"
                    Text="����" Font-Bold="True" OnClick="BUTTON_cancel_Click">
                </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
