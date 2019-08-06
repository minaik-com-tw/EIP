<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.GrantedContent, App_Web_grantedcontent.aspx.cdcab7d2" title="使用者(角色)授權檔案內容管理" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
		<TR>
			<TD colSpan="3"><SmoothEnterpriseWebControl:CHECKBOXLIST id="QUERY_type" runat="server" BackColor="Gainsboro" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="Gray" Font-Size="10pt" Font-Names="Arial" Width="228px" ForeColor="DarkBlue" cssClass="Normal" CheckMode="SingleRadio"
					ListDirection="Horizontal" OnSelectedIndexChanged="QUERY_type_SelectedIndexChanged" meta:resourcekey="QUERY_typeResource1" Value="uid">
					<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
						Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
					<Items>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="依使用者查詢" Description="" Value="uid" GroupText="" meta:resourcekey="CheckBoxListItem1_typeResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="依角色查詢" Description="" Value="role" GroupText="" meta:resourcekey="CheckBoxListItem2_typeResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
					</Items>
                <DescriptionStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:CHECKBOXLIST></TD>
		</TR>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_uid" runat="server" Text="使用者" meta:resourcekey="LABEL_uidResource1"></asp:Label></TD>
			<td><asp:Label ID="LABEL_role" runat="server" Text="角色" meta:resourcekey="LABEL_roleResource1"></asp:Label></td>
			<td><asp:Label ID="LABEL_linkurl" runat="server" Text="連結" meta:resourcekey="LABEL_linkurlResource1"></asp:Label></TD>
		</tr>
		<tr>
			<TD id="INPUT_uid" runat="server"><SmoothEnterpriseWebControlEnterprise:POPUPUSER id="QUERY_uid" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
					DisplayField="name" FormatValueField="logonid" ValueField="id" FormatType="InputCombo" Personalize="True" DisplayFieldHidden="True" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_uidResource1" OnClickMore="" Required="False">
                <Gradient GradientBegin="" GradientEnd="" />
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControlEnterprise:POPUPUSER></TD>
			<td id="INPUT_role" runat="server"><SmoothEnterpriseWebControl:inputselect id="QUERY_role" runat="server"  cssClass="Normal" Personalize="True"
					ItemAll-Value="%" backcolor="#F0F0F0" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_roleResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:InputSelect></td>
			<TD id="INPUT_linkurl" runat="server"><FONT face="新細明體"><SmoothEnterpriseWebControlEnterprise:selectcontent id="QUERY_linkurl" runat="server" cssClass="Normal" ValueField="linkurl" backcolor="White"
						Editable="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_linkurlResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="" ItemNoneDisplayed="True">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" />
            </SmoothEnterpriseWebControlEnterprise:selectcontent></FONT></TD>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_query" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Text="查詢" width="80px" Font-Bold="True" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:DATALIST id="DataList1" runat="server" BorderColor="Black" Font-Size="12px" Font-Names="Arial"
					Personalize="True"
					EnablePrint="False" EnableExport="False" EnableCustom="True" CellPadding="3px" guid="" rows="10" gridlines="both"
					borderwidth="1px" borderstyle="Solid" NavigatorGradient="Left" HeaderGradient="Left" HeaderHeight="30px"
					SelectedColor="224, 224, 224" SQL="select * from dgcontent WHERE 1=0" Connected="False" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" DataAlign="Center" Width="1%" Required="True" DataName="iconurl"
							ID="DataList1_icon" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_iconResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="內容顯示名稱" Width="300px" Required="True" DataName="description"
							Sortable="True" ID="DataList1_description" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_descriptionResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="內容檔案名稱" Width="250px" Required="True" DataName="filename"
							Sortable="True" ID="DataList1_filename" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_filenameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="連結位址" Width="150px" DataName="linkurl"
							Sortable="True" ID="DataList1_linkurl" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_linkurlResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容類別" DataName="filetypename" Sortable="True"
							ID="DataList1_filetype" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_filetypeResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容路徑名稱" DataName="pathname" Sortable="True"
							ID="DataList1_pathname" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_pathnameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容分類" DataName="catid" Sortable="True"
							ID="DataList1_catid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_catidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="圖示位址" DataName="imgurl" Sortable="True"
							ID="DataList1_imgurl" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_imgurlResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="備註說明" DataName="remark" Sortable="True"
							ID="DataList1_remark" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_remarkResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="授權項目" DataName="authtypename" Sortable="True"
							ID="DataList1_authtypename" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_authtypenameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="授權角色" DataName="authroles" Sortable="True"
							ID="DataList1_authroles" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_authrolesResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="檔案大小" DataAlign="Right" Width="80px" DataName="filesize"
							ID="DataList1_filesize" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_filesizeResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="資料修改時間" DataName="modifydate" Sortable="True" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifydateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
					<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
					<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet" CssClass=""></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
					<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
                <RowStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:DATALIST></td>
		</tr>
	</table>
	<table border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:checkboxlist id="CHECK_option" runat="server" Width="300px" cssClass="Normal" ListDirection="Horizontal" OnSelectedIndexChanged="CHECK_option_SelectedIndexChanged" meta:resourcekey="CHECK_optionResource1" Value="">
					<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
						Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
					<Items>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="顯示全部的選項" Description="" Value="Y" GroupText="" meta:resourcekey="CheckBoxListItem_optionResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
					</Items>
                <DescriptionStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:checkboxlist>&nbsp;</td>
		</tr>
	</table>
</asp:Content>
