<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="Flow.aspx.cs" Inherits="Maintain.Flow" %>


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
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="Flow List"
        Caption="IPQC approval flow setting" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>

    <header>

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
                background-color: #526200;
                color: #ffffff;
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

            function chk() {
                var pass = true;
                var ok = 0;
                $(":checkbox").each(function () {
                    var chked = $(this).prop('checked');
                    if (chked) {
                        ok += 1;
                    }
                });

                if (ok == 0) {
                    alert("請選擇刪除的人員");
                    pass = false;
                }

                return pass;
            }
        </script>
    </header>

    <div class="table all" >
        <div class="tr">
            <div class="th">姓名:</div>
            <div class="td">
                <asp:TextBox ID="txt_name" runat="server" />
            </div>
        </div>

        <div class="tr">
            <div class="th">簽核群組:</div>

            <div class="td">
                <asp:DropDownList ID="cbo_level" runat="server" OnSelectedIndexChanged="cbo_level_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="td">
                <asp:Button CssClass="sysBtn" ID="Btn_Qquery" runat="server" Text="查詢" OnClick="Btn_Qquery_Click" />
                <asp:Button CssClass="sysBtn" ID="Btn_Add" OnClick="Btn_Add_Click" runat="server" Text="新增" /><br />
            </div>
        </div>

    </div>

    <div class="all" style="padding-top: 5px; border-top: 2px solid #95B200">

        <asp:ScriptManager ID="ScriptManager" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="up_list" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>

                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="0" GridLines="Both"
                    Width="80%" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" OnRowCreated="GridView1_RowCreated" PageSize="10" Height="25"
                    DataKeyNames="rowno,class"
                    ForeColor="White" BackColor="#95B200" BorderColor="#808080" BorderStyle="None" BorderWidth="1px" EnableModelValidation="True">

                    <AlternatingRowStyle BackColor="White" />
                    <RowStyle BackColor="#D8E3A2" ForeColor="#772F1A" Font-Size="14px" />
                    <PagerStyle BackColor="#95B200" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="red" ForeColor="White" HorizontalAlign="Center" />
                    <Columns>

                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField ID="rowno" runat="server" Value='<%# Eval("rowno") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="編輯">
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Height="30" />
                            <HeaderStyle />
                        </asp:TemplateField>
                        <asp:BoundField DataField="class" HeaderText="簽核群組">
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="text" HeaderText="簽核抬頭">
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="name" HeaderText="姓名">
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="順序">
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField ID="level" runat="server" Value='<%# Eval("class") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="mail" HeaderText="核備">
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="enable" HeaderText="作廢">
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <input type="checkbox" name="DelKey" value="<%#Eval("rowno") %>" />
                            </ItemTemplate>
                            <HeaderTemplate  >
                                <asp:Button ID="Btn_Del" Text="作廢" runat="server" OnClick="Btn_Del_Click" Width="50px" Font-Size="9" OnClientClick="return chk()" />
                                <asp:CheckBox ID="geAll" runat="server" />
                                
                            </HeaderTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Font-Size="14px" HorizontalAlign="Center" />
                        </asp:TemplateField>

                    </Columns>
                    <SelectedRowStyle BackColor="242, 242, 242" />

                    <EmptyDataTemplate>
                        <table border="0" class="table" style="font-size: 14px; color: #F2A65A; border-collapse: collapse; background-color: #95B200; width: 100%; border-spacing: 0;">
                            <tr style="font-weight: bold; color: white; background-color: #95B200">
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
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
    </div>

</asp:Content>
