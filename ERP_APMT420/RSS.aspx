<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RSS.aspx.cs" Inherits="ERP_APMT420_RSS" %>

<%@ Register Assembly="RssToolkit" Namespace="RssToolkit.Web.WebControls" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <cc1:RssDataSource ID="RssDataSource1" runat="server" MaxItems="0" Url="http://tw.news.yahoo.com/rss/realtime">
        </cc1:RssDataSource>
    
    </div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="RssDataSource1">
            <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink2" runat="server"  Font-Size="12px" NavigateUrl='<%# Eval("link") %>' Text='<%# Eval("title") %>'></asp:HyperLink>

            </ItemTemplate>
        </asp:DataList>
    </form>
</body>
</html>
