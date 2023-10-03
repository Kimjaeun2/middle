<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#logo{
	width:150px;
	height: 80px;
	margin-top: -30px;
}
</style>
</head>
<body>
	<div>
		<header class="header-section">
			<div class="container-fluid">
				<div class="inner-header">
					<div class="logo">
					  <a href="productRecentList.do"><img id="logo" src="img/earthcycle.png" alt="earthcycle"></a>
					</div>
					<div class="header-right">
						<img src="img/icons/search.png" alt="search" class="search-trigger">
						 <c:if test="${not empty id}">
                     <a href="myPage.do">
                    <img src="img/icons/man.png" alt="mypage">
                    </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${empty id}">
                     <a href="loginAlert.do">
                    <img src="img/icons/man.png" alt="login">
                    </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
						<c:if test="${not empty id }"> <!-- 로그인 시 장바구니 호출 -->
						<a href="cartList.do">
							<img src="img/icons/bag.png" alt="cart"> 
						</a>
						</c:if>
						<c:if test="${empty id }"><!-- 로그인 안할 시 로그인 호출 -->
						<a href="loginAlert.do">
							<img src="img/icons/bag.png" alt="login">
						</a>
						</c:if>
					</div>

				<c:if test="${empty id }">
	                <div class="user-access">
	                    <a href="register.do">Register</a>
	                    <a href="memberLoginForm.do" class="in">Sign in</a>
	                </div>
                </c:if>
                <c:if test="${not empty id }">
                	<div class="user-access">
	                    <a href="#">${name }님</a>
	                    <a href="memberLogOut.do" class="in">Sign out</a>
	                </div>
				</c:if>

					<nav class="main-menu mobile-menu">
						<ul>
							<li><a class="active" href="productRecentList.do">Home</a></li>
							<li><a href="productList.do">Shop</a>
								<ul class="sub-menu">
									<li><a href="productCateList.do?productCategory=top">top</a></li>
									<li><a href="productCateList.do?productCategory=bottom">bottom</a></li>
									<li><a href="productCateList.do?productCategory=outer">outer</a></li>
									<li><a href="productCateList.do?productCategory=shoes">shoes</a></li>
								
									<c:if test="${auth eq 'A'}">
										<li><a href="productInsertForm.do">Product Insert</a></li>
									</c:if>
								</ul></li>
							<li><a href="auctionList.do">Auction</a>
								<ul class="sub-menu">
									<li><a href="auctionList.do">AuctionList</a></li>
									<c:if test="${not empty id }">
										<li><a href="auctionInsertForm.do">AuctionInsert</a></li>
									</c:if>
								</ul></li>
							<li><a href="noticeList.do">Notice</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>
</body>
</html>