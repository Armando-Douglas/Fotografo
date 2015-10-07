<%@ Page Title="" Language="C#" MasterPageFile="~/Select.master" AutoEventWireup="true" CodeFile="_criar-galeria.aspx.cs" Inherits="criar_galeria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                        <asp:RadioButtonList CssClass="checkbox" ID="rblGaleria" runat="server" RepeatDirection="Vertical">
                            <asp:ListItem Value="0">Publica</asp:ListItem>
                            <asp:ListItem Value="1">Privada</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="form-group-lg">
                        <label for="txtDescGaleria">Descrição da Galeria:</label>
                        <textarea class="form-control" id="txtDescGaleria" cols="20" rows="5"></textarea>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="well text-center" style="background-color: #222; font-family: 'Arial Black'; color: #FFFFFF;">Adicionar fotos</div>
                    <div class="form-group-lg">
                        <label for="fuImagens">Carregar imagens:</label>
                        <asp:FileUpload CssClass="form-control" ID="fuImagens" runat="server" OnClick="EnviarArquivo" />
                        <asp:Button CssClass="bg-primary" ID="btnEnviarArquivo" runat="server" Text="Enviar Arquivo" OnClick="EnviarArquivo" />
                        <br />
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                        <br />
                    </div>
                    <div class="form-group-lg">
                        <asp:GridView ID="gvfuImagens" runat="server" AutoGenerateColumns="false" EmptyDataText="Nenhum arquivo enviado">
                            <Columns>
                                <asp:BoundField DataField="Text" HeaderText="Nome do Arquivo" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDeleta" Text="Deletar" CommandArgument='<%# Eval("Value") %>' runat="server" OnClick="DeletarArquivo" OnClientClick="return confirm('Deseja realmente deletar este arquivo?');" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">.col-sm-4</div>
        </div>
    </form>
</asp:Content>

