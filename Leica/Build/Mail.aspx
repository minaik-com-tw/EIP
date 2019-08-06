<%@ Page Title="IPQC Informaction List" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="Mail.aspx.cs" Inherits="Build.Mail" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
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
            .table div .th {
                background-color: #5d7b9d;
                width: 90px;
            }

            .tag {
                font-size: 1.4em;
                font-weight: bold;
                color: #5d7b9d;
                text-align: left;
            }
 
        </style>
        <script>
            function select_user(obj) {

                var pass = false;

                /*----- 多選 -----*/
                //  使用迴圈取得所有被選擇的項目
                var mail = "";

                $(obj).find(":selected").each(function () {

                    if (mail != "") {
                        mail += ";";
                    }
                    mail += this.value;
                    pass = true;
                });

                if (pass) {
                    $("#ctl00_ContentPlaceHolder1_user_mail").val(mail);
                }
                return pass;
            }

            function add_user() {
                var pass = select_user("#ctl00_ContentPlaceHolder1_lb_user");

                if (!pass) {
                    alert("請選擇部門人員");
                }

                return pass;
            }

            function del_user() {
                var pass = select_user("#ctl00_ContentPlaceHolder1_lb_mail");

                if (!pass) {
                    alert("請選擇收信人員");
                }

                return pass;
            }

            function add_all() {
                $("#ctl00_ContentPlaceHolder1_lb_user").find("option").each(function () {
                    $(this).attr("selected", true);
                });
            }

            function del_all() {
                $("#ctl00_ContentPlaceHolder1_lb_mail").find("option").each(function () {
                    $(this).attr("selected", true);
                });
            }

        </script>
    </header>



    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>

    <asp:HiddenField ID="user_mail" runat="server" />
    <asp:HiddenField ID="msg" Value="" runat="server" />

    <div style="width: 90%;">

        <asp:UpdatePanel runat="server" ID="panel_change" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <div>
                    <div class="table all" style="border-bottom: 1px solid #5d7b9d">
                        <div>
                            <div class="th">部門</div>
                            <div class="td">
                                <asp:DropDownList ID="ddl_dept" runat="server" OnSelectedIndexChanged="ddl_dept_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>

                            <div class="th">人員名稱</div>
                            <div class="td">
                                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>

                            </div>
                            <div class="td">
                                <asp:Button ID="Btn_Qry" runat="server" Text="查詢" OnClick="Btn_Qry_Click" Width="60" /><br />
                            </div>
                        </div>
                    </div>
                    <div class="table d2 all ">
                        <div>
                            <div class="td tag">
                                部門人員
                                <input type="button" onclick="add_all()" value="全選" style="width: 60px" />
                            </div>
                            <div class="td">&nbsp;	&nbsp;</div>
                            <div class="td tag">
                                收件人員<input type="button" onclick="del_all()" value="全選" style="width: 60px" />
                            </div>
                        </div>
                        <div>
                            <div class="td" style="height:200px;" >
                                <asp:ListBox ID="lb_user" runat="server" SelectionMode="Multiple" Width="150" Height="200" Font-Size="Medium"></asp:ListBox>
                            </div>
                            <div class="td" style="height:200px;" >
                                <div style="padding:0;margin-top: 50%;text-align:center">
                                    <asp:Button ID="btn_add" Text=">>" OnClick="btn_add_Click" OnClientClick="return add_user()" runat="server" CssClass="mm" /><br />
                                    <asp:Button ID="btn_del" Text="<<" OnClick="btn_del_Click" OnClientClick="return del_user()" runat="server" CssClass="mm" />
                                </div>
                            </div>
                            <div class="td" style="height:200px;" >
                                <asp:ListBox ID="lb_mail" runat="server" SelectionMode="Multiple" Width="150" Height="200" Font-Size="Medium"></asp:ListBox>
                            </div>
                        </div>
                    </div>


                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btn_add" EventName="click" />
                <asp:AsyncPostBackTrigger ControlID="btn_del" EventName="click" />
                <asp:AsyncPostBackTrigger ControlID="ddl_dept" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
