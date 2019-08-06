<%@ Page Language="C#" AutoEventWireup="true" CodeFile="treeList.aspx.cs" Inherits="Build.treeList" Debug="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>
    <style>
        .cell {
            float: left;
            text-align: center;
            padding: 10px;
            border: 0px solid red;
        }
    </style>
    <script>

        var left_list = null, _right_list = null;

        function toMove2(position) {


            var origin = "#lb_select", dest = "#lb_list";
            if (position != 'right') {
                origin = "#lb_list";
                dest = "#lb_select";
            }

            var selected = $(origin + ' option:selected');

            var array = new Array();

            $(selected).each(function (i) {

                var select = $(this)[0].value
                array[i] = select;
            });

            if (array.length > 0) {
                if (array.length > 0) {

                    var rowid = array.join();

                    $(origin + ' option:selected').appendTo(dest);//加入表中


                    if (position == 'left') {
                        save(rowid, 'add');
                    } else {
                        save(rowid, 'del');
                    }

                    var count = $(origin + ' option').length;

                    if (count > 0) {
                        //$(origin+' option:[index=1]').attr('selected', true);
                        $(origin)[0].selectedIndex = 0;
                    }
                }

            }
        }

        function toMove(position) {
            var origin = "#lb_select", dest = "#lb_list";
            if (position != 'right') {
                origin = "#lb_list";
                dest = "#lb_select";
            }

            $(dest).parent().css("border", "0px solid red");
            $(origin).parent().css("border", "0px solid red");

            var originS = origin + ' option:selected';

            var option = $(originS);

            if (option.length > 0) {

                $(dest).append(option);

                $(originS).remove();

                var selected = $(dest + ' option').length - 1;
                $(dest)[0].selectedIndex = selected;

                // $('select[name=' + listbox1 + '] option').appendTo('#' + listbox2);

                var rowid = $(option).val();
                console.log(rowid);

                if (position == 'left') {
                    save(rowid, 'add');
                } else {
                    save(rowid, 'del');
                }
            }
            var count = $(origin + ' option').length;
            if (count > 0) {
                //$(origin+' option:[index=1]').attr('selected', true);
                $(origin)[0].selectedIndex = 0;
            }


        }

        function save(rowid, action) {

            var next_tag = $("#next_tag").val();
            var user = $("#user").val();
            var parent_id = $("#parent_id").val();

            if (parent_id !== "") {
                $.ajax({
                    url: 'join_save.ashx',
                    type: 'POST',
                    data: {
                        user: user,
                        action: action,
                        next_tag: next_tag,
                        item_id: rowid,
                        parent_id: parent_id
                    },
                    error: function (xhr) {

                        alert('資料錯誤，請洽MIS');
                    }
                    //, success: function (data) { }
                });
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <div style="display: none">
                <asp:HiddenField ID="user" Value="" runat="server" />
                <asp:HiddenField ID="parent_id" Value="" runat="server" />
                <asp:HiddenField ID="next_tag" Value="" runat="server" />
            </div>
            <div id="orgin" style="padding: 5%">
                <div style="padding: 10px; color: #0094ff; text-align: left">
                    <asp:Label ID="lab_tag" runat="server"></asp:Label>

                </div>

                <div>
                    <div class="cell">
                        <div>
                            已選擇項目<br />
                            <asp:ListBox ID="lb_select" runat="server" SelectionMode="Multiple" Width="250" Height="400" Font-Size="Medium"></asp:ListBox>
                        </div>
                    </div>
                    <div class="cell" style="padding-top: 20%">
                        <div>
                            <input type="button" id="btn_left" value="<" onclick="toMove2('left')" style="width: 100px" />
                            <br />
                            <br />
                            <input type="button" id="btn_right" value=">" onclick="toMove2('right')" style="width: 100px" />
                        </div>
                    </div>
                    <div class="cell">
                        <div>
                            可選擇項目<br />
                            <asp:ListBox ID="lb_list" runat="server" SelectionMode="Multiple" Width="250" Height="400" Font-Size="Medium"></asp:ListBox>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
