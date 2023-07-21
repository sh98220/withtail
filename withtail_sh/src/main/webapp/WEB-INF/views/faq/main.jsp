<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.faq-h3 {
		color: #555;
		font-weight: bold;
	}
	
	.font-bold {
		font-weight: bold;
	}
	
	.list-disc {
		list-style: disc;
	}
	
	
	.faqbox {
		border-top: 1px solid #424242;
		margin-top: 1.5rem;
	}
	
	.a-button:not(.collapsed) {
	    color: #82ae46;
	    background-color: #fff;
	    font-weight: bold;
	}
	
	.a-button:not(.collapsed)::after {
    	background-image: var(--bs-accordion-btn-icon);
	}
	
	.a-button:focus {
		box-shadow: none;
		border-bottom: 1px solid var(--bs-border-color);
	}
	
	.a-body {
		background: #f1f1f1;
	}

</style>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	listPage(1);
	
    $("button[role='tab']").on("click", function(e){
		// const tab = $(this).attr("aria-controls");
    	listPage(1);
    	
    });
});

// 글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $("button[role='tab'].active");
	let categoryNum = $tab.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/faq/list";
	let query = "pageNo="+page+"&categoryNum="+categoryNum;
	let search = $('form[name=faqSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#nav-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "text", fn);
}

// 검색
function searchList() {
	const f = document.faqSearchForm;
	f.condition.value = $("#condition").val();
	f.keyword.value = $.trim($("#keyword").val());

	listPage(1);
}

// 새로고침
function reloadFaq() {
	const f = document.faqSearchForm;
	f.condition.value = "all";
	f.keyword.value = "";
	
	listPage(1);
}
</script>

<section class="ftco-section">
	<div class="container">
		<h3 class="text-center faq-h3">자주 묻는 질문</h3>

		<div class="faqbox">
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
		
				<li class="accordion-item" role="presentation">
					<button class="nav-link active" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="0" aria-selected="true" data-categoryNum="0" style="color: black">모두</button>
				</li>
				<c:forEach var="dto" items="${listCategory}" varStatus="status">
					<li class="accordion-item" role="presentation">
						<button class="nav-link" id="tab-${status.count}" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="${status.count}" aria-selected="true" data-categoryNum="${dto.categoryNum}" style="color: black">${dto.category}</button>
					</li>
				</c:forEach>
			</ul>	
			
					
			<div class="tab-content pt-2" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content"></div>
			</div>
			
	
			</div>
		</div>
	</div>
</section>