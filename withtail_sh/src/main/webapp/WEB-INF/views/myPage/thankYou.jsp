<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.rw-completed-container {
    align-items: center;
    background-color: white;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 35px;
    padding: 60px 0px;
    width: 100%;
}

.-min {
	min-height: 550px;
}

.rw-completed-text-layout {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.rw-completed-title {
    align-self: stretch;
    color: black;
    font-size: 24px;
    font-weight: 400;
    margin-top: -1px;
    text-align: center;
}

.rw-completed-sub-layout {
    align-items: center;
    border: 1px none;
    display: flex;
    gap: 5px;
    justify-content: center;
    width: fit-content;
}

.icon1 {
    height: 20px;
    min-width: 20px;
}

.rw-completed-sub-text {
    color: rgb(68 148 241);
    font-size: 19px;
    font-weight: 400;
    margin-top: -1px;
    text-align: center;
    width: fit-content;
}

.rw-completed-info {
    align-items: center;
    background-color: white;
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-color: rgb(219 219 219);
    border-top-style: solid;
    border-top-width: 1px;
    display: flex;
    gap: 20px;
    padding: 20px 16px;
    width: 400px;
}

.rw-completed-image-layout {
    align-items: flex-start;
    background-color: white;
    border: 1px solid;
    border-color: rgb(219 219 219);
    border-radius: 5px;
    display: flex;
    height: 60px;
    width: 60px;
    overflow: hidden;
}

.rw-completed-image {
    align-self: stretch;
    flex: 1;
    height: 60px;
    min-width: 60px;
    object-fit: cover;
}

img {
	max-width: 100%;
}

.rw-completed-pdname {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    gap: 3px;
    justify-content: center;
}

.rw-completed-pdtext {
    align-self: stretch;
    color: rgb(139 139 139);
    font-size: 12px;
    font-weight: 400;
    margin-top: -1px;
}

.valign-text-middle {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.rw-completed-pdtext-1 {
    align-self: stretch;
    color: black;
    font-size: 15px;
    font-weight: 400;
}

.btn60 {
	width: 180px;
    height: 70px;
    border-radius: 5px;
    border: none;
    background-color: #82ae46;
    color: white;
    font-size: 18px;
}

.btn61 {
	width: 180px;
    height: 70px;
    border-radius: 5px;
    border: 1px solid #82ae46;
    background-color: white;
    color: #82ae46;
    font-size: 18px;
}

</style>

<div class="container -min">
	<div class="rw-completed-container">
		<div class="rw-completed-container">
			<h1 class="rw-completed-title">
				소중한 후기 감사드려요~!
			</h1>
			<div class="rw-completed-sub-layout">
				<img class="icon1" alt="" src="${pageContext.request.contextPath}/resources/images/icon/check-circle.png">
				<div class="rw-completed-sub-text">
					후기 작성이 완료되었어요.
				</div>
			</div>
		</div>
		<div class="rw-completed-info">
			<div class="rw-completed-image-layout">
				<img class="rw-completed-image" alt="" src="${pageContext.request.contextPath}/uploads/item/${dto.mainImage}">
			</div>
			<div class="rw-completed-pdname">
				<div class="rw-completed-pdtext valign-text-middle">${dto.madeBy}</div>
				<p class="rw-completed-pdtext-1 valign-text-middle">
					${dto.itemName}
					<c:if test="${not empty dto.option2Name2}">(${dto.option2Name}/${dto.option2Name2})</c:if>
				   	<c:if test="${empty dto.option2Name2 and not empty dto.option2Name}">(${dto.option2Name})</c:if>
				</p>			
			</div>
		</div>
		<div>
			<button type="button" class="btn60" onclick="location.href='${pageContext.request.contextPath}/shop/info/${dto.itemNum}'">후기 보러 가기</button>
			<button type="button" class="btn61" onclick="location.href='${pageContext.request.contextPath}/'">쇼핑하러 가기</button>
		</div>
	</div>
</div>