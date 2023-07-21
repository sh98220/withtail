<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.submenu-layout {
	box-sizing: content-box;
	background-color: #f8f8f8;
	border-radius: 75px;
	display: flex;
	align-items: center;
	width: 22%;
	max-width: 800px;
	margin-top: 80px;
	overflow-x: auto;
}

.submenu-layout ul {
	display: flex;
	list-style-type: none;
	padding: 0;
}

.submenu {
	cursor: pointer;
	border-radius: 60px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex: 1;
	min-width: 80px;
	height: 32px;
}

.submenu.active {
	background-color: #82ae46;
	color: white;
}

a {
	color: #8b8b8b;
}

.submenu.active {
	background-color: #82ae46;
	color: white;
}

.-min {
	min-height: 550px;
}

.delivery-container {
    padding: 30px 0;
    align-items: flex-start;
    background-color: white;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 100%;
}

.title {
    color: black;
    text-align: center;
    width: fit-content;
    font-size: 24px;
    font-weight: 700;
}

.delivery-layout {
    align-items: flex-start;
    align-self: stretch;
    display: flex;
    flex-direction: column;
    gap: 25px;
}

.delivery-layout.dialog {
    margin: 0 !important;
}

input {
	width: 100%;
}

.charCount {
	text-align: right;
    font-size: 12px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: flex-end;
}

.btn-light {
    color: #ffffff;
    background-color: #82ae46;
}

.btn-1 {
	width: 150px;
    height: 48px;
    border-radius: 5px;
    border: none;
    color: white;
    background-color: #82ae46;
}

.btn-1:hover {
	background-color: #629817;
}

.btn-2 {
	width: 150px;
    height: 48px;
    border-radius: 5px;
    border: solid 1px #82ae46;
    color: #82ae46;
    background-color: white;
}

.checkbox {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 5px;
}

.icon-text-layout {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex: 1;
    gap: 5px;
}
  
</style>

<script>
function deliveryOk() {
	const f = document.deliveryForm;
	
	let str;

	str = f.addName.value;
    if( !/^[가-힣]{2,5}$/.test(str) || str.length > 20) {
    	f.addName.focus();
        return;
    }
    
    str = f.tel.value;
    if( !/^\d{3}-\d{3,4}-\d{4}$/.test(str) ) {
        f.tel.focus();
        return;
    }
    
    
    str = f.memo.value;
    if(str.length > 100) {
    	f.memo.focus();
    	return;
    }
    
	
	
	f.action = "${pageContext.request.contextPath}/myPage/${mode}";
	f.submit();
} 


</script>


<div class="container -min">
	<div class="submenu-layout">
	  <ul>
	    <li><a class="submenu active" href="${pageContext.request.contextPath}/myPage/myPage">내 계정</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/orders">주문조회</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/favorite">즐겨찾기</a></li>
	  </ul>
	</div>
	<div class="delivery-container">
		<div class="title">
			자주 쓰는 배송지
		</div>	
		<div class="delivery-layout dialog">	
			<div style="width: 100%;">
				<form name="deliveryForm" method="post">
					<div class="row mb-3 align-items-end">
					    <label class="col-sm-2 col-form-label" for="addName">이름</label>
					    <div class="col-sm-5">
					        <div class="input-group">
					            <input type="text" id="addName" value="${dto.addName}" name="addName" class="form-control" placeholder="받으실 분의 이름을 입력해주세요.*" onkeyup="checkUsernameValidity(); updateCharacterCount1(this);" style="margin-right: 22px;" maxlength="20">
					            <div id="characterCount1" class="charCount">0/20</div>
					        </div>
					        <div id="usernameError" style="color: #da1e28;"></div>
					    </div>
					</div>	           	
					<div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="zip">우편번호</label>
				        <div class="col-sm-5">
				       		<div class="input-group">
				           		<input type="text" name="zip" id="zip" class="form-control" placeholder="우편번호" value="${dto.zip}" readonly="readonly">
			           			<button class="btn btn-light" type="button" style="margin-left: 3px;" onclick="daumPostcode();">우편번호 검색</button>
				           	</div>
						</div>
				    </div>
			
				    <div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="addr1">주소</label>
				        <div class="col-sm-10">
				       		<div>
				           		<input type="text" name="addr1" id="addr1" class="form-control" placeholder="기본 주소" value="${dto.addr1}" readonly="readonly" >
				           	</div>
				       		<div style="margin-top: 5px;">
				       			<input type="text" name="addr2" id="addr2" class="form-control" placeholder="상세 주소" value="${dto.addr2}" maxlength="80" onkeyup="updateCharacterCount2(this);">
								<div id="characterCount2" class="charCount">0/80</div>
							</div>
						</div>
				    </div>
				    
				    <div class="row mb-3 align-items-end">
					    <label class="col-sm-2 col-form-label" for="tel">연락처</label>
					    <div class="col-sm-5">
					        <div class="input-group">
					            <input type="text" id="phone" name="tel" value="${dto.tel}" class="form-control" placeholder="연락처를 입력해주세요.*" onkeyup="checkPhoneNumberValidity();" style="margin-right: 22px;" maxlength="20">
					        </div>
					        <div id="phoneError" style="color: #da1e28;"></div>
					    </div>
					</div>
				   
				    <div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="addr1">요청사항</label>
				        <div class="col-sm-10">
				       		<div>
				           		<input type="text" id="request" name="memo" list="request_options" class="form-control" placeholder="배송 요청 사항을 직접 입력하거나 선택해주세요." onkeyup="updateCharacterCount3(this);" value="${dto.memo}"  maxlength="100">
				          		<datalist id="request_options">
									    <option value="대문 앞에 놓아주세요"></option>
									    <option value="택배함에 넣어주세요"></option>
									    <option value="경비실에 맡겨주세요"></option>
									    <option value="부재시 연락주세요"></option>
								</datalist>
								<div id="characterCount3" class="charCount">0/100</div>
				           	</div>
				           	<div id="requestError" style="color: #da1e28;"></div>
						</div>
				    </div>	
				    <div class="row mb-3">
				    	<c:choose>
				    		<c:when test="${dto.addDef eq 1}">
				        		<label class="col-sm-2 col-form-label" style="padding-left: 0px;"><input type="checkbox" style="width: 23%" onchange="changeTextColor(this)" name="addDef" checked="checked">기본 배송지로 설정</label>
				 			</c:when>
				 			<c:otherwise>
				 				<label class="col-sm-2 col-form-label" style="padding-left: 0px;"><input type="checkbox" style="width: 23%" onchange="changeTextColor(this)" name="addDef">기본 배송지로 설정</label>
				 			</c:otherwise>
				 		</c:choose>
				    </div>	
				    <div style="text-align: center;">
				    	<button type="button" class="btn-1" onclick="deliveryOk();">${mode=='update'?'수정':'등록'}</button>
				  	  	<button type="button" class="btn-2"  onclick="location.href='${pageContext.request.contextPath}/myPage/delivery'" >취소</button>
				   		<c:if test="${mode=='update'}">
								<input type="hidden" name="addNum" value="${dto.addNum}">
						</c:if>
				    </div>								
				</form>
			</div>
		</div>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
}

