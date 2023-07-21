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
	
	.table {
		border-top: 2px solid #333;
	}
	
	.table tbody tr td {
	    padding: 10px 10px;
	    border-bottom: 1px solid rgba(0, 0, 0, 0.05) !important;
	}
	
	.td-tit {
		background: #eee !important;
	}
	
	.form-control {
		border-radius: 0.375rem;
		height: auto !important;
	}
	
	.btn {
		border-radius: 0.375rem;
	}
</style>

<script type="text/javascript">
function sendOk() {
    const f = document.inquiryForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/inquiry/write";
    f.submit();
}
</script>

<section class="ftco-section" style="min-height: 550px;">
	<div class="container">
			<h3 class="text-center inquiry-h3">1:1 문의</h3>
			
			<form name="inquiryForm" method="post">
				<table class="table table-bordered mx-auto" style="border-collapse: collapse; min-width: 800px !important; max-width: 800px !important;">
					<tbody>
						<tr>
							<td class="td-tit">구 분</td>
							<td>
								<select name="category" class="form-select">
									<option value="상품" ${dto.category=="상품"?"selected='selected'":"" }>상품</option>
									<option value="배송" ${dto.category=="배송"?"selected='selected'":"" }>배송</option>
									<option value="결제" ${dto.category=="결제"?"selected='selected'":"" }>결제</option>
									<option value="기타" ${dto.category=="기타"?"selected='selected'":"" }>기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="td-tit" id="suvje">제 목</td>
							<td>
								<input type="text" name="subject" class="form-control" value="${dto.subject}">
							</td>
						</tr>
						<tr>
							<td class="td-tit">작성자</td>
							<td class="text-start" style="text-align: left !important;">
								${sessionScope.member.nickName}
							</td>
						</tr>
						<tr>
							<td class="td-tit">내용</td>
							<td>
								<textarea name="content" class="form-control" style="resize: none; height: 200px !important;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="d-flex gap-2 justify-content-center">
					<button type="button" class="btn btn-secondary" onclick="sendOk();">등록완료</button>
					<button type="reset" class="btn btn-outline-secondary">다시입력</button>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/inquiry/list';">등록취소</button>
				</div>
			</form>
	</div>
</section>