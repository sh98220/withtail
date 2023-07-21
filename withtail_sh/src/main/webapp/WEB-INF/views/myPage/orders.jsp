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

.order-view {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 30px;
    padding: 30px 0px;
    width: 100%;
}

.order-view-title-layout {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 10px;
}

.order-view-text {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    gap: 10px;
    justify-content: flex-end;
}

.text-input-1 {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-top: 8px;
}

select {
    width: 92px;
    height: 45px;
    border-color: #7f7f7f;
    border-radius: 9px;
   	color: #7f7f7f;
}

.order-view-section {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 20px;
    margin-top: -21px;
}

.order-view-list {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
}

.order-date-layout {
    align-items: flex-start;
    align-self: stretch;
    background-color: rgb(248 248 248);
    border-color: rgb(219 219 219);
    border-top-style: solid;
    border-top-width: 1px;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.order-date {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 10px;
    padding: 10px 16px;
}

.valign-text-middle {
    display: flex;
    flex-direction: column;
    justify-content: center;
    color: black;
}

.date {
    font-weight: 500;
    font-style: normal;
}

.order-detail-button {
    flex: 1;
    margin-top: -1px;
    text-align: right;
}

.order-detail-button {
    font-weight: 400;
    font-style: normal;
}

.order-view-product-wrap {
    align-items: center;
    align-self: stretch;
    background-color: rgb(255 255 255);
    border: 1px none;
    display: flex;
    justify-content: center;
}

.order-list-layout {
    align-items: flex-start;
    align-self: stretch;
    background-color: rgb(255 255 255);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-color: rgb(241 241 241);
    display: flex;
    gap: 20px;
    padding: 20px 16px;
    margin-top: -17px
}

.product-info-layout {
    display: flex;
    flex-direction: row;
    align-items: center;
    padding: 0px;
    gap: 20px;
    width: 100%;
}

.product-info {
    align-items: center;
    border: 1px none;
    display: flex;
    flex: 1;
    gap: 20px;
}

.product-image-layout {
    align-items: flex-start;
    background-color: rgb(255 255 255);
    border: 1px solid;
    border-color: rgb(219 219 219);
    border-radius: 5px;
    display: flex;
    width: fit-content;
}

.product-image {
    height: 60px;
    min-width: 60px;
    object-fit: cover;
}

.product-name {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    gap: 5px;
    justify-content: center;
}

.x-text {
    color: var(--aloy-black);
    font-size: var(--font-size-15px);
    font-weight: 400;
    font-style: normal;
    align-self: stretch;
}

.ov-price-layout {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 5px;
}

.price-text {
    color: rgb(18 18 18);
    font-size: 16px;
    font-weight: 500;
    font-style: normal;
}

.ov-counting-text {
    color: var(--aloy-gray6);
    font-size: var(--font-size-12px);
    font-weight: 400;
    font-style: normal;
}

.ov-text-btn {
    align-items: flex-end;
    border: 1px none;
    flex-direction: column;
    gap: 6px;
    width: 140px;
    margin-top: -11px;
}

.ov-text-btn1 {
    align-items: flex-end;
    border: 1px none;
    flex-direction: column;
    gap: 6px;
    width: 140px;
    margin-top: 7px;
}

.order-view-product-layout {
    align-items: center;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    justify-content: center;
}

.ov-status-text {
    align-self: stretch;
    flex: 1;
    margin-top: -1px;
    text-align: left;
    color: rgb(137 133 133);
    font-weight: 400;
    font-style: normal;
    width: 77px;
}


.ov-status-text-container {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    flex-direction: column;
    width: 130px;
}

.ov-status-text-wrap {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
}

.ov-status-text-layout {
    align-items: center;
    align-self: stretch;
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-color: rgb(248 248 248);
    border-left-style: solid;
    border-left-width: 1px;
    display: flex;
    flex: 1;
    gap: 10px;
    justify-content: flex-end;
    padding: 40px 28px;
    margin-top: -17px;
}

.btn2 {
    margin-top: 5px;
    width: 162px;
    margin-left: -58px;
    border-radius: 6px;
    border: none;
    font-size: 12px;
    height: 33px;
    color: #fff;
    background-color: #82ae46;
}

.btn2-1 {
    margin-top: 5px;
    width: 162px;
    margin-left: -58px;
    border-radius: 6px;
    border: 1px solid #82ae46;
    font-size: 12px;
    height: 33px;
    color: #82ae46;
    background-color: white;
}

.btn3 {
    margin-top: 5px;
    width: 162px;
    margin-left: -58px;
    border-radius: 6px;
    border: 1px solid #82ae46;
    font-size: 12px;
    height: 33px;
    color: #82ae46;
    background-color: white;
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

.btn40 {
	border: 1px solid #82ae46;
    background-color: white;
    color: #82ae46;
    margin-top: 5px;
    width: 100px;
    margin-left: -58px;
    border-radius: 6px;
    font-size: 12px;
    height: 33px;
    margin-left: 627px
}

.btn41 {
	border: 1px solid #82ae46;
    background-color: white;
    color: #82ae46;
    margin-top: 5px;
    width: 100px;
    margin-left: -58px;
    border-radius: 6px;
    font-size: 12px;
    height: 33px;
    margin-left: -218px;
}
  </style>
 
<script>
$(function() {
	$('.orderCancel').click(function() {
		const $btn = $(this);
		let orderState = $(this).attr('data-orderState');
		let orderNum = $(this).attr('data-orderNum');
		
		updateOrderCancel($btn, orderNum, orderState);
		
	});
	
	function updateOrderCancel($btn, orderNum, orderState) {
		$.ajax({
		      url: "${pageContext.request.contextPath}/myPage/updateOrderCancel",
		      type: "POST", 
		      data: { orderNum:orderNum, orderState: orderState },
		      dataType: "JSON",
		      success: function(data) {
		        console.log("주문 상태 변경 성공");
		        $btn.hide();
		        $('#status-text'+orderNum).text('주문취소');
		     
		      },
		      error: function(xhr, status, error) {
		       
		        console.error("주문 상태 변경 실패");
		      
		      }
		    });
	}
	
});


$(function() {
	$('.orderRefund').click(function() {
		const $btn = $(this);
		let orderState = $(this).attr('data-orderState');
		let orderNum = $(this).attr('data-orderNum');

		
		updateOrderRefund($btn, orderNum, orderState);
		
	});
	
	function updateOrderRefund($btn, orderNum, orderState) {
		$.ajax({
		      url: "${pageContext.request.contextPath}/myPage/updateOrderRefund",
		      type: "POST", 
		      data: { orderNum:orderNum, orderState: orderState },
		      dataType: "JSON",
		      success: function(data) {
		        console.log("주문 상태 변경 성공");
		        $btn.hide();
		        $('.whatStatus'+orderNum).text('환불요청');
		        $('#orderComplete'+orderNum).hide();
		     
		      },
		      error: function(xhr, status, error) {
		       
		        console.error("주문 상태 변경 실패");
		      
		      }
		    });
	}
	
});

$(function() {
	$('.insertCart').click(function() {
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
	<div class="order-view">
		<div class="order-view-title-layout">
			<div class="order-view-text">
				<p style="font-size: 24px; color: black; font-weight: 1000; margin-bottom: 0px;">주문 조회</p>
				<p>최대 지난 3년 간의 주문 내역까지 확인할 수 있어요.</p>
			</div>	
			
		</div>
		
		
		<c:choose>
			<c:when test="${orderDataCount eq 0}">
				<div class="orderhistory-layout">
					<div class="orderhistory-contents">
						<img class="order-image-1" alt="" src="${pageContext.request.contextPath}/resources/images/icon/order-image-1.png" width="120" height="100">
						<div class="orderhistory-text-layout">
							<p class="orderhistory-text">
								해당 기간에 주문하신 상품이 없습니다.
								<br>
								펫하이를 한번 둘러보시는 건 어떠신가요?
							</p>
						</div>
					</div>
					<button type="button" class="btn30" onclick="location.href='${pageContext.request.contextPath}/'">쇼핑하러 가기</button>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list}" varStatus="status">
				    <c:url var="url" value="/myPage/orderDetail">
			    		<c:param name="orderNum" value="${dto.orderNum}"/>
			    	</c:url>
				    <c:if test="${status.index == 0 || dto.orderNum != list[status.index - 1].orderNum}">
				    	
				        <div class="order-view-section">
				            <div class="order-view-list">
				                <div class="order-date-layout">
				                    <div class="order-date">
				                        <div class="date valign-text-middle">
				                            <span>${dto.purchaseDate} &nbsp;&nbsp;|&nbsp;&nbsp;#${dto.orderNum}<!-- 주문번호 --></span>
				                 		
				                        </div>
				                        <c:if test="${dto.orderState eq 4}">
					                    	<button type="button" class="btn40 orderComplete" onclick="location.href='${url}'" id="orderComplete${dto.orderNum}">구매확정 하기</button>
					                    	<button type="button" class="btn41 orderRefund" data-orderNum="${dto.orderNum}" data-orderState="${dto.orderState}">환불요청 하기</button>
					                	</c:if>	
					                	<c:if test="${dto.orderState eq 1}">
					                    	<button type="button" class="btn40 orderCancel" data-orderNum="${dto.orderNum}" data-orderState="${dto.orderState}">주문취소 하기</button>
					                	</c:if>
				                        <a href="${url}" class="order-detail-button valign-text-middle" style="color: rgb(68 148 241);">주문 상세 보기&nbsp;&nbsp;&nbsp;&nbsp;></a>
				              
				                    </div>
				                </div>
				            </div>
				        </div>
				    </c:if>
				    
				    <div class="order-view-product-wrap">
				        <div class="order-view-product-layout">
				            <div class="order-list-layout">
				                <div class="product-info-layout">
				                    <div class="product-info">
				                        <div class="product-image-layout">
				                            <div class="product-image">
				                                <img alt="product-image" src="${pageContext.request.contextPath}/uploads/item/${dto.mainImage}" class="product-image">
				                            </div>
				                        </div>
				                        <div class="product-name">
				                            <a href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}" class="x-text valign-text-middle">${dto.madeBy} ${dto.itemName}<c:if test="${not empty dto.option2Name2}">(${dto.option2Name}/${dto.option2Name2})</c:if>
				                            	<c:if test="${empty dto.option2Name2 and not empty dto.option2Name}">(${dto.option2Name})</c:if></a>
				                            <a href="${pageContext.request.contextPath}/shop/info/${dto.itemNum}" class="ov-price-layout">
				                                <div class="price-text valign-text-middle">
				                                    <fmt:formatNumber value="${dto.salePrice}" pattern="#,###" />원
				                                </div>
				                                <div class="ov-counting-text valign-text-middle">
				                                    (${dto.count}개)
				                                </div>
				                            </a>
				                            <div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				              		  <c:choose>
				              		  	<c:when test="${dto.orderState eq 5 and dto.reviewWrite eq 0}">
							                <div class="ov-text-btn">
							                    <button type="button" class="btn2 insertCart" data-itemNum="${dto.itemNum}" data-option2Num2="${dto.option2Num2}" data-option2Num="${dto.option2Num}">장바구니 담기</button>  	
							                	<c:url var="url1" value="/myPage/writeReview">
							                		<c:param name="orderDetailNum" value="${dto.orderDetailNum}"/>
							                		<c:param name="itemNum" value="${dto.itemNum}"/>
							                	</c:url>

							                	    <button type="button" class="btn2-1" onclick="location.href='${url1}'">후기 작성</button>		

							             	</div>
										</c:when>	
										<c:otherwise>
						              <div class="ov-text-btn1">
						              		
						                    <button type="button" class="btn2 insertCart" data-itemNum="${dto.itemNum}" data-option2Num2="${dto.option2Num2}" data-option2Num="${dto.option2Num}">장바구니 담기</button>  	
						                	
						             </div>	
						             </c:otherwise>
						             </c:choose>
						             
				                
				            </div>
				        </div>
				        <div class="ov-status-text-container">
				            <div class="ov-status-text-wrap">
				                <div class="ov-status-text-layout">
				                    <div class="ov-status-text valign-text-middle whatStatus${dto.orderNum}" id="status-text${dto.orderNum}">
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
											주문취소
										</c:if>
										<c:if test="${dto.orderState eq 7}">
											환불요청
										</c:if>
										<c:if test="${dto.orderState eq 8}">
											환불완료
										</c:if>
				                    </div>
				                </div> 
				            </div>
				        </div>
				    </div>	
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		
	</div>
  </div>
 	
