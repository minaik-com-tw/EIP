<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.UserDeputyDelete, App_Web_userdeputydelete.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
    <SmoothEnterpriseWebControl:pagejumper id="PageJumper1" runat="server" showpagenumber="True" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
		<BUTTONSTYLE BackColor="200, 200, 200" BorderStyle="Solid" BorderWidth="1px" BorderColor="96, 96, 96"
			Width="20px" GradientBegin="224, 224, 224" GradientEnd="64, 64, 64" PaddingSize="2px" CssClass=""></BUTTONSTYLE>
		<PAGESELECTEDSTYLE BackColor="WhiteSmoke" BorderStyle="Solid" BorderWidth="3px" BorderColor="Black" CssClass=""></PAGESELECTEDSTYLE>
		<PAGENUMBERSTYLE BackColor="White" BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" Font-Size="10px"
			Font-Names="Arial" Width="10px" ForeColor="Black" PaddingSize="2px" CssClass=""></PAGENUMBERSTYLE>
	</SmoothEnterpriseWebControl:pagejumper>
	<table border="0" Class="Normal">
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_uid" runat="server" Text="使用者" meta:resourcekey="LABEL_uidResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_uid" id="FIELD_uid" CssClass="PanelWhite" readonly="True" runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_uidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_deputyuid" runat="server" Text="代理人員" meta:resourcekey="LABEL_deputyuidResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_deputyuid" id="FIELD_deputyuid" CssClass="PanelWhite" readonly="True"
					runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_deputyuidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_sdate" runat="server" Text="起始時間" meta:resourcekey="LABEL_sdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_sdate" id="FIELD_sdate" CssClass="PanelWhite" readonly="True" runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_sdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_edate" runat="server" Text="結束時間" meta:resourcekey="LABEL_edateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_edate" id="FIELD_edate" CssClass="PanelWhite" readonly="True" runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_edateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_inituid" runat="server" Text="建立人員" meta:resourcekey="LABEL_inituidResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_inituid" id="FIELD_inituid" CssClass="PanelWhite" readonly="True" runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_inituidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_initdate" runat="server" Text="建立時間" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_initdate" id="FIELD_initdate" CssClass="PanelWhite" readonly="True"
					runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_initdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_modifyuid" runat="server" Text="更新人員" meta:resourcekey="LABEL_modifyuidResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_modifyuid" id="FIELD_modifyuid" CssClass="PanelWhite" readonly="True"
					runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifyuidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_modifydate" runat="server" Text="更新時間" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_modifydate" id="FIELD_modifydate" CssClass="PanelWhite" readonly="True"
					runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifydateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
	</table>
	<TABLE cellSpacing="0" cellPadding="0" border="0">
		<TR>
			<TD><SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px"
					Font-Bold="True" Text="刪除" width="80px" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
			<TD>
				&nbsp;<SmoothEnterpriseWebControl:inputbutton id="BUTTON_cancel" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold" width="80px"
					Text="取消" Font-Bold="True" OnClick="BUTTON_cancel_Click" meta:resourcekey="BUTTON_cancelResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
		</TR>
	</TABLE>
</asp:Content>
