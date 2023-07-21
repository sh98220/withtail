<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <style>
    /* 네비게이션 탭 스타일 */


    .submenu-layout {
      box-sizing: content-box;
      background-color: #f8f8f8;
      border-radius: 75px;
      display: flex;
      align-items: center;
      width: 22%;
      max-width: 800px;
      margin-top: 80px;
      overflow-x: auto;
    }

    .submenu-layout ul {
      display: flex;
      list-style-type: none;
      padding: 0;
    }
    
    .submenu {
      cursor: pointer;
      border-radius: 60px;
      display: flex;
      align-items: center;
      justify-content: center;
      flex: 1;
      min-width: 80px;
      height: 32px;
    }


    
     .submenu.active {
    background-color: #82ae46;
    color: white;
  }

  a {
	    color: #8b8b8b;
	}
	
	.submenu.active {
	  background-color: #82ae46;
	  color: white;
	}

.favorite {
    align-items: flex-start;
    background-color: var(--aloy-white);
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 30px;
    padding: 30px 0px;
    width: 100%;
}
	
.favorite-title-layout {
    align-items: flex-end;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 10px;
}

.valign-text-bottom {
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
}

.favorite-title {
    color: var(--aloy-black);
    width: fit-content;
    font-size: var(--font-size-24px);
    font-weight: 700;
    font-style: normal;
}

.valign-text-bottom {
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
}

.favorite-section {
    align-items: flex-start;
    align-self: stretch;
    border-top: 1px solid;
    border-bottom: 1px solid;
    border-color: #f1f1f1;
    display: flex;
    flex-direction: column;
}

.favorite-list {
    align-items: center;
    align-self: stretch;
    background-color: var(--aloy-white);
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 20px 16px;
}

.f-product-info {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 50px;
}

.f-product-image-layout {
    align-items: flex-start;
    background-color: var(--aloy-white);
    border: 1px solid;
    border-color: var(--aloy-gray4-stroke);
    border-radius: 5px;
    display: flex;
    gap: 10px;
    width: fit-content;
    overflow: hidden;
}

.f-product-image {
    height: 90px;
    min-width: 90px;
    object-fit: cover;
    max-width: 100%;
}

.f-product-wrap {
	display: contents;
}

.f-product-name {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    justify-content: center;
    cursor: pointer;
}

.f-product-text-layout {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
}

.f-brand-text {
    margin-right: -201px;
    margin-top: -1px;
    color: var(--aloy-gray6);
    font-size: 13px;
    font-weight: 400;
    font-style: normal;
}

.f-product-name .valign-text-middle {
    cursor: pointer;
}

