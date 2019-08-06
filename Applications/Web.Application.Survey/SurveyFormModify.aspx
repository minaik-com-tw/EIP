<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Survey.SurveyFormModify, App_Web_surveyformmodify.aspx.cdcab7d2" title="WebForm Edit Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
    <table cellspacing="4" cellpadding="4" border="0">
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td Class="NormalBold">
                                        <asp:Label ID="LABEL_nocode" runat="server" Text="編號" meta:resourcekey="LABEL_nocodeResource1"></asp:Label></td>
                                    <td width="10">
                                    </td>
                                    <td Class="NormalBold">
                                        <asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_nocode" TabIndex="101" runat="server"
                                            BackColor="#F0F0F0" CssClass="Normal" MaxLength="20" ErrorMessage="請輸入「編號」!!"
                                            Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nocodeResource1" OnClickMore="" Personalize="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                    </td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_name" TabIndex="102" runat="server"
                                            Width="384px" BackColor="#F0F0F0" CssClass="Normal" MaxLength="50" ErrorMessage="請輸入「名稱」!!"
                                            Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td Class="NormalBold">
                                        <asp:Label ID="LABEL_defaultselect" runat="server" Text="預設答案選項" meta:resourcekey="LABEL_defaultselectResource1"></asp:Label></td>
                                    <td width="10">
                                    </td>
                                    <td Class="NormalBold">
                                        <asp:Label ID="LABEL_category" runat="server" Text="分類" meta:resourcekey="LABEL_categoryResource1"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputSelect ID="FIELD_selectid" runat="server" ItemNoneDisplayed="True"
                                            ItemAll-Value="%" BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_selectidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_category" TabIndex="103" runat="server"
                                            BackColor="#F0F0F0" CssClass="Normal" MaxLength="50" ErrorMessage="請輸入「分類」!!"
                                            Gradient-GradientType="Top" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_categoryResource1" OnClickMore="" Personalize="False" Required="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td Class="NormalBold">
                            <asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" TabIndex="104" runat="server"
                                Width="424px" BackColor="#F0F0F0" CssClass="Normal" MaxLength="1073741823" ErrorMessage="請輸入「備註」!!"
                                TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#dfdfdf">
                <table Class="Normal" border="0">
                    <tr>
                        <td>
                            <table>
                                <tr Class="NormalBold">
                                    <td>
                                        <asp:Label ID="LABEL_surveytopic" runat="server" Text="標題" meta:resourcekey="LABEL_surveytopicResource1"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="LABEL_question" runat="server" Text="問題內容" meta:resourcekey="LABEL_questionResource1"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="LABEL_select" runat="server" Text="答案選項" meta:resourcekey="LABEL_selectResource1"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="LABEL_ismust" runat="server" Text="必填" meta:resourcekey="LABEL_ismustResource1"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="LABEL_seq" runat="server" Text="順序" meta:resourcekey="LABEL_seqResource1"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="DETAIL_keystr" runat="server" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="DETAIL_keystrResource1" OnClickMore="" Personalize="False" Required="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputSelect ID="DETAIL_surveytid" runat="server" ItemNoneDisplayed="True"
                                            ItemAll-Value="%" BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="DETAIL_surveytidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect>
                                    </td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="DETAIL_content" runat="server" Width="300px"
                                            BackColor="#F0F0F0" CssClass="Normal" MaxLength="1073741823" Gradient-GradientType="Top" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="DETAIL_contentResource1" OnClickMore="" Personalize="False" Required="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputSelect ID="DETAIL_qtype" runat="server"
                                            ItemAll-Value="%" BackColor="#F0F0F0" CssClass="Normal" ItemNone-Text="- 預設值 -"
                                            ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Gradient-GradientBegin=" "
                                            ItemNone-Gradient-GradientEnd=" " ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-Value=" " ListPosition="Vertical" meta:resourcekey="DETAIL_qtypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Items>
                                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" runat="server" Gradient-GradientBegin=""
                                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                    Style="filter: ;" Text="- 預設值 -" Value=" " />
                                            </Items>
                                        </SmoothEnterpriseWebControl:InputSelect>
                                    </td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputSelect ID="DETAIL_ismust" runat="server" ItemAll-Value="%"
                                            BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="DETAIL_ismustResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="N">
                                            <Items>
                                                <SmoothEnterpriseWebControl:SelectItem IconUrl="" GroupText="" Selected="False" Value="Y"
                                                    ID="selectItem1" Text="Yes" RowHeight="18" Style="filter: ;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="selectItem1Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
                                                <SmoothEnterpriseWebControl:SelectItem IconUrl="" GroupText="" Selected="True" Value="N"
                                                    ID="selectItem2" Text="No" RowHeight="18" Style="filter: ;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="selectItem2Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
                                            </Items>
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect>
                                    </td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="DETAIL_seq" runat="server" Width="50px"
                                            BackColor="#F0F0F0" CssClass="Normal" MaxLength="2" Gradient-GradientType="Top" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="DETAIL_seqResource1" OnClickMore="" Personalize="False" Required="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputButton ID="UpdateButton" runat="server" Font-Names="Arial"
                                            Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                            BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                                            Text="更新" Width="80px" OnClick="UpdateButton_Click" meta:resourcekey="UpdateButtonResource1" RunAtCient="False">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                        </SmoothEnterpriseWebControl:InputButton><font face="新細明體">&nbsp;</font><SmoothEnterpriseWebControl:InputButton
                                            ID="CancelButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
                                            BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold"
                                            Gradient-GradientType="Bottom" Font-Bold="True" Text="取消" Width="80px" OnClick="CancelButton_Click" meta:resourcekey="CancelButtonResource1" RunAtCient="False">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                        </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
                                            ID="AddButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
                                            BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold"
                                            Gradient-GradientType="Bottom" Font-Bold="True" Text="新增" Width="80px" OnClick="AddButton_Click" meta:resourcekey="AddButtonResource1" RunAtCient="False">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                        </SmoothEnterpriseWebControl:InputButton><font face="新細明體">&nbsp;</font>
                                        <SmoothEnterpriseWebControl:InputButton ID="TopicButton" runat="server" Font-Names="Arial"
                                            Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                            BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Text="維護標題" OnClick="TopicButton_Click" meta:resourcekey="TopicButtonResource1" RunAtCient="False">
                                            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" Font-Names="Arial"
                                Font-Size="12px" BorderColor="Black" SQL="select * from dgsurveyquestion where 1=0"
                                PageSize="5"
                                HeaderHeight="30px"
                                EnableCustom="True" CellPadding="3px" Connected="False" BorderStyle="Solid" BorderWidth="1px"
                                gridlines="both" BackImageURL="" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="" OnOnRenderCell="DataList1_OnRenderCell">
                                <Columns>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Width="1%" ID="DataList1_edit" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_editResource1" runat="server">
                                        <Template>
                                            <SmoothEnterpriseWebControl:InputText ID="dl_keys" runat="server" BackColor="#F0F0F0"
                                                CssClass="Normal" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="dl_keysResource1" OnClickMore="" Personalize="False" Required="False">
                                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControl:InputText>
                                            <SmoothEnterpriseWebControl:InputButton ID="DetailEditButton" OnClick="DetailEditButton_Click"
                                                runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px"
                                                BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold"
                                                Text="編輯" Font-Bold="True" meta:resourcekey="DetailEditButtonResource1" RunAtCient="False">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                            </SmoothEnterpriseWebControl:InputButton>
                                        </Template>
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="標題" DataName="topicname"
                                        ID="DataList1_surveytopic" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_surveytopicResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="問題內容" Width="500px"
                                        DataName="content" ID="DataList1_question" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_questionResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="答案選項" DataName="qtype"
                                        ID="DataList1_select" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_selectResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="必填" DataAlign="Center"
                                        DataName="ismust" ID="DataList1_ismust" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_ismustResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="順序" DataAlign="Right"
                                        DataName="seq" ID="DataList1_seq" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_seqResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Width="1%" ID="DataList1_delete" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_deleteResource1" runat="server">
                                        <Template>
                                            <SmoothEnterpriseWebControl:InputButton ID="DetailDeleteButton" OnClick="DetailDeleteButton_Click"
                                                runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px"
                                                BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold"
                                                Text="刪除" Font-Bold="True" meta:resourcekey="DetailDeleteButtonResource1" RunAtCient="False">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                            </SmoothEnterpriseWebControl:InputButton>
                                        </Template>
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" ID="DataList1_item" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_itemResource1" runat="server">
                                        <Template>
                                            <SmoothEnterpriseWebControl:InputButton ID="ItemButton" OnClick="ItemButton_Click"
                                                runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px"
                                                BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True"
                                                Text="自定" meta:resourcekey="ItemButtonResource1" RunAtCient="False">
                                                <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                            </SmoothEnterpriseWebControl:InputButton>
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
                                <HoverStyle BorderStyle="None" CssClass=""></HoverStyle>
                                <RowStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:DataList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table Class="Normal" id="Table3" border="0">
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputButton ID="SaveButton" runat="server" Font-Names="Arial"
                                Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                                Text="儲存" Width="80px" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>
                            <SmoothEnterpriseWebControl:InputButton ID="DeleteButton" runat="server" Font-Names="Arial"
                                Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                                Text="刪除" Width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource2" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>
                            <SmoothEnterpriseWebControl:InputButton ID="BackButton" runat="server" Font-Names="Arial"
                                Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                                Text="回上頁" Width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
