<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.SchedulerDelete, App_Web_schedulerdelete.aspx.cdcab7d2" title="WebForm Delete Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor> 
	<table Class="Normal" border="0">
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_name" runat="server" name="FIELD_name"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_assembly" runat="server" Text="程式檔" meta:resourcekey="LABEL_assemblyResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_assembly" runat="server" name="FIELD_assembly"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_typename" runat="server" Text="程式名稱" meta:resourcekey="LABEL_typenameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_typename" runat="server" name="FIELD_typename"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_jobtype" runat="server" Text="工作類別" meta:resourcekey="LABEL_jobtypeResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_jobtype" runat="server" name="FIELD_jobtype"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_jobinterval" runat="server" Text="循環間隔" meta:resourcekey="LABEL_jobintervalResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_jobinterval" runat="server" name="FIELD_jobinterval"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_loadtime" runat="server" Text="最近載入時間" meta:resourcekey="LABEL_loadtimeResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_loadtime" runat="server" name="FIELD_loadtime"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_initrun" runat="server" Text="啟用時間" meta:resourcekey="LABEL_initrunResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_initrun" runat="server" name="FIELD_initrun"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_lastrun" runat="server" Text="最近執行時間" meta:resourcekey="LABEL_lastrunResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_lastrun" runat="server" name="FIELD_lastrun"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_endrun" runat="server" Text="結束時間" meta:resourcekey="LABEL_endrunResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_endrun" runat="server" name="FIELD_endrun"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_jobstatus" runat="server" Text="工作狀態" meta:resourcekey="LABEL_jobstatusResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_jobstatus" runat="server" name="FIELD_jobstatus"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_description" runat="server" Text="描述" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_remark" runat="server" name="FIELD_remark"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_initname" runat="server" Text="建立人員" meta:resourcekey="LABEL_initnameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_inituid" runat="server" name="FIELD_inituid"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_initdate" runat="server" Text="建立時間" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_initdate" runat="server" name="FIELD_initdate"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_modifyname" runat="server" Text="更新人員" meta:resourcekey="LABEL_modifynameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_modifyuid" runat="server" name="FIELD_modifyuid"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_modifydate" runat="server" Text="更新時間" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_modifydate" runat="server" name="FIELD_modifydate"></span></td>
		</tr>
		<tr>
			<td>
				<TABLE id="Table1" cellSpacing="0" cellPadding="0" border="0">
					<TR>
						<TD><SmoothEnterpriseWebControl:PAGEJUMPER id="PageJumper1" runat="server" ShowPageNumber="False" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
								<PAGESELECTEDSTYLE BorderColor="Black" BorderWidth="3px" BorderStyle="Solid" BackColor="Silver" CssClass=""></PAGESELECTEDSTYLE>
								<PAGENUMBERSTYLE ForeColor="Black" Width="18px" Font-Names="Arial" Font-Size="10px" BorderColor="Black"
									BorderWidth="1px" BorderStyle="Solid" PaddingSize="4px" CssClass=""></PAGENUMBERSTYLE>
                            <ButtonStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:PAGEJUMPER></TD>
						<TD><SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
								BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" width="80px" Text="刪除" Font-Bold="True"
								Gradient-GradientType="Bottom" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
						<TD>&nbsp;
							<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
								BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" width="80px" Text="取消" Font-Bold="True"
								Gradient-GradientType="Bottom" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
					</TR>
				</TABLE>
			</td>
		</tr>
	</table>
</asp:Content>