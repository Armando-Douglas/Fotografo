<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

    <script src="bootstrap.fd.js" type="text/javascript"></script>
    <link href="bootstrap.fd.css" rel="stylesheet" type="text/css" />

    <script>
        $(document).ready(function () {
            $("#open_btn").click(function () {

                $.FileDialog({ multiple: true }).on('files.bs.filedialog', function (ev) {
                    var files = ev.files;

                    var data = new FormData();
                    for (var i = 0; i < files.length; i++) {
                        data.append(files[i].name, files[i]);
                    }
                    $.ajax({
                        url: "FileUploadHandler.ashx",
                        type: "POST",
                        data: data,
                        contentType: false,
                        processData: false,
                        success: function (result) {
                            alert(result);
                        },
                        error: function (err) {
                            alert(err.statusText)
                        }
                    });
                }).on('cancel.bs.filedialog', function (ev) {
                    alert("Cancelado!");
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <input type="button" id="open_btn" class="btn btn-primary" value="upload files">

    </div>
    </form>
</body>
</html>
