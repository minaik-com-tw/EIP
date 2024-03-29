﻿<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie_Edge.master" AutoEventWireup="true" CodeFile="BuildAdd.aspx.cs" Inherits="Build.BuildAdd" StylesheetTheme="Default" Culture="Auto"
    UICulture="Auto" Debug="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
            Details="Leica Option List setting " Caption="Leica Option Add" Width="100%"
            CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
            <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
            <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
        </SmoothEnterpriseWebControlEnterprise:Descriptor>
        <link href="js/build.css" rel="stylesheet" />
         
        <script>
             
        </script>
    </header>

    <asp:HiddenField ID="msg" runat="server" />
    <div style="border: 2px solid #8A6BBE; width: 800px;padding:5px;">
        <div class="tb1" style="border-collapse: separate; border-spacing: 2px;width:100%">
            <div class="tr">
                <div class="th"><span style="color: red">*</span>分類</div>
                <div class="td">
                    <asp:DropDownList ID="ddl_menu" runat="server" Width="180" CssClass="required"></asp:DropDownList>
                </div>
            </div>
            <div class="tr">
                <div class="th"><span style="color: red">*</span>英文</div>
                <div class="td">
                    <asp:TextBox ID="txt_en" runat="server" MaxLength="50" Width="180" CssClass="required"></asp:TextBox>
                    
                </div> 
            </div>
            <div class="tr">
                <div class="th">中文</div>
                <div class="td">
                    <asp:TextBox ID="txt_tw" runat="server" MaxLength="50" Width="180" ></asp:TextBox>
                    <asp:CheckBox ID="chk_def" runat="server" Checked="false" />預設值
                </div> 
            </div>

        </div>
        <div style="width: 60%;">
            <div style="text-align: center;border:0px solid red;padding:5px">
                <asp:Button ID="Btn_Save" runat="server" Text="儲存" OnClientClick="return check()" OnClick="Btn_Save_Click" CssClass="sysBtn" />
                <%--<asp:Button ID="Btn_Back" runat="server" Text="回上頁" OnClientClick="return Nomarl.goto('build.aspx')"  />
                    javascript: window.history.go(-2)--%>

                <asp:Button ID="Btn_Back" runat="server" Text="回上頁" OnClientClick="return Nomarl.goto('build.aspx');" CssClass="sysBtn" />
            </div>

        </div>
    </div>


</asp:Content>
