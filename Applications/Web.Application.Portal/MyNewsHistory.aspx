<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.MyNewsHistory, App_Web_mynewshistory.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="Black"
					EnablePrint="False" EnableExport="False" EnableCustom="False" CellPadding="3px" guid="" rows="10" gridlines="both"
					borderwidth="1px" borderstyle="Solid" NavigatorGradient="Left" HeaderGradient="Left" HeaderHeight="30px"
					SelectedColor="224, 224, 224" Font-Names="Arial" Font-Size="12px" SQL="select * from dgnews" PageSize="5"
					Width="800px" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False" ConnectionString="Provider=SQLOLEDB;Password=sa;Persist Security Info=True;User ID=sa;Data Source=DG-AXION;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DG-AXION;Use Encryption for Data=False;Tag with column collation when possible=False;Initial Catalog=Smooth2005;" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="�s��" Width="20px" DataName="newsno"
							Sortable="True" ID="dcnewsno" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dcnewsnoResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="�̷s�������e" Required="True" ID="dcuserdefined" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dcuserdefinedResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="�y�z" DataName="description" Sortable="True"
							ID="dcdescription" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dcdescriptionResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="�_�l�ɶ�" DataName="sdate" Sortable="True"
							ID="dcsdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dcsdateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="�����ɶ�" DataName="edate" Sortable="True"
							ID="dcedate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dcedateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="���e" DataName="details" Sortable="True"
							ID="dcdetails" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dcdetailsResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="UserDefined" Caption="��L�s��" DataAlign="Center" DataName="linkurl"
							ID="dclinkurl" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dclinkurlResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="�إߤH��" DataName="inituid" Sortable="True"
							ID="dcinituid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dcinituidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="�إ߮ɶ�" DataName="initdate" ID="dcinitdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dcinitdateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="��s�H��" DataName="modifyuid" Sortable="True"
							ID="dcmodifyuid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dcmodifyuidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="��s�ɶ�" DataName="modifydate" Sortable="True"
							ID="dcmodifydate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="dcmodifydateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="IconView" DataAlign="Center" Width="1%" ID="view" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="viewResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
					<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
					<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet" CssClass=""></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Horizontal" LineWidth="1px"></GridLine>
					<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
                    <RowStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:DataList>
			</td>
		</tr>
		<TR>
			<TD><FONT face="�s�ө���">
					<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
						BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" cssClass="NormalBold"
						Text="�^�W��" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
						<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
					</SmoothEnterpriseWebControl:InputButton>
					<SmoothEnterpriseWebControl:InputText id="readno" runat="server" Width="0px" cssClass="Normal"
						backcolor="#F0F0F0" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="readnoResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:inputtext></FONT></TD>
		</TR>
	</table>
	<table border="0">
	</table>
</asp:Content>
