<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie_Edge.master" AutoEventWireup="true" CodeFile="LeicaAdd.aspx.cs" Inherits="Leica.LeicaAdd" StylesheetTheme="Edge" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <header>
        <script src="js/Leica.js"></script>
        <link href="js/Lieca.css" rel="stylesheet" />
        <script>
            function Download(guid) {

                var head = $("#ctl00_ContentPlaceHolder1_head_id").val();
                $.get("../comm/download_handler.ashx?table=eipe.dbo.leica_file&col_filename=file_name&col_type=kind&col_content=arguments&paramenter=rowid='" + guid + "' and head_id='" + head + "' ");
                return false;
            }
        </script>
    </header>
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

    <div id="leica" style="margin: 10px; width: 1200px">

        <div style="display: none">
            <!--隱藏傳Server的預設資訊-->

            <asp:HiddenField ID="head_id" runat="server" />
            <asp:HiddenField ID="base_id" runat="server" />
            <asp:HiddenField ID="curr_page" runat="server" />
            <asp:HiddenField ID="msg" runat="server" Value="" />

            <div id="integer"><%=getStr("integer")%></div>
            <div id="inspect_empty"><%=getStr("inspect_empty") %></div>
            <div id="required"><%=getStr("required") %></div>
            <div id="isNum"><%=getStr("isnum") %></div>

            <div id="more_zero"><%=getStr("more_zero")%></div>
            <div id="is_zero"><%=getStr("is_zero")%></div>
            <div id="all_empty"><%=getStr("all_empty")%></div>
            <div id="duplicate"><%=getStr("duplicate") %></div>
            <div id="unable_to_run"><%=getStr("unable_to_run") %> </div>
            <div id="is_exist"><%=getStr("is_exist") %> </div>


        </div>
        <div>
            ctl00_ContentPlaceHolder1_ddl_kind_h<div id="ctl00_ContentPlaceHolder1_ddl_kind_h">
                <!--給javascrip-->
            </div>
            ctl00_ContentPlaceHolder1_ddl_product_h<div id="ctl00_ContentPlaceHolder1_ddl_product_h">
                <!--給javascrip-->
            </div>
            ctl00_ContentPlaceHolder1_ddl_program_h<div id="ctl00_ContentPlaceHolder1_ddl_program_h">
                <!--給javascrip-->
            </div>
            ctl00_ContentPlaceHolder1_ddl_test_h<div id="ctl00_ContentPlaceHolder1_ddl_test_h">
                <!--給javascrip-->
            </div>
            ctl00_ContentPlaceHolder1_ddl_ts_standard_h<div id="ctl00_ContentPlaceHolder1_ddl_ts_standard_h">
                <!--給javascrip-->
            </div>

        </div>
        <div style="font-size: 2em; color: #9b1e64; height: 35px; font-weight: bolder;">
            <%=getStr("insp_record") %>
        </div>
        <div id="head" class="t1">
            <div class="tb1">
                <div class="tr">
                    <div class="th"><%=getStr("type") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_kind" runat="server" Next="product" level="5" CssClass="required AutoPost">
                        </asp:DropDownList>
                        <asp:HiddenField ID="kind" runat="server"  />
                    </div>

                    <div class="th"><%=getStr("inpecter") %></div>
                    <div class="td">
                        <asp:TextBox ID="txt_operator" runat="server" CssClass="Muser required"></asp:TextBox>
                    </div>
                    <div class="th"><%=getStr("Inspect_dt") %></div>

                    <div class="td">
                        <asp:TextBox ID="txt_inspDt" runat="server" CssClass="date required"></asp:TextBox>
                    </div>
                </div>
                <div class="tr">

                    <div class="th"><%=getStr("product") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_product" runat="server" Next="program" level="4" CssClass="required AutoPost">
                        </asp:DropDownList>
                        <asp:HiddenField ID="product" runat="server"  />
                    </div>
                    <div class="th"><%=getStr("program") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_program" runat="server" Next="test" level="3" CssClass="required AutoPost">
                        </asp:DropDownList>
                        <asp:HiddenField ID="program" runat="server"  />
                    </div>

                    <div class="th"><%=getStr("result") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_result" runat="server" CssClass="required">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="tr">

                    <div class="th"><%=getStr("custmer") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_custmer" runat="server" Next="program" level="4" CssClass="required">
                        </asp:DropDownList>
                    </div>
                    <div class="td"></div>
                    <div class="td"></div>
                    <div class="td"></div>
                    <div class="td"></div>

                </div>

            </div>
            <div class="tb1" style="border-top: 0px">
                <div class="tr">

                    <div class="th" id="file_up" style="border-top: 0px">上傳檔案</div>
                    <div class="td" style="vertical-align: central; width: auto; border-top: 0px">
                        <asp:FileUpload ID="fileU" runat="server" Width="300px" /><asp:Button ID="btn_file" runat="server" Text="檔案上傳" Width="60" Height="22px" OnClick="btn_file_Click" />
                    </div>
                    <div class="td" style="vertical-align: central; width: auto; border-top: 0px; width: 50%">
                        <asp:UpdatePanel runat="server" ID="up_file" UpdateMode="Conditional" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <asp:DataList ID="file_list" runat="server" OnDeleteCommand="f_list_DeleteCommand" OnItemDataBound="file_list_ItemDataBound">
                                    <ItemTemplate>
                                        <%--<asp:LinkButton CommandName="Delete" CommandArgument='<%# Bind("rowid") %>' ID="del_file" runat="server" ToolTip="Del" Height="30">
                                    <i class="fas fa-trash" style="font-size:1.2em" ></i>
                                        </asp:LinkButton>--%>
                                        <asp:LinkButton ID="lbtn_Del" CommandName="DELETE" runat="server" CommandArgument='<%# Bind("rowid") %>' ToolTip="Del" Height="30">
                                            <i class="far fa-trash-alt" style="font-size:1.2em" ></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lbtn_file" runat="server"></asp:LinkButton>

                                    </ItemTemplate>
                                </asp:DataList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <div class="t1" id="lbase">

            <div class="tb1" style="width: 100%; border-bottom: 0px">
                <div class="tr ">
                    <div class="td" style="text-align: center; font-size: 1.4em; color: #bf3553; font-weight: bold">
                        <%=getStr("insp_info") %>
                    </div>
                </div>
            </div>
            <div class="tb1" style="border-bottom: 0px">
                <div class="tr">
                    <div class="th"><%=getStr("insp_type") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_inspect" runat="server" CssClass="required"></asp:DropDownList>
                    </div>
                    <div class="th"><%=getStr("inspct_num") %></div>

                    <div class="td">
                        <asp:TextBox ID="txt_insp_count" runat="server" Text="0" CssClass="required qty"></asp:TextBox>
                    </div>
                    <div class="th"><%=getStr("sp_stand") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_sp_stand" CssClass="required" runat="server"></asp:DropDownList>
                    </div>
                    <div class="th"><%=getStr("samp_num") %></div>
                    <div class="td">
                        <asp:TextBox ID="txt_samp_count" runat="server" Text="0" CssClass="required qty"></asp:TextBox>
                    </div>

                </div>
                <div class="tr">
                    <div class="th"><%=getStr("birth_dt") %></div>
                    <div class="td">
                        <asp:TextBox ID="txt_birthDt" runat="server" Text="" CssClass="date required"></asp:TextBox>
                    </div>

                    <div class="th"><%=getStr("assembly_staff") %></div>
                    <div class="td" style="text-align: center">
                        <asp:TextBox ID="txt_b_opeartor" runat="server" CssClass="Muser required"></asp:TextBox>
                    </div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e; text-align: left">
                        <asp:LinkButton ID="lbtn_insp_add" runat="server" OnClientClick="return check_head()" Class="fas fa-edit add_btn" OnClick="lbtn_insp_add_Click" title="add"></asp:LinkButton>
                    </div>

                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e; border-right: 1px solid #8a988e;"></div>

                </div>
            </div>

        </div>
        <asp:UpdatePanel runat="server" ID="up_vmi" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <div class="tb1 all" style="border-bottom: 0px">
                    <div class="tr">
                        <div class="td" style="text-align: center; font-size: 1.4em; color: #7B90D2; font-weight: bold; height: 30px">
                            <%=getStr("vmi")%>
                        </div>
                    </div>
                </div>
                <div class="tb1 all">
                    <div class="tr">
                        <div class="td">
                            <div class="cell" style="width: 45%; border-right: 2px solid #B19693;">
                                <div style="float: left; width: 90%; margin: 5px">
                                    <div class="tb1 edit " style="width: 100%; float: left; font-size: medium">
                                        <div class="tr ">
                                            <div class="th">*<%=getStr("position")%></div>
                                            <div class="td">
                                                <asp:DropDownList ID="ddl_position" runat="server" CssClass="required"></asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="tr ">
                                            <div class="th">*<%=getStr("shape")%></div>
                                            <div class="td">
                                                <div style="padding: 2px">
                                                    <asp:DropDownList ID="ddl_shape" runat="server"></asp:DropDownList>
                                                    <asp:LinkButton ID="lbin_shape_add" CssClass="fa fa-1x fa-plus" runat="server" Style="padding: 2px; cursor: pointer; text-decoration: none;" OnClick="lbin_shape_add_Click" OnClientClick="return add_shape()" ToolTip="add"></asp:LinkButton>
                                                </div>
                                                <div style="padding: 2px">

                                                    <asp:DataList ID="stemp_list" runat="server" OnDeleteCommand="stemp_list_DeleteCommand">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lab_stemp" runat="server"><%#Eval("shape_txt").ToString().Trim() %></asp:Label>

                                                            <asp:LinkButton CommandName="Delete" CommandArgument='<%# Bind("shape") %>' ID="del_shape" runat="server" ToolTip="Del">
                                                              
                                                            <i class="fas fa-minus"></i>
                                                            </asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="tr ">
                                            <div class="th"><%=getStr("d_qty") %></div>
                                            <div class="td">
                                                <asp:TextBox ID="txt_vmi_qty" runat="server" Text="0" CssClass="qty required"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="tr ">
                                            <div class="th"><%=getStr("judgment") %></div>
                                            <div class="td">
                                                <asp:DropDownList ID="ddl_vmi_judg" runat="server" CssClass="required">
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div style="float: left; margin: 5px 5px;">

                                    <asp:LinkButton ID="lbtn_vmi_add" runat="server" CssClass="far fa-plus-square add_btn" OnClick="lbtn_vmi_add_Click" OnClientClick="return vmi_add()" Style="text-decoration: none;" title="lbtn_vmi_add_Click"></asp:LinkButton>
                                </div>
                            </div>
                            <div class="cell" style="width: 55%">
                                <div style="float: left; margin: 5px; width: 90%;">

                                    <asp:GridView ID="vmi_list" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                        OnRowDataBound="vmi_list_RowDataBound" OnRowDeleting="vmi_list_RowDeleting" DataKeyNames="vmi_id"
                                        CellPadding="0" BorderColor="#B19693" BorderStyle="Solid" BorderWidth="1px" Width="100%" EnableModelValidation="True" ForeColor="#9fa39a" GridLines="Both">
                                        <AlternatingRowStyle BackColor="#F4F6F7" />
                                        <FooterStyle BackColor="#F4F6F7" />
                                        <HeaderStyle BackColor=" #F4F6F7" Font-Bold="True" ForeColor="#7B90D2" Font-Size="Medium" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />

                                        <Columns>

                                            <asp:BoundField DataField="vmi_id" HeaderText="vmi_id" Visible="false">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="position_txt" HeaderText="Position of defective">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Shape of defective">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="qty" HeaderText="Defect Quantity">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="judg_txt" HeaderText="Judgement">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>

                                            <asp:TemplateField HeaderText="Delete">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <%--<asp:Button ID="lbtn_vmi_del" runat="server" CommandName="Delete" Text="Delete"  CommandArgument='<%# Eval("vmi_id") %>' />
                                            <i class="far fa-trash-alt"></i>--%>
                                                    <asp:LinkButton ID="lbtn_vmi_del" runat="server" CommandName="Delete" title="Del" class="far fa-trash-alt" Width="50"></asp:LinkButton>
                                                </ItemTemplate>

                                            </asp:TemplateField>

                                        </Columns>
                                        <EmptyDataTemplate>
                                            <div class="tb1 Tempty" style="background-color: #F4F6F7; color: #7B90D2; width: 100%; height: 25px; text-align: center; border: 0px; font-size: medium">
                                                <div class="tr">
                                                    <div class="td">
                                                        <%=getStr("position")%>
                                                    </div>
                                                    <div class="td">
                                                        <%=getStr("shape")%>
                                                    </div>
                                                    <div class="td">
                                                        <%=getStr("d_qty")%>
                                                    </div>
                                                    <div class="td" style="border-right: 0px">
                                                        <%=getStr("judgment")%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="background-color: #FFF; color: #7B90D2; width: 100%; height: 25px">
                                                <%=getStr("not_data")%>
                                            </div>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>

                                <div style="float: left; margin: 5px;">
                                    <asp:LinkButton ID="lbtn_base_add" runat="server" class="far fa-file-alt add_btn" title="save" OnClick="lbtn_base_add_Click" OnClientClick="return base_add_chk()">
                                    </asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lbin_shape_add" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>

        <div id="ft_Area" class="t1" style="display: none">
            <div class="tb1">
                <div class="td" style="text-align: center; font-size: x-large; font-weight: bold; color: #636F58; width: 100%; border-bottom: 0px solid red">
                    <%=getStr("fun_test") %>
                </div>
            </div>
            <div class="tb1">
                <div class="td" style="width: 40%; vertical-align: top">
                    <div id="ft_right" class="tb1" style="vertical-align: top; border: 0px solid red;">
                        <div class="tr">
                            <div class="th"><%=getStr("ts_item") %></div>
                            <div class="td">
                                <asp:DropDownList ID="ddl_test" runat="server" Next="ts_standard" level="2" CssClass="required AutoPost"></asp:DropDownList>
                                <asp:HiddenField ID="test" runat="server"  />
                            </div>
                            <div class="th"><%=getStr("ts_stand") %></div>
                            <div class="td">
                                <asp:DropDownList ID="ddl_ts_standard" runat="server" level="1" CssClass="required AutoPost"></asp:DropDownList>
                                <asp:HiddenField ID="ts_stand" runat="server"  />
                            </div>

                        </div>
                        <div class="tr">
                            <div class="th"><%=getStr("qty") %></div>
                            <div class="td">
                                <asp:TextBox ID="txt_ft_qty" CssClass="required" runat="server" Text="0"></asp:TextBox>
                            </div>
                            <div class="th"><%=getStr("judg") %></div>
                            <div class="td">
                                <asp:DropDownList ID="ddl_ft_judg" CssClass="required" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="tr">

                            <div class="th">S1</div>
                            <div class="td">
                                <asp:TextBox ID="txt_s1" runat="server"></asp:TextBox>
                            </div>
                            <div class="th">S2</div>
                            <div class="td">
                                <asp:TextBox ID="txt_s2" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="tr">
                            <div class="th">S3</div>
                            <div class="td">
                                <asp:TextBox ID="txt_s3" runat="server"></asp:TextBox>
                            </div>
                            <div class="th">S4</div>
                            <div class="td">
                                <asp:TextBox ID="txt_s4" runat="server"></asp:TextBox>
                            </div>



                        </div>
                        <div class="tr">
                            <div class="th">S5</div>
                            <div class="td">
                                <asp:TextBox ID="txt_s5" runat="server"></asp:TextBox>
                            </div>
                            <div class="td"></div>
                            <div class="td">

                                <asp:LinkButton class="far fa-file-alt fa-3x add_btn" runat="server" ID="lbtn_S5_add" OnClick="lbtn_S5_add_Click" OnClientClick="return S5_add_chk();"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="td" style="width: 60%; text-align: center; vertical-align: top;">
                    <div id="test_s5" style="margin: 10px; text-align: center;">

                        <div id="ft_left" style="width: 100%; border: 0px solid red;">
                            <div class="th"><%=getStr("prod_no") %></div>
                            <div class="td" style="border-right: 0px solid red;">
                                <asp:TextBox ID="txt_prod_index" runat="server" CssClass="required"></asp:TextBox>
                            </div>


                            <div class="th"><%=getStr("insp_time") %></div>
                            <div class="td">
                                <asp:TextBox ID="txt_insp_time" runat="server" CssClass="Mclock required"></asp:TextBox>

                            </div>
                            <div class="td" style="text-align: center">
                                <asp:LinkButton ID="lbtn_ft_add" runat="server" class="fas fa-angle-double-down" OnClick="lbtn_ft_add_Click" OnClientClick="return ft_add_chk()"></asp:LinkButton>
                            </div>
                        </div>

                        <asp:UpdatePanel runat="server" ID="up_s5" UpdateMode="Conditional" ChildrenAsTriggers="true">
                            <ContentTemplate>

                                <asp:GridView ID="s5_list" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                    OnRowDeleting="s5_list_RowDeleting" DataKeyNames="ft_id"
                                    BorderColor="#5e616d" BorderStyle="Solid" BorderWidth="1px" Width="100%" CellPadding="0" GridLines="Both"
                                    ForeColor="#856CAE" Font-Size="Small" Font-Bold="true">
                                    <%--<AlternatingRowStyle BackColor="#a7a8bd" Height="25" ForeColor="#592C63" />--%>
                                    <AlternatingRowStyle BackColor="#a7a8bd" Height="25" />
                                    <HeaderStyle BackColor="#a7a8bd" Font-Size="Small" ForeColor="#eef7f2" Height="25" />
                                    <Columns>
                                        <asp:BoundField DataField="ft_id" Visible="false" />
                                        <asp:TemplateField HeaderText="Seq">
                                            <ItemStyle HorizontalAlign="Center" Height="25" />
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex + 1%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="test" HeaderText="Test Item" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ts_standard" HeaderText="Test Standard" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ft_qty" HeaderText="Qty" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ft_jdug" HeaderText="ft jdug" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="s1" HeaderText="s1" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="s2" HeaderText="s2" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="s3" HeaderText="s3" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="s4" HeaderText="s4" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="s5" HeaderText="s5" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Del">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtn_del_s5" runat="server" CommandName="Delete" title="del" class="far fa-trash-alt"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <tr id="empty_data_s5" style="background-color: #a7a8bd; height: 25px; color: #FFFFFB;">
                                            <th><%=getStr("ts_item") %></th>
                                            <th><%=getStr("ts_stand") %></th>
                                            <th><%=getStr("qty") %></th>
                                            <th><%=getStr("judg") %></th>
                                            <th>S1</th>
                                            <th>S2</th>
                                            <th>S3</th>
                                            <th>S4</th>
                                            <th>S5</th>
                                        </tr>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server" ID="up_ft" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <asp:GridView ID="ft_list" runat="server" AllowPaging="false" AutoGenerateColumns="false"
                    OnRowDataBound="ft_list_RowDataBound" OnRowCommand="ft_list_RowCommand" EnableModelValidation="True"
                    CellPadding="0" GridLines="Both"
                    BorderColor="#96c24e" BorderStyle="Solid" BorderWidth="1px" Width="100%"
                    ForeColor="#006030" Font-Size="Medium" Font-Bold="true">
                    <AlternatingRowStyle BackColor="#DDE9E3" BorderColor="#96c24e" />
                    <FooterStyle BackColor="#9abeaf" />
                    <HeaderStyle BackColor="#9abeaf" Font-Size="Medium" ForeColor="#ffffff" Height="30" />
                    <Columns>



                        <asp:BoundField DataField="ft_id" Visible="false" />

                        <asp:TemplateField HeaderText="Item" HeaderStyle-Width="40">
                            <ItemStyle HorizontalAlign="Center" BackColor="White" />
                            <%--<ItemTemplate>
                                不計算，由後台計算才會正確
                                <%#Container.DataItemIndex + 1%>
                            </ItemTemplate>--%>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="prod_index" HeaderStyle-Width="70">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" BackColor="White" CssClass="ft_list_1" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="insp_time" HeaderStyle-Width="100">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" BackColor="White" CssClass="ft_list_2" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="test_standard" HeaderStyle-Width="110">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Height="30" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Qty" HeaderStyle-Width="110">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="jdug" HeaderStyle-Width="110">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="S1" HeaderStyle-Width="30">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="S2" HeaderStyle-Width="30">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="S3" HeaderStyle-Width="30">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="S4" HeaderStyle-Width="30">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="S5" HeaderStyle-Width="30">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit">
                            <HeaderStyle HorizontalAlign="Center" Width="30" />
                            <ItemStyle HorizontalAlign="Center" BackColor="White" />
                            <ItemTemplate>
                                <%--<asp:LinkButton ID="lbtn_All_del" runat="server" CommandName="del_All" title="Del" Text="del" class="far fa-trash-alt"></asp:LinkButton>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Copy">
                            <HeaderStyle HorizontalAlign="Center" Width="30" />
                            <ItemStyle HorizontalAlign="Center" BackColor="White" />
                            <ItemTemplate>
                                <%--<asp:LinkButton ID="lbtn_All_del" runat="server" CommandName="del_All" title="Del" Text="del" class="far fa-trash-alt"></asp:LinkButton>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Del">
                            <HeaderStyle HorizontalAlign="Center" Width="30" />
                            <ItemStyle HorizontalAlign="Center" BackColor="White" />
                            <ItemTemplate>
                                <%--<asp:LinkButton ID="lbtn_All_del" runat="server" CommandName="del_All" title="Del" Text="del" class="far fa-trash-alt"></asp:LinkButton>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <%--item 產品編號 檢測時間 測試項目 測試標準 數量 判定 S1 S2 S3 S4 S5 Edit Del Copy --%>
                    <EmptyDataTemplate>
                        <tr style="width: 100%; border: 0px solid #96c24e; border-collapse: collapse; font-size: medium; font-weight: bold; background-color: #9abeaf; color: #fff">
                            <td align="center">Item</td>
                            <td align="center" style="width: 10%"><%=getStr("prod_no") %></td>
                            <td align="center" style="width: 10%"><%=getStr("insp_time") %></td>
                            <td align="center" style="width: 10%"><%=getStr("ts_item") %></td>
                            <td align="center" style="width: 10%"><%=getStr("ts_stand") %></td>
                            <td align="center" style="width: 10%"><%=getStr("qty") %></td>
                            <td align="center" style="width: 10%"><%=getStr("judg") %></td>
                            <td align="center" style="width: 5%">S1</td>
                            <td align="center" style="width: 5%">S2</td>
                            <td align="center" style="width: 5%">S3</td>
                            <td align="center" style="width: 5%">S4</td>
                            <td align="center" style="width: 5%">S5</td>
                        </tr>
                        <tr style="background-color: #FFF; color: #5e665b; width: 100%; text-align: center; font-size: medium">
                            <td colspan="15" style="height: 25px">
                                <%=getStr("not_data")%></td>
                        </tr>
                    </EmptyDataTemplate>
                </asp:GridView>
                <div>
                    <asp:LinkButton ID="lbtn_add_all" runat="server" CssClass="fas fa-angle-double-down" OnClick="lbtn_add_all_Click"></asp:LinkButton>
                </div>
            </ContentTemplate>

        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="up_list" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <asp:HiddenField ID="ft_rowid" runat="server" />

                <div class="tb1">
                    <div class="tr">
                        <div class="td" style="text-align: center; font-size: 1.4em; color: #b598a1; font-weight: bold; width: 100%">
                            <%=getStr("inspect_record") %>
                        </div>
                    </div>
                    <div class="tr">
                        <div class="td" style="width: 95%; margin: 0;">
                            <asp:GridView ID="all_list" runat="server" AllowPaging="false" AutoGenerateColumns="false" Font-Size="Medium" Width="100%"
                                OnRowDataBound="all_list_RowDataBound" OnRowCommand="all_list_RowCommand" CssClass="all_table" EmptyDataText="沒有資料" EmptyDataRowStyle-BackColor="White">
                                <Columns>

                                    <asp:BoundField DataField="base_id" HeaderText="base_id" Visible="true">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="inspect_id" HeaderText="inspect_id" Visible="true">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Item" HeaderStyle-Width="40">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inspect" HeaderStyle-Width="70">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Inspect Count Quantity" HeaderStyle-Width="100">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sample Standard" HeaderStyle-Width="100">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sample Count Quantity" HeaderStyle-Width="100">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="bith_date" HeaderText="Manufacturing Date" HeaderStyle-Width="110">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="b_operator" HeaderText="Operator" HeaderStyle-Width="100">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="View" HeaderStyle-Width="500">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update" HeaderStyle-Width="40">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Del" HeaderStyle-Width="40">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtn_All_del" runat="server" CommandName="Del_All" title="Del" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" class="far fa-trash-alt"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <thead>
                                        <tr>
                                            <th style="width: 5%">Item</th>
                                            <th style="width: 10%"><%=getStr("insp_type") %></th>
                                            <th style="width: 10%"><%=getStr("inspct_num") %></th>
                                            <th style="width: 12%"><%=getStr("sp_stand") %></th>
                                            <th style="width: 10%"><%=getStr("samp_num") %></th>
                                            <th style="width: 10%"><%=getStr("birth_dt") %></th>
                                            <th style="width: 10%"><%=getStr("assembly_staff") %></th>
                                            <th style="width: 25%">View</th>
                                            <th style="width: 8%">Del</th>
                                        </tr>
                                    </thead>

                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="t1">
            <div class="tb1">
                <div class="tr" style="text-align: left">
                    <div class="td">
                        <SmoothEnterpriseWebControl:InputButton ID="Btn_Save" runat="server" Text="save" OnClick="Btn_Save_Click" OnClientClick="return Leica_chk()">
                        </SmoothEnterpriseWebControl:InputButton>

                        <SmoothEnterpriseWebControl:InputButton ID="Btn_Cancel" runat="server" Text="Cancel" Visible="true" OnClientClick="return cancel()" OnClick="Btn_Cancel_Click" />


                        <SmoothEnterpriseWebControl:InputButton ID="Btn_Back" runat="server" Text="Back" Visible="true" OnClientClick="return Nomarl.goto('Leica.aspx')" />

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

