<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowTime.aspx.cs" Inherits="Shipping_ShowTime" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>檔案接收狀況</title>
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <div align="center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
            SelectCommand="SELECT [PKey], [ID], [INV_Num], [logETD], [logATD], [logETA], [logATAAS], [logATAC], [DataFileName], [DataUpdate] FROM [Forwarder_log]"></asp:SqlDataSource>
            
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="PKey" DataSourceID="SqlDataSource1" Height="250px" Width="500px">
            <ItemTemplate>
            <table border="2" width="100%" CELLPADDING="4">
            <caption>資料交換明細</caption>
               <tr>
               <td width="23%" bgcolor="#bfefff">INV_Num</td>
               <td bgcolor="#fafad2" align="left"><asp:Label ID="INV_NumLabel" runat="server" Text='<%# Bind("INV_Num") %>' Font-Bold="True" ForeColor="#0000C0"></asp:Label></td>
               </tr>
               
               <tr>
               <td bgcolor="#bfefff">ETD</td>
               <td bgcolor="#fafad2" align="left"><asp:Label ID="logETDLabel" runat="server" Text='<%# Bind("logETD") %>'></asp:Label></td>
               </tr>

                <tr>
               <td bgcolor="#bfefff">ATD</td>
               <td bgcolor="#fafad2" align="left"><asp:Label ID="logATDLabel" runat="server" Text='<%# Bind("logATD") %>'></asp:Label></td>
                </tr>
                
               <tr>
                 <td bgcolor="#bfefff">ETA</td>
                 <td bgcolor="#fafad2" align="left"><asp:Label ID="logETALabel" runat="server" Text='<%# Bind("logETA") %>'></asp:Label></td>
               </tr> 
               
               <tr>
                 <td bgcolor="#bfefff">ATAAS</td>
                 <td bgcolor="#fafad2" align="left"><asp:Label ID="logATAASLabel" runat="server" Text='<%# Bind("logATAAS") %>'></asp:Label></td>
               </tr> 
               
               <tr>
                 <td bgcolor="#bfefff">ATAC</td>
                 <td bgcolor="#fafad2" align="left"><asp:Label ID="logATACLabel" runat="server" Text='<%# Bind("logATAC") %>'></asp:Label></td>
               </tr> 
               
               <tr>
                 <td bgcolor="#bfefff">檔案名稱</td>
                 <td bgcolor="#fafad2" align="left"><asp:Label ID="DataFileNameLabel" runat="server" Text='<%# Bind("DataFileName") %>'></asp:Label></td>
               </tr>                                              
                
               <tr>
                 <td bgcolor="#bfefff">最後更新時間</td>
                 <td bgcolor="#fafad2" align="left"><asp:Label ID="DataUpdateLabel" runat="server" Text='<%# Bind("DataUpdate") %>' Font-Bold="True" ForeColor="Red"></asp:Label></td>
               </tr>                       
                
               </table> 
            </ItemTemplate>
            <EmptyDataTemplate>
                <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="Red" Text="--查無相關資料--" Font-Bold="True"></asp:Label>
            </EmptyDataTemplate>
        </asp:FormView>
     </div>
    </form>
</body>
</html>
