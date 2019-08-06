<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="MultiApproval.aspx.cs" Inherits="Shipping.MultiApproval" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
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
	<table border="0">
	    <tr Class="NormalBold">
	        <td style="height: 18px">���A</td>
	        <td style="height: 18px">�t��</td>
	        <td style="height: 18px">�X�q�渹</td>
	        <td style="height: 18px">�X�f�渹</td>
	        <td style="height: 18px">�o�����X</td>
	        <td style="height: 18px">�������</td>
	        <td style="height: 18px">�t�ӥN�X</td>
	        <td style="height: 18px">���f�渹</td>
	        <td style="height: 18px">�w�p�}���</td>
	        <td style="height: 18px">��ڶ}���</td>
	        <td style="height: 18px">�w�p����</td>
	        <td style="height: 18px">��ڨ���</td>
	        <td style="height: 18px">��ڨ�f��(�ȤH)</td>
	        <td>&nbsp;</td>
	    </tr>
	    <tr>   	
	        <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="X">������</asp:ListItem>
                    <asp:ListItem Value="Complete">(�����f��)���\</asp:ListItem>
                    <asp:ListItem Value="Terminate">(�����f��)�h�^</asp:ListItem>
                    <asp:ListItem Value="isSend">�e�f��</asp:ListItem>
                    <asp:ListItem Value="waiting">���e�f</asp:ListItem>
                </asp:DropDownList></td>    
	        <td><asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox></td>
	        <td><asp:TextBox ID="TextBox2" runat="server" Width="100px"></asp:TextBox></td>
	        <td><asp:TextBox ID="TextBox3" runat="server" Width="100px"></asp:TextBox></td>
	        <td><asp:TextBox ID="TextBox7" runat="server" Width="100px"></asp:TextBox></td>
	        <td><asp:TextBox ID="TextBox4" runat="server" Width="100px"></asp:TextBox></td>
	        <td><asp:TextBox ID="TextBox5" runat="server" Width="100px"></asp:TextBox></td>
	        <td><asp:TextBox ID="TextBox6" runat="server" Width="100px"></asp:TextBox></td>
	        <td><SmoothEnterpriseWebControl:InputText id="InputText0" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uATD�v!!" MaxLength="0"  FormatType="Date" Width="90px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>

	        <td><SmoothEnterpriseWebControl:InputText id="InputText1" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uATD�v!!" MaxLength="0"  FormatType="Date" Width="90px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>

	        <td><SmoothEnterpriseWebControl:InputText id="InputText2" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uATD�v!!" MaxLength="0"  FormatType="Date" Width="90px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>
                           
	        <td><SmoothEnterpriseWebControl:InputText id="InputText3" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uATD�v!!" MaxLength="0"  FormatType="Date" Width="90px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>
                           
	        <td><SmoothEnterpriseWebControl:InputText id="InputText4" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uATD�v!!" MaxLength="0"  FormatType="Date" Width="90px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>
                         
            <td><asp:Button ID="Search" runat="server" Text=" �j    �M " OnClick="Search_Click" /></td>                                                                          	        
	    </tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td style="height: 321px">
                <table border="0">
                    <tr>
                        <td style="width: 214px">
                            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_approval" runat="server" BackColor="#C8C8C8"
                                BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                                Font-Bold="True" Font-Names="Arial" Font-Size="12px" meta:resourcekey="QueryButtonResource1"
                                OnClick="BUTTON_approval_Click" Text="�h���f��" Width="80px">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>
                            <asp:HiddenField ID="MultiApprovel_Count" runat="server" />
                        </td>
                    </tr>
                </table>
                <br />
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle" 
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					ConnectionType="Custom"  SQL="SELECT * FROM Forwarder" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
					<Columns>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_multiapproval" runat="server" DataStyle-BorderStyle="NotSet" DataType="UserDefined" HeaderStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>					
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_Send" runat="server" DataAlign="Center" Caption="�W��" DataStyle-BorderStyle="NotSet" DataType="UserDefined" HeaderStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					    
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_PKey" DataType="ViewText" Caption="PKey" DataName="PKey" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ID" DataType="ViewText" Caption="ID" DataName="ID" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_FileName" DataType="ViewText" Caption="FileName" DataName="FileName" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn_IsStatus" runat="server" DataStyle-BorderStyle="NotSet" DataType="UserDefined" Sortable="True" HeaderStyle-BorderStyle="NotSet" Caption="���A" DataAlign="Center" HeaderAlign="Center" Width="60px" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_PlantID" DataType="ViewText" Caption="�t��" DataName="PlantID"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ProgramID" DataType="ViewText" Caption="�{���N�X" DataName="ProgramID"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_ERP_Key" runat="server" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet" Caption="�X�q�渹" DataName="ERP_Key" Sortable="True" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_ERP_Key2" runat="server" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet" Caption="�X�f�渹" DataName="ERP_Key2" Sortable="True" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_INV_Num" DataType="ViewText" Caption="�o���s��" DataName="INV_Num"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_Cdate" DataType="ViewText" Caption="�o���}�ߤ��" DataName="Cdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_SHIP_To" DataType="ViewText" Caption="�e�f�a�}" DataName="SHIP_To"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Width="250px" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_SHIPPING_No" DataType="ViewText" Caption="�������" DataName="SHIPPING_No"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_SHIPPING_Dec" DataType="ViewText" Caption="�������" DataName="SHIPPING_Dec"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_SHIPPING_Mode" DataType="ViewText" Caption="��B�覡" DataName="SHIPPING_Mode"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_SHIPPING_ModeDec" DataType="ViewText" Caption="��B�覡�y�z" DataName="SHIPPING_ModeDec"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_FORWARDER_Num" DataType="ViewText" Caption="�t�ӥN��" DataName="FORWARDER_Num"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_FORWARDER_Dec" DataType="ViewText" Caption="�t�Ӵy�z" DataName="FORWARDER_Dec"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_HawbNo" DataType="ViewText" Caption="���f�渹" DataName="HawbNo"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_FitNo" DataType="ViewText" Caption="�Z��/�覸" DataName="FitNo"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ETD" DataType="ViewText" Caption="�w�p�}���" DataName="ETD"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ATD" DataType="ViewText" Caption="��ڶ}���" DataName="ATD"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ETA" DataType="ViewText" Caption="�w�p����" DataName="ETA"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ATAAS" DataType="ViewText" Caption="��ڨ���" DataName="ATAAS"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ATAC" DataType="ViewText" Caption="��ڨ�f��(�ȤH)" DataName="ATAC"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_Udate" DataType="ViewText" Caption="Udate" DataName="Udate" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit2" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Width="1%" DataAlign="Center" DataType="IconView" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_Send2" runat="server" DataAlign="Center" Caption="�W��" DataStyle-BorderStyle="NotSet" DataType="UserDefined" HeaderStyle-BorderStyle="NotSet">
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
	<table border="0">
	    <tr>
	        <td>
	            <SmoothEnterpriseWebControl:InputButton id="BUTTON_delete" runat="server" Text="�R��" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_delete_Click" Visible="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
	        </td>
	    </tr>
	</table>
</asp:Content>