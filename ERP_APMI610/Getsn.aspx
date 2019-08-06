<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Getsn.aspx.cs" Inherits="UI_TEST_Getid2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>供應廠商查詢</title>
    <base target="_self">
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table style="width: 324px">
                <tr>
                    <td style="width: 143px"></td>
                    <td style="width: 213px">&nbsp;</td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 143px">
                        <asp:Label ID="Label1" runat="server" Text="供應商代號(or 簡稱)" Font-Bold="True" Font-Size="X-Small" Width="147px"></asp:Label></td>
                    <td style="width: 213px">
                        <asp:TextBox ID="userName" runat="server" Width="120px"></asp:TextBox></td>
                    <td>
                        <asp:Button
                            ID="Button3" runat="server" OnClick="Button1_Click" Text="查詢" /></td>
                </tr>

            </table>
            <asp:GridView ID="GridView1"
                runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize="10" Width="200px"
                CellPadding="4" DataKeyNames="pmc01,pmc03" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                <RowStyle BackColor="#F7F6F3" Font-Size="14px" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="pmc01" HeaderText="供應商代號" ReadOnly="True" SortExpression="pmc01" ItemStyle-Width="100" ItemStyle-Height="20" >
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="pmc03" HeaderText="簡稱" SortExpression="pmc03"  ItemStyle-Width="100" >
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EmptyDataTemplate>
                    <table id="Table1" border="0" cellpadding="4" cellspacing="0" style="width: 350px; color: #333333; border-collapse: collapse">
                        <tr style="font-weight: bold; color: white; background-color: #5d7b9d">
                            <th scope="col">&nbsp;</th>
                            <th align="center" scope="col" style="font-size: 12px">
                                <a href="javascript:__doPostBack('GridView1','Sort$logonid')" style="color: white">供應商代號</a></th>
                            <th align="center" scope="col" style="font-size: 12px">
                                <a href="javascript:__doPostBack('GridView1','Sort$name')" style="color: white">簡稱</a></th>
                            <th align="center" scope="col" style="font-size: 12px">
                                
                        </tr>
                        <tr style="font-size: 12px; color: #333333; background-color: #f7f6f3">
                            <td align="center" colspan="4" rowspan="4">
                                <font color="red">查無相關資料</font></td>
                        </tr>
                        <tr style="font-size: 12px; color: #284775; background-color: white">
                        </tr>
                        <tr style="font-size: 12px; color: #333333; background-color: #f7f6f3">
                        </tr>
                        <tr style="font-size: 12px; color: #284775; background-color: white">
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>

            &nbsp; &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Visible="False" Width="279px"></asp:TextBox>
        </div>
    </form>
</body>
</html>
