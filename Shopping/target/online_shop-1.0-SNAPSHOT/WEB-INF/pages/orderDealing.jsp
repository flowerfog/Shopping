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
	<script>
		window.onload=function(){
			if("${addRes}"){
				alert("${addRes}")
				<%
				session.removeAttribute("addRes");
				%>
			}
		}
	</script>
	<style type="text/css">
		.product{
			height: 450px;
		}
		button {
			--bg: #e74c3c;
			--text-color: #fff;
			position: relative;
			width: 150px;
			border: none;
			background: var(--bg);
			color: var(--text-color);
			padding: 1em;
			font-weight: bold;
			text-transform: uppercase;
			transition: 0.2s;
			border-radius: 5px;
			opacity: 0.8;
			letter-spacing: 1px;
			box-shadow: #c0392b 0px 7px 2px, #000 0px 8px 5px;
		}

		button:hover {
			opacity: 1;
		}

		button:active {
			top: 4px;
			box-shadow: #c0392b 0px 3px 2px,#000 0px 3px 5px;
		}
	</style>
</head>
<body>
<!-- HEADER -->
<header>
	<!-- TOP HEADER -->
	<div id="top-header">
		<div class="container">
			<ul class="header-links pull-left">
				<li><a href="#"><i class="fa fa-phone"></i> +173-3862-9421</a></li>
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
				<li class="active"><a href="${pageContext.request.contextPath}/initShopping">商城首页</a></li>
				<li><a href="${pageContext.request.contextPath}/viewStoreByCategory">热门交易</a></li>
				<li><a href="${pageContext.request.contextPath}/order/toUserOrderListByUid">我的订单</a></li>
				<li><a href="${pageContext.request.contextPath}/user/toWithAdmin">联系我们</a></li>
			</ul>
			<!-- /NAV -->
		</div>
		<!-- /responsive-nav -->
	</div>
	<!-- /container -->
</nav>
<!-- /NAVIGATION -->

<!-- /NAVIGATION -->

		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Checkout</h3>
						<ul class="breadcrumb-tree">
							<li><a href="${pageContext.request.contextPath}/initShopping">Home</a></li>
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
		<!-- row -->
		<div class="row">
			<!-- Order Details -->
			<div class="col-md-5 order-details" style="width: 100%;">
				<div class="section-title text-center">
					<h3 class="title">订单详情</h3>
					<h4>订单编号: ${orderByOid.get(0).orderUUid}</h4>
					<h4>下单时间: ${orderByOid.get(0).createTime}</h4>
				</div>
				<div class="order-summary">
					<div class="order-col">
						<div><strong><h3>商品名称</h3></strong></div>
						<div><strong><h3>订单操作</h3></strong></div>
					</div>

					<div class="order-products">
						<c:forEach items="${orderByOid}" var="order" varStatus="x">
							<div class="order-col" style="border-bottom: black 2px solid;padding-bottom: 20px">
								<div><span style="color: coral"><b>${order.count}</b></span>x ${order.oldCname} （单价￥${order.oldPrice}）
									<c:if test="${order.status == 0}">
										<strong style="color:grey;">(未发货)</strong>
									</c:if>
									<c:if test="${order.status == 3}">
										<strong style="color:darkred;">(您正在申请退款)</strong>
									</c:if>
									<c:if test="${order.status == 5}">
										<strong style="color:darkgreen;">(卖家已发货)</strong>
									</c:if>
									<c:if test="${order.status == 7}">
										<strong style="color:darkred;">(您正在发起退货)</strong>
									</c:if>
									<c:if test="${order.status == 9}">
										<strong style="color:darkgreen;">(您已签收)</strong>
									</c:if>
									<c:if test="${order.status == 10}">
										<strong style="color:darkgreen;">(退款成功)</strong>
									</c:if>
									<br>
									<c:if test="${empty order.tracking}">
										卖家暂未发货
									</c:if>
									<c:if test="${!empty order.tracking}">
										快递单号：${order.tracking}
									</c:if>
								</div>
								<div></div>
								<div>
									<c:if test="${order.status != 9 && order.status!=3 && order.status!=10}">

											<a style="color: black" href="${pageContext.request.contextPath}/user/updateOrder?status=3&cid=${order.cid}&oid=${order.oid}">我要撤单</a>

										<br>
										<br>
										<c:if test="${order.status != 3}">
												<a  href="${pageContext.request.contextPath}/user/updateOrder?status=9&cid=${order.cid}&oid=${order.oid}">确认收货</a>
										</c:if>

									</c:if>
									<c:if test="${order.status == 9||order.status==10}">
										<h4>该订单已经完成 无需操作</h4>
									</c:if>

									<c:if test="${order.status == 3}">
										<a  href="${pageContext.request.contextPath}/user/updateOrder?status=6&cid=${order.cid}&oid=${order.oid}">撤销申请</a>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="payment-method">
					<div class="input-radio">
						<input type="radio" name="payment" id="payment-1" checked>
						<label for="payment-1">
							<span></span>
							退货需知
						</label>
						<div class="caption">
							<p>需要商家审核,请耐心等待结果</p>
						</div>
					</div>

				</div>

			</div>
			<!-- /Order Details -->
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
		<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/nouislider.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.zoom.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/main.js"></script>

	</body>
</html>
