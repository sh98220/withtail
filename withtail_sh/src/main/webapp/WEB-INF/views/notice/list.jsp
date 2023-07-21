<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	a {
		color: #212529;
	}
	
	.notice-h3 {
		color: #555;
		font-weight: bold;
		margin-bottom: 1.5rem;
	}
	
	.table > thead {
		background-color: rgba(50,50,100,0.04);
		color: #333;
	}
	
	.table tbody tr td {
	    text-align: center !important;
	    vertical-align: middle;
	    padding: 0.75rem;
	    border: 1px solid transparent !important;
	    border-bottom: 1px solid rgba(0, 0, 0, 0.05) !important;
    }
    
    .form-control {
    	height: calc(2.25rem + 2px) !important;
	}
	
	.bw-100 {
		width: 100px;
	}
	.td-date {
		width: 150px;
	}
	
	.form-select:focus {
		outline: none;
		box-shadow: none;
		border: 1px solid #82ae46;
	}
	
	.form-control:focus {
		border: 1px solid #82ae46;
	}
	
	.btn:focus {
		border: 1px solid #82ae46 !important;
		box-shadow: none;
	}
	
	.notice-span {
		background: #82ae46;
		color: #fff;
		padding: 5px 10px;
		border-radius: 0.375rem;
		font-size: 14px;
	}
	
	/*페이징*/
.block-27 ul li a, .block-27 ul li span {
    color: #666;
    vertical-align: middle;
}

.block-27 ul li span.disabled {
	color: #999;
}
</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>


<section class="ftco-section" style="min-height: 550px;">
	<div class="container">
		<h3 class="text-center notice-h3">공지사항</h3>
		
		<table class="table">
			<thead>
				<tr>
					<td class="td-num bw-100">번호</td>
					<td class="td-subject">제목</td>
					<td class="td-name bw-100">작성자</td>
					<td class="td-date">작성일</td>
					<td class="td-result bw-100">조회수</td>
					<td class="td-file bw-100">파일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${noticeList}">
					<tr>
						<td><span class="notice-span">공지</span></td>
						<td class="text-truncate" style="padding: 0 10px; box-sizing: border-box; max-width: 540px">
							<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
						</td>
						<td>${dto.nickName}</td>
						<td>${dto.regDate}</td>
						<td>${dto.hitCount}</td>		
						<td>
							<c:if test="${dto.fileCount != 0}">
								<a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}"><i class="fa-solid fa-download"></i></a>
							</c:if>
						</td>
						
					</tr>
				</c:forEach>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td>${dataCount - (page-1) * size - status.index}</td>
						<td class="text-truncate" style="padding: 0 10px; box-sizing: border-box; max-width: 540px">
							<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
						</td>
						<td>${dto.nickName}</td>
						<td>${dto.regDate}</td>
						<td>${dto.hitCount}</td>
						<td>
							<c:if test="${dto.fileCount != 0}">
								<a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}"><i class="fa-solid fa-download"></i></a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="row my-5">
			<div class="col text-center">
				<div class="block-27 page-nav">
					${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
				</div>
			</div>
		</div>

		<!-- <div class="row my-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<li><a href="#">&lt;</a></li>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>-->

		<!-- //페이징 -->

		<div class="col-md-12 d-flex" style="align-items: center; padding-left: 0; padding-right: 0;">
			<div class="col col-md-2 d-flex" style="align-items: center;">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/notice/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
			</div>
			<div class="col col-md-8 text-center">
				<form name="searchForm" class="d-flex gap-2 align-items-center justify-content-center" action="${pageContext.request.contextPath}/notice/list" method="post">
					<select name="condition" class="form-select" style="width: auto !important;">
						<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
						<option value="reg_date" ${condition=="regDate"?"selected='selected'":""}>등록일</option>
						<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
						<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
					</select>
					<input type="text" name="keyword" value="${keyword}" class="form-control" style="border-radius: 0.375rem; width: 200px;">
					<button type="button" class="btn btn-outline-secondary" style="display: inline-block; border-radius: 0.375rem;" onclick="searchList()">검색</button>
				</form>
			</div>
			<div class="col col-md-2 text-right">
				&nbsp;
				<!--<button type="button" class="btn btn-outline-secondary" style="display: inline-block;" onclick="location.href='${pageContext.request.contextPath}/inquiry/write';">공지등록</button>-->
			</div>
		</div>
		
	</div>
	

</section>