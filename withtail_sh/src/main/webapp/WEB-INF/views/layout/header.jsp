<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	ul, li {list-style: none; margin: 0; padding: 0;}
	
	/*검색창*/
	.searchbar {
		padding: 0;
		background-color: #f1f1f1;
		border-radius: 5px;
		width: 500px;
	}

	.searchbar input[type=text] {
		padding: 0 16px;
    	height: 42px;
		border: none;
		background-color: #f1f1f1;
		border-radius: 5px;
		color: rgba(91,91,91,1);
		outline: none;
		font-size: 14px;
		width: 100%;
	}

	.searchbar input[type=text]::placeholder {
		color: #999 !important;
	}

	/*카트*/
	.icon-shopping_cart {
		vertical-align: middle;
	}
	.cart-count {
		display: inline-block;
		border-radius: 50px;
		background-color: #82ae46;
		color: #fff;
		font-size: 10px;
		padding: 0px 5px;
		vertical-align: middle;
	}
	
	/*메뉴1*/
	.dropdown-item:hover {
		font-weight: 600;
	}

	/*메뉴2*/
	#menu {
	    height: 50px;
	    background: #fff;
	    position: relative;
	    z-index: 16;
	}
	
	#menu .nav-bold {
		font-weight: 600;
		font-size: 19px;
		color: #121212;
	}
	
	#menu li a {
		color: #121212;
	}
	
	.main1 {
	    width: 100%;
	    height: 100%;
	    margin: 0 auto;
	}
	
	.main1>li {
	    float: left;
	    line-height: 50px;
	    text-align: center;
	    position: relative;
	    width: 120px;
	}
	
	.main1>li:hover .main2 {
	    left: 0;
	}
	
	.main1>li a {
	    display: block;
	}
	
	.main1>li a:hover {
	    color: #82ae46 !important;
	    font-weight: 600;
	    text-indent: 5px;
	}
	
	.main2 {
	    position: absolute;
	    top: 50px;
	    left: -9999px;
	    background: #fff;
	    width: 120%;
	    border: 1px solid #eee;
	}
	
	.main2>li {
	    position: relative;
	}
	
	.main2>li:hover .main3 {
	    left: 100%;
	}
	
	.main2>li a, .main3>li a {
	    border-radius: 10px;
	    margin: 10px;
	}
	
	.main3 {
	    position: absolute;
	    top: 0;
	    background: #fff;
	    width: 80%;
	    left: -9999px;
	    border: 1px solid #eee;
	    /*left: 100%;*/
	    /*display: none;*/
	}
	
	.main3>li a:hover {
	    color: #82ae46;
	}
	
	/* 내 계정 > 로그인 */
	.a-login {
		background: #eee;
		text-align: center;
		border-top: 1px solid #dad7d7;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.a-login:hover {
		background: #eee !important;
	}
	
	.login_btn_span {
		background: #82ae46;
		padding: 5px 30px;
		color: #fff;
		display: inline-block;
		border-radius: 5px;
	}
	
	/*로그아웃*/
	.a-logout {
		background: #eee;
		text-align: center;
		border-top: 1px solid #dad7d7;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.a-logout:hover {
		background: #eee !important;
	}
	
	.logout_btn_span {
		background: #82ae46;
		padding: 5px 30px;
		color: #fff;
		display: inline-block;
		border-radius: 5px;
		margin-top: 5px;
	}
	
	.a-logout:hover .name-span {
		font-weight: normal;
		cursor: default;
	}
	
	/* 환영합니다. */
	.a-user {
		border-top: 1px solid #dad7d7;
		padding-top: 5px;
		background: #eee;
	}
	.a-user:hover {
		font-weight: normal;
		cursor: auto;
		background: #eee !important;
	}
	.user-name {
		color: #000;
		font-weight: 600;
	}
	
	@media (max-width: 1200px) {
		.searchbar {
		    width: 400px;
		}
	}
	
	/*고객상담*/
	.consultation1{
		padding-left:20px; padding-top:15px; font-weight: bold; color: #82ae46; font-size: 17px;
	}
	
	.consultationTel{
		 padding-left: 20px; font-weight: bold; padding-top: 10px; color: #292929; font-size:20px;
	}
	
	.consultationTime{
		padding-left: 20px; padding-right: 20px; padding-top: 10px; font-size: 14px; color: #949494;
	}
	
	/**/
	.ftco-navbar-light.scrolled .nav-item.cta > a {
	    background: #fff;
	}
	
	.ftco-navbar-light.scrolled .nav-item.cta > a span {
	    color: #000 !important;
	}
	