.valign-text-middle {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.f-item-text {
    overflow: hidden;
    display: -webkit-box !important;
    color: #545454;
    font-weight: 200;
    font-style: normal;
}

.-min {
	min-height: 550px;
}

.rating {
    display: flex;
    align-items: flex-end;
    margin-bottom: 10px;
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

img {
    max-width: 100%;
}

.star-layout-two {
    width: 14px;
    height: 14px;
    display: flex;
}

.f-price-layout {
    align-items: center;
    border: 1px none;
    display: flex;
    gap: 10px;
    width: fit-content;
}

.f-price-underline {
    color: #b9b9b9;
    font-size: 12px;
    font-weight: 400;
    font-style: normal;
    text-align: right;
    text-decoration: line-through;
    width: fit-content;
}

.f-price-text {
	color: black;
	font-size: 20px;
	font-weight: 500;
	font-style: normal;
	margin-top: -1px;
	text-align: right;
	width: fit-content;
}

.f-button-layout {
    align-items: center;
    border: 1px none;
    display: flex;
    gap: 50px;
    width: fit-content;
}

hr.vertical-line {
    display: inline-block;
    border: none;
    border-left: 1px solid #b9b9b9;
    height: 38px;
    margin: 0;
  }

.btn1 {
	border-radius: 3px;
   	background-color: #82ae46;
   	border: none;
   	height: 35px;
    width: 140px;
    color: #fff;
    font-size: 13px;
}

.btn1:hover {
	border-radius: 3px;
   	background-color: #3b6601;
   	border: none;
   	height: 35px;
    width: 140px;
    color: #fff;
    font-size: 13px;
}

.orderhistory-layout {
    align-items: center;
    align-self: stretch;
    border: 1px solid;
    border-color: rgb(219 219 219);
    border-radius: 5px;
    display: flex;
    flex-direction: column;
    gap: 30px;
    padding: 80px 0px;
}

.orderhistory-contents {
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 17px;
    align-items: center;
}

.order-image-1 {
    height: 100px;
    min-width: 100px;
    object-fit: cover;
}

.orderhistory-text-layout {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 7px;
}

.orderhistory-text {
    align-self: stretch;
    color: black;
    font-size: 16px;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
}

.btn30 {
	width: 380px;
    height: 55px;
    border-radius: 5px;
    border: none;
    background-color: #82ae46;
    color: white;
}

  </style>
  
<script>
$(function() {
	$('.deleteBtn').click(function() {
		const $btn = $(this);
		let itemNum = $(this).attr('data-itemNum');

		
		deleteFavorite($btn, itemNum);
		
	});
	
	function deleteFavorite($btn, itemNum) {
		$.ajax({
		      url: "${pageContext.request.contextPath}/myPage/deleteFavorite",
		      type: "POST", 
		      data: { itemNum : itemNum },
		      dataType: "JSON",
		      success: function(data) {
		        console.log("삭제 성공");
		        $('.favoriteList' + itemNum).remove();
		        
		        let cnt = $('.favorite-list').length;
		       
		        console.log(cnt);
		        
		      if(cnt == 0) {
		        	$('.orderhistory-layout').show();
		       }
		     
		      },
		      error: function(xhr, status, error) {
		       
		        console.error("삭제 실패");
		      
		      }
		    });
	}
	
});


	


</script>

  <div class="container -min">
	<div class="submenu-layout">
	  <ul>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/myPage">내 계정</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/orders">주문조회</a></li>
	    <li><a class="submenu active" href="${pageContext.request.contextPath}/myPage/favorite">즐겨찾기</a></li>
	  </ul>
	</div>
 	
 	<div class="favorite">
 		<div class="favorite-title-layout">
 			<div class="favorite-title valign-text-bottom">
 				<p style="font-size: 24px; color: black; font-weight: 1000; margin-bottom: -10px;">즐겨찾기</p>
 			</div>
 		</div>	
			<div class="orderhistory-layout" style="${favoriteDataCount eq 0 ? '' :'display: none;'}">
				<div class="orderhistory-contents">
					<img class="order-image-1" alt="" src="${pageContext.request.contextPath}/resources/images/icon/order-image-1.png" width="120" height="100">
					<div class="orderhistory-text-layout">
						<p class="orderhistory-text">
							찜하신 상품이 없습니다.
							<br>
							펫하이를 한번 둘러보시는 건 어떠신가요?
						</p>
					</div>
				</div>
				<button type="button" class="btn30" onclick="location.href='${pageContext.request.contextPath}/'">쇼핑하러 가기</button>
			</div>
	
		
	 	<c:if test="${favoriteDataCount !=0}">
		 	
			 	<div class="favorite-section">
			 	<c:forEach var="dto" items="${list}" varStatus="status">
			 		<hr style="border-color: #c3c3c3; width: 100%; margin-bottom: 0px; margin-top: 0px;">
			 		<div class="favorite-list favoriteList${dto.itemNum}">
			 			<div class="f-product-info">
						 	<div style="position: relative;">
			 					<a class="f-product-image-layout" href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}">
			 						<img alt="f-product-image" class="f-product-image" src="${pageContext.request.contextPath}/uploads/item/${dto.mainImage}">
			 					</a>
			 				</div>	
			 				<div class="f-product-wrap">
			 					<div style="display: contents;"> 
			 						<div class="f-product-name">
										<div class="f-product-text-layout">
											<input type="hidden" name="itemNum" value="${dto.itemNum}" class="itemNum${dto.itemNum}">
											<a class="f-brand-text valign-text-middle" href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}">${dto.madeBy}</a>
											<a class="f-item-text valign-text-middle" href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}" style="font-size: 15px;">${dto.madeBy} ${dto.itemName}</a>
											<a href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}" style="display: contents">		
												<div class="rating">
													<div class="stars">
														<c:forEach var="star" begin="1" end="5">
														  <c:choose>
														    <c:when test="${star <= dto.star}">
														      <div class="star star-layout">
														      	<img alt="star" src="${pageContext.request.contextPath}/resources/svg/star-on.svg" width="12" height="12">
														      </div>
														    </c:when>
														    <c:otherwise>
														      <div class="star star-layout">
														      	<img alt="star" src="${pageContext.request.contextPath}/resources/svg/star.svg" width="12" height="12">
														      </div>
														    </c:otherwise>
														  </c:choose>
														</c:forEach>
													</div>
												</div>
											</a>	
										</div>
										<a class="f-price-layout" href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}">
											<div class="f-price-text valign-text-middle">
												<fmt:formatNumber value="${dto.salePrice1}" pattern="#,###" />원
											</div>
											<div class="f-price-underline valign-text-middle">
												<fmt:formatNumber value="${dto.itemPrice}" pattern="#,###" />원
											</div>								
										</a> 						
			 						</div>
			 					</div>
			 				</div>
			 				<div class="f-button-layout">
			 					<hr class="vertical-line">
			 					<button class="btn1" onclick="location.href='${pageContext.request.contextPath}/shop/info/${dto.itemNum}'">상품 상세보기</button>							
			 					<hr class="vertical-line">
			 					<a href="#" class="deleteBtn" data-itemNum="${dto.itemNum}">삭제</a>
			 				</div>
			 			</div>	
			 		</div>
			 		</c:forEach>	
			 	</div>
		 	
	 	</c:if>

  </div>
	
  </div>

