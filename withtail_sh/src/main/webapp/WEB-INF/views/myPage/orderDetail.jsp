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

.-min {
	min-height: 550px;
}

.od-detail-view {
    align-items: flex-start;
    background-color: var(--aloy-white);
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 30px;
    padding: 30px 0px;
    width: 100%;
}

.od-detail-title-layout {
    align-items: flex-end;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 10px;
    height: 35px;
}

.od-detail-section {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 20px;
}

.od-products-wrap {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
}

.order-detail-date {
    align-items: center;
    align-self: stretch;
    background-color: rgb(248 248 248);
    border-color: rgb(219 219 219);
    border-top-style: solid;
    border-top-width: 1px;
    display: flex;
    gap: 10px;
    height: 64px;
    padding: 15px 16px;
}

.od-date {
    align-items: center;
    border: 1px none;
    display: flex;
    gap: 5px;
    width: fit-content;
}

.od-date-text-reg {
    margin-top: -1px;
    width: fit-content;
    color: rgb(111 110 110);
    font-weight: 400;
    font-style: normal;
}

.valign-text-middle {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.od-date-text-med {
    color: rgb(18 18 18);
    font-weight: 500;
    margin-top: -1px;
    width: fit-content;
}

.od-number {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    gap: 5px;
}

.od-num-reg {
    margin-top: -1px;
    width: fit-content;
    color: rgb(111 110 110);
    font-weight: 400;
    font-style: normal
}

.od-num-med {
    color: rgb(68 148 241);
    font-weight: 500;
    margin-top: -1px;
    width: fit-content;
    font-style: normal;
}

.od-delivery-layout {
    align-items: center;
    align-self: stretch;
    background-color: var(--aloy-white);
    border-style: none;
    display: flex;
    flex-direction: column;
    gap: 20px;
    padding: 20px 16px;
}

.od-delivery {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 25px;
}

.od-delivery-title-layout {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 10px;
    justify-content: space-between;
}

.od-delivery-title {
    color: black;
   	font-size: 19px;
    font-weight: 500;
    font-style: normal;
}

.od-delivery-information {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 7px;
}

.x-wrap {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 10px;
    margin-bottom: -12px;
}

.od-item-text {
    margin-top: -1px;
    width: 80px;
    color: black;
    font-size: 15px;
    font-weight: 300;
    font-style: normal;
}

.od-item-text{
    color: black;
    font-size: 15px;
    font-weight: 300;
    font-style: normal;
}

.x-text {
    align-self: stretch;
    white-space: normal;
    word-break: break-all;
    color: #8b8484;
    font-size: 15px;
    font-weight: 300;
    font-style: normal;
    margin-bottom: 0px;
}

.od-address-layout {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
}

.od-name-text {
    flex: 1;
    margin-top: -1px;
    color: #8b8484;
    font-size: 15px;
    font-weight: 300;
    font-style: normal;

}

.od-product-list {
    align-items: center;
    align-self: stretch;
    background-color: #fff;
    border-color: rgb(219 219 219);
    border-top-style: solid;
    border-top-width: 1px;
    display: flex;
    flex-direction: column;
}

.od-product-title-layout {
    align-items: center;
    align-self: stretch;
    display: flex;
    justify-content: space-between;
    padding: 20px 16px;
}

.od-pd-title {
    color: black;
    font-size: 19px;
    font-weight: 500;
    font-style: normal;
    width: fit-content;
}

.minimal-text-btn {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    gap: 10px;
    padding: 2px;
    width: fit-content;
}

.text-1 {
    color: rgb(68 148 241);
    font-size: 12px;
    font-weight: 400;
    font-style: normal;
    text-decoration: underline;
}

.od-product-layout {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
}

.od-product {
    align-items: center;
    align-self: stretch;
    border-color: rgb(241 241 241);
    border-top-style: solid;
    border-top-width: 1px;
    display: flex;
    gap: 20px;
    padding: 20px 16px;
}

.od-product-info {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex: 1;
    gap: 20px;
}

.od-product-image-layout {
    align-items: flex-start;
    background-color: rgb(255 255 255);
    border: 1px solid;
    border-color: rgb(219 219 219);
    border-radius: 5px;
    display: flex;
    height: 60px;
    min-width: 60px;
    overflow: hidden;
    aspect-ratio: 1/1 !important;
}

.od-product-image {
    height: 60px;
    min-width: 60px;
    object-fit: cover;
}

img {
	max-width: 100%;
}

.od-product-detail-wrap {
    display: flex;
    flex-grow: 1;
    width: 100%;
    margin-left: 10px;
}

.od-product-name {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    justify-content: center;
}

.od-brand-text {
    align-self: stretch;
    white-space: normal;
    color: rgb(139 139 139);
    font-size: 12px;
    font-weight: 400;
    font-style: normal;
    margin-bottom: -5px;
}

.od-price-layout {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 5px;
}

.od-price-text {
    margin-top: -1px;
    width: fit-content;
    color: black;
    font-size: 16px;
    font-weight: 500;
    font-style: normal;
}

.od-retail-price {
    text-decoration: line-through;
    width: fit-content;
    color: rgb(139 139 139);
    font-size: 12px;
    font-weight: 400;
    font-style: normal;
}

.od-counting-text {
    align-self: stretch;
    flex: 1;
    margin-top: -1px;
    color: black;
    font-size: 12px;
    font-weight: 400;
    font-style: normal;
}

.od-product-detail {
    align-items: center;
    border: 1px none;
    display: flex;
    gap: 30px;
    justify-content: flex-end;
    width: fit-content;
}

.od-status-layout {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 6px;
    width: 110px;
}

.od-status-text {
    align-self: stretch;
    margin-top: -1px;
    text-align: right;
    color: black;
    font-size: 16px;
    font-weight: 400;
    font-style: normal;
}

.od-text-btn-layout {
    align-items: flex-end;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 6px;
    width: 140px;
}

.layout1 {
	display: flex;
    flex-direction: column;
    gap: 10px;
    align-self: stretch;
    min-width: 280px;
    white-space: nowrap;
}

.od-details-wrap {
    align-items: center;
    background-color: #fff;
    border: 1px solid;
    border-color: rgb(219 219 219));
    border-radius: 5px;
    display: flex;
    flex-direction: column;
    gap: 15px;
    justify-content: center;
    padding: 20px;
}

