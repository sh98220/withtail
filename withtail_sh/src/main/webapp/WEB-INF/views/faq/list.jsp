<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${list.size() > 0}">
	<div class="accordion accordion-flush" id="accordionFlushExample">
		<c:forEach var="dto" items="${list}" varStatus="status">
			<div class="accordion-item" style="border: none;">
				<h2 class="accordion-header" id="flush-heading-${status.index}">
					<button class="accordion-button collapsed a-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${status.index}" aria-expanded="false" aria-controls="flush-collapse-${status.index}"  style="border-bottom : 1px solid #ececec;">
						${dto.subject}
					</button>
				</h2>
				<div id="flush-collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading-${status.index}" data-bs-parent="#accordionFlush">
					<div class="accordion-body  a-body">

						<div class="row border-bottom pb-1">분류 : ${dto.category}</div>
						<div class="row p-2">
							${dto.content}
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</c:if>


