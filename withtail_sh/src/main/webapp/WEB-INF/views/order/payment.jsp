<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
main {
	background-color: #f8f8f8;
}

.order {
	align-items: center;
	background-color: rgb(248, 248, 248);
	border: 1px none;
	display: flex;
	flex-direction: column;
	gap: 30px;
	padding: 30px 0px;
}

.order-title-layout {
	align-items: flex-start;
	align-self: stretch;
	border: 1px none;
	display: flex;
}

.order-title {
	flex: 1;
	margin-top: -1px;
	color: black;
	font-size: 24px;;
	font-weight: 700;
	font-style: normal;
}

.-min {
	min-height: 550px;
}

.order-section {
	align-items: flex-start;
	align-self: stretch;
	border: 1px none;
	display: flex;
	gap: 20px;
}

.order-information-container {
	align-items: flex-start;
	border: 1px none;
	display: flex;
	flex-direction: column;
	gap: 20px;
	flex: 1;
	min-width: 588px;
}

.order-information-wrap {
	align-items: center;
	align-self: stretch;
	background-color: rgb(255, 255, 255);
	border: 1px solid;
	border-color: rgb(219, 219, 219);
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	justify-content: center;
	padding: 20px 30px;
}

.delivery-layout {
	align-items: flex-start;
	align-self: stretch;
	display: flex;
	flex-direction: column;
	gap: 25px;
}

.information-title-layout {
	align-items: center;
	align-self: stretch;
	display: flex;
	gap: 10px;
}