.details-component-layout {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.o-details-component {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    justify-content: space-between;
    gap: 10px;
}

.o-details-main-dt {
    width: fit-content;
    flex: 1;
    margin-top: -1px;
    color: black;
    font-size: 16px;
    font-weight: 500;
    font-style: normal;
}

.btn3 {
	width: 130px;
    font-size: 12px;
    height: 34px;
    border-radius: 5px;
    border: none;
    color: white;
    background-color: #82ae46;
}

.details-price-layout {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 20px;
    padding: 5px 0px;
}

.o-details-small-dt-layout {
    align-items: center;
    border: 1px none;
    display: flex;
    gap: 124px;
    width: fit-content;
}

.o-details-small-dt {
    margin-top: -1px;
    width: fit-content;
    color: black;
    font-size: 15px;
    font-weight: 400;
    font-style: normal;
}

.o-details-small-dd {
    flex: 1;
    margin-top: -1px;
    text-align: right;
    color: black;
    font-size: 15px;
    font-weight: 400;
    font-style: normal;
}

.total-d {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.o-details-minimal-dt {
    margin-top: -1px;
    width: fit-content;
    color: rgb(139 139 139);
    font-size: 12px;
    font-weight: 400;
    font-style: normal;
}

.o-details-minimal-dd {
    flex: 1;
    margin-top: -1px;
    text-align: right;
    color: rgb(139 139 139);
    font-size: 12px;
    font-weight: 400;
    font-style: normal;
}

.o-details-main-text-dt {
    color: black;
    font-size: 16px;
    font-weight: 500;
    font-style: normal;
    margin-top: -1px;
    width: fit-content;
}

.o-details-main-dd {
    color: rgba(0,0,0,0);
    flex: 1;
    font-size: 24px;
    font-weight: 700;
    margin-top: -1px;
    text-align: right;
}

.span0 {
    color: rgb(68 148 241);
    font-weight: 700;
	font-size: 16px;
	font-style: normal;
}

.span1{
    color: black;
    font-size: 16px;
    font-weight: 500;
    font-style: normal;
}

.o-details-main-text-min{
    align-self: stretch;
    text-align: right;
    font-size: 8px;
}

.btn40 {
	margin-left: 300px;
    width: 142px;
    height: 35px;
    border: 1px solid #82ae46;
    background-color: white;
    color: #82ae46;
    border-radius: 5px;
}

.od-delivery-invoice {
    text-align: center;
    width: fit-content;
    color: rgb(139 139 139);
    font-size: 15px;
    font-weight: 400;
    font-style: normal;
}

  </style>

<script>
$(function() {
	$('#orderGood').click(function() {

		let orderState = $('#orderState').val();
		let orderNum = ${dto.orderNum};
		
		
		updateOrderState(orderNum, orderState);
		
		
	
		let amount = ${dto.savePoint};
	
		
		getPoint(amount);
		
	});
	
	function updateOrderState(orderNum, orderState) {
		$.ajax({
		      url: "${pageContext.request.contextPath}/myPage/updateOrderState",
		      type: "POST", 
		      data: { orderNum:orderNum, orderState: orderState },
		      dataType: "JSON",
		      success: function(data) {
		        console.log("주문 상태 변경 성공");
		        $('#orderGood').hide();
		        $('.whatStatus').text('구매확정');
		     
		      },
		      error: function(xhr, status, error) {
		       
		        console.error("주문 상태 변경 실패");
		      
		      }
		    });
	}
	
	function getPoint(amount) {
		$.ajax({
		      url: "${pageContext.request.contextPath}/myPage/getPoint",
		      type: "POST", 
		      data: { amount: amount },
		      dataType: "JSON",
		      success: function(data) {
		        console.log("포인트 등록 성공");
		        $('#orderGood').hide();
		        $('.whatStatus').text('구매확정');
		     
		      },
		      error: function(xhr, status, error) {
		       
		        console.error(" 포인트 등록 실패");
		      
		      }
		    });
	}
	
	
});


$(function() {
	$('#insertCart').click(function() {
		const $btn = $(this);
		let itemNum = $(this).attr('data-itemNum');
		let option2Num = $(this).attr('data-option2Num');
		let option2Num2 = $(this).attr('data-option2Num2');
		
		console.log(option2Num);
		console.log(option2Num2);
		
		insertCart($btn, itemNum,option2Num,option2Num2);
		
	});
	
	function insertCart($btn, itemNum,option2Num,option2Num2) {
		$.ajax({
			url: "${pageContext.request.contextPath}/myPage/insertCart",
			type: "POST",
			data: { itemNum : itemNum, option2Num : option2Num, option2Num2 : option2Num2 },
			dataType : "JSON",
			success:function(data) {
				console.log("성공");
			},
			error: function(xhr, status, error) {
				
				console.error("실패");
			}
		});
	}
});




</script>

  <div class="container -min">
	<div class="submenu-layout">
	  <ul>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/myPage">내 계정</a></li>
	    <li><a class="submenu active" href="${pageContext.request.contextPath}/myPage/orders">주문조회</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/favorite">즐겨찾기</a></li>
	  </ul>
	</div>
	
	<div class="od-detail-view">
		<div class="od-detail-title-layout">
			<p style="font-size: 24px; color: black; font-weight: 1000; margin-bottom: 0px;">주문 상세 조회</p>
		</div>	
		<div class="od-detail-section">
			<div class="od-products-wrap">
				<div class="order-detail-date">
					<div class="od-date">
						<div class="od-date-text-reg valign-text-middle">
							주문일
						</div>
						<div class="od-date-text-med">
							${dto.purchaseDate}&nbsp;&nbsp;|&nbsp;&nbsp;
						</div>
						<div class="od-number">
							<div class="od-num-reg valign-text-middle">
								주문번호
							</div>
							<div class="od-num-med valign-text-middle">
								#${dto.orderNum}
							</div>
						</div>
						<c:if test="${dto.orderState eq 4}">
							<button type="button" class="btn40" id="orderGood">구매확정 하기</button>
						</c:if>
						<input type="hidden" name="orderState" id="orderState" value="${dto.orderState}">
					</div>
				</div>
				
				<div class="od-delivery-layout">
					<div class="od-delivery">
						<div class="od-delivery-title-layout">
							<div class="od-delivery-title valign-text-middle">
								배송 정보
							</div>
							<c:if test="${dto.orderState >= 2}">
								<div class="od-delivery-invoice valign-text-middle">
									<c:if test="${dto.invoiceNumber != 0}">
										${dto.companyName}&nbsp;&nbsp;${dto.invoiceNumber}
									</c:if>
								</div>
							</c:if>
						</div>
						<div class="od-delivery-information">
							<div class="x-wrap">
								<div class="od-item-text valign-text-middle">
									주문자 정보
								</div>
								<p class="od-name-text valign-text-middle">${dto.orderName} (${dto.tel})</p>
							</div>
							<div class="x-wrap">
								<div class="od-item-text valign-text-middle">
									배송지 정보
								</div>
								<div class="od-address-layout">								
									<p class="x-text valign-text-middle">[${dto.zip}] ${dto.addr1} ${dto.addr2}</p>
									<p class="x-text valign-text-middle">${dto.memo}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="od-product-list">
					<div class="od-product-title-layout">
						<div class="od-pd-title valign-text-middle">
							주문 상품
						</div>
					</div>
					<div class="od-product-layout">
						<c:forEach var="dto1" items="${list}" varStatus="status">
						<div class="od-product">
							<div class="od-product-info">
								<div class="od-product-image-layout">
									<img class="od-product-image" src="${pageContext.request.contextPath}/uploads/item/${dto1.mainImage}">
								</div>
								<div class="od-product-detail-wrap">
									<a href="#" class="od-product-name">
										<div class="od-brand-text valign-text-middle">
											${dto1.madeBy}
										</div>
										<p class="x-text valign-text-middle">${dto1.madeBy} ${dto1.itemName}<c:if test="${not empty dto1.option2Name}">(${dto1.option2Name}/${dto1.option2Name2})</c:if></p>
										<div class="od-price-layout">
											<div class="od-price-text valign-text-middle">
												<fmt:formatNumber value="${dto1.salePrice}" pattern="#,###" />원 
											</div>
											<div class="od-retail-price valign-text-middle">
												<fmt:formatNumber value="${dto1.price}" pattern="#,###" />원
											</div>
											<div class="od-counting-text valign-text-middle">
												(${dto1.count}개)
											</div>
										</div>
									</a>
									<div class="od-product-detail">
										<div class="od-status-layout">
											<div class="od-status-text valign-text-middle whatStatus">
												<c:if test="${dto.orderState eq 1}">
													결제완료
												</c:if>
												<c:if test="${dto.orderState eq 2}">
													배송준비중
												</c:if>
												<c:if test="${dto.orderState eq 3}">
													배송중
												</c:if>
												<c:if test="${dto.orderState eq 4}">
													배송완료
												</c:if>
												<c:if test="${dto.orderState eq 5}">
													구매확정
												</c:if>
												<c:if test="${dto.orderState eq 6}">
													구매취소
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="od-text-btn-layout">
								<button type="button" class="btn3" id="insertCart" data-itemNum="${dto1.itemNum}" data-option2Num2="${dto1.option2Num2}" data-option2Num="${dto1.option2Num}">장바구니 담기</button>
							</div>
						</div>
						</c:forEach>
					</div>				
				</div>			
			</div>
			<!-- 오른쪽 가격창 -->
			<div class="layout1">
				<div class="od-details-wrap">
					<div class="details-component-layout">
						<div class="o-details-component">
							<div class="o-details-main-dt valign-text-middle">
								결제 정보
							</div>
						</div>
						<hr style="width: 100%; color: #5c5858; border-width: 1px; margin-bottom: 0px; margin-top: 0px; border-style: solid">
							<div class="details-price-layout">
								<div class="o-details-component">
									<div class="o-details-small-dt-layout">
										<div class="o-details-small-dt valign-text-middle">
											상품 금액
										</div>
										<div class="o-details-small-dd valign-text-middle">
											<fmt:formatNumber value="${dto.totalPurchasePrice1}" pattern="#,###" />원
										</div>
									</div>
								</div>	
								<div class="total-d">
									<div class="o-details-component">
										<div class="o-details-small-dt-layout">
											<div class="o-details-small-dt valign-text-middle">
												할인 금액
											</div>
										</div>
										<div class="o-details-small-dd valign-text-middle">
											- <fmt:formatNumber value="${dto.total_discount}" pattern="#,###" />원
										</div>
									</div>
									<div class="o-details-component">
										<div class="o-details-minimal-dt valign-text-middle">
											상품 할인
										</div>
										<div class="o-details-minimal-dd valign-text-middle">
											- <fmt:formatNumber value="${dto.total_discount}" pattern="#,###" />원
										</div>
									</div>
								</div>
								<div class="total-d">
									<div class="o-details-component">
										<div class="o-details-small-dt-layout">
											<div class="o-details-small-dt valign-text-middle">
												배송비
											</div>
										</div>
										<div class="o-details-small-dd valign-text-middle">
											<fmt:formatNumber value="${dto.deliveryCharge}" pattern="#,###" />원
										</div>
									</div>
									<div class="o-details-component">
										<div class="o-details-minimal-dt valign-text-middle">
											배송비
										</div>
										<div class="o-details-minimal-dd valign-text-middle">
											<fmt:formatNumber value="${dto.deliveryCharge}" pattern="#,###" />원
										</div>
									</div>
								</div>
								<hr style="width: 100%; color: #5c5858; border-width: 1px; margin-bottom: 0px; margin-top: 0px; border-style: solid">
								
								<div class="total-d">
									<div class="o-details-component">
										<div class="o-details-small-dt-layout">
											<div class="o-details-small-dt valign-text-middle">
												쿠폰 할인
											</div>
										</div>
										<div class="o-details-small-dd valign-text-middle">
											- <fmt:formatNumber value="${dto.usedCoupon}" pattern="#,###" />원
										</div>
									</div>
									<div class="o-details-component">
										<div class="o-details-small-dt-layout">
											<div class="o-details-small-dt valign-text-middle">
												적립금 사용
											</div>
										</div>
										<div class="o-details-small-dd valign-text-middle">
											- <fmt:formatNumber value="${dto.usedPoint}" pattern="#,###" />원
										</div>
									</div>
								</div>
								<hr style="width: 100%; color: #5c5858; border-width: 1px; margin-bottom: 0px; margin-top: 0px; border-style: solid">
								<div class="o-details-component" style="margin-top: -6px; margin-bottom: -6px;">
									<div class="o-details-main-text-dt valign-text-middle">
										결제 금액
									</div>
									<div class="o-details-main-dd valign-text-middle">
										<span>	
											<span class="span0"><fmt:formatNumber value="${dto.totalPurchasePrice}" pattern="#,###" /></span>
											<span class="span1">원</span>
										</span>
									</div>
								</div>	
								<hr style="width: 100%; color: #5c5858; border-width: 1px; margin-bottom: 0px; margin-top: 0px; border-style: solid">							
								<div class="o-details-component" style="margin-top: -6px; margin-bottom: -6px;">
									<div class="o-details-main-text-dt valign-text-middle">
										결제 수단
									</div>
									<div class="o-details-main-text-dd-layout">
										<div class="o-details-main-text-dd valign-text-middle">
											신용카드
										</div>
										<div class="o-details-main-text-min valign-text-middle">
											${dto.cardName}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>		
  </div>
 	
