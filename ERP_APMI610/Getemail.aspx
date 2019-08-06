<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Getemail.aspx.cs" Inherits="UI_TEST_Getid2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>供應商聯絡人資料</title>
    <base target="_self">  
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
       
        <table style="width: 324px">
            <tr>
                <td style="width: 143px">
                    </td>
                <td style="width: 213px">
                    &nbsp;</td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 143px">
        <asp:Label ID="Label1" runat="server" Text="E-mail 查詢" Font-Bold="True" Font-Size="X-Small" Width="108px"></asp:Label></td>
                <td style="width: 213px">
                <asp:TextBox ID="userName" runat="server" Width="120px"></asp:TextBox></td>
                <td>
                <asp:Button
            ID="Button3" runat="server" OnClick="Button1_Click" Text="查詢" /></td>
            </tr>
             
        </table>
        <asp:GridView ID="GridView1"
                runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                CellPadding="4" DataKeyNames="pmd07" DataSourceID="SqlDataSource1"
                ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                Width="322px" OnPageIndexChanged="GridView1_PageIndexChanged" Height="415px">
                <RowStyle BackColor="#F7F6F3" Font-Size="12px" ForeColor="#333333" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="pmd07" HeaderText="E-mail" ReadOnly="True" SortExpression="logonid">
                        <HeaderStyle Font-Size="12px" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EmptyDataTemplate>
                    <table id="Table1" border="0" cellpadding="4" cellspacing="0" style="width: 350px;
                        color: #333333; border-collapse: collapse">
                        <tr style="font-weight: bold; color: white; background-color: #5d7b9d">
                            <th scope="col">
                                &nbsp;</th>
                            <th align="center" scope="col" style="font-size: 12px">
                                <a href="javascript:__doPostBack('GridView1','Sort$logonid')" style="color: white">帳號</a></th>
                            <th align="center" scope="col" style="font-size: 12px">
                                <a href="javascript:__doPostBack('GridView1','Sort$name')" style="color: white">姓名</a></th>
                            <th align="center" scope="col" style="font-size: 12px">
                                <a href="javascript:__doPostBack('GridView1','Sort$email')" style="color: white">電子郵件</a></th>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>" SelectCommand="SELECT top 10  pmd07  FROM [IP185].[MINAIK].[dbo].[PMD_FILE] where pmd02='財務部'  group by pmd07&#13;&#10; order by pmd07 asc">
             </asp:SqlDataSource>
        &nbsp; &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Visible="False" Width="279px"></asp:TextBox></div>
    </form>
</body>
</html>
