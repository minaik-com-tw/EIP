<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="cimi100_autounion.aspx.cs" Inherits="cimi100_autounion" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 802px; height: 1px">
        <tr>
            <td style="width: 4px; background-color: gainsboro">
                <asp:Label ID="Labe102" runat="server" Font-Bold="True" Font-Size="11pt" meta:resourcekey="Label29Resource1"
                    Text="附加檔案" Width="90px"></asp:Label>
            </td>
            <td id="uploadfiles" colspan="3" style="width: 667px">
            <asp:FileUpload ID="FileUpload1" runat="server" />
                &nbsp;<SmoothEnterpriseWebControl:InputButton
                    ID="Button_Add" runat="server" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid"
                    BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                    OnClick="Button_Add_Click" Text="上傳" Width="80px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id"
                DataSourceID="SqlDataSource1" Font-Size="10pt" ForeColor="Black" GridLines="Vertical"
                Height="1px" Width="1250px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                    <asp:BoundField DataField="AUTO_L" HeaderText="產業大分類" SortExpression="AUTO_L" />
                    <asp:BoundField DataField="AUTO_Industry" HeaderText="產業別" SortExpression="AUTO_Industry" />
                    <asp:BoundField DataField="Machine_number" HeaderText="機台代碼" SortExpression="Machine_number" />
                    <asp:BoundField DataField="AUTO_M" HeaderText="自動化中類" SortExpression="AUTO_M" />
                    <asp:BoundField DataField="AUTO_S" HeaderText="自動化小類" SortExpression="AUTO_S" />
                    
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F7DE" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPBConnectionString %>"
                DeleteCommand="DELETE FROM cimi100_autounion WHERE (id = @id)"
                SelectCommand="SELECT * FROM [cimi100_autounion]  order by auto_l,auto_industry,machine_number,auto_m,auto_s">
                <DeleteParameters>
                    <asp:Parameter Name="id" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

