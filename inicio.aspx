<%@ Page Title="" Language="C#" MasterPageFile="~/SiteModal.master" AutoEventWireup="true" CodeFile="inicio.aspx.cs" Inherits="inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row" style="margin-top: 0px; height: 593px; background-image: url(imgProjeto/391.jpg);">
        <div class="container-fluid">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <div class="item active">
                        <img src="Carouselimg/teste.png" alt="Chania" width="260" height="145" />
                    </div>

                    <%--     <div class="item">
                        <img src="Carouselimg/10520_1307058103_4de81fb76b272.jpg" alt="Chania" width="460" height="345" />
                        <div class="carousel-caption">
                            <h3>Chania</h3>
                            <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="Carouselimg/canberra_hero_image.jpg" alt="Flower" width="460" height="345" />
                        <div class="carousel-caption">
                            <h3>Flowers</h3>
                            <p>Beatiful flowers in Kolymbari, Crete.</p>
                        </div>
                    </div>--%>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="row" style="margin-top: 60px;">
                <div class="col-sm-4" style="color: #fff; text-align: center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/imgProjeto/instagram10.png" />
                    <h3>Fotografia</h3>
                    <div style="text-align: left; font-size: 16px">
                        <p>Registre seus melhores momentos e as mantenham armazenadas de forma segura.</p>
                    </div>
                </div>
                <div class="col-sm-4" style="color: #fff; text-align: center; font-size: 16px">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/imgProjeto/shield20.png" />
                    <h3>Segurança</h3>
                    <div style="text-align: left; font-size: 16px">
                        <p>Salvando suas galerias na nunvem o fotografo poporciona maior segurança no seu armazenamento.</p>
                    </div>
                </div>
                <div class="col-sm-4" style="color: #fff; text-align: center; font-size: 16px">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/imgProjeto/internet54.png" />
                    <h3>Acessibilidade</h3>
                    <div style="text-align: left">
                        <p>Acesse suas informações de qual quer local,precisando apenas possuir uma conexão com a internet.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

