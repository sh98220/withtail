<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <style>
    .hidden {
		display: none;
	}

    .review-button {
    	background-color: white;
    	border-radius: 5px;
		border-color: #82ae46;
		color: #82ae46; 
    }
    
    .review-button:hover {
    	background-color: #82ae46;
		color: white;
    }
    
	.text-right {
		text-align: right;
	}

	.text-right .text-top {
		text-align: right;
		font-size: 11px;
		color: #000 !important;
	}

	
	.info-btn {
		border-radius: 5px !important;
		border-color: #82ae46 !important;
		color: #82ae46 !important; 
	}
	
	.info-btn:hover {
		background-color: #82ae46 !important;
		color: white !important;
		
	}
	
	.buttons {
		display: flex;
		gap: 10px;
	}
	
	.cart {
	  display: flex;
	  align-items: center;
	  margin-bottom: 10px;
	  padding: 20px 16px;
	  gap: 20px;
	  border-top: 1px solid #E6E6E6;
	  border-bottom: 1px solid #E6E6E6;
	}
	
	.product-thumbnail img {
	  border: 1px solid #E6E6E6;
	}
	
	.stars {
    margin-right: 3px;
    display: flex;
    align-items: flex-start;
	}
	
	.star-layout {
	    width: 14px;
	    height: 14px;
	    display: flex;
	}
	
	.scroll-to-top {
	  position: fixed;
	  bottom: 20px;
	  right: 20px;
	  background-color: #f2f2f2;
	  padding: 10px;
	  border-radius: 5px;
	  z-index: 999;
	  display: none; /* 페이지 상단에 있지 않을 때 숨김 */
	}
	
	.scroll-to-top.show {
	  display: block; /* 페이지 상단으로 스크롤 될 때 보임 */
	}
	
	.navigator {
	  display: flex;
	  justify-content: flex-start;
	  align-items: center;
	  background-color: rgba(50,50,100,0.04);
	  
	}
	
	.navigator a {
	  display: inline-block;
	  padding: 5px 10px;
	  text-decoration: none;
	  color: #333;
	  margin-left: 20px;
	}
	
	.navigator a:hover {
	  color: #82ae46;
	}
	
	.subheading {
		margin-top: 15px;
	}
	
	.review-header {
		margin-top: 3px;
		margin-bottom: 3px;
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}
	
	hr {
		border-top: 1px solid #ccc;
	}
	
	p {
		margin-bottom: 0px;
	}
	
	/*상품 토탈 테이블*/
	.table {
	    min-width: 400px !important;
	    margin-bottom: 0 !important;
	}
	
	.table th {
		border-top: 1px solid #999;
	}
	
	.table thead th {
		border-bottom: 1px solid #eaeaea;
		color: #444;
		font-size: 15px;
	}
	
	.table tbody tr td {
	    padding: 10px 10px;
	    border: 1px solid transparent !important;
	    border-bottom: 1px solid #eaeaea !important;
	}
	
	.quantity {
		display: inline-block;
		width: 60px !important;
	}
	
	.prod-tit {
		color: #333;
		margin-bottom: 0;
		font-size: 15px;
	}
	
	.op-tit {
		color: #888;
		font-size: 13px;
	}
	
	.op-price {
		font-weight: 600;
	}
	
	.x-btn {
		color: #999;
		cursor: pointer;
	}
	
	.qt-btn {
		border-radius: 5px !important;
	}
	
	/* 옵션 */
	.option {
		vertical-align: middle;
		display: inline-block;
	}
	
	.op-div {
		margin-bottom: 10px;
	}
	.op-div:last-of-type {
		margin-bottom: 0;
	}
	
	.op-div select {
		min-width: 200px;
	}
	
	.product-details .form-group .select-wrap select {
		letter-spacing: 0;
	}
	
	/* 추가 이미지 */
	.sm-img li {
		
	}
	.sm-img li img:not(.img-active) {
		cursor: pointer;
		vertical-align: middle;
		opacity: .3;
		-ms-filter: alpha(opacity=30);
    	filter: alpha(opacity=30);
    	-moz-user-select: none;
	    -webkit-transition: all 0.3s ease;
	    -moz-transition: all 0.3s ease;
	    -ms-transition: all 0.3s ease;
	    -o-transition: all 0.3s ease;
	    transition: all 0.3s ease;
	    box-shadow: 0 3px 5px rgba(0,0,0,0);
    	filter: url(data:image/svg+xml;utf8,&lt;svg xmlns=\'http://www.w3.org/2000/svg\'&gt;&lt;filter id=\'grayscale\'&gt;&lt;feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/&gt;&lt;/filter&gt;&lt;/svg&gt;#grayscale);
    	filter: gray;
    	-webkit-filter: grayscale(100%);
	}
	
	.sm-img li img.img-active {
		opacity: 1;
		filter: none;
	}
	
	.sm-img li:hover img {
		opacity: 1;
		filter: none;
	}
	
	/*상품 상세 아래*/
	.bb-green {
		border-bottom: 2px solid #82ae46;
		padding-bottom: 2px !important;
		color: #82ae46 !important;
	}
	
	/* 리뷰 */
	.rv-tit {
		border-bottom: 2px solid rgb(23, 24, 26);
	}
	
	.rv-count-div {
		font-weight: 600;
    	font-size: 14px;
    	color: rgb(77, 83, 89);
	    background: rgb(241, 243, 245);
	    border-radius: 4px;
	    padding: 4px 12px;
	    display: inline-block;
	}
	
	.hr {
		width: 1px;
    	height: 120px;
    	background: rgb(201, 207, 214);
	}
	
	.rv-container {
		border-bottom: 1px solid #999;
	}
	
	ul.rv-cont {
		
	}
	
	ul.rv-cont {
		
	}
	
	ul.rv-cont > li {
		padding: 20px;
	}
	
	.rv-user-li {
		background: rgb(241, 243, 245);
		flex-direction: column;
	}
	
	.rv-cont-li {
		flex-direction: column;
	}
	
	.rv-user-li .rv-user-tit {
		overflow: hidden;
	}
	
	.rv-user-li .rv-user-tit > span {
		display: inline-block;
	}
	
	.rv-op-div > span {
		display: inline-block;
		font-size: 12px;
	}
	
	.rv-like-div {
		overflow: hidden;
	}
	
	.rv-thumb {
		float: left;
		border: 1px solid #999; 
		display: inline-block; 
		font-size: 12px; 
		padding: 5px 10px; 
		color: #999;
		border-radius: 5px;
	}
	
	.rv-thumb:hover {
		color: #82ae46;
		border: 1px solid #82ae46;
	}
	
	.reply-btn {
		float: right;
		border: 1px solid #999; 
		display: inline-block; 
		font-size: 12px; 
		padding: 5px 20px; 
		color: #999;
		border-radius: 5px;
	}
	
	.reply-btn:hover {
		color: #82ae46;
		border: 1px solid #82ae46;
	}

	/* 리뷰 댓글 */
	.rv-reply-container {
		background: #eee;
		padding: 10px 0;
		border-top: 1px solid #999;
	}
	
	.rv-reply-user {
		font-size: 12px;
	}
	
	.rv-reply-user > span {
		display: inline-block;
	}
	
	.rv-reply-cont {
		font-size: 13px;
	}
	
	/*페이징*/
	.block-27 ul li a, .block-27 ul li span {
	    color: #666;
	    vertical-align: middle;
	}
	
	.block-27 ul li span.disabled {
		color: #999;
	}
	
	/*리뷰 댓글*/
	.rv-reply-container {
    	display: none;
	}
	
	/* 찜 버튼 */
	.product-details button i {
    	color: #82ae46;
	}
	
	.product-details button:hover {
		background: #fff !important;
		color: #82ae46 !important;
	}
	
	/* 리뷰 좋아요 */
	.rv-thumb:hover {
		cursor: pointer;
	}
	
	/*제목*/
	.subheading {
	    margin-top: 3rem;
	}
	
	/**/
	.min480 {
		min-width: 480px;
		min-height: 480px;
	}
	
	.info-img img {
		max-width: 960px !important;
	}
	
  </style>
  
  <script type="text/javascript">
  	// 상품 추가 이미지 처음 메인 이미지 필터 없앰
  	$(function(){
  		$(".sm-img li:nth-child(1) img").addClass("img-active");
  	});
  
  	// 상품 추가 이미지 클릭시 이벤트
  	$(function(){
		$(".sm-img li img").click(function(){
			$(".sm-img li img").removeClass("img-active");
			let url = $(this).attr("src");
			$(".lg-img").attr("href", url);
			$(".lg-img img").attr("src", url);
			$(this).addClass("img-active");
		});
	});
  </script>
  
  <script type="text/javascript">
  	function login() {
		location.href="${pageContext.request.contextPath}/member/login";
	}

	function ajaxProd(url, method, query, dataType, fn) {
		$.ajax({
			type:method,
			url:url,
			data:query,
			dataType:dataType,
			success:function(data) {
				fn(data);
			},
			beforeSend:function(jqXHR) {
				jqXHR.setRequestHeader("AJAX", true);
			},
			error:function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert("요청 처리가 실패 했습니다.");
					return false;
				}
		    	
				console.log(jqXHR.responseText);
			}
		});
	}
  </script>

  <script type="text/javascript">
  	// 옵션이 2개 있을 때
  	$(function(){
		// 필수 옵션-1
		$(".requiredOption").change(function(){
			$(".requiredOption2 option").each(function(){
				if($(this).is(":first-child")) {
					return true; // continue
				}
				
	        	$(this).remove();
	        });
			
			let option2Num = $(this).val();
			if(! option2Num) {
				return false;
			}
			
			let option1Num = $(".requiredOption").attr("data-optionNum");
			let extra1 = $(".requiredOption :selected").attr("data-extra1");
			
			let option1Sub = $(".requiredOption2").attr("data-optionNum2");
			
			let url = "${pageContext.request.contextPath}/shop/info/listOptionDetail2";
			$.get(url, {option1Num:option1Num, option1Sub:option1Sub, option2Num:option2Num, extra1:extra1}, function(data){
				$(data).each(function(index, item){
					let option2Num = item.option2Num;
					let option2Name = item.option2Name;
					let extraPrice = parseInt(extra1) + parseInt(item.extraPrice);
					let rExtraPrice = extraPrice.toLocaleString();
					
					$(".requiredOption2").append("<option value='"+option2Num+"' data-extra='"+extraPrice+"'>"+option2Name+" (+"+rExtraPrice+"원)</option>");
				});
			});
		});
		
		// 필수 옵션-2
		$(".requiredOption2").change(function(){
			if(! $(this).val()) {
				return false;
			}
			let itemNum = "${dto.itemNum}";
			if(! itemNum) {
				return false;
			}
			
			let subNum = $(".requiredOption").val();
			let subNum2 = $(this).val();
			
			let b = true;
			$(".order-area input[name=subNums2]").each(function(){
				let snum = $(this).closest("tr.order-group").find("input[name=subNums]").val();
				let snum2 = $(this).val();
				if(subNum === snum && subNum2 === snum2) {
					alert("선택된 옵션입니다.");
					$(".requiredOption").val("");
					$(".requiredOption").trigger("change");
					b = false;
					return false;
				}
			});
			if(! b) {
				return false;
			}
			
			let optionValue = $(".requiredOption :selected").text();
			let optionValue2 = $(".requiredOption2 :selected").text();
			let extraPrice = $(".requiredOption2 :selected").attr("data-extra");
			
			let optionPrice = Number("${dto.itemPrice}") + Number(extraPrice);
			let opPriceResult = optionPrice.toLocaleString();
			
			let oriPrice = Number("${dto.dcPrice}") + Number(extraPrice);
			
			let s = "- " + optionValue + "/ " + optionValue2;
			
			let out = "";
			out = '<tr class="order-group">';
			out += '	<td>';		
			out += '		<h6 class="prod-tit">${dto.itemName}</h6>';
			out += '			<p class="op-tit">'+s+'</p>';
			out += '	</td>';
			out += '	<td>';
			out += '		<div class="d-flex">';
			out += '			<span class="input-group-btn mr-2">';
			out += '				<button type="button" class="quantity-left-minus btn qt-btn" data-type="minus" data-field="">';
			out += '					<i class="ion-ios-remove"></i>';
			out += '				</button>';
			out += '			</span>';
			out += '			<input type="text" name="qtys" class="form-control input-number quantity" value="1" min="1" max="100" style="border-radius: 5px; width: 60px !important; display: inline-block;">';
			out += '			<input type="hidden" name="itemNums" value="'+itemNum+'">';
			out += '			<input type="hidden" name="subNums" value="'+subNum+'">';
			out += '			<input type="hidden" name="subNums2" value="'+subNum2+'">';
			out += '			<span class="input-group-btn ml-2">';
			out += '				<button type="button" class="quantity-right-plus btn qt-btn" data-type="plus" data-field="">';
			out += '					<i class="ion-ios-add"></i>';
			out += '				</button>';
			out += '			</span>';
			out += '		</div>';
			out += '	</td>';
			out += '	<td class="op-price" data-optionPrice="'+optionPrice+'" data-oriPrice="'+oriPrice+'">'+opPriceResult+'원</td>';
			out += '	<td>';
			out += '		<a href="#" class="x-btn">';
			out += '			<i class="fa-regular fa-rectangle-xmark"></i>';
			out += '		</a>';
			out += '	</td>';
			out += '</tr>';
			
			$("tbody.order-tbody").append(out);
			
			totalProdPrice();
		});
  	});
  	
  	// 옵션이 한 개 밖에 없을 때
  	$(function(){
  		$(".option1").change(function(){
  			if(! $(this).val()) {
				return false;
			}
			let itemNum = "${dto.itemNum}";
			if(! itemNum) {
				return false;
			}
			
			let subNum = $(this).val();
			
			let b = true;
			$(".order-area input[name=subNums]").each(function(){
				let snum = $(this).val();
				if(subNum === snum) {
					alert("선택된 옵션입니다.");
					$(".option1").val("");
					$(".option1").trigger("change");
					b = false;
					return false;
				}
			});
			if(! b) {
				return false;
			}
			
			let optionValue = $(".option1 :selected").text();
			let extraPrice = $(".option1 :selected").attr("data-extra");
			
			let optionPrice = Number("${dto.itemPrice}") + Number(extraPrice);
			let opPriceResult = optionPrice.toLocaleString();
			
			let oriPrice = Number("${dto.dcPrice}") + Number(extraPrice);
			
			let s = "- " + optionValue;
			
			let out = "";
			out = '<tr class="order-group">';
			out += '	<td>';		
			out += '		<h6 class="prod-tit">${dto.itemName}</h6>';
			out += '			<p class="op-tit">'+s+'</p>';
			out += '	</td>';
			out += '	<td>';
			out += '		<div class="d-flex">';
			out += '			<span class="input-group-btn mr-2">';
			out += '				<button type="button" class="quantity-left-minus btn qt-btn" data-type="minus" data-field="">';
			out += '					<i class="ion-ios-remove"></i>';
			out += '				</button>';
			out += '			</span>';
			out += '			<input type="text" name="qtys" class="form-control input-number quantity" value="1" min="1" max="100" style="border-radius: 5px; width: 60px !important; display: inline-block;">';
			out += '			<input type="hidden" name="itemNums" value="'+itemNum+'">';
			out += '			<input type="hidden" name="subNums" value="'+subNum+'">';
			out += '			<span class="input-group-btn ml-2">';
			out += '				<button type="button" class="quantity-right-plus btn qt-btn" data-type="plus" data-field="">';
			out += '					<i class="ion-ios-add"></i>';
			out += '				</button>';
			out += '			</span>';
			out += '		</div>';
			out += '	</td>';
			out += '	<td class="op-price" data-optionPrice="'+optionPrice+'" data-oriPrice="'+oriPrice+'">'+opPriceResult+'원</td>';
			out += '	<td>';
			out += '		<a class="x-btn">';
			out += '			<i class="fa-regular fa-rectangle-xmark"></i>';
			out += '		</a>';
			out += '	</td>';
			out += '</tr>';
			
			$("tbody.order-tbody").append(out);
			
			totalProdPrice();
  		});
  	});
  
  	function totalProdPrice() {
		let totalQty = 0;
		let totalPrice = 0;
		$(".order-group").each(function(){
			let qty = parseInt($(this).find("input[name=qtys]").val());
			let opPrice = parseInt($(this).find(".op-price").attr("data-optionPrice"));
			let oriPrice = parseInt($(this).find(".op-price").attr("data-oriPrice"));
			
			totalQty += qty;
			totalPrice += (oriPrice * qty);
		});
		
		let s = totalPrice.toLocaleString();
		
		$(".total-qty").text("("+totalQty+"개)");
		$(".total-price").text(s);
	}
  	
  	$(function(){
  		// 수량 증가
  		$(".order-area").on("click", ".quantity-right-plus", function(e){
  			let $order = $(this).closest("tr.order-group");
  			let qty = parseInt($order.find("input[name=qtys]").val()) + 1;
  			$order.find("input[name=qtys]").val(qty);
  			let opPrice = $order.find(".op-price").attr("data-optionPrice");
  			let oriPrice = $order.find(".op-price").attr("data-oriPrice");
  			let itemPrice = parseInt(opPrice) * qty;
  			let totalPrice = itemPrice.toLocaleString();
  			
  			//let $total = $(this).closest(".order-area");
  			$order.find(".op-price").text(totalPrice+"원");
  			
  			totalProdPrice();
  		});
  		
  		// 수량 빼기
  		$(".order-area").on("click", ".quantity-left-minus", function(e){
  			let $order = $(this).closest("tr.order-group");
  			let qty = parseInt($order.find("input[name=qtys]").val()) - 1;
  			
  			if(qty <= 0) {
  				alert("구매 수량은 한개 이상입니다.");
  				$(".requiredOption").val("");
  				$(".requiredOption").trigger("change");
  				// 옵션 1개만 있을 때
  				$(".option1").val("");
  				$(".option1").trigger("change");
  				
  				totalProductPrice();
  				
  				return false;
  			}
  			
  			$order.find("input[name=qtys]").val(qty);
  			let opPrice = $order.find(".op-price").attr("data-optionPrice");
  			let oriPrice = $order.find(".op-price").attr("data-oriPrice");
  			let itemPrice = parseInt(opPrice) * qty;
  			let totalPrice = itemPrice.toLocaleString();
  			
  			//let $total = $(this).closest(".order-area");
  			$order.find(".op-price").text(totalPrice+"원");
  			
  			totalProdPrice();
  			
  		});
  		
  		// 수량 제거
  		$(".order-area").on("click", ".x-btn", function() {
  			let $order = $(this).closest("tr.order-group");
  			
  			$(".requiredOption").val("");
  			$(".requiredOption").trigger("change");
  			// 옵션 1개만 있을 때
			$(".option1").val("");
			$(".option1").trigger("change");
				
  			$order.remove();
  			
  			totalProdPrice();
  		});
  		
  	});
  </script>
  
  <script type="text/javascript">
  	// 장바구니 담기 or 결제하기
  	function sendOk(mode) {
		let totalQty = 0;
		$(".order-group").each(function(){
			let qty = parseInt($(this).find("input[name=qtys]").val());
			
			totalQty += qty;
		});
		
		if(totalQty <= 0) {
			alert("구매 상품의 수량을 선택하세요 !!! ");
			if(mode === "cart") {
				$(".offcanvas-title").text("장바구니에 상품을 담지 못했습니다.");
			} else if(mode === "buy") {
			}
			return;
		}

		// 장바구니 담기
		if(mode === "cart") {
			let qs = $('form[name=buyForm]').serialize();
			
			let url = "${pageContext.request.contextPath}/order/saveCart";
			
			const fn = function(data) {
				if(data.state === "true") {
					$(".offcanvas-title").text("장바구니에 추가되었습니다.");
				} else {
					alert("장바구니에 상품을 담지 못했습니다.");
					$(".offcanvas-title").text("장바구니에 상품을 담지 못했습니다.");
					return false;
				}
			};
			
			ajaxProd(url, "post", qs, "json", fn);
		} else if(mode === "buy") {
			// 결제하기
			const f = document.buyForm;
			f.method = "get";
			f.action = "${pageContext.request.contextPath}/order/payment";
			f.submit();
		}
		
  	}
  </script>
  
  </head>

	<section class="ftco-section pb-0">
		<div class="container" style="padding-left: 0; padding-right: 0;">
			<div class="row">
				<div class="col-lg-6 mb-5 animate__animated animate__fadeInUp" style="padding-left: 0 !important;">
					<a href="${pageContext.request.contextPath}/uploads/item/${dto.mainImage}" class="image-popup lg-img">
						<img src="${pageContext.request.contextPath}/uploads/item/${dto.mainImage}"
							class="img-fluid min480" alt="${dto.itemName}">
					</a>
					<ul class="d-flex sm-img">
						<c:forEach var="vo" items="${listProdImage}">
							<li class="col col-lg-2 mt-2" style="padding-left: 0; padding-right: 0;">
								<img class="img-fluid" alt="상품추가이미지" src="${pageContext.request.contextPath}/uploads/item/${vo.photoName}">
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-lg-6 product-details animate__animated animate__fadeInUp">
					<form name="buyForm">
						<h4 style="text-align: right;">${dto.itemName}</h4>
						<hr>
		
						<div class="rating d-flex"></div>
						<div class="">
							<p class="originalPrice text-right">
								<span><del><fmt:formatNumber value="${dto.itemPrice}" pattern="#,###" />원</del></span>
							</p>
							<p class="price text-right" style="font-size: 25px;">
								<span class="${dto.discount==0 ? 'hidden' : ''}" style="color: red; font-size: 25px;">${dto.discount}%</span>
								<span class="ml-2" style="font-size: 25px;"><fmt:formatNumber value="${dto.dcPrice}" pattern="#,###" />원</span>
							</p>
						</div>
						<hr style="margin-bottom: 0">
						<div class="text-right">
							<div>
								<a class="text-top">적립금</a>
							</div>
							
							<span style="color: #82ae46; font-size: 20px">
								<fmt:formatNumber value="${dto.itemPoint}" pattern="#,###" />
							</span>
							<span>원</span>
						</div>
						<hr style="margin-bottom: 0; margin-top: 3px;">
						<div class="text-right">
							<div>
								<a class="text-top">배송비</a>
							</div>
							
							<span style="color: #82ae46; font-size: 20px">
								<fmt:formatNumber value="${dto.deliveryFee}" pattern="#,###" />
							</span>
							<span>원</span>
						</div>
						<hr style="margin-top: 3px">
	
					<div class="my-3">
						<c:choose>
							<c:when test="${not empty listOption[0] && not empty listOption[1]}">
								<!-- 옵션1 -->
								<div class="form-group d-flex w-100 justify-content-end align-items-center op-div">
									<span class="option mr-3">${listOption[0].option1Name}</span>
									<div class="select-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="" class="form-control requiredOption"
											data-optionNum="${listOption[0].option1Num}"
											style="border-radius: 5px">
											<option value="">-- ${listOption[0].option1Name} --</option>
											<c:forEach var="vo" items="${listOptionDetail}">
												<option value="${vo.option2Num}" data-extra1="${vo.extraPrice}">
													${vo.option2Name} (+<fmt:formatNumber value="${vo.extraPrice}" pattern="#,###"/>원)
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<!-- //옵션1 -->
								<!-- 옵션2 -->
								<div class="form-group d-flex w-100 justify-content-end align-items-center op-div">
									<span class="option mr-3">${listOption[1].option1Name}</span>
									<div class="select-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="" class="form-control requiredOption2"
											data-optionNum2="${listOption[1].option1Num}"
											style="border-radius: 5px;">
											<option value="">-- ${listOption[1].option1Name} --</option>
										</select>
									</div>
								</div>
								<!-- //옵션2 -->
							</c:when>
							<c:when test="${not empty listOption[0] && empty listOption[1]}">
								<!-- 옵션 1개밖에 없을 때 -->
								<div class="form-group d-flex w-100 justify-content-end align-items-center op-div">
									<span class="option mr-3">${listOption[0].option1Name}</span>
									<div class="select-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="" class="form-control option1"
											data-optionNum="${listOption[0].option1Num}"
											style="border-radius: 5px">
											<option value="">-- ${listOption[0].option1Name} --</option>
											<c:forEach var="vo" items="${listOptionDetail}">
												<option value="${vo.option2Num}" data-optionNum2="${vo.option2Num}" data-extra="${vo.extraPrice}">
													${vo.option2Name} (+<fmt:formatNumber value="${vo.extraPrice}" pattern="#,###"/>원)
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<!-- //옵션 1개밖에 없을 때 -->
							</c:when>
						</c:choose>
					</div>
	
					<div class="order-area">
						<div class="totalProducts mb-3">
							<table class="table bordered">
								<thead>
									<tr>
										<th>이름</th>
										<th>수량</th>
										<th>가격</th>
										<c:if test="${not empty listOption[0]}">
											<th>&nbsp;</th>
										</c:if>
									</tr>
								</thead>
								<tbody class="order-tbody">
									<c:if test="${empty listOption[0] && empty listOption[1]}">
										<tr class="order-group">
											<td>
												<h6 class="prod-tit">${dto.itemName}</h6>
												<!--<p class="op-tit">- 옐로우 / M</p>-->
											</td>
											<td>
												<div class="d-flex">
													<span class="input-group-btn mr-2">
														<button type="button" class="quantity-left-minus btn qt-btn"
															data-type="minus" data-field="">
															<i class="ion-ios-remove"></i>
														</button>
													</span>
													<input type="text" name="qtys"
														class="form-control input-number quantity" value="1" min="1"
														max="100"
														style="border-radius: 5px; width: 60px !important; display: inline-block;">
													<input type='hidden' name='itemNums' value="${itemNum}">
													<span class="input-group-btn ml-2">
														<button type="button" class="quantity-right-plus btn qt-btn"
															data-type="plus" data-field="">
															<i class="ion-ios-add"></i>
														</button>
													</span>
												</div>
											</td>
											<td class="op-price" data-optionPrice="${dto.itemPrice}" data-oriPrice="${dto.dcPrice}">
												<fmt:formatNumber value="${dto.itemPrice}" pattern="#,###" />원
											</td>
											<!--  
											<td><a href="#" class="x-btn"> <i
													class="fa-regular fa-rectangle-xmark"></i>
											</a></td>
											-->
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
						<!-- //상품 표 -->
						
						<!-- 총 상품금액 -->
						<div class="">
							<p class="originalPrice text-right">
								<span style="color: #000">총 상품금액</span>
								<span class="total-qty">
									<c:choose>
										<c:when test="${empty listOption[0] && empty listOption[1]}">
											(1개)
										</c:when>
										<c:otherwise>
											(0개)
										</c:otherwise>
									</c:choose>
								</span>
							</p>
							<p class="price text-right" style="font-size: 25px;">
								<span style="font-size: 25px;">
									<span class="total-price">
										<c:choose>
											<c:when test="${empty listOption[0] && empty listOption[1]}">
												<fmt:formatNumber value="${dto.dcPrice}" pattern="#,###" />
											</c:when>
											<c:otherwise>
												0
											</c:otherwise>
										</c:choose>
									</span>원
								</span>
							</p>
						</div>
						<!-- //총 상품금액 -->
					</div>
					
					<hr>
					
					<c:choose>
						<c:when test="${empty sessionScope.member}">
							<div class="d-flex justify-content-end">
								<p class="mr-2">
									<button type="button" class="btn btn-outline-success info-btn px-5" style="box-shadow: none;" onclick="login();">장바구니</button>
								</p>
									
								<button type="button" class="btn btn-outline-success info-btn px-5" style="box-shadow: none;" onclick="login();">찜 <i class="bi bi-heart"></i></button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="d-flex justify-content-end">
								<button type="button" class="btn btn-outline-success info-btn px-5 mr-2" style="box-shadow: none;" onclick="sendOk('buy');">구매하기</button>
								
								<p class="mr-2">
									<button data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample" type="button" 
										class="btn btn-outline-success info-btn px-5 btn-cart" style="box-shadow: none;" onclick="sendOk('cart');">
										장바구니
									</button>
								</p>
									
								<button type="button" class="btn btn-outline-success info-btn px-5 btn-wish" style="box-shadow: none;">찜 <i class="bi bi-heart"></i></button>
							</div>
						</c:otherwise>
					</c:choose>
					</form>
				</div>
			
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-animate" id="detailSection">
		<div class="container" style="padding-left: 0; padding-right: 0;">
			<div class="navigator">
				<div class="moveToDetail">
					<a href="#detailSection" class="bb-green">상품상세</a>
				</div>
				<div class="moveToReview">
					<a href="#reviewSection">리뷰(${rvDataCount})</a>
				</div>
				<div class="moveToQnA">
					<a href="#qnaSection">배송/교환/환불</a>
				</div>
			</div>
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate info-img">
					<span class="subheading">Detail</span>
					<h2 class="mb-4">상품상세</h2>
					<div>
						${dto.itemContent}
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-animate" id="reviewSection">
		<div class="container" style="padding-left: 0; padding-right: 0;">
			<div class="navigator">
				<div class="moveToDetail">
					<a href="#detailSection">상품상세</a>
				</div>
				<div class="moveToReview">
					<a href="#reviewSection" class="bb-green">리뷰(${rvDataCount})</a>
				</div>
				<div class="moveToQnA">
					<a href="#qnaSection">배송/교환/환불</a>
				</div>
			</div>
			
			<!-- 리뷰 -->
			<div class="rv-div mt-5">
				<!-- review/list.jsp 로 분리 -->
				
				<!-- //review/list.jsp 로 분리 -->
			</div>
			<!-- //리뷰 -->
			
			
		</div>
	</section>



	<section class="ftco-section ftco-animate" id="qnaSection">
		<div class="container" style="padding-left: 0; padding-right: 0;">
			<div class="navigator">
				<div class="moveToDetail">
					<a href="#detailSection">상품상세</a>
				</div>
				<div class="moveToReview">
					<a href="#reviewSection">리뷰(${rvDataCount})</a>
				</div>
				<div class="moveToQnA">
					<a href="#qnaSection" class="bb-green">배송/교환/환불</a>
				</div>
			</div>
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Q&A</span>
					<h2 class="mb-4">배송/교환/환불</h2>
					<p class="mb-4">상품에 대해 궁금한점을 질문해주세요. 위드테일에서 답변해드립니다.</p>
					<p>
						<a href="${pageContext.request.contextPath}/inquiry/write" class="btn btn-black py-3 px-5">1:1 문의 남기기</a>
					</p>
				</div>
			</div>
		</div>
		</section>
	
	<section class="ftco-section">
		<div class="container" style="padding-left: 0; padding-right: 0; border-top: 1px solid #999;">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Related Products</span>
					<h2 class="mb-4">이 상품의 연관상품</h2>
				</div>
			</div>
		</div>
		<div class="container" style="padding-left: 0; padding-right: 0; border-bottom: 1px solid #999;">
			<div class="row">
				<!-- 아이템1 -->
				<c:forEach var="vo" items="${listRelated}" varStatus="status" begin="0" end="3" step="1">
					<div class="col-md-6 col-lg-3 animate__animated animate__fadeInUp">
						<div class="product">
							<a href="${pageContext.request.contextPath}/shop/info/${vo.itemNum}" class="img-prod">
								<img class="img-fluid" src="${pageContext.request.contextPath}/uploads/item/${vo.mainImage}"
									alt="${vo.itemName}" style="min-height: 250px;">
								<span class="status ${vo.discount==0 ? 'hidden' : ''}">${vo.discount}%</span>
								<div class="overlay"></div>
							</a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3 style="height: 42px;">
									<a href="${pageContext.request.contextPath}/shop/info/${vo.itemNum}">${vo.itemName}</a>
								</h3>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">
											<span class="mr-2 price-dc ${vo.discount==0 ? 'hidden' : ''}"><fmt:formatNumber value="${vo.itemPrice}" type="currency"/></span>
											<span class="price-sale"><fmt:formatNumber value="${vo.dcPrice}" type="currency"/></span>
										</p>
									</div>
								</div>
								<div class="bottom-area d-flex px-3">
									<div class="m-auto d-flex">
										<a href="${pageContext.request.contextPath}/shop/info/${vo.itemNum}"
											class="add-to-cart d-flex justify-content-center align-items-center text-center">
											<span><i class="ion-ios-menu"></i></span>
										</a> <a href="${pageContext.request.contextPath}/shop/info/${vo.itemNum}"
											class="buy-now d-flex justify-content-center align-items-center mx-1">
											<span><i class="ion-ios-cart"></i></span>
										</a> <a href="${pageContext.request.contextPath}/shop/info/${vo.itemNum}"
											class="heart d-flex justify-content-center align-items-center ">
											<span><i class="ion-ios-heart"></i></span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- //아이템1 -->
			</div>
		</div>
	
	</section>
	
	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
		
	</section>
	<footer class="ftco-footer ftco-section">
	
	</footer>

