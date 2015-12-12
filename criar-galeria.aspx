<%@ Page Title="" Language="C#" MasterPageFile="~/mp-fotografo.master" AutoEventWireup="true" CodeFile="criar-galeria.aspx.cs" Inherits="criar_galeria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="formGaleria" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-top: 20px">
                <div class="well-sm" style="background-color: #222; width: 445px; color: #fff; margin-top: 20px">Cadastro de Galeria</div>
                <div class="col-sm-4 cssescuro">
                    <div class="well text-center" style="background-color: #222; color: #fff; margin-top: 20px">Nova Galeria</div>
                    <div class="form-group-lg">
                        <label for="tbxNome" class="csstexto">Nome da galeria:</label>
                        <asp:TextBox CssClass="form-control" ID="tbxNome" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group-lg" style="margin-top: 20px; text-align: right">
                        <asp:Button ID="btnSalvar" CssClass="btn btn-primary cssescurobt" runat="server" Text="Criar" OnClick="btnSalvar_Click" />
                    </div>
                    <div style="margin-top: 20px; text-align: right">
                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" ForeColor="White" Font-Size="12pt" />
                        <br />
                        <asp:Button ID="Button1" CssClass="btn btn-primary cssescurobt" runat="server" Text="Enviar" OnClick="Button1_Click" />
                        <p>
                            <asp:Label ID="listofuploadedfiles" runat="server" ForeColor="White"></asp:Label>
                        </p>
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

