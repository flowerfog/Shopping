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

<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb-tree">
							<li><a href="#">Home</a></li>
							<li><a href="#">All Categories</a></li>
							<li><a href="#">Accessories</a></li>
							<li><a href="#">Headphones</a></li>
							<li class="active">Product name goes here</li>
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
			<div class="container"  style="height: 425px">
				<!-- row -->
				<div class="row">
					<!-- Product main img 主图 -->
					<div class="col-md-5 col-md-push-2">
						<div id="product-main-img">
							<%--第一张图为封面图--%>

							<div class="product-preview">
								<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
							</div>

								<div class="product-preview">
									<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
								</div>
								<div class="product-preview">
									<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
								</div>
								<div class="product-preview">
									<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
								</div>
								<div class="product-preview">
									<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
								</div>
						</div>
					</div>
					<!-- /Product main img -->

					<!-- Product thumb imgs 细节图 -->
					<div class="col-md-2  col-md-pull-5">
						<div id="product-imgs">
							<div class="product-preview">
								<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
							</div>
							<div class="product-preview">
								<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
							</div>
							<div class="product-preview">
								<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
							</div>
							<div class="product-preview">
								<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
							</div>
							<div class="product-preview">
								<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
							</div>
						</div>
					</div>
					<!-- /Product thumb imgs -->

					<!-- Product details -->
					<div class="col-md-5">
						<div class="product-details">
							<h2 class="product-name">${commodity.name}</h2>
							<div>
								<!-- 控制星 -->
								<div class="product-rating">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
								<a class="review-link" href="#">将该商品发送给商家并联系商家</a>
							</div>
							<div>
								<h3 class="product-price">￥${commodity.price * commodity.discount} <del class="product-old-price">￥${commodity.price}</del></h3>
								<c:if test="${commodity.inventory >= 500}">
									<span class="product-available" style="color: green">库存充足(小伙伴们可以放心购买)</span>
								</c:if>
								<c:if test="${commodity.inventory < 500 && commodity.inventory>0}">
									<span class="product-available" style="color: darkred">库存紧张(喜欢的小伙伴赶紧下手哦!)</span>
								</c:if>
								<c:if test="${commodity.inventory <= 0}">
									<span class="product-available" style="color: grey">暂时缺货(可联系平台补货)</span>
								</c:if>


							</div>
							<p>（商品描述）${commodity.description}</p>



							<div class="add-to-cart">
								<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a style="color:grey;" href="${pageContext.request.contextPath}/commodity/toBuyCommodity?cidList=0&cidList=${commodity.id}"><b>Go Buy</b> </a></button>
							</div>
							<ul class="product-btns">
								<li><a href="${pageContext.request.contextPath}/user/addMyFavorite?cid=${commodity.id}"><i class="fa fa-heart-o"></i> 添加到我的喜欢</a></li>
								<li><a href="${pageContext.request.contextPath}/user/addMyCart?cid=${commodity.id}"><i class="fa fa-exchange"></i> 添加到我的购物车</a></li>
							</ul>

							<ul class="product-links">
								<li>Category:</li>
								<li><a href="#">${commodity.category}</a></li>
							</ul>

							<ul class="product-links">
								<li>Share:</li>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								<li><a href="#"><i class="fa fa-envelope"></i></a></li>
							</ul>

						</div>
					</div>
					<!-- /Product details -->

					<!-- Product tab -->
					<div class="col-md-12">
						<div id="product-tab">
							<!-- product tab nav -->
							<ul class="tab-nav">
								<li class="active"><a data-toggle="tab" href="#tab1">商品描述</a></li>
								<li><a data-toggle="tab" href="#tab2">细节之处</a></li>
								<li><a data-toggle="tab" href="#tab3">评论(显示条数)</a></li>
							</ul>
							<!-- /product tab nav -->

							<!-- product tab content -->
							<div class="tab-content">
								<!-- tab1  -->
								<div id="tab1" class="tab-pane fade in active">
									<div class="row">
										<div class="col-md-12">
											<p>${commodity.description}</p>
										</div>
									</div>
								</div>
								<!-- /tab1  -->

								<!-- tab2  -->
								<div id="tab2" class="tab-pane fade in">
									<div class="row">
										<div class="col-md-12">
											<p>${commodity.details}</p>
										</div>
									</div>
								</div>
								<!-- /tab2  -->

								<!-- tab3  -->
								<div id="tab3" class="tab-pane fade in">
									<div class="row">
										<!-- Rating -->
										<div class="col-md-3">
											<div id="rating">
												<div class="rating-avg">
													<span>综合评价 </span>
													<div class="rating-stars">
														<c:forEach begin="1" end="${commodity.quality}" var="i">
															<i class="fa fa-star"></i>
														</c:forEach>
														<c:forEach begin="${commodity.quality+1}" end="5" var="i">
															<%--判断当循环的数字是否与当前页数字相同,相同就加上蓝色背景属性--%>
															<i class="fa fa-star-o"></i>
														</c:forEach>
													</div>
												</div>
												<ul class="rating">
													<li>
														质量:
														<div class="rating-stars">
															<c:forEach begin="1" end="${commodity.quality}" var="i">
																<i class="fa fa-star"></i>
															</c:forEach>
															<c:forEach begin="${commodity.quality+1}" end="5" var="i">
																<%--判断当循环的数字是否与当前页数字相同,相同就加上蓝色背景属性--%>
																<i class="fa fa-star-o"></i>
															</c:forEach>
														</div>
														<div class="rating-progress">
															<div style="width: ${commodity.quality * 20}%;"></div>
														</div>
													</li>
													<li>
														售后:
														<div class="rating-stars">
															<c:forEach begin="1" end="${commodity.afterSales}" var="i">
																<i class="fa fa-star"></i>
															</c:forEach>
															<c:forEach begin="${commodity.afterSales+1}" end="5" var="i">
																<%--判断当循环的数字是否与当前页数字相同,相同就加上蓝色背景属性--%>
																<i class="fa fa-star-o"></i>
															</c:forEach>
														</div>
														<div class="rating-progress">
															<div style="width:  ${commodity.afterSales * 20}%;"></div>
														</div>
												
													</li>
			
												</ul>
											</div>
										</div>
										<!-- /Rating -->

										<!-- Reviews -->
										<div class="col-md-6">
											<div id="reviews">
												<ul class="reviews">
													<li>
														<div class="review-heading">
															<h5 class="name">dwh</h5>
															<p class="date">21 June 2024, 8:0 PM</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
															</div>
														</div>
														<div class="review-body">
															<p>买就对了</p>
														</div>
													</li>
													<li>
														<div class="review-heading">
															<h5 class="name">dwh</h5>
															<p class="date">27 DEC 2018, 8:0 PM</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
															</div>
														</div>
														<div class="review-body">
															<p>买就对了</p>
														</div>
													</li>
													<li>
														<div class="review-heading">
															<h5 class="name">dwh</h5>
															<p class="date">27 DEC 2077, 8:0 PM</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
															</div>
														</div>
														<div class="review-body">
															<p>买就对了</p>
														</div>
													</li>
												</ul>
												<ul class="reviews-pagination">
													<li class="active">1</li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
												</ul>
											</div>
										</div>
										<!-- /Reviews -->

										<!-- Review Form -->
										<div class="col-md-3">
											<div id="review-form">
												<form class="review-form" action="#">
													<textarea class="input" placeholder="Your Review"></textarea>
													<div class="input-rating">
														<span>您的意见: <br></span>
														质量:
														<div class="stars">
															<input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
															<input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
															<input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
															<input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
															<input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
														</div>
														<br>
														售后:
														<div class="stars">
															<input id="star10" name="rating" value="5" type="radio"><label for="star5"></label>
															<input id="star9" name="rating" value="4" type="radio"><label for="star4"></label>
															<input id="star8" name="rating" value="3" type="radio"><label for="star3"></label>
															<input id="star7" name="rating" value="2" type="radio"><label for="star2"></label>
															<input id="star6" name="rating" value="1" type="radio"><label for="star1"></label>
														</div>
													</div>
													<button class="primary-btn">Submit</button>
												</form>
											</div>
										</div>
										<!-- /Review Form -->
									</div>
								</div>
								<!-- /tab3  -->
							</div>
							<!-- /product tab content  -->
						</div>
					</div>
					<!-- /product tab -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- Section -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-12">
						<div class="section-title text-center">
							<h3 class="title">Related Products</h3>
						</div>
					</div>
					<div class="clearfix visible-sm visible-xs"></div>


					<c:forEach items="${relatedCommodityList}" var="commodity" varStatus="x">
						<!-- product -->
						<div class="col-md-3 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="${pageContext.request.contextPath}${commodity.photoUrl}" alt="">
									<div class="product-label">
										<c:if test="${commodity.discount != 1}">
											<span class="sale">-${100-(commodity.discount * 100)}%</span>
										</c:if>
									</div>
								</div>
								<div class="product-body">
									<p class="product-category">${commodity.category}</p>
									<h3 class="product-name"><a href="#">${commodity.name}</a></h3>
									<h4 class="product-price">￥${commodity.price * commodity.discount}
									    <c:if test="${commodity.discount != 1}">
											<del class="product-old-price">￥${commodity.price}</del>
										</c:if>
									</h4>
									<div class="product-rating">
									</div>
									<div class="product-btns">
										<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
										<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
										<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
									</div>
								</div>
								<div class="add-to-cart">
									<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
								</div>
							</div>
						</div>
						<!-- /product -->
					</c:forEach>

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /Section -->

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
		<script src="../../js/jquery.min.js"></script>
		<script src="../../js/bootstrap.min.js"></script>
		<script src="../../js/slick.min.js"></script>
		<script src="../../js/nouislider.min.js"></script>
		<script src="../../js/jquery.zoom.min.js"></script>
		<script src="../../js/main.js"></script>

	</body>
</html>