</style>


<script>

$(function(){
	$.ajax({
		  
		  url: '${pageContext.request.contextPath}/header',  
	      method: 'GET',
	      success: function(response) {
	    	  document.getElementById("cartCount").innerHTML = response;
	      },
	      error: function() {
	      }
	});

	
	let dataSt = localStorage.getItem('animal');
	//console.log(dataSt);
	if (dataSt !== '2'){
		document.getElementById("animalImg").src = "${pageContext.request.contextPath}/resources/images/header/icon_dog.png";
		
	} else {
		document.getElementById("animalImg").src = "${pageContext.request.contextPath}/resources/images/header/icon_cat.png";
	}
	
	
	let mySpan = document.getElementById("iconSearch");
	mySpan.addEventListener("click", function() {
		let keyword = document.getElementById("textSearch").value;
		let xhr = new XMLHttpRequest();
		let url = "${pageContext.request.contextPath}/search/list";
		let data = "?keyword=" + encodeURIComponent(keyword);
		
		url += data;
		
		xhr.open("GET", url, true);
		xhr.send(data);
		
	    xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      window.location.href = "${pageContext.request.contextPath}/search/list" + data;
	    }
	  };

	  
	});
	
});



</script>




<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="z-index: 99;">
	    <div class="container">
	      <a class="navbar-brand" href="${pageContext.request.contextPath}/">
			<img src="${pageContext.request.contextPath}/resources/images/header/logo.png" alt="WithTale" style="width: 70px;">
		  </a>

		  <div class="searchbar">
			<form class="search-form">
				<div class="form-group">
				  <span class="icon ion-ios-search" id="iconSearch"></span>
				  <input type="text" class="" id="textSearch" placeholder="위드테일에서 어떤 상품을 찾으세요?">
				</div>
			  </form>
		  </div>

	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          
	          <li class="nav-item dropdown" >
	          <a href="#" class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객상담</a>
	         	<div class="dropdown-menu" aria-labelledby="dropdown02" style="margin: 0; padding: 0; padding: 0.25rem 0; width: 200px; height: 200px;">
					<div class="consultation1" ><i class="bi bi-telephone-fill"></i>&nbsp;&nbsp;고객상담</div>
						<div class="consultationTel">010-1234-5678</div>
					<div class="consultationTime" >
						<div>평일 10:00 ~ 18:00</div>
						<div>점심시간 12:30 ~ 13:30</div>
						<div>주말, 공휴일 휴무</div>
					</div>
				</div>
	          </li>
			
			
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<img src="${pageContext.request.contextPath}/resources/images/header/icon_dog.png" alt="강아지" style="width: 34px;" id="animalImg">
				</a>
				<div class="dropdown-menu" aria-labelledby="dropdown02" style="margin: 0; padding: 0; padding: 0.25rem 0;">
					<a class="dropdown-item" onclick="return switchAnimal1();" data-value="1" style="cursor:pointer;">
						<img src="${pageContext.request.contextPath}/resources/images/header/icon_dog.png" alt="강아지" style="width: 34px;"> 강아지
					</a>
					<a class="dropdown-item" onclick="return switchAnimal2();" data-value="2" style="cursor:pointer;">
						<img src="${pageContext.request.contextPath}/resources/images/header/icon_cat.png" alt="고양이" style="width: 34px;"> 고양이
					</a>
				</div>
			  </li>
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/myPage/myPage" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">내 계정</a>
				<div class="dropdown-menu" aria-labelledby="dropdown03" style="margin: 0; padding: 0;">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/myPage/myPage">내 계정</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/myPage/orders">주문 조회</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/myPage/favorite">즐겨찾기</a>
					<c:choose>
						<c:when test="${empty sessionScope.member}">
							<a class="dropdown-item a-login" href="${pageContext.request.contextPath}/member/login">
								<span class="login_btn_span">로그인</span>
							</a>
						</c:when>
						<c:otherwise>
							<a class="dropdown-item a-logout" href="${pageContext.request.contextPath}/member/logout">
								<span class="name-span" style="display: block; font-size: 16px;">
									<span class="user-name">${sessionScope.member.userName}</span>님
								</span>
								<span class="logout_btn_span">로그아웃</span>
							</a>
						</c:otherwise>
					</c:choose>
				</div>
              </li>
	          <li class="nav-item cta cta-colored"><a href="${pageContext.request.contextPath}/cart/cart" class="nav-link"><span class="icon-shopping_cart"></span><span class="cart-count" id="cartCount" style="color: #fff !important;"></span> <span class="">장바구니</span></a></li>
			 <c:if test="${sessionScope.member.userId == 'admin' }">
			  	<li class="nav-item"><a href="${pageContext.request.contextPath}/admin" class="nav-link" title="관리자"><i class="fa-solid fa-gear"></i></a></li>
	         </c:if>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
	
	<!-- menu2 -->
	<nav style="border-bottom: 1px inset #eee;">
		<div id="menu" class="container">
			<ul class="main1">
				<li><a href="#" class="nav-bold"><i class="fa-solid fa-bars" style="margin-right: 20px;"></i>쇼핑</a>
					<ul class="main2">
						<li><a href="${pageContext.request.contextPath}/shop/1">강아지</a>
							<ul class="main3">
								<li><a href="${pageContext.request.contextPath}/shop/3">주식</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/4">간식</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/5">패션</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/6">산책·외출</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/7">건강보조제</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/8">홈·리빙</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/9">장난감</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/10">목욕·위생</a></li>
							</ul>
						</li>
		
						<li><a href="${pageContext.request.contextPath}/shop/2">고양이</a>
							<ul class="main3">
								<li><a href="${pageContext.request.contextPath}/shop/11">주식</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/12">간식</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/13">패션</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/14">장난감</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/15">홈·리빙</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/16">목욕·위생</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/17">산책·외출</a></li>
								<li><a href="${pageContext.request.contextPath}/shop/18">건강보조제</a></li>
							</ul>
						</li>
					</ul>
				</li>
		
				<li><a href="${pageContext.request.contextPath}/hotdeal/list" class="nav-bold">핫딜</a></li>
		
				<li><a href="${pageContext.request.contextPath}/ranking/list" class="nav-bold">랭킹</a></li>
				
				<li><a href="${pageContext.request.contextPath}/newest/list" class="nav-bold">신상</a></li>
				
				<li><a href="#" class="nav-bold">놀이터</a>
					<ul class="main2">
						<li><a href="${pageContext.request.contextPath}/tailPath/main">Tail & Path</a></li>
						<li><a href="${pageContext.request.contextPath}/bbs/list">커뮤니티</a></li>
					</ul>
				</li>
				
				<li><a href="${pageContext.request.contextPath}/event/progress/list" class="nav-bold">이벤트</a></li>
		
				<li><a href="#" class="nav-bold">고객센터</a>
					<ul class="main2">
						<li><a href="${pageContext.request.contextPath}/inquiry/list">1:1문의</a></li>
						<li><a href="${pageContext.request.contextPath}/faq/main">FAQ</a></li>
						<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
					</ul>
				</li>
					
			</ul>
		</div>
	</nav>
