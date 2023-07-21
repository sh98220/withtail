<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="vo" items="${listReplyAnswer}">
	<div class='border-bottom m-1'>
		<div class='row p-1'>
			<div class='col-auto'>
				<div class='reply-writer d-flex'>
					<div class="td-icon" style="width: 45px;"><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class="rp-con" style="text-align: left !important; margin-top: 5px; max-width: 650px;">
						<div class='name'>${vo.nickname}</div>
						<p style="margin-bottom: 0;">${vo.content}</p>
					</div>
				</div>
			</div>
			<div class='col align-self-center text-end td-delete'>
				<a class='deleteReply' data-replyNum='${vo.replyNum}' data-pageNo='${pageNum}' href="#">삭제</a>
			</div>
		</div>
		<div class='td-date mb-2' style="text-align: left !important; padding-left: 13px;">${vo.regDate}</div>
	</div>
</c:forEach>
