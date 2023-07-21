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


function settingsInput(option, value) {
	const startDateObj = document.getElementById("startDate");
	const endDateObj = document.getElementById("endDate");
	
	let date = new Date();
	let y = date.getFullYear();
	let m = date.getMonth()+1;
	let d = date.getDate();
	
	endDateObj.value = dateToString(date);
	
	if(option === "day") {
		startDateObj.value = dateToString(date);
	} else if(option === "week") {
		startDateObj.value = dateToString(new Date(y, m-1, d-7));
	} else if(option === "month") {
		let last = (new Date(y, m-value, 0)).getDate();
		if(d > last) {
			d = last;
		}
		startDateObj.value = dateToString(new Date(y, m-1-value, d+1));
	} else if(option === "year") {
		startDateObj.value = dateToString(new Date(y-value, m-1, d+1));
	}
}

function searchList() {
	const f = document.searchForm;
	
	if(! isValidDateFormat(f.startKeyword.value)) {
		f.startKeyword.focus();
		return;
	}
	
	if(! isValidDateFormat(f.endKeyword.value)) {
		f.endKeyword.focus();
		return;
	}
	
	if(diffDays(f.startKeyword.value, f.endKeyword.value) < 0) {
		alert("시작일은 종료일보다 클수 없습니다.");
		f.startKeyword.focus();
		return;
	}

	if(diffDays(f.endKeyword.value, dateToString(new Date())) < 0) {
		alert("종료일은 오늘보다 클수 없습니다.");
		f.endKeyword.focus();
		return;
	}
	
	
}

// 날짜를 문자열로
function dateToString(date) {
	let y = date.getFullYear();
	let m = date.getMonth() + 1;
    if(m < 10) m='0'+m;
    let d = date.getDate();
    if(d < 10) d='0'+d;
    
    return y + '-' + m + '-' + d;
}

// 문자열을 날짜로
function stringToDate(data) {
	if(! isValidDateFormat(data)) {
		throw "날짜 형식이 올바르지 않습니다.";
	}

	let format = /(\.)|(\-)|(\/)/g;
	data = data.replace(format, "");
    
	let y = parseInt(data.substring(0, 4));
	let m = parseInt(data.substring(4, 6));
	let d = parseInt(data.substring(6));
    
    return new Date(y, m-1, d);
}

function isValidDateFormat(data){
	if(data.length !== 8 && data.length !== 10) return false;
		
	let p = /(\.)|(\-)|(\/)/g;
	data = data.replace(p, "");
	if(data.length !== 8) return false;
	
	// let format = /^[12][0-9]{3}[0-9]{2}[0-9]{2}$/;
	let format = /^[12][0-9]{7}$/;
	if(! format.test(data)) return false;
    
	let y = parseInt(data.substring(0, 4));
	let m = parseInt(data.substring(4, 6));
	let d = parseInt(data.substring(6));

	if(m<1 || m>12) return false;
	let lastDay = (new Date(y, m, 0)).getDate();
	if(d<1 || d>lastDay) return false;
	
	return true;
}

// 두 날짜 사이의 일자 구하기
function diffDays(startDate, endDate) {
	if(! isValidDateFormat(startDate) || ! isValidDateFormat(endDate)) {
		throw "날짜 형식이 올바르지 않습니다.";
	}

	let format = /(\.)|(\-)|(\/)/g;
    startDate = startDate.replace(format, "");
    endDate = endDate.replace(format, "");
   
    let sy = parseInt(startDate.substring(0, 4));
    let sm = parseInt(startDate.substring(4, 6));
    let sd = parseInt(startDate.substring(6));
    
    let ey = parseInt(endDate.substring(0, 4));
    let em = parseInt(endDate.substring(4, 6));
    let ed = parseInt(endDate.substring(6));

    let fromDate = new Date(sy, sm-1, sd);
    let toDate = new Date(ey, em-1, ed);
    
    let sn = fromDate.getTime();
    let en = toDate.getTime();
    
    let diff = en-sn;
    let day = Math.floor(diff/(24*3600*1000));
    
    return day;
}
</script>

