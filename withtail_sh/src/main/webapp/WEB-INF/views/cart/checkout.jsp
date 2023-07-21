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
	height: 38px;
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
	gap: 243px;
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
}

.charCount {
	text-align: right;
    font-size: 12px;
}

</style>



<div class="container -min">
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
									onclick="toggleElements()">변경</a> <a href="#"
									class="text valign-text-middle back-button"
									onclick="toggleElements()" style="display: none;">돌아오기</a>
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

							<!-- 기본 배송지 -->
							<div class="address-box selected">
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
											<a href="#" class="text-2 valign-text-middle"> 삭제 </a>
										</div>
									</div>
								</div>

								<div class="address-text-wrap">
									<div class="address-text-layout-1">
										<div class="registered-address-name-1 valign-text-middle">최수징</div>
										<p class="registered-address-1 valign-text-middle">경기도 고양시
											일산서구 무슨로123 무슨아프트 110동 404호 10371</p>
										<div class="phone-number-1 valign-text-middle">010-1111-1111</div>
										<p class="message-1 valign-text-middle">택배함에 넣어주세요.</p>
									</div>
									<div class="address-check-btn">
										<button type="button" class="btn8">선택</button>
									</div>
								</div>
							</div>

							<!-- 일반 배송지1 -->
							<div class="address-box">
								<div class="address-icon-bar">
									<div class="icon"></div>
									<div class="right-icon-layout">
										<div class="minimal-text-btn">
											<a href="#" class="text-2 valign-text-middle"> 수정 </a>
										</div>
										<span>&nbsp;&nbsp;|&nbsp;&nbsp; </span>
										<div class="minimal-text-btn">
											<a href="#" class="text-2 valign-text-middle"> 삭제 </a>
										</div>
									</div>
								</div>
								<div class="address-text-wrap">
									<div class="address-text-layout-1">
										<div class="registered-address-name-1 valign-text-middle">김성훈</div>
										<p class="registered-address-1 valign-text-middle">경기도 화성시
											일산서구 무슨로123 무슨아프트 110동 404호 10371</p>
										<div class="phone-number-1 valign-text-middle">010-2222-2222</div>
										<p class="message-1 valign-text-middle">택배함에 넣어주세요.</p>
									</div>
									<div class="address-check-btn">
										<button type="button" class="btn7">선택</button>
									</div>
								</div>
							</div>
						</div>

						<!-- 선택된 배송지 -->
						<div class="delivery-information">
							<div class="x-layout">
								<div class="list valign-text-middle">받는 사람</div>
								<div class="text-1 valign-text-middle" id="recipientValue">
									최수징</div>
							</div>
							<div class="x-layout"  style="margin-bottom: -14px;">
								<div class="list valign-text-middle">배송지</div>
								<p class="text-1 valign-text-middle" id="addressValue">무슨도
									무슨시 무슨무슨로 120(무슨종, 무슨아티플 2차 아파트) 111동 111호</p>
							</div>
							<div class="x-layout">
								<div class="list valign-text-middle">연락처</div>
								<div class="text-1 valign-text-middle" id="contactValue">
									010-1111-1111</div>
							</div>
							<div class="x-layout">
								<div class="list valign-text-middle">요청사항</div>
								<div style="position: relative; width: 100%; flex: 1;">
									<input class="inp1" type="text" list="request_options" id="myInput" maxlength="100" oninput="updateCharacterCount(this)" placeholder="배송 요청 사항을 직접 입력하거나 선택해주세요.">
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
									<div class="valign-text-middle count1">보유 쿠폰 2장</div>
								</button>
							</h2>
							<div id="flush-collapseOne" class="accordion-collapse collapse"
								aria-labelledby="flush-headingOne"
								data-bs-parent="#accordionFlushExample">
								<div class="accordion-body pl-0">
									<div class="coupon-layout">
										<div class="coupon" style="cursor: pointer;">
											<div class="coupon-upper">
												<div class="coupon-text-layout">
													<div class="coupon-title valign-text-middle">위드테일과
														첫만남★ 5,000원 할인 쿠폰</div>
													<div class="coupon-text valign-text-middle">5,000원</div>
												</div>
												<input type="checkbox">
											</div>
											<div class="coupon-lower">
												<div class="restriction">
													<p class="restriction-text valign-text-middle">
														<span>- 사용기간 : ~</span> <span>2023. 6. 16 오전
															8:30:57</span> <span>까지</span>
													</p>
													<p class="restriction-text valign-text-middle">
														<span>- 최소주문금액</span> <span>30,000</span><span>원</span>
													</p>
												</div>
											</div>
										</div>
										<!-- 2번쨰 쿠폰 -->
										<div class="coupon" style="cursor: pointer;">
											<div class="coupon-upper">
												<div class="coupon-text-layout">
													<div class="coupon-title valign-text-middle">위드테일과
														첫만남★ 5,000원 할인 쿠폰</div>
													<div class="coupon-text valign-text-middle">5,000원</div>
												</div>
												<input type="checkbox">
											</div>
											<div class="coupon-lower">
												<div class="restriction">
													<p class="restriction-text valign-text-middle">
														<span>- 사용기간 : ~</span> <span>2023. 6. 16 오전
															8:30:57</span> <span>까지</span>
													</p>
													<p class="restriction-text valign-text-middle">
														<span>- 최소주문금액</span> <span>30,000</span><span>원</span>
													</p>
												</div>
											</div>
										</div>
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
											<input class="inp" type="text" placeholder="0원">
										</div>
										<div>
											<p style="font-size: 11px; color: gray;">잔여 적립금: 0원</p>
										</div>
									</div>
								</div>
								<button type="button" class="btn4">전액 사용</button>
							</div>
						</div>
					</div>
					<hr
						style="width: 100%; border-color: #a2a2a2; margin-bottom: 0px; margin-top: 0px; border-width: 1px;">
					<div class="x-layout1">
						<div class="information-title-2 valign-text-middle">결제수단</div>
						<div class="component">
							<div class="payment-information">
								<button class="btn6" type="button" onclick="toggleButtons() ">신용카드</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 아래쪽 주문하기 버튼 -->
				<div class="order-button-wrap">
					<button class="btn5" type="button" id="orderButton1" disabled>48,830원
						주문하기</button>
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
					<button class="btn5" type="button" id="orderButton2" disabled
						style="width: 345px;">48,830원 주문하기</button>
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
							<div class="product-text valign-text-middle">주문상품 : 6개</div>
							<a href="${pageContext.request.contextPath}/cart/cart"
								class="x-text valign-text-middle"> 장바구니 수정 </a>
						</div>
						<!-- 상품	1 -->
						<hr
							style="width: 100%; border-color: #a2a2a2; margin-bottom: 0px; margin-top: 0px; border-width: 1px;">
						<div class="product-list">
							<div class="product-5">
								<div class="product-image-box">
									<div style="position: relative;">
										<img width="40" height="40" class="product-image"
											alt="product-image"
											src="${pageContext.request.contextPath}/resources/images/main/product_sample.png">
									</div>
								</div>
								<div class="product-text-3">
									<div class="product-4">
										<p style="margin-bottom: -5px; font-size: 11px;">KONG
											&nbsp;&nbsp;|&nbsp;&nbsp;테니스공 장난감(대)
									</div>
									<div class="product-price-10">
										<div class="price-text valign-text-middle">9,740원</div>
										<div class="x-text valign-text-middle">(수량 : 3)</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 상품2 -->
						<hr
							style="width: 100%; border-color: #a2a2a2; margin-bottom: 0px; margin-top: 0px; border-width: 1px;">
						<div class="product-list">
							<div class="product-5">
								<div class="product-image-box">
									<div style="position: relative;">
										<img width="40" height="40" class="product-image"
											alt="product-image"
											src="${pageContext.request.contextPath}/resources/images/main/product_sample.png">
									</div>
								</div>
								<div class="product-text-3">
									<div class="product-4">
										<p style="margin-bottom: -5px; font-size: 11px;">KONG
											&nbsp;&nbsp;|&nbsp;&nbsp;테니스공 장난감(대)
									</div>
									<div class="product-price-10">
										<div class="price-text valign-text-middle">9,740원</div>
										<div class="x-text valign-text-middle">(수량 : 3)</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr
						style="width: 100%; color: #5c5858; border-width: 1px; margin-bottom: 0px; margin-top: 0px; border-style: solid">
					<div class="details-price-layout">
						<div class="o-details-component">
							<div class="o-details-small-dt-layout">
								<div class="o-details-small-dt valign-text-middle">상품 금액</div>
								<div class="o-details-small-dd valign-text-middle">
									14,000원</div>
							</div>
						</div>
						<div class="total-d">
							<div class="o-details-component">
								<div class="o-details-small-dt-layout">
									<div class="o-details-small-dt valign-text-middle">할인 금액
									</div>
								</div>
								<div class="o-details-small-dd valign-text-middle">-
									4,260원</div>
							</div>
							<div class="o-details-component">
								<div class="o-details-minimal-dt valign-text-middle">상품 할인
								</div>
								<div class="o-details-minimal-dd valign-text-middle">-
									4,260원</div>
							</div>
						</div>
						<div class="total-d">
							<div class="o-details-component">
								<div class="o-details-small-dt-layout">
									<div class="o-details-small-dt valign-text-middle">배송비</div>
								</div>
								<div class="o-details-small-dd valign-text-middle">3,000원
								</div>
							</div>
							<div class="o-details-component">
								<div class="o-details-minimal-dt valign-text-middle">배송비</div>
								<div class="o-details-minimal-dd valign-text-middle">
									3,000원</div>
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
								<div class="o-details-small-dd valign-text-middle">- 0원</div>
							</div>
							<div class="o-details-component">
								<div class="o-details-small-dt-layout">
									<div class="o-details-small-dt valign-text-middle">적립금 사용
									</div>
								</div>
								<div class="o-details-small-dd valign-text-middle">- 0원</div>
							</div>
						</div>
						<hr
							style="width: 100%; color: #5c5858; border-width: 1px; margin-bottom: 0px; margin-top: 0px; border-style: solid">
						<div class="o-details-component"
							style="margin-top: -6px; margin-bottom: -6px;">
							<div class="o-details-main-text-dt valign-text-middle">결제
								금액</div>
							<div class="o-details-main-dd valign-text-middle">
								<span> <span class="span0">12,740</span> <span
									class="span1">원</span>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>	
	// 쿠폰 선택 이벤트
	const coupons = document.querySelectorAll('.coupon');

	coupons.forEach(coupon => {
	  const checkbox = coupon.querySelector('input[type="checkbox"]');
	  
	  coupon.addEventListener('click', () => {
	    checkbox.checked = !checkbox.checked;

	    if (checkbox.checked) {
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
