<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	 <div id="infomodal" class="modal-overlay" style="margin-top: 20px;">
        	<div class="title">
                <h2>회원 상세</h2>
            </div>
           <table class="table table-border border-top2 table-form">
					<tr> 
						<td>아이디</td>
						<td> 
							${dto.userId }
			            </td>
					</tr>
					<tr> 
						<td>이메일</td>
						<td> 
							${dto.email }
			            </td>
					</tr>
					<tr> 
						<td>이름</td>
						<td> 
							${dto.userName }
			            </td>
					</tr>
					<tr> 
						<td>닉네임</td>
						<td> 
							${dto.nickName }
			            </td>
					</tr>
					<tr> 
						<td>가입 날짜</td>
						<td> 
							${dto.regDate }
			            </td>
					</tr>
					<tr> 
						<td>적립금</td>
						<td> 
							 <fmt:formatNumber value="${dto.point }" pattern="#,##0원" />
			            </td>
					</tr>
			</table>
			
			<div style="margin-top: 30px;">
            <div class="title">
                <h4>회원 상태 변경</h4>
            </div>
          <table class="table table-border table-list" style="margin-top: 10px;">
	  		<thead>
				<tr>
					<th width="40%">사유</th>
					<th width="40%">메모</th>
					<th width="20%">변경 날짜</th>
				</tr>
			</thead>
			
		 	<tbody>
			<c:if test="${empty list }"><tr><td colspan="3">내역이 없습니다.</td></tr></c:if>
		 		<c:forEach var="state" items="${list }">
					<tr>
						<td>
							<c:if test="${state.stateCode == 0 }">정지 해제</c:if>
							<c:if test="${state.stateCode == 1 }">패스워드 5회이상 실패</c:if>
							<c:if test="${state.stateCode == 2 }">불법적인 방법으로 로그인</c:if>
							<c:if test="${state.stateCode == 3 }">불건전 게시물 등록</c:if>
							<c:if test="${state.stateCode == 4 }">다른 유저 비방</c:if>
							<c:if test="${state.stateCode == 5 }">타계정 도용</c:if>
							<c:if test="${state.stateCode == 6 }">기타 약관 위반</c:if>
							<c:if test="${state.stateCode == 7 }">1년 이상 로그인하지 않음</c:if>
							<c:if test="${state.stateCode == 8 }">회원탈퇴</c:if>
						</td>
						<td>${state.memo }</td>
						<td>${state.stRegDate }</td>
					</tr>
				</c:forEach>
		  	</tbody>
		  	</table>
		  	</div>
		  	
		  	
            <div style="margin-top: 30px;">
            <div class="title" style="margin-top:30px;">
                <h4>포인트 사용 내역</h4>
            </div>
          <table class="table table-border table-list" style="margin-top: 10px;">
	  		<thead>
				<tr>
					<th class="wx-80">상태</th>
					<th class="wx-80">금액</th>
					<th class="wx-80">잔액</th>
					<th class="wx-80">사용 날짜</th>
				</tr>
			</thead>
			
		 	<tbody>
	  				<c:if test="${empty pointList }"><tr><td colspan="4">포인트 사용 내역이 없습니다.</td></tr></c:if>
				<c:forEach var="point" items="${pointList }">
					<tr>
						<td class="wx-80">${point.pointChk==0? '적립':'사용' }</td>
						<td class="wx-80"><fmt:formatNumber value="${point.amount }" pattern="#,##0원" /></td>
						<td class="wx-80"><fmt:formatNumber value="${point.balance }" pattern="#,##0원" /></td>
						<td class="wx-80">${point.pointRegDate }</td>
					</tr>
				</c:forEach>
		  	</tbody>
		  	</table>
		  	</div>
        </div>
