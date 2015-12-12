<%@ Page Title="" Language="C#" MasterPageFile="~/mp-fotografo.master" AutoEventWireup="true" CodeFile="~/fotosfotografo.aspx.cs" Inherits="galeria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="Form1" runat="server">
        <link rel="stylesheet" href="css/basic.css" type="text/css" />
        <link rel="stylesheet" href="css/galleriffic-2.css" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="js/jquery.galleriffic.js"></script>
        <script type="text/javascript" src="js/jquery.opacityrollover.js"></script>
        <!-- We only want the thunbnails to display when javascript is disabled -->
        <div id="page">
            <div id="container" class="cssescuro">
                <!-- Start Advanced Gallery Html Containers -->
                <div id="gallery" class="content">
                    <div id="controls" class="controls"></div>
                    <div class="slideshow-container">
                        <div id="loading" class="loader"></div>
                        <div id="slideshow" class="slideshow"></div>
                    </div>
                    <div id="caption" class="caption-container"></div>
                </div>
                <div id="thumbs" class="navigation">
                    <ul class="thumbs noscript">
                        <asp:Repeater ID="ModifyRepeater" runat="server" DataSourceID="fotos">
                            <ItemTemplate>
                                <li>
                                    <a class="thumb" href="<%#Eval("caminho")%>" title="<%#Eval("titulo")%>">
                                        <img src="<%#Eval("caminho")%>" style="width: 80px; height: 80px" />
                                    </a>
                                    <%--<input type="checkbox" name="item" id="checkbox" value="<%#Eval("titulo")%>">--%>
                                    <%--                       <asp:Label ID="Label2" runat="server" ForeColor="White"><%#Eval("titulo")%></asp:Label>--%>
                                    <div class="caption">
                                        <div class="image-title" style="text-align: center; color: #fff;"><%#Eval("titulo")%></div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
        <!- este bloqueia o botão print-screen ->
            <%--<script language="JavaScript">
                if (window != top) top.location.href = location.href;
            </script>
            <script language="JavaScript">

                // Proibe clicar com o "segundo" botao
                function click() {
                    if (event.button == 2) {
                        alert('Conteúdo bloqueado favor entrar em contato com o fotografo.')
                    }
                }
                document.onmousedown = click
            </script>--%>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                // We only want these styles applied when javascript is enabled
                $('div.navigation').css({ 'width': '300px', 'float': 'left' });
                $('div.content').css('display', 'block');

                // Initially set opacity on thumbs and add
                // additional styling for hover effect on thumbs
                var onMouseOutOpacity = 0.67;
                $('#thumbs ul.thumbs li').opacityrollover({
                    mouseOutOpacity: onMouseOutOpacity,
                    mouseOverOpacity: 1.0,
                    fadeSpeed: 'fast',
                    exemptionSelector: '.selected'
                });

                // Initialize Advanced Galleriffic Gallery
                var gallery = $('#thumbs').galleriffic({
                    delay: 2500,
                    numThumbs: 9,
                    preloadAhead: 10,
                    enableTopPager: true,
                    enableBottomPager: true,
                    maxPagesToShow: 7,
                    imageContainerSel: '#slideshow',
                    controlsContainerSel: '#controls',
                    captionContainerSel: '#caption',
                    loadingContainerSel: '#loading',
                    renderSSControls: true,
                    renderNavControls: true,
                    playLinkText: 'Iniciar',
                    pauseLinkText: 'Parar',
                    prevLinkText: '&lsaquo; Anteriror',
                    nextLinkText: 'Proxima &rsaquo;',
                    nextPageLinkText: 'Next &rsaquo;',
                    prevPageLinkText: '&lsaquo; Prev',
                    enableHistory: false,
                    autoStart: false,
                    syncTransitions: true,
                    defaultTransitionDuration: 900,
                    onSlideChange: function (prevIndex, nextIndex) {
                        // 'this' refers to the gallery, which is an extension of $('#thumbs')
                        this.find('ul.thumbs').children()
                            .eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
                            .eq(nextIndex).fadeTo('fast', 1.0);
                    },
                    onPageTransitionOut: function (callback) {
                        this.fadeTo('fast', 0.0, callback);
                    },
                    onPageTransitionIn: function () {
                        this.fadeTo('fast', 1.0);
                    }
                });
            });
        </script>
        <asp:SqlDataSource ID="fotos" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" SelectCommand="SELECT id_galeria, titulo, caminho, id_foto FROM Foto WHERE (id_galeria = @galeria)">
            <SelectParameters>
                <asp:ControlParameter ControlID="valorselect" Name="galeria" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="valorselect" runat="server" Text="Label" Visible="False"></asp:Label>
    </form>
</asp:Content>

