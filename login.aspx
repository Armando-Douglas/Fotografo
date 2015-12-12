<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModal.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row" style="margin-top: 0px; height: 593px; background-image: url(imgProjeto/391.jpg);">
        <div class="container cssescuro" style="width: 500px; height: 280px; margin-top: 50px">
            <div class="well-sm text-center" style="background-color: #222; width: 470px; color: #fff; margin-top: 20px">
                <h4>Autenticação do sistema</h4>
            </div>
            <div class="form-group" style="margin-top: 20px">
                <label for="usr" style="color: #fff">Email:</label>
                <asp:TextBox ID="tbxEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="pwd" style="color: #fff">Senha:</label>
                <asp:TextBox ID="tbxSenha" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            </div>
            <asp:DropDownList CssClass="btn btn-primary btn-block dropdown-toggle" ID="ddlTipo" runat="server" Style="background-color: #222">
                <asp:ListItem Value="-1">Selecione um perfil</asp:ListItem>
                <asp:ListItem Value="1">Administrador</asp:ListItem>
                <asp:ListItem Value="2">Fotografo</asp:ListItem>
                <asp:ListItem Value="3">Cliente</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblInformacao" runat="server" Style="color: #f00"></asp:Label>
            <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-block" runat="server" Text="Entrar" OnClick="btnLogin_Click" Style="background-color: #222" />
        </div>
    </div>
</asp:Content>

