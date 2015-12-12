<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <p>
                <asp:Label ID="listofuploadedfiles" runat="server"></asp:Label>
            </p>
        </div>
    </form>
</body>
</html>
