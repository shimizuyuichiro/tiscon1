<#macro layout title="TISCON1 layout">
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">

<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        TISCON Market
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/owl.carousel.css" rel="stylesheet">
    <link href="/css/owl.theme.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="/css/custom.css" rel="stylesheet">

    <script src="/js/respond.min.js"></script>

    <link rel="shortcut icon" href="favicon.png">



</head>

<body>

    <!-- *** TOPBAR ***
 _________________________________________________________ -->
    <div id="top">
        <div class="container">
            <div class="col-md-6 offer">
                <a href="#" class="btn btn-success btn-sm">Offer of the day</a>  <a href="#">Get flat 35% off on orders over $50!</a>
            </div>
            <div class="col-md-6">
                <ul class="menu">
                    <#if principal??>
                    <li class="dropdown yamm-fw">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">${principal.name}さん<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                                <div class="yamm-content">
                                    <div class="row">
                                            <div class="col-sm-3">
                                                <a href="/logout" class="layout-menu-font">Logout</a>
                                            </div>
                                    </div>
                                </div>
                                <!-- /.yamm-content -->
                        </ul>
                    </li>
                    <#else>
                    <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a>
                    </li>
                    <li><a href="/register">Register</a>
                    </li>
                    </#if>
                    <li><a href="http://www.tis.co.jp/recruit/index.html">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
            <div class="modal-dialog modal-sm">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="Login">Customer login</h4>
                    </div>
                    <div class="modal-body">
                        <form action="/login" method="post">
                            <div class="form-group">
                                <input type="text" name="account" class="form-control" id="account-modal" placeholder="account">
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" class="form-control" id="password-modal" placeholder="password">
                            </div>

                            <p class="text-center">
                                <button class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                            </p>


                        </form>

                        <p class="text-center text-muted">Not registered yet?</p>
                        <p class="text-center text-muted"><a href="/register"><strong>Register now</strong></a>! It is easy and done in 1&nbsp;minute and gives you access to special discounts and much more!</p>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- *** TOP BAR END *** -->

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

    <div class="navbar navbar-default yamm layout-menu-index" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <a class="navbar-brand home" href="/">
                    <img src="/img/TISCON_LOGO.png" alt="TISCON logo" class="hidden-xs">
                    <img src="/img/TISCON_LOGO.png" alt="TISCON logo" class="visible-xs"><span class="sr-only">go to homepage</span>
                </a>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                    <a class="btn btn-default navbar-toggle" href="/basket">
                        <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">3 items in cart</span>
                    </a>
                </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li>
                        <a href="/">Home</a>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Movie <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <#list dividedMovieGenres as dividedMovieGenre>
                                            <div class="col-sm-3">
                                                <ul>
                                                    <#list dividedMovieGenre as movie>
                                                        <li><a href="/category?genreId=33&subgenreId=${movie.id}">${movie.name}</a></li>
                                                    </#list>
                                                </ul>
                                            </div>
                                        </#list>
                                    </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown yamm-fw">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Music <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <#list dividedMusicGenres as dividedMusicGenre>
                                            <div class="col-sm-3">
                                                <ul>
                                                    <#list dividedMusicGenre as music>
                                                        <li><a href="/category?genreId=34&subgenreId=${music.id}">${music.name}</a></li>
                                                    </#list>
                                                </ul>
                                            </div>
                                        </#list>
                                    </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->

            <div class="navbar-buttons">

                <div class="navbar-collapse collapse right" id="basket-overview">
                    <a href="basket.html" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">3 items in cart</span></a>
                </div>
                <!--/.nav-collapse -->

                <div class="navbar-collapse collapse right" id="search-not-mobile">
                    <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                </div>

            </div>

            <div class="collapse clearfix" id="search">

                <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search">
                        <span class="input-group-btn">

			<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>

		    </span>
                    </div>
                </form>

            </div>
            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->

    <div id="all">
        <div id="content">
            <#nested/>
        </div>

        <!-- *** FOOTER ***
 _________________________________________________________ -->
        <div id="footer" >
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <h4>Pages</h4>

                        <ul>
                            <li><a href="http://www.tis.co.jp/recruit/index.html">About us</a>
                            </li>
                            <li><a href="http://www.tis.co.jp/recruit/index.html">Contact us</a>
                            </li>
                        </ul>

                        <hr>

                        <h4>User section</h4>

                        <ul>
                            <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a>
                            </li>
                            <li><a href="/register">Regiter</a>
                            </li>
                        </ul>

                        <hr class="hidden-md hidden-lg hidden-sm">

                    </div>
                    <!-- /.col-md-3 -->

                    <div class="col-md-3 col-sm-6">

                        <h4>Ranking</h4>

                        <h5>Movie</h5>
                        <ul>
                            <#list movieGenres as movie>
                                <li><a href="/category?genreId=33&subgenreId=${movie.id}">${movie.name}</a></li>
                            </#list>
                        </ul>
                    </div>
                    <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <h5>Music</h5>
                        <ul>
                            <#list musicGenres as music>
                                <li><a href="/category?genreId=34&subgenreId=${music.id}">${music.name}</a></li>
                            </#list>
                        </ul>

                        <hr class="hidden-md hidden-lg">

                    </div>
                    <!-- /.col-md-3 -->

                    <div class="col-md-3 col-sm-6">

                        <h4>Where to find us</h4>

                        <p><strong>TIS Inc.</strong>
                            <br>Sumitomo Fudosan Shinjuku Grand Tower,
                            <br>17-1,Nishishinjuku 8-chome,
                            <br>Shinjuku-ku,Tokyo,
                            <br>160-0023
                            <br>
                            <strong>Japan</strong>
                        </p>

                        <a href="http://www.tis.co.jp/recruit/index.html">Go to contact page</a>

                        <hr class="hidden-md hidden-lg">

                    </div>
                    <!-- /.col-md-3 -->



                    <div class="col-md-3 col-sm-6">

                        <hr>

                        <h4>Stay in touch</h4>

                        <p class="social">
                            <a href="http://www.facebook.com/tis.recruit" class="facebook external"><i class="fa fa-facebook"></i></a>
                            <a href="mailto:recruit★tis.co.jp" class="email external"><i class="fa fa-envelope"></i></a>
                            <h6>メールアドレスの★を@に変換してください。</h6>
                        </p>


                    </div>
                    <!-- /.col-md-3 -->

                </div>
                <!-- /.row -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#footer -->

        <!-- *** FOOTER END *** -->




        <!-- *** COPYRIGHT ***
 _________________________________________________________ -->
        <div id="copyright">
            <div class="container">
                <div class="col-md-6">
                    <p class="pull-left">© 2016 TIS Inc.</p>

                </div>
                <div class="col-md-6">
                    <p class="pull-right">Template by <a href="http://bootstrapious.com/e-commerce-templates">Bootstrap Ecommerce Templates</a> with support from <a href="http://kakusei.cz">Designové předměty</a>
                        <!-- Not removing these links is part of the licence conditions of the template. Thanks for understanding :) -->
                    </p>
                </div>
            </div>
        </div>
        <!-- *** COPYRIGHT END *** -->



    </div>
    <!-- /#all -->

    <!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
    <script src="/js/jquery-1.11.0.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.cookie.js"></script>
    <script src="/js/waypoints.min.js"></script>
    <script src="/js/modernizr.js"></script>
    <script src="/js/bootstrap-hover-dropdown.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/front.js"></script>

</body>

</html>
</#macro>
