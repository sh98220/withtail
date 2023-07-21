<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.-min {
	min-height: 550px;
}

.order-completed-1 {
    align-items: center;
    background-color: white;
    display: flex;
    flex-direction: column;
    gap: 35px;
    height: 538px;
    justify-content: center;
    padding: 60px 0px;
    width: 100%;
}

.order-completed-contents {
    align-items: center;
    align-self: stretch;
    display: flex;
    flex-direction: column;
    gap: 30px;
}

.character-image {
    height: 64px;
    min-width: 70px;
    object-fit: cover;
}

img {
    max-width: 100%;
}

.complete-text-layout {
    align-items: center;
    align-self: stretch;
    display: flex;
    flex-direction: column;
    gap: 25px;
}

.main-text-layout {
    align-items: center;
    display: flex;
    flex-direction: column;
    gap: 5px;
    justify-content: center;
}

.main-text {
    color: rgb(68 148 241);
    font-size: 24px;
    font-weight: 400;
    margin-top: -1px;
    min-width: 316px;
    text-align: center;
}


.order-number-layout {
    align-items: center;
    border: 1px solid rgb(219 219 219);
    display: flex;
    gap: 12px;
    justify-content: center;
    padding: 12px 5px;
    width: 400px;
}

.order-number-text {
    align-items: flex-start;
    display: flex;
    gap: 4px;
}

.order-number {
    color: rgb(139 139 139);
    font-size: 19px;
    font-weight: 500;
    margin-top: -1px;
    min-width: 66px;
    text-align: center;
}

.order-number-1 {
    color: black;
    font-size: 19px;
    font-weight: 500;
    font-style: normal;
}

.sub-text-1 {
    margin-top: -1px;
    min-width: 69px;
    text-align: right;
    color: black;
    font-size: 19px;
    font-weight: 500;
    font-style: normal;
}

.frame-342 {
    align-items: flex-start;
    display: flex;
    flex-direction: column;
    gap: 10px;
    padding: 0px 5px;
    width: 400px;
}

.frame-3 {
    align-items: flex-start;
    align-self: stretch;
    display: flex;
}

.sub-text {
    color: rgb(139 139 139);
    font-size: 15px;
    font-weight: 400;
    font-style: normal;
    flex: 1;
    margin-top: -1px;
}

 .sub-text-2 {
    margin-top: -1px;
    min-width: 85px;
    text-align: right;
    color: black;
    font-size: 15px;
    font-weight: 400;
    font-style: normal;
}

.frame-3 {
    align-items: flex-start;
    align-self: stretch;
    display: flex;
}

.sub-text-3 {
    color: rgba(0,0,0,0);
    font-size: 19px;
    font-weight: 500;
    margin-top: -1px;
    min-width: 67px;
    text-align: right;
}

.span0 {
    color: rgb(68 148 241);
    font-weight: 500;
}

.span1 {
    color: black;
    font-size: 15px;
    font-weight: 400;
    font-style: normal;
}

.btn45 {
    width: 200px;
    height: 55px;
    border-radius: 5px;
    border: none;
    color: white;
    background-color: #8BC34A;
}

.btn46 {
    width: 200px;
    height: 55px;
    border-radius: 5px;
    border: 1px solid #8BC34A;
    color: #8BC34A;
    background-color: white;
}

</style>

<div class="container -min">
	<div class="order-completed-1">
		<div class="order-completed-contents">
			<img class="character-image" alt="" src="${pageContext.request.contextPath}/resources/images/icon/character-image-1.png">
			<div class="complete-text-layout">
				<div class="main-text-layout">
					<h1 class="main-text">${msg}</h1>
				</div>
				<div class="order-number-layout">
					<div class="order-number-text">
						<div class="order-number">
							주문번호
						</div>
						<div class="order-number-1">
						 	#${orderNum}
						</div>
					</div>
					<div class="sub-text-1">
						${state}
					</div>
				</div>
				<div class="frame-342">
					<div class="frame-3">
						<div class="sub-text">
							결제수단
						</div>
						<div class="sub-text-2">
						 	${payMethod}
						</div>
					</div>
					<div class="frame-3">
						<div class="sub-text">
							결제금액
						</div>
						<div class="sub-text-3">
							<span class="span0">${payment}</span>
							<span class="span1">원</span>
						</div>
					</div>
				</div>
			</div>
			<div>
				<button type="button" class="btn45" onclick='location.href="${pageContext.request.contextPath}/myPage/orderDetail?orderNum=${orderNum}"'>주문 상세내역 바로가기</button>
				<button type="button" class="btn46" onclick='location.href="${pageContext.request.contextPath}/"'>쇼핑하러 가기</button>
			</div>
		</div>
	</div>
</div>