<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1"
	id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
	<div class="offcanvas-header my-4">
		<h6 class="offcanvas-title" id="offcanvasExampleLabel">장바구니에 추가되었습니다.</h6>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="Close" onclick="location.href='${pageContext.request.contextPath}/cart/cart'"></button>
	</div>
	<div class="cart">
		<div class="product-thumbnail">
			<img alt="product-image"
				src="${pageContext.request.contextPath}/uploads/item/${dto.mainImage}"
				width="80" height="80">
		</div>
		<div class="product-name">
			<a>${dto.itemName}</a>
		</div>
	</div>
	<div class="cart-information px-4 my-3">
		<span> <span> 배송비 </span> <span> ${dto.deliveryFee}원 </span> <span> 입니다.
		</span>
		</span>
		<div class="progress my-3" style="height: 5px;">
			<div class="progress-bar" role="progressbar"
				aria-label="Success 1px high"
				style="background: #82ae46; width: 25%;" aria-valuenow="25"
				aria-valuemin="0" aria-valuemax="100"></div>
		</div>

		<div class="buttons my-3">
			<button type="button" class="btn btn-outline-success info-btn px-5">장바구니</button>
			<button type="button" class="btn btn-outline-success info-btn px-5">주문하기</button>
		</div>

	</div>
</div>

 <!-- 검색 폼 -->
	<form name="reviewForm" method="post">
		<input type="hidden" name="condition" value="all">
		<input type="hidden" name="keyword" value="">
	</form>
	
