<%@ Page Title="人員列表" Language="C#" MasterPageFile="~/_site/layout/CommBase.master" AutoEventWireup="true" CodeFile ="Member.aspx.cs" Inherits="Comm_Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <header>
        <style>
            .table div .td, .th {
                width: 200px;
            }

            .table div .th {
                background-color: #5D7B9D;
                color: #ffffff;
            }
        </style>
        <script type="text/javascript">
             
 
            function getAccount(id,account)   
            {
                var frame = window.parent;
                frame.parentResponse(id,account);
            }

        </script>
    </header>
    
    <div style="width: 800px; text-align: left">
        <div class="table">
            <div>
                <div class="th">姓名:</div>
                <div class="td">
                    <asp:TextBox ID="UserName" runat="server" Width="120" MaxLength="20" />
                </div>
                <div class="td"></div>
            </div>
            <div>
                <div class="th">部門:</div>
                <div class="td">
                    <asp:DropDownList ID="Dept" runat="server" OnSelectedIndexChanged="Dept_SelectedIndexChanged" AutoPostBack="true" />
                </div>
                <div class="td">
                    <asp:Button ID="BtnQry" CssClass="sysBtn" runat="server" Text="查詢" OnClick="Btn_Qry_Click" />

                </div>
            </div>
        </div>
        <div style="width: 90%; padding-top: 5px; border-top: 2px solid #5D7B9D">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" GridLines="Horizontal"
                DataKeyNames="logonid,name,email" Width="80%" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15"
                ForeColor="#333333" EnableModelValidation="True" Style="text-align: justify">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="14px" />
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <input type="button" id="chk" value="Selected" onclick="getAccount('<%#Eval("id") %>','<%#Eval("name") %>')"  />
                        </ItemTemplate>
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" Height="25" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False">
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="dept_nm" HeaderText="部門" ReadOnly="True">
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" ForeColor="#ffffff" Height="30" />
                        <ItemStyle HorizontalAlign="Center" Height="25" />
                    </asp:BoundField>
                    <asp:BoundField DataField="logonid" HeaderText="帳號" ReadOnly="True">
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" ForeColor="#ffffff" Height="30" />
                        <ItemStyle HorizontalAlign="Center" Height="25" />
                    </asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="姓名">
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" ForeColor="#ffffff" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="email" HeaderText="電子郵件">
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" ForeColor="#ffffff" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                </Columns>
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

                <EditRowStyle BackColor="#999999" />

                <EmptyDataTemplate>

                    <table  style="width: 100%; border-collapse: collapse; color: #333333; text-align: justify" cellspacing="0" cellpadding="4" rules="rows" border="1">
                        <tbody>
                            <tr style="font-weight: bold; color: white; background-color: #5d7b9d">
                                <th style="font-size: 14px; height: 25px;width:18%" scope="col" align="center" >&nbsp;</th>
                                <th style="font-size: 14px; height: 30px;width:18%" color: white" scope="col" align="center">部門</th>
                                <th style="font-size: 14px; height: 30px;width:18%" color: white" scope="col" align="center">帳號</th>
                                <th style="font-size: 14px; height: 30px;width:18%" color: white" scope="col" align="center">姓名</th>
                                <th style="font-size: 14px; height: 30px;width:28%" color: white" scope="col" align="center">電子郵件</th>
                            </tr>
                            <tr style="font-size: 14px; color: red;  ">
                                <td align="center" colspan="5" style="width:100%;" >
                                    查無資料
                                </td>
                                 
                            </tr>
                            
                        </tbody>
                    </table>
                </EmptyDataTemplate>

            </asp:GridView>

        </div>
    </div>
</asp:Content>




