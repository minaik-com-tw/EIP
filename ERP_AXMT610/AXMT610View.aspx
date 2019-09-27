<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="AXMT610View.aspx.cs" Inherits="ERP_AXMT610.AXMT610View" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/sub.js")%>"></script>
    <script>

        var allowed_attachments = 5 - 1;
        var count_attachments = 0 + 1;
        function addfile() {

            if (allowed_attachments <= 0) {
                return false;
            }
            else {
                count_attachments = count_attachments + 1;
                var attid = "InputFile" + count_attachments;
                //alert(attid);

                //var uploadfiles=document.getElementById("uploadfiles"),
                str = '<SmoothEnterpriseWebControl:InputFile runat="server" onchange="addfile()" BackColor="#F0F0F0" CssClass="Normal"> <Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputFile><br />';
                document.getElementById('uploadfiles').insertAdjacentHTML("beforeEnd", str)
                //uploadfiles.innerHTML+=str;
                allowed_attachments = allowed_attachments - 1;

                return false;
            }
        }

    </script>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
        Caption="AXMT610 View Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table>
        <tr>
            <td style="width: 1000px; height: 30px">
                <center>
                    <asp:Image ID="Image1" runat="server" Height="29px" ImageUrl="~/ERP_AXMT610/minaik.gif"
                        Width="32px" meta:resourcekey="Image1Resource1" />
                    <asp:Label ID="FIELD_companyname" runat="server" Font-Bold="True" Font-Names="新細明體"
                        Text="Label" meta:resourcekey="FIELD_companynameResource1"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td style="width: 1000px; height: 40px">
                <center>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="新細明體" Text="信用放行申請單" meta:resourcekey="Label6Resource1"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_programid" runat="server" CssClass="PanelWhite"
                    ForeColor="Red" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_programidResource1" OnClickMore="" Personalize="False" Required="False" Visible="False">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText>
            </td>
        </tr>
        <tr>
            <td style="width: 1000px">
                <table border="1" bordercolor="gainsboro" cellpadding="0" cellspacing="0" style="width: 1000px; border-collapse: collapse">
                    <tr>
                        <td style="height: 20px; background-color: whitesmoke">
                            <asp:Label ID="Label19" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="WhiteSmoke"
                                Height="10px" Text="*" Width="6px" meta:resourcekey="Label19Resource1"></asp:Label>
                            <asp:Label ID="Label9" runat="server" CssClass="NormalBold" Text="E  R  P    資   訊" meta:resourcekey="Label9Resource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 981px; height: 170px">
                                <tr>
                                    <td style="width: 19px; height: 10px"></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Font-Bold="False" meta:resourcekey="Label1Resource1"
                                            Text="單號編號"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_no" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pmk04" runat="server" CssClass="NormalBold" Font-Bold="False"
                                            meta:resourcekey="LABEL_pmk04Resource1" Text="出通/出貨日期"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_oga02" runat="server" CssClass="PanelWhite"
                                            FormatType="DateTime" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="LABEL_pmc03" runat="server" CssClass="NormalBold" Font-Bold="False"
                                            meta:resourcekey="LABEL_pmc03Resource1" Text="客戶"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_occ02_0" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="66px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_oga03"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="66px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 10px"></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pmk01" runat="server" CssClass="NormalBold" Font-Bold="False"
                                            meta:resourcekey="LABEL_pmk01Resource1" Text="出通/出貨單號"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_oga01" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pma02_8" runat="server" CssClass="NormalBold" Font-Bold="False"
                                            meta:resourcekey="LABEL_pma02_8Resource1" Text="版次"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_no_order" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="Label13" runat="server" CssClass="NormalBold" Font-Bold="False" meta:resourcekey="Label13Resource1"
                                            Text="送貨客戶"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_occ02_1" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="66px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_oga04"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="66px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 10px"></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label12" runat="server" CssClass="NormalBold" Font-Bold="False" meta:resourcekey="Label12Resource1"
                                            Text="廠區"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_plantid" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pmk21" runat="server" CssClass="NormalBold" Font-Bold="False"
                                            Text="INV"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_oga27" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="LABEL_pme031_1" runat="server" CssClass="NormalBold" Font-Bold="False"
                                            meta:resourcekey="LABEL_pme031_1Resource1" Text="原幣出貨金額"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_oga23"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True"
                                            Width="44px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_oga50" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="87px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 10px"></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_gen02_3" runat="server" CssClass="NormalBold" Font-Bold="False"
                                            meta:resourcekey="LABEL_gen02_3Resource1" Text="業務人員"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_oga14" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="66px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_gen02_4"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="66px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_gem02_4" runat="server" CssClass="NormalBold" Font-Bold="False"
                                            meta:resourcekey="LABEL_gem02_4Resource1" Text="業務部門"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_gem02_3" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="66px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_oga15"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="66px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="Label4" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="Black"
                                            meta:resourcekey="Label4Resource1" Text="額度幣別"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_curr" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 10px"></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Font-Bold="False" meta:resourcekey="Label2Resource1"
                                            Text="單據狀態"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_status" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_l_amt2" runat="server" CssClass="NormalBold" Font-Bold="False"
                                            ForeColor="Black" meta:resourcekey="LABEL_l_amt2Resource1" Text="信用餘額"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_bal" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="LABEL_l_amt1" runat="server" CssClass="NormalBold" Font-Bold="False"
                                            ForeColor="Black" meta:resourcekey="LABEL_l_amt1Resource1" Text="信用額度"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_tot" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 10px"></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="Red"
                                            meta:resourcekey="Label3Resource1" Text="<=30天逾期"></asp:Label><asp:Label ID="Label7"
                                                runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="Red" meta:resourcekey="Label7Resource1"
                                                Text="應收帳款"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_l_amt01" runat="server" CssClass="PanelWhite"
                                            ForeColor="Red" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label5" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="Red"
                                            meta:resourcekey="Label5Resource1" Text=">30天逾期"></asp:Label><asp:Label ID="Label8"
                                                runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="Red" meta:resourcekey="Label8Resource1"
                                                Text="應收帳款"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_l_amt02" runat="server" CssClass="PanelWhite"
                                            ForeColor="Red" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="Label30" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="Red"
                                            meta:resourcekey="Label40Resource1" Text="未逾期"></asp:Label><br />
                                        <asp:Label ID="Label32" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="Red"
                                            meta:resourcekey="Label8Resource1" Text="應收帳款"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_l_amt03" runat="server" CssClass="PanelWhite"
                                            ForeColor="Red" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: whitesmoke">
                            <asp:Label ID="Label11" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                Height="10px" Text="*" Width="6px" meta:resourcekey="Label11Resource1"></asp:Label>
                            <asp:Label ID="Label10" runat="server" CssClass="NormalBold" Text="信 用 放 行 維 護" meta:resourcekey="Label10Resource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: white">
                            <asp:Label ID="Label29" runat="server" CssClass="NormalBold" Font-Size="10pt" ForeColor="Black"
                                Height="10px" Text="*" Width="6px" meta:resourcekey="Label29Resource1"></asp:Label><asp:Label ID="Label18" runat="server"
                                    CssClass="NormalBold" Font-Bold="False" Text="申請人維護" meta:resourcekey="Label18Resource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: white">
                            <table>
                                <tr>
                                    <td style="width: 19px; height: 25px"></td>
                                    <td style="width: 118px; height: 25px">
                                        <asp:Label ID="Label20" runat="server" CssClass="NormalBold" Font-Bold="False" Text="信用額度超限原因" meta:resourcekey="Label20Resource1"></asp:Label></td>
                                    <td colspan="7" style="height: 25px">
                                        <SmoothEnterpriseWebControl:InputText
                                            ID="FIELD_reason_user2" runat="server" BackColor="#F0F0F0" ButtonClick="True"
                                            ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                            ErrorMessage="Please Input「MATTER」!!" FocusColor="" FormatType="None" HiddenMode="False"
                                            HTMLMode="Advance" IsValid="True" MaxLength="100" meta:resourcekey="FIELD_MATTERResource1"
                                            OnClickMore="" Personalize="False" Required="False" Width="279px" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 25px"></td>
                                    <td style="width: 118px; height: 25px">
                                        <asp:Label ID="Label21" runat="server" CssClass="NormalBold" Font-Bold="False" Text="改善方案" meta:resourcekey="Label21Resource1"></asp:Label></td>
                                    <td colspan="7" style="height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Improve_user2" runat="server" BackColor="#F0F0F0"
                                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                            ErrorMessage="Please Input「MATTER」!!" FocusColor="" FormatType="None" HiddenMode="False"
                                            HTMLMode="Advance" IsValid="True" MaxLength="100" meta:resourcekey="FIELD_MATTERResource1"
                                            OnClickMore="" Personalize="False" Required="False" Width="279px" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 22px"></td>
                                    <td style="width: 118px; height: 22px">
                                        <asp:Label ID="Label22" runat="server" CssClass="NormalBold" Font-Bold="False" Text="備註" meta:resourcekey="Label22Resource1"></asp:Label></td>
                                    <td colspan="7" style="height: 22px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Annotate_user" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" Width="402px" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_Annotate_userResource1" OnClickMore="" Personalize="False" Required="False">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 19px"></td>
                                    <td style="width: 118px">
                                        <asp:Label ID="Label23" runat="server" CssClass="NormalBold" Font-Bold="False" Text="夾帶檔案" meta:resourcekey="Label23Resource1"></asp:Label></td>
                                    <td colspan="7">
                                        <p>
                                            <asp:CheckBoxList ID="CheckBoxFile" runat="server" Font-Size="X-Small" meta:resourcekey="CheckBoxFileResource1">
                                            </asp:CheckBoxList>
                                            <SmoothEnterpriseWebControl:InputFile ID="attach1" runat="server" BackColor="#F0F0F0"
                                                CssClass="Normal" onchange="addfile()" Visible="False" meta:resourcekey="attach1Resource1">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputFile>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 25px"></td>
                                    <td style="width: 118px; height: 25px"></td>
                                    <td style="width: 145px; height: 25px"></td>
                                    <td style="width: 100px; height: 25px"></td>
                                    <td style="width: 145px; height: 25px"></td>
                                    <td style="width: 100px; height: 25px"></td>
                                    <td style="width: 145px; height: 25px"></td>
                                    <td style="width: 81px; height: 25px"></td>
                                    <td style="width: 157px; height: 25px"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: white">
                            <asp:Label ID="Label31" runat="server" CssClass="NormalBold" Font-Size="10pt" ForeColor="Black"
                                Height="10px" Text="*" Width="6px" meta:resourcekey="Label31Resource1"></asp:Label><asp:Label ID="Label24" runat="server"
                                    CssClass="NormalBold" Font-Bold="False" Text="來源廠業務維護" meta:resourcekey="Label24Resource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: white">
                            <table>
                                <tr>
                                    <td style="width: 19px; height: 25px"></td>
                                    <td style="width: 118px; height: 25px">
                                        <asp:Label ID="Label25" runat="server" CssClass="NormalBold" Font-Bold="False" Text="信用額度超限原因" meta:resourcekey="Label25Resource1"></asp:Label></td>
                                    <td colspan="7" style="height: 25px">
                                        <asp:RadioButton ID="RadioButton3" runat="server" Checked="True" Font-Bold="False"
                                            Font-Size="8pt" ForeColor="Black" GroupName="selrads" Text="選取超限原因" Width="130px" meta:resourcekey="RadioButton3Resource1" />
                                        <SmoothEnterpriseWebControl:InputSelect ID="FIELD_reason_sales" runat="server" BackColor="#F0F0F0"
                                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" Editable="False" EnabledHTC="True"
                                            ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl=""
                                            ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemAll-Value="%"
                                            ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                                            ItemNone-Text="" ListPosition="Vertical" Mode="Single" TextBoxStyle="ThreeDStyle"
                                            Value="System.Data.SqlClient" Width="279px" meta:resourcekey="FIELD_reason_salesResource1">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControl:InputSelect>
                                        <br />
                                        <asp:RadioButton ID="RadioButton4" runat="server" Font-Bold="False" Font-Size="8pt"
                                            ForeColor="Black" GroupName="selrads" Text="自定超限原因" Width="130px" meta:resourcekey="RadioButton4Resource1" />&nbsp;<SmoothEnterpriseWebControl:InputText
                                                ID="FIELD_reason_sales2" runat="server" BackColor="#F0F0F0" ButtonClick="True"
                                                ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                                ErrorMessage="Please Input「MATTER」!!" FocusColor="" FormatType="None" HiddenMode="False"
                                                HTMLMode="Advance" IsValid="True" MaxLength="100" meta:resourcekey="FIELD_MATTERResource1"
                                                OnClickMore="" Personalize="False" Required="False" Width="279px">
                                                <ErrorStyle BorderStyle="NotSet" />
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 25px"></td>
                                    <td style="width: 118px; height: 25px">
                                        <asp:Label ID="Label26" runat="server" CssClass="NormalBold" Font-Bold="False" Text="改善方案" meta:resourcekey="Label26Resource1"></asp:Label></td>
                                    <td colspan="7" style="height: 25px">
                                        <asp:RadioButton ID="RadioButton5" runat="server" Checked="True" Font-Bold="False"
                                            Font-Size="8pt" ForeColor="Black" GroupName="selrads2" Text="選取改善方案" Width="130px" meta:resourcekey="RadioButton5Resource1" />
                                        <SmoothEnterpriseWebControl:InputSelect ID="FIELD_Improve_sales" runat="server" BackColor="#F0F0F0"
                                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" Editable="False" EnabledHTC="True"
                                            ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl=""
                                            ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemAll-Value="%"
                                            ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                                            ItemNone-Text="" ListPosition="Vertical" Mode="Single" TextBoxStyle="ThreeDStyle"
                                            Value="System.Data.SqlClient" Width="279px" meta:resourcekey="FIELD_Improve_salesResource1">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect>
                                        <br />
                                        <asp:RadioButton ID="RadioButton6" runat="server" Font-Bold="False" Font-Size="8pt"
                                            ForeColor="Black" GroupName="selrads2" Text="自定改善方案" Width="130px" meta:resourcekey="RadioButton6Resource1" />
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Improve_sales2" runat="server" BackColor="#F0F0F0"
                                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                            ErrorMessage="Please Input「MATTER」!!" FocusColor="" FormatType="None" HiddenMode="False"
                                            HTMLMode="Advance" IsValid="True" MaxLength="100" meta:resourcekey="FIELD_MATTERResource1"
                                            OnClickMore="" Personalize="False" Required="False" Width="279px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 22px"></td>
                                    <td style="width: 118px; height: 22px">
                                        <asp:Label ID="Label27" runat="server" CssClass="NormalBold" Font-Bold="False" Text="備註" meta:resourcekey="Label27Resource1"></asp:Label></td>
                                    <td colspan="7" style="height: 22px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Annotate_sales" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" Width="402px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_Annotate_salesResource1" OnClickMore="" Personalize="False" Required="False">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 19px"></td>
                                    <td style="width: 118px">
                                        <asp:Label ID="Label28" runat="server" CssClass="NormalBold" Font-Bold="False" Text="夾帶檔案" meta:resourcekey="Label28Resource1"></asp:Label></td>
                                    <td colspan="7" id="uploadfiles">
                                        <asp:CheckBoxList ID="CheckBoxFile1" runat="server" Font-Size="X-Small" meta:resourcekey="CheckBoxFile1Resource1">
                                        </asp:CheckBoxList><SmoothEnterpriseWebControl:InputFile ID="InputFile1" onchange="addfile()" runat="server" BackColor="#F0F0F0" CssClass="Normal">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputFile>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 25px"></td>
                                    <td style="width: 118px; height: 25px"></td>
                                    <td style="width: 145px; height: 25px"></td>
                                    <td style="width: 100px; height: 25px"></td>
                                    <td style="width: 145px; height: 25px"></td>
                                    <td style="width: 100px; height: 25px"></td>
                                    <td style="width: 145px; height: 25px"></td>
                                    <td style="width: 81px; height: 25px"></td>
                                    <td style="width: 157px; height: 25px"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 25px"></td>
        </tr>
    </table>
    <table border="0" class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="Normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" OnOnLoadHistory="FlowFeedback1_OnLoadHistory" OnFlowStop="FlowFeedback1_FlowStop" MessageLabel="" meta:resourcekey="FlowFeedback1Resource1" NextNodeLabel="" PriorityLabel="" RedirectURL="" ResultLabel="" Text="" RedirectAfterCommit="False">
                    <Results>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult runat="server" Text="同意" ResultType="Next" ID="flowResult1" meta:resourcekey="flowResult1Resource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult runat="server" Text="退回(退至上一關) " ResultType="Back" ID="flowResult2" meta:resourcekey="flowResult2Resource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult runat="server" Text="退回(退至提案人)  " ResultType="Return" meta:resourcekey="FlowResultResource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                    </Results>
                    <ReplyTemplate>
                        請輸入簽核意見：<br />
                        <SmoothEnterpriseWebControl:InputText ID="Input_Comment" runat="server" meta:resourcekey="Input_CommentResource1" Width="500px" BackColor="#F0F0F0" CssClass="Normal" OnClickMore="" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FormatType="None" ButtonClick="True" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" Personalize="False" Required="False">
                            <ErrorStyle BorderStyle="NotSet" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <SmoothEnterpriseWebControl:InputText ID="InputText3" runat="server" meta:resourcekey="InputText3Resource1" BackColor="#F0F0F0" CssClass="Normal" OnClickMore="" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FormatType="None" ButtonClick="True" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" Personalize="False" Required="False" Visible="False">
                            <ErrorStyle BorderStyle="NotSet" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <asp:Button ID="BUTTON_FlowFeedback" OnClick="BUTTON_FlowFeedback_Click" runat="server" Width="80px" CssClass="NormalBold" Text="送出" meta:resourcekey="BUTTON_FlowFeedbackResource1"></asp:Button>
                    </ReplyTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedback>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory" meta:resourcekey="FlowFeedbackViewer1Resource1" RequestURL="">
                    <Columns>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                    </Columns>
                    <HistoryTemplate>
                        <SmoothEnterpriseWebControl:InputText ID="Show_Comment" runat="server" Width="400px" BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="Show_CommentResource1" OnClickMore="" Personalize="False" Required="False">
                            <ErrorStyle BorderStyle="NotSet" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText><asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1"></asp:Image>
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
    <table border="0" class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="PRINT" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="PRINT_Click" Text="PRINT"
                    Width="80px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="bno,plantid"
        DataSourceID="SqlDataSource1" Font-Size="Smaller" ForeColor="Black" GridLines="Vertical"
        Height="53px" PageSize="5" Width="1000px" meta:resourcekey="GridView1Resource1" Visible="False">
        <RowStyle BorderColor="Black" Font-Size="Smaller" Height="5px" Wrap="False" />
        <Columns>
            <asp:BoundField DataField="ogb31" HeaderText="訂單號碼" SortExpression="ogb31" meta:resourcekey="BoundFieldResource1">
                <HeaderStyle Wrap="True" />
                <ItemStyle Wrap="True" />
            </asp:BoundField>
            <asp:BoundField DataField="ogb32" HeaderText="項次" ReadOnly="True" SortExpression="ogb32" meta:resourcekey="BoundFieldResource2" />
            <asp:BoundField DataField="ogb04" HeaderText="產品編號" SortExpression="ogb04" meta:resourcekey="BoundFieldResource3">
                <HeaderStyle Wrap="True" />
                <ItemStyle Wrap="True" />
            </asp:BoundField>
            <asp:BoundField DataField="ogb06" HeaderText="品名" SortExpression="ogb06" meta:resourcekey="BoundFieldResource4">
                <HeaderStyle ForeColor="White" Wrap="True" />
                <ItemStyle Wrap="True" />
                <FooterStyle ForeColor="Red" />
            </asp:BoundField>
            <asp:BoundField DataField="ima021" HeaderText="規格" SortExpression="ima021" meta:resourcekey="BoundFieldResource5">
                <HeaderStyle ForeColor="White" Wrap="False" />
                <ItemStyle Wrap="False" />
                <FooterStyle ForeColor="Red" />
            </asp:BoundField>
            <asp:BoundField DataField="ogb05" HeaderText="單位" SortExpression="ogb05" meta:resourcekey="BoundFieldResource6">
                <HeaderStyle ForeColor="White" Wrap="False" />
                <ItemStyle Wrap="False" />
                <FooterStyle ForeColor="Red" />
            </asp:BoundField>
            <asp:BoundField DataField="ogb12" HeaderText="數量" SortExpression="ogb12" meta:resourcekey="BoundFieldResource7">
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" Wrap="False" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Wrap="False" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" Wrap="False" />
        <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="X-Small" ForeColor="White"
            Height="5px" Wrap="True" />
        <AlternatingRowStyle BackColor="#CCCCCC" Wrap="False" />
        <EmptyDataRowStyle Wrap="False" />
        <EditRowStyle Wrap="False" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
        SelectCommand="select plantid,bno,ogb31,ogb32,ogb04,ogb06,ima021,ogb05,ogb12 from AXMT610_IN_BODY"></asp:SqlDataSource>
    <SmoothEnterpriseWebControl:InputText ID="FIELD_oga21" runat="server" CssClass="PanelWhite"
        ForeColor="Black" ReadOnly="True" Visible="False" Width="66px">
        <ErrorStyle BorderStyle="NotSet" CssClass="" />
        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
    </SmoothEnterpriseWebControl:InputText><asp:Label ID="Label15" runat="server" CssClass="NormalBold"
        Font-Bold="False" meta:resourcekey="Label15Resource1" Text="收款客戶" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText
            ID="FIELD_occ02_2" runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True"
            Visible="False" Width="66px">
            <ErrorStyle BorderStyle="NotSet" />
            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_oga18"
            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Visible="False"
            Width="66px">
            <ErrorStyle BorderStyle="NotSet" CssClass="" />
            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
        </SmoothEnterpriseWebControl:InputText><asp:Label ID="Label16" runat="server" CssClass="NormalBold"
            Font-Bold="False" ForeColor="Black" meta:resourcekey="Label16Resource1" Text="超限原因"
            Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_oga902"
                runat="server" CssClass="PanelWhite" ForeColor="Red" ReadOnly="True" Visible="False">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><asp:Label ID="LABEL_pmk22" runat="server"
                CssClass="NormalBold" Font-Bold="False" meta:resourcekey="LABEL_pmk22Resource1"
                Text="幣別匯率" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_oga24"
                    runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Visible="False"
                    Width="66px">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText><asp:Label ID="Label17" runat="server" CssClass="NormalBold"
                    Font-Bold="False" meta:resourcekey="Label17Resource1" Text="稅別稅率" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText
                        ID="FIELD_oga211" runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True"
                        Visible="False" Width="66px">
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    </SmoothEnterpriseWebControl:InputText><asp:Label ID="LABEL_pmk02" runat="server"
                        CssClass="NormalBold" Font-Bold="False" meta:resourcekey="LABEL_pmk02Resource1"
                        Text="出貨類別" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_oga00"
                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Visible="False">
                            <ErrorStyle BorderStyle="NotSet" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText><asp:Label ID="Label14" runat="server" CssClass="NormalBold"
                            Font-Bold="False" meta:resourcekey="Label14Resource1" Text="送貨地址" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText
                                ID="FIELD_addr" runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True"
                                Visible="False">
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText><asp:Label ID="LABEL_oah02_9" runat="server"
                                CssClass="NormalBold" Font-Bold="False" meta:resourcekey="LABEL_oah02_9Resource1"
                                Text="訂單單號" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_oga16"
                                    runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Visible="False">
                                    <ErrorStyle BorderStyle="NotSet" />
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
    <asp:Button ID="btn_export" runat="server"  Text ="export xml"  OnClick="btn_export_Click" Visible="false" />
</asp:Content>