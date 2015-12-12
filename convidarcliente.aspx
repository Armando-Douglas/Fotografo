<%@ Page Title="" Language="C#" MasterPageFile="~/mp-fotografo.master" AutoEventWireup="true" CodeFile="convidarcliente.aspx.cs" Inherits="convidarcliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="formconvidarcliente" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-top: 20px">
                                <div class="well-sm" style="background-color: #222; width: auto; color: #fff; margin-top: 20px">Convidar clientes</div>
                <div class="col-sm-4 cssescuro">
                    <div class="well text-center" style="background-color: #222; color: #fff; margin-top: 20px">Novo Cliente</div>
                    <div class="form-group-lg">
                        <label for="tbxNome" style="color: #fff;">Nome:</label>
                        <asp:TextBox CssClass="form-control" ID="tbxNome" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group-lg">
                        <label for="tbxEmail" style="color: #fff;">Email:</label>
                        <asp:TextBox CssClass="form-control" ID="tbxEmail" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group-lg">
                        <label for="tbxSenha" style="color: #fff;">Senha:</label>
                        <asp:TextBox CssClass="form-control" ID="tbxSenha" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group-lg" style="margin-top: 10px">
                        <label for="dropdownlist1" style="color: #fff;">Galeria:</label>
                        <asp:DropDownList CssClass="btn btn-primary dropdown-toggle cssescurobt" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_galeria" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group-lg" style="margin-top: 5%; text-align: right">
                        <asp:Button ID="Cadastra" CssClass="btn btn-primary btn-md cssescurobt" runat="server" Text="Salvar" OnClick="Cadastra_Click" />
                    </div>
                </div>
                <div class="col-sm-8 cssescuro">
                    <div class="well-sm" style="background-color: #222; width: 736px; color: #fff; margin-top: 20px">Lista de clientes cadastrados</div>
                    <asp:GridView ID="GridView1" CssClass="grid-view" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" DataKeyNames="id">
                        <Columns>
                            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                            <asp:BoundField DataField="Expr1" HeaderText="Galeria" SortExpression="Expr1" />
                            <asp:BoundField DataField="Galerias" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data de cadastro" SortExpression="Galerias" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/imgProjeto/delete96.png" Text="Delete" OnClientClick="return confirm('Deseja excluir este cliente ?')" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            Nenhum cliente cadastrado.
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" DeleteCommand="DELETE FROM [Usuario] WHERE [id] = @id" InsertCommand="INSERT INTO [Usuario] ([nome], [email], [senha], [tipo]) VALUES (@nome, @email, @senha, @tipo)" SelectCommand="SELECT [id], [nome], [email], [senha], [tipo] FROM [Usuario]" UpdateCommand="UPDATE [Usuario] SET [nome] = @nome, [email] = @email, [senha] = @senha, [tipo] = @tipo WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="tbxNome" Name="nome" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbxEmail" Name="email" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="Label1" Name="senha" PropertyName="Text" Type="String" />
                    <asp:Parameter DefaultValue="3" Name="tipo" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="senha" Type="String" />
                    <asp:Parameter Name="tipo" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" SelectCommand="SELECT * FROM [Galeria] WHERE ([id_usuario] = @id_usuario)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblid_usuario" Name="id_usuario" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" SelectCommand="SELECT u.nome, u.id, g.nome AS Expr1, p.data_cadastro AS Galerias FROM Usuario AS u INNER JOIN permissaousuario AS p ON u.id = p.id_usuario INNER JOIN Galeria AS g ON p.id_galeria = g.id_galeria WHERE (p.id_fotografo = @id_fotografo and p.id_fotografo != p.id_usuario)" DeleteCommand="delete usuario where id = @id">
                <DeleteParameters>
                    <asp:RouteParameter Name="id" RouteKey="id" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblid_usuario" Name="id_fotografo" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblid_usuario" runat="server" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="lblNomefotografo" runat="server" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </form>
</asp:Content>

