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

	</style>
</head>
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

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- shop -->
			<div class="col-md-4 col-xs-6">
				<div class="shop">
					<div class="shop-img">
						<img src="./img/shop01.png" alt="">
					</div>
					<div class="shop-body">
						<h3>华硕ASUS<br>天选4</h3>
						<a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=8" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
			<!-- /shop -->

			<!-- shop -->
			<div class="col-md-4 col-xs-6">
				<div class="shop">
					<div class="shop-img">
						<img src="./img/shop03.png" alt="">
					</div>
					<div class="shop-body">
						<h3>西伯<br>游戏耳机X</h3>
						<a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=2" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
			<!-- /shop -->

			<!-- shop -->
			<div class="col-md-4 col-xs-6">
				<div class="shop">
					<div class="shop-img">
						<img src="./img/shop02.png" alt="">
					</div>
					<div class="shop-body">
						<h3>SONY<br>索尼WH-1000XM4</h3>
						<a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=3" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
			<!-- /shop -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<!-- section title -->
			<div class="col-md-12">
				<div class="section-title">
					<h3 class="title">新品上市 New Products</h3>
					<div class="section-nav">

					</div>
				</div>
			</div>
			<!-- /section title -->

			<!-- Products tab & slick -->
			<div class="col-md-12">
				<div class="row">
					<div class="products-tabs">
						<!-- tab -->
						<div id="tab1" class="tab-pane active">
							<div class="products-slick" data-nav="#slick-nav-1">

								<c:forEach items="${newCommoditiesList}" var="commodity" varStatus="x">
									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
											<div class="product-label">
												<c:if test="${commodity.discount !=1}">
													<span class="sale">-${(1-commodity.discount)*100}%</span>
												</c:if>
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">${commodity.category}</p>
											<h3 class="product-name"><a href="#">${commodity.name}</a></h3>
											<c:if test="${commodity.discount==1}">
												<h4 class="product-price">￥${commodity.price}</h4>
											</c:if>
											<c:if test="${commodity.discount !=1}">
												<h4 class="product-price">￥${commodity.price * commodity.discount} <del class="product-old-price">￥${commodity.price}</del></h4>

											</c:if>
											<div class="product-rating">

													<%--遍历总页数,显示1,2,3,4...--%>
												<c:forEach begin="1" end="${commodity.afterSales}" var="i">
													<i class="fa fa-star"></i>
												</c:forEach>
												<c:forEach begin="${commodity.afterSales+1}" end="5" var="i">
													<%--判断当循环的数字是否与当前页数字相同,相同就加上蓝色背景属性--%>
													<i class="fa fa-star-o"></i>
												</c:forEach>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist" id="addFavoriteBtn${x}"><a  href="${pageContext.request.contextPath}/user/addMyFavorite?cid=${commodity.id}"><i class="fa fa-heart-o"></i><span class="tooltipp">add my favorite</span></a></button>
												<button class="add-to-compare"><a href="${pageContext.request.contextPath}/user/addMyCart?cid=${commodity.id}"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></a></button>
												<button class="quick-view"><a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=${commodity.id}"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></a></button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a style="color:grey;" href="${pageContext.request.contextPath}/commodity/toBuyCommodity?cidList=0&cidList=${commodity.id}"><b>Go Buy</b> </a></button>
										</div>
									</div>
									<!-- /product -->
								</c:forEach>
							</div>
							<div id="slick-nav-1" class="products-slick-nav"></div>
						</div>
						<!-- /tab -->
					</div>
				</div>
			</div>
			<!-- Products tab & slick -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<div class="hot-deal">
					<ul class="hot-deal-countdown">
						<li>
							<div>
								<h3>02</h3>
								<span>Days</span>
							</div>
						</li>
						<li>
							<div>
								<h3>10</h3>
								<span>Hours</span>
							</div>
						</li>
						<li>
							<div>
								<h3>34</h3>
								<span>Mins</span>
							</div>
						</li>
						<li>
							<div>
								<h3>60</h3>
								<span>Secs</span>
							</div>
						</li>
					</ul>
					<h2 class="text-uppercase">hot deal this week</h2>
					<p>New Collection Up to 50% OFF</p>
					<a class="primary-btn cta-btn" href="#">Shop now</a>
				</div>
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>

<!-- /HOT DEAL SECTION -->


