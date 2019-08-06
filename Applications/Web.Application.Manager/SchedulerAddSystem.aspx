<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.SchedulerAddSystem, App_Web_scheduleraddsystem.aspx.cdcab7d2" title="WebForm Add Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
			<TD height="1" vAlign="top">
				<table Class="Normal" border="0" width="100%">
					<TR Class="NormalBold">
						<TD>
							<asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:inputtext id="FIELD_name" runat="server" BackColor="#F0F0F0" Width="250px" CssClass="Normal"
								 Required="True" ErrorMessage="請輸入「名稱」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR Class="NormalBold">
						<TD>
							<asp:Label ID="LABEL_jobtype" runat="server" Text="程序類別" meta:resourcekey="LABEL_jobtypeResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_jobtype" runat="server" backcolor="White" cssClass="Normal" Required="True"
								ErrorMessage="請指定「工作類別」!!" CodeType="jobtype" TextField="name" ValueField="id" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_jobtypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode></TD>
					</TR>
					<TR Class="NormalBold">
						<TD>
							<asp:Label ID="LABEL_jobinterval" runat="server" Text="循環間隔" meta:resourcekey="LABEL_jobintervalResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:inputtext id="FIELD_jobinterval" runat="server" BackColor="#F0F0F0" Width="64px" CssClass="Normal"
								 Required="True" ErrorMessage="請輸入「循環間隔」!!" FormatType="Number" Text="1" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_jobintervalResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR Class="NormalBold">
						<TD height="22" width="100%">
							<asp:Label ID="LABEL_initrun" runat="server" Text="啟用時間" meta:resourcekey="LABEL_initrunResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:InputText id="FIELD_initrun" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
								FormatType="DateTime" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_initrunResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR Class="NormalBold">
						<TD>
							<asp:Label ID="LABEL_endrun" runat="server" Text="結束時間" meta:resourcekey="LABEL_endrunResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:InputText id="FIELD_endrun" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
								FormatType="DateTime" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_endrunResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR Class="NormalBold">
						<TD>
							<asp:Label ID="LABEL_jobstatus" runat="server" Text="程序狀態" meta:resourcekey="LABEL_jobstatusResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_jobstatus" runat="server" backcolor="White" cssClass="Normal" CodeType="jobstatus"
								TextField="name" ValueField="id" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_jobstatusResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode></TD>
					</TR>
					<TR Class="NormalBold">
						<TD>
						    <asp:Label ID="LABEL_addlog" runat="server" Text="啟用紀錄" meta:resourcekey="LABEL_addlogResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:CheckBoxList id="FIELD_addlog" runat="server" cssClass="Normal" meta:resourcekey="FIELD_addlogResource1" Value="" Width="300px">
								<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
									Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
							
								<Items>
									<SmoothEnterpriseWebControl:CheckBoxListItem Text="是" Selected="False" Value="Y" GroupText="" Description=""></SmoothEnterpriseWebControl:CheckBoxListItem>
								</Items>
                                <DescriptionStyle BorderStyle="NotSet" CssClass="" />
								
							</SmoothEnterpriseWebControl:CheckBoxList>
						</TD>
					</TR>
					<TR Class="NormalBold">
						<TD>
							<asp:Label ID="LABEL_description" runat="server" Text="描述" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:inputtext id="FIELD_remark" runat="server" BackColor="#F0F0F0" Width="250px" CssClass="Normal"
								 TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
				</table>
			</TD>
			<TD height="1" width="1"><span style="BORDER-RIGHT: 1px inset; BORDER-TOP: 1px inset; FONT-SIZE: 16px; MARGIN: 0px 3px; BORDER-LEFT: 1px inset; WIDTH: 1px; BORDER-BOTTOM: 1px inset; HEIGHT: 100%"
					clear="all"></span></TD>
			<td height="1" vAlign="top">
				<SmoothEnterpriseWebControl:InputText id="FIELD_assembly" runat="server"  backcolor="#F0F0F0"
					cssClass="Normal" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_assemblyResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				<SmoothEnterpriseWebControl:InputText id="FIELD_typename" runat="server"  backcolor="#F0F0F0"
					cssClass="Normal" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_typenameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				<SmoothEnterpriseWebControl:InputText id="FIELD_typename_name" runat="server"  backcolor="#F0F0F0"
					cssClass="Normal" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_typename_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				<TABLE id="Table1" cellSpacing="2" cellPadding="0" width="100%" border="0" runat="server">
					<TR>
						<TD></TD>
					</TR>
				</TABLE>
			</td>
		</tr>
		<TR>
			<TD colSpan="3" height="1" vAlign="top">
				<SmoothEnterpriseWebControl:inputbutton id="SaveButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="儲存" Font-Bold="True" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="SaveNextButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Text="儲存後繼續操作" Font-Bold="True" OnClick="SaveNextButton_Click" meta:resourcekey="SaveNextButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" width="80px" Text="回上頁" Font-Bold="True" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
					</SmoothEnterpriseWebControl:inputbutton></TD>
		</TR>
	</table>

</asp:Content>
