<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
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

.my-coupon-container {
    padding: 30px 0 20px 0;
    align-items: flex-start;
    background-color: white;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 100%;
}

.coupon-wrap {
    align-items: flex-start;
    align-self: stretch;
    display: flex;
    flex-direction: column;
    padding-bottom: 30px;
}

.coupon-layout {
    align-items: flex-start;
    align-self: stretch;
    display: flex;
    flex-direction: row;
    gap: 10px;
    background-color: rgb(248 248 248);
    border: 1px none;
    border-radius: 5px;
    flex-wrap: wrap;
    padding: 20px;
}

.title {
    color: black;
    font-size: 24px;
    font-weight: 700;
    text-align: center;
    width: fit-content;
}
 
.coupon {
	align-items: flex-start;
	background-color: rgb(255, 255, 255);
	border: 1px solid;
	border-color: rgb(219, 219, 219);
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	gap: 5px;
	padding: 16px;
	flex-basis: calc(33% - 4px);
	min-height: 138px;
	justify-content: space-between;
}

.coupon:checked {
	align-items: flex-start;
	background-color: #f5fbff;
	border: 1px solid;
	border-color: rgb(219, 219, 219);
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	gap: 5px;
	padding: 16px;
	flex-basis: calc(50% - 5px);
	min-height: 138px;
	justify-content: space-between;
}

.coupon-upper {
	align-self: stretch;
	border: 1px none;
	display: flex;
}

.coupon-text-layout {
	align-items: flex-start;
	border: 1px none;
	display: flex;
	flex: 1;
	flex-direction: column;
}

.coupon-title {
	flex: 1;
	margin-top: -1px;
	white-space: nowrap;
	font-size: 14px;
	font-weight: 500;
	color: black;
}

.coupon-text {
	font-size: 24px;
	font-weight: 700;
	color: black;
}

.coupon-lower {
	align-items: flex-end;
	align-self: stretch;
	border: 1px none;
	display: flex;
	gap: 5px;
}

.empty-text {
    color: rgb(91 91 91);
    font-size: 15px;
    font-weight: 400;
    width: 100%;
    text-align: center;
    padding: 200px 0;
}


</style>

<div class="container -min">
	<div class="submenu-layout">
	  <ul>
	    <li><a class="submenu active" href="${pageContext.request.contextPath}/myPage/myPage">내 계정</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/orders">주문조회</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/favorite">즐겨찾기</a></li>
	  </ul>
	</div>
	
	<div class="my-coupon-container">
		<p class="title">쿠폰함</p>
	</div>
	<div class="coupon-wrap">
		<div class="coupon-layout">
			<c:if test="${couponUnusedDataCount eq 0}">
						<p class="empty-text">사용 가능한 쿠폰이 없어요.</p>
			</c:if>
			<c:forEach var="dto" items="${list}" varStatus="status">
		
						<c:if test="${dto.used eq 0}">
							<div class="coupon">
								<div class="coupon-upper">
									<div class="coupon-text-layout">
										<div class="coupon-title valign-text-middle">${dto.couponName}</div>
										<c:choose>
											<c:when test="${dto.couponCategory eq 0}">
											
												<div class="coupon-text valign-text-middle"><fmt:formatNumber value="${dto.couponPrice}" pattern="#,###" />원 </div>
											</c:when>
											<c:otherwise>
												<div class="coupon-text valign-text-middle">${dto.couponPrice}% </div>
											</c:otherwise>
										</c:choose>
									
									</div>
								</div>
								<div class="coupon-lower">
									<div class="restriction">
											<c:if test="${dto.couponNum == 15}">
												<p class="restriction-text valign-text-middle">
													<span>- 사용기간 : ~</span> <span>${dto1.couponEnd}</span> <span>까지</span>
												</p>							
												<p class="restriction-text valign-text-middle">
													<span>- 최소주문금액</span> <span>${dto.couponMinPrice}</span><span>원</span>
												</p>
											</c:if>
										<c:if test="${dto.couponNum != 15}">
										<p class="restriction-text valign-text-middle">
											<span>- 사용기간 : ~</span> <span>${dto.endDate2}</span> <span>까지</span>
										</p>							
										<p class="restriction-text valign-text-middle">
											<span>- 최소주문금액</span> <span>${dto.couponMinPrice}</span><span>원</span>
										</p>
										</c:if>
									</div>
								</div>
							</div>
						</c:if>

			</c:forEach>
		</div>
	</div>
	
</div>

