<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<style> 
	.ftco-services .services .icon span {
	    font-size: 28px;
	}
	
	/*모바일 플로팅 버튼*/
	.m-fl_layout {
	    position: fixed;
	    display: block;
	    flex-wrap: nowrap;
	    width: auto;
	    overflow: visible;
	    background: transparent;
	    bottom: 60px;
	    right: 24px;
	    z-index: 99;
	}
	
	.m-fl_btn {
		position: relative;
    	overflow: visible;
    	box-sizing: border-box;
	    width: auto;
	    padding: 0px;
	    margin: 0px;
	    overflow: visible;
	    border: 0px solid transparent;
	    text-shadow: transparent 0px 0px 0px;
	    background: transparent;
	    box-shadow: transparent 0px 0px 0px;
	    cursor: pointer;
	}
	
	.m-fl_btn_div {
		position: relative;
	    box-sizing: border-box;
	    flex-wrap: nowrap;
	    width: 60px;
	    height: 60px;
	    overflow: initial;
	    cursor: pointer;
	    box-shadow: rgba(255, 255, 255, 0.12) 0px 0px 2px 0px inset, rgba(0, 0, 0, 0.05) 0px 0px 2px 1px, rgba(0, 0, 0, 0.22) 0px 4px 20px;
	    backdrop-filter: blur(30px);
	    background: rgba(255, 255, 255, 0.9);
	    border-radius: 26px;
	    transition: box-shadow 0.2s ease-out 0s;
	    animation: 0.2s cubic-bezier(0.1, 0, 0.6, 1) 0.35s 1 normal backwards running fcEaNs;
	}
	
	.m-fl_btn:hover m-.fl_btn_div {
		box-shadow: rgba(255, 255, 255, 0.12) 0px 0px 4px 4px inset, rgba(0, 0, 0, 0.05) 0px 0px 2px 1px, rgba(0, 0, 0, 0.22) 0px 10px 50px;
	}
	
	.m-fl_btn_div img {
		width: 100%; 
		display: block; 
		border-radius: 26px;
	}
	
	/*최근 본 상품*/
	.rc_layout {
		position: fixed;
		display: block;
		background: #fff;
		bottom: 60px;
	    right: 24px;
	    z-index: 99;
	    width: 100px;
	    box-shadow: rgba(255, 255, 255, 0.12) 0px 0px 2px 0px inset, rgba(0, 0, 0, 0.05) 0px 0px 2px 1px, rgba(0, 0, 0, 0.22) 0px 4px 20px;
	    text-align: center;
	    border-radius: 10px;
	}
	
	.rc_layout p {
		margin: 0;
		background: #82ae46;
		padding: 5px;
		color: #fff;
		border-radius: 10px 10px 0 0;
	}
	
	.rc_layout ul {
		width: 100%;
		margin: 0 auto;
		padding: 10px;
	}
	
	.rc_layout ul li {
		margin-bottom: 10px;
		border: 1px solid #eee;
		border-radius: 10px;
		overflow: hidden;
	}
	
	.rc_layout ul li:last-child {
		margin-bottom: 0;
	}
	
	.rc_layout ul li img {
		max-width: 100%;
    	height: auto;
		-webkit-transform: scale(1);
	    -moz-transform: scale(1);
	    -ms-transform: scale(1);
	    -o-transform: scale(1);
	    transform: scale(1);
	    -moz-transition: all 0.3s ease;
	    -o-transition: all 0.3s ease;
	    -webkit-transition: all 0.3s ease;
	    -ms-transition: all 0.3s ease;
	    transition: all 0.3s ease;
	}
	
	.rc_layout ul li a:hover img {
		transform: scale(1.2);
	}
	
	/* 제품 아이콘 */
	.ftco-services .services .icon {
		cursor: pointer;
	}
	
	</style>
	

<script type="text/javascript">



