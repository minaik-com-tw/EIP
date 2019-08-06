<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie_Edge.master" AutoEventWireup="true" CodeFile="Join.aspx.cs" Inherits="Build.Join" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <script>
            var curr = "";


            $(function () {
                getTree(0);
                $("ul a").click(function () {
                    refresh_list(this);
                });

                //release();
                setInterval("release();", 10 * 1000);
            });

            var opens = new Array();

            function release() {

                opens = reader_open();
                getTree(0);
                setTimeout("befer_open();", 500);
            }

            function befer_open() {

                for (var j = 0; j < opens.length; j++) {
                    var id = "#" + opens[j];
                    $(id).next("ul").css("display", "block");

                    if (opens[j] == curr) {
                        $(id).focus();
                        $(id).next("ul").css("display", "block");
                    }
                }
            }

            function reader_open() {

                var array = new Array();
                var i = 0;
                $("ul").each(function () {
                    var display = $(this).css("display");
                    if (display == "block") {
                        var id = $(this).prev("a").attr("id");

                        if (typeof (id) !== 'undefined') {
                            array[i] = id;
                            i++;
                        }
                    }

                });

                return array
            }

            function getTree(fadeIn) {

                $.get("tree.aspx", function (data) {
                    $("#tree").html(data);

                    if (fadeIn == 1) {
                        $(".tree_show").css("display", "none");
                        $(".tree_show").fadeIn(100);
                    }

                    $("#tree a").click(function () {
                        refresh_list(this);
                    });

                    if (curr != null) {
                        $("#" + curr).css("color", "red");
                    }

                })
            }



            function refresh_list(element) {
                //next_tag, next_tag
                var next_tag = $(element).attr("next_tag");
                var rowid = $(element).attr("id");
                $(element).css("color", "red");

                if (curr != "") {
                    $("#" + curr).css("color", "");
                }

                curr = rowid;


                $.ajax({
                    url: 'treelist.aspx',                        // url位置
                    type: 'post',                   // post/get
                    data: {
                        next_tag: next_tag,
                        parent_id: rowid
                    },       // 輸入的資料
                    error: function error(xhr, status, error) {

                        $("#list").html(xhr.responseText);
                    },      // 錯誤後執行的函數
                    success: function (data) {
                        $("#list").html(data);
                    }// 成功後要執行的函數
                });
            }

            function tree_refresh() {

                opens = reader_open();
                getTree(1);
                setTimeout("befer_open();", 500);

            }

            function tree_update(action) {

                $("ul").children().find("ul").css("display", action);
            }
        </script>
        <style>
            .div_btn {
                display: table-cell;
                width: 90px;
                text-align: center;
                background-color: #4A225D;
                border: 1px solid #ffffff;
                padding: 2px 2px;
                color: #5DAC81 !important;
                cursor: pointer;
            }

                .div_btn .fas {
                    margin: 10px;
                    font-size: 1.4em;
                    color: #5DAC81;
                }

                    .div_btn .fas:hover {
                        color: #ffd800;
                    }

                .div_btn div i {
                    font-size: 11px;
                }

                .div_btn div {
                    line-height: 15px;
                }

            ul a {
                text-decoration: none;
                color: #2775b6
            }
        </style>
    </header>

    <div style="display: table; width: 1200px; border: 1px solid #808080">
        <div style="float: left; border-right: 1px solid #808080; width: 300px">

            <div style="text-align: center; background-color: lightgray; border-bottom: 1px outset #808080;">
                <div class="div_btn" onclick="tree_refresh()">
                    <div class="fas fa-redo-alt">
                        <br />
                        <i>更新
                        </i>
                    </div>
                </div>
                <div class="div_btn" onclick="tree_update('block')">
                    <div class="fas fa-folder-open">
                        <br />
                        <i>全部打開
                        </i>
                    </div>


                </div>
                <div class="div_btn" onclick="tree_update('none')">
                    <div class="fas fa-folder">
                        <br />
                        <i>全部關閉
                        </i>
                    </div>

                </div>
            </div>
            <div id="tree" style="text-align: left; overflow-y: scroll; height: 500px; width: 100%">
            </div>

        </div>
        <div style="float: left">

            <div id="list" style="border: 0px solid #4A225D; width: 850px">
                <div style="text-align: center; margin-top: 20%; margin-left: 10%; width: 300px;" class="fas fa-2x fa-arrow-alt-circle-left">請先選擇項目</div>
            </div>
        </div>

    </div>
</asp:Content>

