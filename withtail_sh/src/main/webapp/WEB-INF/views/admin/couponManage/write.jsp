<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style type="text/css">
.out{
 display: flex; align-items: center;  flex-direction: row; justify-content: center;
}

.body-main {
	width: 960px;
}
.table-form tr>td:first-child{
    width: 150px;
    height: 50px;
    text-align: center;
    background: #f8f9fa;
}

.show {
  display: none;
}
</style>

<script type="text/javascript">
$(function() {
	$("input[name='category']").change(function() {
		let category = $(this).val();
		if(category == 0) {
			 $('.won').removeClass("show");
			 $('.percent').addClass("show");
		} else {
			$('.percent').removeClass("show");
			 $('.won').addClass("show");
		}
	});
}); 

function isValidDateFormat(data){
	if(data.length !== 8 && data.length !== 10) return false;
		
	let p = /(\.)|(\-)|(\/)/g;
	data = data.replace(p, "");
	if(data.length !== 8) return false;
	
	let format = /^[12][0-9]{7}$/;
	if(! format.test(data)) return false;
    
	let y = parseInt(data.substr(0, 4));
	let m = parseInt(data.substr(4, 2));
	let d = parseInt(data.substr(6));

	if(m<1 || m>12) return false;
	let lastDay = (new Date(y, m, 0)).getDate();
	if(d<1 || d>lastDay) return false;
	
	return true;
}

function check() {
    const f = document.couponForm;
    let mode = "${mode}";

	let str = f.couponName.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.couponName.focus();
        return false;
    }
    
    if(f.couponCategory.value == 1 ){
		if(!/^(\d){1,2}$/.test(f.couponPrice.value)) {
			alert("할인율을 입력 하세요.");
			f.couponPrice.focus();
			return false;
		}
	} else if(f.couponCategory.value == 0 ) {
		if(!/^(\d){1,8}$/.test(f.couponPrice.value)) {
			alert("쿠폰가격을 입력 하세요.");
			f.couponPrice.focus();
			return false;
		}
	}
    
	if(!/^(\d){1,8}$/.test(f.couponMinPrice.value)) {
		alert("최소 주문 가격을 입력 하세요.");
		f.couponMinprice.focus();
		return false;
	}

	if(! isValidDateFormat(f.startDay.value)) {
		alert("날짜를 입력하세요.");
		f.startDay.focus();
		return false;
	}
	
	if(! /^[0-2][0-9]:[0-5][0-9]$/.test(f.startTime.value)) {
		alert("시간을 입력하세요.");
		f.startTime.focus();
		return false;
	}


	if(! isValidDateFormat(f.endDay.value)) {
		alert("날짜를 입력하세요.");
		f.endDay.focus();
		return false;
	}
	
	if(! /^[0-2][0-9]:[0-5][0-9]$/.test(f.endTime.value)) {
		alert("시간을 입력하세요.");
		f.endTime.focus();
		return false;
	}
	
	let sd = new Date(f.startDay.value + " " + f.startTime.value);
	let ed = new Date(f.endDay.value + " " + f.endTime.value);
	
	if( sd.getTime() >= ed.getTime() ) {
		alert("시작날짜는 종료날짜보다 크거나 같을 수 없습니다.");
		f.startDay.focus();
		return false;
	}

	if( mode === "write" && new Date().getTime() > ed.getTime() ) {
		alert("종료날짜는 현재 시간보다 작을수 없습니다.");
		f.endDay.focus();
		return false;
	}
	
	
    f.action = "${pageContext.request.contextPath}/admin/couponManage/${mode}";
    f.submit();

}
</script>

<div class="out">
    
    <div class="body-main">
    <div class="body-title">
		<h2><i class="fa-solid fa-tags"></i> 쿠폰 등록 </h2>
    </div>
    	
		<form name="couponForm" method="post" >
			<table class="table table-border border-top2 table-form">
				<tr> 
					<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td> 
						<input type="text" name="couponName" maxlength="100" class="form-control" placeholder="제목" value="${dto.couponName }">
					</td>
				</tr>
				<tr> 
					<td>작성자</td>
					<td> 
						<p class="form-control-plaintext">관리자</p>
					</td>
				</tr>
				 <tr>
	            	<td class="form-control-plaintext">구분</td>
					<td>            	
					<label><input type="radio" name="couponCategory" value="0" checked="checked">할인가</label>
					<label><input type="radio" name="couponCategory" value="1">할인율</label>
					</td>
	            </tr>
	            <tr>
	            	<td>가격</td>
	            	<td><input type="text" name="couponPrice" maxlength="100" class="form-control" placeholder="쿠폰 금액" value="${dto.couponPrice }" style="width:200px;" >
	            	 <span class="percent show"> % </span>
	            	 <span class="won show"> 원 </span>
	            	</td>
	            </tr>
			
				<tr>
					<td class="form-control-plaintext">최소 주문 금액</td>
					<td><input type="text" name="couponMinPrice" maxlength="100" class="form-control" placeholder="최소 주문 금액" value="${dto.couponMinPrice}"  style="width:200px;"></td>
				</tr>

				<tr>
					<td class="form-control-plaintext">시작일</td>
					<td>
						<input name="startDay"  type="date"  value="${dto.startDay}">
						<input name="startTime" type="time" value="${dto.startTime}">
					</td>

				</tr>
				<tr>
					<td class="form-control-plaintext">종료일</td>
					<td>
						<input name="endDay"  type="date" value="${dto.endDay }" >
						<input name="endTime"  type="time" value="${dto.endTime }" >
					</td>
				</tr>
			</table>
				
			<table class="table">
				<tr> 
					<td align="center">
						<button type="button" class="btn btn-dark" onclick="check();">${mode=='update'?'수정완료':'등록하기'}</button>
						<button type="reset" class="btn">다시입력</button>
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/couponManage/list';">${mode=='update'?'수정취소':'등록취소'}</button>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="couponNum" value="${dto.couponNum}">
							<input type="hidden" name="page" value="${page}">
						</c:if>
					</td>
				</tr>
			</table>
		</form>
		    	
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
