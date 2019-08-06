<%@ page language="C#" masterpagefile="~/_site/layout/Program.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.Login, App_Web_login.aspx.cdcab7d2" title="SmoothEnterprise.NET Login" stylesheettheme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="Program Name" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight=""
        IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"
            CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr valign="top">
            <td style="padding-right: 5px" width="70%">
                <table style="border-right: #d3d9f0 1px solid; border-top: #d3d9f0 1px solid; filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#00DBE2FF, endcolorstr=#ddffffff);
                    border-left: #d3d9f0 1px solid; border-bottom: #d3d9f0 1px solid" width="100%"
                    bgcolor="lavender">
                    <tr valign="top">
                        <td width="1%">
                        </td>
                        <td width="50%">
                            <table id="Table1" style="color: #2d387b" cellspacing="5" cellpadding="0" width="100%"
                                border="0">
                                <tr>
                                    <td class="Normal">
                                        <img src="img/bullet-brect.gif" align="absMiddle" border="0">&nbsp;<asp:Label ID="LABEL_registered"
                                            runat="server" Text="For registered user :" meta:resourcekey="LABEL_registeredResource1"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td background="/lib/img/bg-mask.gif" height="1">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Normal">
                                        <asp:Literal ID="FIELD_description" runat="server"></asp:Literal></td>
                                </tr>
                                <tr>
                                    <td class="NormalBold">
                                        <asp:Label ID="LABEL_userid" runat="server" Text="請輸入您的登入帳號" meta:resourcekey="LABEL_useridResource1"></asp:Label>
                                          </td>
                                </tr>
                                <tr>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="userid" runat="server" BackColor="Lavender"
                                            Width="272px" CssClass="Normal" MaxLength="50" Required="True" ErrorMessage="Please Input Logon ID !"
                                            ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                            FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True"
                                            meta:resourcekey="useridResource2" OnClickMore="" Personalize="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControl:InputText>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="NormalBold">
                                        <asp:Label ID="LABEL_userpwd" runat="server" Text="帳號密碼" meta:resourcekey="LABEL_userpwdResource1"></asp:Label>
                                       <!-- <asp:Label ID="LABEL2" ForeColor="red" runat="server" Text="( MATmail password )"  >  !--></asp:Label>
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="userpwd" runat="server" BackColor="Lavender"
                                            Width="272px" CssClass="Normal" MaxLength="50" TextMode="Password" ButtonClick="True"
                                            ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor=""
                                            FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="userpwdResource2"
                                            OnClickMore="" Personalize="False" Required="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText>
                                    </td>
                                </tr>
                                <tr height="30">
                                    <td>
                                        
                                        <SmoothEnterpriseWebControl:InputButton ID="BUTTON_login" runat="server" ForeColor="#464688"
                                            Font-Names="Arial" Font-Size="12px" BorderColor="MidnightBlue" BorderWidth="2px"
                                            BorderStyle="Solid" BackColor="LightSteelBlue" CssClass="NormalBold" gradient-gradienttype="Bottom"
                                            Font-Bold="True" Text="登入" OnClick="BUTTON_login_Click" meta:resourcekey="BUTTON_loginResource1"
                                            RunAtCient="False">
                                            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                        &nbsp;
                                        <SmoothEnterpriseWebControl:InputButton ID="BUTTON_getpwd" runat="server" ForeColor="#464688"
                                            Font-Names="Arial" Font-Size="12px" BorderColor="#BDBDDD" BorderWidth="1px" BorderStyle="Solid"
                                            BackColor="Lavender" CssClass="NormalBold" gradient-gradienttype="Bottom" Font-Bold="True"
                                            Text="忘記密碼" OnClick="BUTTON_getpwd_Click" meta:resourcekey="BUTTON_getpwdResource1"
                                            RunAtCient="False" Visible="false">
                                            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                    </td>
                                </tr>
                                <tr height="30">
                                    <td id="TD_autologin" runat="server">
                                        <img style="margin-top: 5px" hspace="10" src="img/img-uparrow.gif" border="0"><br>
                                        <table style="filter: progid: DXImageTransform.Microsoft.gradient(gradienttype=1,startcolorstr=#00666666, endcolorstr=#ddffffff);
                                            color: #464688; background-color: #dbe2ff">
                                            <tr>
                                                <td height="20">
                                                    <input id="keeplogin" type="checkbox" runat="server"></td>
                                                <td style="font-size: 11px; font-family: Tahoma">
                                                    <asp:Label ID="LABEL_keeplogin" runat="server" Text="紀錄我的帳號，下次自動登入" meta:resourcekey="LABEL_keeploginResource1"></asp:Label></td>
                                                <td width="30">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td id="TD_regstyle1" align="center" width="1%" runat="server">
                            <br>
                            <img height="130" src="img/img-vline.gif" width="2" align="absMiddle" border="0"></td>
                        <td id="TD_regstyle2" width="50%" runat="server">
                            <table class="Normal" id="Table2" style="color: #2d387b" cellspacing="5" cellpadding="0"
                                width="100%" border="0">
                                <tr>
                                    <td class="Normal">
                                        <asp:Label ID="LABEL_newuser"
                                            runat="server" Text="For new user :" meta:resourcekey="LABEL_newuserResource1" Visible="False"></asp:Label><br />
                                        <asp:Label ID="LABEL_register" runat="server" Text="如果您尚未登錄帳號，請按註冊按鈕來完成申請：" meta:resourcekey="LABEL_registerResource1" Visible="False"></asp:Label><br />
                                        
                                        <asp:Label ID="LABEL1"
                                            runat="server" Text="Sample"   Visible="True"></asp:Label>
                                        
                                       
                                        </td>
                                </tr>
                                <tr>
                                  <td>
                                   <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl="~/Security/img/teaclog.jpg" Width="280px" /><br />
                                  </td>
                                
                                </tr>
                                <tr>
                                    <td background="/lib/img/bg-mask.gif" style="height: 1px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 11px; line-height: 16px; font-family: Tahoma">
                                        </td>
                                </tr>
                                <tr>
                                    <td valign="top" style="height: 16px">
                                        <SmoothEnterpriseWebControl:InputButton ID="BUTTON_register" runat="server" ForeColor="#464688"
                                            Font-Names="Arial" Font-Size="12px" BorderColor="#BDBDDD" BorderWidth="1px" BorderStyle="Solid"
                                            BackColor="Lavender" CssClass="NormalBold" gradient-gradienttype="Bottom" Font-Bold="True"
                                            Text="我要註冊" OnClick="BUTTON_register_Click" meta:resourcekey="BUTTON_registerResource1"
                                            RunAtCient="False" Visible="False">
                                            <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="1%">
                        </td>
                    </tr>
                    <tr id="deniedinfo" runat="server">
                        <td width="1%">
                        </td>
                        <td style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px;
                            background-color: scrollbar" colspan="3">
                            <table cellspacing="2" cellpadding="0">
                                <tr>
                                    <td>
                                        <img src="img/img-logininfo.gif" align="absMiddle" border="0"></td>
                                    <td nowrap width="2">
                                    </td>
                                    <td>
                                        <asp:Label ID="information" runat="server" ForeColor="DarkSlateBlue" Font-Names="Tahoma"
                                            Font-Size="11px" meta:resourcekey="informationResource1"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td height="3">
                        </td>
                    </tr>
                </table>
            </td>
            <td width="30%">
                <table style="border-right: #90cca7 1px solid; border-top: #90cca7 1px solid; filter: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#00666666, endcolorstr=#ddffffff);
                    border-left: #90cca7 1px solid; border-bottom: #90cca7 1px solid" width="100%"
                    bgcolor="#d7f1ce">
                    <tr>
                        <td width="1%">
                        </td>
                        <td>
                            <table id="Table3" style="color: #009999" cellspacing="5" cellpadding="0" width="100%"
                                border="0">
                                <tr>
                                    <td class="NormalBold">
                                        <asp:Label ID="LABEL_meno" runat="server" meta:resourcekey="LABEL_menoResource1"
                                            Text="All the web applications are optimized for :"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td background="/lib/img/bg-mask.gif" height="1">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 11px; line-height: 16px; font-family: Tahoma">
                                        - Microsoft Internet Explorer 6.0<br>
                                        - 1024 x 768 screen resolution<br>
                                        - 16 bits screen color depth<br>
                                        - Client cookie support must be turned on..
                                    </td>
                                </tr>
                                <tr>
                                    <td height="10">
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="1%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
