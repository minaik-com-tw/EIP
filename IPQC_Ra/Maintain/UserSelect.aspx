<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="UserSelect.aspx.cs" Inherits="Maintain.UserSelect" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="FQC Mail List"
        Caption="Add User in Mail List" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>

    <header>
        <link href="../../script/css/normalize.css" rel="stylesheet" />
        <link href="../../script/css/mak_base2.css" rel="stylesheet" />
        <style>
            .table div .th {
                width: 10%;
            }
        </style>
        <script type="text/javascript">
            $(function () {
                $("#ctl00_ContentPlaceHolder1_GridView1_ctl01_geAll").change(function () {

                    var chek = $(this).prop('checked');

                    if (chek == true) {
                        $("input[name^='Account']").each(function () {
                            $(this).prop('checked', true);
                        });

                    }
                    else {
                        $("input[name^='Account']").each(function () {
                            $(this).prop('checked', false);
                        });
                    }
                });
            });

            function Back() {
                var href = document.location.href;
            }
        </script>
    </header>

    <div class="table">

        <div class="tr">
            <div class="th">�m�W:</div>
            <div class="td">
                <asp:TextBox ID="UserName" runat="server" Width="120" MaxLength="20" />
            </div>
        </div>
        <div class="tr">
            <div class="th">����:</div>
            <div class="td">
                <asp:DropDownList ID="Dept" runat="server" OnSelectedIndexChanged="Dept_SelectedIndexChanged" AutoPostBack="true" />
            </div>

        </div>
        <div class="tr">
            <div class="th" style="background-color: darkgoldenrod">�s��:</div>
            <div class="td">
                <asp:DropDownList ID="cbo_group" runat="server" OnSelectedIndexChanged="Dept_SelectedIndexChanged" AutoPostBack="true" />
            </div>
        </div>
        <div class="tr">
            <div class="th" style="background-color: darkgoldenrod">�o������:</div>
            <div class="td">
                <asp:DropDownList ID="cbo_week" runat="server" OnSelectedIndexChanged="cbo_week_SelectedIndexChanged" AutoPostBack="true" />
                </asp:DropDownList>

            </div>

            <div class="td" style="width:250px" >
                <asp:Button ID="BtnQry" CssClass="sysBtn" runat="server" Text="�d��" OnClick="Btn_Qry_Click" />
                <a href="Mail.aspx" class="sysBtn" style="width: 100px;margin:0px 5px">
                    <div style="width: 100px">�^�C��</div>
                </a>

            </div>
        </div>
    </div>
    <div style="width: 80%; padding-top: 5px; border-top: 2px solid #F58549">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="0" GridLines="Both"
            DataKeyNames="logonid,name,email" Width="80%" OnPageIndexChanging="GridView1_PageIndexChanging" Height="25"
            ForeColor="White" BackColor="#EDAF97" BorderColor="#808080" BorderStyle="None" BorderWidth="1px" EnableModelValidation="True">
            <AlternatingRowStyle BackColor="White" />
            <RowStyle BackColor="#F6DACF" ForeColor="#772F1A" Font-Size="14px" />
            <Columns>

                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" Height="25" />
                </asp:BoundField>
                <asp:BoundField DataField="logonid" HeaderText="�b��" ReadOnly="True" SortExpression="logonid">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" Height="25" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="�m�W" SortExpression="name">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" Height="25" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="�q�l�l��" SortExpression="email">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" Height="25" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <input type="checkbox" name="Account" value="<%#Eval("logonid") %>" />
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Button ID="Btn_Add" Text="�s�W" runat="server" OnClick="Btn_Add_Click" Width="50px" Font-Size="9" />
                        <asp:CheckBox ID="geAll" runat="server" />
                    </HeaderTemplate>
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" Height="25" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <SelectedRowStyle BackColor="242, 242, 242" />

            <EmptyDataTemplate>
                <table border="0" class="table" style="font-size: 14px; color: #F2A65A; border-collapse: collapse; background-color: #EDAF97; width: 100%; border-spacing: 0;">
                    <tr style="font-weight: bold; color: white; background-color: #F2A65A">
                        <th scope="col" class="Header_col" style="width: 20%;">�b��</th>
                        <th scope="col" class="Header_col" style="width: 20%;">�m�W</th>
                        <th scope="col" class="Header_col" style="width: 40%;">�q�l�l��</th>
                    </tr>
                    <tr style="background-color: white; border: 1px solid #333333">
                        <td colspan="3" align="center"><font color="red">�ثe�L�����H��!!</font></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
        </asp:GridView>

    </div>

</asp:Content>

