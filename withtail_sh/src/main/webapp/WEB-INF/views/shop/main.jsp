<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<style>
.hidden {
	display: none;
}

.-prodsort {
    border-top: 1px solid #f1f1f1;
    padding: 15px 0;
    border-bottom: 1px solid #f1f1f1;
}

.ftco-section {
    padding: 2em 0 !important;
    position: relative;   
}

.product-category li {
    color: #333;
    padding: 3px 20px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    border-radius: 5px;
}

.product-category li:not(.active) {
	cursor: pointer;
}

.product-category li.active {
    background: #82ae46;
    color: #fff;
}

.product-category li:not(.active):hover {
	font-weight: 600;
}

.name-tit {
	color: #333;
}

.li-span {
	margin-left: 5px;
	margin-right: 5px;
	display: inline-block;
	color: #999;
}
		
.sort-list > a {
	color: #666;
	font-size: 13px;
    letter-spacing: 0.01em;
	display: inline-block;
	cursor: pointer;
	border-left: 1px solid #dadada;
	line-height: 10px;
	padding: 3px 12px 3px 12px;
	transition: 0.0s all ease;
}

.sort-list > a:hover {
	color: #000 !important;
	font-weight: 600 !important;
	cursor: pointer;
}
		
.color-bk {
	color: #000;
}

/*검색창*/
.form-select:focus {
		outline: none;
		box-shadow: none;
		border: 1px solid #82ae46;
	}
	
	.form-control {
    	height: calc(2.25rem + 2px) !important;
	}
	
	.form-control:focus {
		border: 1px solid #82ae46;
	}
	
	.btn:focus {
		border: 1px solid #82ae46 !important;
		box-shadow: none;
	}
	
/*페이징*/
.block-27 ul li a, .block-27 ul li span {
    color: #666;
    vertical-align: middle;
}

.block-27 ul li span.disabled {
	color: #999;
}

.clicked {
	color: #000 !important;
	font-weight: 600 !important;
}

</style>

	<!--
	 <div class="hero-wrap hero-bread" style="background: url('${pageContext.request.contextPath}/resources/images/main/main_ban03.jpg') no-repeat; background-size: cover; min-height: 380px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">  
          <div class="col-md-9 ftco-animate text-center">
             <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span></p>
            <h1 class="mb-0 bread">Products</h1>
          </div>
        </div>
      </div>
    </div>
    -->
    
    <div>
    	<img src="${pageContext.request.contextPath}/resources/images/main/main_ban03.jpg" class="img-fluid">
	</div>
	
    <section class="ftco-section">
       <div class="container">
          <div class="col-md-12 mb-3 text-center subject-tit" style="font-size: 30px; color: #333;" >
             ${category.ctName}
          </div>
       
          <div>
             <div class="col-md-12 mb-5 text-center">
                <ul class="product-category">
                	<c:forEach var="vo" items="${listSubCategory}" varStatus="status">
                		<li class="li-sub" data-num="${vo.ctNum}">${vo.ctName}</li>
                	</c:forEach>
                </ul>
             </div>
          </div>
          
          <!--  
          <div class="-prodsort mb-5">
            <ul class="d-flex">
	            		<li class="col-lg-6 col-md-6">
	            			제품 목록<span class="li-span">&gt;</span><span class="color-bk">${category.ctName}</span><span class="li-span">&gt;</span>총 <span class="color-bk">${dataCount}</span> 제품
	            		</li>
	            		<li class="col-lg-6 col-md-6 sort-list text-right" style="padding-right: 0;">
	            			<a class="sort-a clicked" data-sort="0">신상품</a>
	            			<a class="sort-a" data-sort="1">상품명</a>
	            			<a class="sort-a" data-sort="2">낮은가격</a>
	            			<a class="sort-a" data-sort="3">높은가격</a>
	            			<a class="sort-a" data-sort="4">인기상품</a>
	            			<a class="sort-a" data-sort="5">사용후기</a>
	            		</li>
	         </ul>
          </div>
          -->
          
    	  <div class="content-frame">
    	  	<!-- 여기에 list.jsp 추가 -->
    	  </div>
         
       </div>
    </section>
    
    <!-- 검색 폼 -->
	<form name="prodForm" method="post">
		<input type="hidden" name="condition" value="itemName">
		<input type="hidden" name="keyword" value="">
	</form>


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  
<script type="text/javascript">
function login() {
	location.href = "${pageContext.request.contextPath}/member/login";
}

// 로그인 필요
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
	    	} else if(jqXHR.status === 402) {
	    		alert("권한이 없습니다.");
	    		return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
	    	} else if(jqXHR.status === 410) {
	    		alert("삭제된 게시물입니다.");
	    		return false;
	    	}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	listPage(1, 0);
});

$(function(){
	$("body").on("click", ".sort-a", function(){
		let sortNo = $(this).attr("data-sort");
		listPage(1, sortNo);
	});
});

//상품 리스트
function listPage(page, sortNo) {
	let ctNum = "${ctNum}";

	let url = "${pageContext.request.contextPath}/shop/"+ctNum+"/list";
	let query = "pageNo="+page;
	let search = $('form[name=prodForm]').serialize();
	
	query = query+"&"+search+"&sortNo="+sortNo;
	let selector = ".content-frame";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 탭 클릭시 주소 이동
$(".product-category").on("click", "li.li-sub:not(.active)", function(){
	let num = $(this).attr("data-num");
	
	location.href = '${pageContext.request.contextPath}/shop/'+num;
});

// 상품 보기
function detailProd(itemNum, ctNum) {
	let url = "${pageContext.request.contextPath}/shop/info/"+itemNum;
	let query = "ctNum=${ctNum}";
	let search = $('form[name=searchForm]').serialize();
	query = query+"&pageNo="+page+"&"+search;
	let selector = ".content-frame";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}
</script>