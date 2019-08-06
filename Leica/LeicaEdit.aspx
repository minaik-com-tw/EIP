<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie_Edge.master" AutoEventWireup="true" CodeFile="LeicaEdit.aspx.cs" Inherits="Leica.LeicaEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
  
        <style type="text/css">
            .tb1 {
                border: 1px solid #B19693;
                display: table;
                border-collapse: collapse;
                border-spacing: 0px;
                margin: 0px;
                padding: 0px;
                width: 100%;
            }
             
                .tb1 .tb1_tr {
                    display: table-row;
                }

                    .tb1 .tb1_tr .td, .tb1 .tb1_tr .th {
                        display: table-cell;
                        text-align: left;
                        font-size: 1.5em;
                        vertical-align: middle;
                        width: 180px;
                        border: 1px solid #8a988e;
                        height: 25px;
                        margin: 0px;
                        padding: 2px 4px 2px 4px;
                    }

                        .tb1 .tb1_tr .td input, .tb1 .tb1_tr .td select {
                            width: 120px;
                            height: 22px;
                        }

                    .tb1 .tb1_tr .th {
                        /*color: #FCFEEF;
                        background-color: #1E88A8;*/
                        font-weight: bolder;
                        width: 120px;
                        text-align: right;
                        color: #7B90D2;
                        background-color: #FCF4F5;
                    }

            #head .th {
                /*background-color: #A5A051;
                    color: #FCFEEF;*/
                font-weight: bolder;
                text-align: right;
                width: 110px;
                color: #A5A051;
            }

            #lbase .th {
                /*background-color: #bf3553;
                    color: #fff;*/
                color: #bf3553;
                font-weight: bolder;
                text-align: right;
                width: 110px;
            }

            #head {
                padding: 4px 4px 4px 4px;
                border: 2px solid #74759b;
            }

            #insp_add, #vmi_add, #ft_add {
                position: relative;
                color: #41ae3c;
                font-size: 2em;
                text-shadow: 1px 1px 2px #253d24 !important;
                cursor: pointer;
            }
             
                #insp_add:hover, #vmi_add:hover, #ft_add:hover {
                    color: #96c24e;
                    font-size: 2em;
                    text-shadow: 1px 1px 2px #bec936 !important;
                }

            .cell {
                display: table-cell;
                border: 1px solid #8a988e;
                text-align: center;
                vertical-align: middle;
            }
             
            .t1 {
                padding: 4px 4px 4px 4px;
                border: 2px solid #74759b;
                border-top: 0px solid #74759b;
            }
             
            #ft .tb1_tr .th {
                background-color: #F4F6F7;
            }

            #ft .cell {
                border: 1px solid #7B90D2
            }

            #vmi .tb1, #list .tb1 {
                margin: 4px 0px;
                padding: 2px;
            }

            #vmi .cell {
                border: 0px solid #b2cf87;
                padding: 2px;
            }

            #vmi .th {
                background-color: #f0f5e5;
                color: #5e665b;
            }
             
        </style>

    </header>


    <div style="text-align: center; font-size: 3.5em; color: #9b1e64; height: 35px; padding: 10px; font-weight: bolder">
        Leica Inspection Record 
    </div>
    <div id="head" class="t1" style="min-width: 1200px" >
        <div class="tb1">
            <div class="tb1_tr">
                <div class="th">類別</div>
                <div class="td">
                    <asp:DropDownList ID="ddl_kind" runat="server" meta:resourcekey="ddl_kindResource1">
                    </asp:DropDownList>
                </div>

                <div class="th">檢驗人員 </div>
                <div class="td">
                    <asp:TextBox ID="txt_operator" runat="server" CssClass="Muser" meta:resourcekey="txt_operatorResource1"></asp:TextBox>
                </div>
                <div class="th">檢驗日期</div>
                <div class="td">
                    <asp:TextBox ID="txt_inspDt" runat="server" CssClass="date" meta:resourcekey="txt_inspDtResource1"></asp:TextBox>
                </div>
            </div>
            <div class="tb1_tr">

                <div class="th">產品</div>
                <div class="td">
                    <asp:DropDownList ID="ddl_product" runat="server" meta:resourcekey="ddl_productResource1">
                    </asp:DropDownList>
                </div>
                <div class="th">機種</div>
                <div class="td">
                    <asp:DropDownList ID="ddl_program" runat="server" meta:resourcekey="ddl_programResource1">
                    </asp:DropDownList>
                </div>
                <div class="th">
                    總判定
                </div>
                <div class="td">
                    <asp:DropDownList ID="ddl_result" runat="server" meta:resourcekey="ddl_resultResource1">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
    <div class="t1" id="lbase">
        <div class="tb1">
            <div class="tb1_tr">
                <div class="th">檢驗別</div>
                <div class="td">
                    <asp:DropDownList ID="ddl_inspect" runat="server" meta:resourcekey="ddl_inspectResource1"></asp:DropDownList>
                </div>
                <div class="th">待驗數量</div>
                <div class="td">
                    <asp:TextBox ID="txt_insp_count" runat="server" Text="0" meta:resourcekey="txt_insp_countResource1"></asp:TextBox>
                </div>

                <div class="th">抽樣標準</div>
                <div class="td">
                    <asp:DropDownList ID="ddl_stand" runat="server" meta:resourcekey="ddl_standResource1"></asp:DropDownList>
                </div>
                <div class="th">抽樣數量</div>
                <div class="td">
                    <asp:TextBox ID="txt_samp_count" runat="server" Text="0" meta:resourcekey="txt_samp_countResource1"></asp:TextBox>
                </div>

            </div>
            <div class="tb1_tr">

                <div class="th">生產日期</div>
                <div class="td">
                    <asp:TextBox ID="txt_birthDt" runat="server" CssClass="date" meta:resourcekey="txt_birthDtResource1"></asp:TextBox>
                </div>

                <div class="th">組立人員</div>
                <div class="td" style="text-align: center">
                    <asp:TextBox ID="txt_b_opeartor" runat="server" CssClass="Muser" meta:resourcekey="txt_b_opeartorResource1"></asp:TextBox>

                </div>
                <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e; text-align: center">
                    <i id="insp_add" class="fa fa-list-ul fa-2x" title="Add inspect data"></i>
                </div>

                <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>
                <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>
                <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e; border-right: 1px solid #8a988e;"></div>

            </div>

        </div>
    </div>
    <div id="ft" class="t1" style="display: normal;">
           <div class="tb1" style="width: 100%" >
                <div class="tb1_tr ">
                    <div class="td" style="text-align :center;font-size:2em;color:#7B90D2;font-weight:bold" >
                        外觀檢測
                    </div>
                </div>
            </div>

        <div style="display: table; width: 100%">
            <div class="cell" style="width: 50%">
                <div style="display: table; width: 100%">
                    <div style="display: table-cell; width: 80%">
                        <div class="tb1 edit " style="width: 100%; float: left">
                            <div class="tb1_tr ">
                                <div class="th">*異常位置</div>
                                <div class="td">
                                    <asp:DropDownList ID="ddl_position" runat="server" meta:resourcekey="ddl_positionResource1"></asp:DropDownList>

                                </div>
                            </div>
                            <div class="tb1_tr ">
                                <div class="th">異常現象</div>
                                <div class="td">
                                    <asp:DropDownList ID="txt_shape" runat="server" meta:resourcekey="txt_shapeResource1"></asp:DropDownList><i id="shidd_add" class="fa fa-1x fa-plus" title="add record" style="padding: 2px; cursor: pointer;"></i>
                                </div>

                            </div>
                            <div class="tb1_tr ">
                                <div class="th">不良數量</div>
                                <div class="td">
                                    <asp:TextBox ID="txt_qty" runat="server" Text="0" meta:resourcekey="txt_qtyResource1"></asp:TextBox>
                                </div>
                            </div>
                            <div class="tb1_tr ">
                                <div class="th">判定</div>
                                <div class="td">
                                    <asp:DropDownList ID="ddl_judg" runat="server" meta:resourcekey="ddl_judgResource1">
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div style="display: table-cell;">
                        <i id="ft_add" class="fa fa-plus-circle" style="font-size: 3em" title="add record"></i>
                    </div>
                </div>
            </div>
            <div class="cell" style="width: 50%; border-left: 0px;">
                <div style="width: 100%">
                    <table border="1" style="width: 95%; border: 1px solid #B19693; border-collapse: collapse; font-size: medium; font-weight: bold; color: #9fa39a">
                        <tr style="background-color: #F4F6F7; color: #7B90D2">
                            <td>異常位置</td>
                            <td>異常現象</td>
                            <td>不良數量</td>
                            <td>判定</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>上</td>
                            <td>掉色</td>
                            <td>1</td>
                            <td>NG</td>
                            <td>
                                <input type="button" value="del" />
                            </td>
                        </tr>
                        <tr style="background-color: #F4F6F7">
                            <td>下</td>
                            <td>魚眼<br />
                                Base 斷裂<br />
                                殘膠<br />
                            </td>
                            <td>12</td>
                            <td>OK</td>
                            <td>
                                <input type="button" value="del" />
                            </td>
                        </tr>
                        <tr>
                            <td>右</td>
                            <td>殘膠<br />
                                魚眼<br />
                            </td>
                            <td>1</td>
                            <td>NG</td>
                            <td>
                                <input type="button" value="del" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div id="vmi" class="t1" style="display: normal">

        <div class="cell">
            <div class="tb1">
                <div class="tb1_tr ">
                    <div class="td" style="text-align :center;font-size:2em;color:#5e665b;font-weight:bold" >
                        功能檢測
                    </div>
                </div>
            </div>
            <div class="tb1">
                <div class="tb1_tr ">
                    <div class="th">產品編號</div>
                    <div class="td">
                        <asp:TextBox ID="txt_prod_index" runat="server" meta:resourcekey="txt_prod_indexResource1"></asp:TextBox>

                    </div>

                    <div class="th">檢測時間</div>
                    <div class="td">
                        <asp:TextBox ID="insp_date" runat="server" CssClass="Mclock" meta:resourcekey="insp_dateResource1"></asp:TextBox>
                    </div>

                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>
                </div>


            </div>
            <div class="tb1">
                <div class="tb1_tr ">
                    <div class="th">測試項目</div>
                    <div class="td">
                        <asp:DropDownList ID="DropDownList4" runat="server" meta:resourcekey="DropDownList4Resource1"></asp:DropDownList>
                    </div>

                    <div class="th">測試標準</div>
                    <div class="td">
                        <asp:DropDownList ID="DropDownList5" runat="server" meta:resourcekey="DropDownList5Resource1"></asp:DropDownList>
                    </div>

                    <div class="th">數量</div>
                    <div class="td">
                        <asp:TextBox ID="TextBox2" runat="server" Text="0" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                    </div>

                    <div class="th">判定</div>
                    <div class="td">
                        <asp:DropDownList ID="DropDownList6" runat="server" meta:resourcekey="DropDownList6Resource1">
                        </asp:DropDownList>
                    </div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;">
                        <i id="vmi_add" class="fa fa-plus-circle" title="add record"></i>
                    </div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>

                </div>
                <div class="tb1_tr ">
                    <div class="th">S1</div>
                    <div class="td">
                        <asp:TextBox ID="txt_s1" runat="server" meta:resourcekey="txt_s1Resource1"></asp:TextBox>
                    </div>

                    <div class="th">S2</div>
                    <div class="td">
                        <asp:TextBox ID="txt_s2" runat="server" meta:resourcekey="txt_s2Resource1"></asp:TextBox>
                    </div>

                    <div class="th">S3</div>
                    <div class="td">
                        <asp:TextBox ID="txt_s3" runat="server" meta:resourcekey="txt_s3Resource1"></asp:TextBox>
                    </div>

                    <div class="th">S4</div>
                    <div class="td">
                        <asp:TextBox ID="txt_s4" runat="server" meta:resourcekey="txt_s4Resource1"></asp:TextBox>
                    </div>

                    <div class="th">S5</div>
                    <div class="td">
                        <asp:TextBox ID="txt_s5" runat="server" meta:resourcekey="txt_s5Resource1"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="tb1">

                <table border="1" style="width: 100%; border: 1px solid #96c24e; border-collapse: collapse; font-size: medium; font-weight: bold; color: #5e665b">
                    <tr style="background-color: #9abeaf; color: #fff">
                        <td>item</td>
                        <td>產品編號</td>
                        <td>檢測時間</td>
                        <td>測試項目</td>
                        <td>測試標準</td>
                        <td>數量</td>
                        <td>判定</td>
                        <td>S1</td>
                        <td>S2</td>
                        <td>S3</td>
                        <td>S4</td>
                        <td>S5</td>
                        <td>Del</td>
                        <td>Copy</td>
                    </tr>
                    <tr style="background-color: #fff">
                        <td rowspan="3">item</td>
                        <td rowspan="3">產品編號</td>
                        <td rowspan="3">檢測時間</td>
                        <td>測試項目</td>
                        <td>測試標準</td>
                        <td>數量</td>
                        <td>判定</td>
                        <td>S1</td>
                        <td>S2</td>
                        <td>S3</td>
                        <td>S4</td>
                        <td>S5</td>
                        <td>Del</td>
                        <td rowspan="3">
                            <input type="button" value="copy" />
                        </td>
                    </tr>
                    <tr style="background-color: #fff">
                        <td>測試項目</td>
                        <td>測試標準</td>
                        <td>數量</td>
                        <td>判定</td>
                        <td>S1</td>
                        <td>S2</td>
                        <td>S3</td>
                        <td>S4</td>
                        <td>S5</td>
                        <td>
                            <input type="button" value="del" /></td>

                    </tr>
                    <tr style="background-color: #fff">
                        <td>測試項目</td>
                        <td>測試標準</td>
                        <td>數量</td>
                        <td>判定</td>
                        <td>S1</td>
                        <td>S2</td>
                        <td>S3</td>
                        <td>S4</td>
                        <td>S5</td>
                        <td>
                            <input type="button" value="del" /></td>
                    </tr>

                    <tr style="background-color: #dfecd5">
                        <td rowspan="3">item</td>
                        <td rowspan="3">產品編號</td>
                        <td rowspan="3">檢測時間</td>
                        <td>測試項目</td>
                        <td>測試標準</td>
                        <td>數量</td>
                        <td>判定</td>
                        <td>S1</td>
                        <td>S2</td>
                        <td>S3</td>
                        <td>S4</td>
                        <td>S5</td>
                        <td>
                            <input type="button" value="del" /></td>
                        <td rowspan="3">
                            <input type="button" value="copy" />
                        </td>
                    </tr>
                    <tr style="background-color: #dfecd5">
                        <td>測試項目</td>
                        <td>測試標準</td>
                        <td>數量</td>
                        <td>判定</td>
                        <td>S1</td>
                        <td>S2</td>
                        <td>S3</td>
                        <td>S4</td>
                        <td>S5</td>
                        <td>
                            <input type="button" value="del" /></td>
                    </tr>
                    <tr style="background-color: #dfecd5">
                        <td>測試項目</td>
                        <td>測試標準</td>
                        <td>數量</td>
                        <td>判定</td>
                        <td>S1</td>
                        <td>S2</td>
                        <td>S3</td>
                        <td>S4</td>
                        <td>S5</td>
                        <td>
                            <input type="button" value="del" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div id="list" class="t1">

        <div class="tb1">
            <div class="tb1_tr">
                <div class="td" style="text-align :center;font-size:2em;color:#b598a1;font-weight:bold" >
                    檢測記錄總表
                </div>
            </div>
        </div>
        <div class="tb1">
            <div class="tb1_tr">
                <div class="td"> 
                    <table border="1" style="width: 100%; border: 1px solid #B19693; border-collapse: collapse; font-size: medium; font-weight: bold; color: #c1651a">
                        <tr style="background-color: #b598a1; color: #fff">
                            <td>item</td>
                            <td>檢驗別</td>
                            <td>待驗數量</td>
                            <td>抽樣標準</td>
                            <td>抽樣數量</td>
                            <td>生產日期</td>
                            <td>組立人員</td>
                            <td>View</td>
                            <td>Del</td>
                        </tr>
                        <tr style="background-color: #f8f4ed">
                            <td>1</td>
                            <td>外觀</td>
                            <td>100</td>
                            <td>抽樣標準A</td>
                            <td>10</td>
                            <td>10:01:01</td>
                            <td>朱蒂</td>
                            <td>上/掉色/1/NG</td>
                            <td>
                                <input type="button" value="del" /></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>外觀</td>
                            <td>500</td>
                            <td>抽樣標準b</td>
                            <td>3</td>
                            <td>10:10:01</td>
                            <td>小金</td>
                            <td>下/掉色/1/NG</td>
                            <td>
                                <input type="button" value="del" /></td>
                        </tr>
                        <tr style="background-color: #f8f4ed">
                            <td>2</td>
                            <td>外觀</td>
                            <td>500</td>
                            <td>抽樣標準b</td>
                            <td>3</td>
                            <td>10:12:01</td>
                            <td>小花</td>
                            <td>右/殘膠,魚眼/1/NG</td>
                            <td>
                                <input type="button" value="del" /></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>功能</td>
                            <td>2500</td>
                            <td>抽樣標準1</td>
                            <td>50</td>
                            <td>10:12:01</td>
                            <td>依依</td>
                            <td>測試項目/測試標準/數量/判定<br />
                                測試項目/測試標準/數量/判定<br />
                                測試項目/測試標準/數量/判定<br />
                                測試項目/測試標準/數量/判定<br />
                            </td>
                            <td>
                                <input type="button" value="del" /></td>
                        </tr>
                        <tr style="background-color: #f8f4ed">
                            <td>3</td>
                            <td>功能</td>
                            <td>2500</td>
                            <td>抽樣標準1</td>
                            <td>50</td>
                            <td>10:12:01</td>
                            <td>依依</td>
                            <td>測試項目/測試標準/數量/判定<br />
                                測試項目/測試標準/數量/判定<br />
                                測試項目/測試標準/數量/判定<br />
                                測試項目/測試標準/數量/判定<br />
                            </td>
                            <td>
                                <input type="button" value="del" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        
         
    </div>

</asp:Content>

