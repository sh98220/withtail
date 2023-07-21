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
	
	/*탭*/
	.tab-ul {
		font-size: 16px;
	}
	
	.tab-ul > li {
		border: 1px solid #999;
	}
	
	.tab-ul > li:nth-child(2) {
		border-left: 0;
		border-right: 0;
	}
	
	.tab-ul > li > a {
		display: block;
		padding: 10px 0;
		background: #eee;
		box-sizing: border-box;
		
	}
	
	.tab-ul > li > a:hover {
		background: #333;
		color: #fff !important;
		font-weight: 600;
	}
	
	.tab-ul > li > a.active {
		background: #82ae46;
		color: #fff;
		font-weight: 600;
	}
	
	.tab-ul .col-md-4 {
		padding-left: 0 !important;
		padding-right: 0 !important;
	}
	
	/* 이벤트 ul */
	.ev-ul {
		border-bottom: 1px solid #eee;
		padding-top: 10px;
		padding-bottom: 10px;
		height: 200px;
	}
	
	.ev-li {
		padding-left: 0 !important;
		padding-right: 0 !important;
		overflow: hidden;
	}
	
	/* 이벤트 ul 안 */
	.ev-content {
		margin-top: 0.7rem;
	}
	
	.ing-span {
		background: #82ae46;
		color: #fff;
		padding: 3px 20px;
		display: inline-block;
		border-radius: 5px;
	}
	
	.exit-span {
		background: #999;
		color: #fff;
		padding: 3px 20px;
		display: inline-block;
		border-radius: 5px;
	}
	
	.event_img {
		width: 100%;
		display: block;
		max-height: 100%;
		object-fit: cover;
		-webkit-transform: scale(1);
	    -moz-transform: scale(1);
	    -ms-transform: scale(1);
	    -o-transform: scale(1);
	    transform: scale(1);
	    -moz-transition: all 0.3s ease;
	    -o-transition: all 0.3s ease;
	    -webkit-transition: all 0.3s ease;
	    -ms-transition: all 0.3s ease;
	    transition: all 0.3s ease;
	}
	
	.ev-li > a:hover .event_img {
		-webkit-transform: scale(1.1);
	    -moz-transform: scale(1.1);
	    -ms-transform: scale(1.1);
	    -o-transform: scale(1.1);
	    transform: scale(1.1);
	}
	
	.ev-date {
		font-weight: 600;
		font-size: 18px;
		margin-bottom: 0 !important;
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

<section class="ftco-section" style="min-height: 550px;">
	<div class="container">
		<h3 class="text-center notice-h3">이벤트</h3>
		
		<!-- 탭 -->
		<ul class="tabs tab-ul col-md-12 d-flex text-center mb-3">
			<li class="col-md-4" id="tab-progress" data-category="progress"><a href="#">진행중 이벤트</a></li>
			<li class="col-md-4" id="tab-ended" data-category="ended"><a href="#">종료된 이벤트</a></li>
			<li class="col-md-4" id="tab-winner" data-category="winner"><a href="#">당첨자 발표</a></li>
		</ul>
		<!-- //탭 -->
		
		<div class="ev-div">
			<c:forEach var="dto" items="${list}" varStatus="status">
			<ul class="col-md-12 d-flex ev-ul">
				<li class="col-md-4 ev-li">
					<a href="${pageContext.request.contextPath}/event/article?category=${category}&num=${dto.num}">
						<img alt="이벤트 배너" src="${pageContext.request.contextPath}/uploads/event/${dto.imageFileName}" class="event_img">
					</a>
				</li>
				<li class="col-md-8">
					<div class="ev-content">
						<c:if test="${category=='progress'}">
							<span class="ing-span mb-2">진행중</span>
						</c:if>
						<c:if test="${category!='progress'}">
							<span class="exit-span mb-2">종료</span>
						</c:if>
						
						<h3><a href="${pageContext.request.contextPath}/event/article?category=${category}&num=${dto.num}">${dto.subject}</a></h3>
						<p class="text-truncate" style="max-width: 550px;"><a href="${pageContext.request.contextPath}/event/article?category=${category}&num=${dto.num}">${dto.content}</a></p>
						<p class="ev-date">${dto.startDate} ~ ${dto.endDate}</p>
					</div>
				</li>
			</ul>
			</c:forEach>
		</div>

		<!-- 페이징 -->
		<!--
		<div class="page-navigation">
				${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
		</div>
		-->
		
		<div class="row my-5">
		    <div class="col text-center">
		        <div class="block-27 page-nav">
		           ${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
		  		</div>
			</div>
		</div>
		
		<!-- //페이징 -->
		
	</div>
</section>

<script type="text/javascript">

$(function(){
	$('#tab-${category} a').addClass('active');

	$('ul.tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		location.href = '${pageContext.request.contextPath}/event/'+category+'/list';
	});
	

});


</script>