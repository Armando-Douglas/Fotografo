<%@ Page Title="" Language="C#" MasterPageFile="~/mp-admin.master" AutoEventWireup="true" CodeFile="adm_cliente.aspx.cs" Inherits="adm_cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="formAdminCliente" runat="server">
        <div class="container-fluid">
            <div class="col-sm-8 cssescuro">
                <div class="well-sm" style="background-color: #222; width: 736px; color: #fff; margin-top: 20px">Lista de clientes cadastrados</div>
                <asp:GridView ID="GridView1" CssClass="grid-view" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id,tipo">
                    <Columns>
                        <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                        <asp:BoundField DataField="data_cadastro" HeaderText="Data de Cadastro" SortExpression="data_cadastro" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField HeaderText="Permissão" SortExpression="tipo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tipo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("tipo") %>'>
                                    <asp:ListItem Value="1">Administrador</asp:ListItem>
                                    <asp:ListItem Value="2">Fotografo</asp:ListItem>
                                    <asp:ListItem Value="3">Cliente</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deletar" ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/imgProjeto/delete96.png" Text="Delete" OnClientClick="return confirm('Deseja excluir este usuário ?')"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        Nenhum cliente cadastrado.
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" SelectCommand="SELECT * FROM [Usuario]" DeleteCommand="DELETE FROM [Usuario] WHERE [id] = @original_id" InsertCommand="INSERT INTO [Usuario] ([nome], [email], [senha], [tipo], [data_cadastro]) VALUES (@nome, @email, @senha, @tipo, @data_cadastro)" UpdateCommand="UPDATE [Usuario] SET [tipo] = @tipo WHERE [id] = @original_id" OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:RouteParameter Name="original_id" RouteKey="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="senha" Type="String" />
                <asp:Parameter Name="tipo" Type="Int32" />
                <asp:Parameter DbType="Date" Name="data_cadastro" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter DbType="Date" Name="data_cadastro" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:RouteParameter Name="tipo" RouteKey="tipo" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>

