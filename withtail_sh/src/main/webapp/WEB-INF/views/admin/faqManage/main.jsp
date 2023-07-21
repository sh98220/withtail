<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<style type="text/css">
.out{
 display: flex; align-items: center;  flex-direction: row; justify-content: center;
}

.body-main {
	width: 960px;
}
.btn{
	border-radius: 0.375rem;
	height: 37px;
}
.btn:hover{background: #6C757D; color: white}


.pointhover:hover{
  background-color: #82ae4654;
</style>

<style type="text/css">
.accordion {
	box-sizing: border-box;
	width: 100%;
	min-height: 50px;
	margin: 15px auto 5px;
}

.accordion h3.question {
	box-sizing: border-box;
    color:#333;
    font-weight:500;
    border:1px solid #ccc;
    background-color:#fff;
    padding:7px 15px 7px;
    border-radius:4px;	
    cursor:pointer;
    margin: 3px 0 0;
    font-size: 17px;
}
.accordion h3.question:hover {
	background-color: #82ae4654;
		color: #666;
}

.accordion h3.question .q {
	font-weight: 600;
}
.accordion h3.question .subject:hover {

}

.accordion div.answer {
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-top: none;
	min-height: 50px;
	padding: 3px 10px 10px;
	display: none;
	background: #eeeeee85;
}

.accordion div.answer > .category {
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #eee;
}

.accordion div.answer > .content {
	padding: 7px 15px 5px;
}
.accordion div.answer > .content div:first-child {
	font-weight: 700;
	display: inline-block;
	vertical-align: top;
	padding-left: 5px;
}
.accordion div.answer > .content div:last-child {
	display: inline-block;
}

.accordion div.answer > .update {
	text-align: right;
}

.accordion h3.active {
	font-weight: 600;
	background-color: #82ae46cf;
}
</style>

<script type="text/javascript">
$(function(){
	$("body").on("click", ".accordion h3.question", function(){
		 const $answer = $(this).next(".accordion div.answer");
		 let isVisible = $answer.is(':visible');
		 if(isVisible) {
			 $(this).next(".accordion div.answer").hide();
			 $(this).removeClass("active");
		 } else {
			 $(".accordion div.answer").hide();
			 $(".accordion h3.question").removeClass("active");
			 
			 $(this).next(".accordion div.answer").show();
			 $(this).addClass("active");
		 }
	});
});

$(function(){
	let categoryNum = "${categoryNum}";
	let pageNo = "${pageNo}";
	if(pageNo === "") {
		pageNo = 1;
	}
	$("#tab-"+categoryNum).addClass("active");
	listPage(pageNo);

	$("ul.tabs li").click(function() {
		categoryNum = $(this).attr("data-categoryNum");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+categoryNum).addClass("active");
		
		listPage(1);
	});
});

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

// 글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $(".tabs .active");
	let categoryNum = $tab.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/admin/faqManage/list";
	let query = "pageNo="+page+"&categoryNum="+categoryNum;
	let search = $('form[name=faqSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#tab-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
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

// 글 삭제
function deleteFaq(num, page) {
	var url = "${pageContext.request.contextPath}/admin/faqManage/delete";
	var query = "num="+num;
	
	if(! confirm("위 게시물을 삭제 하시 겠습니까 ? ")) {
		  return;
	}
	
	const fn = function(data){
		listPage(page);
	};
	
	ajaxFun(url, "post", query, "json", fn);
}
</script>

<div class="out">
    
    <div class="body-main">
    <div class="body-title">
		<h2><i class="fa-solid fa-clipboard-question"></i> 자주하는 질문 </h2>
    </div>

		<div>
			<ul class="tabs">
				<li id="tab-0" data-categoryNum="0">모두</li>
				<c:forEach var="dto" items="${listCategory}">
					<li id="tab-${dto.categoryNum}" data-categoryNum="${dto.categoryNum}">${dto.category}</li>
				</c:forEach>
			</ul>
		</div>
		<div id="tab-content" style="padding: 15px 10px 5px; clear: both;"></div>
		
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button  style="height: 35px;" type="button" class="btn" onclick="reloadFaq();" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
				<td align="center">
					<form name="searchForm" method="post">
						<select  style="height: 35px;" id="condition" name="condition" class="form-select">
							<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
							<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
						</select>
						<input  style="height: 35px;" type="text" id="keyword" name="keyword" class="form-control" value="${keyword}">
						<button  style="height: 35px;" type="button" class="btn" onclick="searchList();">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<button  style="height: 35px;" type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/faqManage/write';">글올리기</button>
				</td>
			</tr>
		</table>
		
	</div>
</div>

<form name="faqSearchForm" method="post">
	<input type="hidden" name="condition" value="all">
    <input type="hidden" name="keyword" value="">
</form>