// 이름 유효성 검사 및 이벤트 효과
function checkUsernameValidity() {
    var input = document.getElementById("addName");
    var errorDiv = document.getElementById("usernameError");
    var regex = /^[가-힣]+$/; 
    
    if (!regex.test(input.value)) { 
        input.style.borderColor = "#da1e28"; 
        errorDiv.textContent = "한글만 입력 가능합니다.";
        
    } else if(input.value.length > 20) {
        input.style.borderColor = "#da1e28"; 
        errorDiv.textContent = "20자 이내로 입력하십시오.";
 	
    } else {
        input.style.borderColor = ""; 
        errorDiv.textContent = ""; 
    }    
}

function checkPhoneNumberValidity() {
    var input = document.getElementById("phone");
    var errorDiv = document.getElementById("phoneError");
    var regex = /^\d{3}-\d{3,4}-\d{4}$/; 

    if (!regex.test(input.value)) { 
        input.style.borderColor = "#da1e28";
        errorDiv.textContent = "올바른 핸드폰 번호를 입력해주세요."; 
    } else { 
        input.style.borderColor = "#ced4da"; 
        errorDiv.textContent = "";
    }
}

function checkRequestValidity() {
    var input = document.getElementById("request");
    var errorDiv = document.getElementById("requestError");

    if (input.value.length > 100) { 
        input.style.borderColor = "#da1e28"; 
        errorDiv.textContent = "최대 100자까지 입력 가능합니다."; 
        
        
    } else { 
        input.style.borderColor = "#ced4da"; 
        errorDiv.textContent = "";
    }
}
	
	

function updateCharacterCount1(input) {
    var maxLength = input.getAttribute("maxlength");
    var currentLength = input.value.length;
    var characterCountElement = document.getElementById("characterCount1");

    characterCountElement.textContent = currentLength + "/" + maxLength;
}

function updateCharacterCount2(input) {
    var maxLength = input.getAttribute("maxlength");
    var currentLength = input.value.length;
    var characterCountElement = document.getElementById("characterCount2");

    characterCountElement.textContent = currentLength + "/" + maxLength;
}

function updateCharacterCount3(input) {
    var maxLength = input.getAttribute("maxlength");
    var currentLength = input.value.length;
    var characterCountElement = document.getElementById("characterCount3");

    characterCountElement.textContent = currentLength + "/" + maxLength;
}

function changeTextColor(checkbox) {
    var label = checkbox.parentElement;
    if (checkbox.checked) {
        label.style.color = "rgb(68 148 241)";
        checkbox.value = 1;
    } else {
        label.style.color = "";
        checkbox.value = 0;
    }
}



</script>

