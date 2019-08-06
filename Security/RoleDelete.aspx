<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.RoleDelete, App_Web_roledelete.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<SmoothEnterpriseWebControl:PAGEJUMPER id="PageJumper1" runat="server" ShowPageNumber="True" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
		<BUTTONSTYLE BackColor="200, 200, 200" BorderColor="96, 96, 96" BorderWidth="1px" BorderStyle="Solid"
			Width="20px" PaddingSize="2px" GradientEnd="64, 64, 64" GradientBegin="224, 224, 224" CssClass=""></BUTTONSTYLE>
		<PAGESELECTEDSTYLE BackColor="WhiteSmoke" BorderColor="Black" BorderWidth="3px" BorderStyle="Solid" CssClass=""></PAGESELECTEDSTYLE>
		<PAGENUMBERSTYLE ForeColor="Black" BackColor="White" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid"
			Font-Names="Arial" Font-Size="10px" Width="10px" PaddingSize="2px" CssClass=""></PAGENUMBERSTYLE>
	</SmoothEnterpriseWebControl:PAGEJUMPER>
	<table Class="Normal" border="0">
		<TBODY>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_code" runat="server" Text="�N�X" meta:resourcekey="LABEL_codeResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_code" runat="server" name="FIELD_code" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_codeResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_name" runat="server" Text="�W��" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" runat="server" name="FIELD_name" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_remark" runat="server" Text="�Ƶ�" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" runat="server" name="FIELD_remark" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_gid" runat="server" Text="�s��" meta:resourcekey="LABEL_gidResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_gid" runat="server" name="FIELD_gid" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_gidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_authcode" runat="server" Text="���v����X" meta:resourcekey="LABEL_authcodeResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_authcode" runat="server" name="FIELD_authcode" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_authcodeResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_isdefault" runat="server" Text="�O�_���w�]����" meta:resourcekey="LABEL_isdefaultResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_isdefault" runat="server" name="FIELD_isdefault" CssClass="PanelWhite"
						readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_isdefaultResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_seq" runat="server" Text="��ܶ���" meta:resourcekey="LABEL_seqResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_seq" runat="server" name="FIELD_seq" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_seqResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_inituid" runat="server" Text="�إߤH��" meta:resourcekey="LABEL_inituidResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_inituid" runat="server" name="FIELD_inituid" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_inituidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_initdate" runat="server" Text="�إߤ��" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_initdate" runat="server" name="FIELD_initdate" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_initdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_modifyuid" runat="server" Text="��s�H��" meta:resourcekey="LABEL_modifyuidResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_modifyuid" runat="server" name="FIELD_modifyuid" CssClass="PanelWhite"
						readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifyuidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
			<tr Class="NormalBold">
				<td><asp:Label ID="LABEL_modifydate" runat="server" Text="��s���" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="FIELD_modifydate" runat="server" name="FIELD_modifydate" CssClass="PanelWhite"
						readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifydateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
			</tr>
		</TBODY>
	</table>
	<SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold"
		width="80px" Text="�R��" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
        <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
    </SmoothEnterpriseWebControl:inputbutton>
	<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Font-Bold="True" Text="����"
		width="80px" Gradient-GradientType="Bottom" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
        <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
    </SmoothEnterpriseWebControl:inputbutton>
</asp:Content>
