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
</style>

<section class="ftco-section" style="min-height: 550px;">
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
					<td class="td-file bw-100">파일</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td class="text-truncate" style="padding: 0 10px; box-sizing: border-box; max-width: 540px">
						<a href="${pageContext.request.contextPath}/tailPath/boardArticle">저희 강아지를 소개합니다. <span class="reply-span">(1)</span></a>
					</td>
					<td>김자바</td>
					<td>2023-06-19</td>
					<td>0</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>

		<!-- 페이징 -->
		<div class="row my-5">
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
		</div>
		<!-- //페이징 -->

		<div class="col-md-12 d-flex" style="align-items: center; padding-left: 0; padding-right: 0;">
			<div class="col col-md-2 d-flex" style="align-items: center;">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/tailPath/boardList';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
			</div>
			<div class="col col-md-8 text-center">
				<form name="searchForm" class="d-flex gap-2 align-items-center justify-content-center">
					<select name="condition" class="form-select" style="width: auto !important;">
						<option value="all">제목+내용</option>
						<option value="reg_date">등록일</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="keyword" class="form-control" style="border-radius: 0.375rem; width: 200px;">
					<button type="button" class="btn btn-outline-secondary" style="display: inline-block; border-radius: 0.375rem;">검색</button>
				</form>
			</div>
			<div class="col col-md-2 text-right">
				<button type="button" class="btn btn-outline-secondary" style="display: inline-block;" onclick="location.href='${pageContext.request.contextPath}/tailPath/boardWrite';">등록하기</button>
			</div>
		</div>
		
	</div>
</section>