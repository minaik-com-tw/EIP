<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="MultiApproval610.aspx.cs" Inherits="Shipping.MultiApproval" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Forwarder List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <br />
	<table border="0" width="100%">
		<tr>
			<td style="height: 321px">
                <table border="0" style="width: 479px; height: 62px">
                    <tr>
                        <td style="width: 104px; height: 34px">
                            <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="類別"></asp:Label></td>
                        <td style="width: 109px; height: 34px">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="NormalBold">
                                <asp:ListItem Value="ALL">全選</asp:ListItem>
                                <asp:ListItem>I:新增</asp:ListItem>
                                <asp:ListItem>U:修改</asp:ListItem>
                                <asp:ListItem>V:生效否</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 131px; height: 34px">
                            <SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" BackColor="#C8C8C8"
                                BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                                Font-Bold="True" Font-Names="Arial" Font-Size="12px" meta:resourcekey="QueryButtonResource1" Text="查詢" Width="80px" OnClick="InputButton1_Click">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton></td>
                        <td style="width: 251px; height: 34px">
                            &nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_approval" runat="server" BackColor="#C8C8C8"
                                BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                                Font-Bold="True" Font-Names="Arial" Font-Size="12px" meta:resourcekey="QueryButtonResource1"
                                OnClick="BUTTON_approval_Click" Text="多筆審核" Width="80px">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>
                            <asp:HiddenField ID="MultiApprovel_Count" runat="server" />
                        </td>
                    </tr>
                </table>
               
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle" 
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					ConnectionType="Custom"  SQL="SELECT * FROM Forwarder" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
					<Columns>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_multiapproval" runat="server" DataStyle-BorderStyle="NotSet" DataType="UserDefined" HeaderStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>					
                        
 	 	 	 	 	 	  
					    <SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" Caption="審核" DataAlign="Center" Width="15px" ID="DataList1_approval" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_approvalResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						  <SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcsn" DataType="ViewText" Caption="EIP單號" DataName="pmcsn"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcaud15" DataType="ViewText" Caption="日期" DataName="pmcaud15"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca00" DataType="ViewText" Caption="類別" DataName="pmca00"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcano" DataType="ViewText" Caption="ERP單號" DataName="pmcano"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca01" DataType="ViewText" Caption="供應廠商編號" DataName="pmca01"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca03" DataType="ViewText" Caption="簡稱" DataName="pmca03"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca17" DataType="ViewText" Caption="付款方式" DataName="pmca17"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca22" DataType="ViewText" Caption="採購幣別" DataName="pmca22"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcauser" DataType="ViewText" Caption="申請人" DataName="name"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcagrup" DataType="ViewText" Caption="申請人部門" DataName="gem02_6"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcamodu" DataType="ViewText" Caption="Pmcamodu" DataName="pmcamodu" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcadate" DataType="ViewText" Caption="Pmcadate" DataName="pmcadate" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn1" runat="server" Caption="申請原因類別"
                            DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn2" runat="server" Caption="說明"
                            DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet" DataName="RRDesc1" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn3" runat="server" Caption="差異否"
                            DataStyle-BorderStyle="NotSet" DataType="UserDefined" HeaderStyle-BorderStyle="NotSet" DataName="Datadiff" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
					

					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet"></HeaderStyle>
					<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet"></SelectColumnStyle>
					<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet"></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
					<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet"></HoverStyle>
                    <RowStyle BorderStyle="NotSet" />
				</SmoothEnterpriseWebControl:DataList>
			</td>
		</tr>
	</table>
</asp:Content>