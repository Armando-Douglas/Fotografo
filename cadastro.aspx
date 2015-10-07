<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModal.master" AutoEventWireup="true" CodeFile="cadastro.aspx.cs" Inherits="cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblJavaScript" runat="server" Text=""></asp:Label>
    <%--<div class="container" style="width: 400px">--%>
    <div class="row">
        <div class="col-sm-2" style="background-color: #c1bebe">
        </div>
        <div class="col-sm-8">
            <h2>Novo usuário</h2>
            <div class="form-group">
                <label for="usr">Nome:</label>
                <asp:TextBox ID="tbxNome" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="usr">Email:</label>
                <asp:TextBox ID="tbxEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="usr">Senha:</label>
                <asp:TextBox ID="tbxSenha" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            </div>
            <div class="text-right">
                <asp:Button ID="btnSalvar" CssClass="btn btn-primary btn-block" runat="server" Text="Salvar" OnClick="btnSalvar_Click" Style="background-color: #222" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" DeleteCommand="DELETE FROM [Usuario] WHERE [id] = @id" InsertCommand="INSERT INTO [Usuario] ([nome], [email], [senha]) VALUES (@nome, @email, @senha)" SelectCommand="SELECT * FROM [Usuario]" UpdateCommand="UPDATE [Usuario] SET [nome] = @nome, [email] = @email, [senha] = @senha WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="tbxNome" Name="nome" PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbxEmail" Name="email" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="tbxSenha" Name="senha" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="nome" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="senha" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-sm-2" style=" height:auto; background-color:#808080">
        </div>
    </div>
</asp:Content>

