<%@ Page Title="IPQC Informaction List" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="Builder.Manager" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="PCN Mail List" Caption="PCN Option setting" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <header>
        <style>
            .table div .td,.table div .th {
                width: 120px;
            }

            .table div .th {
                background-color: #664E4C;
                color: #E2D58B;
                
            }
        </style>
        <script>

            function chk_del() {
                var i = 0;
                var pass = false;
                var del = "";
                $("input[name='del_user']").each(function () {
                    var chk = $(this).prop("checked");
                    var value = $(this).val();

                    if (chk) {
                        i++;
                        if (del != "") {
                            del + ";";
                        }

                        del += value;
                    }


                });

                if (i == 0) {
                    alert("請選擇人員");

                }
                else {
                    $("#ctl00_ContentPlaceHolder1_del_user").val(del);
                    pass = true;
                }

                return pass;
            }
        </script>
    </header>

    <asp:HiddenField ID="del_user" runat="server" />
    <asp:HiddenField ID="msg" runat="server" />

    <div style="width: 800px">
        <div>
            <div class="table">

                <div style="background-color:#FFFD82" >
                    <div class="th"style="background-color:#D8F793;color:#5A5B63" >新增人員</div>
                    <div class="td" style="width: 180px;">
                        <asp:TextBox ID="txt_user" runat="server" Width="100px" CssClass="required"></asp:TextBox>

                        <asp:HiddenField ID="txt_user_id" runat="server" Value="" />
                        <i id="img_user" class="fa fa-users" style="color: #FD7E14; font-size: 20px; margin: 1px 1px 1px 1px; cursor: pointer;" onclick="setUser(this)"></i>
                    </div>
                    <div class="td">
                        <asp:Button ID="Btn_Add" runat="server" Text="新增" OnClick="Btn_Add_Click" OnClientClick="return check()" /><br />
                    </div>
                </div>

                <div>
                    <div class="th">部門:</div>
                    <div class="td">
                        <asp:DropDownList ID="Dept" runat="server" OnSelectedIndexChanged="Dept_SelectedIndexChanged" AutoPostBack="true" />
                    </div>


                    <div class="th">人員名稱</div>
                    <div class="td">
                        <asp:TextBox ID="user_name" runat="server" Width="100px" ></asp:TextBox>



                    </div>

                    <div class="td">
                        <asp:Button ID="BtnQry" CssClass="sysBtn" runat="server" Text="查詢" OnClick="Btn_Qry_Click" />


                    </div>
                </div>
            </div>
        </div>
        <div style="width:650px" >
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id,logonid,name"
                OnRowDeleting="GridView1_RowDeleting" ForeColor="#333333" GridLines="None" Width="100%">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="14px" />
                <Columns>

                    <asp:BoundField DataField="dept_nm" HeaderText="部門">

                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="name" HeaderText="姓名">
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="logonid" HeaderText="帳號">
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <input type="checkbox" id="del_user" name="del_user" value="<%#Eval("id") %>" />
                        </ItemTemplate>
                        <HeaderTemplate>
                            <asp:Button ID="btn_del" name="btn_del" runat="server" OnClick="btn_del_Click" OnClientClick="return chk_del()" Text="Del" />
                        </HeaderTemplate>
                        <HeaderStyle Font-Size="14px" HorizontalAlign="Center" Height="25" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>


                </Columns>
                <FooterStyle BackColor="#664E4C" Font-Bold="True" ForeColor="#E2D58B" />
                <PagerStyle BackColor="#664E4C" ForeColor="#E2D58B" HorizontalAlign="Center" Font-Size="Medium" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#E2D58B" />
                <HeaderStyle BackColor="#664E4C" Font-Bold="True" ForeColor="#E2D58B" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EmptyDataTemplate>
                    <table id="Table1" border="0" cellpadding="4" cellspacing="0" style="width: 350px; color: #E2D58B; border-collapse: collapse">
                        <tr style="font-weight: bold; color: #E2D58B; background-color: #664E4C; font-size: 14px">
                            <th scope="col"></th>
                            <th scope="col">部門</th>
                            <th scope="col">姓名</th>
                            <th scope="col">帳號</th>
                        </tr>
                        <tr style="background-color: white; border: 1px solid #333333; font-size: medium">
                            <td colspan="3" style="text-align: center"><font color="red">目前無相關人員!!</font></td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
