<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="LabAdd.aspx.cs" Inherits="Lab.LabAdd" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

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
        <script src="../script/lab.js"></script>
        <link href="../../script/css/normalize.css" rel="stylesheet" />
        <link href="../../script/css/mak_base.css" rel="stylesheet" />
        <link href="../css/IPQC_Ra.css" rel="stylesheet" />
        <link href="../css/lab.css" rel="stylesheet" />

    </header>
    <asp:ScriptManager ID="sm1" runat="server" EnablePartialRendering="false" ></asp:ScriptManager>
    <div id="null_msg"> <%=getStr("null_msg") %> </div>
    <div id="isStr_msg"> <%=getStr("isInt_msg") %> </div>
    <div id="isNum_msg"> <%=getStr("isNum_msg") %> </div>
    <asp:HiddenField runat="server" ID="product" />
  
    <div style="width: 100%;">
        <div style="width: 100%; text-align: center; margin: 10px 5px;">
            <div style="border: 1px solid #808080; width: 100%; padding: 2px 2px">
                <div style="width: 100%;">
                    <div class="div_td note"><%=getStr("lab_no") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_Ra_no" Text="t0001" runat="server"></asp:Label>
                    </div>
                    <div class="div_td note"><%=getStr("received_date") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_Received" runat="server"></asp:Label>
                    </div>

                    <div class="div_td note"><%=getStr("week") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_week" runat="server"></asp:Label>
                    </div>
                </div>
                <div style="width: 100%;">
                    <div class="div_td note "><%=getStr("applicant") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_applicant" runat="server"></asp:Label>

                    </div>
                    <div class="div_td note"><%=getStr("dept") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_depat" runat="server"></asp:Label>
                    </div>
                    <div class="div_td note "><%=getStr("dispatch") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_dispatch" runat="server"></asp:Label>
                    </div>
                </div>
                <div style="width: 100%;">

                    <div class="div_td note "><%=getStr("bom_dt") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_bomdt" runat="server"></asp:Label>

                    </div>


                    <div class="div_td note "><%=getStr("tooling") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_tooling" runat="server"></asp:Label>
                    </div>
                    <div class="div_td note "><%=getStr("test_item") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_testitem" runat="server"></asp:Label>
                    </div>
                </div>
                <div style="width: 100%;">

                    <div class="div_td note "><%=getStr("test_type") %>:</div>
                    <div class="div_td column">

                        <asp:Label ID="lab_testtype" runat="server"></asp:Label>
                    </div>
                    <div class="div_td note"><%=getStr("product") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_product" runat="server"></asp:Label>
                    </div>
                    <div class="div_td note "><%=getStr("material") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_material" runat="server"></asp:Label>
                    </div>
                </div>

                <div style="width: 100%;">

                    <div class="div_td note"><%=getStr("program") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_program" runat="server"></asp:Label>
                    </div>

                    <div class="div_td note "><%=getStr("sample") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_sample" runat="server"></asp:Label>
                    </div>
                    <div class="div_td note"><%=getStr("equipment") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_equipment" runat="server"></asp:Label>

                    </div>
                </div>
                <div style="width: 100%;">
                    <div class="div_td note "><%=getStr("remark") %>:</div>
                    <div class="div_td column">
                        <asp:Label ID="lab_remark" runat="server"></asp:Label>
                    </div>
                    <div class="div_td note"><%=getStr("data_unit") %>:</div>
                    <div class="div_td column">
                        <asp:DropDownList ID="cbo_unit" runat="server" ></asp:DropDownList>
                    </div>
                    <div class="div_td "></div>
                    <div class="div_td">
                    </div>
                </div>

            </div>
        </div>

        <div style="width: 100%; padding: 5px 5px; margin: 10px 5px;">
            <asp:UpdatePanel ID="lab_up" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:GridView ID="gv_Lab" runat="server" AutoGenerateColumns="False" AllowPaging="False" AllowSorting="False" OnRowCreated="gv_Lab_RowCreated" OnRowCommand="gv_Lab_RowCommand" OnRowDataBound="gv_Lab_RowDataBound"
                        Width="100%" EnableModelValidation="True" GridLines="Both" CellPadding="0" CellSpacing="0" BorderStyle="Solid" BorderColor="#523971" BorderWidth="1" ForeColor="#fff"  >
                        <AlternatingRowStyle BackColor="#DFDBE5" />
                        <RowStyle BackColor="White" ForeColor="#4A3C8C" Height="20px" /> 
                        <Columns>
                            <asp:TemplateField HeaderText="id" Visible="true" HeaderStyle-CssClass="i_td1">
                                <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" />
                                <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item">
                                <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="5%" Height="30" />
                                <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Measuring position" meta:resourcekey="m_position" HeaderStyle-CssClass="i_td1">
                                <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="24%" Height="30" />
                                <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Completed Date" meta:resourcekey="cmp_dt" HeaderStyle-CssClass="i_td1">
                                <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="9%" Height="30" />
                                <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RART side" meta:resourcekey="rart" HeaderStyle-CssClass="i_td1">
                                <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="9%" Height="30" />
                                <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Test result" meta:resourcekey="test_result" HeaderStyle-CssClass="i_td1">
                                <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="48%"  Height="30" />
                                <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="i_td1">

                                <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="5%" Height="30" />
                                <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="type" Visible="true" HeaderStyle-CssClass="i_td1">
                                <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" />
                                <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>
                        <EmptyDataTemplate>
                            <table class="all" border="1" style="border: 1px solid #808080; margin: 2px 2px">
                                <tr style="height: 30px; background-color: #523971; color: #fff; font-weight: bolder; text-align: center">
                                    <td style="width: 50px;">Item</td>
                                    <td style="width: 150px;"><%=getStr("m_position") %></td>
                                    <td style="width: 150px;"><%=getStr("cmp_dt") %></td>
                                    <td style="width: 120px;"><%=getStr("rart") %></td>
                                    <td style="width: 480px;"><%=getStr("test_result") %></td>
                                    <td style="width: 60px;">
                                        <asp:Button runat="server" Text="ADD" ID="Btn_Add" OnClick="Btn_Add_Click" width="50" />
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center; padding: 5px 5px">
                                        <%=getStr("not_data") %></td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </ContentTemplate> 
            </asp:UpdatePanel>
        </div>

        <!--/*****************************************************************/-->
        <div style="width: 100%; padding: 5px 5px; margin: 10px 5px;">
            <div style="text-align: left; margin: 20px 5px">
                
                <SmoothEnterpriseWebControl:InputButton ID="Btn_Save" runat="server" Text="Save"
                    Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    Font-Bold="True" Font-Names="Arial" Font-Size="14px" OnClick="Btn_Save_Click" OnClientClick="return check_page()">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;

                <SmoothEnterpriseWebControl:InputButton ID="Btn_Continue" runat="server" Text="Continue"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    Font-Bold="True" Font-Names="Arial" Font-Size="14px" OnClick="Btn_Continue_Click"  OnClientClick="return check_head()" Visible="true">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;

            <SmoothEnterpriseWebControl:InputButton ID="Btn_Back" runat="server" Text="Back"
                BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Arial" Font-Size="14px" OnClick="Btn_Back_Click" Visible="true">
                <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:InputButton>&nbsp; 
            </div>
        </div>
    </div>

</asp:Content>
