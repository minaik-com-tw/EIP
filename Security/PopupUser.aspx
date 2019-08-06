<%@ page language="C#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.PopupUser, App_Web_popupuser.aspx.cdcab7d2" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<html>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <base target="_self" />
</head>
<body style="margin-top: 0; margin-bottom: 0; margin-left: 0; margin-right: 0">
    <form id="form1" runat="server">
        <SmoothEnterpriseWebControl:InputButton ID="TAB_normal" runat="server" CssClass="NormalBold"
            Width="100px" Text="一般查詢" Font-Bold="True" BorderColor="#606060" BorderStyle="Solid"
            BorderWidth="1px" Font-Size="12px" Font-Names="Arial" BackColor="#C8C8C8" OnClick="TAB_normal_Click"
            meta:resourcekey="TAB_normalResource1" RunAtCient="False" UseSubmitBehavior="False">
            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
        </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
            ID="TAB_group" runat="server" CssClass="NormalBold" Width="100px" Text="群組查詢"
            Font-Bold="True" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
            Font-Size="12px" Font-Names="Arial" BackColor="#C8C8C8" OnClick="TAB_group_Click"
            meta:resourcekey="TAB_groupResource1" RunAtCient="False" UseSubmitBehavior="False">
            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
        </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
            ID="TAB_firstname" runat="server" CssClass="NormalBold" Width="100px" Text="快速查詢"
            Font-Bold="True" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
            Font-Size="12px" Font-Names="Arial" BackColor="#C8C8C8" OnClick="TAB_firstname_Click"
            meta:resourcekey="TAB_firstnameResource1" RunAtCient="False" UseSubmitBehavior="False">
            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
        </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
            ID="TAB_history" runat="server" CssClass="NormalBold" Width="100px" Text="歷史清單"
            Font-Bold="True" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
            Font-Size="12px" Font-Names="Arial" BackColor="#C8C8C8" OnClick="TAB_history_Click"
            meta:resourcekey="TAB_historyResource1" RunAtCient="False" UseSubmitBehavior="False">
            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
        </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
            ID="TAB_personal" runat="server" CssClass="NormalBold" Width="100px" Text="個人清單"
            Font-Bold="True" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
            Font-Size="12px" Font-Names="Arial" BackColor="#C8C8C8" OnClick="TAB_personal_Click"
            meta:resourcekey="TAB_personalResource1" RunAtCient="False" UseSubmitBehavior="False">
            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
        </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputText ID="QUERY_WHERE"
            runat="server" BackColor="#F0F0F0" HiddenMode="True" CssClass="Normal" Gradient-GradientType="Top"
            ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
            ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True"
            meta:resourcekey="QUERY_WHEREResource1" OnClickMore="" Personalize="False" Required="False">
            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
            <ErrorStyle BorderStyle="NotSet" CssClass="" />
        </SmoothEnterpriseWebControl:InputText><br>
        <table id="TAB_table" cellspacing="0" cellpadding="0" width="100%" bgcolor="darkgray"
            border="1" runat="server">
            <tr height="50">
                <td>
                    <table border="0">
                        <tr class="NormalBold">
                            <td valign="bottom">
                                <asp:Label ID="LABEL_logonid" runat="server" Font-Size="X-Small" Text="帳號" meta:resourcekey="LABEL_logonidResource1"
                                    Font-Bold="True"></asp:Label></td>
                            <td valign="bottom">
                                <asp:Label ID="LABEL_name" runat="server" Font-Size="X-Small" Text="名稱" meta:resourcekey="LABEL_nameResource1"
                                    Font-Bold="True"></asp:Label></td>
                            <td valign="bottom">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ID="QUERY_logonid" runat="server" BackColor="#F0F0F0"
                                    CssClass="Normal" MaxLength="50" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                    DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                    HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_logonidResource1" OnClickMore=""
                                    Personalize="False" Required="False">
                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ID="QUERY_name" runat="server" BackColor="#F0F0F0"
                                    CssClass="Normal" MaxLength="50" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                    DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                    HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_nameResource1" OnClickMore=""
                                    Personalize="False" Required="False">
                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢"
                                    Font-Bold="True" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                                    Font-Size="12px" Font-Names="Arial" BackColor="#C8C8C8" CssClass="NormalBold"
                                    Gradient-GradientType="Bottom" Width="80px" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1"
                                    RunAtCient="False">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                </SmoothEnterpriseWebControl:InputButton></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="50">
                <td>
                    <table border="0">
                        <tr class="NormalBold">
                            <td valign="bottom">
                                <asp:Label ID="LABEL_gid" runat="server" Text="群組" meta:resourcekey="LABEL_gidResource1"
                                    Font-Size="X-Small" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <SmoothEnterpriseWebControlEnterprise:SelectGroup ID="QUERY_gid" runat="server" BackColor="#F0F0F0"
                                    CssClass="Normal" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-IsValid="True"
                                    ItemNoneDisplayed="True" OnSelectedIndexChanged="QUERY_gid_SelectedIndexChanged"
                                    ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False"
                                    ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl=""
                                    ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18"
                                    ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_gidResource1"
                                    Mode="Single" RootId="" TextBoxStyle="ThreeDStyle" Value="">
                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControlEnterprise:SelectGroup>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="50">
                <td align="center" height="50">
                    <SmoothEnterpriseWebControl:InputText ID="QUERY_firstname" runat="server" BackColor="#F0F0F0"
                        HiddenMode="True" CssClass="Normal" Gradient-GradientType="Top" ButtonClick="True"
                        ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor=""
                        FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_firstnameResource1"
                        OnClickMore="" Personalize="False" Required="False">
                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:InputText></td>
            </tr>
            <tr height="0">
                <td style="height: 24px">
                    <SmoothEnterpriseWebControl:InputText ID="QUERY_history" runat="server" Width="600px"
                        BackColor="#F0F0F0" HiddenMode="True" CssClass="Normal" ButtonClick="True" ButtonIconUrl=""
                        DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None"
                        HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_historyResource1" OnClickMore=""
                        Personalize="False" Required="False">
                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:InputText></td>
            </tr>
            <tr height="0">
                <td>
                    <SmoothEnterpriseWebControl:InputText ID="QUERY_personal" runat="server" Width="600px"
                        BackColor="#F0F0F0" HiddenMode="True" CssClass="Normal" ButtonClick="True" ButtonIconUrl=""
                        DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None"
                        HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_personalResource1"
                        OnClickMore="" Personalize="False" Required="False">
                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:InputText></td>
            </tr>
        </table>
        <table id="Data_table" height="385" width="100%" runat="server">
            <tr>
                <td>
                    <div style="overflow: auto; width: 100%; height: 100%;">
                        <asp:DataGrid ID="DataGrid1" runat="server" Width="495px" BorderStyle="None" BorderWidth="0px"
                            BackColor="White" CssClass="Normal" GridLines="Horizontal" CellPadding="3" AutoGenerateColumns="False"
                            Font-Names="Arial" Font-Size="10pt" OnItemDataBound="DataGrid1_ItemDataBound"
                            meta:resourcekey="DataGrid1Resource1">
                            <FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
                            <SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
                            <AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
                            <ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
                            <HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="Black"></HeaderStyle>
                            <Columns>
                                <asp:BoundColumn Visible="False" DataField="id" HeaderText="ID">
                                    <HeaderStyle Width="0px"></HeaderStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Select">
                                    <HeaderStyle HorizontalAlign="Center" Width="50px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <SmoothEnterpriseWebControl:InputButton ID="IB_selected" OnClick="HistoryFunction_Click"
                                            runat="server" CssClass="NormalBold" Text="選取" Font-Bold="True" BorderColor="#606060"
                                            BorderStyle="Solid" BorderWidth="1px" Font-Size="12px" Font-Names="Arial" BackColor="#C8C8C8"
                                            RunAtCient="False" meta:resourcekey="IB_selectedResource1">
                                            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="logonid" ReadOnly="True" HeaderText="Logon ID">
                                    <HeaderStyle ></HeaderStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="name" ReadOnly="True" HeaderText="Name">
                                    <HeaderStyle ></HeaderStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="gid_name" ReadOnly="True" HeaderText="Group">
                                    <HeaderStyle ></HeaderStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="utype_name" HeaderText="User Type">
                                    <HeaderStyle ></HeaderStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Personal List">
                                    <HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <SmoothEnterpriseWebControl:InputButton ID="IB_add" OnClick="PersonalFunction_Click"
                                            runat="server" CssClass="NormalBold" Width="50px" Text="+ 加入" Font-Bold="True"
                                            BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" Font-Size="12px"
                                            Font-Names="Arial" BackColor="#C8C8C8" RunAtCient="False" meta:resourcekey="IB_addResource1">
                                            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                        <SmoothEnterpriseWebControl:InputButton ID="IB_remove" OnClick="PersonalFunction_Click"
                                            runat="server" CssClass="NormalBold" Width="50px" Text="- 移除" Font-Bold="True"
                                            BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" Font-Size="12px"
                                            Font-Names="Arial" BackColor="#C8C8C8" RunAtCient="False" meta:resourcekey="IB_removeResource1">
                                            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages">
                            </PagerStyle>
                        </asp:DataGrid></div>
                </td>
            </tr>
        </table>
        <asp:Literal ID="L_JavaScript" runat="server" meta:resourcekey="L_JavaScriptResource1"></asp:Literal>
    </form>
</body>
</html>
