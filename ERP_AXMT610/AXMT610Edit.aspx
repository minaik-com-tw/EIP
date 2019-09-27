<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="AXMT610Edit.aspx.cs" Inherits="ERP_AXMT610.AXMT610Edit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="SmoothEnterpriseControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript"  type="text/javascript" src="<%=ResolveClientUrl("~/sub.js")%>"></script>
    <script language="javascript"  type="text/javascript"">
         
          var allowed_attachments = 5 - 1;
		  var count_attachments = 0 + 1;
		  function addfile()
         {
		  
		    if (allowed_attachments <= 0)
		    {
		        return false;
		    }
		    else
		    {		    
		        count_attachments = count_attachments + 1 ;
		        var attid = "attach"+count_attachments;
                //alert(attid);
		  
                //var uploadfiles=document.getElementById("uploadfiles"),
　　　　        str = '<SmoothEnterpriseWebControl:InputFile runat="server" onchange="addfile()" BackColor="#F0F0F0" CssClass="Normal"> <Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputFile><br />';
　　　　        document.getElementById('uploadfiles').insertAdjacentHTML("beforeEnd",str)
                //uploadfiles.innerHTML+=str;
                allowed_attachments = allowed_attachments - 1;
            
                return false;
            }    
         }
         
</script>  

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>

    <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="AXMT610 Edit Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table>
        <tr>
            <td style="width: 1000px; height: 30px;"><center>
                <asp:Image ID="Image1" runat="server" Height="29px" ImageUrl="~/ERP_AXMT610/minaik.gif"
                    Width="32px" />
                <asp:Label ID="FIELD_companyname" runat="server" Font-Bold="True" Font-Names="新細明體"
                    Text="Label"></asp:Label></center></td>
        </tr>
        <tr>
            <td style="width: 1000px; height: 40px;">
                   <center> <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="新細明體" Text="信用放行申請單" meta:resourcekey="Label6Resource1"></asp:Label></center></td>
        </tr>
        <tr>
            <td ><SmoothEnterpriseWebControl:InputText ID="FIELD_programid" runat="server" CssClass="PanelWhite"
                    ForeColor="Red" ReadOnly="True" Visible="False">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr>
            <td style="width: 1000px;">
                <table border="1"   cellpadding="0" cellspacing="0" style="width: 1000px;border-collapse: collapse"     bordercolor="gainsboro" >
                    <tr>
                        <td style="height: 20px; background-color: whitesmoke">
                            <asp:Label ID="Label19" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="whitesmoke"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label9" runat="server" CssClass="NormalBold" Text="E  R  P    資   訊" meta:resourcekey="Label9Resource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 76px" >
    <table style="width: 981px; height: 170px">
        <tr>
            <td style="width: 19px; height: 10px;">
            </td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="單號編號" Font-Bold="False" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="width: 145px; height: 10px;">
                <SmoothEnterpriseWebControl:InputText ID="FIELD_no" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="LABEL_pmk04" runat="server" CssClass="NormalBold" Text="出通/出貨日期" Font-Bold="False" meta:resourcekey="LABEL_pmk04Resource1"></asp:Label></td>
            <td style="width: 145px; height: 10px;">
                <SmoothEnterpriseWebControl:InputText ID="FIELD_oga02" runat="server" CssClass="PanelWhite"
                    FormatType="DateTime" ReadOnly="True">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 109px; height: 10px;">
                <asp:Label ID="LABEL_pmc03" runat="server" CssClass="NormalBold" Text="客戶" meta:resourcekey="LABEL_pmc03Resource1" Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;"><SmoothEnterpriseWebControl:InputText ID="FIELD_occ02_0" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_oga03" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr>
            <td style="width: 19px; height: 10px;">
            </td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="LABEL_pmk01" runat="server" CssClass="NormalBold" Text="出通/出貨單號" meta:resourcekey="LABEL_pmk01Resource1" Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;"><SmoothEnterpriseWebControl:InputText ID="FIELD_oga01" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="LABEL_pma02_8" runat="server" CssClass="NormalBold" Text="版次" meta:resourcekey="LABEL_pma02_8Resource1" Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;"><SmoothEnterpriseWebControl:InputText ID="FIELD_no_order" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 109px; height: 10px;">
                <asp:Label ID="Label13" runat="server" CssClass="NormalBold" Font-Bold="False" Text="送貨客戶" meta:resourcekey="Label13Resource1"></asp:Label></td>
            <td style="width: 145px; height: 10px;"><SmoothEnterpriseWebControl:InputText ID="FIELD_occ02_1" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_oga04" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr>
            <td style="width: 19px; height: 10px;">
            </td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="Label12" runat="server" CssClass="NormalBold" Font-Bold="False" Text="廠區" meta:resourcekey="Label12Resource1"></asp:Label></td>
            <td style="width: 145px; height: 10px;"><SmoothEnterpriseWebControl:InputText ID="FIELD_plantid" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="LABEL_pmk21" runat="server" CssClass="NormalBold" Text="INV"  Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;"><SmoothEnterpriseWebControl:InputText ID="FIELD_oga27" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 109px; height: 10px;">
                <asp:Label ID="LABEL_pme031_1" runat="server" CssClass="NormalBold" Text="原幣出貨金額" meta:resourcekey="LABEL_pme031_1Resource1" Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;"><SmoothEnterpriseWebControl:InputText ID="FIELD_oga23" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="39px">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_oga50" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="92px">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr>
            <td style="width: 19px; height: 10px;">
            </td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="LABEL_gen02_3" runat="server" CssClass="NormalBold" Text="業務人員" Font-Bold="False" meta:resourcekey="LABEL_gen02_3Resource1"></asp:Label></td>
            <td style="width: 145px; height: 10px;"><SmoothEnterpriseWebControl:InputText ID="FIELD_oga14" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_gen02_4" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="LABEL_gem02_4" runat="server" CssClass="NormalBold" Text="業務部門" meta:resourcekey="LABEL_gem02_4Resource1" Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;">
                <SmoothEnterpriseWebControl:InputText ID="FIELD_gem02_3" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_oga15" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 109px; height: 10px;">
                <asp:Label ID="Label4" runat="server" CssClass="NormalBold" ForeColor="Black" Text="額度幣別" meta:resourcekey="Label4Resource1" Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;"><SmoothEnterpriseWebControl:InputText ID="FIELD_curr" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr>
            <td style="width: 19px; height: 10px;">
            </td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="單據狀態" meta:resourcekey="Label2Resource1" Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;">
                <SmoothEnterpriseWebControl:InputText ID="FIELD_status" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="LABEL_l_amt2" runat="server" CssClass="NormalBold" ForeColor="Black"
                    Text="信用餘額" meta:resourcekey="LABEL_l_amt2Resource1" Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;">
                <SmoothEnterpriseWebControl:InputText ID="FIELD_bal" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True"><ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 109px; height: 10px;">
                <asp:Label ID="LABEL_l_amt1" runat="server" CssClass="NormalBold" ForeColor="Black"
                    Text="信用額度" Font-Bold="False" meta:resourcekey="LABEL_l_amt1Resource1"></asp:Label></td>
            <td style="width: 145px; height: 10px;">
                <SmoothEnterpriseWebControl:InputText ID="FIELD_tot" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr>
            <td style="width: 19px; height: 10px;">
            </td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="Label3" runat="server" CssClass="NormalBold" ForeColor="Red" Text="<=30天逾期" meta:resourcekey="Label3Resource1" Font-Bold="False"></asp:Label><asp:Label ID="Label7" runat="server" CssClass="NormalBold" ForeColor="Red" Text="應收帳款" meta:resourcekey="Label7Resource1" Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;">
                <SmoothEnterpriseWebControl:InputText ID="FIELD_l_amt01" runat="server" CssClass="PanelWhite"
                    ForeColor="Red" ReadOnly="True">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 110px; height: 10px;">
                <asp:Label ID="Label5" runat="server" CssClass="NormalBold" ForeColor="Red" Text=">30天逾期" meta:resourcekey="Label5Resource1" Font-Bold="False"></asp:Label><asp:Label ID="Label8" runat="server" CssClass="NormalBold" ForeColor="Red" Text="應收帳款" meta:resourcekey="Label8Resource1" Font-Bold="False"></asp:Label></td>
            <td style="width: 145px; height: 10px;">
                <SmoothEnterpriseWebControl:InputText ID="FIELD_l_amt02" runat="server" CssClass="PanelWhite"
                    ForeColor="Red" ReadOnly="True">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 109px; height: 10px;">
                <asp:Label ID="Label25" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="Red"
                    meta:resourcekey="Label40Resource1" Text="未逾期"></asp:Label><br />
                <asp:Label ID="Label26" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="Red"
                    meta:resourcekey="Label8Resource1" Text="應收帳款"></asp:Label></td>
            <td style="width: 145px; height: 10px;"><SmoothEnterpriseWebControl:InputText ID="FIELD_l_amt03" runat="server" CssClass="PanelWhite"
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
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label10" runat="server" CssClass="NormalBold" Text="信 用 放 行 維 護" meta:resourcekey="Label10Resource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: white">
                            <asp:Label ID="Label29" runat="server" CssClass="NormalBold" Font-Size="10pt" ForeColor="Black"
                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label18" runat="server" CssClass="NormalBold" Font-Bold="False" Text="申請人維護" meta:resourcekey="Label18Resource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: white">
                            <table>
                                <tr>
                                    <td style="width: 19px; height: 25px;">
                                    </td>
                                    <td style="width: 118px; height: 25px;">
                                        <asp:Label ID="Label20" runat="server" CssClass="NormalBold" Font-Bold="False" Text="信用額度超限原因" meta:resourcekey="Label20Resource1"></asp:Label></td>
                                    <td style="height: 25px;" colspan="7">
                                        <asp:RadioButton ID="RadioSe1" runat="server" Checked="True" Font-Bold="False" Font-Size="8pt"
                                            ForeColor="Black" GroupName="selrad" Text="選取超限原因" meta:resourcekey="RadioSe1Resource1" Width="130px" />
                                        <SmoothEnterpriseWebControl:InputSelect ID="FIELD_reason_user" runat="server" BackColor="#F0F0F0"
                                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" Editable="False" EnabledHTC="True"
                                            ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl=""
                                            ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemAll-Value="%"
                                            ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                                            ItemNone-Text="" ListPosition="Vertical" Mode="Single" TextBoxStyle="ThreeDStyle"
                                            Value="System.Data.SqlClient" Width="279px">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControl:InputSelect>
                                        <br />
                                        <asp:RadioButton ID="RadioSe2" runat="server" Font-Bold="False" Font-Size="8pt" ForeColor="Black"
                                            GroupName="selrad" Text="自定超限原因" meta:resourcekey="RadioSe2Resource1" Width="130px" />&nbsp;<SmoothEnterpriseWebControl:InputText ID="FIELD_reason_user2" runat="server" BackColor="#F0F0F0"
                                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                            ErrorMessage="Please Input「MATTER」!!" FocusColor="" FormatType="None" HiddenMode="False"
                                            HTMLMode="Advance" IsValid="True" MaxLength="100" 
                                            OnClickMore="" Personalize="False" Required="False" Width="279px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 25px;">
                                    </td>
                                    <td style="width: 118px; height: 25px;">
                                        <asp:Label ID="Label21" runat="server" CssClass="NormalBold" Font-Bold="False" Text="改善方案" meta:resourcekey="Label21Resource1"></asp:Label></td>
                                    <td style="height: 25px;" colspan="7">
                                        <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" Font-Bold="False"
                                            Font-Size="8pt" ForeColor="Black" GroupName="selrad2" Text="選取改善方案" meta:resourcekey="RadioButton1Resource1" Width="130px" />
                                        <SmoothEnterpriseWebControl:InputSelect ID="FIELD_Improve_user" runat="server" BackColor="#F0F0F0"
                                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" Editable="False" EnabledHTC="True"
                                            ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl=""
                                            ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemAll-Value="%"
                                            ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                                            ItemNone-Text="" ListPosition="Vertical" Mode="Single" TextBoxStyle="ThreeDStyle"
                                            Value="System.Data.SqlClient" Width="279px">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControl:InputSelect>
                                        <br />
                                        <asp:RadioButton ID="RadioButton2" runat="server" Font-Bold="False" Font-Size="8pt"
                                            ForeColor="Black" GroupName="selrad2" Text="自定改善方案" meta:resourcekey="RadioButton2Resource1" Width="130px" />
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Improve_user2" runat="server" BackColor="#F0F0F0"
                                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                            ErrorMessage="Please Input「MATTER」!!" FocusColor="" FormatType="None" HiddenMode="False"
                                            HTMLMode="Advance" IsValid="True" MaxLength="100" 
                                            OnClickMore="" Personalize="False" Required="False" Width="279px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 22px">
                                    </td>
                                    <td style="width: 118px; height: 22px">
                                        <asp:Label ID="Label24" runat="server" CssClass="NormalBold" Font-Bold="False" meta:resourcekey="Label55Resource1"
                                            Text="是否為急件"></asp:Label></td>
                                    <td colspan="7" style="height: 22px">
                                        <asp:DropDownList ID="FIELD_quick" runat="server">
                                            <asp:ListItem>N</asp:ListItem>
                                            <asp:ListItem>Y</asp:ListItem>
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 22px;">
                                    </td>
                                    <td style="width: 118px; height: 22px;">
                                        <asp:Label ID="Label22" runat="server" CssClass="NormalBold" Font-Bold="False" Text="備註" meta:resourcekey="Label22Resource1"></asp:Label></td>
                                    <td style="height: 22px;" colspan="7">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Annotate_user" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" Width="402px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px;">
                                    </td>
                                    <td style="width: 118px;">
                                        <asp:Label ID="Label23" runat="server" CssClass="NormalBold" Font-Bold="False" Text="夾帶檔案" meta:resourcekey="Label23Resource1"></asp:Label></td>
                                    <td colspan="7">
                                                            <p id="uploadfiles">
