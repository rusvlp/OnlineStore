<#macro template>
    <!DOCTYPE html>
    <html lang="zxx" xmlns="http://www.w3.org/1999/html">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Online Store"/>
        <meta name="keywords" content="modern, shop, store, ecommerce, responsive, e-commerce"/>
        <meta name="author" content="webmaster"/>

        <title>Интернет-магазин</title>

        <!--== Favicon ==-->
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />

        <!--== Google Fonts ==-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,600;0,700;0,800;1,400;1,500&display=swap" rel="stylesheet">

        <!--== Bootstrap CSS ==-->
        <link href="/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <!--== Font Awesome Min Icon CSS ==-->
        <link href="/static/vendor/font-awesome/css/all.min.css" rel="stylesheet" />
        <!--== Pe7 Stroke Icon CSS ==-->
        <link href="/static/vendor/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css" rel="stylesheet" />
        <!--== Swiper CSS ==-->
        <link href="/static/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
        <!--== Fancybox Min CSS ==-->
        <!--<link href="./static/vendor/css/fancybox.min.css" rel="stylesheet" />-->
        <!--== Aos Min CSS ==-->
        <link href="/static/vendor/aos/aos.css" rel="stylesheet" />

        <!--== Main Style CSS ==-->
        <link href="/static/css/store_style.css" rel="stylesheet" />

        <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
    <div class="wrapper">
        <!--== Start Header Wrapper ==-->
        <header class="main-header-wrapper position-relative">
            <div class="header-top">
                <div class="container pt--0 pb--0">
                    <div class="row">
                        <div class="col-12">
                            <div class="header-top-align">
                                <div class="header-top-align-start">
                                    <div class="desc">
                                        <p>Мы всегда готовы Вас выслушать!</p>
                                    </div>
                                </div>
                                <div class="header-top-align-end">
                                    <div class="header-info-items">
                                        <div class="info-items">
                                            <ul>
                                                <li class="number"><i class="fa fa-phone"></i><a href="tel://0123456789">+00 123 456 789</a></li>
                                                <li class="email"><i class="fa fa-envelope"></i><a href="mailto://demo@example.com">demo@example.com</a></li>
                                                <#if user?? && user.email??>
                                                    <li class="account"><i class="fa fa-user"></i><a href="/login">${user.email}</a></li>
                                                <#else>
                                                        <li class="account"><i class="fa fa-user"></i><a href="/login">Личный кабинет</a></li>
                                                </#if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-middle">
                <div class="container pt--0 pb--0">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="header-middle-align">
                                <div class="header-middle-align-start">
                                    <div class="header-logo-area">
                                        <a href="/">
                                            <img class="logo-main" src="assets/img/logo.webp" width="131" height="34" alt="Logo" />
                                            <img class="logo-light" src="assets/img/logo-light.webp" width="131" height="34" alt="Logo" />
                                        </a>
                                    </div>
                                </div>
                                <div class="header-middle-align-center">
                                    <div class="header-search-area">
                                        <form class="header-searchbox" action = "/" method="get" onsubmit="searchSubmitActions(); return false;">
                                            <input type="search" class="form-control" name="searchQuery" id="searchQuery" value="<#if filters??><#if filters.searchQuery ??>${filters.searchQuery}</#if></#if>" placeholder="Искать в каталоге...">
                                            <button class="btn-submit" type="submit"><i class="pe-7s-search"></i></button>
                                        </form>
                                    </div>
                                </div>
                                <div class="header-middle-align-end">
                                    <div class="header-action-area">
                                        <div class="shopping-search">
                                            <button class="shopping-search-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#AsideOffcanvasSearch" aria-controls="AsideOffcanvasSearch">
                                                <i class="pe-7s-search icon"></i>
                                            </button>
                                        </div>
                                        <div class="shopping-main-page mx-2">
                                            <a class="shopping-wishlist-btn btn-register" href="/">
                                                <i class="pe-7s-home icon mx-1"></i>
                                                <a class="d-none d-sm-inline text-center align-text-bottom" href="/">Главная</a>
                                            </a>
                                        </div>
                                        <div class="shopping-wishlist mx-2">
                                            <a class="shopping-wishlist-btn" href="/wishlist">
                                                <i class="pe-7s-like icon mx-1"></i>
                                                <a class="d-none d-sm-inline text-center align-text-bottom" href="/wishlist">Избранное</a>
                                            </a>
                                        </div>
                                        <div class="shopping-cart mx-2">
                                            <button class="shopping-cart-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#AsideOffcanvasCart" aria-controls="offcanvasRightLabel">
                                                <i class="pe-7s-shopbag icon"></i>
                                                <sup class="shop-count">02</sup>
                                            </button>
                                        </div>
                                        <button class="btn-menu" type="button" data-bs-toggle="offcanvas" data-bs-target="#AsideOffcanvasMenu" aria-controls="AsideOffcanvasMenu">
                                            <i class="pe-7s-menu"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!--== End Header Wrapper ==-->
        <div class = "content">
            <#nested />
        </div>
        <!--== Start Footer Area Wrapper ==-->
        <footer class="footer-area">
            <!--== Start Footer Main ==-->
            <div class="footer-main">
                <div class="container pt--0 pb--0">
                    <div class="row">
                        <div class="col-md-6 col-lg-3">
                            <!--== Start widget Item ==-->
                            <div class="widget-item">
                                <div class="about-widget-wrap">
                                    <div class="widget-logo-area">
                                        <a href="/">
                                            <img class="logo-main" src="assets/img/logo-light.webp" width="131" height="34" alt="Logo" />
                                        </a>
                                    </div>
                                    <p class="desc">Lorem ipsum dolor sit amet consl adipisi elit, sed do eiusmod templ incididunt ut labore</p>
                                    <div class="social-icons">
                                        <a href="https://www.facebook.com/" target="_blank" rel="noopener"><i class="fa-brands fa-facebook"></i></a>
                                        <a href="https://dribbble.com/" target="_blank" rel="noopener"><i class="fa-brands fa-dribbble"></i></a>
                                        <a href="https://www.pinterest.com/" target="_blank" rel="noopener"><i class="fa-brands fa-pinterest-p"></i></a>
                                        <a href="https://twitter.com/" target="_blank" rel="noopener"><i class="fa-brands fa-twitter"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!--== End widget Item ==-->
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <!--== Start widget Item ==-->
                            <div class="widget-item widget-services-item">
                                <h4 class="widget-title">Services</h4>
                                <h4 class="widget-collapsed-title collapsed" data-bs-toggle="collapse" data-bs-target="#widgetId-1">Services</h4>
                                <div id="widgetId-1" class="collapse widget-collapse-body">
                                    <div class="collapse-body">
                                        <div class="widget-menu-wrap">
                                            <ul class="nav-menu">
                                                <li><a href="contact.html">Home monitoring</a></li>
                                                <li><a href="contact.html">Air Filters</a></li>
                                                <li><a href="contact.html">Professional installation</a></li>
                                                <li><a href="contact.html">Smart Buildings</a></li>
                                                <li><a href="contact.html">For contractors</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--== End widget Item ==-->
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <!--== Start widget Item ==-->
                            <div class="widget-item widget-account-item">
                                <h4 class="widget-title">My Account</h4>
                                <h4 class="widget-collapsed-title collapsed" data-bs-toggle="collapse" data-bs-target="#widgetId-2">My Account</h4>
                                <div id="widgetId-2" class="collapse widget-collapse-body">
                                    <div class="collapse-body">
                                        <div class="widget-menu-wrap">
                                            <ul class="nav-menu">
                                                <li><a href="account-login.html">My Account</a></li>
                                                <li><a href="contact.html">Contact</a></li>
                                                <li><a href="shop-cart.html">Shopping cart</a></li>
                                                <li><a href="shop.html">Shop</a></li>
                                                <li><a href="account-login.html">Services Login</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--== End widget Item ==-->
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <!--== Start widget Item ==-->
                            <div class="widget-item">
                                <h4 class="widget-title">Contact Info</h4>
                                <h4 class="widget-collapsed-title collapsed" data-bs-toggle="collapse" data-bs-target="#widgetId-3">Contact Info</h4>
                                <div id="widgetId-3" class="collapse widget-collapse-body">
                                    <div class="collapse-body">
                                        <div class="widget-contact-wrap">
                                            <ul>
                                                <li><span>Address:</span> Your address goes here.</li>
                                                <li><span>Phone//fax:</span> <a href="tel://0123456789">0123456789</a></li>
                                                <li><span>Email:</span> <a href="mailto://demo@example.com">demo@example.com</a></li>
                                                <li><a target="_blank" href="https://sample.com">www.example.com</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--== End widget Item ==-->
                        </div>
                    </div>
                </div>
            </div>
            <!--== End Footer Main ==-->

            <!--== Start Footer Bottom ==-->
            <div class="footer-bottom">
                <div class="container pt--0 pb--0">
                    <div class="row">
                        <div class="col-md-7 col-lg-6">
                            <p class="copyright">© 2022 OnlineStore. </p>
                        </div>
                        <div class="col-md-5 col-lg-6">
                            <div class="payment">
                                <a href="account-login.html"><img src="assets/img/photos/payment-card.webp" width="192" height="21" alt="Payment Logo"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--== End Footer Bottom ==-->
        </footer>
        <!--== End Footer Area Wrapper ==-->
    </div>
    </body>
    <!--=======================Javascript============================-->

    <!--=== jQuery Modernizr Min Js ===-->
    <script src="assets/js/modernizr.js"></script>
    <!--=== jQuery Min Js ===-->
    <script src="static/vendor/jquery/jquery.js"></script>
    <!--=== jQuery Migration Min Js ===-->
    <script src="assets/js/jquery-migrate.js"></script>
    <!--=== jQuery Popper Min Js ===-->
    <script src="assets/js/popper.min.js"></script>
    <!--=== jQuery Bootstrap Min Js ===-->
    <script src="./static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--=== jQuery Ui Min Js ===-->
    <script src="assets/js/jquery-ui.min.js"></script>
    <!--=== jQuery Swiper Min Js ===-->
    <script src="assets/js/swiper.min.js"></script>
    <!--=== jQuery Fancybox Min Js ===-->
    <script src="assets/js/fancybox.min.js"></script>
    <!--=== jQuery Waypoint Js ===-->
    <script src="assets/js/waypoint.js"></script>
    <!--=== jQuery Parallax Min Js ===-->
    <script src="assets/js/parallax.min.js"></script>
    <!--=== jQuery Aos Min Js ===-->
    <script src="static/vendor/aos/aos.js"></script>

    <!--=== jQuery Custom Js ===-->
    <script src="static/js/common.js"></script>
    </html>
</#macro>
