<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="MultiApproval250.aspx.cs" Inherits="Shipping.MultiApproval" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
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
    <head>
<%--    <script type="text/javascript" src="js/jquery.min.js"></script>--%>
    <script language="javascript" type="text/javascript">
        function check(){
            if((document.getElementById("<%=this.QUERY_occaud15S.ClientID %>").value.length != 0 && document.getElementById("<%=this.QUERY_occaud15E.ClientID %>").value.length == 0 ) || 
               (document.getElementById("<%=this.QUERY_occaud15S.ClientID %>").value.length == 0 && document.getElementById("<%=this.QUERY_occaud15E.ClientID %>").value.length != 0 ) )
//            if(($("#<%=this.QUERY_occaud15S.ClientID %>").val().length != 0 && $("#<%=this.QUERY_occaud15E.ClientID %>").val().length == 0) ||
//               ($("#<%=this.QUERY_occaud15S.ClientID %>").val().length == 0 && $("#<%=this.QUERY_occaud15E.ClientID %>").val().length != 0) 
//            )
            {
                alert("必須填入日期起迄");
                return false;
            }
            var start = new Date(document.getElementById("<%=this.QUERY_occaud15S.ClientID %>").value);
            var end = new Date(document.getElementById("<%=this.QUERY_occaud15E.ClientID %>").value);
//            var start = new Date($("#<%=this.QUERY_occaud15S.ClientID %>").val());
//            var end = new Date($("#<%=this.QUERY_occaud15E.ClientID %>").val())
            if( start > end)
            {
                alert("結束日期必須大於起始日期");
                return false;
            }
            return true;
        }
    </script>        
    </head>
    <br />
	<table border="0" width="100%">
		<tr>
			<td style="height: 321px">
                <table border="0">
	                <tr Class="NormalBold">
	                    <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label1" runat="server" Text="申請類別"></asp:Label></td>
	                    <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label2" runat="server" Text="申請單號"></asp:Label></td>
	                    <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label7" runat="server" Text="客戶編號"></asp:Label></td>
	                    <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label4" runat="server" Text="客戶簡稱"></asp:Label></td>
	                    <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label5" runat="server" Text="申請日期(起)"></asp:Label></td>
	                    <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label3" runat="server" Text="申請日期(迄)"></asp:Label></td>
	                    <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label6" runat="server" Text="申請人員"></asp:Label></td>
	                    <td rowspan="2">
                            
	                        <%--<SmoothEnterpriseWebControl:InputButton id="BUTTON_add" runat="server" Text="新增" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_add_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>--%>
                            <SmoothEnterpriseWebControl:InputButton id="BUTTON_query" OnClientClick="return check()" runat="server" Text="搜尋" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
                            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_approval" runat="server" BackColor="#C8C8C8"
                                BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                                Font-Bold="True" Font-Names="Arial" Font-Size="12px" meta:resourcekey="QueryButtonResource1"
                                OnClick="BUTTON_approval_Click" Text="多筆審核" Width="80px">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>                            
	                    </td>        
	                </tr>
	                <tr>
	                    <td>
                            <asp:DropDownList ID="QUERY_occa00" runat="server">
                            </asp:DropDownList></td>
	                    <td><asp:TextBox ID="QUERY_occano" runat="server" Width="100px"></asp:TextBox></td>
                        <td><asp:TextBox ID="QUERY_occa01" runat="server" Width="100px"></asp:TextBox></td>
                        <td><asp:TextBox ID="QUERY_occa02" runat="server" Width="100px"></asp:TextBox></td>
                        <td><SmoothEnterpriseWebControl:InputText ID="QUERY_occaud15S" runat="server" FormatType="Date"
                            BackColor="#F0F0F0" CssClass="Normal">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText></td>
                        
                        <td><SmoothEnterpriseWebControl:InputText ID="QUERY_occaud15E" runat="server" FormatType="Date"
                            BackColor="#F0F0F0" CssClass="Normal">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText></td>
                        <td><SmoothEnterpriseWebControlEnterprise:PopupUser ID="QUERY_occauser" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                Gradient-GradientType="Top" ValueField="id">
                            </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                        <td style="width: 214px">

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
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_multiapproval" runat="server" DataStyle-BorderStyle="NotSet" DataType="UserDefined" HeaderStyle-BorderStyle="NotSet"></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" Caption="審核" DataAlign="Center" Width="15px" ID="DataList1_approval" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_approvalResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_occa00" DataType="ViewText" Caption="申請類別" DataName="APPTYPE"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_occano" DataType="ViewText" Caption="申請單號" DataName="occano"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_occa01" DataType="ViewText" Caption="客戶編號" DataName="occa01"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn1" DataType="ViewText" Caption="客戶簡稱" DataName="occa02"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn2" DataType="ViewText" Caption="申請日期" DataName="occaud15"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn3" DataType="ViewText" Caption="申請人員" DataName="name"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<%--<SmoothEnterpriseWebControl:DataColumn ID="DataColumn4" DataType="ViewText" Caption="部門" DataName="dept_nm"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>--%>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn5" DataType="ViewText" Caption="收款條件" DataName="oag02_6"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<%--<SmoothEnterpriseWebControl:DataColumn ID="DataColumn6" DataType="ViewText" Caption="收款幣別" DataName="Currency"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>--%>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn7" DataType="ViewText" Caption="信用額度" DataName="occa63"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn8" DataType="ViewText" Caption="異動原因" DataName="occanote"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn9" DataType="ViewText" Caption="待審人員" DataName="REVIEWNAME"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_IsStatus" DataType="UserDefined" Caption="單據狀態" DataName="IsStatus"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>					    
<%--						  <SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcsn" DataType="ViewText" Caption="EIP單號" DataName="pmcsn"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcaud15" DataType="ViewText" Caption="日期" DataName="pmcaud15"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca00" DataType="ViewText" Caption="類別" DataName="pmca00"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcano" DataType="ViewText" Caption="ERP單號" DataName="pmcano"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca01" DataType="ViewText" Caption="供應廠商編號" DataName="pmca01"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca03" DataType="ViewText" Caption="簡稱" DataName="pmca03"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca17" DataType="ViewText" Caption="付款方式" DataName="pmca17"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca22" DataType="ViewText" Caption="採購幣別" DataName="pmca22"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcauser" DataType="ViewText" Caption="申請人" DataName="name"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcagrup" DataType="ViewText" Caption="申請人部門" DataName="gem02_6"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcamodu" DataType="ViewText" Caption="Pmcamodu" DataName="pmcamodu" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcadate" DataType="ViewText" Caption="Pmcadate" DataName="pmcadate" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn1" runat="server" Caption="申請原因類別"
                            DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn2" runat="server" Caption="說明"
                            DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn3" runat="server" Caption="修改是否有差異"
                            DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet">
                        </SmoothEnterpriseWebControl:DataColumn>--%>
					

					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
					<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
					<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet" CssClass=""></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
					<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
                    <RowStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:DataList>
			</td>
		</tr>
	</table>
</asp:Content>