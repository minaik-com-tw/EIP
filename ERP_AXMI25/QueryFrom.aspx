<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QueryFrom.aspx.cs" Inherits="CNE_QueryFrom" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <base target="_self">  
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server" >
        <div>
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="FIELD_QUERY" runat="server"></asp:TextBox>
                        <asp:Button ID="BUTTON_QUERY" Text="查詢" runat="Server" OnClick="BUTTON_QUERY_Click" />
                    </td>
                </tr>
                <tr>
                    <td>                
                    <asp:GridView ID="GridView1" runat="server" Height="335px" Width="363px" AutoGenerateColumns="False" EmptyDataText="查無資料" 
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" >
                        <RowStyle BackColor="#F7F6F3" Font-Size="12px" ForeColor="#333333" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" Visible="False" ShowSelectButton="True" />
                            <asp:BoundField DataField="OCC01" HeaderText="客戶代碼" ReadOnly="True">
                                <HeaderStyle Font-Size="12px" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OCC02" HeaderText="客戶簡易名稱">
                                <HeaderStyle Font-Size="12px" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OCC18" HeaderText="客戶名稱" >
                                <HeaderStyle Font-Size="12px" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>  
<%--                            <asp:BoundField DataField="OCC19" HeaderText="廠商地址">
                                <HeaderStyle Font-Size="12px" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>  --%>                                     
                        </Columns>                
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>" SelectCommand="SELECT OCC01 , OCC02 , OCC18 FROM [IP185].[MINAIK].[dbo].[OCC_FILE]">
                 </asp:SqlDataSource>
                </td>
            </tr>
        </table>                 
        </div>            
    </form>
</body>
</html>
