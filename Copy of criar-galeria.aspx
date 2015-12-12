<%@ Page Title="" Language="C#" MasterPageFile="~/mp-fotografo.master" AutoEventWireup="true" CodeFile="Copy of criar-galeria.aspx.cs" Inherits="criar_galeria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="../js/fileinput.js" type="text/javascript"></script>
    <script src="../js/fileinput_locale_fr.js" type="text/javascript"></script>
    <script src="../js/fileinput_locale_es.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>--%>
    <script src="BootstrapDrag-Drop/bootstrap.fd.js" type="text/javascript"></script>
    <link href="BootstrapDrag-Drop/bootstrap.fd.css" rel="stylesheet" type="text/css" />
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
                    alert("Cancelled!");
                });
            });
        });
    </script>
    <form id="formGaleria" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-top: 20px">
                <div class="col-sm-4 cssescuro">
                    <div class="well text-center" style="background-color: #222; color: #fff; margin-top: 20px">Nova Galeria</div>
                    <div class="form-group-lg">
                        <label for="tbxNome" class="csstexto">Nome da galeria:</label>
                        <asp:TextBox CssClass="form-control" ID="tbxNome" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group-lg" style="margin-top: 20px;">
                        <asp:Button ID="btnSalvar" CssClass="btn btn-primary cssescurobt" runat="server" Text="Criar" OnClick="btnSalvar_Click" />
                    </div>
                    <div class="form-group-lg" style="margin-top:20px;">
                        <label for="open_btn" class="csstexto">Carregar imagens:</label>
                        <br />
                        <input type="button" id="open_btn" class="btn btn-primary cssescurobt" value="Enviar Arquivos" />
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" SelectCommand="SELECT [id_galeria], [id_usuario], [nome] FROM [Galeria]" DeleteCommand="DELETE FROM [Galeria] WHERE [id_galeria] = @id_galeria" InsertCommand="INSERT INTO [Galeria] ([id_usuario], [nome]) VALUES (@id_usuario, @nome)" UpdateCommand="UPDATE [Galeria] SET [id_usuario] = @id_usuario, [nome] = @nome WHERE [id_galeria] = @id_galeria">
            <DeleteParameters>
                <asp:Parameter Name="id_galeria" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="lblID" Name="id_usuario" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="tbxNome" Name="nome" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_usuario" Type="Int32" />
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="id_galeria" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" SelectCommand="SELECT MAX(id_galeria) AS Expr1 FROM Galeria"></asp:SqlDataSource>
        <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
    </form>
</asp:Content>

