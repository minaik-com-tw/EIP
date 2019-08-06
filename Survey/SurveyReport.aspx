<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Survey.SurveyReport, App_Web_surveyreport.aspx.cdcab7d2" title="WebForm View Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
		<tr>
			<td vAlign="top">
				<table>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_surveyname" runat="server" Text="名稱" meta:resourcekey="LABEL_surveynameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:inputtext id="FIELD_nocode" runat="server" Width="392px" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nocodeResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
				<table>
					<tr>
						<td><SmoothEnterpriseWebControl:CHECKBOXLIST id="CheckBoxList_type" runat="server" CheckMode="SingleRadio" cssClass="Normal" meta:resourcekey="CheckBoxList_typeResource1" Value="" Width="300px">
								<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
									Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
								<Items>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="問卷問題平均值" Description="" Value="avg" GroupText="" meta:resourcekey="CheckBoxListItem1_typeResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="問卷問題選項佔百分比(數值)" Description="" Value="percent_val" GroupText="" meta:resourcekey="CheckBoxListItem2_typeResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="問卷問題選項佔百分比(圖型)" Description="" Value="percent_chart" GroupText="" meta:resourcekey="CheckBoxListItem3_typeResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="開放式問題" Description="" Value="comment" GroupText="" meta:resourcekey="CheckBoxListItem4_typeResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
								</Items>
                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:CHECKBOXLIST></td>
					</tr>
					<tr>
					    <td class=normalbold>
                            <asp:Label ID="LABEL_dateinterval" runat="server" meta:resourcekey="LABEL_dateintervalResource1"
                                Text="調查區間"></asp:Label></td>
					</tr>
					<tr>
					    <td>
                            <SmoothEnterpriseWebControl:DateRange ID="FIELD_dateinterval" runat="server" CssClass="Normal"
                                RangeType="None">
                                <StartDate Text="" />
                                <EndDate Text="" />
                            </SmoothEnterpriseWebControl:DateRange>
                        </td>
					</tr>
					<tr>
						<td><asp:literal id="LITERAL_commentchoice" runat="server" meta:resourcekey="LITERAL_commentchoiceResource1"></asp:literal></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td vAlign="top"><span id="block_summery" runat="server" Visible="false">
					<table>
						<tr>
							<td Class="Normal" id="Td2" runat="server"><asp:literal id="LITERAL_report1" runat="server" meta:resourcekey="LITERAL_report1Resource1"></asp:literal></td>
						</tr>
					</table>
					<table>
						<tr>
							<td Class="Normal" id="Td3" runat="server"><asp:literal id="LITERAL_report2" runat="server" meta:resourcekey="LITERAL_report2Resource1"></asp:literal></td>
						</tr>
					</table>
					<table>
						<tr>
							<td Class="Normal"><asp:literal id="LITERAL_report3" runat="server" meta:resourcekey="LITERAL_report3Resource1"></asp:literal></td>
						</tr>
					</table>
				</span><span id="block_chart" runat="server" Visible="false">
					<table>
						<tr>
							<td Class="Normal" id="Td1" runat="server"><asp:literal id="LITERAL_chart1" runat="server" meta:resourcekey="LITERAL_chart1Resource1"></asp:literal></td>
						</tr>
					</table>
				</span><span id="block_comment" runat="server" Visible="false">
					<table>
						<tr>
							<td Class="Normal" id="Td4" runat="server"><asp:literal id="LITERAL_comment" runat="server" meta:resourcekey="LITERAL_commentResource1"></asp:literal></td>
						</tr>
					</table>
				</span>
			</td>
		</tr>
	</table>
	<table Class="Normal" border="0">
		<tr>
			<td><FONT face="新細明體"></FONT></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="NextButton" runat="server" Width="80px" Font-Names="Arial" Font-Size="12px"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Text="下一步"
					Font-Bold="True" OnClick="NextButton_Click" meta:resourcekey="NextButtonResource1" RunAtCient="False">
					<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton><FONT face="新細明體">&nbsp;</FONT><SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Text="回上頁" Font-Bold="True" Gradient-GradientType="Bottom" width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
	<!--
<script language="javascript">
function check_all(rscounter)
{
	if (document.all('checkall').checked==false)
	{
		for (i=0;i<rscounter;i++)
		{
			document.all('chk_'+i).checked=false;					
		}
	}	
	else
	{
		for (i=0;i<rscounter;i++)
		{
			document.all('chk_'+i).checked=true;					
		}
	}    
}
</script>
-->
</asp:Content>

