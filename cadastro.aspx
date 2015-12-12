<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModal.master" AutoEventWireup="true" CodeFile="cadastro.aspx.cs" Inherits="cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblJavaScript" runat="server" Text=""></asp:Label>
    <div class="row" style="margin-top: 0px; height: 593px; background-image: url(imgProjeto/391.jpg);">
        <div class="col-sm-4">
        </div>

        <div class="col-sm-4 cssescuro" style="width: 500px; margin-top: 50px">
            <div class="well-sm" style="background-color: #222; width: 470px; color: #fff; margin-top: 20px"><h4>Novo usuário</h4></div>
            <div class="form-group" style="margin-top: 20px">
                <label for="usr" style="color: #fff">Nome:</label>
                <asp:TextBox ID="tbxNome" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="usr" style="color: #fff">Email:</label>
                <asp:TextBox ID="tbxEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="usr" style="color: #fff">Senha:</label>
                <asp:TextBox ID="tbxSenha" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            </div>
            <div class="text-right">
                <asp:Button ID="btnSalvar" CssClass="btn btn-primary btn-block" runat="server" Text="Salvar" OnClick="btnSalvar_Click" Style="background-color: #222" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" SelectCommand="SELECT [id], [nome], [email], [senha], [tipo] FROM [Usuario]" DeleteCommand="DELETE FROM [Usuario] WHERE [id] = @id" InsertCommand="INSERT INTO [Usuario] ([nome], [email], [senha], [tipo]) VALUES (@nome, @email, @senha, @tipo)" UpdateCommand="UPDATE [Usuario] SET [nome] = @nome, [email] = @email, [senha] = @senha, [tipo] = @tipo WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="tbxNome" Name="nome" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="tbxEmail" Name="email" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Label1" Name="senha" PropertyName="Text" Type="String" />
                        <asp:Parameter DefaultValue="2" Name="tipo" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="nome" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="senha" Type="String" />
                        <asp:Parameter Name="tipo" Type="Int32" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <div class="col-sm-4">
        </div>
    </div>
</asp:Content>

