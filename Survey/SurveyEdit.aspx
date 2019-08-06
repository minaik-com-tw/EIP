<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Survey.SurveyEdit, App_Web_surveyedit.aspx.cdcab7d2" title="WebForm Edit Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="Program Name" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table Class="Normal" border="0">
        <tr>
            <td valign="top">
                <table>
                    <tr>
                        <td Class="NormalBold">
                            <asp:Label ID="LABEL_surveyform" runat="server" Text="問卷調查表" meta:resourcekey="LABEL_surveyformResource1"></asp:Label></td>
                        <td>
                        </td>
                        <td Class="NormalBold">
                            <asp:Label ID="LABEL_description" runat="server" Text="描述" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></td>
                        <td>
                        </td>
                        <td Class="NormalBold">
                            <asp:Label ID="LABEL_surveyinterval" runat="server" Text="調查日期起迄" meta:resourcekey="LABEL_surveyintervalResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputSelect ID="FIELD_surveyfid" runat="server" ItemNoneDisplayed="True"
                                CssClass="Normal" BackColor="#F0F0F0" ItemAll-Value="%" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_surveyfidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputSelect>
                        </td>
                        <td>
                        </td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_description" TabIndex="102" runat="server"
                                Width="272px" BackColor="#F0F0F0" CssClass="Normal" MaxLength="50" ErrorMessage="請輸入「描述」!!"
                                Gradient-GradientType="Top" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_descriptionResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                        </td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_sdate" TabIndex="104" runat="server"
                                BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「開始日期」!!" FormatType="DateTime" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_sdateResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText>~<SmoothEnterpriseWebControl:InputText ID="FIELD_edate"
                                TabIndex="105" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「結束日期」!!"
                                FormatType="DateTime" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_edateResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText>
                        </td>
                    </tr>
                    <tr>
                        <td Class="NormalBold" colspan="5">
                            <asp:Label ID="LABEL_details" runat="server" Text="說明" meta:resourcekey="LABEL_detailsResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_details" TabIndex="103" runat="server"
                                Width="714px" BackColor="#F0F0F0" CssClass="Normal" MaxLength="1073741823" ErrorMessage="請輸入「說明」!!"
                                Gradient-GradientType="Top" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_detailsResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td Class="NormalBold" nowrap>
                            <asp:Label ID="LABEL_usertype" runat="server" Text="調查者類別" meta:resourcekey="LABEL_usertypeResource1"></asp:Label></td>
                        <td Class="NormalBold" nowrap>
                            <asp:Label ID="LABEL_user" runat="server" Text="使用者" meta:resourcekey="LABEL_userResource1"></asp:Label></td>
                        <td width="1">
                        </td>
                        <td>
                        </td>
                        <td colspan="2">
                            <font face="新細明體"></font>
                        </td>
                    </tr>
                    <tr>
                        <td width="1">
                            <SmoothEnterpriseWebControlEnterprise:SelectCode ID="QUERY_sutype" runat="server"
                                CssClass="Normal" BackColor="#F0F0F0" CodeType="sutype" TextField="name" ValueField="id"
                                ItemAllDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_sutypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
                        </td>
                        <td width="1">
                            <SmoothEnterpriseWebControl:InputText ID="QUERY_name" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" Gradient-GradientType="Top" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_nameResource1" OnClickMore="" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td width="1">
                            <SmoothEnterpriseWebControl:InputButton ID="QueryButton" runat="server" Width="80px"
                                Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                BackColor="#C8C8C8" CssClass="NormalBold" Text="查詢" Font-Bold="True" OnClick="QueryButton_Click" meta:resourcekey="QueryButtonResource1" RunAtCient="False">
                                <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                            </SmoothEnterpriseWebControl:InputButton></td>
                        <td>
                            <font face="新細明體"></font>
                        </td>
                        <td colspan="2">
                            <font face="新細明體"></font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" width="1%">
                            <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" Font-Names="Arial"
                                Font-Size="12px" BorderColor="Black" HeaderHeight="30px"
                                CellPadding="3px" Connected="False" SQL="select * from dgsurveyuser" BorderStyle="Solid"
                                BorderWidth="1px" gridlines="both" Personalize="True" BackImageURL="" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="" OnOnRenderCell="DataList1_OnRenderCell">
                                <Columns>
                                    <SmoothEnterpriseWebControl:DataColumn HeaderAlign="Center" DataType="CheckBox" DataAlign="Center"
                                        ID="DataList1_chk" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_chkResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="調查者類別" DataName="sutypename"
                                        ID="DataList1_usertype" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_usertypeResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="名稱" DataName="username"
                                        ID="DataList1_name" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_nameResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="電子郵件" DataName="email"
                                        ID="DataList1_email" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_emailResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="寄送日期"
                                        DataName="senddate" ID="DataList1_senddate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_senddateResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="填寫日期" DataName="resultdate"
                                        ID="DataList1_resultdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_resultdateResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn HeaderAlign="Center" DataType="UserDefined"
                                        Caption="編輯" DataAlign="Center" ID="DataList1_edit" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_editResource1" runat="server">
                                        <Template>
                                            <asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1"></asp:Image>
                                        </Template>
                                    </SmoothEnterpriseWebControl:DataColumn>
                                </Columns>
                                <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                                    ForeColor="64, 64, 64" BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
                                <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
                                <SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
                                <SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet" CssClass=""></SelectStyle>
                                <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px">
                                </GridLine>
                                <HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
                                <RowStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:DataList>
                        </td>
                        <td width="10">
                        </td>
                        <td valign="top" width="99%">
                            <table Class="Normal" width="400">
                                <tr>
                                    <td valign="top" nowrap>
                                        <SmoothEnterpriseWebControl:InputButton ID="InputButton3" runat="server" BackColor="White"
                                            BorderStyle="Solid" BorderWidth="2px" BorderColor="Red" Font-Size="12px" Font-Names="Arial"
                                            ForeColor="Red" CssClass="NormalBold" Font-Bold="True" Text="1" RunAtCient="True"
                                            Width="20px" meta:resourcekey="InputButton3Resource1">
                                            <Gradient GradientEnd="" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                        <b><font color="#ff0000">.</font></b></td>
                                    <td valign="middle">
                                        <asp:Label ID="LABEL_m01" runat="server" Text="您可以點選" meta:resourcekey="LABEL_m01Resource1"></asp:Label>
                                        <SmoothEnterpriseWebControl:InputButton ID="AddUserButton" runat="server" BackColor="#C8C8C8"
                                            BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                                            Font-Names="Arial" CssClass="NormalBold" Font-Bold="True" Text="加入調查者" OnClick="AddUserButton_Click" meta:resourcekey="AddUserButtonResource1" RunAtCient="False">
                                            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                        <asp:Label ID="LABEL_m02" runat="server" Text="增加調查人員。" meta:resourcekey="LABEL_m02Resource1"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" nowrap>
                                        <SmoothEnterpriseWebControl:InputButton ID="InputButton7" runat="server" BackColor="White"
                                            BorderStyle="Solid" BorderWidth="2px" BorderColor="Red" Font-Size="12px" Font-Names="Arial"
                                            ForeColor="Red" CssClass="NormalBold" Font-Bold="True" Text="2" RunAtCient="True"
                                            Width="20px" meta:resourcekey="InputButton7Resource1">
                                            <Gradient GradientEnd="" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                        <b><font color="#ff0000">.</font></b></td>
                                    <td>
                                        <table Class="Normal" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LABEL_m03" runat="server" Text="您可以選取人員後點選" meta:resourcekey="LABEL_m03Resource1"></asp:Label>
                                                    <SmoothEnterpriseWebControl:InputButton ID="DeleteSelected" runat="server" BackColor="#C8C8C8"
                                                        BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                                                        Font-Names="Arial" Width="100px" CssClass="NormalBold" Font-Bold="True" Text="刪除選取"
                                                        OnClick="DeleteSelected_Click" meta:resourcekey="DeleteSelectedResource1" RunAtCient="False">
                                                        <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                                    </SmoothEnterpriseWebControl:InputButton>
                                                    <asp:Label ID="LABEL_m04" runat="server" Text="刪除選取人員。" meta:resourcekey="LABEL_m04Resource1"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td height="1">
                                                    <font face="新細明體"></font>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <SmoothEnterpriseWebControl:InputButton ID="DeleteUserButton" runat="server" BackColor="#C8C8C8"
                                                        BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                                                        Font-Names="Arial" CssClass="NormalBold" Font-Bold="True" Text="刪除所有調查者" OnClick="DeleteUserButton_Click" meta:resourcekey="DeleteUserButtonResource1" RunAtCient="False">
                                                        <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                                                    </SmoothEnterpriseWebControl:InputButton>
                                                    <asp:Label ID="LABEL_m05" runat="server" Text="提供您直接刪除所有人員。" meta:resourcekey="LABEL_m05Resource1"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" nowrap>
                                        <SmoothEnterpriseWebControl:InputButton ID="InputButton8" runat="server" BackColor="White"
                                            BorderStyle="Solid" BorderWidth="2px" BorderColor="Red" Font-Size="12px" Font-Names="Arial"
                                            ForeColor="Red" CssClass="NormalBold" Font-Bold="True" Text="3" RunAtCient="True"
                                            Width="20px" meta:resourcekey="InputButton8Resource1">
                                            <Gradient GradientEnd="" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                        <b><font color="#ff0000">.</font></b></td>
                                    <td>
                                        <asp:Label ID="LABEL_m06" runat="server" Text="選擇完人員後可以點選" meta:resourcekey="LABEL_m06Resource1"></asp:Label>
                                        <SmoothEnterpriseWebControl:InputButton ID="SendSurveyBottom" runat="server" Font-Names="Arial"
                                            Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                            BackColor="#C8C8C8" CssClass="NormalBold" Text="寄送調查" Font-Bold="True" OnClick="SendSurveyBottom_Click" meta:resourcekey="SendSurveyBottomResource1" RunAtCient="False">
                                            <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                        <asp:Label ID="LABEL_m07" runat="server" Text="寄送調查通知。" meta:resourcekey="LABEL_m07Resource1"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td height="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" nowrap style="height: 20px">
                                        <SmoothEnterpriseWebControl:InputButton ID="InputButton9" runat="server" BackColor="White"
                                            BorderStyle="Solid" BorderWidth="2px" BorderColor="Red" Font-Size="12px" Font-Names="Arial"
                                            ForeColor="Red" CssClass="NormalBold" Font-Bold="True" Text="4" RunAtCient="True"
                                            Width="20px" meta:resourcekey="InputButton9Resource1">
                                            <Gradient GradientEnd="" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                        <b><font color="#ff0000">.</font></b></td>
                                    <td style="height: 21px">
                                        <SmoothEnterpriseWebControl:InputButton ID="ClearResultBottom" runat="server" Font-Names="Arial"
                                            Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                            BackColor="#C8C8C8" CssClass="NormalBold" Text="清除所有結果" Font-Bold="True" OnClick="ClearResultBottom_Click" meta:resourcekey="ClearResultBottomResource1" RunAtCient="False">
                                            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                        <asp:Label ID="LABEL_m08" runat="server" Text="可協助您清除所有調查結果。" meta:resourcekey="LABEL_m08Resource1"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="NormalBold">
                                    </td>
                                    <td>
                                        <font face="新細明體"></font>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table Class="Normal" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="SaveButton" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Text="儲存" Width="80px" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="DeleteButton" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Text="刪除" Width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="BackButton" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Text="回上頁" Width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="CloseSurveyButton" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" Width="80px" CssClass="NormalBold" Font-Bold="True" Text="結案"
                    OnClick="CloseSurveyButton_Click" meta:resourcekey="CloseSurveyButtonResource1" RunAtCient="False">
                    <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
