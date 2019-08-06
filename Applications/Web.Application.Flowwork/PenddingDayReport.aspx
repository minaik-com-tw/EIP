<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.PenddingDayReport, App_Web_penddingdayreport.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
		Caption="糵糵ぱ计参璸" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
		<tr Class="NormalBold">
			<td runat="server">
			    <table cellpadding=0 cellspacing=0 border=0><tr><td><asp:CheckBox ID="CheckBox_flow" runat="server" Checked="True" meta:resourcekey="CheckBox_flowResource1" /></td>
			    <td class=normalbold>
			        <asp:Label ID="LABEL_flow" runat="server" Text="瑈祘" meta:resourcekey="LABEL_flowResource1"></asp:Label></td></tr>
			    </table>
			</td>
			<td id="Td1" runat="server">
			    <table cellpadding=0 cellspacing=0 border=0><tr><td><asp:CheckBox ID="CheckBox_node" runat="server" Checked="True" meta:resourcekey="CheckBox_nodeResource1" /></td>
			    <td class=normalbold>
			        <asp:Label ID="LABEL_ponit" runat="server" Text="竊翴" meta:resourcekey="LABEL_ponitResource1"></asp:Label></td></tr>
			    </table>
			</td>
			<td id="Td2" runat="server">
			    <table cellpadding=0 cellspacing=0 border=0><tr><td><asp:CheckBox ID="CheckBox_group" runat="server" Checked="True" meta:resourcekey="CheckBox_groupResource1" /></td>
			    <td class=normalbold>
			        <asp:Label ID="LABEL_group" runat="server" Text="竤舱" meta:resourcekey="LABEL_groupResource1"></asp:Label></td></tr>
			    </table>
			</td>
			<td id="Td3" runat="server">
			    <table cellpadding=0 cellspacing=0 border=0><tr><td><asp:CheckBox ID="CheckBox_reviewer" runat="server" Checked="True" meta:resourcekey="CheckBox_reviewerResource1" /></td>
			    <td class=normalbold>
			        <asp:Label ID="LABEL_reviewer" runat="server" Text="糵" meta:resourcekey="LABEL_reviewerResource1"></asp:Label></td></tr>
			    </table>
			</td>
			<td>
                <asp:Label ID="LABEL_flowdescription" runat="server" Text="糵瑈祘ミ丁" meta:resourcekey="LABEL_flowdescriptionResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputselect id="QUERY_flow" runat="server"  Personalize="True" cssClass="Normal"
					backcolor="#F0F0F0" ItemAllDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_flowResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" />
            </SmoothEnterpriseWebControl:InputSelect></td>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_flownode" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ItemAll-Value="%" ItemAllDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_flownodeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="%">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectGroup ID="QUERY_group" runat="server"
                    BackColor="#F0F0F0" CssClass="Normal" ItemAllDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_groupResource1" Mode="Single" RootId="" TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" />
                    <Items>
                        <SmoothEnterpriseWebControl:SelectItem runat="server" Gradient-GradientBegin="" Gradient-GradientEnd=""
                            GroupText="" IconUrl="" RowHeight="18" Selected="False" style="filter: ;" Text="DG"
                            Value="e4f11817-60c2-4fcf-8587-917a9fa18bcf" meta:resourcekey="SelectItemResource1">
                        </SmoothEnterpriseWebControl:SelectItem>
                        <SmoothEnterpriseWebControl:SelectItem runat="server" Gradient-GradientBegin="" Gradient-GradientEnd=""
                            GroupText="" IconUrl="" RowHeight="18" Selected="False" style="filter: ;" Text="DGIT场"
                            Value="e35b3050-fd80-4c07-bf20-b33dcaf6867a" meta:resourcekey="SelectItemResource2">
                        </SmoothEnterpriseWebControl:SelectItem>
                    </Items>
                </SmoothEnterpriseWebControlEnterprise:SelectGroup>
            </td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:PopupUser ID="QUERY_reviewer" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" DisplayField="name" DisplayFieldHidden="True" FormatType="InputCombo"
                    FormatValueField="logonid" Gradient-GradientType="Top" HiddenMode="False" ValueField="id" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_reviewerResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
			<td>
                <SmoothEnterpriseWebControl:DateRange ID="QUERY_flow_date" runat="server" CssClass="Normal"
                    RangeType="None" ButtonIconUrl="" DateFormat="YYYYMMDD" DateType="Date" DateWidth="100px" meta:resourcekey="QUERY_flow_dateResource1" Personalize="False" Width="200px">
                    <EndDate Text="" />
                    <StartDate Text="" />
                </SmoothEnterpriseWebControl:DateRange>
            </td>
			<td><SmoothEnterpriseWebControl:inputbutton id="QueryButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Text="琩高" Font-Bold="True" OnClick="QueryButton_Click" meta:resourcekey="QueryButtonResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:DATALIST id="DataList1" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="Black"
					SQL="select a.*, a.namespace+'.'+a.typename flowtype, b.name initname, c.name modifyname from dgflow a left join dguser b on a.inituid = b.id left join dguser c on a.modifyuid = c.id order by namespace, typename"
					SelectedColor="224, 224, 224" HeaderHeight="24px" HeaderGradient="Left" NavigatorGradient="Left" borderstyle="Solid"
					borderwidth="1px" gridlines="both" rows="10" guid="" CellPadding="3px" EnableCustom="True" RowNumber="False" OnOnRenderCell="DataList1_OnRenderCell" BackColor="Transparent" BackImageURL="" ForeColor="Black" Connected="False" ConnectionString="Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;User ID=sa;Initial Catalog=demo2000;Data Source=localhost" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="瑈祘" DataName="flowname" Sortable="True"
							ID="DataList1_flow" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_flowResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="糵竊翴" DataName="flownodename" Sortable="True"
							ID="DataList1_flownode" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_flownodeResource1"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_group" runat="server" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet" Caption="竤舱" DataName="groupname" Sortable="True" meta:resourcekey="DataList1_groupResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="糵" DataName="reviewername"
							Sortable="True" ID="DataList1_reviewer" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_reviewerResource1"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_reviewcount" runat="server" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet" Caption="糵Ω计" Sortable="True" DataAlign="Right" DataName="reviewcount" HeaderAlign="Right" meta:resourcekey="DataList1_reviewcountResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="キА糵ぱ计" Required="True" DataName="avgday"
							Sortable="True" ID="DataList1_penddingday" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataAlign="Right" HeaderAlign="Right" meta:resourcekey="DataList1_penddingdayResource1"></SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="X-Small" Font-Names="Arial" BorderStyle="NotSet" ForeColor="Black" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" GradientLevel="50" CssClass=""></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="Black" BorderStyle="NotSet" CssClass="NormalBold" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Gradient="Top" GradientBegin="Gray" GradientEnd="Gray" GradientLevel="36"></HeaderStyle>
					<SelectColumnStyle BorderStyle="NotSet" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" GradientBegin="Transparent" GradientEnd="Transparent" CssClass=""></SelectColumnStyle>
					<SelectStyle BorderStyle="NotSet" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Gradient="Top" GradientBegin="White" GradientEnd="White" CssClass=""></SelectStyle>
					<GridLine LineColor="CornflowerBlue" LineStyle="Dashed" LineMode="Horizontal"></GridLine>
					<HoverStyle BorderStyle="NotSet" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" CssClass=""></HoverStyle>
                <RowStyle BorderStyle="NotSet" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" CssClass="" />
				</SmoothEnterpriseWebControl:DATALIST></td>
		</tr>
	</table>
</asp:Content>
