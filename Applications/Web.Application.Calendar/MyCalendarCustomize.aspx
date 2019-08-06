<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyCalendarCustomize, App_Web_mycalendarcustomize.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Src="uc/CalendarNavigator.ascx" TagName="CalendarNavigator" TagPrefix="uc1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<table Class="Normal" border="0">
		<tr>
			<td vAlign="top">
                <uc1:CalendarNavigator ID="CalendarNavigator1" runat="server" />
				<table>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_calendarname" runat="server" Text="�z����ƾ���ܪ��W��" meta:resourcekey="LABEL_calendarnameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_calendarname" tabIndex="100" runat="server" ErrorMessage="�п�J�uUid�v!!"
								 CssClass="Normal" Width="424px" BackColor="#F0F0F0" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_calendarnameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext><SmoothEnterpriseWebControl:inputtext id="InputText_Edit" runat="server"  CssClass="Normal"
								BackColor="#F0F0F0" HiddenMode="True" Text="N" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="InputText_EditResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                     <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                 </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_defaultpage" runat="server" Text="�w�]�˵�����ƾ�P�i�J����" meta:resourcekey="LABEL_defaultpageResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_defaultcalid" runat="server" cssClass="Normal" backcolor="#F0F0F0" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_defaultcalidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect><SmoothEnterpriseWebControl:inputselect id="FIELD_viewurl" runat="server" cssClass="Normal" backcolor="#F0F0F0" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_viewurlResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="MyYear.aspx" >
								<Items>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�~�����" Selected="False" Value="MyYear.aspx" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="������" Selected="False" Value="MyMonth.aspx" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource2" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="��g���" Selected="False" Value="MyWeek.aspx" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource3" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="������" Selected="False" Value="MyDay.aspx" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource4" runat="server"></SmoothEnterpriseWebControl:SelectItem>
								</Items>
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:checkbox id="CheckBox_defaultview" runat="server" Text="�ƥ�w�]�}���˵�" meta:resourcekey="CheckBox_defaultviewResource1"></asp:checkbox></td>
					</tr>
					<TR>
						<td Class="NormalBold"></td>
					</TR>
					<tr>
						<td><SmoothEnterpriseWebControl:MULTISELECT id="Input_MyCalendar" runat="server" CssClass="normalblod" Width="552px" SelectBgColor1="204, 204, 204"
								SelectBgColor2="Silver" SelectionLabel="�ڪ���ƾ�" SelectedLabel="���ê��i��ܦ�ƾ�" Font-Names="Arial" Font-Size="12px" meta:resourcekey="Input_MyCalendarResource1" Order="False" Size="10" Value="">
								<LabelStyle CssClass="NormalBold" BackColor="Transparent" BorderStyle="NotSet"></LabelStyle>
							</SmoothEnterpriseWebControl:MULTISELECT></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<!--
					<tr>
						<td Class="NormalBold" id="TD_timeperiod" runat="server">�����ܪ��ɶ��Ϭq</td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:inputselect id="InputStime" runat="server" cssClass="Normal" backcolor="#F0F0F0" >
								<Items>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="00" Selected="False" Value="00" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="01" Selected="False" Value="01" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="02" Selected="False" Value="02" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="03" Selected="False" Value="03" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="04" Selected="False" Value="04" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="05" Selected="False" Value="05" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="06" Selected="False" Value="06" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="07" Selected="False" Value="07" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="08" Selected="False" Value="08" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="09" Selected="False" Value="09" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="10" Selected="False" Value="10" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="11" Selected="False" Value="11" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="12" Selected="False" Value="12" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="13" Selected="False" Value="13" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="14" Selected="False" Value="14" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="15" Selected="False" Value="15" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="16" Selected="False" Value="16" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="17" Selected="False" Value="17" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="18" Selected="False" Value="18" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
								</Items>
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect>��
							<SmoothEnterpriseWebControl:inputselect id="InputEtime" runat="server" cssClass="Normal" backcolor="#F0F0F0" >
								<Items>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="00" Selected="False" Value="00" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="01" Selected="False" Value="01" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="02" Selected="False" Value="02" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="03" Selected="False" Value="03" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="04" Selected="False" Value="04" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="05" Selected="False" Value="05" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="06" Selected="False" Value="06" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="07" Selected="False" Value="07" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="08" Selected="False" Value="08" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="09" Selected="False" Value="09" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="10" Selected="False" Value="10" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="11" Selected="False" Value="11" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="12" Selected="False" Value="12" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="13" Selected="False" Value="13" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="14" Selected="False" Value="14" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="15" Selected="False" Value="15" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="16" Selected="False" Value="16" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="17" Selected="False" Value="17" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="18" Selected="False" Value="18" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="19" Selected="False" Value="19" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="20" Selected="False" Value="20" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="21" Selected="False" Value="21" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="22" Selected="False" Value="22" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="23" Selected="False" Value="23" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
								</Items>
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect>(��)</td>
					</tr>
					-->
					<!--
					<TR>
						<td Class="NormalBold">��g��ܪ��������� :</td>
					</TR>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="InputSelect_sday" runat="server"  backcolor="#F0F0F0" cssClass="Normal">
								<Items>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P����" Selected="False" Value="1" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���@" Selected="False" Value="2" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���G" Selected="False" Value="3" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���T" Selected="False" Value="4" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���|" Selected="False" Value="5" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P����" Selected="False" Value="6" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P����" Selected="False" Value="7" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
								</Items>
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect><SmoothEnterpriseWebControl:inputselect id="InputSelect_mday" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
								Value="1">
								<Items>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P����" Selected="False" Value="1" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���@" Selected="False" Value="2" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���G" Selected="False" Value="3" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���T" Selected="False" Value="4" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���|" Selected="False" Value="5" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P����" Selected="False" Value="6" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P����" Selected="False" Value="7" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
								</Items>
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect><SmoothEnterpriseWebControl:inputselect id="InputSelect_eday" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
								Value="1">
								<Items>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P����" Selected="False" Value="1" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���@" Selected="False" Value="2" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���G" Selected="False" Value="3" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���T" Selected="False" Value="4" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P���|" Selected="False" Value="5" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P����" Selected="False" Value="6" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="�P����" Selected="False" Value="7" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
								</Items>
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					-->
					<!--	-->
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_calendarsource" runat="server" Text="�i��ܤU�C�B�~���ƥ��ơA��ܩ�ӤH��ƾ��" meta:resourcekey="LABEL_calendarsourceResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
							<div id="DIV1" runat="server"></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_calendarauth" runat="server" Text="��ƾ��v���]�w" meta:resourcekey="LABEL_calendarauthResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:DATALIST id="DataList1" runat="server" Font-Names="Arial" Font-Size="12px" Connected="False"
					ConnectionString="Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;User ID=smooth;Initial Catalog=app1;Data Source=localhost" EnableCustom="True" CellPadding="3px" guid="" rows="10" gridlines="both" borderwidth="1px"
					borderstyle="Solid" NavigatorGradient="Left" HeaderGradient="Left" HeaderHeight="30px" SelectedColor="224, 224, 224"
					SQL="select * from dgprogauth" BorderColor="Black" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="calid" DataName="calid" ID="DataList1_calid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_calidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Width="1%" ID="Auth" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="AuthResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="��ƾ�" Width="200px" DataName="calname" ID="DataList1_calname" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_calnameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="���v" Width="50px" DataName="authtypes" ID="DataList1_authtypes" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_authtypesResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="�̪�ק���" Width="120px" DataName="modifydate" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifydateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
					<SelectStyle BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineWidth="1px"></GridLine>
                <RowStyle BorderStyle="NotSet" CssClass="" />
                <HoverStyle BorderStyle="NotSet" CssClass="" />
                <SelectColumnStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:DATALIST></td>
		</tr>
	</table>
	<table Class="Normal" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Size="12px" Font-Names="Arial" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" width="80px"
					Text="�x�s" Font-Bold="True" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" Font-Names="Arial" Font-Size="12px" BorderColor="#606060" Font-Bold="True" Text="�^�W��"
					width="80px" BorderWidth="1px" BorderStyle="Solid" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