<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<!-- section title -->
			<div class="col-md-12">
				<div class="section-title">
					<h3 class="title">热门商品 Top selling</h3>
					<div class="section-nav">
						<ul class="section-tab-nav tab-nav">

						</ul>
					</div>
				</div>
			</div>
			<!-- /section title -->

			<!-- Products tab & slick -->
			<div class="col-md-12">
				<div class="row">
					<div class="products-tabs">
						<!-- tab -->
						<div id="tab2" class="tab-pane fade in active">
							<div class="products-slick" data-nav="#slick-nav-2">

								<c:forEach items="${topCommoditiesList}" var="commodity" varStatus="x">
									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
											<div class="product-label">
												<c:if test="${commodity.discount !=1}">
													<span class="sale">-${(1-commodity.discount)*100}%</span>
												</c:if>
												<span class="new">HOT</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">${commodity.category}</p>
											<h3 class="product-name"><a href="#">${commodity.name}</a></h3>
											<c:if test="${commodity.discount==1}">
												<h4 class="product-price">￥${commodity.price}</h4>
											</c:if>
											<c:if test="${commodity.discount !=1}">
												<h4 class="product-price">￥${commodity.price * commodity.discount} <del class="product-old-price">￥${commodity.price}</del></h4>

											</c:if>
											<div class="product-rating">

													<%--遍历总页数,显示1,2,3,4...--%>
												<c:forEach begin="1" end="${commodity.afterSales}" var="i">
													<%--判断当循环的数字是否与当前页数字相同,相同就加上蓝色背景属性--%>
													<i class="fa fa-star"></i>
												</c:forEach>
												<c:forEach begin="${commodity.afterSales+1}" end="5" var="i">
													<%--判断当循环的数字是否与当前页数字相同,相同就加上蓝色背景属性--%>
													<i class="fa fa-star-o"></i>
												</c:forEach>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist" id="addFavoriteBtn${x}"><a  href="${pageContext.request.contextPath}/user/addMyFavorite?cid=${commodity.id}"><i class="fa fa-heart-o"></i><span class="tooltipp">add my favorite</span></a></button>
												<button class="add-to-compare"><a href="${pageContext.request.contextPath}/user/addMyCart?cid=${commodity.id}"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></a></button>
												<button class="quick-view"><a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=${commodity.id}"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></a></button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a style="color:grey;" href="${pageContext.request.contextPath}/commodity/toBuyCommodity?cidList=0&cidList=${commodity.id}"><b>Go Buy</b> </a></button>

										</div>
									</div>
									<!-- /product -->
								</c:forEach>

							</div>
							<div id="slick-nav-2" class="products-slick-nav"></div>
						</div>
						<!-- /tab -->
					</div>
				</div>
			</div>
			<!-- /Products tab & slick -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section" style="height: 400px">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-4 col-xs-6">
				<div class="section-title">
					<h4 class="title">最受欢迎 TOP Popular </h4>
					<div class="section-nav">
						<div id="slick-nav-3" class="products-slick-nav"></div>
					</div>
				</div>

				<div class="products-widget-slick" data-nav="#slick-nav-3">
					<div>
						<!-- product widget -->
						<c:forEach items="${popularCommoditiesList.get(0)}" var="commodity" varStatus="x">
							<div class="product-widget">
								<div class="product-img">
									<img src="${commodity.photoUrl}" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${commodity.category} <span style="color: red"><b>好评数:${commodity.positiveFeedback}</b></span></p>
									<h3 class="product-name"><a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=${commodity.id}">${commodity.name}</a></h3>
									<c:if test="${commodity.discount==1}">
										<h4 class="product-price">￥${commodity.price}</h4>
									</c:if>
									<c:if test="${commodity.discount !=1}">
										<h4 class="product-price">￥${commodity.price * commodity.discount} <del class="product-old-price">￥${commodity.price}</del></h4>

									</c:if>
								</div>
							</div>
						</c:forEach>
						<!-- /product widget -->
					</div>

					<div>
						<%--第二页--%>
						<!-- product widget -->
							<c:forEach items="${popularCommoditiesList.get(1)}" var="commodity" varStatus="x">
								<div class="product-widget">
									<div class="product-img">
										<img src="${commodity.photoUrl}" alt="">
									</div>
									<div class="product-body">
										<p class="product-category">${commodity.category} <span style="color: red"><b>好评数:${commodity.positiveFeedback}</b></span></p>
										<h3 class="product-name"><a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=${commodity.id}">${commodity.name}</a></h3>
										<c:if test="${commodity.discount==1}">
											<h4 class="product-price">￥${commodity.price}</h4>
										</c:if>
										<c:if test="${commodity.discount !=1}">
											<h4 class="product-price">￥${commodity.price * commodity.discount} <del class="product-old-price">￥${commodity.price}</del></h4>

										</c:if>
									</div>
								</div>
							</c:forEach>
						<!-- product widget -->
					</div>
				</div>
			</div>

			<div class="col-md-4 col-xs-6">
				<div class="section-title">
					<h4 class="title">男士最爱 Men's favorite</h4>
					<div class="section-nav">
						<div id="slick-nav-4" class="products-slick-nav"></div>
					</div>
				</div>

				<div class="products-widget-slick" data-nav="#slick-nav-4">
					<div>
						<!-- product widget -->
						<c:forEach items="${manPopCommoditiesList.get(0)}" var="commodity" varStatus="x">
							<div class="product-widget">
								<div class="product-img">
									<img src="${commodity.photoUrl}" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${commodity.category} <span style="color: red"><b>好评数:${commodity.positiveFeedback}</b></span></p>
									<h3 class="product-name"><a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=${commodity.id}">${commodity.name}</a></h3>
									<c:if test="${commodity.discount==1}">
										<h4 class="product-price">￥${commodity.price}</h4>
									</c:if>
									<c:if test="${commodity.discount !=1}">
										<h4 class="product-price">￥${commodity.price * commodity.discount} <del class="product-old-price">￥${commodity.price}</del></h4>

									</c:if>
								</div>
							</div>
						</c:forEach>
						<!-- /product widget -->
					</div>

					<div>
						<%--第二页--%>
						<!-- product widget -->
						<c:forEach items="${manPopCommoditiesList.get(1)}" var="commodity" varStatus="x">
							<div class="product-widget">
								<div class="product-img">
									<img src="${commodity.photoUrl}" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${commodity.category} <span style="color: red"><b>好评数:${commodity.positiveFeedback}</b></span></p>
									<h3 class="product-name"><a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=${commodity.id}">${commodity.name}</a></h3>
									<c:if test="${commodity.discount==1}">
										<h4 class="product-price">￥${commodity.price}</h4>
									</c:if>
									<c:if test="${commodity.discount !=1}">
										<h4 class="product-price">￥${commodity.price * commodity.discount} <del class="product-old-price">￥${commodity.price}</del></h4>

									</c:if>
								</div>
							</div>
						</c:forEach>
						<!-- product widget -->
					</div>
				</div>
			</div>

			<div class="clearfix visible-sm visible-xs"></div>

			<div class="col-md-4 col-xs-6">
				<div class="section-title">
					<h4 class="title">女士最爱 Women's favorite</h4>
					<div class="section-nav">
						<div id="slick-nav-5" class="products-slick-nav"></div>
					</div>
				</div>

				<div class="products-widget-slick" data-nav="#slick-nav-5">
					<div>
						<!-- product widget -->
						<c:forEach items="${womanPopCommoditiesList.get(0)}" var="commodity" varStatus="x">
							<div class="product-widget">
								<div class="product-img">
									<img src="${commodity.photoUrl}" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${commodity.category} <span style="color: red"><b>好评数:${commodity.positiveFeedback}</b></span></p>
									<h3 class="product-name"><a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=${commodity.id}">${commodity.name}</a></h3>
									<c:if test="${commodity.discount==1}">
										<h4 class="product-price">￥${commodity.price}</h4>
									</c:if>
									<c:if test="${commodity.discount !=1}">
										<h4 class="product-price">￥${commodity.price * commodity.discount} <del class="product-old-price">￥${commodity.price}</del></h4>

									</c:if>
								</div>
							</div>
						</c:forEach>
						<!-- /product widget -->
					</div>

					<div>
						<%--第二页--%>
						<!-- product widget -->
						<c:forEach items="${womanPopCommoditiesList.get(1)}" var="commodity" varStatus="x">
							<div class="product-widget">
								<div class="product-img">
									<img src="${commodity.photoUrl}" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${commodity.category} <span style="color: red"><b>好评数:${commodity.positiveFeedback}</b></span></p>
									<h3 class="product-name"><a href="${pageContext.request.contextPath}/commodity/viewCommodityByCid?cid=${commodity.id}">${commodity.name}</a></h3>
									<c:if test="${commodity.discount==1}">
										<h4 class="product-price">￥${commodity.price}</h4>
									</c:if>
									<c:if test="${commodity.discount !=1}">
										<h4 class="product-price">￥${commodity.price * commodity.discount} <del class="product-old-price">￥${commodity.price}</del></h4>

									</c:if>
								</div>
							</div>
						</c:forEach>
						<!-- product widget -->
					</div>
				</div>
			</div>

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
