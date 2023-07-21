<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<style>
.foot-bg1 {
	background-color: #f1f1f1;
}

.foot-bg2 {
	background-color: #f8f8f8;
}

.footer1 p, .footer2 p {
	margin-bottom: 0;
}

.footer1 {
    padding: 10px 15px;
    display: flex;
    align-items: center;
    align-self: stretch;
    line-height: 1.2;
}

.footer1 .separator {
    width: 1px;
    height: 18px;
    background-color: #dbdbdb;
    margin-right: 10px;
}

.footer1 .terms-text {
    color: #353535;
    font-size: 13px;
    font-weight: 400;
}

.footer1 .terms-text:not(:last-of-type) {
    margin-right: 10px;
}

.footer2 {
    padding: 24px 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    align-self: stretch;
    line-height: 1.2;
}

.footer2 .business-info {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-end;
    flex: 1;
}

.footer2 .separator-three {
    width: 1.11px;
    height: 150px;
    background-color: #dbdbdb;
    opacity: .5;
}

.footer2 .contact-us {
    padding: 0 0 0 60px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: flex-end;
    gap: 10px;
    line-height: 1.5;
}

.footer2 .company-name {
    font-size: 16px;
    font-weight: 600;
    color: #121212;
    align-self: stretch;
    margin-bottom: 10px;
}

.footer2 .text-layout {
    margin-bottom: 10px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.footer2 .copyright {
    color: #353535;
    opacity: .3;
    font-size: 12px;
    font-weight: 400;
}

/* text-layout */
.footer2 .first {
    margin-bottom: 2px;
    display: flex;
    /*align-items: center;*/
}

.footer2 .name-layout {
	margin-right: 10px;
	display: flex;
    align-items: flex-start;
}

.footer2 .separator {
	color: #dbdbdb;
    margin-right: 10px;
}

.footer2 .item1 {
	color: #353535;
    font-size: 12px;
    font-weight: 400;
}

.footer2 .item1:not(:last-of-type) {
    margin-right: 3px;
}

.footer2 .text7 {
    color: #121212;
    font-size: 12px;
    font-weight: 700;
}

.footer2 .item7 {
    color: #353535;
    margin-right: 3px;
    font-size: 12px;
    font-weight: 400;
}

/*contact-us*/
.footer2 .right-layout {
	display: flex;
    flex-direction: column;
    align-items: flex-end;
}

.footer2 .help-layout {
	display: flex;
    align-items: center;
    justify-content: flex-end;
    align-self: stretch;
}

.footer2 .help-text {
    font-size: 16px;
    font-weight: 500;
    color: #121212;
    text-align: right;
    padding-left: 5px;
}

.footer2 .phone-number {
    color: #121212;
    align-self: stretch;
    text-align: right;
    font-size: 19px;
    font-weight: 700;
}

.footer2 .engagement-layout {
    display: flex;
    align-items: flex-start;
    justify-content: flex-end;
}

.footer2 .engagement-layout:not(:last-of-type) {
    margin-right: 10px;
}

.footer2 .engagement-text {
    color: #353535;
    font-size: 12px;
    font-weight: 400;
}

.footer2 .inquery {
    border-radius: 5px;
    padding: 8px 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid #121212;
    cursor: pointer;
}

.footer2 .inquery:not(:last-of-type) {
    margin-right: 7px;
}

.footer2 .text {
    color: #121212;
    text-align: center;
    font-size: 12px;
    font-weight: 400;
}

</style>

<div class="container-fluid foot-bg1">
	<div class="container footer1">
	    <a href="#" class="terms-text">이용약관</a>
	    <div class="separator"></div>
	    <a href="#" class="terms-text">개인정보 처리방침</a>
	    <div class="separator"></div>
	    <a href="#" class="terms-text">이용안내</a>
	</div>
</div>

<div class="container-fluid foot-bg2">
	<div class="container footer2">
		<div class="business-info">
			<p class="company-name">
				위드테일
			</p>
			<div class="text-layout">
				<div class="first">
					<div class="name-layout">
						<p class="item1">
							쌍용강북교육센터
						</p>
					</div>
					<div class="separator">|</div>
					<div class="name-layout">
						<p class="item1">
							윤여진, 김성훈, 이민석, 송혜원, 최수진, 한정수
						</p>
					</div>
				</div>
				<div class="first">
					<div class="name-layout">
						<p class="item1">
							사업자등록번호 :
						</p>
						<p class="item1">
							123-45-67890
						</p>
					</div>
					<div class="separator">|</div>
					<div class="name-layout">
						<p class="item1">
							TEL :
						</p>
						<p class="item1">
							010-1234-5678
						</p>
					</div>
				</div>
				<div class="first" style="margin-bottom: 5px;">
					<div class="name-layout">
						<p class="item1">
							개인정보관리자 :
						</p>
						<p class="item1">
							윤여진 dbsduwls103@naver.com
						</p>
					</div>
				</div>
				<div class="first" style="margin-bottom: 5px;">
					<div class="name-layout">
						<p class="item1">
							통신판매업신고번호 :
						</p>
						<p class="item1">
							2023-서울마포-12345호
						</p>
					</div>
				</div>
				<div class="first">
					<div class="name-layout">
						<p class="item7">구매안전서비스 :</p>
						<a href="#" class="text7">가입사실확인</a>
					</div>
				</div>
			</div>
			<p class="copyright">
	          ⓒ COPYRIGHT (C) WithTail ALL RIGHTS RESERVED
	        </p>
		</div>
		<div class="separator-three"></div>
		<div class="contact-us">
			<div class="right-layout">
				<div class="help-layout">
					<img alt="call" class="icon-call" src="${pageContext.request.contextPath}/resources/images/footer/call.png">
					<p class="help-text">고객상담 바로가기</p>
				</div>
				<p class="phone-number">010 - 1234 - 5678</p>
				<div class="help-layout">
					<div class="engagement-layout">
						<p class="engagement-text">평일 10 : 00 - 18 : 00
						</p>
					</div>
					<div class="separator">|</div>
					<div class="engagement-layout">
						<p class="engagement-text">점심시간 12 : 30 - 13 :
							30</p>
					</div>
					<div class="separator">|</div>
					<div class="engagement-layout">
						<p class="engagement-text">주말,공휴일 휴무</p>
					</div>
				</div>
			</div>
			<div class="help-layout">
				<div class="inquery link-hover">
					<p class="text">제휴 및 입점문의 &gt;</p>
				</div>
			</div>
		</div>
	</div>
</div>
