<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.DeputyDelete, App_Web_deputydelete.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
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
			Width="20px"  PaddingSize="2px" GradientEnd="64, 64, 64" GradientBegin="224, 224, 224" CssClass=""></BUTTONSTYLE>
		<PAGESELECTEDSTYLE BackColor="WhiteSmoke" BorderColor="Black" BorderWidth="3px" BorderStyle="Solid" CssClass=""></PAGESELECTEDSTYLE>
		<PAGENUMBERSTYLE ForeColor="Black" BackColor="White" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid"
			Font-Names="Arial" Font-Size="10px" Width="10px" PaddingSize="2px" CssClass=""></PAGENUMBERSTYLE>
	</SmoothEnterpriseWebControl:PAGEJUMPER>
	<table border="0" Class="Normal">
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_user" runat="server" Text="使用者" meta:resourcekey="LABEL_userResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_uid" id="FIELD_uid" CssClass="PanelWhite" readonly="True" runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_uidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_deputy" runat="server" Text="代理人員" meta:resourcekey="LABEL_deputyResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_deputyuid" id="FIELD_deputyuid" CssClass="PanelWhite" readonly="True"
					runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_deputyuidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_sdate" runat="server" Text="起始時間" meta:resourcekey="LABEL_sdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_sdate" id="FIELD_sdate" CssClass="PanelWhite" readonly="True" runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_sdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_edate" runat="server" Text="結束時間" meta:resourcekey="LABEL_edateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_edate" id="FIELD_edate" CssClass="PanelWhite" readonly="True" runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_edateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_initname" runat="server" Text="建立人員" meta:resourcekey="LABEL_initnameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_inituid" id="FIELD_inituid" CssClass="PanelWhite" readonly="True" runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_inituidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_initdate" runat="server" Text="建立時間" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_initdate" id="FIELD_initdate" CssClass="PanelWhite" readonly="True"
					runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_initdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_modifyname" runat="server" Text="更新人員" meta:resourcekey="LABEL_modifynameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_modifyuid" id="FIELD_modifyuid" CssClass="PanelWhite" readonly="True"
					runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifyuidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_modifydate" runat="server" Text="更新時間" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext name="FIELD_modifydate" id="FIELD_modifydate" CssClass="PanelWhite" readonly="True"
					runat="server" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifydateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
	</table>
	<SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold"
		Font-Bold="True" Text="刪除" width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
        <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
    </SmoothEnterpriseWebControl:inputbutton>
	<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold"
		Font-Bold="True" Text="取消" width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
        <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
    </SmoothEnterpriseWebControl:inputbutton>
</asp:Content>
