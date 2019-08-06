<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="Mail.aspx.cs" Inherits="Maintain.Mail" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" %>


<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="Mail List"
        Caption="Add User in Mail List" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>

    <header>
        <link href="../../script/css/normalize.css" rel="stylesheet" />
        <link href="../../script/css/mak_base2.css" rel="stylesheet" />
        <style>
            .Header_col {
                color: #ffffff;
                font-weight: bolder;
                font-size: 14px;
                height: 30px;
                padding: 5px 5px;
                text-align: center;
                vertical-align: middle;
            }

            .table div .th {
                width: 15%;
            }
        </style>
        <script type="text/javascript">
            $(function () {
                $("#ctl00_ContentPlaceHolder1_GridView1_ctl01_geAll").change(function () {
                    var chek = $(this).prop('checked');

                    if (chek == true) {
                        $(":checkbox").each(function () {
                            $(this).prop('checked', true);
                        });
                        $("#ctl00_ContentPlaceHolder1_DelMail").val();

                    }
                    else {
                        $(":checkbox").each(function () {
                            $(this).prop('checked', false);
                        });
                    }
                });


            });
        </script>
    </header>
    <div class="table" style="width: 80%">
        <div class="tr">
            <div class="th">姓名:</div>
            <div class="td">
                <asp:TextBox ID="UserName" runat="server" />
            </div>
        </div>
        <div class="tr">
            <div class="th">部門:</div>
            <div class="td">
                <asp:DropDownList ID="Dept" runat="server" OnSelectedIndexChanged="Dept_SelectedIndexChanged" AutoPostBack="true" />
            </div>
        </div>
        <div class="tr">
            <div class="th">群組:</div>
            <div class="td">
                 <asp:DropDownList ID="cbo_group" runat="server" OnSelectedIndexChanged="Dept_SelectedIndexChanged" AutoPostBack="true" />
            </div>
            <div class="td">
                <asp:Button CssClass="sysBtn" ID="BtnQry" runat="server" Text="查詢" OnClick="Btn_Qry_Click" />
                <asp:Button CssClass="sysBtn" ID="BtnAdd" runat="server" Text="新增" OnClick="Btn_Add_Click" /><br />
            </div>
        </div>
    </div>

    <div style="width: 80%; padding-top: 5px; border-top: 2px solid #F58549">


        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="0" GridLines="Both"
            Width="80%" OnPageIndexChanging="GridView1_PageIndexChanging"
            ForeColor="White" BackColor="#F2A65A" BorderColor="#808080" BorderStyle="None" BorderWidth="1px" EnableModelValidation="True">
            <AlternatingRowStyle BackColor="White" />
            <RowStyle BackColor="#F7E2BE" ForeColor="#772F1A" Font-Size="14px" />
            <Columns>

                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="u_group" HeaderText="Group">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="logonid" HeaderText="帳號">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="姓名">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="電子郵件">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <input type="checkbox" name="DelKey" value="<%#Eval("id") %>" />
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Button ID="Btn_Del" Text="刪除" runat="server" OnClick="Btn_Del_Click" Width="50px" Font-Size="9" />  <asp:CheckBox ID="geAll" runat="server" />
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle />
                </asp:TemplateField>
            </Columns>
            <SelectedRowStyle BackColor="242, 242, 242" />
            <EmptyDataTemplate>
                <table border="0" class="table" style="font-size: 14px; color: #F2A65A;border-collapse: collapse; background-color: #F7F7F7; width: 100%; border-spacing: 0;">
                    <tr style="font-weight: bold; color: white; background-color: #F2A65A">
                        <th scope="col" class="Header_col" style="width: 20%;">帳號</th>
                        <th scope="col" class="Header_col" style="width: 20%;">姓名</th>
                        <th scope="col" class="Header_col" style="width: 40%;">電子郵件</th>
                    </tr>
                    <tr style="background-color: white; border: 1px solid #333333">
                        <td colspan="3" align="center"><font color="red">目前無相關人員!!</font></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>