<script>
$(function(){
	$("body").on("click", ".rv-thumb", function(){
		let rvNum = $(this).attr("data-num");
		listPage(1, rvNum);
		
		const $i = $(this).find("i");
		let userLiked = $i.hasClass("bi bi-heart-fill");
		//let msg = userLiked ? "찜을 해제하시겠습니까 ? " : "찜을 하시겠습니까 ? ";
		
		/*
		if(! confirm( msg )) {
			return false;
		}
		*/
		
		let url2 = "${pageContext.request.contextPath}/review/insertReviewLike";
		let query2 = "rvNum="+num+"&userLiked="+userLiked;
		
		const fn2 = function(data){
			let state = data.state;
			if(state === "true") {
				if( userLiked ) {
					$i.removeClass("bi bi-hand-thumbs-up-fill").addClass("bi bi-hand-thumbs-up");
				} else {
					$i.removeClass("bi bi-hand-thumbs-up").addClass("bi bi-hand-thumbs-up-fill");
				}
			} else if(state === "liked") {
				alert("좋아요 표시는 한번만 가능합니다.");
			} else if(state === "false") {
				alert("처리가 실패했습니다.");
			}
		};
		
		ajaxProd(url2, "get", query2, "html", fn2);
		listPage(1, rvNum);
	});
});
</script>
	
