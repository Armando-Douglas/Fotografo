<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModal.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="width: 400px">
        <h2>Login</h2>
        <div class="form-group">
            <label for="usr">Email:</label>
            <asp:TextBox ID="tbxEmail" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="pwd">Senha:</label>
            <asp:TextBox ID="tbxSenha" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
        </div>
        <asp:Label ID="lblInformacao" runat="server"></asp:Label>
        <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-block" runat="server" Text="Entrar" OnClick="btnLogin_Click" style="background-color: #222" />
    </div>
</asp:Content>

