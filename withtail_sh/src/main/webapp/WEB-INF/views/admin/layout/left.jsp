<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
// 메뉴 활성화
$(function(){
    var url = window.location.pathname;
    var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
    
    try {
    	$('nav ul>li>a').each(function() {
    		if ( urlRegExp.test(this.href.replace(/\/$/, '')) ) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    	if($('nav ul>li>a').hasClass("active_menu")) return false;

     	var parent = url.replace(/\/$/, '').substr(0, url.replace(/\/$/, '').lastIndexOf("/"));
     	if(! parent) parent = "/";
        var urlParentRegExp = new RegExp(parent);
    	$('nav ul>li>a').each(function() {
    		if($(this).attr("href")=="#") return true;
    		
    		var phref = this.href.replace(/\/$/, '').substr(0, this.href.replace(/\/$/, '').lastIndexOf("/"));
    		
    		if ( urlParentRegExp.test(phref) ) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    	if($('nav ul>li>a').hasClass("active_menu")) return false;
    	
    	$('nav ul>.menu--item__has_sub_menu').each(function() {
    		if (urlRegExp.test(this.href.replace(/\/$/, '')) ) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    	
    }catch(e) {
    }
});

$(function(){
	$('nav ul>.menu--item__has_sub_menu ul>li>a').each(function() {
		if($(this).hasClass('active_menu')) {
			$(this).closest(".menu--item__has_sub_menu").addClass('menu--subitens__opened');
			return false;
		}
	});
});
</script>

<header class="header clearfix">
	<button type="button" id="toggleMenu" class="toggle_menu">
		<i class="fa-solid fa-bars"></i>
	</button>
	
	<div class="header-container">
		<div class="header-left">
			<h1 style="color: #82ae46; font-weight: bold;">관리자 페이지</h1>
		</div>
		<div class="header-right" >
			<span class="roll-user" >
				<label class="user" style="padding-top: 10px; ">
					<span class="name" style="color: #82ae46; font-weight: bold;">메인으로 돌아가기</span>
					<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-arrow-right-from-bracket" style="color: #82ae46;"></i></a>
				</label>
			</span>
		</div>
	</div>

</header>

<nav class="vertical_nav">
	<ul id="js-menu" class="menu">
	
		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/admin" class="menu--link" title="Home">
				<i class="menu--icon  fa-fw fa-solid fa-house"></i>
				<span class="menu--label">Home</span>
			</a>
		</li>

		
		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="판매 관리">
				<i class="menu--icon  fa-solid fa-cart-shopping" style="padding-left: 12px;"></i>
				<span class="menu--label">판매 관리</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/orderManage/order'/>" class="sub_menu--link">주문 관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/itemManage/list'/>" class="sub_menu--link">상품 관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/couponManage/list'/>" class="sub_menu--link">쿠폰 관리</a>
				</li>
			</ul>
		</li>
		
		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="회원 관리">
				<i class="menu--icon  fa-fw fa-solid fa-user-group"></i>
				<span class="menu--label">회원 관리</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/memberManage/list/general'/>" class="sub_menu--link">회원 목록</a>
				</li>
			</ul>
		</li>
	
		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="고객센터관리">
				<i class="menu--icon  fa-fw fa-solid fa-person-circle-question"></i>
				<span class="menu--label">고객센터관리</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/reviewManage/list/before'/>" class="sub_menu--link">리뷰 관리</a>
				</li>
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/noticeManage/list'/>" class="sub_menu--link">공지사항</a>
				</li>
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/inquiryManage/list'/>" class="sub_menu--link">1:1문의</a>
				</li>
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/faqManage/main'/>" class="sub_menu--link">FAQ</a>
				</li>
			</ul>
		</li>

		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="놀이터">
				<i class="menu--icon  fa-solid fa-democrat" style="padding-left: 12px;" ></i>
				<span class="menu--label">놀이터</span>
			</label>
			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/dogMapManage/list'/>" class="sub_menu--link">Tail  &amp; Path 목록</a>
				</li>
			</ul>
		</li>
		<li class="menu--item menu--item__has_sub_menu">
			<label class="menu--link" title="이벤트 관리">
				<i class="menu--icon  fa-solid fa-gifts" style="padding-left: 12px;"></i>
				<span class="menu--label">이벤트 관리</span>
			</label>
			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="<c:url value='/admin/eventManage/all/list'/>" class="sub_menu--link">이벤트 목록</a>
				</li>
			</ul>
		</li>
		

		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/member/logout" class="menu--link" title="Logout">
				<i class="menu--icon fa-fw fa-solid fa-lock-open"></i>
				<span class="menu--label">Logout</span>
			</a>
		</li>
	</ul>
	
	<button id="collapse_menu" class="collapse_menu">
		<i class="collapse_menu--icon fa fa-fw"></i>
		<span class="menu--label"></span>
	</button>

</nav>