$(function(){
	//console.log("세션 : " + "${sessionScope.animal}");
	
	let animal = parseInt(localStorage.getItem('animal'));
	
	if (!animal){
		animal = 1;
	}

	$.ajax({
		url : '${pageContext.request.contextPath}/switchImage',
		method : 'POST',
		data : {animal : animal},
		success: function(response){
			//console.log('home : ' + response.imgUrl);
		},
		error:function(){
			//console.log("실패");
		}
	});
	
	if (animal !== 1) {
		document.getElementById('iconText4').innerHTML = '장난감';
		document.getElementById('iconText5').innerHTML = '홈/리빙';
		document.getElementById('iconText6').innerHTML = '목욕/위생';
		document.getElementById('iconText7').innerHTML = '외출';
		document.getElementById('iconText8').innerHTML = '건강보조제';
		
		
		document.getElementById('iconLink1').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/11";
		};
		document.getElementById('iconLink2').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/12";
		};
		document.getElementById('iconLink3').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/13";
		};
		document.getElementById('iconLink4').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/14";
		};
		document.getElementById('iconLink5').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/15";
		};
		document.getElementById('iconLink6').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/16";
		};
		document.getElementById('iconLink7').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/17";
		};
		document.getElementById('iconLink8').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/18";
		};
	} else {
		document.getElementById('iconLink1').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/3";
		};
		document.getElementById('iconLink2').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/4";
		};
		document.getElementById('iconLink3').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/5";
		};
		document.getElementById('iconLink4').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/6";
		};
		document.getElementById('iconLink5').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/7";
		};
		document.getElementById('iconLink6').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/8";
		};
		document.getElementById('iconLink7').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/9";
		};
		document.getElementById('iconLink8').onclick = function(){
			location.href = "${pageContext.request.contextPath}/shop/10";
		};
	}
	
	
		   let product = JSON.parse(localStorage.getItem("product")) || [];
		   let out = "";
		   
		   
		   for(let item of product){
		      let itemNum = item.pnum;
		      let mainImage = item.pimg;
		      
		      out += "<li>"
		      out += "<a href='${pageContext.request.contextPath}/shop/info/"+itemNum+"'>" 
		      out += "<img src='${pageContext.request.contextPath}/uploads/item/"+mainImage+"'>"
		      out += "</a></li>";
		      
		   }
		   
		   
		   if (out === "") {
		       $(".rc_layout").hide();
		     } else {
		       $(".ulclass").html(out);
		     }
		   

});
</script>

	<!-- 최근 본 상품 -->
	<div class="rc_layout">
		<p>최근 본 상품</p>
		<ul class="ulclass">
		</ul>
	</div>
	
	<!-- //최근 본 상품 -->
	
	<!-- 모바일 플로팅 버튼 -->
	<!--  
	<div class="m-fl_layout">
		<button type="button" class="m-fl_btn">
			<div class="m-fl_btn_div">
				<div style="position: absolute; inset: 0px; margin: auto; width: 60px; height: 60px;">
					<img alt="최근 본 상품" src="${pageContext.request.contextPath}/resources/images/main/product_sample.png">
				</div>
			</div>
		</button>
	</div>
	-->
	<!-- //모바일 플로팅 버튼 -->
	

    
    <!-- 메인 배너 -->
    <section>
    	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="${pageContext.request.contextPath}/resources/images/main/main_ban02.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="${pageContext.request.contextPath}/resources/images/main/main_ban03.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="${pageContext.request.contextPath}/resources/images/main/main_ban01.jpg" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
    </section>
    <!-- //메인 배너 -->
		
	<!-- 아이콘 -->
	<section class="ftco-section">
		<div class="container" id ="iconId">
			<div class="row no-gutters ftco-services">
				<div class="col text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4"
					onclick="location.href='${pageContext.request.contextPath}/shop/3'" id="iconLink1">
						<div
							class="icon bg-color-4 active d-flex justify-content-center align-items-center mb-2">
							<span><i class="fa-solid fa-bone"></i></span>
						</div>
						<div class="media-body">
							<h3 class="heading" id="iconText1">
								주식
							</h3>
						</div>
					</div>
				</div>
				<div class="col text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4"
					onclick="location.href='${pageContext.request.contextPath}/shop/4'" id="iconLink2">
						<div
							class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
							<span><i class="fa-solid fa-cookie"></i></span>
						</div>
						<div class="media-body">
							<h3 class="heading" id="iconText2">
								간식
							</h3>
						</div>
					</div>
				</div>
				<div class="col text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4"
					onclick="location.href='${pageContext.request.contextPath}/shop/5'" id="iconLink3">
						<div
							class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
							<span><i class="fa-solid fa-shirt"></i></span>
						</div>
						<div class="media-body">
							<h3 class="heading" id="iconText3">
								패션
							</h3>
						</div>
					</div>
				</div>
				<div class="col text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4"
					onclick="location.href='${pageContext.request.contextPath}/shop/6'" id="iconLink4">
						<div
							class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
							<span><i class="fa-solid fa-paw"></i></span>
						</div>
						<div class="media-body">
							<h3 class="heading" id="iconText4">
								산책·외출
							</h3>
						</div>
					</div>
				</div>
				
				<div class="col text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4"
					onclick="location.href='${pageContext.request.contextPath}/shop/7'" id="iconLink5">
						<div
							class="icon bg-color-4 active d-flex justify-content-center align-items-center mb-2">
							<span ><i class="fa-solid fa-notes-medical"></i></span>
						</div>
						<div class="media-body">
							<h3 class="heading" id="iconText5">
								건강보조제
							</h3>
						</div>
					</div>
				</div>
				<div class="col text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4" 
					onclick="location.href='${pageContext.request.contextPath}/shop/8'" id="iconLink6">
						<div
							class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
							<span><i class="fa-solid fa-house"></i></span>
						</div>
						<div class="media-body">
							<h3 class="heading" id="iconText6">
								홈·리빙
							</h3>
						</div>
					</div>
				</div>
				<div class="col text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4"
					onclick="location.href='${pageContext.request.contextPath}/shop/9'" id="iconLink7">
						<div
							class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
							<span><i class="fa-solid fa-basket-shopping"></i></span>
						</div>
						<div class="media-body">
							<h3 class="heading" id="iconText7">
								장난감
							</h3>
						</div>
					</div>
				</div>
				<div class="col text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4"
					onclick="location.href='${pageContext.request.contextPath}/shop/10'" id="iconLink8">
						<div
							class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
							<span><i class="fa-solid fa-bath"></i></span>
						</div>
						<div class="media-body">
							<h3 class="heading" id="iconText8">
								목욕·위생
							</h3>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- //아이콘 -->

	<!-- 랭킹 -->
	<section class="ftco-section" style="padding: 0;">
    	<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
	          <div class="col-md-12 heading-section text-center ftco-animate">
	            <h2 class="mb-4">랭킹 지난 달 대망의 1위는?!</h2>
	          </div>
        	</div>   		
    	</div>
    	<div class="container">
    		<div class="row">
    			<c:forEach var="dto" items="${listRank}" varStatus="status">
				<div class="col-md-6 col-lg-3 ftco-animate">

					<div class="product">
			
							<a href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}" class="img-prod"><img class="img-fluid"
								src="${pageContext.request.contextPath}/uploads/item/${dto.mainImage}"
								alt="${dto.itemName}"> 
							<c:if test="${dto.discount != 0}">
								<span class="status">${dto.discount}%</span>
							</c:if>
							</a>

						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">${dto.itemName}</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<c:if test="${dto.discount != 0}">
											<span class="mr-2 price-dc "><fmt:formatNumber value="${dto.itemPrice}" type="currency"/></span>
										</c:if>
											<span class="price-sale"><fmt:formatNumber value="${dto.finalPrice}" type="currency"/></span>

									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="add-to-cart d-flex justify-content-center align-items-center text-center">
										<span><i class="ion-ios-menu"></i></span>
									</a> <a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center ">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</c:forEach>
			
		
    		</div>
    	</div>
    </section>
    <!-- //랭킹 -->
    
    <!-- 핫딜 -->
	<section class="ftco-section" style="padding: 0;">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
            <h2 class="mb-4" style="margin-top: 1.5rem;"><img alt="핫딜" src="${pageContext.request.contextPath}/resources/images/main/hotdeal.png" style="vertical-align: middle;"> 요즘 핫한 것만 모았어요!</h2>
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<div class="row">
    			<c:forEach var="dto" items="${listHotdeal}" varStatus="status">
				<div class="col-md-6 col-lg-3 ftco-animate">

					<div class="product">
			
							<a href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}" class="img-prod"><img class="img-fluid"
								src="${pageContext.request.contextPath}/uploads/item/${dto.mainImage}"
								alt="${dto.itemName}"> 
							<c:if test="${dto.discount != 0}">
								<span class="status">${dto.discount}%</span>
							</c:if>
							</a>

						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">${dto.itemName}</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<c:if test="${dto.discount != 0}">
											<span class="mr-2 price-dc "><fmt:formatNumber value="${dto.itemPrice}" type="currency"/></span>
										</c:if>
											<span class="price-sale"><fmt:formatNumber value="${dto.finalPrice}" type="currency"/></span>

									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="add-to-cart d-flex justify-content-center align-items-center text-center">
										<span><i class="ion-ios-menu"></i></span>
									</a> <a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center ">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</c:forEach>
    			
			</div>	
    	</div>
    </section>
    <!-- //핫딜 -->
    
    <!-- 신상 -->
	<section class="ftco-section" style="padding: 0; margin-bottom: 3rem;">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
            <h2 class="mb-4" style="margin-top: 1.5rem;">새로 입고되었어요~!!</h2>
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<div class="row">
    			<c:forEach var="dto" items="${listnewst}" varStatus="status">
				<div class="col-md-6 col-lg-3 ftco-animate">

					<div class="product">
			
							<a href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}" class="img-prod"><img class="img-fluid"
								src="${pageContext.request.contextPath}/uploads/item/${dto.mainImage}"
								alt="${dto.itemName}"> 
							<c:if test="${dto.discount != 0}">
								<span class="status">${dto.discount}%</span>
							</c:if>
							</a>

						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">${dto.itemName}</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<c:if test="${dto.discount != 0}">
											<span class="mr-2 price-dc "><fmt:formatNumber value="${dto.itemPrice}" type="currency"/></span>
										</c:if>
											<span class="price-sale"><fmt:formatNumber value="${dto.finalPrice}" type="currency"/></span>

									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="add-to-cart d-flex justify-content-center align-items-center text-center">
										<span><i class="ion-ios-menu"></i></span>
									</a> <a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center ">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</c:forEach>
			</div>
    	</div>
    </section>
    <!-- //신상 -->
		
		<!--  
		<section class="ftco-section img" style="background-image: url(${pageContext.request.contextPath}/resources/images/main/bg_3.jpg);">
    	<div class="container">
				<div class="row justify-content-end">
          <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
          	<span class="subheading">Best Price For You</span>
            <h2 class="mb-4">Deal of the day</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
            <h3><a href="#">Spinach</a></h3>
            <span class="price">$10 <a href="#">now $5 only</a></span>
            <div id="timer" class="d-flex mt-5">
						  <div class="time" id="days"></div>
						  <div class="time pl-3" id="hours"></div>
						  <div class="time pl-3" id="minutes"></div>
						  <div class="time pl-3" id="seconds"></div>
						</div>
          </div>
        </div>   		
    	</div>
    </section>
    -->