<script>
$(function(){
	listPage(1, 0);
});

//리뷰 리스트
function listPage(page, rvNum) {
	let itemNum = "${itemNum}";
	let url = "${pageContext.request.contextPath}/review/list?itemNum="+itemNum;
	let query = "pageNo="+page;
	let search = $('form[name=reviewForm]').serialize();
	query = query+"&"+search+"&rvNum="+rvNum;
	let selector = ".rv-div";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxProd(url, "get", query, "html", fn);
}
</script>

<script>
// 댓글 버튼 열고 닫기
$(function(){
	$("body").on("click", ".reply-btn", function(){
		const $reply = $(this).closest(".rv-container").find(".rv-reply-container");
		
		let isVisible = $reply.is(':visible');
			
		if(isVisible) {
			$reply.addClass("hidden").removeClass("d-flex");
		} else {
			$reply.addClass("d-flex").removeClass("hidden");
		}
	});
});
</script>

<script>
// 상품 찜 여부
$(function(){
	$(".btn-wish").click(function(){
		const $i = $(this).find("i");
		let userLiked = $i.hasClass("bi bi-heart-fill");
		//let msg = userLiked ? "찜을 해제하시겠습니까 ? " : "찜을 하시겠습니까 ? ";
		
		/*
		if(! confirm( msg )) {
			return false;
		}
		*/
		
		let url = "${pageContext.request.contextPath}/shop/insertLike";
		let num = "${dto.itemNum}";
		let query = "itemNum="+num+"&userLiked="+userLiked;
		
		const fn = function(data){
			let state = data.state;
			if(state === "true") {
				if( userLiked ) {
					$i.removeClass("bi bi-heart-fill").addClass("bi bi-heart");
				} else {
					$i.removeClass("bi bi-heart").addClass("bi bi-heart-fill");
				}
			} else if(state === "liked") {
				alert("찜은 한번만 가능합니다.");
			} else if(state === "false") {
				alert("찜 처리가 실패했습니다.");
			}
		};
		
		ajaxProd(url, "post", query, "json", fn);
	});
});
</script>