<asp:CheckBoxList id="CheckBoxFile" runat="server" Font-Size="X-Small">
                             </asp:CheckBoxList>
                    <SmoothEnterpriseWebControl:InputFile ID="attach1" onchange="addfile()" runat="server" BackColor="#F0F0F0" CssClass="Normal">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    </SmoothEnterpriseWebControl:InputFile></p>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 25px;">
                                    </td>
                                    <td style="width: 118px; height: 25px;">
                                    </td>
                                    <td style="width: 145px; height: 25px;">
                                    </td>
                                    <td style="width: 100px; height: 25px;">
                                    </td>
                                    <td style="width: 145px; height: 25px;">
                                    </td>
                                    <td style="width: 100px; height: 25px;">
                                    </td>
                                    <td style="width: 145px; height: 25px;">
                                    </td>
                                    <td style="width: 81px; height: 25px;">
                                    </td>
                                    <td style="width: 157px; height: 25px;">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px;">
                            <asp:Label ID="Label32" runat="server" CssClass="NormalBold" Font-Size="10pt" ForeColor="Black"
                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label30" runat="server"
                                    CssClass="NormalBold" Font-Bold="False" Text="相關簽核人員" meta:resourcekey="Label30Resource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 20px; ">
                            <table>
                                <tr>
                                    <td style="width: 19px; height: 25px;">
                                    </td>
                                    <td style="width: 118px; height: 25px;">
                                        <asp:Label ID="Label33" runat="server" CssClass="NormalBold" Font-Bold="False" Text="直屬主管" meta:resourcekey="Label33Resource1"></asp:Label></td>
                                    <td style="height: 25px;" colspan="7">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_Lsend" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id">
                                            <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                                            <errorstyle borderstyle="NotSet" cssclass="" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 25px;">
                                    </td>
                                    <td style="width: 118px; height: 25px;">
                                        <asp:Label ID="Label34" runat="server" CssClass="NormalBold" Font-Bold="False" Text="目的廠業務窗口" meta:resourcekey="Label34Resource1"></asp:Label></td>
                                    <td style="height: 25px;" colspan="7">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_Sales" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id">
                                            <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                                            <errorstyle borderstyle="NotSet" cssclass="" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                </tr>
                                <tr>
                                    <td style="width: 19px; height: 25px;">
                                    </td>
                                    <td style="width: 118px; height: 25px;">
                                    </td>
                                    <td style="width: 145px; height: 25px;">
                                    </td>
                                    <td style="width: 100px; height: 25px;">
                                    </td>
                                    <td style="width: 145px; height: 25px;">
                                    </td>
                                    <td style="width: 100px; height: 25px;">
                                    </td>
                                    <td style="width: 145px; height: 25px;">
                                    </td>
                                    <td style="width: 81px; height: 25px;">
                                    </td>
                                    <td style="width: 157px; height: 25px;">
                                    </td>
                                </tr>
                            </table>
    <table border="0" Class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server" TypeName="AXMT610_2.Flowwork.AXMT610_21">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                    <Columns>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                    </Columns>
                    <HistoryTemplate>
                        <SmoothEnterpriseWebControl:InputText ID="Show_Comment" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" Width="400px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText><asp:Image ID="Image1" runat="server" />
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" meta:resourcekey="BUTTON_saveResource1" width="80px"  BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;&nbsp;<SmoothEnterpriseWebControl:InputButton
                    ID="InputButton2" runat="server" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid"
                    BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                     OnClick="InputButton2_Click" Text="作廢" meta:resourcekey="InputButton2Resource1"
                    Width="80px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControlFlowwork:SendRequestButton ID="BUTTON_SendRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px" OnClick="BUTTON_SendRequest_Click">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:SendRequestButton>&nbsp;<SmoothEnterpriseWebControlFlowwork:StopRequestButton ID="BUTTON_StopRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px" OnClick="BUTTON_StopRequest_Click">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:StopRequestButton>
                <SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" Text="催審"  width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton1_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" meta:resourcekey="BUTTON_backResource1" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_delete_Click" Visible="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
                        </td>
                    </tr>
                </table>
            <SmoothEnterpriseWebControl:InputText ID="FIELD_oga21" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px" Visible="False">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><asp:Label ID="Label15" runat="server" CssClass="NormalBold" Font-Bold="False" Text="收款客戶" meta:resourcekey="Label15Resource1" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_occ02_2" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px" Visible="False">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_oga18" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px" Visible="False">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><asp:Label ID="Label16" runat="server" CssClass="NormalBold" Font-Bold="False" ForeColor="Black"
                    Text="超限原因" meta:resourcekey="Label16Resource1" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_oga902" runat="server" CssClass="PanelWhite"
                    ForeColor="Red" ReadOnly="True" Visible="False">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText><asp:Label ID="LABEL_pmk22" runat="server" CssClass="NormalBold" Text="幣別匯率" meta:resourcekey="LABEL_pmk22Resource1" Font-Bold="False" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_oga24" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px" Visible="False">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><asp:Label ID="Label17" runat="server" CssClass="NormalBold" Font-Bold="False" Text="稅別稅率" meta:resourcekey="Label17Resource1" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_oga211" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Width="66px" Visible="False">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><asp:Label ID="LABEL_pmk02" runat="server" CssClass="NormalBold" Text="出貨類別" meta:resourcekey="LABEL_pmk02Resource1" Font-Bold="False" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_oga00" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Visible="False">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><asp:Label ID="Label14" runat="server" CssClass="NormalBold" Font-Bold="False" Text="送貨地址" meta:resourcekey="Label14Resource1" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_addr" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Visible="False">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><asp:Label ID="LABEL_oah02_9" runat="server" CssClass="NormalBold" Text="訂單單號" meta:resourcekey="LABEL_oah02_9Resource1" Font-Bold="False" Visible="False"></asp:Label><SmoothEnterpriseWebControl:InputText ID="FIELD_oga16" runat="server" CssClass="PanelWhite"
                    ForeColor="Black" ReadOnly="True" Visible="False">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" meta:resourcekey="GridView1Resource1"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="bno,plantid"
                                DataSourceID="SqlDataSource1" Font-Size="Smaller" ForeColor="Black" GridLines="Vertical"
                                Height="53px" PageSize="5" Width="1000px" Visible="False">
                                <RowStyle BorderColor="Black" Font-Size="Smaller" Height="5px" Wrap="False" />
                                <Columns>
                                     <asp:BoundField DataField="ogb31" HeaderText="訂單號碼" meta:resourcekey="BoundFieldResource1" SortExpression="ogb31">
                                        <HeaderStyle Wrap="True" />
                                        <ItemStyle Wrap="True" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ogb32" HeaderText="項次" meta:resourcekey="BoundFieldResource2" ReadOnly="True" SortExpression="ogb32" />

                                    <asp:BoundField DataField="ogb04" HeaderText="產品編號" meta:resourcekey="BoundFieldResource3" SortExpression="ogb04">
                                        <HeaderStyle Wrap="True" />
                                        <ItemStyle Wrap="True" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ogb06" HeaderText="品名" meta:resourcekey="BoundFieldResource4" SortExpression="ogb06">
                                        <HeaderStyle ForeColor="White" Wrap="True" />
                                        <ItemStyle Wrap="True" />
                                        <FooterStyle ForeColor="Red" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ima021" HeaderText="規格" meta:resourcekey="BoundFieldResource5" SortExpression="ima021">
                                        <HeaderStyle ForeColor="White" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                        <FooterStyle ForeColor="Red" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ogb05" HeaderText="單位" meta:resourcekey="BoundFieldResource6" SortExpression="ogb05">
                                        <HeaderStyle ForeColor="White" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                        <FooterStyle ForeColor="Red" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ogb12" HeaderText="數量" meta:resourcekey="BoundFieldResource7" SortExpression="ogb12">
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
                                SelectCommand="select plantid,bno,ogb31,ogb32,ogb04,ogb06,ima021,ogb05,ogb12 from AXMT610_IN_BODY">
                            </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 25px">
                </td>
        </tr>
    </table>
    <br />
</asp:Content>