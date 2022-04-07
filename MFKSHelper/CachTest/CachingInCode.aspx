<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CachingInCode.aspx.cs" Inherits="MFKSHelper.CachTest.CachingInCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="font-family: Arial">
                Server Time : 
    <asp:Label ID="Label1" runat="server" Font-Bold="true"></asp:Label>
                <br />
                <br />
                Client Time:
    <b>
        <script type="text/javascript">
            document.write(Date());
        </script>
    </b>
            </div>
        </div>
    </form>
</body>
</html>
