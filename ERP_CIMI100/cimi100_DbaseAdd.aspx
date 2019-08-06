<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="cimi100_DbaseAdd.aspx.cs" Inherits="ERP_CIMI100.cimi100_baseAdd" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="cimi100_base Add Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" Class="Normal">
		<tr>
			<td valign="top">
				<table>
					
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_bass_class" runat="server" CssClass="NormalBold" Text="資料分類" meta:resourcekey="LABEL_bass_classResource1"></asp:Label></td></tr><tr><td>
                             <asp:DropDownList ID="FIELD_class_no" runat="server" meta:resourcekey="FIELD_class_noResource1" Enabled="False">
                             </asp:DropDownList></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_bass_no" runat="server" CssClass="NormalBold" Text="編號" meta:resourcekey="LABEL_bass_noResource1" ></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_bass_no" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Bass_no」!!" MaxLength="20" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_bass_noResource1" OnClickMore="" Personalize="False" Required="False"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                             <ErrorStyle BorderStyle="NotSet" CssClass="" />
                         </SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_remark" runat="server" CssClass="NormalBold" Text="名稱" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_name" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Remark」!!" MaxLength="200" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False" Required="False"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                             <ErrorStyle BorderStyle="NotSet" CssClass="" />
                         </SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_contrast_class" runat="server" CssClass="NormalBold" Text="對應類別" meta:resourcekey="LABEL_contrast_classResource1" Enabled="False" Visible="False"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_contrast_class" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Contrast_class」!!" MaxLength="20" Enabled="False" Visible="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_contrast_classResource1" OnClickMore="" Personalize="False" Required="False"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                             <ErrorStyle BorderStyle="NotSet" />
                         </SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_order_no" runat="server" CssClass="NormalBold" Text="排列順序" meta:resourcekey="LABEL_order_noResource1" Enabled="False" Visible="False"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_order_no" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Edit_user」!!" Enabled="False" Visible="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_order_noResource1" OnClickMore="" Personalize="False" Required="False"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                             <ErrorStyle BorderStyle="NotSet" />
                         </SmoothEnterpriseWebControl:InputText></td></tr>
                    <tr>
                        <td><asp:Label ID="LABEL_plantid" runat="server" CssClass="NormalBold" Text="需求廠區" meta:resourcekey="LABEL_plantidResource1" Enabled="False"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="FIELD_plantid" runat="server" meta:resourcekey="FIELD_plantidResource1" Enabled="False"  >
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="需求人員" meta:resourcekey="LABEL_need_userResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_need_user" runat="server"
                                BackColor="#F0F0F0" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                                FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" DisplayFieldHidden="False" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_need_userResource1" OnClickMore="" Personalize="False" Required="False">
                                <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                                <errorstyle borderstyle="NotSet" />
                            </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                    </tr>
				</table>
			</td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" meta:resourcekey="BUTTON_saveResource1" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click" RunAtCient="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_savenext" runat="server" Text="儲存後繼續操作" meta:resourcekey="BUTTON_savenextResource1" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click" RunAtCient="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" meta:resourcekey="BUTTON_backResource1" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click" RunAtCient="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>