<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dgUserList.aspx.cs" Inherits="Comm_dgUserList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../script/css/normalize.css" rel="stylesheet" />
    <link href="../../script/css/mak_base2.css" rel="stylesheet" />
    <script src="../../script/js/jquery-1.8.3.js"></script>
    <script>

</script>

    <style>
        .table div .th {
            font-size: 0.8em;
            background-color: #5d7b9d;
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div style="width: 600px">
            <div>
                <div class="table">
                    <div>
                        <div class="th">部門</div>
                        <div class="td">
                            <asp:DropDownList ID="ddl_dept" runat="server" OnSelectedIndexChanged="ddl_dept_SelectedIndexChanged" AutoPostBack="true" Width="100"></asp:DropDownList>
                        </div>
                    </div>
                    <div>
                        <div class="th">人員名稱</div>
                        <div class="td">
                            <asp:TextBox ID="txt_name" runat="server" Width="100px"></asp:TextBox>

                        </div>
                        <div class="td">
                            <asp:Button ID="Btn_Qry" runat="server" Text="查詢" OnClick="Btn_Qry_Click" CssClass="sysBtn" Font-Size="12px" /><br />
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id,logonid,name" OnRowDataBound="GridView1_RowDataBound"
                    ForeColor="#333333" GridLines="None" Width="100%">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="12px" />
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <input type="button" id="getUser" value="選擇" userid="<%#Eval("id").ToString().Trim()%>" username="<%#Eval("name").ToString().Trim() %>" onclick="window.parent.getdgUser(this);
" />
                            </ItemTemplate>
                            <HeaderTemplate>
                                選擇 
                            </HeaderTemplate>
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="dept_nm" HeaderText="部門" SortExpression="dept_nm">
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name">
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="logonid" HeaderText="帳號" ReadOnly="True" SortExpression="logonid">
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="" Visible="false">
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
                            <tr style="font-weight: bold; color: white; background-color: #4A3C8C; font-size: 12px">
                                <th scope="col"></th>
                                <th scope="col">帳號</th>
                                <th scope="col">部門</th>
                                <th scope="col">姓名</th>

                            </tr>
                            <tr style="background-color: white; border: 1px solid #333333">
                                <td colspan="3" align="center"><font color="red">目前無相關人員!!</font></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EditRowStyle BackColor="#999999" />
                </asp:GridView>
            </div>
        </div>
        <div>
 <asp:GridView ID="vmi_list" runat="server" ></asp:GridView>
        </div>


    </form>
</body>
</html>
