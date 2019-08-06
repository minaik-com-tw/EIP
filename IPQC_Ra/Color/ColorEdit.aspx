<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ColorEdit.aspx.cs" Inherits="Color.ColorEdit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

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
            Details="Input IPQC data" Caption="IPQC Add Page" Width="100%"
            CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
            <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
            <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
        </SmoothEnterpriseWebControlEnterprise:Descriptor>

        <link href="../../script/css/normalize.css" rel="stylesheet" />
        <link href="../../script/css/mak_base.css" rel="stylesheet" />
        <script>
         
        </script>
        <style>
            .div_td {
                border: 5px solid #ffffff;
                text-align: left;
            }

            .th {
                background-color: #ABD1B5;
                text-align: right;
                font-size: 20px;
                font-weight: bolder;
                color: aliceblue;
                width: 250px;
            }

            .th2 {
                background-color: lightgray;
                text-align: right;
                font-size: 20px;
                font-weight: bolder;
                color: aliceblue;
                width: 250px;
            }

            .div_td input {
                width: 120px;
            }

            .sys_btn {
                margin: 10px 10px;
            }
        </style>
        <script>
            $(function () {
                $(".color").click(function () {
                    var bgColor = $(this).attr("bgColor");


                    $("input[name='r_color']").each(function () {
                        var chk = $(this).prop("checked");
                        if (chk) {
                            var value = $(this).val();
                            if (value == 0) {
                                $("#ctl00_ContentPlaceHolder1_lab_upcolor").text(bgColor);
                                $("#ctl00_ContentPlaceHolder1_lab_upcolor").css({ "background-color": bgColor, "color": "#ffffff" });

                                $("#ctl00_ContentPlaceHolder1_txt_upcolor").val(bgColor);
                            }
                            else {
                                //ctl00_ContentPlaceHolder1_txt_downcolor
                                $("#ctl00_ContentPlaceHolder1_lab_downcolor").text(bgColor);
                                $("#ctl00_ContentPlaceHolder1_lab_downcolor").css({ "background-color": bgColor, "color": "#ffffff" });

                                $("#ctl00_ContentPlaceHolder1_txt_downcolor").val(bgColor);
                            }

                        }
                    });

                });
            });

            function back() {
                location.replace("color.aspx");
                return false;
            }

            function check() {
                var isPass = true;
                $(".request").each(function () {
                    var limit = $(this).val();
                    if (isNaN(limit)) {
                        //不是數字
                        isPass = false;
                        alert("請確認上下限為數字");
                        $(this).parent().css("background-color", "red");

                    }
                    else {
                        var intger = limit * 1;
                        if (intger <= 0) {
                            isPass = false;

                            alert("請確認上下限大於0");
                            $(this).parent().css("background-color", "red");

                        }
                    }

                    if (isPass == true) {
                        $(this).parent().css("background-color", "#fff");
                    }
                });
                return isPass;
            }
        </script>
    </header>

    <div id="master" class="div_table" style="text-align: center; padding: 2px 2px; border: 1px outset #446d4e">
        <div class="div_table">

            <div class="div_tr">
                <div class="div_td th">
                    Product type
                </div>
                <div class="div_td">
                    <asp:HiddenField ID="product_id" runat="server" />
                    <asp:Label ID="lab_product" runat="server"></asp:Label>
                </div>

            </div>
            <div class="div_tr">
                <div class="div_td th">上限(限數字:ex:0.145)</div>
                <div class="div_td">
                    <asp:TextBox ID="txt_up" runat="server" CssClass="request" ></asp:TextBox>
                </div>
                <div class="div_td th">Color
                    <input type="radio" name="r_color" value="0" checked="checked" /></div>
                <div class="div_td">
                    <asp:HiddenField ID="txt_upcolor" runat="server"></asp:HiddenField>
                    <asp:Label ID="lab_upcolor" runat="server" Width="150" ></asp:Label>
                </div>
            </div>

            <div class="div_tr">
                <div class="div_td th2">下限(限數字:ex:0.145) </div>
                <div class="div_td">
                    <asp:TextBox ID="txt_down" runat="server" CssClass="request"></asp:TextBox>
                </div>
                <div class="div_td th">Color<input type="radio" name="r_color" value="1" /></div>
                <div class="div_td">
                    <asp:HiddenField ID="txt_downcolor" runat="server"></asp:HiddenField> 
                    <asp:Label ID="lab_downcolor" runat="server" Width="150" ></asp:Label>
                </div>
            </div>
        </div>
        <div style="width: 100%; margin: 20px 10px;">
            <asp:Button ID="Btn_Save" runat="server" Text="儲存" OnClientClick="return check()" OnClick="Btn_Save_Click" CssClass="sys_btn " />

            <asp:Button ID="Cancel" runat="server" OnClientClick="return back()" Text="回列表" CssClass="sys_btn" />
        </div>

        <div class="toolbo">
            <table cellspacing="0" cellpadding="0" width="100%" align="center" border="1" bordercolor="#F0F0F0" style="background: #fff; color: #000;">
                <tbody>
                    <tr>
                        <td width="60" class="color" bgcolor="#000000" height="25"></td>
                        <td width="50" height="25">#000000</td>
                        <td width="60" class="color" bgcolor="#2f0000" height="25"></td>
                        <td width="50" height="25">#2F0000</td>
                        <td width="60" class="color" bgcolor="#600030" height="25"></td>
                        <td width="50" height="25">#600030</td>
                        <td width="60" class="color" bgcolor="#460046" height="25"></td>
                        <td width="50" height="25">#460046</td>
                        <td width="60" class="color" bgcolor="#28004d" height="25"></td>
                        <td width="50" height="25">#28004D</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#272727" height="25"></td>
                        <td>#272727</td>
                        <td class="color" bgcolor="#4d0000" height="25"></td>
                        <td>#4D0000</td>
                        <td class="color" bgcolor="#820041" height="25"></td>
                        <td>#820041</td>
                        <td class="color" bgcolor="#5e005e" height="25"></td>
                        <td>#5E005E</td>
                        <td class="color" bgcolor="#3a006f" height="25"></td>
                        <td>#3A006F</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#3c3c3c" height="25"></td>
                        <td>#3C3C3C</td>
                        <td class="color" bgcolor="#600000" height="25"></td>
                        <td>#600000</td>
                        <td class="color" bgcolor="#9f0050" height="25"></td>
                        <td>#9F0050</td>
                        <td class="color" bgcolor="#750075" height="25"></td>
                        <td>#750075</td>
                        <td class="color" bgcolor="#4b0091" height="25"></td>
                        <td>#4B0091</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#4f4f4f" height="25"></td>
                        <td>#4F4F4F</td>
                        <td class="color" bgcolor="#750000" height="25"></td>
                        <td>#750000</td>
                        <td class="color" bgcolor="#bf0060" height="25"></td>
                        <td>#BF0060</td>
                        <td class="color" bgcolor="#930093" height="25"></td>
                        <td>#930093</td>
                        <td class="color" bgcolor="#5b00ae" height="25"></td>
                        <td>#5B00AE</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#5b5b5b" height="25"></td>
                        <td>#5B5B5B</td>
                        <td class="color" bgcolor="#930000" height="25"></td>
                        <td>#930000</td>
                        <td class="color" bgcolor="#d9006c" height="25"></td>
                        <td>#D9006C</td>
                        <td class="color" bgcolor="#ae00ae" height="25"></td>
                        <td>#AE00AE</td>
                        <td class="color" bgcolor="#6f00d2" height="25"></td>
                        <td>#6F00D2</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#6c6c6c" height="25"></td>
                        <td>#6C6C6C</td>
                        <td class="color" bgcolor="#ae0000" height="25"></td>
                        <td>#AE0000</td>
                        <td class="color" bgcolor="#f00078" height="25"></td>
                        <td>#F00078</td>
                        <td class="color" bgcolor="#d200d2" height="25"></td>
                        <td>#D200D2</td>
                        <td class="color" bgcolor="#8600ff" height="25"></td>
                        <td>#8600FF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#7b7b7b" height="25"></td>
                        <td>#7B7B7B</td>
                        <td class="color" bgcolor="#ce0000" height="25"></td>
                        <td>#CE0000</td>
                        <td class="color" bgcolor="#ff0080" height="25"></td>
                        <td>#FF0080</td>
                        <td class="color" bgcolor="#e800e8" height="25"></td>
                        <td>#E800E8</td>
                        <td class="color" bgcolor="#921aff" height="25"></td>
                        <td>#921AFF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#8e8e8e" height="25"></td>
                        <td>#8E8E8E</td>
                        <td class="color" bgcolor="#ea0000" height="25"></td>
                        <td>#EA0000</td>
                        <td class="color" bgcolor="#ff359a" height="25"></td>
                        <td>#FF359A</td>
                        <td class="color" bgcolor="#ff00ff" height="25"></td>
                        <td>#FF00FF</td>
                        <td class="color" bgcolor="#9f35ff" height="25"></td>
                        <td>#9F35FF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#9d9d9d" height="25"></td>
                        <td>#9D9D9D</td>
                        <td class="color" bgcolor="#ff0000" height="25"></td>
                        <td>#FF0000</td>
                        <td class="color" bgcolor="#ff60af" height="25"></td>
                        <td>#FF60AF</td>
                        <td class="color" bgcolor="#ff44ff" height="25"></td>
                        <td>#FF44FF</td>
                        <td class="color" bgcolor="#b15bff" height="25"></td>
                        <td>#B15BFF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#adadad" height="25"></td>
                        <td>#ADADAD</td>
                        <td class="color" bgcolor="#ff2d2d" height="25"></td>
                        <td>#FF2D2D</td>
                        <td class="color" bgcolor="#ff79bc" height="25"></td>
                        <td>#FF79BC</td>
                        <td class="color" bgcolor="#ff77ff" height="25"></td>
                        <td>#FF77FF</td>
                        <td class="color" bgcolor="#be77ff" height="25"></td>
                        <td>#BE77FF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#bebebe" height="25"></td>
                        <td>#BEBEBE</td>
                        <td class="color" bgcolor="#ff5151" height="25"></td>
                        <td>#FF5151</td>
                        <td class="color" bgcolor="#ff95ca" height="25"></td>
                        <td>#FF95CA</td>
                        <td class="color" bgcolor="#ff8eff" height="25"></td>
                        <td>#FF8EFF</td>
                        <td class="color" bgcolor="#ca8eff" height="25"></td>
                        <td>#CA8EFF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#d0d0d0" height="25"></td>
                        <td>#d0d0d0</td>
                        <td class="color" bgcolor="#ff7575" height="25"></td>
                        <td>#ff7575</td>
                        <td class="color" bgcolor="#ffaad5" height="25"></td>
                        <td>#ffaad5</td>
                        <td class="color" bgcolor="#ffa6ff" height="25"></td>
                        <td>#ffa6ff</td>
                        <td class="color" bgcolor="#d3a4ff" height="25"></td>
                        <td>#d3a4ff</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#e0e0e0" height="25"></td>
                        <td>#E0E0E0</td>
                        <td class="color" bgcolor="#ff9797" height="25"></td>
                        <td>#FF9797</td>
                        <td class="color" bgcolor="#ffc1e0" height="25"></td>
                        <td>#FFC1E0</td>
                        <td class="color" bgcolor="#ffbfff" height="25"></td>
                        <td>#FFBFFF</td>
                        <td class="color" bgcolor="#dcb5ff" height="25"></td>
                        <td>#DCB5FF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#f0f0f0" height="25"></td>
                        <td>#F0F0F0</td>
                        <td class="color" bgcolor="#ffb5b5" height="25"></td>
                        <td>#FFB5B5</td>
                        <td class="color" bgcolor="#ffd9ec" height="25"></td>
                        <td>#FFD9EC</td>
                        <td class="color" bgcolor="#ffd0ff" height="25"></td>
                        <td>#FFD0FF</td>
                        <td class="color" bgcolor="#e6caff" height="25"></td>
                        <td>#E6CAFF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#fcfcfc" height="25"></td>
                        <td>#FCFCFC</td>
                        <td class="color" bgcolor="#ffd2d2" height="25"></td>
                        <td>#FFD2D2</td>
                        <td class="color" bgcolor="#ffecf5" height="25"></td>
                        <td>#FFECF5</td>
                        <td class="color" bgcolor="#ffe6ff" height="25"></td>
                        <td>#FFE6FF</td>
                        <td class="color" bgcolor="#f1e1ff" height="25"></td>
                        <td>#F1E1FF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#ffffff" height="25"></td>
                        <td>#FFFFFF</td>
                        <td class="color" bgcolor="#ffecec" height="25"></td>
                        <td>#FFECEC</td>
                        <td class="color" bgcolor="#fff7fb" height="25"></td>
                        <td>#FFF7FB</td>
                        <td class="color" bgcolor="#fff7ff" height="25"></td>
                        <td>#FFF7FF</td>
                        <td class="color" bgcolor="#faf4ff" height="25"></td>
                        <td>#FAF4FF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#000079" height="25"></td>
                        <td>#000079</td>
                        <td class="color" bgcolor="#000079" height="25"></td>
                        <td>#000079</td>
                        <td class="color" bgcolor="#003e3e" height="25"></td>
                        <td>#003E3E</td>
                        <td class="color" bgcolor="#006030" height="25"></td>
                        <td>#006030</td>
                        <td class="color" bgcolor="#006000" height="25"></td>
                        <td>#006000</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#000093" height="25"></td>
                        <td>#000093</td>
                        <td class="color" bgcolor="#003d79" height="25"></td>
                        <td>#003D79</td>
                        <td class="color" bgcolor="#005757" height="25"></td>
                        <td>#005757</td>
                        <td class="color" bgcolor="#01814a" height="25"></td>
                        <td>#01814A</td>
                        <td class="color" bgcolor="#007500" height="25"></td>
                        <td>#007500</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#0000c6" height="25"></td>
                        <td>#0000C6</td>
                        <td class="color" bgcolor="#004b97" height="25"></td>
                        <td>#004B97</td>
                        <td class="color" bgcolor="#007979" height="25"></td>
                        <td>#007979</td>
                        <td class="color" bgcolor="#019858" height="25"></td>
                        <td>#019858</td>
                        <td class="color" bgcolor="#009100" height="25"></td>
                        <td>#009100</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#0000c6" height="25"></td>
                        <td>#0000C6</td>
                        <td class="color" bgcolor="#005ab5" height="25"></td>
                        <td>#005AB5</td>
                        <td class="color" bgcolor="#009393" height="25"></td>
                        <td>#009393</td>
                        <td class="color" bgcolor="#01b468" height="25"></td>
                        <td>#01B468</td>
                        <td class="color" bgcolor="#00a600" height="25"></td>
                        <td>#00A600</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#0000e3" height="25"></td>
                        <td>#0000E3</td>
                        <td class="color" bgcolor="#0066cc" height="25"></td>
                        <td>#0066CC</td>
                        <td class="color" bgcolor="#00aeae" height="25"></td>
                        <td>#00AEAE</td>
                        <td class="color" bgcolor="#02c874" height="25"></td>
                        <td>#02C874</td>
                        <td class="color" bgcolor="#00bb00" height="25"></td>
                        <td>#00BB00</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#2828ff" height="25"></td>
                        <td>#2828FF</td>
                        <td class="color" bgcolor="#0072e3" height="25"></td>
                        <td>#0072E3</td>
                        <td class="color" bgcolor="#00caca" height="25"></td>
                        <td>#00CACA</td>
                        <td class="color" bgcolor="#02df82" height="25"></td>
                        <td>#02DF82</td>
                        <td class="color" bgcolor="#00db00" height="25"></td>
                        <td>#00DB00</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#4a4aff" height="25"></td>
                        <td>#4A4AFF</td>
                        <td class="color" bgcolor="#0080ff" height="25"></td>
                        <td>#0080FF</td>
                        <td class="color" bgcolor="#00e3e3" height="25"></td>
                        <td>#00E3E3</td>
                        <td class="color" bgcolor="#02f78e" height="25"></td>
                        <td>#02F78E</td>
                        <td class="color" bgcolor="#00ec00" height="25"></td>
                        <td>#00EC00</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#6a6aff" height="25"></td>
                        <td>#6A6AFF</td>
                        <td class="color" bgcolor="#2894ff" height="25"></td>
                        <td>#2894FF</td>
                        <td class="color" bgcolor="#00ffff" height="25"></td>
                        <td>#00FFFF</td>
                        <td class="color" bgcolor="#1afd9c" height="25"></td>
                        <td>#1AFD9C</td>
                        <td class="color" bgcolor="#28ff28" height="25"></td>
                        <td>#28FF28</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#7d7dff" height="25"></td>
                        <td>#7D7DFF</td>
                        <td class="color" bgcolor="#46a3ff" height="25"></td>
                        <td>#46A3FF</td>
                        <td class="color" bgcolor="#4dffff" height="25"></td>
                        <td>#4DFFFF</td>
                        <td class="color" bgcolor="#4efeb3" height="25"></td>
                        <td>#4EFEB3</td>
                        <td class="color" bgcolor="#53ff53" height="25"></td>
                        <td>#53FF53</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#9393ff" height="25"></td>
                        <td>#9393FF</td>
                        <td class="color" bgcolor="#66b3ff" height="25"></td>
                        <td>#66B3FF</td>
                        <td class="color" bgcolor="#80ffff" height="25"></td>
                        <td>#80FFFF</td>
                        <td class="color" bgcolor="#7afec6" height="25"></td>
                        <td>#7AFEC6</td>
                        <td class="color" bgcolor="#79ff79" height="25"></td>
                        <td>#79FF79</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#aaaaff" height="25"></td>
                        <td>#AAAAFF</td>
                        <td class="color" bgcolor="#84c1ff" height="25"></td>
                        <td>#84C1FF</td>
                        <td class="color" bgcolor="#a6ffff" height="25"></td>
                        <td>#A6FFFF</td>
                        <td class="color" bgcolor="#96fed1" height="25"></td>
                        <td>#96FED1</td>
                        <td class="color" bgcolor="#93ff93" height="25"></td>
                        <td>#93FF93</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#b9b9ff" height="25"></td>
                        <td>#B9B9FF</td>
                        <td class="color" bgcolor="#97cbff" height="25"></td>
                        <td>#97CBFF</td>
                        <td class="color" bgcolor="#bbffff" height="25"></td>
                        <td>#BBFFFF</td>
                        <td class="color" bgcolor="#adfedc" height="25"></td>
                        <td>#ADFEDC</td>
                        <td class="color" bgcolor="#a6ffa6" height="25"></td>
                        <td>#A6FFA6</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#ceceff" height="25"></td>
                        <td>#CECEFF</td>
                        <td class="color" bgcolor="#acd6ff" height="25"></td>
                        <td>#ACD6FF</td>
                        <td class="color" bgcolor="#caffff" height="25"></td>
                        <td>#CAFFFF</td>
                        <td class="color" bgcolor="#c1ffe4" height="25"></td>
                        <td>#C1FFE4</td>
                        <td class="color" bgcolor="#bbffbb" height="25"></td>
                        <td>#BBFFBB</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#ddddff" height="25"></td>
                        <td>#DDDDFF</td>
                        <td class="color" bgcolor="#c4e1ff" height="25"></td>
                        <td>#C4E1FF</td>
                        <td class="color" bgcolor="#d9ffff" height="25"></td>
                        <td>#D9FFFF</td>
                        <td class="color" bgcolor="#d7ffee" height="25"></td>
                        <td>#D7FFEE</td>
                        <td class="color" bgcolor="#ceffce" height="25"></td>
                        <td>#CEFFCE</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#ececff" height="25"></td>
                        <td>#ECECFF</td>
                        <td class="color" bgcolor="#d2e9ff" height="25"></td>
                        <td>#D2E9FF</td>
                        <td class="color" bgcolor="#ecffff" height="25"></td>
                        <td>#ECFFFF</td>
                        <td class="color" bgcolor="#e8fff5" height="25"></td>
                        <td>#E8FFF5</td>
                        <td class="color" bgcolor="#dfffdf" height="25"></td>
                        <td>#DFFFDF</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#fbfbff" height="25"></td>
                        <td>#FBFBFF</td>
                        <td class="color" bgcolor="#ecf5ff" height="25"></td>
                        <td>#ECF5FF</td>
                        <td class="color" bgcolor="#fdffff" height="25"></td>
                        <td>#FDFFFF</td>
                        <td class="color" bgcolor="#fbfffd" height="25"></td>
                        <td>#FBFFFD</td>
                        <td class="color" bgcolor="#f0fff0" height="25"></td>
                        <td>#F0FFF0</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#467500" height="25"></td>
                        <td>#467500</td>
                        <td class="color" bgcolor="#424200" height="25"></td>
                        <td>#424200</td>
                        <td class="color" bgcolor="#5b4b00" height="25"></td>
                        <td>#5B4B00</td>
                        <td class="color" bgcolor="#844200" height="25"></td>
                        <td>#844200</td>
                        <td class="color" bgcolor="#642100" height="25"></td>
                        <td>#642100</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#548c00" height="25"></td>
                        <td>#548C00</td>
                        <td class="color" bgcolor="#5b5b00" height="25"></td>
                        <td>#5B5B00</td>
                        <td class="color" bgcolor="#796400" height="25"></td>
                        <td>#796400</td>
                        <td class="color" bgcolor="#9f5000" height="25"></td>
                        <td>#9F5000</td>
                        <td class="color" bgcolor="#842b00" height="25"></td>
                        <td>#842B00</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#64a600" height="25"></td>
                        <td>#64A600</td>
                        <td class="color" bgcolor="#737300" height="25"></td>
                        <td>#737300</td>
                        <td class="color" bgcolor="#977c00" height="25"></td>
                        <td>#977C00</td>
                        <td class="color" bgcolor="#bb5e00" height="25"></td>
                        <td>#BB5E00</td>
                        <td class="color" bgcolor="#a23400" height="25"></td>
                        <td>#A23400</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#73bf00" height="25"></td>
                        <td>#73BF00</td>
                        <td class="color" bgcolor="#8c8c00" height="25"></td>
                        <td>#8C8C00</td>
                        <td class="color" bgcolor="#ae8f00" height="25"></td>
                        <td>#AE8F00</td>
                        <td class="color" bgcolor="#d26900" height="25"></td>
                        <td>#D26900</td>
                        <td class="color" bgcolor="#bb3d00" height="25"></td>
                        <td>#BB3D00</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#82d900" height="25"></td>
                        <td>#82D900</td>
                        <td class="color" bgcolor="#a6a600" height="25"></td>
                        <td>#A6A600</td>
                        <td class="color" bgcolor="#c6a300" height="25"></td>
                        <td>#C6A300</td>
                        <td class="color" bgcolor="#ea7500" height="25"></td>
                        <td>#EA7500</td>
                        <td class="color" bgcolor="#d94600" height="25"></td>
                        <td>#D94600</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#8cea00" height="25"></td>
                        <td>#8CEA00</td>
                        <td class="color" bgcolor="#c4c400" height="25"></td>
                        <td>#C4C400</td>
                        <td class="color" bgcolor="#d9b300" height="25"></td>
                        <td>#D9B300</td>
                        <td class="color" bgcolor="#ff8000" height="25"></td>
                        <td>#FF8000</td>
                        <td class="color" bgcolor="#f75000" height="25"></td>
                        <td>#F75000</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#9aff02" height="25"></td>
                        <td>#9AFF02</td>
                        <td class="color" bgcolor="#e1e100" height="25"></td>
                        <td>#E1E100</td>
                        <td class="color" bgcolor="#eac100" height="25"></td>
                        <td>#EAC100</td>
                        <td class="color" bgcolor="#ff9224" height="25"></td>
                        <td>#FF9224</td>
                        <td class="color" bgcolor="#ff5809" height="25"></td>
                        <td>#FF5809</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#a8ff24" height="25"></td>
                        <td>#A8FF24</td>
                        <td class="color" bgcolor="#f9f900" height="25"></td>
                        <td>#F9F900</td>
                        <td class="color" bgcolor="#ffd306" height="25"></td>
                        <td>#FFD306</td>
                        <td class="color" bgcolor="#ffa042" height="25"></td>
                        <td>#FFA042</td>
                        <td class="color" bgcolor="#ff8040" height="25"></td>
                        <td>#FF8040</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#b7ff4a" height="25"></td>
                        <td>#B7FF4A</td>
                        <td class="color" bgcolor="#ffff37" height="25"></td>
                        <td>#FFFF37</td>
                        <td class="color" bgcolor="#ffdc35" height="25"></td>
                        <td>#FFDC35</td>
                        <td class="color" bgcolor="#ffaf60" height="25"></td>
                        <td>#FFAF60</td>
                        <td class="color" bgcolor="#ff8f59" height="25"></td>
                        <td>#FF8F59</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#c2ff68" height="25"></td>
                        <td>#C2FF68</td>
                        <td class="color" bgcolor="#ffff6f" height="25"></td>
                        <td>#FFFF6F</td>
                        <td class="color" bgcolor="#ffe153" height="25"></td>
                        <td>#FFE153</td>
                        <td class="color" bgcolor="#ffbb77" height="25"></td>
                        <td>#FFBB77</td>
                        <td class="color" bgcolor="#ff9d6f" height="25"></td>
                        <td>#FF9D6F</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#ccff80" height="25"></td>
                        <td>#CCFF80</td>
                        <td class="color" bgcolor="#ffff93" height="25"></td>
                        <td>#FFFF93</td>
                        <td class="color" bgcolor="#ffe66f" height="25"></td>
                        <td>#FFE66F</td>
                        <td class="color" bgcolor="#ffc78e" height="25"></td>
                        <td>#FFC78E</td>
                        <td class="color" bgcolor="#ffad86" height="25"></td>
                        <td>#FFAD86</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#d3ff93" height="25"></td>
                        <td>#D3FF93</td>
                        <td class="color" bgcolor="#ffffaa" height="25"></td>
                        <td>#FFFFAA</td>
                        <td class="color" bgcolor="#ffed97" height="25"></td>
                        <td>#FFED97</td>
                        <td class="color" bgcolor="#ffd1a4" height="25"></td>
                        <td>#FFD1A4</td>
                        <td class="color" bgcolor="#ffbd9d" height="25"></td>
                        <td>#FFBD9D</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#deffac" height="25"></td>
                        <td>#DEFFAC</td>
                        <td class="color" bgcolor="#ffffb9" height="25"></td>
                        <td>#FFFFB9</td>
                        <td class="color" bgcolor="#fff0ac" height="25"></td>
                        <td>#FFF0AC</td>
                        <td class="color" bgcolor="#ffdcb9" height="25"></td>
                        <td>#FFDCB9</td>
                        <td class="color" bgcolor="#ffcbb3" height="25"></td>
                        <td>#FFCBB3</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#e8ffc4" height="25"></td>
                        <td>#E8FFC4</td>
                        <td class="color" bgcolor="#ffffce" height="25"></td>
                        <td>#FFFFCE</td>
                        <td class="color" bgcolor="#fff4c1" height="25"></td>
                        <td>#FFF4C1</td>
                        <td class="color" bgcolor="#ffe4ca" height="25"></td>
                        <td>#FFE4CA</td>
                        <td class="color" bgcolor="#ffdac8" height="25"></td>
                        <td>#FFDAC8</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#efffd7" height="25"></td>
                        <td>#EFFFD7</td>
                        <td class="color" bgcolor="#ffffdf" height="25"></td>
                        <td>#FFFFDF</td>
                        <td class="color" bgcolor="#fff8d7" height="25"></td>
                        <td>#FFF8D7</td>
                        <td class="color" bgcolor="#ffeedd" height="25"></td>
                        <td>#FFEEDD</td>
                        <td class="color" bgcolor="#ffe6d9" height="25"></td>
                        <td>#FFE6D9</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#f5ffe8" height="25"></td>
                        <td>#F5FFE8</td>
                        <td class="color" bgcolor="#fffff4" height="25"></td>
                        <td>#FFFFF4</td>
                        <td class="color" bgcolor="#fffcec" height="25"></td>
                        <td>#FFFCEC</td>
                        <td class="color" bgcolor="#fffaf4" height="25"></td>
                        <td>#FFFAF4</td>
                        <td class="color" bgcolor="#fff3ee" height="25"></td>
                        <td>#FFF3EE</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#613030" height="25"></td>
                        <td>#613030</td>
                        <td class="color" bgcolor="#616130" height="25"></td>
                        <td>#616130</td>
                        <td class="color" bgcolor="#336666" height="25"></td>
                        <td>#336666</td>
                        <td class="color" bgcolor="#484891" height="25"></td>
                        <td>#484891</td>
                        <td class="color" bgcolor="#6c3365" height="25"></td>
                        <td>#6C3365</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#743a3a" height="25"></td>
                        <td>#743A3A</td>
                        <td class="color" bgcolor="#707038" height="25"></td>
                        <td>#707038</td>
                        <td class="color" bgcolor="#3d7878" height="25"></td>
                        <td>#3D7878</td>
                        <td class="color" bgcolor="#5151a2" height="25"></td>
                        <td>#5151A2</td>
                        <td class="color" bgcolor="#7e3d76" height="25"></td>
                        <td>#7E3D76</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#804040" height="25"></td>
                        <td>#804040</td>
                        <td class="color" bgcolor="#808040" height="25"></td>
                        <td>#808040</td>
                        <td class="color" bgcolor="#408080" height="25"></td>
                        <td>#408080</td>
                        <td class="color" bgcolor="#5a5aad" height="25"></td>
                        <td>#5A5AAD</td>
                        <td class="color" bgcolor="#8f4586" height="25"></td>
                        <td>#8F4586</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#984b4b" height="25"></td>
                        <td>#984B4B</td>
                        <td class="color" bgcolor="#949449" height="25"></td>
                        <td>#949449</td>
                        <td class="color" bgcolor="#4f9d9d" height="25"></td>
                        <td>#4F9D9D</td>
                        <td class="color" bgcolor="#7373b9" height="25"></td>
                        <td>#7373B9</td>
                        <td class="color" bgcolor="#9f4d95" height="25"></td>
                        <td>#9F4D95</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#ad5a5a" height="25"></td>
                        <td>#AD5A5A</td>
                        <td class="color" bgcolor="#a5a552" height="25"></td>
                        <td>#A5A552</td>
                        <td class="color" bgcolor="#5cadad" height="25"></td>
                        <td>#5CADAD</td>
                        <td class="color" bgcolor="#8080c0" height="25"></td>
                        <td>#8080C0</td>
                        <td class="color" bgcolor="#ae57a4" height="25"></td>
                        <td>#AE57A4</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#b87070" height="25"></td>
                        <td>#B87070</td>
                        <td class="color" bgcolor="#afaf61" height="25"></td>
                        <td>#AFAF61</td>
                        <td class="color" bgcolor="#6fb7b7" height="25"></td>
                        <td>#6FB7B7</td>
                        <td class="color" bgcolor="#9999cc" height="25"></td>
                        <td>#9999CC</td>
                        <td class="color" bgcolor="#b766ad" height="25"></td>
                        <td>#B766AD</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#c48888" height="25"></td>
                        <td>#C48888</td>
                        <td class="color" bgcolor="#b9b973" height="25"></td>
                        <td>#B9B973</td>
                        <td class="color" bgcolor="#81c0c0" height="25"></td>
                        <td>#81C0C0</td>
                        <td class="color" bgcolor="#a6a6d2" height="25"></td>
                        <td>#A6A6D2</td>
                        <td class="color" bgcolor="#c07ab8" height="25"></td>
                        <td>#C07AB8</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#cf9e9e" height="25"></td>
                        <td>#CF9E9E</td>
                        <td class="color" bgcolor="#c2c287" height="25"></td>
                        <td>#C2C287</td>
                        <td class="color" bgcolor="#95caca" height="25"></td>
                        <td>#95CACA</td>
                        <td class="color" bgcolor="#b8b8dc" height="25"></td>
                        <td>#B8B8DC</td>
                        <td class="color" bgcolor="#ca8ec2" height="25"></td>
                        <td>#CA8EC2</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#d9b3b3" height="25"></td>
                        <td>#D9B3B3</td>
                        <td class="color" bgcolor="#cdcd9a" height="25"></td>
                        <td>#CDCD9A</td>
                        <td class="color" bgcolor="#a3d1d1" height="25"></td>
                        <td>#A3D1D1</td>
                        <td class="color" bgcolor="#c7c7e2" height="25"></td>
                        <td>#C7C7E2</td>
                        <td class="color" bgcolor="#d2a2cc" height="25"></td>
                        <td>#D2A2CC</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#e1c4c4" height="25"></td>
                        <td>#E1C4C4</td>
                        <td class="color" bgcolor="#d6d6ad" height="25"></td>
                        <td>#D6D6AD</td>
                        <td class="color" bgcolor="#b3d9d9" height="25"></td>
                        <td>#B3D9D9</td>
                        <td class="color" bgcolor="#d8d8eb" height="25"></td>
                        <td>#D8D8EB</td>
                        <td class="color" bgcolor="#dab1d5" height="25"></td>
                        <td>#DAB1D5</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#ebd6d6" height="25"></td>
                        <td>#EBD6D6</td>
                        <td class="color" bgcolor="#dedebe" height="25"></td>
                        <td>#DEDEBE</td>
                        <td class="color" bgcolor="#c4e1e1" height="25"></td>
                        <td>#C4E1E1</td>
                        <td class="color" bgcolor="#e6e6f2" height="25"></td>
                        <td>#E6E6F2</td>
                        <td class="color" bgcolor="#e2c2de" height="25"></td>
                        <td>#E2C2DE</td>
                    </tr>
                    <tr>
                        <td class="color" bgcolor="#f2e6e6" height="25"></td>
                        <td>#F2E6E6</td>
                        <td class="color" bgcolor="#e8e8d0" height="25"></td>
                        <td>#E8E8D0</td>
                        <td class="color" bgcolor="#d1e9e9" height="25"></td>
                        <td>#D1E9E9</td>
                        <td class="color" bgcolor="#f3f3fa" height="25"></td>
                        <td>#F3F3FA</td>
                        <td class="color" bgcolor="#ebd3e8" height="25"></td>
                        <td>#EBD3E8</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</asp:Content>
