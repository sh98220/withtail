<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style type="text/css">
.out{
 display: flex; align-items: center;  flex-direction: row; justify-content: center;
}

.body-main {
	width: 960px;
}
.btn{
	border-radius: 0.375rem;
	height: 37px;
}
.btn:hover{background: #6C757D; color: white}


.pointhover:hover{
  background-color: #82ae4654;
</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>
<div class="out">
<div class="body-container">
    
<div class="body-main">
    <div class="body-title">
		<h2><i class="fa-solid fa-person-circle-question"></i> 1:1 문의 </h2>
    </div>

		<table class="table">
			<tr>
				<td align="left" width="50%">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
				<td align="right">&nbsp;</td>
			</tr>
		</table>
		
		<table class="table table-border table-list">
			<thead>
				<tr style="border-top: 1px solid #ced4da; border-bottom: solid 1px #ced4da; ">
					<th width="10%">분류</th>
					<th width="60%">제목</th>
					<th width="10%">작성자</th>
					<th width="10%">문의일자</th>
					<th width="10%">처리결과</th>

				</tr>
			</thead>
			
		 	<tbody>
				<c:forEach var="dto" items="${list}">
					<tr style="height: 56px;" class="pointhover"> 
						<td>${dto.category}</td>
						<td>
							<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
						</td>
						<td>${dto.userName}</td>
						<td>${dto.regDate}</td>
						<td>${(empty dto.answerDate)?"답변대기":"답변완료"}</td>
					</tr>
				</c:forEach>
		  	</tbody>
		  	
		</table>
		 
		<div class="page-navigation">
			${dataCount == 0 ? "등록된 문의가 없습니다." : paging}
		</div>
		
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button  style="height: 35px;" type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/inquiryManage/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/admin/inquiryManage/list" method="post">
						<select  style="height: 35px;" name="condition" class="form-select">
							<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
							<option value="userId" ${condition=="userId"?"selected='selected'":""}>아이디</option>
							<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
							<option value="reg_date" ${condition=="reg_date"?"selected='selected'":""}>등록일</option>
							<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
						</select>
						<input  style="height: 35px;" type="text" name="keyword" value="${keyword}" class="form-control">
						<button  style="height: 35px;" type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					&nbsp;
				</td>
			</tr>
		</table>

	</div>
</div>
</div>
