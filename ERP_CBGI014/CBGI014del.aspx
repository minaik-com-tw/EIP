<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CBGI014del.aspx.cs" Inherits="MISReport_WFHDel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <base target="_self" /> 
    <title>Untitled Page</title>
</head>
<script language="javascript">
   function close1(){
      window.close();
   
   }
   var str="�T�w�n�R���o�Ӫ���";//+<% =Request.QueryString["rowid"] %>
   document.write(str)
//onload="gethidevalue('<% =Request.QueryString["aid"] %>')" >

</script>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <asp:Label ID="Label1" runat="server" Height="20px" Text="�T�w�n�R���o�Ӫ���" Width="394px"></asp:Label><br />
        <br />
        <asp:Button ID="Button2" runat="server" Height="25px" Text="�T�w" Width="79px" OnClick="Button2_Click" />
        <asp:Button ID="Button1" runat="server" Height="25px" Text="����" Width="75px" OnClientClick="return close1()" /><br />
        <br />
        &nbsp;&nbsp;
    </div>
    </form>
</body>
</html>
