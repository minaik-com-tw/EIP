<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" 
    CodeFile="MyMultiApproval.aspx.cs" Inherits="Smooth8000.HR.MyMultiApproval" Title="Untitled Page" Theme="Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
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
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
		<tr Class="NormalBold">
			<td style="height: 19px">
				<asp:Label ID="LABEL_approvestatus" runat="server" Text="審核狀態" meta:resourcekey="LABEL_approvestatusResource1" Visible="False"></asp:Label></td>
			<td style="height: 19px">
				<asp:Label ID="LABEL_pendingdays" runat="server" Text="待審天數" meta:resourcekey="LABEL_pendingdaysResource1" Visible="False"></asp:Label></td>
            <td style="width: 100px; height: 19px">
                &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="細明體" Font-Size="10pt"
                    meta:resourcekey="LABEL_1Resource1" Text="ERP單號"></asp:Label></td>
            <td style="width: 87px; height: 19px">
                &nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Names="細明體" Font-Size="10pt"
                    meta:resourcekey="LABEL_2Resource1" Text="廠區"></asp:Label></td>
            <td style="width: 87px; height: 19px">
                <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Names="細明體" Font-Size="10pt"
                    meta:resourcekey="LABEL_3Resource1" Text="廠商"></asp:Label></td>
            <td style="width: 92px; height: 19px">
                &nbsp;<asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Names="細明體" Font-Size="10pt"
                    meta:resourcekey="LABEL_4Resource1" Text="日期起"></asp:Label></td>
            <td style="width: 92px; height: 19px">
                &nbsp;<asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Names="細明體" Font-Size="10pt"
                    meta:resourcekey="LABEL_5Resource1" Text="日期迄"></asp:Label></td>
            <td style="width: 98px; height: 19px;">
                &nbsp;<asp:Label ID="Label1" runat="server" meta:resourcekey="LABEL_approvestatusResource1"
                    Text="流程類別" Font-Size="10pt" Font-Bold="False" Font-Names="細明體" Visible="False"></asp:Label></td>
		</tr>
		<tr>
			<td style="height: 26px">
				<SmoothEnterpriseWebControl:InputSelect id="QUERY_status" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
					ItemAllDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_statusResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="" Visible="False">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <Items>
                        <SmoothEnterpriseWebControl:SelectItem ID="SI_Pending" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                            Style="filter: ;" Text="Pending" Value="N" />
                    </Items>
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
			<td style="height: 26px;"><FONT face="新細明體">
					<SmoothEnterpriseWebControl:InputText id="QUERY_pendingday" runat="server" Width="80px" BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_pendingdayResource1" OnClickMore="" Personalize="False" Required="False" Visible="False"
						><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" />
                    </SmoothEnterpriseWebControl:inputtext></FONT></td>
            <td style="width: 100px; height: 26px">
                <SmoothEnterpriseWebControl:InputText id="QUERY_ERP_NO" runat="server" Width="100px" BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_pendingdayResource1" OnClickMore="" Personalize="True" Required="False"
						>
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 87px; height: 26px">
                <SmoothEnterpriseWebControl:InputText id="QUERY_PLANTID" runat="server" Width="100px" BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_pendingdayResource1" OnClickMore="" Personalize="True" Required="False"
						>
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 87px; height: 26px">
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_COM" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" Editable="False" EnabledHTC="True"
                    ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl=""
                    ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemAll-Value="%"
                    ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                    ItemNone-Text="" ListPosition="Vertical" Mode="Single" TextBoxStyle="ThreeDStyle"
                    Value="System.Data.SqlClient">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td style="width: 92px; height: 26px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_SDATE" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                    ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                    HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                    OnClickMore="" Personalize="True" Required="False" Width="110px">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 92px; height: 26px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_SDATE2" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                    ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                    HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                    OnClickMore="" Personalize="True" Required="False" Width="110px">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 98px; height: 26px">
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_text" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ItemAll-Value="%" Personalize="True" Visible="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <Items>
                        <SmoothEnterpriseWebControl:SelectItem ID="SelectItem4" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                            Style="filter: ;" Text="" />

                        <SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                            Style="filter: ;" Text="加班" Value="加班" />

                            
                    </Items>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
			<td style="height: 26px">
				<SmoothEnterpriseWebControl:InputButton id="QueryButton" runat="server" Width="80px" Font-Names="Arial" Font-Size="12px"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Font-Bold="True"
					RunAtCient="False" Text="查詢" meta:resourcekey="QueryButton2Resource1" OnClick="QueryButton_Click">
					<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
	<table border="0">
		<tr>
		    <td>
                <SmoothEnterpriseWebControl:InputButton id="BUTTON_approval" runat="server" Width="80px" Font-Names="Arial" Font-Size="12px"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Font-Bold="True"
					Text="多筆審核" meta:resourcekey="QueryButtonResource1" OnClick="BUTTON_approval_Click">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <asp:HiddenField ID="MultiApprovel_Count" runat="server" />
            </td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:DATALIST id="DataList1"  runat="server" BorderColor="#000000" Font-Size="12px" Font-Names="Arial" EnableCustom="False" CellPadding="3px" guid="" rows="10" gridlines="both" borderwidth="4px"
					borderstyle="Solid" NavigatorGradient="Left" HeaderGradient="Left" SelectedColor="224, 224, 224"
					SQL="select * from dgflowqueue where 1=0" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" Connected="False" ConnectionString="Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;User ID=sa;Initial Catalog=demo2000;Data Source=localhost" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="" RowNumber="True" EnableExport="False" EnablePrint="True" HeaderAlign="Middle" HeaderPos="Top" NavigatorPos="Bottom" RowAlign="Middle" HeaderHeight="32px">
					<Columns>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_multiapproval" runat="server"
                            Caption="多筆審核" DataStyle-BorderStyle="NotSet" DataType="UserDefined" Required="True"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_multiapprovalResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" Caption="審核" DataAlign="Center" Width="15px" ID="DataList1_approval" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_approvalResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="單號" Width="70px" Required="True" DataName="no"
							Sortable="True" ID="DataColumn2" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_noResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="日期" Width="70px" Required="True" DataName="oga02"
							Sortable="True" ID="DataColumn12" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_oga02Resource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="廠區" Required="True" DataName="plantid" Sortable="True"
							ID="DataColumn1" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_plantidResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="目的廠區" DataName="l_azp03" Sortable="True" ID="DataList1_flownode" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_l_azp03Resource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="ERP單號" Required="True" DataName="oga01" Sortable="True"
							ID="DataList1_flowinitdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_oga01Resource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="客戶" Required="True" DataName="occ02_1" Sortable="True"
													ID="DataList1_flowreceivedate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_occ02_1Resource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="部門" Required="True" DataName="gem02_3" Visible="False" Sortable="True"
													ID="DataColumn4" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_gem02_3Resource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>

						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="人員" Width="50px" Required="True" DataName="gen02_4"  Sortable="True"
													ID="DataColumn3" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_gen02_4Resource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"   Caption="原幣出貨$" Width="80px" DataName="oga50"  ID="DataColumn6" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_oga50Resource1" runat="server" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"   Caption="信用額度" Width="55px" DataName="tot"  ID="DataColumn7" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_totResource1" runat="server" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"   Caption="信用餘額" Width="55px" DataName="bal"  ID="bal" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_balResource1" runat="server" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="&lt;30天逾期" Width="58px" DataName="l_amt01"  ID="l_amt01" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_l_amt01Resource1" runat="server" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="&gt;30天逾期" Width="58px" DataName="l_amt02"  ID="DataColumn13" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_l_amt02Resource1" runat="server" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="未30天逾期" Width="58px" DataName="l_amt03"  ID="DataColumn5" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_l_amt03Resource1" runat="server" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined"  Caption="申請人超限原因" Width="70px" DataName="Reason_user"  ID="DataColumn8" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_Reason_userResource1" runat="server" DataStyle-Font-Size="XX-Small" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined"  Caption="申請人改善方案" Width="70px" DataName="Improve_user"  ID="DataColumn9" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_Improve_userResource1" runat="server" DataStyle-Font-Size="XX-Small" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined"  Caption="多角業務超限原因" Width="70px" DataName="Reason_salse"  ID="DataColumn10" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_Reason_salseResource1" runat="server" DataStyle-Font-Size="XX-Small" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined"  Caption="多角業務改善方案" Width="70px" DataName="Improve_salse"  ID="DataColumn11" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_Improve_salseResource1" runat="server" DataStyle-Font-Size="XX-Small" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="附件" DataAlign="Center" Width="70px" ID="DataList1_pro" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_proResource1" runat="server" DataStyle-Font-Size="XX-Small"></SmoothEnterpriseWebControl:DataColumn>

						<SmoothEnterpriseWebControl:DataColumn ID="DataList1_remark" DataType="ViewText" Caption="備註" DataName="remark" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>

						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="審核結果" DataName="reviewresult" Sortable="True"
							ID="DataList1_reviewresult" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_reviewresultResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="審核人" DataName="reviewername" Sortable="True" ID="DataList1_reviewname" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_reviewnameResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="最後修改人員" DataName="modifyuid" Sortable="True"
							ID="DataList1_modifyname" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_modifynameResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="最近修改日期" DataName="modifydate" Sortable="True"
							ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_modifydateResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="UserDefined" ID="DataList1_popupflowview" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_popupflowviewResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
							<Template>
								<asp:Image id="IB_popupflowview" runat="server" ImageUrl="/lib/img/icon-zoom.gif" meta:resourcekey="IB_popupflowviewResource1"></asp:Image>
							</Template>
						</SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
						BorderColor="Black" BackColor="Black" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Gradient="Left" GradientBegin="WhiteSmoke" GradientLevel="150" GradientEnd="White"></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></HeaderStyle>
					<SelectColumnStyle BorderStyle="NotSet" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" BackColor="Black"></SelectColumnStyle>
					<SelectStyle BackColor="192, 192, 255" BorderStyle="NotSet" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Gradient="Top" GradientLevel="150"></SelectStyle>
					<GridLine LineColor="184, 192, 234" LineStyle="Solid" LineWidth="1px"></GridLine>
					<HoverStyle BorderStyle="NotSet" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Gradient="Top" GradientBegin="Orange" GradientEnd="Yellow" GradientLevel="100"></HoverStyle>
                    <RowStyle BorderStyle="NotSet" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
			    </SmoothEnterpriseWebControl:DATALIST>
		    </td>
		</tr>
	</table>
</asp:Content>
