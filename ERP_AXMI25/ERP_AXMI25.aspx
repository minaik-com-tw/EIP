<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ERP_AXMI25.aspx.cs" Inherits="CNE.CNE" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
        Caption="CNE List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <%--<script type="text/javascript" src="js/jquery.min.js"></script>--%>
    <script language="javascript" type="text/javascript">
        function check() {
            if ((document.getElementById("<%=this.QUERY_occaud15S.ClientID %>").value.length != 0 && document.getElementById("<%=this.QUERY_occaud15E.ClientID %>").value.length == 0) ||
                (document.getElementById("<%=this.QUERY_occaud15S.ClientID %>").value.length == 0 && document.getElementById("<%=this.QUERY_occaud15E.ClientID %>").value.length != 0))
//            if(($("#<%=this.QUERY_occaud15S.ClientID %>").val().length != 0 && $("#<%=this.QUERY_occaud15E.ClientID %>").val().length == 0) ||
//               ($("#<%=this.QUERY_occaud15S.ClientID %>").val().length == 0 && $("#<%=this.QUERY_occaud15E.ClientID %>").val().length != 0) 
            //            )
            {
                alert("������J����_��");
                return false;
            }
            var start = new Date(document.getElementById("<%=this.QUERY_occaud15S.ClientID %>").value);
            var end = new Date(document.getElementById("<%=this.QUERY_occaud15E.ClientID %>").value);
//            var start = new Date($("#<%=this.QUERY_occaud15S.ClientID %>").val());
//            var end = new Date($("#<%=this.QUERY_occaud15E.ClientID %>").val())
            if (start > end) {
                alert("������������j��_�l���");
                return false;
            }
            return true;
        }
    </script>
    <table border="0">
        <tr class="NormalBold">
            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label1" runat="server" Text="�ӽ����O"></asp:Label></td>
            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label9" runat="server" Text="�t�O"></asp:Label></td>
            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label2" runat="server" Text="�ӽг渹"></asp:Label></td>
            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label7" runat="server" Text="�Ȥ�s��"></asp:Label></td>
            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label4" runat="server" Text="�Ȥ�²��"></asp:Label></td>
            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label5" runat="server" Text="�ӽФ��(�_)"></asp:Label></td>
            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label3" runat="server" Text="�ӽФ��(��)"></asp:Label></td>
            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label6" runat="server" Text="�ӽФH��"></asp:Label></td>

            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label8" runat="server" Text="��ڪ��A"></asp:Label></td>
            <td rowspan="2">
                <%--<SmoothEnterpriseWebControl:InputButton id="BUTTON_add" runat="server" Text="�s�W" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_add_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>--%>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" OnClientClick="return check()" runat="server" Text="�j�M" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="QUERY_occa00" runat="server">
                </asp:DropDownList></td>
            <td>
                <asp:DropDownList ID="ddl_plant" runat="server">
                    <asp:ListItem Text="�п��" Value="" />
                    <asp:ListItem Text="MINAIK" Value="MINAIK" />
                    <asp:ListItem Text="GIT" Value="GIT" />
                </asp:DropDownList></td>
            <td>
                <asp:TextBox ID="QUERY_occano" runat="server" Width="100px"></asp:TextBox></td>
            <td>
                <asp:TextBox ID="QUERY_occa01" runat="server" Width="100px"></asp:TextBox></td>
            <td>
                <asp:TextBox ID="QUERY_occa02" runat="server" Width="100px"></asp:TextBox></td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_occaud15S" runat="server" FormatType="Date"
                    BackColor="#F0F0F0" CssClass="Normal">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>

            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_occaud15E" runat="server" FormatType="Date"
                    BackColor="#F0F0F0" CssClass="Normal">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:PopupUser ID="QUERY_occauser" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                    Gradient-GradientType="Top" ValueField="id">
                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>

            <td>
                <asp:DropDownList ID="QUERY_state" runat="server">
                    <asp:ListItem Text="�п��" Value="" />
                    <asp:ListItem Text="�e�f��" Value="isSend" />
                    <asp:ListItem Text="���e�f" Value="waiting" />
                    <asp:ListItem Text="�h�^" Value="Terminate" />
                    <asp:ListItem Text="�h�^ERP" Value="isStop" />
                    <asp:ListItem Text="�f�֧���" Value="Complete" />
                </asp:DropDownList></td>


        </tr>
        <%--	    <tr>
	        
	        <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label8" runat="server" Text="����"></asp:Label></td>
	        <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label9" runat="server" Text="���ڱ���"></asp:Label></td>
	        <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label10" runat="server" Text="���ڹ��O"></asp:Label></td>
	        <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label11" runat="server" Text="�H���B��"></asp:Label></td>
	        <td align="center" style="background-color: #f0f0f0;"><asp:Label ID="Label3" runat="server" Text="�O�_������"></asp:Label></td>		        
	    </tr>--%>
        <%--	    <tr>
	        <td><asp:DropDownList ID="QUERY_dep_name" runat="server"></asp:DropDownList></td>            
            <td><asp:TextBox ID="QUERY_occa45" runat="server" Width="100px"></asp:TextBox></td>
            <td>
                <asp:DropDownList ID="QUERY_occa631" runat="server">
                </asp:DropDownList></td>
            <td><asp:TextBox ID="QUERY_occa63" runat="server" Width="100px"></asp:TextBox></td>
            
            
            <td>
                <asp:DropDownList ID="QUERY_argv2" runat="server" >
                    <asp:ListItem Text="�п��" Value="" />
                    <asp:ListItem Text="����" Value="Y" />
                    <asp:ListItem Text="�L����" Value="N" />
                    <asp:ListItem Text="����" Value="V" />
                </asp:DropDownList>
            </td>
	    
	    </tr>--%>
    </table>
    <table border="0" width="100%">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle"
                    NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True"
                    CellPadding="3px" BorderWidth="1px" BorderStyle="Solid" HeaderHeight="30px" Font-Names="Arial" Font-Size="12px"
                    SQL="SELECT * EIPB.DBO.FROM ERP_AXMI25" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
                    <Columns>
                        <%--<SmoothEnterpriseWebControl:DataColumn ID="DataList1_chk" Width="1%" DataAlign="Center" DataType="CheckBox" Required="True"></SmoothEnterpriseWebControl:DataColumn>--%>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Caption="�s��" HeaderAlign="Center"></SmoothEnterpriseWebControl:DataColumn>
                        <%--<SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" DataType="IconEdit"></SmoothEnterpriseWebControl:DataColumn>--%>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Width="1%" DataAlign="Center" DataType="IconView" Caption="�˵�"></SmoothEnterpriseWebControl:DataColumn>

                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_occa00" DataType="ViewText" Caption="�ӽ����O" DataName="APPTYPE" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_occano" DataType="ViewText" Caption="�ӽг渹" DataName="occano" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn10" DataType="ViewText" Caption="�t�O" DataName="PlantID"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_occa01" DataType="ViewText" Caption="�Ȥ�s��" DataName="occa01" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn1" DataType="ViewText" Caption="�Ȥ�²��" DataName="occa02" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn2" DataType="ViewText" Caption="�ӽФ��" DataName="occaud15" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn3" DataType="ViewText" Caption="�ӽФH��" DataName="name" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn4" DataType="ViewText" Caption="����" DataName="dept_nm" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn5" DataType="ViewText" Caption="���ڱ���" DataName="oag02_6" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn6" DataType="ViewText" Caption="���ڹ��O" DataName="Currency" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn7" DataType="ViewText" Caption="�H���B��" DataName="occa63" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn8" DataType="ViewText" Caption="���ʭ�]" DataName="occanote" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn9" DataType="ViewText" Caption="�ݼf�H��" DataName="REVIEWNAME" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_IsStatus" DataType="UserDefined" Caption="��ڪ��A" DataName="IsStatus" Sortable="True"></SmoothEnterpriseWebControl:DataColumn>



                    </Columns>
                    <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
                        BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black"></HeaderStyle>
                    <SelectColumnStyle BackColor="242, 242, 242"></SelectColumnStyle>
                    <SelectStyle BackColor="195, 210, 248"></SelectStyle>
                    <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
                    <HoverStyle BackColor="230, 237, 255"></HoverStyle>
                </SmoothEnterpriseWebControl:DataList>
            </td>
        </tr>
    </table>
    <%--	<table border="0">
	    <tr>
	        <td>
	            <SmoothEnterpriseWebControl:InputButton id="BUTTON_delete" runat="server" Text="�R��" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_delete_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
	        </td>
	    </tr>
	</table>--%>
</asp:Content>
