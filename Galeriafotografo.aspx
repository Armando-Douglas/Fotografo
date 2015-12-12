<%@ Page Title="" Language="C#" MasterPageFile="~/mp-fotografo.master" AutoEventWireup="true" CodeFile="Galeriafotografo.aspx.cs" Inherits="Galeria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="css/basic.css" type="text/css" />
    <link rel="stylesheet" href="css/galleriffic-2.css" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="js/jquery.galleriffic.js"></script>
    <script type="text/javascript" src="js/jquery.opacityrollover.js"></script>
    <!-- We only want the thunbnails to display when javascript is disabled -->
    <div id="thumbs" class="navigation">
        <ul class="thumbs noscript">
            <asp:Repeater ID="ModifyRepeater" runat="server" DataSourceID="fotos">
                <ItemTemplate>
                    <li>
                        <a class="thumb" id="<%#Eval("id_galeria")%>"" href="fotosfotografo.aspx?galeria=<%#Eval("id_galeria")%>" title="<%#Eval("nome")%>">
                            <img src="<%#Eval("thumb")%>" style="width: 80px; height: 80px" />
                            <asp:Label ID="item" runat="server" Visible="False"></asp:Label>
                        </a>
<%--                        <div class="caption">
                            <div class="image-title" style="text-align: center; color: #fff;"><%#Eval("nome")%></div>
                        </div>--%>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <asp:SqlDataSource ID="fotos" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" SelectCommand="SELECT id_galeria, id_usuario, nome, thumb FROM Galeria WHERE (id_galeria IN (SELECT id_galeria FROM permissaousuario WHERE (id_usuario = @id_usuario)))">
        <SelectParameters>
            <asp:ControlParameter ControlID="selectfotografo" Name="id_usuario" PropertyName="Text" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:Label ID="selectfotografo" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Content>

