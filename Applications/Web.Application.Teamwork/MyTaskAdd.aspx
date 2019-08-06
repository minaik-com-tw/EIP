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
                            <asp:Label ID="LABEL_uid" runat="server" CssClass="NormalBold" Text="成員"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputSelect ID="FIELD_uid" runat="server" ErrorMessage="請輸入「成員」!!"
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
                            名稱"></asp:Label></td>
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
                            工作說明"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_detail" runat="server" Width="300px"
                                TextMode="MultiLine" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「工作說明」!!"
                                TabIndex="108" MaxLength="1073741823" Height="150px">
                                <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
<tr>
                        <td>
                            <asp:Label ID="LABEL_priority" runat="server" CssClass="NormalBold" Text="
                            優先順序"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputSelect ID="FIELD_priority" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" ItemAll-Value="%" ErrorMessage="請輸入「優先順序」!!" Value="3">
                                <Items>
                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem1" runat="server" Gradient-GradientBegin=""
                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                         Text="最高" Value="1" />
                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem2" runat="server" Gradient-GradientBegin=""
                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                         Text="高" Value="2" />
                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" runat="server" Gradient-GradientBegin=""
                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                         Text="普通" Value="3" />
                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem4" runat="server" Gradient-GradientBegin=""
                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                         Text="低" Value="4" />
                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem5" runat="server" Gradient-GradientBegin=""
                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                         Text="待辦" Value="5" />
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
                            開始時間"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_begindate" runat="server" Gradient-GradientType="Top"
                                FormatType="Date" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「開始時間」!!"
                                TabIndex="103">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_plandate" runat="server" CssClass="NormalBold" Text="
                            計畫完成時間"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_plandate" runat="server" Gradient-GradientType="Top"
                                FormatType="Date" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「計畫完成時間」!!"
                                TabIndex="104">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_planhours" runat="server" CssClass="NormalBold" Text="
                            計畫工作時數"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_planhours" runat="server" Gradient-GradientType="Top"
                                BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「計畫工作時數」!!" TabIndex="111"
                                MaxLength="5" Width="50px" FormatType="Number">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_enddate" runat="server" CssClass="NormalBold" Text="
                            實際完成時間"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_enddate" runat="server" Gradient-GradientType="Top"
                                FormatType="Date" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「實際完成時間」!!"
                                TabIndex="105">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_workhours" runat="server" CssClass="NormalBold" Text="
                            實際工作時數"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_workhours" runat="server" Gradient-GradientType="Top"
                                BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「實際工作時數」!!" TabIndex="112"
                                MaxLength="5" Width="50px" FormatType="Number">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_closedate" runat="server" CssClass="NormalBold" Text="
                            結案時間"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_closedate" runat="server" Gradient-GradientType="Top"
                                FormatType="Date" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「結案時間」!!"
                                TabIndex="105">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_taskstatus" runat="server" CssClass="NormalBold" Text="
                            工作狀態"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_taskstatus" runat="server"
                                ErrorMessage="請輸入「工作狀態」!!" BackColor="#F0F0F0" CssClass="Normal" CodeType="taskstatus"
                                ItemNoneDisplayed="True">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_attachments" runat="server" CssClass="NormalBold" Text="
                            附件"></asp:Label></td>
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
                            備註"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" Width="300px"
                                TextMode="MultiLine" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「備註」!!"
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
                    Text="儲存" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click">
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_savenext" runat="server" Text="儲存後繼續操作"
                    Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060"
                    BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True"
                    OnClick="BUTTON_save_Click">
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Width="80px"
                    Text="回上頁" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click">
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
</asp:Content>
