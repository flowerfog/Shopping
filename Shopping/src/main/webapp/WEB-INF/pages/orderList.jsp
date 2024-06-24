<%--
  Created by IntelliJ IDEA.
  User: 好
  Date: 2023/6/26
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro - HTML Ecommerce Template</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<style type="text/css">
    .col-md-5{
        width: 33%;
        height: 330px;
        overflow-x:hidden;
        overflow-y:auto;
    }
</style>
<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +173-2358-0528</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> CQIE Sakural Road</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="${pageContext.request.contextPath}/user/addMyMoney"><i class="fa fa-rmb"></i> ${sessionScope.user.money eq null ?"0":sessionScope.user.money }</a></li>
                <li><a href="${pageContext.request.contextPath}/user/checkUser"><i class="fa fa-user-o"></i> ${sessionScope.user.username eq null ?"Please Login":sessionScope.user.username }</a></li>
                <li><a href="#"><i style="color: white" class="fa fa-envelope"> &nbsp;news</i></a></li>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="#" class="logo">
                            <img src="./img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form action="${pageContext.request.contextPath}/viewStoreByCategory" method="get">
                            <select name="categoryId" class="input-select">
                                <option value="0">全部商品</option>
                                <c:forEach items="${categoryMap}" var="category" varStatus="x">
                                    <option value="${category.key}">${category.value}</option>
                                </c:forEach>
                            </select>
                            <input class="input" type="text" placeholder="Search here" name="cname">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="${pageContext.request.contextPath}/user/toMyFavoriteList">
                                <i class="fa fa-heart-o"></i>
                                <span>Your Wishlist</span>
                                <c:if test="${!empty sessionScope.user.favoriteCount}">
                                    <div class="qty" >${sessionScope.user.favoriteCount}</div>
                                </c:if>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                                <c:if test="${!empty sessionScope.user.cartCount}">
                                    <div class="qty" >${sessionScope.user.cartCount}</div>
                                </c:if>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">

                                    <%--购物车商品--%>
                                    <c:forEach items="${sessionScope.user.shoppingCarts}" var="shoppingCart" varStatus="x">
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="${pageContext.request.contextPath}${shoppingCart.commodity.photoUrl}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=${shoppingCart.commodity.id}">${shoppingCart.commodity.name}</a></h3>
                                                <h4 class="product-price"><span class="qty"><span style="color: darkred">${shoppingCart.commodityCount}</span>x</span> ￥${shoppingCart.commodity.price * shoppingCart.commodity.discount}</h4>
                                            </div>
                                            <button class="delete"><a href="${pageContext.request.contextPath}/user/delMyShoppingCartByCid?cid=${shoppingCart.commodity.id}"><i style="color: white" class="fa fa-close"></i></a></button>
                                        </div>
                                    </c:forEach>
                                    <%--/购物车商品--%>
                                </div>
                                <div class="cart-summary">
                                    <small>${sessionScope.user.cartCommodityCount} 件宝贝在购物车中</small>
                                    <h5>购物车总价: ￥${sessionScope.user.cartPrice}</h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="${pageContext.request.contextPath}/user/clearMyShoppingCartByUid?uid=${sessionScope.user.id}">清空购物车 </a>
                                    <a href="${pageContext.request.contextPath}/commodity/toBuyCommodity?${sessionScope.user.shoppingCids}">去付款  <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li ><a href="${pageContext.request.contextPath}/initShopping">商城首页</a></li>
                <li><a href="${pageContext.request.contextPath}/viewStoreByCategory">热门交易</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/order/toUserOrderListByUid">我的订单</a></li>
                <li><a href="${pageContext.request.contextPath}/user/toWithAdmin">联系我们</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Your Order</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">Home</a></li>
                    <li class="active">Checkout</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <div class="order-col" style="border-bottom: 1px solid black">
            <div>
                <h2>尊敬的 ${sessionScope.user.username} ${sessionScope.user.gender eq 1?"先生":"女士"}您好, 您账户的历史消费为 ￥<span style="color: gold">${sessionScope.user.resTotal}</span></h2>

            </div>
        </div>
        <br>
        <!-- row -->
        <div class="row">
            <c:forEach items="${dealingList}" var="dealing" varStatus="x">
                <!-- Order Details -->

                <!-- Order Details -->
                <div class="col-md-5 order-details">
                    <div class="section-title text-center">

                        <h3 class="title">${dealing.rightTime} </h3> ${dealing.dayTime}
                        <br>
                        <c:if test="${dealing.state == 0}">
                            <strong style="color: darkred">(未完成)</strong>
                        </c:if>
                        <c:if test="${dealing.state == 1}">
                            <strong style="color: green">（已完成)</strong>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/user/findOrderByOid?oid=${dealing.oid}">查看详情</a>
                    </div>
                    <div class="order-summary">

                        <div class="order-products">
                            <div class="order-col">
                                <div>ID:${dealing.orderUUid}</div>
                            </div>
                            <c:forEach items="${dealing.historicalDealingList}" var="historicalDealing" varStatus="x">
                                <div class="order-col">
                                    <div>${historicalDealing.count}x <a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=${historicalDealing.cid}">${historicalDealing.name}</a><br>快递单号:${historicalDealing.tracking}</div>
                                    <div>￥${historicalDealing.price}
                                        <c:if test="${historicalDealing.status == 0}">
                                            <strong style="color:grey;">(未发货)</strong>
                                        </c:if>
                                        <c:if test="${historicalDealing.status == 1}">
                                            <strong style="color:darkred;">(卖家未发货 正在申请退款)</strong>
                                        </c:if>
                                        <c:if test="${historicalDealing.status == 3}">
                                            <strong style="color:darkred;">(卖家已发货 正在申请退款)</strong>
                                        </c:if>
                                        <c:if test="${historicalDealing.status == 5}">
                                            <strong style="color:darkgreen;">(卖家已发货)</strong>
                                        </c:if>
                                        <c:if test="${historicalDealing.status == 7}">
                                            <strong style="color:darkred;">(买家发起退货)</strong>
                                        </c:if>
                                        <c:if test="${historicalDealing.status == 7}">
                                            <strong style="color:darkgreen;">(成功退货)</strong>
                                        </c:if>
                                        <c:if test="${historicalDealing.status == 9}">
                                            <strong style="color:green;">(已确认收货)</strong>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="order-col">
                            <div>Shiping</div>
                            <div><strong>FREE</strong></div>
                        </div>
                        <div class="order-col">
                            <div><strong>TOTAL</strong></div>
                            <div><strong class="order-total">￥${dealing.total}</strong></div>
                        </div>
                        <div class="order-col">
                            <div><strong>收货信息</strong></div>
                            <div></div>
                        </div>
                        <div>
                            <div>
                                收货地址: ${dealing.address.city} ${dealing.address.detail}
                            </div>
                            <div>
                                收件人: ${dealing.address.name} &nbsp;&nbsp;电话: ${dealing.address.phone}
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Order Details -->
                <!-- /Order Details -->
            </c:forEach>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                    <form>
                        <input class="input" type="email" placeholder="Enter Your Email">
                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                    </form>
                    <ul class="newsletter-follow">
                        <li>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /NEWSLETTER -->

<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">About Us</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Orders and Returns</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Service</h3>
                        <ul class="footer-links">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Track My Order</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">

								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by Colorlib  -  More Templates <a href="https://www.downdemo.com" target="_blank" title="网站模板">网站模板</a> - Collect from <a href="https://www.downdemo.com" title="网页模板" target="_blank">网页模板</a>

							</span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