<script type="text/javascript">


function block(userId) {
	if(!confirm('이 회원의 정지를 해제하시겠습니까??')) {
		return;
	}
	 location.href='${pageContext.request.contextPath}/admin/memberManage/stopCancleMember?userId='+userId;
}

</script>

<script type="text/javascript">
	$(document).ready(function() {
          $("#btn_1").click(function() {
        	  location.href="${pageContext.request.contextPath}/admin/memberManage/list/general"
          });
          
          $("#btn_2").click(function() {
        	  location.href="${pageContext.request.contextPath}/admin/memberManage/list/stop"
          });
          $("#btn_3").click(function() {
        	  location.href="${pageContext.request.contextPath}/admin/memberManage/list/withdraw"
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

function profile(userId) {
	let dlg = $("#member-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 550,
		  width: 800,
		  title: "회원상세정보",
		  close: function(event, ui) {
		  }
	});

	let url = "${pageContext.request.contextPath}/admin/memberManage/profile";
	let query = "userId="+userId;
	
	const fn = function(data){
		$('#member-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}

function profile2(userId) {
	let dlg = $("#member-dialog2").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 등록 " : function() {
		    	   insertOk(userId); 
		       },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 400,
		  width: 360,
		  title: "회원 정지",
		  close: function(event, ui) {
		  }
	});

	let url = "${pageContext.request.contextPath}/admin/memberManage/profile2?userId="+userId;
	let query = null;
	
	const fn = function(data){
		$('#member-dialog2').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "get", query, "html", fn);
}

function insertOk(userId) {
	const f = document.insertstop;
	
	if(! f.stateCode.value) {
		f.stateCode.focus();
		return;
	}
	if(! $.trim(f.memo.value)) {
		f.memo.focus();
		return;
	}
	
	 f.action = "${pageContext.request.contextPath}/admin/memberManage/insertMemberState?userId="+userId;
	 f.submit();
}


</script>
 
<div class="out">

    
    <div class="body-main">

    <div class="body-title">
		<h2><i class="fa-solid fa-user"></i> 회원 목록 </h2>
    </div>
    
        <div style="margin-bottom: 10px">
		<h4 ><i class="fa-solid fa-magnifying-glass"></i> 회원 검색 </h4>
	    </div>
	    
	    <div class="body-main">
	    	
	    	<form name="searchForm" action="${pageContext.request.contextPath}/admin/memberManage/list/${state}" method="post">
				<table class="table table-border table-form">
					<tr> 
						<td style="border-top: 1px solid #ced4da;">검색어</td>
						<td style="border-top: 1px solid #ced4da;"> 
							<div style="display: inline-block;">
								<select name="condition1" class="category" >
								    <option value="userId" ${condition1=="userId"?"selected='selected'":""}> 아이디 </option>
								    <option value="userName" ${condition1=="userName"?"selected='selected'":""}> 이름 </option>
								</select>
							</div>
							<div style="display: inline-block; width: 200px;" >
						    	<input style="margin-left: 0px;" type="text" name="keyword" maxlength="100" class="form-control" placeholder="검색값" value="${keyword }">
							</div>
			            </td>
					</tr>
					
					<tr> 
						<td>기간 </td>
						<td> 
						   <div style="display: inline-block;">
								<select name="condition2" class="category">
								    <option value="regDate" ${condition2=="regDate"?"selected='selected'":""}> 가입일자 </option>
								    <c:if test="${state =='withdraw' }">
									    <option value="stRegDate" ${condition2=="stRegDate"?"selected='selected'":""}> 탈퇴일자 </option>
									</c:if>
								    <c:if test="${state !='withdraw' }">
									    <option value="stRegDate" ${condition2=="stRegDate"?"selected='selected'":""}> 상태처리일자 </option>
									</c:if>
									
								</select>
							</div>
							<div style="display: inline-block; text-align: right; width: 13.9%; ">
						    	<input style="border-color: #999;" type="date" id="startDate" name="startKeyword" maxlength="100" class="form-control" value="${startKeyword}">
							</div>
							<span>~</span>
							<div style="display: inline-block; text-align: left; width: 13.9%">
						    	<input  style="border-color: #999;" type="date" id="endDate" name="endKeyword" maxlength="100" class="form-control" value="${endKeyword}" >
							</div>
							<div style="display: inline-block;">
							<button type="button" class="btn1" onclick="settingsInput('day', 0);">오늘</button>
       						<button type="button" class="btn1" onclick="settingsInput('week', 1);">1주일</button>
					        <button type="button" class="btn1" onclick="settingsInput('month', 1);">1개월</button>
					        <button type="button" class="btn1" onclick="settingsInput('month', 3);">3개월</button>
					        <button type="button" class="btn1" onclick="settingsInput('month', 6);">6개월</button>
					        <button type="button" class="btn1" onclick="settingsInput('year', 1);">1년</button>
							</div>
							<div style="display: inline-block; margin-left: 10px;">
								 <button type="submit" class="btn1 " onclick="searchList();">검색</button> 						
						     </div>
					    </td>
					</tr>
				</table>
			</form>
	   
      <table class="table" style="margin-top: 50px;">
			<tr>
			  <td>
			    <div>
				   <h4><i class="fa-solid fa-user-check"></i> 회원 목록 </h4>
		        </div>
              </td>

			</tr>
		</table>
		
    <div class="tab-menu" style="border: none;">
    	 <div class="tab">
	        <button type="button" class="tab-button ${state=='general'?'active':'' }" id="btn_1" >정상 회원</button>
	        <button type="button" class="tab-button ${state=='stop'?'active':'' }" id="btn_2" >정지 회원</button>
	        <button type="button" class="tab-button ${state=='withdraw'?'active':'' }" id="btn_3" >탈퇴 회원</button>
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
						<th class="wx-80">회원 코드</th>
						<th class="wx-100">회원 아이디</th>
						<th class="wx-100">회원 이름</th>
						<th class="wx-80">상태</th>
						<th class="wx-130">가입일자</th>
						<c:if test="${state !='withdraw' }">
							<th class="wx-130">상태처리일자</th>
						</c:if>
						<c:if test="${state =='withdraw' }">
							<th class="wx-130">탈퇴일자</th>
						</c:if>
						<th class="wx-200">마지막 로그인</th>
						<c:if test="${state !='withdraw' }">
							<th class="wx-200">관리</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="dto" items="${list}">
							<tr class="pointhover" style="height: 55.8px;">
								<td>${dto.num }</td>
								<td   style="cursor: pointer;" onclick="profile('${dto.userId}');">
									${dto.userId }
								</td>
								<td style="cursor: pointer;" onclick="profile('${dto.userId}');">${dto.userName }</td>
								<td style="cursor: pointer;" onclick="profile('${dto.userId}');">${dto.enabled==1? "정상":"정지" }</td>
								<td style="cursor: pointer;" onclick="profile('${dto.userId}');">${not empty dto.regDate? dto.regDate:"--"}</td>
								<td style="cursor: pointer;" onclick="profile('${dto.userId}');">${not empty dto.stRegDate? dto.stRegDate:"--"}</td>
								<td style="cursor: pointer;" onclick="profile('${dto.userId}');">${empty dto.lastLogin ? "--":dto.lastLogin }</td>
									<c:if test="${state !='withdraw' }">
										<td>
									<c:if test="${state=='general'}">
											<button class="btn" onclick="profile2('${dto.userId}');" style="width: 50px; height: 35px;">정지</button> 
									</c:if>
										<c:if test="${state=='stop'}">
											<button class="btn" onclick="block('${dto.userId}');" style="height: 35px;">정지 해제</button> 
										</c:if>
									</td>
									</c:if>
							</tr>
				  </c:forEach>
				  	</tbody>
            </table>
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 회원이 없습니다." : paging}
			</div>
        </div>
</div>

    
		
      </div>
	</div>
</div>

<div id="member-dialog" style="display: none;"></div>
<div id="member-dialog2" style="display: none;"></div>
