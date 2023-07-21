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

.my-point-container {
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
    margin-bottom: -25px;
}

.my-point-upper {
    align-items: center;
    align-self: stretch;
    background-color: rgb(248 248 248);
    display: flex;
    border-radius: 5px;
    flex-direction: column;
    gap: 10px;
    justify-content: center;
    padding: 30px 0;
}

.my-point-text-layout {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.my-point-title {
    align-self: stretch;
    color: rgb(91 91 91);
    text-align: center;
    white-space: nowrap;
    font-size: 19px;
    font-weight: 400;
}

.valign-text-middle {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.my-point-text {
    align-self: stretch;
    color: black;
    text-align: center;
    font-size: 30px;
    font-weight: 700;
}

.my-point-lower {
    align-items: flex-start;
    align-self: stretch;
    background-color: white;
    border-top: 1px solid;
    border-color: rgb(241 241 241);
    display: flex;
    flex-direction: column;
}

.my-point-tab {
   	align-items: flex-start;
    border-bottom-style: solid;
    border-bottom-width: 3px;
    display: flex;
    flex-direction: column;
    padding: 15px 16px;
    width: fit-content;
}

.my-point-tab-text {
    color: black;
    white-space: nowrap;
    width: fit-content;
    font-size: 15px;
    font-weight: 400;
}


.sel1 {
	margin-left: 737px;
    margin-top: 9px;
    height: 41px;
    width: 90px;
    border: solid 1px #c7c7c7;
    border-radius: 5px;
    color: #615858;
}

.detailed-point-wrap {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 10px;
    padding: 15px 10px;
    margin-top: -25px;
}

.detailed-point-layout {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    gap: 3px;
}

.detailed-point-wrap {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 10px;
    padding: 15px 10px;
    flex-wrap: wrap;
}

.detailed-point-layout {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex: 1;
    flex-direction: column;
    gap: 3px;
}

.point-date {
    align-self: stretch;
    white-space: nowrap;
    color: rgb(139 139 139);
    font-size: 12px;
    font-weight: 400;
}

.valign-text-middle {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.detailed-point{
    align-self: stretch;
    white-space: nowrap;
    color: black;
    font-size: 15px;
    font-weight: 400;;
}
   
.amount-layout {
    align-items: flex-end;
    border: 1px none;
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: fit-content;
}

.amount-text.plus {
    color: #82ae46;
}

.amount-text {
    white-space: nowrap;
    width: fit-content;
    font-size: 16px;
    font-weight: 400;
}

.amount-text.my-point-total {
    color: rgb(139 139 139);
    text-align: right;
}

.my-point-total {
    font-size: 12px;
}

.empty-text {
    color: rgb(91 91 91);
    width: 100%;
    text-align: center;
    padding: 200px 0;
    font-size: 15px;
    font-weight: 400;
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
	
	<div class="my-point-container ">
		<p class="title">적립금</p>
			<div class="my-point-container">
				<div class="my-point-upper">
					<div class="my-point-text-layout">
						<div class="my-point-title valign-text-middle">
							현재 적립금
						</div>
						<c:choose>
							<c:when test="${dto1.balance eq 0 or pointDataCount eq 0}">
								<p class="my-point-text valign-text-middle">0원</p>
							</c:when>
							<c:otherwise>
								<p class="my-point-text valign-text-middle">${dto1.balance}원</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="my-point-lower">
					<div class="my-point-tab"><div  class="my-point-tab-text valign-text-middle">전체 내역</div></div>
					<hr style="width: 100%; margin-bottom: 27px; margin-top:-1px;">			
					
					<c:choose>
						<c:when test="${pointDataCount eq 0}">
							<div class="detailed-point-wrap">
								<div class="detailed-point-layout">
									<p class="empty-text valign-text-middle">적립금 내역이 없어요.</p>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list}" varStatus="status">
							<div class="detailed-point-wrap">											
								<div class="detailed-point-layout">
									<div class="point-date valign-text-middle">
										${dto.pointRegDate}
									</div>
									<c:if test="${dto.pointChk eq 0}">
										<p class="detailed-point valign-text-middle">구매 확정</p>
									</c:if>
									<c:if test="${dto.pointChk eq 1}">
										<p class="detailed-point valign-text-middle">포인트 사용</p>
									</c:if>
								</div>
								<div class="amount-layout my-point-total-layout">
									<c:if test="${dto.pointChk eq 0}">
										<div class="amount-text plus valign-text-middle">
											+<fmt:formatNumber value="${dto.amount}" pattern="#,###" />원
										</div>
									</c:if>
									<c:if test="${dto.pointChk eq 1}">
										<div class="amount-text plus valign-text-middle">
											-<fmt:formatNumber value="${dto.amount}" pattern="#,###" />원
										</div>
									</c:if>
									<div class="amount-text my-point-total valign-text-middle">
										<fmt:formatNumber value="${dto.balance}" pattern="#,###" />원
									</div>
								</div>				
								<hr style="width: 100%; margin-bottom: 0px; margin-top:-21px;">
							</div>	
							</c:forEach>
						</c:otherwise>
					</c:choose>	
				</div>
			</div>
	</div>
</div>

<script>
  // DOM 요소를 선택합니다.
  var tabLinks = document.querySelectorAll('.my-point-tab');

  // 각 탭에 대한 클릭 이벤트를 설정합니다.
  tabLinks.forEach(function(tab) {
    tab.addEventListener('click', function(event) {
      event.preventDefault();

      // 모든 탭의 클래스를 제거합니다.
      tabLinks.forEach(function(link) {
        link.classList.remove('active');
      });

      // 클릭된 탭에 클래스를 추가합니다.
      this.classList.add('active');
    });
  });
</script>