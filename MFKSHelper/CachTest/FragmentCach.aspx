<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FragmentCach.aspx.cs" Inherits="MFKSHelper.CachTest.FragmentCach" %>

<%@ Register Src="~/CachTest/UserControl/UCProductsControl.ascx" TagPrefix="uc1" TagName="UCProductsControl" %>


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
    <table style="border: 1px solid black">
        <tr>
            <td>
                Page content that changes
            </td>
        </tr>
        <tr>
            <td>
                <b>Page Server Time:
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </b>
            </td>
        </tr>
        <tr>
            <td>
                <b>Page Client Time:
                    <script type="text/javascript">
                        document.write(Date());
                    </script>
                </b>
            </td>
        </tr>
        <tr>
            <td>
                <br /><br />
                <uc1:UCProductsControl ID="UCProductsControl1" runat="server" />    
            </td>
        </tr>
    </table>
</div>
        </div>
    </form>
</body>
</html>
