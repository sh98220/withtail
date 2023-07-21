<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	a {
		color: #212529;
	}
	
	.inquiry-h3 {
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
	
	.state {
		border: 1px solid #999;
		border-radius: 50px;
		padding: 5px 10px;
	}
</style>

<script type="text/javascript">
function deleteInquiry(num) {
	if(confirm("문의를 삭제 하시겠습니까 ?")) {
		let query = "num="+num+"&${query}";
		let url = "${pageContext.request.contextPath}/inquiry/delete?"+query;
		location.href = url;
	}
}
</script>

<section class="ftco-section" style="min-height: 550px;">
	<div class="container">
		<h3 class="text-center inquiry-h3">1:1 문의</h3>
		
		<table class="table table-bordered mx-auto mb-5" style="min-width: 800px !important; max-width: 800px !important;">
			<thead style="border-bottom: 2px solid #999;">
				<tr>
					<td class="bold" style="background: #999; color: #fff; width:100px;">Q</td>
					<td>
						<span class="bp-tit">[${dto.category}]</span> ${dto.subject}
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<span class="state">${empty dto.answerDate ? "답변대기" : "답변완료"}</span>
					</td>
					<td style="text-align: right !important;">
						작성자 : ${dto.nickName}<span class="bar-span">|</span>작성일 : ${dto.regDate}
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left !important;">
						${dto.content}
					</td>
				</tr>
			</tbody>
		</table>
		<c:if test="${not empty dto.answerDate}">
			<table class="table table-bordered mx-auto" style="min-width: 800px !important; max-width: 800px !important;">
				<thead style="border-bottom: 2px solid #82ae46;">
					<tr>
						<td class="bold" style="background: #82ae46; color: #fff; width:100px; ">A</td>
						<td>
							<span class="bp-tit">[답변]</span> ${dto.subject}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td colspan="2" style="text-align: right !important;">
							담당자 : ${dto.answerName}<span class="bar-span">|</span>작성일 : ${dto.answerDate}
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: left !important;">
							${dto.answer}
						</td>
					</tr>
				</tbody>
			</table>
		</c:if>
		<div class="col-md-12 d-flex mx-auto" style="max-width: 800px; padding-left: 0; padding-right: 0;">
			<div class="col-md-6 text-start" style="padding-left: 0; padding-right: 0;">
				<button type="button" class="btn btn-outline-secondary" onclick="deleteInquiry('${dto.num}');">문의삭제</button>
			</div>
			<div class="col-md-6 text-end" style="padding-left: 0; padding-right: 0;">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/inquiry/list';">리스트</button>
			</div>
		</div>
	</div>
</section>