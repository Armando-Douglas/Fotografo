<%@ Page Title="" Language="C#" MasterPageFile="~/Select.master" AutoEventWireup="true" CodeFile="criar-galeria.aspx.cs" Inherits="criar_galeria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            <div class="row">
                <div class="col-sm-4">
                    <div class="well text-center" style="background-color: #222; font-family: 'Arial Black'; color: #FFFFFF;">Nova Galeria</div>
                    <div class="form-group-lg">
                        <label for="tbxNome">Nome da galeria:</label>
                        <asp:TextBox CssClass="form-control" ID="tbxNome" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group-lg">
                        <label for="rblGaleria">Tipo da galeria:</label>
                        <asp:RadioButtonList CssClass="checkbox" ID="rblGaleria" runat="server" RepeatDirection="Vertical" Font-Size="10pt" Font-Names="Arial Black">
                            <asp:ListItem Value="0">Publica</asp:ListItem>
                            <asp:ListItem Value="1">Privada</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="form-group-lg">
                        <label for="txtDescGaleria">Descrição da Galeria:</label>
                        <textarea class="form-control" id="txtDescGaleria" cols="20" rows="5" maxlength="250"></textarea>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="well text-center" style="background-color: #222; font-family: 'Arial Black'; color: #FFFFFF;">Adicionar fotos</div>
                    <div class="form-group-lg">
                        <label for="open_btn">Click aqui para carregar imagens:</label>
                        <br />
                        <input type="button" id="open_btn" class="btn btn-primary" value="Enviar Arquivos" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