<!-- //menu2 -->


<script>
function switchImg(num){
	if(num === 2){
		$.ajax({
			  
			  url: '${pageContext.request.contextPath}/switchImage',  
		      method: 'POST',
		      data: {animal: num },
		      success: function(response) {
			     // 이미지 요청이 성공
			     let img = '${pageContext.request.contextPath}/resources/images/header/' + response.imgUrl ;
		        $('#animalImg').attr('src', img);
		      },
		      error: function() {
		        // 이미지 요청이 실패
		        //console.log('이미지 요청에 실패했습니다.');
		      }
		});
	} else {
		$.ajax({
			
			  url: '${pageContext.request.contextPath}/switchImage',  
		      method: 'POST',
		      data: {animal: num },
		      success: function(response) {
		        // 이미지 요청이 성공
		        let img = '${pageContext.request.contextPath}/resources/images/header/' + response.imgUrl ;
		        $('#animalImg').attr('src', img);
		      },
		      error: function() {
		        // 이미지 요청이 실패
		        //console.log('이미지 요청에 실패했습니다.');
		      }
		});
	}
	window.location.reload();
}

	function switchAnimal1(){
		let data = 1;
		localStorage.setItem('animal', data);
		switchImg(1);
	}
	
	function switchAnimal2(){
		let data = 2;
		localStorage.setItem('animal', data);
		switchImg(2);
	}
	

</script>
