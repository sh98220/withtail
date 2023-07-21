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

.delivery-container {
    padding: 30px 0;
    align-items: flex-start;
    background-color: white;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 100%;
}

.title {
    color: black;
    text-align: center;
    width: fit-content;
    font-size: 24px;
    font-weight: 700;
}

.delivery-layout {
    align-items: flex-start;
    align-self: stretch;
    display: flex;
    flex-direction: column;
    gap: 25px;
}

.delivery-layout.dialog {
    margin: 0 !important;
}

input {
	width: 100%;
}

.charCount {
	text-align: right;
    font-size: 12px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: flex-end;
}

.btn-light {
    color: #ffffff;
    background-color: #82ae46;
}

.btn-1 {
	width: 150px;
    height: 48px;
    border-radius: 5px;
    border: none;
    color: white;
    background-color: #82ae46;
}

.btn-1:hover {
	background-color: #506632;
}

.btn-2 {
	width: 150px;
    height: 48px;
    border-radius: 5px;
    border: solid 1px #82ae46;
    color: #82ae46;
    background-color: white;
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

.hide-content {
    display: none;
  }
  
</style>

<script>
function deleteAdd(num) {

	    let query = "num="+num;
	    console.log(query);
	    let url = "${pageContext.request.contextPath}/myPage/deleteAdd?" + query;
    	location.href = url;
   
}
</script>


<div class="container -min">
	<div class="submenu-layout">
	  <ul>
	    <li><a class="submenu active" href="${pageContext.request.contextPath}/myPage/myPage">내 계정</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/orders">주문조회</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/favorite">즐겨찾기</a></li>
	  </ul>
	</div>
	<div class="delivery-container">
		<div class="title">
			자주 쓰는 배송지
		</div>	
		<div class="delivery-layout dialog">
			<div class="x-layout two-row-scroll">
				<!-- 새로운 주소지 추가 -->
				<a href="${pageContext.request.contextPath}/myPage/writeDelivery" class="address-box1">
					<div>
						<div class="add-address-text valign-text-middle notosanskr-normal-stack-15px">
							+ <br> 새로운 주소 추가
						</div>
					</div>
				</a>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<!-- 기본 배송지 -->
					<c:choose>
						<c:when test="${dto.addDef == 1}">
							<div class="address-box selected">
								<div class="address-icon-bar">
									<div class="icon">
										<div class="registered-address-box">
											<div class="registered-address-name">기본배송지</div>
										</div>
									</div>
									<div class="right-icon-layout">
										<div class="minimal-text-btn">
											<a href="${pageContext.request.contextPath}/myPage/update?num=${dto.addNum}" class="text-2 valign-text-middle"> 수정 </a>
										</div>
										<span>&nbsp;&nbsp;|&nbsp;&nbsp; </span>
										<div class="minimal-text-btn">
											<a class="text-2 valign-text-middle" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#">
											  삭제
											</a>
										</div>
										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered" style="width: 355px;">
										    <div class="modal-content">
										      <div class="modal-header" style="border-bottom: none;">
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body" style="text-align: center; padding-bottom: 0px; font-size: 17px;">
										        "${dto.addName}"배송지를 삭제하시겠어요?
										      </div>
										      <div class="modal-footer" style="justify-content: center; border-top: none;">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 150px; height: 62px; border-radius: 5px; background-color: white; color: gray;">아니요</button>
										        <button type="button" class="btn btn-primary" style="width: 150px; height: 62px; border-radius: 5px;" onclick="deleteAdd(${dto.addNum});">예</button>
										      </div>
										    </div>
										  </div>
										</div>
									</div>
								</div>
				
								<div class="address-text-wrap">
									<div class="address-text-layout-1">
										<div class="registered-address-name-1 valign-text-middle">${dto.addName}</div>
										<p class="registered-address-1 valign-text-middle">
											${dto.addr1} ${dto.addr2} ${dto.zip}</p>
										<div class="phone-number-1 valign-text-middle">${dto.tel}</div>
										<p class="message-1 valign-text-middle">${dto.memo}</p>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 일반 배송지1 -->
							<div class="address-box">
								<div class="address-icon-bar">
									<div class="icon"></div>
									<div class="right-icon-layout">
										<div class="minimal-text-btn">
											<a href="${pageContext.request.contextPath}/myPage/update?num=${dto.addNum}" class="text-2 valign-text-middle"> 수정 </a>
										</div>
										<span>&nbsp;&nbsp;|&nbsp;&nbsp; </span>
										<div class="minimal-text-btn">
											<a class="text-2 valign-text-middle" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#">
											  삭제
											</a>
										</div>
										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered" style="width: 355px;">
										    <div class="modal-content">
										      <div class="modal-header" style="border-bottom: none;">
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body" style="text-align: center; padding-bottom: 0px; font-size: 17px;">
										        "${dto.addName}"배송지를 삭제하시겠어요?
										      </div>
										      <div class="modal-footer" style="justify-content: center; border-top: none;">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 150px; height: 62px; border-radius: 5px; background-color: white; color: gray;">아니요</button>
										        <button type="button" class="btn btn-primary" style="width: 150px; height: 62px; border-radius: 5px;" onclick="deleteAdd(${dto.addNum});">예</button>
										      </div>
										    </div>
										  </div>
										</div>
									</div>
								</div>
								<div class="address-text-wrap">
									<div class="address-text-layout-1">
										<div class="registered-address-name-1 valign-text-middle">${dto.addName}</div>
										<p class="registered-address-1 valign-text-middle">${dto.addr1} ${dto.addr2} ${dto.zip}</p>
										<div class="phone-number-1 valign-text-middle">${dto.tel}</div>
										<p class="message-1 valign-text-middle">${dto.memo}</p>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
