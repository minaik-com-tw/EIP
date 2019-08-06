<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="IPQC_RaAdd.aspx.cs" Inherits="IPQC_Ra.IPQC_RaAdd" StylesheetTheme="Default" Culture="Auto"
    UICulture="Auto" Debug="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
            Details="Input IPQC Ra data" Caption="IPQC Ra Add Page" Width="100%"
            CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
            <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
            <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
        </SmoothEnterpriseWebControlEnterprise:Descriptor> 
        <link href="css/IPQC_Ra.css" rel="stylesheet" />
        <script src="script/IPQC_Ra.js"></script>
     <style>
         .note {
             font-size :1.5em;
             text-align:right;
             vertical-align:middle;
         }

         .column {
                font-size :1.5em;
         }
     </style>

    </header>
    <div style="color: red; display: none">
        <div ID="chk_msg"><%=getStr("chk_msg") %> </div>
        <div ID="isNum_msg"><%=getStr("isNum_msg") %> </div>
        <div ID="isStr_msg"><%=getStr("isStr_msg") %> </div> 
    </div>
    <div id="ipqc_ra" style="width: 90%; padding: 10px 10px;">

        <div style="border: 1px solid #808080; width: 100%; padding: 5px 5px">

            <div style="width: 100%">
                <div class="div_td note"><%=getStr("received_date")%></div>
                <div class="div_td column">
                    <asp:Label ID="lab_Received" Text="" runat="server"></asp:Label>
                </div>

                <div class="div_td note"><%=getStr("week")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_week" Text="" runat="server"></asp:Label>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note "><%=getStr("applicant")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_applicant" Text="" runat="server"></asp:Label>
                </div>
                <div class="div_td note"><%=getStr("dept")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_depat" Text="" runat="server"></asp:Label>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note "><%=getStr("dispatch")%>:</div>
                <div class="div_td column">
                    <asp:TextBox ID="txt_dispatch" runat="server" MaxLength="20"  ></asp:TextBox>
                </div>
                <div class="div_td note "><%=getStr("bom_dt")%>:</div>
                <div class="div_td column">
                    <asp:TextBox ID="txt_bomdt" CssClass="required date" runat="server" ></asp:TextBox>
                     
                </div>
            </div>
            <div style="width: 100%;">
                <div class="div_td note "><%=getStr("tooling")%>:</div>
                <div class="div_td column">
                    <asp:TextBox ID="txt_tooling" runat="server" MaxLength="20" CssClass="required"></asp:TextBox>
                </div>
                <div class="div_td note "><%=getStr("test_item")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList runat="server" ID="cbo_testitem"  CssClass="required" ></asp:DropDownList>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note "><%=getStr("test_type")%> :</div>
                <div class="div_td column">
                    <asp:DropDownList runat="server" ID="cbo_testtype"  CssClass="required" ></asp:DropDownList>
                </div>
                <div class="div_td note"><%=getStr("product")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList runat="server" ID="cbo_product"></asp:DropDownList>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note "><%=getStr("material")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList runat="server" ID="cbo_material"  CssClass="required" ></asp:DropDownList>
                </div>
                <div class="div_td note"><%=getStr("program")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList ID="cbo_program" runat="server"  CssClass="required" ></asp:DropDownList>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note "><%=getStr("sample")%>:</div>
                <div class="div_td column">
                    <asp:TextBox ID="txt_sample" runat="server" MaxLength="10" CssClass="required"></asp:TextBox>
                </div>
                <div class="div_td note"><%=getStr("equipment")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList ID="cbo_Machine" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note" ><%=getStr("remark")%>:</div>
                <div class="div_td column" style="width:75%" >
                    <asp:TextBox ID="txt_remark" runat="server" MaxLength="200" Width="90%"></asp:TextBox>
                </div>
                
            </div>

        </div>
        <div style="width: 100%; margin: 10px 5px;">

            <asp:Button ID="Btn_Save" CssClass="sysBtn"  runat="server" Text="儲存" OnClick="Btn_Save_Click" OnClientClick="return check()"/>
            <asp:Button ID="Btn_Continue" CssClass="sysBtn" width="120" runat="server" Text="儲存後繼續" OnClientClick="return check()" OnClick="Btn_Continue_Click" />
            <asp:Button ID="Cancel" CssClass="sBtn"  runat="server" OnClientClick="return back()" Text="回列表"/>
        </div>
    </div>
</asp:Content>
