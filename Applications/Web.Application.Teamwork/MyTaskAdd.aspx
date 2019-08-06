<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.MyTaskAdd, App_Web_mytaskadd.aspx.cdcab7d2" theme="Default" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0" Class="Normal">
        <tr>
            <td valign="top" style="height: 341px">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_uid" runat="server" CssClass="NormalBold" Text="����"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputSelect ID="FIELD_uid" runat="server" ErrorMessage="�п�J�u�����v!!"
                                ItemAll-Value="%" BackColor="#F0F0F0" CssClass="Normal" ItemNoneDisplayed="True"
                                Required="True">
                                <ErrorStyle BorderStyle="NotSet" />
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputSelect>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_name" runat="server" CssClass="NormalBold" Text="
                            �W��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" Width="300px">
                                <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_detail" runat="server" CssClass="NormalBold" Text="
                            �u�@����"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_detail" runat="server" Width="300px"
                                TextMode="MultiLine" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="�п�J�u�u�@�����v!!"
                                TabIndex="108" MaxLength="1073741823" Height="150px">
                                <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
<tr>
                        <td>
                            <asp:Label ID="LABEL_priority" runat="server" CssClass="NormalBold" Text="
                            �u������"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputSelect ID="FIELD_priority" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" ItemAll-Value="%" ErrorMessage="�п�J�u�u�����ǡv!!" Value="3">
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
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputSelect>
                        </td>
                    </tr>
                    
                </table>
            </td>
            <td width="1" style="height: 341px">
                <span style="border-right: 1px inset; border-top: 1px inset; font-size: 16px; margin: 0px 3px;
                    border-left: 1px inset; width: 1px; border-bottom: 1px inset; height: 100%" clear="all">
                </span>
            </td>
            <td valign="top" style="height: 341px">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_begindate" runat="server" CssClass="NormalBold" Text="
                            �}�l�ɶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_begindate" runat="server" Gradient-GradientType="Top"
                                FormatType="Date" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="�п�J�u�}�l�ɶ��v!!"
                                TabIndex="103">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_plandate" runat="server" CssClass="NormalBold" Text="
                            �p�e�����ɶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_plandate" runat="server" Gradient-GradientType="Top"
                                FormatType="Date" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="�п�J�u�p�e�����ɶ��v!!"
                                TabIndex="104">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_planhours" runat="server" CssClass="NormalBold" Text="
                            �p�e�u�@�ɼ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_planhours" runat="server" Gradient-GradientType="Top"
                                BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="�п�J�u�p�e�u�@�ɼơv!!" TabIndex="111"
                                MaxLength="5" Width="50px" FormatType="Number">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_enddate" runat="server" CssClass="NormalBold" Text="
                            ��ڧ����ɶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_enddate" runat="server" Gradient-GradientType="Top"
                                FormatType="Date" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="�п�J�u��ڧ����ɶ��v!!"
                                TabIndex="105">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_workhours" runat="server" CssClass="NormalBold" Text="
                            ��ڤu�@�ɼ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_workhours" runat="server" Gradient-GradientType="Top"
                                BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="�п�J�u��ڤu�@�ɼơv!!" TabIndex="112"
                                MaxLength="5" Width="50px" FormatType="Number">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_closedate" runat="server" CssClass="NormalBold" Text="
                            ���׮ɶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_closedate" runat="server" Gradient-GradientType="Top"
                                FormatType="Date" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="�п�J�u���׮ɶ��v!!"
                                TabIndex="105">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_taskstatus" runat="server" CssClass="NormalBold" Text="
                            �u�@���A"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_taskstatus" runat="server"
                                ErrorMessage="�п�J�u�u�@���A�v!!" BackColor="#F0F0F0" CssClass="Normal" CodeType="taskstatus"
                                ItemNoneDisplayed="True">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_attachments" runat="server" CssClass="NormalBold" Text="
                            ����"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputFile ID="FIELD_attachments" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputFile></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_remark" runat="server" CssClass="NormalBold" Text="
                            �Ƶ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" Width="300px"
                                TextMode="MultiLine" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="�п�J�u�Ƶ��v!!"
                                TabIndex="109" MaxLength="1073741823" Height="50px">
                                <ErrorStyle BorderStyle="NotSet"></ErrorStyle>
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border="0" Class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Width="80px"
                    Text="�x�s" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click">
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_savenext" runat="server" Text="�x�s���~��ާ@"
                    Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060"
                    BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True"
                    OnClick="BUTTON_save_Click">
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Width="80px"
                    Text="�^�W��" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click">
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
</asp:Content>