.valign-text-middle {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.information-title {
	flex: 1;
	margin-top: -1px;
	color: black;
	font-size: 19px;
	font-weight: 500;
}

.minimal-text-btn {
	align-items: flex-start;
	display: flex;
	gap: 10px;
	padding: 2px;
}

.text {
	margin-top: -1px;
	min-width: 27px;
	text-align: center;
	color: rgb(68, 148, 241);
	font-size: 15px;
	font-weight: 400;
}

.delivery-information {
	align-items: flex-start;
	align-self: stretch;
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.list {
	margin-top: -1px;
	width: 70px;
	font-size: 15px;
	font-weight: 300;
}

.text-1 {
	flex: 1;
	margin-top: -1px;
	font-size: 15px;
	font-weight: 400;
}

.x-layout {
	align-items: flex-start;
	align-self: stretch;
	border: 1px none;
	display: flex;
	gap: 10px;
	flex-wrap: wrap;
	word-break: break-all;
}

.x-layout1 {
	align-items: flex-start;
	align-self: stretch;
	display: flex;
	gap: 10px;
}

.add-address-text {
	color: rgb(139, 139, 139);
	font-size: 15px;
	font-weight: 400;
	font-style: normal;
	text-align: center;
	width: fit-content;
}

.address-box.selected {
	background-color: white;
}

.address-icon-bar {
	align-items: center;
	align-self: stretch;
	border: 1px none;
	display: flex;
	gap: 10px;
	justify-content: flex-end;
}

.icon {
	align-items: flex-start;
	border: 1px none;
	display: flex;
	gap: 10px;
	height: 20px;
	min-width: 20px;
}

.registered-address-box {
	align-items: center;
	background-color: rgb(248, 248, 248);
	border: 1px none;
	border-radius: 20px;
	display: flex;
	padding: 1px 5px;
}

.registered-address-name {
	margin-top: -1px;
	min-width: 52px;
	color: rgb(139, 139, 139);
	font-size: 12px;
	font-weight: 300;
	font-style: normal;
}

.right-icon-layout {
	align-items: center;
	border: 1px none;
	display: flex;
	flex: 1;
	gap: 2px;
	justify-content: flex-end;
}

.minimal-text-btn {
	align-items: flex-start;
	border: 1px none;
	display: flex;
	gap: 10px;
	padding: 2px;
}

.text-2 {
	margin-top: -1px;
	min-width: 22px;
	text-align: center;
	color: rgb(139, 139, 139);
	font-size: 12px;
	font-weight: 400;
	font-style: normal;
}

.address-text-wrap {
	align-items: flex-end;
	align-self: stretch;
	border: 1px none;
	display: flex;
	flex: 1;
	flex-direction: column;
	justify-content: space-between;
}

.address-text-layout-1 {
	align-items: flex-start;
	align-self: stretch;
	border: 1px none;
	display: flex;
	flex-direction: column;
	gap: 4px;
}

.address-box.selected .registered-address-name-1 {
	color: rgb(68, 148, 241);
}

.registered-address-name-1 {
	align-self: stretch;
	margin-top: -1px;
	color: black;
	font-size: 15px;
	font-weight: 500;
	font-style: normal;
}

.registered-address-1 {
	color: #999393;
	font-size: 12px;
	font-weight: 300;
	font-style: normal;
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 2;
	display: -webkit-box !important;
	-webkit-box-orient: vertical;
	align-self: stretch;
}

.phone-number-1 {
	color: black;
	font-size: 12px;
	font-weight: 300;
	font-style: normal;
	align-self: stretch;
	margin-top: -21px;
}

.message-1 {
	color: rgb(139, 139, 139);
	font-size: 12px;
	font-weight: 300;
	font-style: normal;
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 2;
	line-clamp: 2;
	display: -webkit-box !important;
	-webkit-box-orient: vertical;
	align-self: stretch;
}

.address-check-btn {
	align-items: center;
	border: 1px none;
	border-radius: 3px;
	display: flex;
	flex-direction: column;
	height: 24px;
	justify-content: center;
	width: 60px;
}

.address-box1 {
	align-items: center;
	background-color: white;
	border: 1px solid;
	border-color: rgb(219, 219, 219);
	border-radius: 5px;
	display: flex;
	flex: 1;
	flex-direction: column;
	gap: 10px;
	height: 230px;
	justify-content: center;
	padding: 10px 15px;
	flex-grow: 0 !important;
	flex-basis: calc(33% - 5px) !important;
}

.address-box {
	align-items: flex-start;
	background-color: rgb(248, 248, 248);
	border: 1px solid;
	border-color: rgb(219, 219, 219);
	border-radius: 5px;
	display: flex;
	flex: 1;
	flex-direction: column;
	gap: 7px;
	height: 230px;
	padding: 10px 15px;
	word-break: break-all;
	flex-grow: 0 !important;
	flex-basis: calc(33% - 5px) !important;
}

.coupon-layout {
	align-items: flex-start;
	align-self: stretch;
	border: 1px none;
	display: flex;
	gap: 10px;
	flex-wrap: wrap;
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
	flex-basis: calc(50% - 5px);
	min-height: 138px;
	justify-content: space-between;
}

.coupon:hover {
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

.restriction {
	align-items: flex-start;
	border: 1px none;
	display: flex;
	flex: 1;
	flex-direction: column;
}

.restriction-text {
	align-self: stretch;
	display: inline-block;
	font-size: 11px;
	font-weight: 300;
	color: rgb(139, 139, 139);
	margin-bottom: 0px;
}

.count1 {
	align-items: flex-end;
	font-size: 14px;
	color: gray;
	margin-right: 11px;
}

.point-wrap {
	align-items: flex-start;
	align-self: stretch;
	border: 1px none;
	display: flex;
	flex-direction: column;
	gap: 10px;
	margin-top: 25px;
}

.point-layout {
	align-items: flex-start;
	border: 1px none;
	display: flex;
	gap: 10px;
	width: 100%;
	justify-content: space-between;
	margin-top: -28px;
	margin-bottom: -26px;
}

.information-title {
	width: fit-content;
	color: black;
	font-size: 19px;
	font-weight: 500;
}

.point {
	align-items: flex-start;
	border: 1px none;
	display: flex;
	gap: 4px;
	justify-content: flex-end;
}

.mud-input-control {
	border: 0;
	margin: 0;
	padding: 0;
	display: flex;
	flex: 1 1 auto;
	max-width: 100%;
	position: relative;
	flex-direction: column;
	vertical-align: top;
	margin-top: 0px !important;
}

.mud-input-control-input-container {
	width: 100%;
}

.mud-input-control>.mud-input-control-input-container {
	position: relative;
	display: flex;
	flex-direction: column;
}

.mud-input.mud-input-outlined {
	background-color: #fff;
	position: relative;
	border-width: 0;
}

.mud-input {
	line-height: normal !important;
	position: relative;
	color: #424242;
	cursor: text;
	display: inline-flex;
	font-size: 1rem;
	box-sizing: border-box;
	align-items: center;
	font-weight: 400;
	line-height: 1.1876em;
	letter-spacing: .00938em;
}

.inp {
	height: 34px;
	border-radius: 5px;
	border: solid 1px #d9d9d9;
	padding-left: 22px;
	transition: border-color 0.3s ease;
}

input::placeholder {
	color: #b8b8b8;
	font-size: 10px;
}

input:focus {
	outline:1px solid #4494f1;
}


.btn4 {
	border: none;
	height: 34px;
	width: 100px;
	font-size: 14px;
	color: white;
	background-color: #82ae46;
	border-radius: 5px;
}

.information-title-2 {
	margin-top: -1px;
	width: 75px;
	font-size: 19px;
	font-weight: 500;
	color: black;
}

.component {
	align-items: flex-start;
	display: flex;
	flex-direction: column;
	gap: 20px;
	width: 100%;
}

.payment-information {
	align-items: flex-start;
	display: flex;
	flex-direction: column;
	gap: 20px;
	width: 100%;
}

.order-button-wrap {
	align-items: center;
	align-self: stretch;
	background-color: white;
	border: 1px solid;
	border-color: rgb(219, 219, 219);
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	padding: 20px;
}

.agreement-text {
	align-self: stretch;
	text-align: center;
	color: rgb(91, 91, 91);
	font-size: 12px;
	font-weight: 300;
	font-style: normal;
}

.agreement-text .normal {
	color: rgb(91, 91, 91);
	font-size: 12px;
	font-weight: 300;
	font-style: normal;
}

.agreement-text .bold {
	color: #82ae46;
	font-size: 12px;
	font-weight: 500;
	font-style: normal;
}

.btn5 {
	max-width: 400px;
	width: 400px;
	height: 54px;
	border: none;
	background-color: #dbdbdb;
	color: white;
	border-radius: 5px;
}

.btn5.active {
	background-color: #82ae46;
}

.btn6 {
	border: solid 1px #cecccc;
	background-color: white;
	width: 200px;
	height: 60px;
	border-radius: 5px;
	font-size: 14px;
	color: #717171
}

.btn6:hover {
	border: solid 1px #4494f1;
}

.btn6.clicked {
	border: solid 1px #4494f1;
}

.order-details-container {
	align-items: flex-start;
	border: 1px none;
	display: flex;
	flex-direction: column;
	gap: 20px;
	flex: 1;
	min-width: 300px;
	max-width: 400px;
}

.btn7 {
	height: 25px;
	width: 69px;
	padding: 0px;
	background-color: white;
	border-radius: 5px;
	border: solid 1px #82ae46;
	font-size: 13px;
}

.btn8 {
	height: 25px;
	width: 69px;
	padding: 0px;
	background-color: #82ae46;
	border-radius: 5px;
	border: none;
	color: white;
	font-size: 13px;
}

.order-details-wrap {
	align-items: center;
	align-self: stretch;
	background-color: white;
	border: 1px solid;
	border-color: rgb(219, 219, 219);
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	gap: 15px;
	justify-content: center;
	padding: 20px;
}

.order-details-layout {
	align-items: flex-start;
	align-self: stretch;
	border: 1px none;
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.product1 {
	align-items: center;
	align-self: stretch;
	border: 1px none;
	display: flex;
}

.product-text {
	font-size: 19px;
	font-weight: 500;
	flex: 1;
	margin-top: -1px;
	color: black;
}

.x-text {
	color: rgb(91, 91, 91);
	font-size: 12px;
	font-weight: 400;
	font-style: normal;
	width: fit-content;
}

.product-list {
	align-items: flex-start;
	align-self: stretch;
	border: 1px none;
	display: flex;
	flex-direction: column;
	gap: 15px;
	max-height: 450px;
}

.product-5 {
	align-items: flex-start;
	align-self: stretch;
	border: 1px none;
	display: flex;
	gap: 15px;
}

.product-image-box {
	align-items: flex-start;
	border: 1px solid;
	border-color: rgb(219, 219, 219);
	border-radius: 5px;
	display: flex;
	gap: 10px;
	width: 40px;
	height: 40px;
	overflow: hidden;
}

.product-image {
	object-fit: cover;
}

img {
	max-width: 100%;
}

.product-text-3 {
	align-items: flex-start;
	border: 1px none;
	display: flex;
	flex: 1;
	flex-direction: column;
	gap: 2px;
}

.product-4 {
	align-items: center;
	align-self: stretch;
	border: 1px none;
	display: flex;
}

.product-price-10 {
	align-items: center;
	border: 1px none;
	display: flex;
	gap: 10px;
	width: fit-content;
}

.price-text {
	color: black;
	font-size: 15px;
	font-weight: 500;
	font-style: normal;
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
	gap: 200px;
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
	color: rgb(139, 139, 139);
	font-size: 12px;
	font-weight: 400;
	font-style: normal;
}

.o-details-minimal-dd {
	flex: 1;
	margin-top: -1px;
	text-align: right;
	color: rgb(139, 139, 139);
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
	color: rgba(0, 0, 0, 0);
	flex: 1;
	font-size: 24px;
	font-weight: 700;
	margin-top: -1px;
	text-align: right;
}

.span0 {
	color: rgb(68, 148, 241);
	font-weight: 700;
	font-size: 16px;
	font-style: normal;
}

.span1 {
	color: black;
	font-size: 16px;
	font-weight: 500;
	font-style: normal;
}

.o-details-main-text-min {
	align-self: stretch;
	text-align: right;
	font-size: 8px;
}

.inp1 {
    width: 100%;
    border: solid 1px #dadada;
    border-radius: 5px;
	padding-left: 12px;
	height: 34px;
}

.charCount {
	text-align: right;
    font-size: 12px;
}

/*검색 버튼*/
.search-btn {
    border: none;
    width: 15%;
    max-width: 80px;
    height: 34px;
    font-size: 14px;
    color: white;
    background-color: #82ae46;
    border-radius: 5px;
}

</style>



<div class="container -min">
	<form name="orderForm" method="post">
	<div class="order">
		<div class="order-title-layout">
			<div class="order-title">주문 / 결제</div>
		</div>
		<div class="order-section">
			<div class="order-information-container">
				<div class="order-information-wrap">
					<div class="delivery-layout ">
						<div class="information-title-layout">
							<div class="information-title valign-text-middle">배송지 정보</div>
							<div class="minimal-text-btn">
								<a href="#" class="text valign-text-middle change-button"
									onclick="toggleElements();">배송지 목록</a>
								<a href="#" class="text valign-text-middle back-button"
									onclick="toggleElements();" style="display: none;">직접입력</a>
							</div>
						</div>

						<!-- 주소지 추가 -->
						<div class="x-layout two-row-scroll" style="display: none;">
							<!-- 새로운 주소지 추가 -->
							<a href="#" class="address-box1">
								<div>
									<div
										class="add-address-text valign-text-middle notosanskr-normal-stack-15px">
										+ <br> 새로운 주소 추가
									</div>
								</div>
							</a>

							<c:forEach var="vo" items="${listAddress}" varStatus="status">
								<c:choose>
									<c:when test="${vo.addDef == 1}">
										<div class="address-box addBox${vo.addNum} selected">
											<div class="address-icon-bar">
												<div class="icon">
													<div class="registered-address-box">
														<div class="registered-address-name">기본배송지</div>
													</div>
												</div>
												<div class="right-icon-layout">
													<div class="minimal-text-btn">
														<a href="#" class="text-2 valign-text-middle"> 수정 </a>
													</div>
													<span>&nbsp;&nbsp;|&nbsp;&nbsp; </span>
													<div class="minimal-text-btn">
														<a href="#" class="text-2 valign-text-middle" data-bs-toggle="modal" data-bs-target="#delAddrModal${vo.addNum}"> 삭제 </a>
													</div>
													<!-- 삭제 Modal -->
													<div class="modal fade" id="delAddrModal${vo.addNum}" tabindex="-1" aria-labelledby="delAddrModalLabel${vo.addNum}" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" style="width: 355px;">
													    <div class="modal-content">
													      <div class="modal-header" style="border-bottom: none;">
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body" style="text-align: center; padding-bottom: 0px; font-size: 17px;">
													        배송지를 삭제하시겠어요?
													      </div>
													      <div class="modal-footer" style="justify-content: center; border-top: none;">
													        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 150px; height: 62px; border-radius: 5px; background-color: white; color: gray;">아니요</button>
													        <button type="button" class="btn btn-primary" style="width: 150px; height: 62px; border-radius: 5px;" data-bs-dismiss="modal" onclick="deleteAdd(${vo.addNum});">예</button>
													      </div>
													    </div>
													  </div>
													</div>
													<!-- // 삭제 Modal -->
												</div>
											</div>
			
											<div class="address-text-wrap">
												<div class="address-text-layout-1">
													<div class="registered-address-name-1 valign-text-middle">${vo.addName}</div>
													<p class="registered-address-1 valign-text-middle">
														${vo.addr1}
													</p>
													<div class="phone-number-1 valign-text-middle">${vo.tel}</div>
													<p class="message-1 valign-text-middle">${vo.memo}</p>
												</div>
												<div class="address-check-btn">
													<button type="button" class="btn8">선택</button>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="address-box addBox${vo.addNum}">
											<div class="address-icon-bar">
												<div class="icon"></div>
												<div class="right-icon-layout">
													<div class="minimal-text-btn">
														<a href="#" class="text-2 valign-text-middle"> 수정 </a>
													</div>
													<span>&nbsp;&nbsp;|&nbsp;&nbsp; </span>
													<div class="minimal-text-btn">
														<a href="#" class="text-2 valign-text-middle" data-bs-toggle="modal" data-bs-target="#delAddrModal${vo.addNum}"> 삭제 </a>
													</div>
													<!-- 삭제 Modal -->
													<div class="modal fade" id="delAddrModal${vo.addNum}" tabindex="-1" aria-labelledby="delAddrModalLabel${vo.addNum}" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" style="width: 355px;">
													    <div class="modal-content">
													      <div class="modal-header" style="border-bottom: none;">
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body" style="text-align: center; padding-bottom: 0px; font-size: 17px;">
													        배송지를 삭제하시겠어요?
													      </div>
													      <div class="modal-footer" style="justify-content: center; border-top: none;">
													        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 150px; height: 62px; border-radius: 5px; background-color: white; color: gray;">아니요</button>
													        <button type="button" class="btn btn-primary" style="width: 150px; height: 62px; border-radius: 5px;" data-bs-dismiss="modal" onclick="deleteAdd(${vo.addNum});">예</button>
													      </div>
													    </div>
													  </div>
													</div>
													<!-- // 삭제 Modal -->
												</div>
											</div>
											<div class="address-text-wrap">
												<div class="address-text-layout-1">
													<div class="registered-address-name-1 valign-text-middle">${vo.addName}</div>
													<p class="registered-address-1 valign-text-middle">
														${vo.addr1}
													</p>
													<div class="phone-number-1 valign-text-middle">${vo.tel}</div>
													<p class="message-1 valign-text-middle">${vo.memo}</p>
												</div>
												<div class="address-check-btn">
													<button type="button" class="btn7">선택</button>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>

						<!-- 선택된 배송지 -->
						<div class="delivery-information">
							<div class="x-layout">
								<div class="list valign-text-middle">받는 사람</div>
								<div class="text-1 valign-text-middle" id="recipientValue">
									<input type="text" class="inp1" id="addName" name="orderName"
										onkeyup="checkUsernameValidity();"
										value="${not empty defAddrDto ? defAddrDto.addName : lastAddrDto.addName}">
								</div>
							</div>
							<div class="x-layout"  style="margin-bottom: -14px;">
								<div class="list valign-text-middle">받는 주소</div>
								<p class="text-1 d-flex gap-2 align-items-center" id="addressValue">
									<input type="text" class="inp1" id="addr1" name="addr1" 
										value="${not empty defAddrDto ? defAddrDto.addr1 : lastAddrDto.addr1}"
										readonly="readonly" style="background: #f5f5f5; color: #666;">
									<button type="button" class="search-btn" onclick="daumPostcode();">검색</button>
								</p>
							</div>
							<div class="x-layout"  style="margin-bottom: -14px;">
								<div class="list valign-text-middle">상세 주소</div>
								<p class="text-1 d-flex align-items-center gap-2" id="addressValue2">
									<input type="text" class="inp1" id="addr2" name="addr2" value="${not empty defAddrDto ? defAddrDto.addr2 : lastAddrDto.addr2}">
									<input type="text" class="inp1" id="zip" name="zip" value="${not empty defAddrDto ? defAddrDto.zip : lastAddrDto.zip}" 
										readonly="readonly" style="background: #f5f5f5; width: 100px; color: #666;">
								</p>
							</div>
							<div class="x-layout">
								<div class="list valign-text-middle">연락처</div>
								<div class="text-1 valign-text-middle" id="contactValue">
									<input type="text" class="inp1" id="phone" name="tel"
										onkeyup="checkPhoneNumberValidity();"
										value="${not empty defAddrDto ? defAddrDto.tel : lastAddrDto.tel}">
								</div>
							</div>
							<div class="x-layout">
								<div class="list valign-text-middle">요청사항</div>
								<div style="position: relative; width: 100%; flex: 1;">
									<input class="inp1" type="text" list="request_options" id="myInput" name="memo" maxlength="100" 
										oninput="updateCharacterCount(this); checkRequestValidity();" 
										placeholder="배송 요청 사항을 직접 입력하거나 선택해주세요."
										value="${not empty defAddrDto ? defAddrDto.memo : lastAddrDto.memo}">
									<datalist id="request_options">
									    <option value="대문 앞에 놓아주세요"></option>
									    <option value="택배함에 넣어주세요"></option>
									    <option value="경비실에 맡겨주세요"></option>
									    <option value="부재시 연락주세요"></option>
									</datalist>
									<div id="characterCount" class="charCount">0/100</div>
								</div>
							</div>
						</div>

					</div>
					<hr
						style="width: 100%; border-color: #a2a2a2; margin-bottom: 0px; margin-top: 0px; border-width: 1px;">

					<!-- 쿠폰선택 -->
					<div class="accordion accordion-flush" id="accordionFlushExample"
						style="width: 100%; --bs-accordion-active-color: #fff; --bs-accordion-active-bg: #fff; --bs-accordion-btn-focus-box-shadow: 0 0 0 0.25rem rgb(255 255 255/ 25%); --bs-accordion-border-color: fff">
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingOne">
								<button class="pl-0 pb-0 pt-0 accordion-button collapsed"
									type="button" data-bs-toggle="collapse"
									data-bs-target="#flush-collapseOne" aria-expanded="false"
									aria-controls="flush-collapseOne">
									<div class="information-title valign-text-middle">쿠폰</div>
									<div class="valign-text-middle count1">보유 쿠폰 ${memberDto.couponCount}장</div>
								</button>
							</h2>
							<div id="flush-collapseOne" class="accordion-collapse collapse"
								aria-labelledby="flush-headingOne"
								data-bs-parent="#accordionFlushExample">
								<div class="accordion-body pl-0">
									<div class="coupon-layout">
										<!-- 쿠폰 foreach -->
										<c:forEach var="vo" items="${listCoupon}" varStatus="status">
											<div class="coupon" style="cursor: pointer;">
												<div class="coupon-upper">
													<div class="coupon-text-layout">
														<div class="coupon-title valign-text-middle">${vo.couponName}</div>
														<div class="coupon-text valign-text-middle">
															<c:choose>
																<c:when test="${vo.couponCategory==0}">
																	<fmt:formatNumber value="${vo.couponPrice}" pattern="#,###" />원
																</c:when>
																<c:otherwise>
																	${vo.couponPrice}%
																</c:otherwise>
															</c:choose>
														</div>
													</div>
													<input type="radio" class="cp-radio" 
														data-min="${vo.couponMinPrice}" data-category="${vo.couponCategory}" data-cpPrice="${vo.couponPrice}"
														data-num="${vo.couponNum}">
												</div>
												<div class="coupon-lower">
													<div class="restriction">
														<p class="restriction-text valign-text-middle">
															<span>
																- 사용기간 : ~</span> <span>${vo.endDate}</span> <span>까지
															</span>
														</p>
														<p class="restriction-text valign-text-middle">
															<span>- 최소주문금액</span>&nbsp;
															<span><fmt:formatNumber value="${vo.couponMinPrice}" pattern="#,###" /></span>
															<span>원</span>
														</p>
													</div>
												</div>
											</div>
										</c:forEach>
										<!-- //쿠폰 foreach -->
										<!--<input type="hidden" name="usedCoupon" value="">-->									
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr
						style="width: 100%; border-color: #a2a2a2; margin-bottom: 0px; margin-top: 0px; border-width: 1px;">
					<div class="point-wrap">
						<div class="point-layout medium">
							<div class="information-title valign-text-middle">적립금</div>
							<div class="point">
								<div class="mud-input-control">
									<div class="mud-input-control-input-container">
										<div class="mud-input mud-input-outlined">
											<input class="inp point-inp" type="number" name="usedPoint" min="0" max="${payment}" value="0"
												onchange="changePoint();">
										</div>
										<div>
											<p style="font-size: 11px; color: gray;" class="leftPoint" data-left="${memberDto.point}">
												잔여 적립금: <fmt:formatNumber value="${memberDto.point}" pattern="#,###" />원
											</p>
										</div>
									</div>
								</div>
								<!--<input type="hidden" name="point" value="">-->
								<button type="button" class="btn4 point-btn" onclick="allUsePoint();">전액 사용</button>
							</div>
						</div>
					</div>
					<hr
						style="width: 100%; border-color: #a2a2a2; margin-bottom: 0px; margin-top: 0px; border-width: 1px;">
					<div class="x-layout1">
						<div class="information-title-2 valign-text-middle">결제수단</div>
						<div class="component">
							<div class="payment-information d-flex gap-2" style="flex-direction: row;">
								<button class="btn6" type="button" onclick="toggleButtons() ">신용카드</button>
								<!--<button class="btn6" type="button" onclick="toggleButtons() ">카카오페이</button>-->
							</div>
						</div>
					</div>
				</div>
				<!-- 아래쪽 주문하기 버튼 -->
				<div class="order-button-wrap">
					<button class="btn5 paymentPrice2" type="button" id="orderButton1" disabled data-payment="${payment}" onclick="sendOk('card');">
						<fmt:formatNumber value="${payment}" pattern="#,###" />원 주문하기
					</button>
					<p class="agreement-text valign-text-middle">
						<span> <span class="normal">주문 내용을 확인했으며 결제 및 서비스
								이용약관에 </span> <span class="bold" style="cursor: pointer;">동의</span> <span
							class="normal">합니다.</span>
						</span>
					</p>
				</div>
			</div>

			<!-- 오른쪽 바 -->
			<div class="order-details-container">
				<div class="order-button-wrap">
					<button class="btn5 paymentPrice2" type="button" id="orderButton2" disabled
						style="width: 345px;" data-payment="${payment}" onclick="sendOk();">
						<fmt:formatNumber value="${payment}" pattern="#,###" />원 주문하기
					</button>
					<p class="agreement-text valign-text-middle">
						<span> <span class="normal">주문 내용을 확인했으며 결제 및 서비스
								이용약관에 </span> <span class="bold" style="cursor: pointer;">동의</span> <span
							class="normal">합니다.</span>
						</span>
					</p>
				</div>
				<div class="order-details-wrap">
					<div class="order-details-layout">
						<div class="product1">
							<div class="product-text valign-text-middle">주문상품 : ${totalQty}개</div>
							<a href="${pageContext.request.contextPath}/cart/cart"
								class="x-text valign-text-middle"> 장바구니 수정 </a>
						</div>
						<!-- 상품1 -->
						<c:forEach var="vo" items="${listProduct}" varStatus="status">
							<hr
								style="width: 100%; border-color: #a2a2a2; margin-bottom: 0px; margin-top: 0px; border-width: 1px;">
							<div class="product-list">
								<div class="product-5">
									<div class="product-image-box">
										<div style="position: relative;">
											<img width="40" height="40" class="product-image"
												alt="product-image"
												src="${pageContext.request.contextPath}/uploads/item/${vo.mainImage}">
										</div>
									</div>
									<div class="product-text-3">
										<div class="product-4">
											<p style="margin-bottom: -5px; font-size: 11px;">${vo.madeby}
												&nbsp;&nbsp;|&nbsp;&nbsp;${vo.itemName}
												<c:if test="${not empty vo.option2Name}">
													&nbsp;(${vo.option2Name} <c:if test="${vo.option2Num!=vo.option2Num2}">/ ${vo.option2Name2}</c:if>)
												</c:if>
											</p>
											<input type="hidden" name="itemNums" value="${vo.itemNum}">
											<c:if test="${not empty vo.option2Num}">
												<input type="hidden" name="subNums" value="${vo.option2Num}">
											</c:if>
											<c:if test="${not empty vo.option2Num2 && (vo.option2Num!=vo.option2Num2)}">
												<input type="hidden" name="subNums2" value="${vo.option2Num2}">
											</c:if>
											<input type="hidden" name="qtys" value="${vo.count}">
											<input type="hidden" name="purchaseMoneys" value="${(vo.dcPrice+vo.extraPrice+vo.extraPrice2)*vo.count}">
											<input type="hidden" name="prices" value="${vo.itemPrice+vo.extraPrice+vo.extraPrice2}">
											<input type="hidden" name="salePrices" value="${vo.dcPrice+vo.extraPrice+vo.extraPrice2}">
											<input type="hidden" name="savePoints" value="${vo.itemPoint}">
										</div>
										<div class="product-price-10">
											<div class="price-text valign-text-middle">
												<fmt:formatNumber value="${vo.dcPrice+vo.extraPrice+vo.extraPrice2}" pattern="#,###" />원
											</div>
											<div class="x-text valign-text-middle">(수량 : ${vo.count})</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- //상품1 -->
						<input type="hidden" name="orderNum" value="${productOrderNumber}">
						<input type="hidden" name="totalOriPrice" value="${totalMoney}">
						<input type="hidden" name="deliveryCharge" value="${deliveryCharge}">
						<input type="hidden" name="totalPurchasePrice" value="${payment}">
						<input type="hidden" name="point" value="${memberDto.point}">
						
						<input type="hidden" name="mode" value="${mode}">
						
						<input type="hidden" name="usedCoupon" value="0">
						<input type="hidden" name="usedCouponNum" value="">
		
						<input type="hidden" name="payMethod" value="">
						<input type="hidden" name="cardName" value="">
						<input type="hidden" name="authNumber" value="">
						<input type="hidden" name="authDate" value="">
					</div>
					<hr
						style="width: 100%; color: #5c5858; border-width: 1px; margin-bottom: 0px; margin-top: 0px; border-style: solid">
					<div class="details-price-layout">
						<div class="o-details-component">
							<div class="o-details-small-dt-layout">
								<div class="o-details-small-dt valign-text-middle" style="min-width: 80px;">상품 금액</div>
								<div class="o-details-small-dd valign-text-middle" style="min-width: 80px;">
									<fmt:formatNumber value="${totalMoney}" pattern="#,###" />원
								</div>
							</div>
						</div>
						<div class="total-d">
							<div class="o-details-component">
								<div class="o-details-small-dt-layout">
									<div class="o-details-small-dt valign-text-middle">할인 금액
									</div>
								</div>
								<div class="o-details-small-dd valign-text-middle">
									- <fmt:formatNumber value="${totalDiscountPrice}" pattern="#,###" />원
								</div>
							</div>
							<div class="o-details-component">
								<div class="o-details-minimal-dt valign-text-middle">상품 할인
								</div>
								<div class="o-details-minimal-dd valign-text-middle">
									- <fmt:formatNumber value="${totalDiscountPrice}" pattern="#,###" />원
								</div>
							</div>
						</div>
						<div class="total-d">
							<div class="o-details-component">
								<div class="o-details-small-dt-layout">
									<div class="o-details-small-dt valign-text-middle">배송비</div>
								</div>
								<div class="o-details-small-dd valign-text-middle">
									+ <fmt:formatNumber value="${deliveryCharge}" pattern="#,###" />원
								</div>
							</div>
							<div class="o-details-component">
								<div class="o-details-minimal-dt valign-text-middle">배송비</div>
								<div class="o-details-minimal-dd valign-text-middle">
									<fmt:formatNumber value="${deliveryCharge}" pattern="#,###" />원
								</div>
							</div>
						</div>
						<hr
							style="width: 100%; color: #5c5858; border-width: 1px; margin-bottom: 0px; margin-top: 0px; border-style: solid">

						<div class="total-d">
							<div class="o-details-component">
								<div class="o-details-small-dt-layout">
									<div class="o-details-small-dt valign-text-middle">쿠폰 할인
									</div>
								</div>
								<div class="o-details-small-dd valign-text-middle dc-coupon" data-dcCoupon="0">- 0원</div>
							</div>
							<div class="o-details-component">
								<div class="o-details-small-dt-layout">
									<div class="o-details-small-dt valign-text-middle">적립금 사용
									</div>
								</div>
								<div class="o-details-small-dd valign-text-middle used-point" data-usedPoint="0">- 0원</div>
							</div>
						</div>
						<hr
							style="width: 100%; color: #5c5858; border-width: 1px; margin-bottom: 0px; margin-top: 0px; border-style: solid">
						<div class="o-details-component"
							style="margin-top: -6px; margin-bottom: -6px;">
							<div class="o-details-main-text-dt valign-text-middle">결제
								금액</div>
							<div class="o-details-main-dd valign-text-middle">
								<span>
									<span class="span0 paymentPrice" data-payment="${payment}">
										<fmt:formatNumber value="${payment}" pattern="#,###" />
									</span>
									<span class="span1">원</span>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
}

//이름 유효성 검사 및 이벤트 효과
function checkUsernameValidity() {
    var input = document.getElementById("addName");
    var errorDiv = document.getElementById("usernameError");
    var regex = /^[가-힣]+$/; // 정규식을 사용하여 한글 입력 패턴을 확인합니다.
    
    if (!regex.test(input.value)) { // 입력값이 한글 패턴과 일치하지 않을 경우
        input.style.borderColor = "#da1e28"; // 테두리 색상을 빨간색으로 변경합니다.
        errorDiv.textContent = "한글만 입력 가능합니다."; // 에러 메시지를 표시합니다.
    } else {
        input.style.borderColor = ""; // 유효성 검사를 통과하면 테두리 색상을 초기화합니다.
        errorDiv.textContent = ""; // 에러 메시지를 초기화합니다.
    }
}

// 폰번호 유효성 검사
function checkPhoneNumberValidity() {
    var input = document.getElementById("phone");
    var errorDiv = document.getElementById("phoneError");
    var regex = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰 번호 형식을 정규식으로 지정합니다.

    if (!regex.test(input.value)) { // 입력값이 형식에 맞지 않을 경우
        input.style.borderColor = "#da1e28"; // 테두리 색상을 빨간색으로 변경합니다.
        errorDiv.textContent = "올바른 핸드폰 번호를 입력해주세요."; // 오류 메시지를 표시합니다.
    } else { // 입력값이 형식에 맞을 경우
        input.style.borderColor = "#ced4da"; // 테두리 색상을 기본값으로 변경합니다.
        errorDiv.textContent = ""; // 오류 메시지를 초기화합니다.
    }
}

// 글자수 이벤트
function checkRequestValidity() {
    var input = document.getElementById("myInput");
    var errorDiv = document.getElementById("requestError");

    if (input.value.length > 100) { // 입력값이 최대 글자 수를 초과할 경우
        input.style.borderColor = "#da1e28"; // 테두리 색상을 빨간색으로 변경합니다.
        errorDiv.textContent = "최대 100자까지 입력 가능합니다."; // 오류 메시지를 표시합니다.
    } else { // 입력값이 최대 글자 수를 초과하지 않을 경우
        input.style.borderColor = "#ced4da"; // 테두리 색상을 기본값으로 변경합니다.
        errorDiv.textContent = ""; // 오류 메시지를 초기화합니다.
    }
}
</script>

<script>
	//선택한 배송지 삭제
	function deleteAdd(addNum) {
		$.ajax({
		      url: "${pageContext.request.contextPath}/order/deleteAdd",
		      type: "POST", 
		      data: { addNum : addNum },
		      dataType: "JSON",
		      success: function(data) {
		        console.log("삭제 성공");
		        $('.addBox' + addNum).remove();
		        //$('.modal-backdrop').removeClass("show");
		      },
		      error: function(xhr, status, error) {
		        console.error("삭제 실패");
		      }
		 });
	}
</script>

<script>
// 포인트 전액 사용
function allUsePoint() {
	let userPoint = parseInt(${memberDto.point});
	let payment = parseInt($(".payment-price").attr("data-payment"));
	
	if(userPoint > payment) {
		$("input[name=usedPoint]").val(payment);
	} else {
		$("input[name=usedPoint]").val(userPoint);
	}
	
	changePoint();
}

// 포인트 입력
function changePoint() {
	let userPoint = parseInt(${memberDto.point}); // 회원이 가지고 있는 포인트
	let pointVal = $("input[name=usedPoint]").val();
	let $point = parseInt(pointVal); // 포인트 입력값
	let $payment = parseInt($(".paymentPrice").attr("data-payment")); // 결제금액
	
	if($point > userPoint) {
		$point = userPoint;
		$("input[name=usedPoint]").val(userPoint);
	}
	if($point > $payment) {
		$point = $payment;
		$("input[name=usedPoint]").val($payment);
	}
	if(pointVal == "") {
		$point = 0;
		$("input[name=usedPoint]").val(0);
	}
	
	let left = $(".leftPoint").attr("data-left");
	let $left = parseInt(left);
	$left = left - $point;
	let leftVal = $left.toLocaleString();
	$(".leftPoint").text("잔여 적립금: " + leftVal + "원");

	let $pointVal = $point.toLocaleString();
	
	let usedPoint = $(".used-point").text("- " + $pointVal + "원");
	
	changePurchase();
}

$("body").on("click", ".coupon", function(){
	let radio = $(this).find(".cp-radio");
	let checked = radio.is(":checked");
	
	let minPrice = radio.attr("data-min");
	let $minPrice = parseInt(minPrice);
	let cpCategory = radio.attr("data-category");
	let cpPrice = radio.attr("data-cpPrice");
	let $cpPrice = 0;
	
	let payment = parseInt(${payment});
	
	if(cpCategory === "0") {
		$cpPrice = parseInt(cpPrice);
	} else {
		$cpPrice = payment * (parseInt(cpPrice) / 100);
	}
	
	let cpPriceVal = $cpPrice.toLocaleString();
	let dcCoupon = $(".dc-coupon").attr("data-dcCoupon");
	let $dcCoupon = parseInt(dcCoupon);
	
	let couponNum = radio.attr("data-num");
	
	if(checked) {
		$(".dc-coupon").text("- " + cpPriceVal +"원");
		$(".dc-coupon").attr("data-dcCoupon", $cpPrice);
		$("input[name=usedCouponNum]").val(couponNum);
		changePurchase();
	} else {
		$(".dc-coupon").text("- 0원");
		$(".dc-coupon").attr("data-dcCoupon", 0);
		$("input[name=usedCouponNum]").val("");
		changePurchase();
	}
});

function changePurchase() {
	let dcCoupon = $(".dc-coupon").attr("data-dcCoupon");
	let $dcCoupon = parseInt(dcCoupon);
	let point = $("input[name=usedPoint]").val();
	let $point = parseInt(point);
	
	let payment = $(".paymentPrice").attr("data-payment");
	let $payment = parseInt(payment);
	
	let total = $payment - $dcCoupon - $point;
	if(total < 0) {
		total = 0;
		$point = $payment - $dcCoupon;
		$("input[name=usedPoint]").val($point);
	}
	let totalVal = total.toLocaleString();
	
	$(".paymentPrice").text(totalVal);
	$(".paymentPrice2").text(totalVal + "원 주문하기");
	$("input[name=totalPurchasePrice]").val(total);
	
	$("input[name=usedCoupon]").val($dcCoupon);
}
</script>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
function sendOk(payMethod) {
	const f = document.orderForm;
	
	if(! f.orderName.value) {
		alert("받는 사람을 입력해주세요.");
		f.orderName.focus();
		return;
	} else if(!f.addr1.value || !f.zip.value) {
		alert("주소를 입력해주세요.");
		f.addr2.focus();
		return;
	} else if(!f.tel.value) {
		alert("전화번호를 입력해주세요.");
		f.tel.focus();
		return;
	}
	
	let creditCardButton = document.querySelector(".btn6");
	if (! creditCardButton.classList.contains("clicked")) {
		alert("결제방식을 선택해주세요.");
		return;
	}
	
	const IMP = window.IMP;
	IMP.init("imp38443618");
	
	// 결제 API에서 응답 받을 파라미터
	//let payMethod = "card"; // 결제유형
	var cardName = "KG이니시스";  // 카드 이름
	var authNumber = "1234567890"; // 승인번호
	let authDate = ""; // 승인 날짜
	// toISOString() : "YYYY-MM-DDTHH:mm:ss.sssZ" 형식
	authDate = new Date().toISOString().replace('T', ' ').slice(0, -5); // YYYY-MM-DD HH:mm:ss

	// 결제 API에 요청할 파라미터
	let payment = f.totalPurchasePrice.value; // 결제할 금액
	let merchant_uid = "${productOrderNumber}";  // 고유 주문번호
	let productName = "${productOrderName}";  // 주문상품명
	let buyer_email = "${memberDto.email}";  // 구매자 이메일
	let buyer_name = f.orderName.value;  // 구매자 이름
	let buyer_tel = f.orderName.tel;   // 구매자 전화번호(필수)
	let buyer_addr = f.addr1.value + " " + f.addr2.value;  // 구매자 주소
	buyer_addr = buyer_addr.trim();
	let buyer_postcode = f.zip.value; // 구매자 우편번호
	
	var msg = "";
	
	// 결제 API로 결제 진행
	IMP.request_pay({
		  pg: "html5_inicis.INIpayTest",
		  pay_method: payMethod, // 생략가
		  merchant_uid: merchant_uid, // 상점에서 생성한 고유 주문번호
		  name: productName,
		  amount: payment,
		  buyer_email: buyer_email,
		  buyer_name: buyer_name,
		  buyer_tel: buyer_tel,
		  buyer_addr: buyer_addr,
		  buyer_postcode: buyer_postcode,
		}, function (data) { // callback 로직
			if(data.success){
				msg = "결제 완료 : ";
				authNumber = data.apply_num;
				cardName = data.card_name;
				msg += cardName + "/" + authNumber;
				
				// 결제 방식, 카드번호, 승인번호, 결제 날짜
				f.payMethod.value = payMethod;
				f.cardName.value = cardName;
				f.authNumber.value = authNumber;
				f.authDate.value = authDate;
				
				f.action = "${pageContext.request.contextPath}/order/paymentOk";
				f.submit();
	        } else{
	        	msg = "결제 실패 : ";
	        	msg += data.error_msg;
	        }
			alert(msg);
	});
	
	
	// 결제가 성공한 경우 ------------------------
	//f.action = "${pageContext.request.contextPath}/order/paymentOk";
	//f.submit();
	

	
	
}
</script>

<script>	
	// 쿠폰 선택 이벤트
	const coupons = document.querySelectorAll('.coupon');

	coupons.forEach(coupon => {
	  const radio = coupon.querySelector('input[type="radio"]');
	  
	  coupon.addEventListener('click', () => {
	    radio.checked = !radio.checked;
	    
	    if (radio.checked) {
	      coupon.style.backgroundColor = '#f5fbff';
	    } else {
	      coupon.style.backgroundColor = '';
	    }
	  });
	});

	// 신용카드 버튼을 누르면 주문하기 버튼이 활성화되고 다시 버튼을 누르면 비활성화되는 스크립트
	function toggleButtons() {
    toggleOrderButton();
    toggleCreditCardButton();
  }

  function toggleOrderButton() {
    var orderButton1 = document.getElementById("orderButton1");
    var orderButton2 = document.getElementById("orderButton2");

    // 버튼 1 처리
    if (orderButton1.disabled) {
      orderButton1.disabled = false; // 버튼 활성화
      orderButton1.classList.add("active"); // 활성화된 버튼에 클래스 추가
    } else {
      orderButton1.disabled = true; // 버튼 비활성화
      orderButton1.classList.remove("active"); // 활성화된 버튼 클래스 제거
    }

    // 버튼 2 처리
    if (orderButton2.disabled) {
      orderButton2.disabled = false; // 버튼 활성화
      orderButton2.classList.add("active"); // 활성화된 버튼에 클래스 추가
    } else {
      orderButton2.disabled = true; // 버튼 비활성화
      orderButton2.classList.remove("active"); // 활성화된 버튼 클래스 제거
    }
  }

  // 신용 카드 버튼을 누르면 border 색이 변경
  function toggleCreditCardButton() {
    var creditCardButton = document.querySelector(".btn6");

    if (creditCardButton.classList.contains("clicked")) {
      creditCardButton.classList.remove("clicked"); // 버튼이 눌린 경우의 클래스 제거
    } else {
      creditCardButton.classList.add("clicked"); // 버튼이 눌린 경우의 클래스 추가
    }
  }
  
  //  배송지 선택 창과 일반 배송지 창과 토글
  function toggleElements() {
	    // delivery-information 요소 선택
	    var deliveryInfoElement = document.querySelector('.delivery-information');
	    
	    // x-layout two-row-scroll 요소 선택
	    var layoutElement = document.querySelector('.x-layout.two-row-scroll');

	    // 변경 버튼 요소 선택
	    var changeButton = document.querySelector('.change-button');
	    
	    // 돌아오기 버튼 요소 선택
	    var backButton = document.querySelector('.back-button');

	    // delivery-information 요소와 x-layout two-row-scroll 요소의 상태를 토글
	    if (deliveryInfoElement.style.display === 'none') {
	      deliveryInfoElement.style.display = 'flex';
	      layoutElement.style.display = 'none';
	      changeButton.style.display = '';
	      backButton.style.display = 'none';
	    } else {
	      deliveryInfoElement.style.display = 'none';
	      layoutElement.style.display = 'flex';
	      changeButton.style.display = 'none';
	      backButton.style.display = '';
	    }
	  }
	window.onload = function() {
	updateCharacterCount(document.getElementById("myInput"));
	  };
  // input태그 밑에 글자수 몇자 썻는지 보이는 거
  function updateCharacterCount(input) {
	    var maxLength = input.getAttribute("maxlength");
	    var currentLength = input.value.length;
	    var characterCountElement = document.getElementById("characterCount");

	    characterCountElement.textContent = currentLength + "/" + maxLength;
	  }
</script>
