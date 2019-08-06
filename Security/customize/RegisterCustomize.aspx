<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.RegisterCustomize, App_Web_registercustomize.aspx.dd4e8b7f" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table border="0">
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_registeritems" runat="server" Text="�п�ܭn�ҥΪ����U�{�Ҷ���" meta:resourcekey="LABEL_registeritemsResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:CheckBoxList id="FIELD_registeritems" runat="server" Width="520px" cssClass="Normal" RadioUnCheck="True"
					BorderWidth="0px" BackColor="Lavender" Font-Bold="True" meta:resourcekey="FIELD_registeritemsResource1" Value="SmoothUser,ADUser,WindowUser">
					<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
						Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
					<DescriptionStyle GradientEnd="Blue" ForeColor="Navy" GradientLevel="50" Gradient="Right" PaddingSize="3px"
						GradientBegin="White" BorderStyle="NotSet" CssClass=""></DescriptionStyle>
					<Items>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="SmoothEnterprise.NET User" Description="�W�߫����Ψt�Ϊ��ϥΪ̱b���{�ҼҦ��A�A�Ω���~�����Υ~���ϥΪ̪��̨Φw���ʵn�J�޲z�A�P�ɤ]�W�ߩ���~�������ϥΪ̺޲z"
							Value="SmoothUser" GroupText="" meta:resourcekey="CheckBoxListItem1_registeritemsResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="AD User" Description="�t�X���~ Active Directory �[�c���ϥΪ̱b���n�J�{�Ҥ覡�A�n�J���b�������O�w�s�b�� Active Directory �����U�b���A�����b�����n�J���q�A�����q�L���쪺 Active Directory �{��"
							Value="ADUser" GroupText="" meta:resourcekey="CheckBoxListItem2_registeritemsResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="Window User" Description="�t�X�ϥΪ̺ݪ��n�J�{��(Windows �� Active Directory)�A�t�η|�۰ʰ����ثe�n�J�b���A�ð���{�ҳB�z�A���ݦA��J�b���αK�X"
							Value="WindowUser" GroupText="" meta:resourcekey="CheckBoxListItem3_registeritemsResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
					</Items>
				</SmoothEnterpriseWebControl:CheckBoxList></td>
		</tr>
	</table>
	<TABLE id="Table1">
		<TR>
			<TD>
				<smoothenterprisewebcontrol:inputbutton id="BUTTON_save" Text="�x�s" runat="server" backcolor="#C8C8C8"
                    bordercolor="#606060" borderstyle="Solid" borderwidth="1px" cssClass="NormalBold"
                    font-bold="True" font-names="Arial" font-size="12px" Width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False"><Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient></smoothenterprisewebcontrol:inputbutton>
                &nbsp;
                <smoothenterprisewebcontrol:inputbutton id="BUTTON_back" Text="�^�W��" runat="server" backcolor="#C8C8C8"
                    bordercolor="#606060" borderstyle="Solid" borderwidth="1px" cssClass="NormalBold"
                    font-bold="True" font-names="Arial" font-size="12px" Width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False"><Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient></smoothenterprisewebcontrol:inputbutton>
				</TD>
		</TR>
	</TABLE>
</asp:Content>