<script>
	// 네비게이터 클릭 시 섹션으로 스크롤 이동
	var qnaButton = document.querySelector('.moveToReview a');
	qnaButton.addEventListener('click', function(event) {
		event.preventDefault();
		var qnaSection = document.getElementById('reviewSection');
		qnaSection.scrollIntoView({
			behavior : "smooth",
			block : "start" // 스크롤을 시작점으로 스무스하게 이동
		});
	});

	var qnaButton = document.querySelector('.moveToQnA a');
	qnaButton.addEventListener('click', function(event) {
		event.preventDefault();
		var qnaSection = document.getElementById('qnaSection');
		qnaSection.scrollIntoView({
			behavior : "smooth",
			block : "start" // 스크롤을 시작점으로 스무스하게 이동
		});
	});

	var qnaButton = document.querySelector('.moveToDetail a');
	qnaButton.addEventListener('click', function(event) {
		event.preventDefault();
		var qnaSection = document.getElementById('detailSection');
		qnaSection.scrollIntoView({
			behavior : "smooth",
			block : "start" // 스크롤을 시작점으로 스무스하게 이동
		});
	});
</script>

<script type="text/javascript">
// 최근 본 상품 저장용
$(function(){
   let pnum = "${dto.itemNum}";
   let pimg = "${dto.mainImage}";
   
   let product = JSON.parse(localStorage.getItem("product")) || [];
   
   // 동일한 상품이면 삭제
   product.forEach(function(data){
      if(data.pnum === pnum) {
         let idx = product.indexOf(data);
         if(idx > -1) product.splice(idx, 1);
         return;
      }
   });
   
   // 3개 이상이면 마지막 데이터 삭제
   if(product.length >= 3) {
      product.splice(product.length-1, 1);
   }
   
   // 저장할 데이터
   let obj = {pnum:pnum, pimg:pimg};
   product.unshift(obj); // 배열 가장 앞에 추가
   
   // 웹스트로지에 저장
   let p = JSON.stringify(product);
   localStorage.setItem("product", p);
   
});
</script>

</html>