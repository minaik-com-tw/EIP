<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Survey.SurveySelectDelete, App_Web_surveyselectdelete.aspx.cdcab7d2" title="WebForm Delete Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor> 
	<SmoothEnterpriseWebControl:PageJumper id="PageJumper1" runat="server" ShowPageNumber="True" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
		<ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px" BorderStyle="Solid"
			BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200" ></ButtonStyle>
		<PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke"></PageSelectedStyle>
		<PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px" BorderWidth="1px"
			ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White"></PageNumberStyle>
	</SmoothEnterpriseWebControl:PageJumper>
	<table border="0" Class="Normal">
		<tr>
			<td valign="top"><table>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_name" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_seltype" runat="server" Text="選項類別" meta:resourcekey="LABEL_seltypeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_seltype" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_seltypeResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_modifyname" runat="server" Text="更新人員" meta:resourcekey="LABEL_modifynameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_modifyuid" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifyuidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_modifydate" runat="server" Text="更新日期" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_modifydate" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifydateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
			</td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="Gray"
					gridlines="both" borderwidth="1px" borderstyle="Solid" Connected="False" CellPadding="3px" EnableCustom="False"
					EnableExport="False" EnablePrint="False" HeaderHeight="30px" BackColor="#E0E0E0" SQL="select * from dgsurveyanswer where 1=0" BackImageURL="" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn ID="DataList1_name" DataType="ViewText" Caption="name" DataName="name" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_nameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn ID="DataList1_val" DataType="ViewText" Caption="val" DataName="val" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_valResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn ID="DataList1_seq" DataType="ViewText" Caption="seq" DataName="seq" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_seqResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn ID="DataList1_modifyuid" DataType="ViewText" Caption="modifyuid" DataName="modifyuid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_modifyuidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn ID="DataList1_modifydate" DataType="ViewText" Caption="modifydate" DataName="modifydate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_modifydateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
					<HeaderStyle Font-Bold="True" BackColor="Silver" BorderStyle="NotSet"></HeaderStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
                    <SelectStyle BorderStyle="NotSet" />
                    <RowStyle BorderStyle="NotSet" />
                    <HoverStyle BorderStyle="NotSet" />
                    <SelectColumnStyle BorderStyle="NotSet" />
				</SmoothEnterpriseWebControl:DataList></td>
		</tr>
		<tr>
			<td>
				<TABLE cellSpacing="0" cellPadding="0" border="0">
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
								BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
								Font-Bold="True" Text="刪除" width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
						<TD>&nbsp;
							<SmoothEnterpriseWebControl:inputbutton id="CancelButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
								BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
								Font-Bold="True" Text="取消" width="80px" OnClick="CancelButton_Click" meta:resourcekey="CancelButtonResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
					</TR>
				</TABLE>
			</td>
		</tr>
	</table>
</asp:Content>
