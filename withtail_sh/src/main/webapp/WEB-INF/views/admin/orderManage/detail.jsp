<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	 <div id="detailModal" class="modal-overlay" style="margin-top: 20px;">
        	<div class="title">
                <h2>주문 상세</h2>
            </div>
           <table class="table table-border border-top2 table-form">
					<tr> 
						<td>주문 번호</td>
						<td> 
							${order.orderNum }
			            </td>
					</tr>
					<tr> 
						<td>주문자</td>
						<td> 
							${order.userName }
			            </td>
					</tr>
					<tr> 
						<td>주문일자</td>
						<td> 
							${order.purchaseDate }
			            </td>
					</tr>
					<tr> 
						<td>주문상태</td>
						<td> 
							${order.orderStateInfo }
			            </td>
					</tr>
					<tr> 
						<td>총금액</td>
						<td> 
							 <fmt:formatNumber value="${order.totalOriPrice }" pattern="#,##0원" />
			            </td>
					</tr>
					<tr> 
						<td>적립금사용액</td>
						<td> 
							 <fmt:formatNumber value="${order.usedPoint }" pattern="#,##0원" />
			            </td>
					</tr>
					<tr> 
						<td>쿠폰사용액</td>
						<td> 
							 <fmt:formatNumber value="${order.usedCoupon }" pattern="#,##0원" />
			            </td>
					</tr>
					<tr> 
						<td>결제금액</td>
						<td> 
							 <fmt:formatNumber value="${order.totalPurchasePrice }" pattern="#,##0원" />
			            </td>
					</tr>
					<tr> 
						<td>배송비</td>
						<td> 
							 <fmt:formatNumber value="${order.deliveryCharge }" pattern="#,##0원" />
			            </td>
					</tr>
					<c:if test="${ state == 4 || state == 7 || state == 8 }">
					<tr> 
						<td>취소금액</td>
						<td> 
							 <fmt:formatNumber value="${order.totalPurchasePrice }" pattern="#,##0원" />
			            </td>
					</tr>
					</c:if>
			</table>
			<table class="table table-borderless mb-1">
				<tr>
					<td class="text-end" style="text-align: right;">
						<div class="row justify-content-end delivery-update-area">
							<c:if test="${order.orderState > 1 && order.orderState < 5 }">
								<div class="col-auto" style="display: inline-block;">
									<select class="form-select delivery-select">
										<option value="2" ${order.orderState==2?"selected='selected'":"" }>배송준비중</option>
										<option value="3" ${order.orderState==3?"selected='selected'":"" }>배송중</option>
										<option value="4" ${order.orderState==4?"selected='selected'":"" }>배송완료</option>
									</select>
								</div>
								<div class="col-auto"  style="display: inline-block;">
									<button type="button" class="btn btn-light btn-delivery-order" data-orderNum="${order.orderNum}" data-orderState="${order.orderState}">배송변경</button>
								</div>
							</c:if>
							<c:if test="${order.orderState == 5}">
								<div class="col-auto">
									<label>구매확정 일자 : ${order.orderStateDate}</label>
								</div>
							</c:if>
							</div>
							<div class="row justify-content-end refund-update-area">
							<c:if test="${order.orderState == 7 }">
								<div class="col-auto" style="display: inline-block;">
									<select class="form-select refund-select">
										<option value="7" ${order.orderState==7?"selected='selected'":"" }>환불 요청</option>
										<option value="8" ${order.orderState==8?"selected='selected'":"" }>환불 완료</option>
									</select>
								</div>
								<div class="col-auto"  style="display: inline-block;">
									<button type="button" class="btn btn-light btn-refund-order" data-orderNum="${order.orderNum}" data-orderState="${order.orderState}">상태변경</button>
								</div>
							</c:if>
						</div>
					</td>
				</tr>
			</table>
			
			<div style="margin-top: 30px;">
            <div class="title" style="margin-top:30px;">
                <h4>주문 상세 리스트</h4>
            </div>
          <table class="table table-border table-list" style="margin-top: 10px;">
	  		<thead class="table-light">
					<tr>
						<th class="bw-80">상세번호</th>
						<th>상품명</th>
						<th class="bw-90">상품가격</th>
						<th class="bw-90">할인가격</th>
						<th class="bw-130">옵션</th>
						<th class="bw-80">주문수량</th>
						<th class="bw-100">주문총금액</th>
						<th class="bw-90">적립금</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${listDetail}" varStatus="status">
						<tr valign="middle" id="orderDetail-list${dto.orderDetailNum}">
							<td>${dto.orderDetailNum}</td>
							<td>${dto.itemName}</td>
							<td><fmt:formatNumber value="${dto.price}"/></td>
							<td><fmt:formatNumber value="${dto.salePrice}"/></td>
							<td>${dto.option2Name} / ${dto.option2Name2}</td>
							<td>${dto.count}</td>
							<td><fmt:formatNumber value="${dto.purchaseMoney}"/></td>
							<td><fmt:formatNumber value="${dto.savePoint}"/></td>
						</tr>
					</c:forEach>
				</tbody>
		  	</table>
		  	</div>
			
			
			<div style="margin-top: 30px;">
            <div class="title" style="margin-top:30px;">
                <h4>결제 정보</h4>
            </div>
          <table class="table table-border table-list" style="margin-top: 10px;">
	  		<thead>
				<tr>
					<th class="wx-80">결제 구분</th>
					<th class="wx-80">결제 카드</th>
					<th class="wx-80">승인 번호</th>
					<th class="wx-80">승인 날짜</th>
				</tr>
			</thead>
			
		 	<tbody>
					<tr> 
						<td> 
							${order.payMethod }
			            </td>
						<td> 
							${order.cardName }
			            </td>
						<td> 
							${order.authNumber }
			            </td>
						<td> 
							${order.authDate }
			            </td>
					</tr>
		  	</tbody>
		  	</table>
		  	</div>
		  	
		  	
			<div style="margin-top: 30px;">
            <div class="title" style="margin-top:30px;">
                <h4>배송 정보</h4>
            </div>
          <table class="table table-border table-list" style="margin-top: 10px;">
	  		<thead>
				<tr>
					<th class="wx-80">배송 업체</th>
					<th class="wx-80">받는 사람</th>
					<th class="wx-80">송장 번호</th>
					<th class="wx-80">업체 번호</th>
				</tr>
			</thead>
			
		 	<tbody>
					<tr> 
						<td> 
							${order.orderState == 1 ? "--" : order.companyName }
			            </td>
						<td> 
							${order.orderState == 1 ? "--" : order.userName }
			            </td>
						<td> 
							${order.orderState == 1 ? "--" : order.invoiceNumber }
			            </td>
						<td> 
							${order.orderState == 1 ? "--" : order.companyTel }
			            </td>
					</tr>
		  	</tbody>
		  	</table>
		  	</div>
		</div>

