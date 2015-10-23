<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModal.master" AutoEventWireup="true" CodeFile="cadastro.aspx.cs" Inherits="cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblJavaScript" runat="server" Text=""></asp:Label>
    <div class="row" style="margin-top:0px;height:565px;background-image:url(imgProjeto/391.jpg);">
        <div class="col-sm-4">
        </div>
        <div class="col-sm-4" style="width:500px;margin-top:50px">
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" SelectCommand="SELECT * FROM [Usuario]">
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-sm-4">
        </div>
    </div>
</asp:Content>

