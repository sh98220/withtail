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

.badge {
	display: inline-block; padding:2px 3px; background: #82ae46; color: #fff; font-weight: 500;
	font-size: 11px; border-radius: 3px;
}
.btn{border-radius: 10px;}

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

    <div class="out" >
    <div class="body-main" style="padding: 0 auto;">
    <div class="body-title">
		<h2><i class="fa-solid fa-circle-exclamation"></i> 공지사항 </h2>
    </div>

		<table class="table">
			<tr>
				<td align="left" width="50%">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
				<td align="right">
					&nbsp;
				</td>
			</tr>
		</table>
		
		<table class="table table-border table-list">
			<thead>
				<tr style="border-top: 1px solid #ced4da; border-bottom: solid 1px #ced4da; ">
					<th class="wx-60">번호</th>
					<th >제목</th>
					<th class="wx-100">작성자</th>
					<th class="wx-100">작성일</th>
					<th class="wx-70">조회수</th>
					<th class="wx-50">첨부</th>
					<th class="wx-50">표시</th>
				</tr>
			</thead>
		 
		 	<tbody>
		 		<c:forEach var="dto" items="${noticeList}">
					<tr style="height: 56px;" class="pointhover"> 
						<td><span class="badge">공지</span></td>
						<td >
							<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
						</td>
						<td>${dto.userName}</td>
						<td>${dto.regDate}</td>
						<td>${dto.hitCount}</td>
						<td>
							<c:if test="${dto.fileCount != 0}">
								<a href="${pageContext.request.contextPath}/admin/noticeManage/zipdownload?num=${dto.num}"><i class="fa-solid fa-download"></i></a>
							</c:if>
						</td>
						<td>&nbsp;</td>
					</tr>
				</c:forEach>
				
				<!--일반게시물  -->
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr style="height: 56px;" class="pointhover"> 
						<td>${dataCount - (page-1) * size - status.index}</td>
						<td>
							<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
							<c:if test="${dto.gap < 1}">
								<span style="color:#82ae46; font-size: 12px; font-weight:900; ">new</span>
							</c:if>
						</td>
						<td>${dto.userName}</td>
						<td>${dto.regDate}</td>
						<td>${dto.hitCount}</td>
						<td>
							<c:if test="${dto.fileCount != 0}">
								<a href="${pageContext.request.contextPath}/admin/noticeManage/zipdownload?num=${dto.num}"><i class="fa-solid fa-download"></i></a>
							</c:if>		      
						</td>
						<td>${dto.enabled == 1 ? "표시" : "숨김" }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		 
		<div class="page-navigation">
			${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
		</div>
		
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button  style="height: 35px;" type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/admin/noticeManage/list" method="post">
						<select  style="height: 35px;" name="condition" class="form-select">
							<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
							<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
							<option value="regDate" ${condition=="regDate"?"selected='selected'":""}>등록일</option>
							<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
						</select>
						<input  style="height: 35px;" type="text" name="keyword" value="${keyword}" class="form-control">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<button  style="height: 35px;" type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/write';">글올리기</button>
				</td>
			</tr>
		</table>

	</div>
</div>