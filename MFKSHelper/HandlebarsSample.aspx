<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandlebarsSample.aspx.cs" Inherits="MFKSHelper.HandlebarsSample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="/Scripts/jquery-3.4.1.min.js"></script>
    <script src="/Scripts/handlebars.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <script id="myBlock" type="text/x-handlebars-template">
            <h1>{{tmp}}</h1>
        </script>

        <div class="js-container"></div>

        <script>
            $(document).ready(
                function () {
                    var source = $('#myBlock').html();
                    var template = Handlebars.compile(source);
                    var tmp =  'Hello';
                    var result = template(tmp);
                    console.log(result);

                    $('.js-container').html(result);
                }
            );

            
        </script>
    </form>
</body>
</html>
