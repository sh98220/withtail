<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">
.out{
 display: flex; align-items: center;  flex-direction: row; justify-content: center;
}

.body-main {
	width: 960px;
}
.btn {
    color: #333;
    border: 1px solid #999;
    background-color: #fff;
    padding: 4px;
    border-radius: 30px;
    font-weight: 500;
    font-size: 12px;
    cursor: pointer;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
    vertical-align: baseline;
}

ul.tabs li.active {
    font-weight: 700;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
    background: #82ae46;
}


ul.tabs li {
    font-weight: 700;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
    background: #f2f2f2;
}

</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}

$(function(){
	$('#tab-${category}').addClass('active');

	$('ul.tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		location.href = '${pageContext.request.contextPath}/admin/eventManage/'+category+'/list';
	});
});
</script>

<div class="out">
    
    <div class="body-main">
    <div class="body-title">
		<h2><i class="fa-regular fa-calendar"></i> 이벤트 </h2>
    </div>
    
		<div>
			<ul class="tabs">
				<li id="tab-all" data-category="all">전체 이벤트</li>
				<li id="tab-progress" data-category="progress">진행중인 이벤트</li>
				<li id="tab-winner" data-category="winner">당첨자 발표</li>
				<li id="tab-ended" data-category="ended">종료된 이벤트</li>
				<li id="tab-upcoming" data-category="upcoming">진행 예정인 이벤트</li>
			</ul>
		</div>
		<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
			<table class="table">
				<tr>
					<td style="text-align: right;margin-top: 15px;">
						${dataCount}개(${page}/${total_page} 페이지)
					</td>
					<td align="right">
						&nbsp;
					</td>
				</tr>
			</table>
			
			<table class="table table-border table-list">
				<thead>
					<tr style="border-bottom: 1px solid #ced4da; border-top: 1px solid #ced4da; color: #333;">
						<th class="wx-60">번호</th>
						<th>제목</th>
						<th class="wx-150">이벤트 시작일</th>
						<th class="wx-150">이벤트 종료일</th>
						<th class="wx-150">작성일</th>
						<th class="wx-100">${category=="winner" ? "발표" : "응모자수"}</th>
					</tr>
				</thead>
			 
			 	<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr> 
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td class="left">
								<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
							</td>
							<td>${dto.startDate}</td>
							<td>${dto.endDate}</td>
							<td>${dto.regDate}</td>
							<td>${category=="winner" ? (dto.maxCount==0?"예정":"완료") : (dto.maxCount == 0 ? "-" : dto.applyCount) }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			 
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
			</div>
			
			<table class="table">
				<tr>
					<td align="left" width="100">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
					</td>
					<td align="center">
						<form name="searchForm" action="${pageContext.request.contextPath}/admin/eventManage/${category}/list" method="post">
							<select name="condition" class="form-select">
								<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
								<option value="startDate" ${condition=="startDate"?"selected='selected'":""}>시작일</option>
								<option value="endDate" ${condition=="endDate"?"selected='selected'":""}>종료일</option>
								<option value="winningDate" ${condition=="winningDate"?"selected='selected'":""}>발표일</option>
							</select>
							<input type="text" name="keyword" value="${keyword}" class="form-control">
							<button type="button" class="btn" onclick="searchList()">검색</button>
						</form>
					</td>
					<td align="right" width="100">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/write';">이벤트등록</button>
					</td>
				</tr>
			</table>
		</div>    
	</div>
</div>
