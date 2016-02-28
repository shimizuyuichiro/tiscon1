<#import "layout.ftl" as layout/>
<#import "spring.ftl" as spring/>

<@layout.layout "Register">



    <!-- /#advantages -->

    <!-- *** ADVANTAGES END *** -->

    <!-- *** HOT PRODUCT SLIDESHOW ***
_________________________________________________________ -->
    <div id="hot">

        <div class="box">
            <div class="container">
                <div class="col-md-12">
                    <h2>Top Movies</h2>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="product-slider">
                <#list movieRank as item>
                    <div class="item">
                        <div class="product">
                            <div class="flip-container">
                                <div align="center">
                                    <p><h4>${item?counter}位</h4></p>
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="/detail?genreId=33&subgenreId=&itemId=${item.id}">
                                                <img src=${item.image} alt=${item.title?html} class="img-responsive img-index-movie">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="/detail?genreId=33&subgenreId=&itemId=${item.id}">
                                                <img src=${item.image} alt=${item.title?html} class="img-responsive img-index-movie">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="/detail?genreId=33&subgenreId=&itemId=${item.id}" class="invisible">
                                <img src=${item.image} alt=${item.title?html} class="img-responsive img-index-movie">
                            </a>
                            <div class="text">
                                <h3><a href="/detail?genreId=33&subgenreId=&itemId=${item.id}">${item.title?html}</a></h3>
                                <p class="price">￥${item.price}</p>
                            </div>
                            <!-- /.text -->
                        </div>
                        <!-- /.product -->
                    </div>
                </#list>

            </div>
            <!-- /.product-slider -->
        </div>
        <!-- /.container -->

          <div class="box">
                    <div class="container">
                        <div class="col-md-12">
                            <h2>Top Music</h2>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="product-slider">
                        <#list musicRank as item>
                            <div class="item">
                                <div class="product">
                                    <div class="flip-container">
                                        <div align="center">
                                            <p><h4>${item?counter}位</h4></p>
                                            <div class="flipper">
                                                <div class="front">
                                                    <a href="/detail?genreId=34&subgenreId=&itemId=${item.id}">
                                                        <img src=${item.image} alt=${item.title?html} class="img-responsive img-index-music">
                                                    </a>
                                                </div>
                                                <div class="back">
                                                    <a href="/detail?genreId=34&subgenreId=&itemId=${item.id}">
                                                        <img src=${item.image} alt=${item.title?html} class="img-responsive img-index-music" >
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/detail?genreId=34&subgenreId=&itemId=${item.id}" class="invisible">
                                        <img src=${item.image} alt=${item.title?html} class="img-responsive img-index-music">
                                    </a>
                                    <div class="text">
                                        <h3><a href="/detail?genreId=34&subgenreId=&itemId=${item.id}">${item.title?html}</a></h3>
                                        <p class="price">￥${item.price}</p>
                                    </div>
                                    <!-- /.text -->
                                </div>
                                <!-- /.product -->
                            </div>
                        </#list>

                    </div>
            <!-- /.product-slider -->
        </div>
        <!-- /.container -->
    </div>

    <!-- /#hot -->

    <!-- *** HOT END *** -->

</@layout.layout>
