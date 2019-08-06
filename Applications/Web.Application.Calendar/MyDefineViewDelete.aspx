<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyDefineViewDelete, App_Web_mydefineviewdelete.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<TABLE Class="Normal" id="Table2" border="0">
		<TR>
			<TD vAlign="top">
				<TABLE id="Table3">
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_defineview" runat="server" Text="自訂檢視名稱" meta:resourcekey="LABEL_defineviewResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:InputText id="Input_name" runat="server"  BackColor="#F0F0F0" CssClass="PanelWhite"
								Width="240px" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" id="TD_seq" runat="server"><FONT face="新細明體"><asp:Label ID="LABEL_initdate" runat="server" Text="建立日期" meta:resourcekey="LABEL_initdateResource1"></asp:Label>
								<SmoothEnterpriseWebControl:InputText id="Input_ID" runat="server"  BackColor="#F0F0F0" CssClass="Normal"
									Visible="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_IDResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:inputtext></FONT></TD>
					</TR>
					<TR>
						<TD><FONT face="新細明體">
								<SmoothEnterpriseWebControl:InputText id="Input_initdate" runat="server"  BackColor="#F0F0F0"
									CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_initdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:inputtext></FONT></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</TABLE>
	<TABLE Class="Normal" id="Table1" style="border="0">
		<TR>
			<TD>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_delete" runat="server" BackColor="#C8C8C8" Width="80px" cssClass="NormalBold"
					BorderColor="#606060" Font-Bold="True" Text="刪除" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
					<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_cancel" runat="server" BackColor="#C8C8C8" Width="80px" cssClass="NormalBold"
					BorderColor="#606060" Font-Bold="True" Text="取消" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" OnClick="BUTTON_cancel_Click" meta:resourcekey="BUTTON_cancelResource1" RunAtCient="False">
					<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton>
			</TD>
		</TR>
	</TABLE>
</asp:Content>
