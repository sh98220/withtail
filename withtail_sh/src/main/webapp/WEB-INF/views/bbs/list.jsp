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
	
	.reply-span {
		color: #999;
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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<c:url var="listUrl" value="/bbs/list">
	<c:if test="${not empty keyword}">
		<c:param name="condition" value="${condition}"/>
		<c:param name="keyword" value="${keyword}"/>
	</c:if>
</c:url>

<script type="text/javascript">
window.addEventListener("load", function(){
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = "${listUrl}"; 
	
	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);
	
	document.querySelector(".dataCount").innerHTML = dataCount+"개 ("
			+page+"/"+total_page+"페이지)";

	document.querySelector(".page-navigation").innerHTML = 
		dataCount === 0 ? "등록된 게시물이 없습니다." : paging;
});
</script>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<section class="ftco-section" style="min-height: 625px;">
	<div class="container">
		<h3 class="text-center notice-h3">커뮤니티</h3>
		
		<table class="table">
			<thead>
				<tr>
					<td class="td-num bw-100">번호</td>
					<td class="td-subject">제목</td>
					<td class="td-name bw-100">작성자</td>
					<td class="td-date">작성일</td>
					<td class="td-result bw-100">조회수</td>
					<td class="td-file bw-100"></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td>${dataCount - (page-1) * size - status.index}</td>
						<td class="text-truncate" style="padding: 0 10px; box-sizing: border-box; max-width: 540px">
							<c:url var="url" value="/bbs/article">
								<c:param name="num" value="${dto.num}"/>
								<c:param name="page" value="${page}"/>
								<c:if test="${not empty keyword}">
									<c:param name="condition" value="${condition}"/>
									<c:param name="keyword" value="${keyword}"/>
								</c:if>									
							</c:url>
							<a href="${url}">${dto.subject}<span class="reply-span"><c:if test="${dto.replyCount!=0}">(${dto.replyCount})</c:if></span></a>
						</td>
						<td>${dto.nickname}</td>
						<td>${dto.regDate}</td>
						<td>${dto.hitCount}</td>
						<td>&nbsp;</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="row my-5">
		    <div class="col text-center">
		        <div class="block-27 page-nav">
		           ${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
		  		</div>
			</div>
		</div>
		<div class="col-md-12 d-flex my-3" style="align-items: center; padding-left: 0; padding-right: 0;">
			<div class="col col-md-2 d-flex" style="align-items: center;">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/bbs/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
			</div>
			<div class="col col-md-8 text-center">
				<form name="searchForm" class="d-flex gap-2 align-items-center justify-content-center">
					<select name="condition" class="form-select" style="width: auto !important;">
						<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
						<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
						<option value="reg_date" ${condition=="reg_date"?"selected='selected'":""}>등록일</option>
						<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
						<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
					</select>
					<input type="text" name="keyword" value="${keyword}" class="form-control" style="border-radius: 0.375rem; width: 200px;">
					<button type="button" class="btn btn-outline-secondary" onclick="searchList()" style="display: inline-block; border-radius: 0.375rem;">검색</button>
				</form>
			</div>
			<div class="col col-md-2 text-right">
				<button type="button" class="btn btn-outline-secondary" style="display: inline-block;" onclick="location.href='${pageContext.request.contextPath}/bbs/write';">등록하기</button>
			</div>
		</div>
		
	</div>
</section>