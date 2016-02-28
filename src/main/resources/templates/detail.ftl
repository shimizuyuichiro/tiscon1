<#import "layout.ftl" as layout/>
<#import "spring.ftl" as spring/>

<@layout.layout "Register">
    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="/">Home</a></li>
                        <#if genreName?has_content>
                            <li><a href="/category?genreId=${genreId}&subgenreId=">${genreName} </a></li>
                        </#if>
                        <#if subgenreName?has_content>
                            <li><a href="/category?genreId=${genreId}&subgenreId=${subgenreId}">${subgenreName} </a></li>
                        </#if>
                        <#if item.title?has_content>
                            <li>${item.title} </li>
                        </#if>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Ranking</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked category-menu">
                                <#if genreId=="33">
                                    <li class="active">
                                <#else>
                                    <li>
                                </#if>
                                        <a href="/category?genreId=33&subgenreId=">MOVIE </a>
                                        <ul>
                                            <#list movieGenres as movie>
                                                <li><a href="/category?genreId=33&subgenreId=${movie.id}">${movie.name?html}</a></li>
                                            </#list>
                                        </ul>
                                    </li>
                                <#if genreId=="34">
                                    <li class="active">
                                <#else>
                                    <li>
                                </#if>
                                        <a href="/category?genreId=34&subgenreId=">MUSIC </a>
                                        <ul>
                                            <#list musicGenres as music>
                                                <li><a href="/category?genreId=34&subgenreId=${music.id}">${music.name?html}</a></li>
                                            </#list>
                                        </ul>
                                    </li>
                            </ul>
                        </div>
                    </div>
                    <!-- *** 検索機能用エリア
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="panel-title">Search</h3>
                        </div>
                    </div>
                    *** -->
                    <!-- *** MENUS AND FILTERS END *** -->
                </div>

                <div class="col-md-9">

                    <div class="row" id="productMain">
                        <div class="col-sm-6">
                            <div id="mainImage">
                                <img src=${item.image} alt="${item.title?html}" width="400" class="img-responsive">
                            </div>

                        </div>
                        <div class="col-sm-6">
                            <div class="box">
                                <h1 class="text-center">${item.title?html}</h1>
                                <p class="goToDescription"><a href="#details" class="scroll-to">Scroll to product details, material & care and sizing</a>
                                </p>
                                <p class="price">￥${item.price}</p>

                                <p class="text-center buttons">
                                    <a href="basket" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>買い物かごに追加</a>
                                    <a href="basket" class="btn btn-default"><i class="fa fa-heart"></i> 欲しいものリストに追加</a>
                                </p>
                            </div>
                        </div>

                    </div>


                    <div class="box" id="details">
                        <p>
                            <#if genreId == "33">
                                <#if item.summary?has_content>
                                    <h4>Summary</h4>
                                    <p>${item.summary?html}</p>
                                </#if>
                            <#elseif genreId == "34">
                                <#if item.artist?has_content>
                                    <h4>Artist</h4>
                                    <p>${item.artist?html}</p>
                                </#if>
                                <#if item.album?has_content>
                                    <h4>Album</h4>
                                    <p>${item.album?html}</p>
                                </#if>
                            </#if>

                            <hr>
                            <div class="social">
                                <h4>Show it to your friends</h4>
                                <p>
                                    <a href="http://www.facebook.com/dialog/feed?app_id=419866574778905&picture=${item.image}&name=My favorite ${genreName}! - ${item.title}&display=page" class="external facebook" data-animate-hover="pulse"><i class="fa fa-facebook"></i></a>
                                    <a href="http://twitter.com/share?text=My favorite ${genreName}! - ${item.title}" class="external twitter" data-animate-hover="pulse"><i class="fa fa-twitter"></i></a>
                                </p>
                            </div>
                    </div>
                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->
    </div>
    <!-- /#all -->
</@layout.layout>
