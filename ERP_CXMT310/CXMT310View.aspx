<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" debug="true" AutoEventWireup="true"  CodeFile="CXMT310View.aspx.cs" Inherits="ERP_CXMT310.CXMT310View" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="CXMT310 View Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table cellpadding="0" cellspacing="0" style="width: 1285px; height: 70px">
        <tr>
            <td align="center" colspan="2" style="width: 100%; height: 23px">
                <asp:Label ID="FIELD_companyname" runat="server" CssClass="NormalBold" Font-Size="Medium"
                    meta:resourcekey="Label1Resource1" Text="銘異科技股份有限公司" Width="500px"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="width: 100%; height: 23px; text-align: center">
                <asp:Label ID="title" runat="server" CssClass="NormalBold" Font-Size="Medium" meta:resourcekey="Label2Resource1"
                    Text="報價單電子簽核" Width="500px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 357px; height: 21px">
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="9pt"
                    meta:resourcekey="Label34Resource1" Text="EIP單號"></asp:Label>
                <asp:Label ID="FIELD_no" runat="server" CssClass="NormalBold" ForeColor="DimGray"
                    Height="5px" Width="93px"></asp:Label>&nbsp;
                <asp:Label ID="sadfa" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="9pt"
                    meta:resourcekey="Label34Resource1" Text="Ver"></asp:Label>
                <asp:Label ID="FIELD_vera" runat="server" CssClass="NormalBold" ForeColor="DimGray"
                    Height="5px" Width="93px"></asp:Label></td>
            <td style="width: 1200px; height: 21px; text-align: right">
                &nbsp;<asp:Label ID="Label4a" runat="server" CssClass="NormalBold" Font-Names="新細明體"
                    Font-Size="9pt" meta:resourcekey="Label34Resource1" Text="廠&nbsp; 區"></asp:Label>
                <asp:Label ID="FIELD_plantid" runat="server" CssClass="NormalBold" ForeColor="DimGray"
                    Height="5px" Style="text-align: left" Width="64px"></asp:Label>
                <asp:Label ID="Label9" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="9pt"
                    meta:resourcekey="Label34Resource1" Text=" &nbsp;申 &nbsp;請 &nbsp;人"></asp:Label>
                <asp:Label ID="FIELD_g_name" runat="server" CssClass="NormalBold" ForeColor="DimGray"
                    Height="5px" Style="text-align: left" Width="50px"></asp:Label>&nbsp;
            </td>
        </tr>
        <tr style="font-size: 10pt; font-family: Times New Roman">
            <td align="right" colspan="2" style="width: 100%; height: 24px; text-align: right">
                <table border="1" bordercolor="silver" cellpadding="0" cellspacing="0" style="width: 1285px;
                    border-collapse: collapse; height: 426px">
                    <tr>
                        <td style="width: 83%; height: 15px; text-align: right">
                            <table style="width: 100%">
                                <tr>
                                    <td colspan="4" style="height: 20px; background-color: slategray; text-align: center">
                                        &nbsp;<asp:Image ID="Image1" runat="server" Height="22px" ImageUrl="~/ERP_CXMT310/img/list.png"
                                            Width="23px" />
                                        <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Names="新細明體" Font-Size="11pt"
                                            ForeColor="MintCream" meta:resourcekey="Label29Resource1" Text="申&nbsp;請&nbsp;內&nbsp;容"
                                            Width="82px"></asp:Label></td>
                                </tr>
                                <tr style="font-size: 10pt">
                                    <td id="table1_1" colspan="4" rowspan="6" style="height: auto; text-align: left">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 30%; height: 239px">
                                                    <table border="0" style="border-right: goldenrod 1px solid; border-top: goldenrod 1px solid;
                                                        border-left: goldenrod 1px solid; width: 100%; border-bottom: goldenrod 1px solid;
                                                        height: 100%">
                                                        <tr>
                                                            <td style="width: 100%; height: 154px">
                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 89%">
                                                                    <tr>
                                                                        <td colspan="4" style="width: 100%; height: 20px; background-color: #ffcc66">
                                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="11pt" Text="基本資料"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 73px; background-color: gainsboro">
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="10pt" Text="ERP單號"
                                                                                Width="90px"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 151px">
                                                                            <asp:Label ID="FIELD_oqa01" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 85px; background-color: gainsboro">
                                                                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="10pt" Text="客戶"
                                                                                Width="59px"></asp:Label></td>
                                                                        <td style="width: 206px">
                                                                            <asp:Label ID="FIELD_oqa06" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="31px"></asp:Label>
                                                                            <asp:Label ID="FIELD_ta_oqa010" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="81px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 73px; background-color: gainsboro">
                                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="10pt" Text="類別"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 151px">
                                                                            <asp:Label ID="FIELD_oaydesc" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 85px; background-color: gainsboro">
                                                                            <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="10pt" Text="業務人員"
                                                                                Width="74px"></asp:Label></td>
                                                                        <td style="width: 206px">
                                                                            <asp:Label ID="FIELD_gen02_1" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="81px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 73px; background-color: gainsboro">
                                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="10pt" Text="估價日期"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 151px">
                                                                            <asp:Label ID="FIELD_oqa02" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Text="920101"
                                                                                Width="79px"></asp:Label></td>
                                                                        <td style="width: 85px; background-color: gainsboro">
                                                                            <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="10pt" Text="部門"
                                                                                Width="59px"></asp:Label></td>
                                                                        <td style="width: 206px">
                                                                            <asp:Label ID="FIELD_gem02_0" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="81px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 73px; background-color: gainsboro">
                                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="10pt" Text="產品編號"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 151px">
                                                                            <asp:Label ID="FIELD_oqa03" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 85px; background-color: gainsboro">
                                                                            <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="10pt" Text="有效日期"
                                                                                Width="59px"></asp:Label></td>
                                                                        <td style="width: 206px">
                                                                            <asp:Label ID="FIELD_oqa12" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="81px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 73px; background-color: gainsboro">
                                                                            <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="10pt" Text="品名"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td colspan="3">
                                                                            <asp:Label ID="FIELD_oqa031" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="197px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 73px; background-color: gainsboro">
                                                                            <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="10pt" Text="規格"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td colspan="3">
                                                                            <asp:Label ID="FIELD_oqa032" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="196px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 73px; background-color: gainsboro">
                                                                            <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="10pt" Text="預計交貨日"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td colspan="3">
                                                                            <asp:Label ID="FIELD_ta_oqa021" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="42px"></asp:Label>
                                                                            <asp:Label ID="FIELD_tc_oag02_2" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="168px"></asp:Label>
                                                                            <asp:Label ID="FIELD_ta_oqa022" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 73px; background-color: gainsboro">
                                                                            <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="10pt" Text="預計驗收日"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td colspan="3">
                                                                            <asp:Label ID="FIELD_ta_oqa023" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 73px; background-color: gainsboro">
                                                                            <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Size="10pt" Text="單據狀態"
                                                                                Width="110px"></asp:Label></td>
                                                                        <td style="width: 151px">
                                                                            <asp:Label ID="FIELD_status" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 85px">
                                                                        </td>
                                                                        <td style="width: 206px">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                </td>
                                                <td style="width: 50%; height: 239px">
                                                    <table border="0" style="border-right: goldenrod 1px solid; border-top: goldenrod 1px solid;
                                                        border-left: goldenrod 1px solid; width: 100%; border-bottom: goldenrod 1px solid;
                                                        height: 100%">
                                                        <tr>
                                                            <td style="width: 70%; height: 154px">
                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 90%">
                                                                    <tr>
                                                                        <td colspan="6" style="height: 20px; background-color: #ffcc66">
                                                                            <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="11pt" Text="帳務資料"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="10pt" Text="報價數量"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 117px">
                                                                            <asp:Label ID="FIELD_oqa10" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="Red" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Size="10pt" Text="價格條件"
                                                                                Width="90px"></asp:Label>
                                                                        </td>
                                                                        <td colspan="3">
                                                                            <asp:Label
                                                                                    ID="FIELD_oah02_" runat="server" CssClass="NormalBold" Font-Bold="False" Font-Size="10pt"
                                                                                    ForeColor="DimGray" Height="5px" Style="text-align: left" Width="100%"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Size="10pt" Text="加價率(%)"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 117px">
                                                                            <asp:Label ID="FIELD_ta_oqa171" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="45px"></asp:Label><asp:Label
                                                                                    ID="FIELD_ta_oqa223" runat="server" CssClass="NormalBold" Font-Bold="False" Font-Size="10pt"
                                                                                    ForeColor="DimGray" Height="5px" Style="text-align: left" Width="52px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label33" runat="server" Font-Bold="True" Font-Size="10pt" Text="原幣未稅售價"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa17t" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label37" runat="server" Font-Bold="True" Font-Size="10pt" Text="本幣未稅售價"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa20t" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Size="10pt" Text="利潤(%)"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 117px">
                                                                            <asp:Label ID="FIELD_profit" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="Red" Height="5px" Style="text-align: left" Width="46px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label34" runat="server" Font-Bold="True" Font-Size="10pt" Text="原幣稅額"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa17x" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label38" runat="server" Font-Bold="True" Font-Size="10pt" Text="本幣稅額"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa20x" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="10pt" Text="稅別/稅率"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 117px">
                                                                            <asp:Label ID="FIELD_ta_oqa221" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="37px"></asp:Label>/
                                                                            <asp:Label ID="FIELD_ta_oqa222" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="52px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label35" runat="server" Font-Bold="True" Font-Size="10pt" Text="原幣含稅售價"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa17" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label39" runat="server" Font-Bold="True" Font-Size="10pt" Text="本幣含稅售價"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa20" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="10pt" Text="幣別/匯率"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 117px">
                                                                            <asp:Label ID="FIELD_oqa08" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="34px"></asp:Label>/
                                                                            <asp:Label ID="FIELD_oqa09" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="45px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label36" runat="server" Font-Bold="True" Font-Size="10pt" Text="原幣總售價"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_sum" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="Red" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label40" runat="server" Font-Bold="True" Font-Size="10pt" Text="本幣總售價"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_sum1" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="Red" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label41" runat="server" Font-Bold="True" Font-Size="10pt" Text="訂金金額比率(%)"
                                                                                Width="110px"></asp:Label></td>
                                                                        <td style="width: 117px">
                                                                            <asp:Label ID="FIELD_ta_oqa031" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label44" runat="server" Font-Bold="True" Font-Size="10pt" Text="訂金金額"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa032" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label47" runat="server" Font-Bold="True" Font-Size="10pt" Text="訂金收款條件"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa033" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="40px"></asp:Label><asp:Label
                                                                                    ID="FIELD_ta_oqa034" runat="server" CssClass="NormalBold" Font-Bold="False" Font-Size="10pt"
                                                                                    ForeColor="DimGray" Height="5px" Style="text-align: left" Width="60px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="10pt" Text="出貨金額比率(%)"
                                                                                Width="110px"></asp:Label></td>
                                                                        <td style="width: 117px">
                                                                            <asp:Label ID="FIELD_ta_oqa061" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label45" runat="server" Font-Bold="True" Font-Size="10pt" Text="出貨金額"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa062" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label48" runat="server" Font-Bold="True" Font-Size="10pt" Text="出貨收款條件"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa063" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="40px"></asp:Label><asp:Label
                                                                                    ID="FIELD_ta_oqa064" runat="server" CssClass="NormalBold" Font-Bold="False" Font-Size="10pt"
                                                                                    ForeColor="DimGray" Height="5px" Style="text-align: left" Width="60px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label43" runat="server" Font-Bold="True" Font-Size="10pt" Text="驗收金額比率(%)"
                                                                                Width="110px"></asp:Label></td>
                                                                        <td style="width: 117px">
                                                                            <asp:Label ID="FIELD_ta_oqa071" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label46" runat="server" Font-Bold="True" Font-Size="10pt" Text="驗收金額"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa072" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="79px"></asp:Label></td>
                                                                        <td style="width: 65px; background-color: gainsboro">
                                                                            <asp:Label ID="Label49" runat="server" Font-Bold="True" Font-Size="10pt" Text="驗收收款條件"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td style="width: 119px">
                                                                            <asp:Label ID="FIELD_ta_oqa073" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="DimGray" Height="5px" Style="text-align: left" Width="40px"></asp:Label><asp:Label
                                                                                    ID="FIELD_ta_oqa074" runat="server" CssClass="NormalBold" Font-Bold="False" Font-Size="10pt"
                                                                                    ForeColor="DimGray" Height="5px" Style="text-align: left" Width="60px"></asp:Label></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 30%; vertical-align: top;">
                                                    <table border="0" style="border-right: goldenrod 1px solid; border-top: goldenrod 1px solid;
                                                        border-left: goldenrod 1px solid; width: 100%; border-bottom: goldenrod 1px solid;
                                                        height: 35%">
                                                        <tr>
                                                            <td style="width: 100%; height: 57px">
                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 7px">
                                                                    <tr>
                                                                        <td colspan="4" style="width: 100%; height: 7px; background-color: #ffcc66">
                                                                            <asp:Label ID="Label3a" runat="server" Font-Bold="True" Font-Size="11pt" Text="單身資料"></asp:Label></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                                    BorderColor="White" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1"
                                                                    Font-Size="Small" ForeColor="Black" GridLines="Vertical" Height="53px" PageSize="5"
                                                                    Width="100%">
                                                                    <RowStyle BorderColor="Black" Font-Size="Smaller" Height="5px" Wrap="False" />
                                                                    <EmptyDataRowStyle Wrap="False" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="oqb02" HeaderText="Item" meta:resourceKey="oqb02" SortExpression="oqb02" />
                                                                        <asp:BoundField DataField="oqb03" HeaderText="料號" meta:resourceKey="oqb03" SortExpression="oqb03" />
                                                                        <asp:BoundField DataField="oqb031" HeaderText="品名" meta:resourceKey="oqb031" SortExpression="oqb031" />
                                                                        <asp:BoundField DataField="oqb032" HeaderText="規格" meta:resourceKey="oqb032" SortExpression="oqb032" />
                                                                        <asp:BoundField DataField="oqb04" HeaderText="單位" meta:resourceKey="oqb04" SortExpression="oqb04" />
                                                                        <asp:BoundField DataField="oqb05" HeaderText="Qty" meta:resourceKey="oqb05" SortExpression="oqb05" />
                                                                        <asp:BoundField DataField="ta_oqb12" HeaderText="MOQ" meta:resourceKey="ta_oqb12"
                                                                            SortExpression="ta_oqb12" />
                                                                        <asp:BoundField DataField="ta_oqb13" HeaderText="RiskBuy" meta:resourceKey="ta_oqb13"
                                                                            SortExpression="ta_oqb13" />
                                                                        <asp:BoundField DataField="oqb07" HeaderText="幣別" meta:resourceKey="oqb07" SortExpression="oqb07" />
                                                                        <asp:BoundField DataField="oqb08" HeaderText="匯率" meta:resourceKey="oqb08" SortExpression="oqb08" />
                                                                        <asp:BoundField DataField="ta_oqb04" HeaderText="LT" meta:resourceKey="ta_oqb04"
                                                                            SortExpression="ta_oqb04" />
                                                                        <asp:BoundField DataField="ta_oqb02" HeaderText="付款條件" meta:resourceKey="ta_oqb02"
                                                                            SortExpression="ta_oqb02" />
                                                                        <asp:BoundField DataField="ta_oqb03" HeaderText="預估付款日" meta:resourceKey="ta_oqb03"
                                                                            SortExpression="ta_oqb03" />
                                                                        <asp:BoundField DataField="ta_oqb091" HeaderText="稅別" meta:resourceKey="ta_oqb091"
                                                                            SortExpression="ta_oqb091" />
                                                                        <asp:BoundField DataField="ta_oqb092" HeaderText="稅率" meta:resourceKey="ta_oqb092"
                                                                            SortExpression="ta_oqb092" />
                                                                        <asp:BoundField DataField="ta_oqb09" HeaderText="原幣未稅單價" meta:resourceKey="ta_oqb09"
                                                                            SortExpression="ta_oqb09" />
                                                                        <asp:BoundField DataField="oqb09" HeaderText="原幣成本單價" meta:resourceKey="oqb09" SortExpression="oqb09" />
                                                                        <asp:BoundField DataField="ta_oqb10" HeaderText="未稅單價" meta:resourceKey="ta_oqb10"
                                                                            SortExpression="ta_oqb10" />
                                                                        <asp:BoundField DataField="oqb10" HeaderText="成本單價" meta:resourceKey="oqb10" SortExpression="oqb10" />
                                                                        <asp:BoundField DataField="ta_oqb11" HeaderText="未稅金額" meta:resourceKey="ta_oqb11"
                                                                            SortExpression="ta_oqb11" />
                                                                        <asp:BoundField DataField="oqb11" HeaderText="成本金額" meta:resourceKey="oqb11" SortExpression="oqb11" />
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#CCCCCC" Wrap="False" />
                                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Wrap="False" />
                                                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" Wrap="False" />
                                                                    <HeaderStyle BackColor="DarkGray" Font-Bold="True" Font-Size="X-Small" ForeColor="Black"
                                                                        Height="5px" Wrap="True" />
                                                                    <EditRowStyle Wrap="False" />
                                                                    <AlternatingRowStyle BackColor="#CCCCCC" Wrap="False" />
                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>">
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table style="width: 100%; height: 120px">
                                                        <tr>
                                                            <td style="width: 30%">
                                                                <table border="0" style="border-right: goldenrod 1px solid; border-top: goldenrod 1px solid;
                                                                    border-left: goldenrod 1px solid; width: 100%; border-bottom: goldenrod 1px solid;
                                                                    height: 15%">
                                                                    <tr>
                                                                        <td style="width: 100%">
                                                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 9%">
                                                                                <tr>
                                                                                    <td colspan="4" style="width: 100%; height: 11px; background-color: #ffcc66">
                                                                                        <asp:Label ID="Label31b" runat="server" Font-Bold="True" Font-Size="11pt" Text="特別說明"></asp:Label></td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:Label ID="null1" runat="server" Font-Bold="True" Font-Size="11pt" Text="無" Visible="False"></asp:Label>
                                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
                                                                                SelectCommand="SELECT [oqe04] FROM [EIPB].[dbo].[CXMT310_IN_OQE]"></asp:SqlDataSource>
                                                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                                DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" ShowHeader="False">
                                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="oqe04" HeaderText="oqe04" SortExpression="oqe04">
                                                                                        <HeaderStyle Width="0px" />
                                                                                    </asp:BoundField>
                                                                                </Columns>
                                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                                <EditRowStyle BackColor="#999999" />
                                                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td style="font-size: 12pt; width: 30%">
                                                                <table border="0" style="border-right: goldenrod 1px solid; border-top: goldenrod 1px solid;
                                                                    border-left: goldenrod 1px solid; width: 100%; border-bottom: goldenrod 1px solid;
                                                                    height: 15%">
                                                                    <tr>
                                                                        <td style="width: 30%">
                                                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 8%">
                                                                                <tr>
                                                                                    <td colspan="6" style="height: 11px; background-color: #ffcc66">
                                                                                        <asp:Label ID="Label3c" runat="server" Font-Bold="True" Font-Size="11pt" Text="備註"></asp:Label></td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:Label ID="null2" runat="server" Font-Bold="True" Font-Size="11pt" Text="無" Visible="False"></asp:Label>
                                                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
                                                                                SelectCommand="SELECT [tc_oqe04] FROM eipb.dbo.[CXMT310_IN_TCOQE]"></asp:SqlDataSource>
                                                                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                                DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" ShowHeader="False">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="tc_oqe04" HeaderText="tc_oqe04" SortExpression="tc_oqe04">
                                                                                        <HeaderStyle Width="0px" />
                                                                                    </asp:BoundField>
                                                                                </Columns>
                                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                                <EditRowStyle BackColor="#999999" />
                                                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td style="font-size: 12pt; vertical-align: top; width: 40%; text-align: right">
                                                                <table border="0" style="width: 323px; height: 116px">
                                                                    <tr>
                                                                        <td colspan="3" style="background-color: firebrick">
                                                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="11pt" ForeColor="White"
                                                                                Text="報價分析"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 27px">
                                                                        </td>
                                                                        <td style="width: 80px">
                                                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="11pt" Text="材料金額"></asp:Label></td>
                                                                        <td style="width: 100px; text-align: right">
                                                                            <asp:Label ID="FIELD_oqa13" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="Red" Height="5px" Style="text-align: right" Width="60px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 27px; text-align: center">
                                                                            +</td>
                                                                        <td style="width: 80px">
                                                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="11pt" Text="人工金額"></asp:Label></td>
                                                                        <td style="width: 100px; text-align: right">
                                                                            <asp:Label ID="FIELD_oqa14" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="Red" Height="5px" Style="text-align: right" Width="60px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 27px; text-align: center">
                                                                            +</td>
                                                                        <td style="width: 80px">
                                                                            <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="11pt" Text="製費金額"></asp:Label></td>
                                                                        <td style="width: 100px; text-align: right">
                                                                            <asp:Label ID="FIELD_oqa15" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="Red" Height="5px" Style="text-align: right" Width="60px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 27px; text-align: center">
                                                                            +</td>
                                                                        <td style="width: 80px">
                                                                            <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="11pt" Text="其它費用"></asp:Label></td>
                                                                        <td style="width: 100px; text-align: right">
                                                                            <asp:Label ID="FIELD_oqa16" runat="server" CssClass="NormalBold" Font-Bold="False"
                                                                                Font-Size="10pt" ForeColor="Red" Height="5px" Style="text-align: right" Width="60px"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3" style="height: 3px">
                                                                            <hr style="color: #000000" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 27px; height: 21px; text-align: center">
                                                                            =</td>
                                                                        <td style="width: 80px; height: 21px">
                                                                            <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"
                                                                                Text="總估價金額" Width="87px"></asp:Label></td>
                                                                        <td style="width: 100px; height: 21px; text-align: right">
                                                                            <asp:Label ID="FIELD_oqa17" runat="server" CssClass="NormalBold" Font-Bold="True"
                                                                                Font-Size="Medium" ForeColor="Red" Height="5px" Style="text-align: left" Width="60px"></asp:Label></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="font-family: Times New Roman">
                                </tr>
                                <tr style="font-family: Times New Roman">
                                </tr>
                                <tr style="font-family: Times New Roman">
                                </tr>
                                <tr style="font-family: Times New Roman">
                                </tr>
                                <tr style="font-family: Times New Roman">
                                </tr>
                            </table>
                            <br />
                            <table style="font-family: Times New Roman" width="100%">
                                <tr>
                                    <td colspan="6" style="height: 9px; background-color: slategray; text-align: center">
                                        &nbsp;<asp:Image ID="Image2" runat="server" Height="22px" ImageUrl="~/ERP_CXMT310/img/paperclip.png"
                                            Width="23px" />
                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Names="新細明體" Font-Size="11pt"
                                            ForeColor="MintCream" meta:resourcekey="Label29Resource1" Text="附&nbsp;加&nbsp;檔&nbsp;案"
                                            Width="82px"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="height: 51px; text-align: left">
                                        <p id="uploadfiles">
                                            <asp:Label ID="null3" runat="server" Font-Bold="True" Font-Size="11pt" Text="無"></asp:Label>
                                            <asp:CheckBoxList ID="CheckBoxFile" runat="server" Font-Size="X-Small">
                                            </asp:CheckBoxList>&nbsp;</p>
                                    </td>
                                </tr>
                            </table>
                            <table style="font-family: Times New Roman" width="100%">
                                <tr>
                                    <td colspan="4" style="vertical-align: top; height: 12px; text-align: left">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
 <table border="0" Class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="Normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" OnFlowStop="FlowFeedback1_FlowStop" RedirectAfterCommit="False">
                    <Results>
