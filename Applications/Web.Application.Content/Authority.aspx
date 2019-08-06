<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.Authority, App_Web_authority.aspx.cdcab7d2" title="檔案及目錄內容授權維護" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Src="uc/AuthTypeDescription.ascx" TagName="AuthTypeDescription" TagPrefix="uc1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>    
	<table cellSpacing="0" cellPadding="0" border="0">
		<tr vAlign="top">
			<td>
				<table class="panelblue" border="0">
					<tr Class="NormalBold">
						<td><asp:Label ID="LABEL_everyone" runat="server" Text="所有人皆可讀取" meta:resourcekey="LABEL_everyoneResource1"></asp:Label></td>
						<td><asp:Label ID="LABEL_authtypename" runat="server" Text="授權類型" meta:resourcekey="LABEL_authtypenameResource1"></asp:Label></td>
					</tr>
					<tr Class="NormalBold">
						<td><SmoothEnterpriseWebControl:checkboxlist id="CHECK_everyone" runat="server" Width="100px" ListDirection="Horizontal" cssClass="Normal" meta:resourcekey="CHECK_everyoneResource1" Value="">
								<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
									Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
								<Items>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="授權" Description="" Value="Y" GroupText="" meta:resourcekey="CheckBoxListItem_everyoneResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
								</Items>
                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:checkboxlist></td>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_authtypeid" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
								ItemAll-Value=" " ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text=" " ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_authtypeidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect><SmoothEnterpriseWebControl:inputbutton id="BUTTON_auth" runat="server" Width="24px" Font-Names="Arial" Font-Size="12px"
								BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Font-Bold="True" Text="..." RunAtCient="True" meta:resourcekey="BUTTON_authResource1">
								<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
							</SmoothEnterpriseWebControl:inputbutton></td>
					</tr>
				</table>
			</td>
			<td>&nbsp;</td>
			<td><uc1:AuthTypeDescription id="AuthTypeDescription1" runat="server"></uc1:AuthTypeDescription>&nbsp;&nbsp;</td>
		</tr>
	</table>
	<table border="0">
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_group" runat="server" Text="群組" meta:resourcekey="LABEL_groupResource1"></asp:Label></td>
			<td><asp:Label ID="LABEL_roleuser" runat="server" Text="類別" meta:resourcekey="LABEL_roleuserResource1"></asp:Label></td>
			<td><asp:Label ID="LABEL_roleusername" runat="server" Text="角色或使用者名稱" meta:resourcekey="LABEL_roleusernameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputselect id="QUERY_group" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
					Personalize="True" ItemAllDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_groupResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:InputSelect></td>
			<td><SmoothEnterpriseWebControl:inputselect id="QUERY_roleuser" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
					Personalize="True" ItemAllDisplayed="True" Value="R" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_roleuserResource1" Mode="Single" TextBoxStyle="ThreeDStyle">
					<Items>
						<SmoothEnterpriseWebControl:SelectItem  Selected="True" RowHeight="18"
							Value="R" IconUrl="img/icon-role.gif" Text="角色" GroupText="" ID="SELECT_role" style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_roleResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
						<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
							Value="U" IconUrl="img/icon-user.gif" Text="使用者" GroupText="" ID="SELECT_user" style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_userResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
					</Items>
				<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:InputSelect></td>
			<td><SmoothEnterpriseWebControl:inputtext id="QUERY_roleusername" runat="server" BackColor="#F0F0F0" CssClass="Normal" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_roleusernameResource1" OnClickMore="" Required="False"
					><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_query" runat="server" OnClick="BUTTON_query_Click" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Text="查詢"
					Gradient-GradientType="Bottom" width="80px" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="Black"
                    BorderStyle="Solid" BorderWidth="1px" CellPadding="3px" EnableCustom="True" EnableExport="False"
                    EnablePrint="False" Font-Names="Arial" Font-Size="12px" gridlines="both" guid="" HeaderGradient="Left" HeaderHeight="30px"
                    NavigatorGradient="Left" OnOnRenderCell="DataList1_OnRenderCell" rows="10" SelectedColor="224, 224, 224" SQL="select * from dgauthtype" BackImageURL="" Connected="False" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
                   					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" DataAlign="Center" Width="1%" Required="True" ID="DataList1_icon" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_iconResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="代號/帳號" Width="100px" Font-Bold="True" DataName="logonid"
							ID="DataList1_logonid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_logonidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="角色/使用者名稱" Width="120px" DataName="name" ID="DataList1_roleusername" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_roleusernameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
					<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
					<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet" CssClass=""></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
					<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
                    <RowStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:DataList>
            </td>
		</tr>
	</table>
	<table border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" OnClick="BUTTON_save_Click" Width="80px" Font-Names="Arial" Font-Size="12px"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Font-Bold="True"
					Text="儲存" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
					<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" OnClick="BUTTON_back_Click" Width="80px" Font-Names="Arial" Font-Size="12px"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Font-Bold="True"
					Text="回上頁" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
					<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_authvalue" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
					HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_authvalueResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>&nbsp;
				<SmoothEnterpriseWebControl:inputtext id="FIELD_ruids" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
					HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_ruidsResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>&nbsp;
				<SmoothEnterpriseWebControl:inputtext id="FIELD_dataauth" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
					HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_dataauthResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
	</table>
</asp:Content>

