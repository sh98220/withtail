<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style type="text/css">
 #modal.modal-overlay {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    display: none;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.25);
    -webkit-backdrop-filter: blur(1.5px);
    border-radius: 10px;
    border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-top {
    padding: 10px;
    border-bottom: 1px solid black;
}
#modal .modal-window {
    background: white;
    -webkit-backdrop-filter: blur( 13.5px );
    border-radius: 10px;
    border: 1px solid #c5c5c5;
    width: 300px;
    height: 230px;
    top: -100px;
    padding: 10px;
}
#modal .title {
    padding-left: 10px;
    display: inline;
}
#modal .title h2 {
    display: inline;
}
#modal .close-area {
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
}

#modal .content {
    margin-top: 20px;
    padding: 0px 10px;
}


.out{
 display: flex; align-items: center;  flex-direction: row; justify-content: center;
}

.body-main {
	width: 960px;
}

.tabmenu{ 
  margin: 0 auto; 
  position:relative; 
}
.tabmenu ul{
  position: relative;
}
.tabmenu ul li{
  display:  inline-block;
  width:200px; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
  line-height:40px;
}
.tabmenu label{
  display:block;
  width:200; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  width: 100%;
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#ccc;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}

.tab-menu {
  border: 1px solid #ddd;
  border-radius: 4px;
}

.tab {
  display: flex;
}

.long {
    margin: 5px auto;
    width: 500px;
    margin-left: 0px;
}

.short {
    margin: 5px auto;
    margin-left: 0px;
    display: inline-block;
}

.category {
    width: 130px;
    padding: 3px;
    border-radius: 3px;
    height: 31px;
    border-color: #999;
}

.btn {
color: #333;
border: 1px solid #999;
background-color: #fff;
padding: 4px;
border-radius: 30px;
font-weight: 500;
font-size: 12px;
cursor: pointer;
font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
vertical-align: baseline;
}

.btn1:hover{background: #6C757D; color: white}

.btn1 {
width : 50px;
height : 30px;
color: #333;
border: 1px solid #999;
background-color: #fff;
padding: 4px;
border-radius: 10px;
font-weight: 500;
font-size: 12px;
cursor: pointer;
font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
vertical-align: baseline;
}

.btn:hover{background: #6C757D; color: white}


.imgbox {
     width: 90px;
     height: 90px;
     padding: 10px;
     border: 1px solid #999;
     margin: 10px auto;
}

.btn-light {
    padding: 5px;
    margin: 3px;
    background-color: #fff;
    border-radius: 4px;
}

.tab-menu {
  border: 1px solid #ddd;
  border-radius: 4px;
}

.tab {
  display: flex;
}

.tab-button {
    background-color: #f2f2f2;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 10px 20px;
    flex: 1;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.tab-button:hover {
  background-color: #ddd;
}

.pointhover:hover{
  background-color: #82ae4654;
}

.tab-button.active {
  background-color: #82ae46;
}

.content{
	font-weight: bold; padding: 13px;
}

</style>



<script type='text/javascript'>
$(document).ready(function() {
    $("#btn_1").click(function() {
        location.href="${pageContext.request.contextPath}/admin/orderManage/order"
    });
          
    $("#btn_2").click(function() {
        location.href="${pageContext.request.contextPath}/admin/orderManage/delivery"
    });
          
    $("#btn_3").click(function() {
        location.href="${pageContext.request.contextPath}/admin/orderManage/refund"
    });

    $("#btn_4").click(function() {
        location.href="${pageContext.request.contextPath}/admin/orderManage/done"
    });
});
</script>

<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}
$(function() {
	$(".btn-prepare-order").click(function(){
		let orderNum = $(this).attr("data-orderNum");
		
		document.invoiceNumberForm.orderNum.value = orderNum;
		
		modalOn();
		
	});	
});

//송장번호 등록
$(function(){
	$(".btnInvoiceNumberOk").click(function(){
		const f = document.invoiceNumberForm;
		if(! f.invoiceNumber.value.trim()) {
			alert('송장 번호를 입력하세요');
			return false;
		}
		
		let invoiceNumber = f.invoiceNumber.value;
		let companyNum = f.companyNum.value;
		let orderNum = f.orderNum.value;
		let orderState = f.orderState.value;
		
		let qs = $('form[name=invoiceNumberForm]').serialize();
		
		let url = '${pageContext.request.contextPath}/admin/orderManage/detail/invoiceNumber';
		
		const fn = function(data) {
			if(data.state === "true") {
				
				f.reset();
				
				let url = "${pageContext.request.contextPath}/admin/orderManage/${orderStatus}";
				location.href = url;
			} else {
				alert("발송처리가 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});


//배송 변경(배송중/배송완료)
$(function(){
	$("body").on("click", ".btn-delivery-order", function(){
		const $EL = $(this);
		let orderNum = $EL.attr("data-orderNum");
		let preState = $EL.attr("data-orderState");
		
		let orderState = $EL.closest(".delivery-update-area").find("select").val();
		let orderStateInfo = $EL.closest(".delivery-update-area").find("select option:selected").text();
		
		if(preState >= orderState) {
			alert('배송 변경은 현 배송 단계보다 적거나 같을수 없습니다.');
			return false;
		}
		
		let qs = 'orderNum=' + orderNum + '&orderState=' + orderState;
		let url = '${pageContext.request.contextPath}/admin/orderManage/detail/delivery';

		const fn = function(data) {
			if(data.state === "true") {
				
				let url = "${pageContext.request.contextPath}/admin/orderManage/${orderStatus}";
				location.href = url;
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});


//배송 변경(배송중/배송완료)
$(function(){
	$("body").on("click", ".btn-refund-order", function(){
		const $EL = $(this);
		let orderNum = $EL.attr("data-orderNum");
		let preState = $EL.attr("data-orderState");
		
		let orderState = $EL.closest(".refund-update-area").find("select").val();
		let orderStateInfo = $EL.closest(".refund-update-area").find("select option:selected").text();
		
		if(preState >= orderState) {
			alert('이전 단계나 같은 단계로 업데이트 할 수 없습니다.');
			return false;
		}
		
		let qs = 'orderNum=' + orderNum + '&orderState=' + orderState;
		let url = '${pageContext.request.contextPath}/admin/orderManage/detail/refund';

		const fn = function(data) {
			if(data.state === "true") {
				
				let url = "${pageContext.request.contextPath}/admin/orderManage/${orderStatus}";
				location.href = url;
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});


$(function() {
	$(".orderStatus-update").click(function(){
		let dlg = $("#orderDetailModal").dialog({
			  autoOpen: false,
			  modal: true,
			  buttons: {
			       " 닫기 " : function() {
			    	   $(this).dialog("close");
			       }
			  },
			  height: 550,
			  width: 1000,
			  title: "주문상세정보",
			  close: function(event, ui) {
			  }
		});
		
		let orderNum = $(this).attr("data-orderNum");
		let orderStatus = "${orderStatus}";
		let url = "${pageContext.request.contextPath}/admin/orderManage/detail/info"
		let query = "orderNum=" + orderNum + "&orderStatus=" + orderStatus;
		
		const fn = function(data){
			$('#orderDetailModal').html(data);
			dlg.dialog("open");
		};
		
		ajaxFun(url, "post", query, "html", fn);
	});
	
});

$(function() {
	$(".makeInvoiceNumber").click(function(){
		var now = new Date();
		var ny = (String)(now.getFullYear());
		var nm1 = (String)(now.getMonth() + 1);
		var nd = (String)(now.getDate());
		var nh = (String)(now.getHours()); 
		var nm2 = (String)(now.getMinutes());
		var ns = (String)(now.getSeconds());
		var orderNum = $("form[name=invoiceNumberForm] input[name=orderNum]").val();
		let query = ny+nm1+nd+nh+nm2+ns+orderNum;
		$("#invoiceNumber").val(query);
	});
	
});
</script>
 
<div class="out">

    
    <div class="body-main">

    <div class="body-title">
		<h2><i class="fa-solid fa-user"></i> 주문 목록 </h2>
    </div>
    

<div class="body-main">
    <div class="tab-menu" style="border: none;">
    	 <div class="tab">
	        <button type="button" class="tab-button ${orderStatus=='order'?'active':'' }" id="btn_1" >주문 관리</button>
	        <button type="button" class="tab-button ${orderStatus=='delivery'?'active':'' }" id="btn_2" >배송 관리</button>
	        <button type="button" class="tab-button ${orderStatus=='refund'?'active':'' }" id="btn_3" >환불 관리</button>
	        <button type="button" class="tab-button ${orderStatus=='done'?'active':'' }" id="btn_4" >구매 확정</button>
   		</div>
    </div>
    
    <div style="clear:both;"></div>
    
    <div>
        <div id="table1" style="padding: 0px;">
        	<div style="text-align: right; margin-top: 15px;">
        		${dataCount }개(${page}/${total_page}페이지)
        	</div>
           <table class="table table-border table-list" style="margin-top: 10px;">
		  		<thead style="background: #dee2e6; color: #333;">
					<tr style="border-bottom: 1px solid #ced4da; border-top: 1px solid #ced4da">
						<th class="wx-80">주문 번호</th>
						<th class="wx-100">${state== 1|| state==3 ? '주문 상태' : state==2? '배송 상태' : '환불 상태' }</th>
						<th class="wx-100">주문자</th>
						<th class="wx-80">${state==1 ? '주문 일자' :  state== 2 ? '배송 일자' : state== 4 ? '환불 일자' : '확정 일자' }</th>
						<th class="wx-130">결제 금액</th>
						<th class="wx-130">${state== 1|| state==3? '주문 수량' :  state==2? '송장 번호' : '취소 수량' }</th>
						<th class="wx-100">환불 요청</th>
						<c:if test="${state !=3  || state == 8 }">
						<th class="wx-100">변경</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<td>${dto.orderNum }</td>
								<td>${dto.orderStateInfo }</td>
								<td>${dto.userName }</td>
								<td>${dto.orderStateDate}</td>
								<td>${dto.totalPurchasePrice}</td>
								<td>${state== 1 || state== 4 ? dto.totalQty : state== 2 ? dto.invoiceNumber : dto.userName}</td>
								<td>${state == 4 ? "환불" : "--"}</td>
								<c:if test="${ state !=3 || state == 8 }">
								<td>
								<button type="button" class="btn orderStatus-update" data-orderNum="${dto.orderNum}" >${orderStatus=="order"?"주문상세":"배송변경"}</button>
								  <c:if test="${state == 1}">
								       <button type="button" style="margin: 7px;" class="btn btn-prepare-order" data-orderNum="${dto.orderNum}" >발송처리</button>
								  </c:if>
								</td>
								</c:if>
							</tr>
				  </c:forEach>
				  	</tbody>
            </table>
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 정보가 없습니다." : paging}
			</div>
			
				<table class="table">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/orderManage/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/admin/orderManage/list" method="post">
						<select name="condition" class="form-select">
							<option value="itemNum" ${col=="orderNum"?"selected='selected'":""}>주문번호</option>
							<option value="itemName" ${col=="userName"?"selected='selected'":""}>회원</option>
							<option value="itemName" ${col=="invoiceNumber"?"selected='selected'":""}>송장번호</option>
						</select>
						
						<input type="text" name="kwd" value="${kwd}" class="form-control">
						<input type="hidden" name="size" value="${size}">
						<input type="hidden" name="orderNum" value="${orderNum}">
						<input type="hidden" name="page" value="${page}">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
			</tr>
		 </table>
        </div>
</div>
      </div>
	</div>
</div>


<div id="orderDetailModal" style="display: none;"></div>
<div id="orderDeliveryModal" style="display: none;"></div>

<div id="modal" class="modal-overlay">
    <div class="modal-window">
       <div class="modal-top">
        <div class="title">
            <h2>발송처리</h2>
        </div>
        <div class="close-area">X</div> 
      </div>     

	 <form name="invoiceNumberForm" method="post">
            <div class="content">송장 번호 : 
                    <input type="text" id="invoiceNumber" name="invoiceNumber" class="modalinput"> 
            </div>
            <div class="content">택배 업체 : 
                <select class="modalinput" name="companyNum">
                  <c:forEach var="vo" items="${listDeliveryCompany}">
           			<option value="${vo.companyNum}">${vo.companyName}</option>
         		 </c:forEach>
                </select>
            </div>
            <input type="hidden" name="orderNum" value="">
            <input type="hidden" name="orderState" value="2">
            <div style="text-align: center; margin: 10px;">
             <button type="button" class="btn makeInvoiceNumber" style="margin-top: 20px;" data-orderNum="${dto.orderNum}" >운송장 생성</button>
             <button type="button" class="btn btnInvoiceNumberOk" style="margin-top: 20px;" data-orderNum="${dto.orderNum}" data-orderState="${dto.orderState}">배송등록</button>
            </div>
        </form> 
    </div>
</div>

<script>
const modal = document.getElementById("modal")

function modalOn() {
   modal.style.display = "flex"
}
        
function isModalOn() {
   return modal.style.display === "flex"
}
function modalOff() {
    modal.style.display = "none"
}
        
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
      modalOff();
})
</script>

