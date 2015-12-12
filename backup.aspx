<%@ Page Title="" Language="C#" MasterPageFile="~/Select.master" AutoEventWireup="true" CodeFile="backup.aspx.cs" Inherits="galeria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
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
                                    <a class="thumb" href="<%#Eval("caminho")%>" title="Title #2">
                                        <img src="<%#Eval("caminho")%>" style="width: 85px; height: 85px" alt="Title #2" />
                                    </a>
                                    <input type="checkbox" name="item" id="checkbox" value="<%#Eval("titulo")%>">
                                    <div class="caption">
                                        <div class="image-title" style="text-align: center; color: #fff;">Title #2</div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                <div style="clear: both;"></div>
            </div>
        </div>
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
        <asp:SqlDataSource ID="fotos" runat="server" ConnectionString="<%$ ConnectionStrings:clickfotosConnectionString %>" SelectCommand="SELECT * FROM [Foto]"></asp:SqlDataSource>
    </form>
</asp:Content>

