<%@ page language="C#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.AddCode, App_Web_addcode.aspx.ae7ca9bd" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
</head>
<body>
    <form id="MainForm" method="post" runat="server">
        <table width="100%" height="100%">
            <tr>
                <td bgcolor="#e6e6e6">
                    <table align="center">
                        <tr>
                            <td Class="NormalBold" id="LABEL_code" runat="server">
                                Code</td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ID="FIELD_code" runat="server" Required="False"
                                    DESIGNTIMEDRAGDROP="49" Gradient-GradientType="Top" CssClass="Normal" BackColor="#F0F0F0"
                                    MaxLength="2">
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td Class="NormalBold" id="LABEL_name" runat="server">
                                Name</td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" Required="False"
                                    Gradient-GradientType="Top" CssClass="Normal" BackColor="#F0F0F0" MaxLength="50">
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <SmoothEnterpriseWebControl:InputButton ID="AddButton" runat="server" BackColor="#C8C8C8"
                                    Width="80px" Text="ADD" CssClass="NormalBold" BorderColor="#606060" BorderWidth="1px"
                                    BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" OnClick="AddButton_Click">
                                    <Gradient GradientType="Bottom"></Gradient>
                                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                                <SmoothEnterpriseWebControl:InputButton ID="CancelButton" runat="server" BackColor="#C8C8C8"
                                    Width="80px" Text="Cancel" CssClass="NormalBold" BorderColor="#606060" BorderWidth="1px"
                                    BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" RunAtCient="True">
                                    <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                </SmoothEnterpriseWebControl:InputButton></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
    <asp:Literal ID="L_javascript" runat="server"></asp:Literal></body>
</html>
