<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.FlowRelationEdit, App_Web_flowrelationedit.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table Class="Normal" border="0">
		<tr>
			<td vAlign="top">
				<table>
					<tr>
						<td Class="NormalBold">
							<asp:Label ID="LABEL_relationname" runat="server" Text="關聯名稱" meta:resourcekey="LABEL_relationnameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" tabIndex="101" runat="server" BackColor="#F0F0F0" CssClass="Normal"
								ErrorMessage="請輸入「關聯名稱」!!"  Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
							<asp:Label ID="LABEL_description" runat="server" Text="描述" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_description" tabIndex="102" runat="server" Width="400px" BackColor="#F0F0F0"
								CssClass="Normal" ErrorMessage="請輸入「描述」!!"  Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_descriptionResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table Class="Normal" border="0">
		<tr>
			<td>
				<table>
					<tr Class="NormalBold">
						<td style="HEIGHT: 22px">
							<asp:Label ID="LABEL_user" runat="server" Text="使用者" meta:resourcekey="LABEL_userResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:popupuser id="DETAIL_uid" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="使用者必須輸入."
								 OnClickMore="OpenShowModalDialog();" Required="False" FormatValueField="logonid"
								ValueField="id" FormatType="InputCombo" DisplayFieldHidden="True" EnableViewState="False" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" DisplayField="name" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="DETAIL_uidResource1" Personalize="False">
                            <Gradient GradientBegin="" GradientEnd="" />
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControlEnterprise:popupuser></td>
						<td><SmoothEnterpriseWebControl:inputbutton id="AddButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
								BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
								Font-Bold="True" Text="新增" width="80px" OnClick="AddButton_Click" meta:resourcekey="AddButtonResource1" RunAtCient="False">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:inputbutton></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:DATALIST id="DataList1" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="Gray"
					BackColor="#E0E0E0" SQL="select a.*,b.name as uname,c.name as initname from dgflowrelationuser a left join dguser b on a.uid=b.id left join dguser c on a.inituid=c.id where 1=0" HeaderHeight="30px"
					EnablePrint="False" EnableExport="False" EnableCustom="False" CellPadding="3px" Connected="False" borderstyle="Solid"
					borderwidth="1px" gridlines="both" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" ConnectionString="Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;User ID=sa;Initial Catalog=demo2000;Data Source=localhost" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="使用者" Required="True" DataName="uname" ID="DataList1_user" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_userResource1" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="初始人員" DataName="initname" ID="DataList1_initname" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_initnameResource1" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="初始日期" DataName="initdate" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_initdateResource1" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Width="1%" ID="DataList1_delbutton" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_delbuttonResource1" DataStyle-CssClass="" HeaderStyle-CssClass="">
							<Template>
								<SmoothEnterpriseWebControl:InputText id="keys" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
									HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="keysResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:inputtext>
								<SmoothEnterpriseWebControl:InputButton id="BT_delete" onclick="DetailDeleteButton_Click" runat="server" BackColor="#C8C8C8"
									BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Text="刪除" Font-Bold="True" RunAtCient="False" meta:resourcekey="BT_deleteResource1">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                </SmoothEnterpriseWebControl:InputButton>
							</Template>
						</SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
					<HeaderStyle Font-Bold="True" BackColor="Silver" BorderStyle="NotSet" CssClass=""></HeaderStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
                <SelectStyle BorderStyle="NotSet" CssClass="" />
                <SelectColumnStyle BorderStyle="NotSet" CssClass="" />
                <HoverStyle BorderStyle="NotSet" CssClass="" />
                <RowStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:DATALIST></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="SaveButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="儲存" width="80px" meta:resourcekey="SaveButtonResource1" RunAtCient="False" OnClick="SaveButton_Click">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="回上頁" width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="刪除" width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
