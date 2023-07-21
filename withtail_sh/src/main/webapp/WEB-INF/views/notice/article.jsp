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
	
	.bold {
		font-weight: bold;
	}
	
	.bp-tit {
		font-weight: 600;
	}
	
	.table-bordered thead th, .table-bordered thead td {
    	border-bottom: none;
	}
	
	.table tbody tr td {
    	padding: 10px;
	}
	
	.bar-span {
		color: #999;
		display: inline-block;
		margin-left: 5px;
		margin-right: 5px;
	}
	
</style>

<section class="ftco-section" style="min-height: 550px;">
	<div class="container">
		<h3 class="text-center notice-h3">공지사항</h3>
		
		<table class="table table-bordered mx-auto" style="min-width: 800px !important; max-width: 800px !important;">
			<tbody style="border-top: 2px solid #999;">
				<tr>
					<td colspan="2" style="border-bottom: 1px solid #999 !important;">
						${dto.subject}
					</td>
				</tr>
				<tr>
					<td style="text-align: left !important;">
						작성자 : ${dto.nickName}
					</td>
					<td style="text-align: right !important;">
						작성일 : ${dto.regDate}<span class="bar-span">|</span>조회 : ${dto.hitCount}
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important; vertical-align: top;" height="200">
						${dto.content}
					</td>
				</tr>
				
				<c:forEach var="vo" items="${listFile}">
						<tr>
							<td colspan="2" style="text-align: left !important;">
								파&nbsp;&nbsp;일 :
								<a href="${pageContext.request.contextPath}/notice/download?fileNum=${vo.fileNum}">${vo.originalName}</a>
								(<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> kb)
							</td>
						</tr>
				</c:forEach>
				<tr>
					<td colspan="2" style="text-align: left !important;">
								이전글 :
								<c:if test="${not empty preReadDto}">
									<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
								</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important;">
							다음글 :
							<c:if test="${not empty nextReadDto}">
								<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
							</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="col-md-12 d-flex mx-auto" style="max-width: 800px; padding-left: 0; padding-right: 0;">
			<div class="col-md-6 text-start" style="padding-left: 0; padding-right: 0;">
				<!--<button type="button" class="btn btn-outline-secondary">삭제</button>-->
			</div>
			<div class="col-md-6 text-end" style="padding-left: 0; padding-right: 0;">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/notice/list';">리스트</button>
			</div>
		</div>
	</div>
</section>