<SmoothEnterpriseWebControlFlowwork:FlowResult runat="server" Text="同意" ResultType="Next" ID="flowResult1" meta:resourcekey="flowResult1Resource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>
<SmoothEnterpriseWebControlFlowwork:FlowResult runat="server" Text="退回(退至上一關) " ResultType="Back" ID="flowResult2" meta:resourcekey="flowResult2Resource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>
<SmoothEnterpriseWebControlFlowwork:FlowResult ID="FlowResult3" runat="server" Text="退回(退至提案人)  " ResultType="Return" meta:resourcekey="FlowResultResource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>

                    </Results>
                    <ReplyTemplate>
                        請輸入簽核意見：<br />
                        <SmoothEnterpriseWebControl:InputText ID="Input_Comment" runat="server" BackColor="#F0F0F0"
                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                            ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                            IsValid="True" meta:resourcekey="Input_CommentResource1" OnClickMore="" Personalize="False"
                            Required="False" Width="500px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <SmoothEnterpriseWebControl:InputText ID="InputText3" runat="server" BackColor="#F0F0F0"
                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                            ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                            IsValid="True" meta:resourcekey="InputText3Resource1" OnClickMore="" Personalize="False"
                            Required="False" Visible="False">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <asp:Button ID="BUTTON_FlowFeedback" runat="server" CssClass="NormalBold" meta:resourcekey="BUTTON_FlowFeedbackResource1"
                            OnClick="BUTTON_FlowFeedback_Click" Text="送出" Width="80px" />
                    </ReplyTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedback>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                    <Columns>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" CustomKey="" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                    </Columns>
                    <HistoryTemplate>
                        &nbsp;<SmoothEnterpriseWebControl:InputText ID="Show_Comment" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" Width="400px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText><asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1" />
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
	<table border="0" Class="Normal">
		<tr>
			<td style="width: 235px">
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="Print1" runat="server" Text="機台報價單列印" width="103px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="Print1_Click" Enabled="False">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" Text="Exp" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton1_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="InputButton1_Click" />
			</td>
		</tr>
	</table>
</asp:Content>