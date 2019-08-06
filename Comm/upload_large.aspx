<%@Page Language="C#" AutoEventWireup="true" CodeFile="upload_large.aspx.cs" Inherits="Comm_upload_large" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../script/js/jquery.min_1.6.1.js"></script>
    <script>
        $(function () {
           var show =$("#msg").val();
            
            alert(show);
            history.back();　
        });

        

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          
         <asp:HiddenField ID="msg" runat="server"  />
            ===========
     
        </div>
    </form>
</body>
</html>
