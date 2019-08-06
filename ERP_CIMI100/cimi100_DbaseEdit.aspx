<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="cimi100_DbaseEdit.aspx.cs" Inherits="ERP_CIMI100.cimi100_baseEdit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="cimi100_base Edit Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0" class="Normal">
        <tr>
            <td valign="top">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_bass_class" runat="server" CssClass="NormalBold" Text="資料分類" meta:resourcekey="LABEL_bass_classResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="FIELD_class_no" runat="server" Enabled="False" meta:resourcekey="FIELD_class_noResource1">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_bass_no" runat="server" CssClass="NormalBold" Text="編號" meta:resourcekey="LABEL_bass_noResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_bass_no" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" ErrorMessage="Please Input「Bass_no」!!" MaxLength="20" Enabled="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_bass_noResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_remark" runat="server" CssClass="NormalBold" Text="名稱" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" ErrorMessage="Please Input「Remark」!!" MaxLength="200" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False" Required="False">
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_contrast_class" runat="server" CssClass="NormalBold" Enabled="False"
                                Text="對應類別" meta:resourcekey="LABEL_contrast_classResource1" Visible="False"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_contrast_class" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" Enabled="False" ErrorMessage="Please Input「Contrast_class」!!"
                                MaxLength="20" Visible="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_contrast_classResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_order_no" runat="server" CssClass="NormalBold" Enabled="False"
                                Text="排列順序" meta:resourcekey="LABEL_order_noResource1" Visible="False"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_order_no" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" Enabled="False" ErrorMessage="Please Input「Edit_user」!!"
                                Visible="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_order_noResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_plantid" runat="server" CssClass="NormalBold" Text="需求廠區" meta:resourcekey="LABEL_plantidResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="FIELD_plantid" runat="server" meta:resourcekey="FIELD_plantidResource1" >
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="需求人員" meta:resourcekey="LABEL_need_userResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_need_user" runat="server"
                                BackColor="#F0F0F0" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                                FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" DisplayFieldHidden="False" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_need_userResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label_status" runat="server" CssClass="NormalBold" Text="有效碼" meta:resourcekey="Label_statusResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="FIELD_status" runat="server" meta:resourcekey="FIELD_statusResource1">
                                <asp:ListItem meta:resourcekey="ListItemResource1">Y</asp:ListItem>
                                <asp:ListItem meta:resourcekey="ListItemResource2">N</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" meta:resourcekey="BUTTON_saveResource1" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click" RunAtCient="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" meta:resourcekey="BUTTON_backResource1" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click" RunAtCient="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;&nbsp;
			</td>
		</tr>
	</table>
</asp:Content>