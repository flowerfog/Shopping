<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Contact Us - Electro Ecommerce</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css"/>
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css"/>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<style>
		.contact-form {
			margin-top: 30px;
		}
		.contact-form .form-group {
			margin-bottom: 25px;
		}
		.contact-info {
			margin-top: 30px;
		}
		.contact-info p {
			margin-bottom: 10px;
		}
	</style>
</head>
<body>
<!-- HEADER -->
<header>
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

	<div id="header">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="header-logo">
						<a href="#" class="logo">
							<img src="./img/logo.png" alt="">
						</a>
					</div>
				</div>
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
				<div class="col-md-3 clearfix">
					<div class="header-ctn">
						<div>
							<a href="${pageContext.request.contextPath}/user/toMyFavoriteList">
								<i class="fa fa-heart-o"></i>
								<span>Your Wishlist</span>
								<c:if test="${!empty sessionScope.user.favoriteCount}">
									<div class="qty">${sessionScope.user.favoriteCount}</div>
								</c:if>
							</a>
						</div>
						<div class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<i class="fa fa-shopping-cart"></i>
								<span>Your Cart</span>
								<c:if test="${!empty sessionScope.user.cartCount}">
									<div class="qty">${sessionScope.user.cartCount}</div>
								</c:if>
							</a>
							<div class="cart-dropdown">
								<div class="cart-list">
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
						<div class="menu-toggle">
							<a href="#">
								<i class="fa fa-bars"></i>
								<span>Menu</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- NAVIGATION -->
<nav id="navigation">
	<div class="container">
		<div id="responsive-nav">
			<ul class="main-nav nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/initShopping">商城首页</a></li>
				<li><a href="${pageContext.request.contextPath}/viewStoreByCategory">热门交易</a></li>
				<li><a href="${pageContext.request.contextPath}/order/toUserOrderListByUid">我的订单</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/user/toWithAdmin">联系我们</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb-tree">
					<li><a href="#">Home</a></li>
					<li class="active">Contact Us</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- SECTION -->
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<h3 class="title">保持联系</h3>
				<form class="contact-form" action="${pageContext.request.contextPath}/user/adviceSubmit" method="post">
					<div class="form-group">
						<input class="input" type="text" name="name" placeholder="您的姓名" required>
					</div>
					<div class="form-group">
						<input class="input" type="email" name="email" placeholder="您的邮箱" required>
					</div>
					<div class="form-group">
						<input class="input" type="text" name="subject" placeholder="主题" required>
					</div>
					<div class="form-group">
						<textarea class="input" name="message" placeholder="留言内容" required></textarea>
					</div>
					<button type="submit" class="primary-btn">发送信息</button>
				</form>
			</div>
			<div class="col-md-5 contact-info">
				<h3 class="title">联系信息</h3>
				<p>如果您有任何问题，请随时与我们联系。我们在这里为您提供帮助。</p>
				<p><strong>地址：</strong> CQIE樱花大道</p>
				<p><strong>电话：</strong> +173-2358-0528</p>
				<p><strong>邮箱：</strong> 2252221508@qq.com</p>
				<div id="contact-map">

				</div>
			</div>
		</div>
	</div>
</div>


<!-- FOOTER -->
<footer id="footer">
	<!-- top footer -->
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-6">
					<div class="footer">
						<h3 class="footer-title">About Us</h3>
						<p>Electro Ecommerce is your go-to destination for electronics shopping, offering a wide range of products from top brands.</p>
						<ul class="footer-links">
							<li><a href="#"><i class="fa fa-map-marker"></i> CQIE Sakural Road</a></li>
							<li><a href="#"><i class="fa fa-phone"></i> +173-2358-0528</a></li>
							<li><a href="#"><i class="fa fa-envelope-o"></i> 2252221508@qq.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-xs-6">
					<div class="footer">
						<h3 class="footer-title">Categories</h3>
						<ul class="footer-links">
							<li><a href="#">Hot Deals</a></li>
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
		</div>
	</div>

	<!-- bottom footer -->
	<div id="bottom-footer" class="section">
		<div class="container">
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
						&copy; 2023 All Rights Reserved. Electro Ecommerce.
					</span>
				</div>
			</div>
		</div>
	</div>
</footer>

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
