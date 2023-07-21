<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

.form-control {
   border-radius: 5px !important;
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
   align-items: center;
   background-color: white;
   border: 1px none;
   display: flex;
   flex-direction: column;
   width: 100%;
}

.title {
   color: black;
   text-align: center;
   width: fit-content;
   font-size: 24px;
   font-weight: 700;
}

.subTitle {
   color: black;
   text-align: center;
   width: fit-content;
   font-size: 15px;
   font-weight: 500;
}

.delivery-layout {
   align-items: center;
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
   font-size: 15px;
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
}

</style>

<div class="container -min">
   <div class="delivery-container">
      <div class="title">
         회원가입
      </div>
      <div class="title subTitle my-3">
         정보를 입력해주세요.
      </div>
      <div class="delivery-layout dialog">
         <div style="width:40%">
            <form name="memberForm" method="post" action="${pageContext.request.contextPath}/member/${mode}">
               <div>
                  <div>
                     <div class="input-group">
                        <input type="text" id="username" name="userName" maxlength="20" class="form-control" placeholder="이름*" onkeyup="updateCharacterCount1(this); updateSignupButton();">
                     </div>
                     <div class="d-flex">
                        <div id="usernameError" style="color: #da1e28;"></div>
                        <div id="characterCount1" class="charCount" style="margin-left:auto">0/20</div>
                     </div>
                  </div>
               </div>
               <div>
                  <div>
                     <div class="input-group">
                        <input type="text" id="userId" name="userId" maxlength="20" class="form-control" placeholder="아이디*" onkeyup="updateCharacterCount2(this); updateSignupButton(); updateIdButton();">
                        <button type="button" disabled="disabled" class="btn btn-light" id="idButton" style="border-radius: 5px" onclick="checkDuplicateId()">중복 검사</button>
                     </div>
                     <div class="d-flex">
                        <div id="userIdError" style="color: #da1e28;"></div>
                        <div id="characterCount2" class="charCount" style="margin-left:auto">0/20</div>
                     </div>
                  </div>
               </div>
               <div>
                  <div>
                     <div class="input-group">
                        <input type="text" id="nickName" name="nickName" maxlength="20" class="form-control" placeholder="닉네임*" onkeyup="updateCharacterCount3(this); updateSignupButton(); updateNicknameButton();">
                        <button type="button" disabled="disabled" class="btn btn-light" id="nickNameButton" style="border-radius: 5px" onclick="checkDuplicateNickname()">중복 검사</button>
                     </div>
                     <div class="d-flex">
                        <div id="nickNameError" style="color: #da1e28;"></div>
                        <div id="characterCount3" class="charCount" style="margin-left:auto">0/20</div>
                     </div>
                  </div>
               </div>
               <div>
                  <div>
                     <div class="input-group">
                        <input type="text" id="email" name="email" class="form-control" placeholder="이메일*" onkeyup="updateSignupButton();">
                     </div>
                     
                     <div id="emailError" style="color: #da1e28; min-height: 26px;"></div>
                     
                  </div>
               </div>
               <div>
                  <div>
                     <div class="input-group">
                        <input type="password" id="password" name="userPwd" class="form-control" placeholder="비밀번호*" onkeyup="updateSignupButton();">
                     </div>
                     
                     <div id="passwordError" style="color: #da1e28; min-height: 26px;"></div>
                     
                  </div>
               </div>
               <div>
                  <div>
                     <div class="input-group">
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="비밀번호 확인*" onkeyup="updateSignupButton();">
                     </div>
                     
                     <div id="confirmPasswordError" style="color: #da1e28; min-height: 26px;"></div>
                  </div>
               </div>
                <div class="row">
                  <p class="form-control-plaintext text-center">${message}</p>
                </div>
               <div style="text-align: center;">
                  <button type="submit" class="btn btn-light btn-1" id="signupButton" disabled="disabled">가입</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>

<script>

// 이름 유효성 검사 및 이벤트 효과
function checkUsernameValidity(input) {
   var errorDiv = document.getElementById("usernameError");
   var regex = /^[가-힣]+$/; // 정규식을 사용하여 한글 입력 패턴을 확인합니다.
   if (!input.value) {
      // 입력값이 없을 때 처리
      input.style.borderColor = ""; // 테두리 색상 초기화
      errorDiv.textContent = ""; // 에러 메시지 초기화
      return; // 유효성 검사 종료
   }
   if (!regex.test(input.value)) { // 입력값이 한글 패턴과 일치하지 않을 경우
      input.style.borderColor = "#da1e28"; // 테두리 색상을 빨간색으로 변경합니다.
      errorDiv.textContent = "한글만 입력 가능합니다."; // 에러 메시지를 표시합니다.
      return false; // 유효성 검사 실패를 반환합니다.
   } else {
      input.style.borderColor = ""; // 유효성 검사를 통과하면 테두리 색상을 초기화합니다.
      errorDiv.textContent = ""; // 에러 메시지를 초기화합니다.
      return true; // 유효성 검사 성공을 반환합니다.
   }
}

//이메일 유효성 검사 및 이벤트 효과
function checkEmailValidity(input) {
   var input = document.getElementById("email");
   var errorDiv = document.getElementById("emailError");
   var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 정규식을 사용하여 이메일 패턴을 확인합니다.
   if (!input.value) {
      // 입력값이 없을 때 처리
      input.style.borderColor = ""; // 테두리 색상 초기화
      errorDiv.textContent = ""; // 에러 메시지 초기화
      return; // 유효성 검사 종료
   }
   if (!regex.test(input.value)) { // 입력값이 이메일 패턴과 일치하지 않을 경우
      input.style.borderColor = "#da1e28"; // 테두리 색상을 빨간색으로 변경합니다.
      errorDiv.textContent = "유효한 이메일 주소를 입력해주세요."; // 에러 메시지를 표시합니다.
      return false; // 유효성 검사 실패를 반환합니다.
   } else {
      input.style.borderColor = ""; // 유효성 검사를 통과하면 테두리 색상을 초기화합니다.
      errorDiv.textContent = ""; // 에러 메시지를 초기화합니다.
      return true; // 유효성 검사 성공을 반환합니다.
   }
}

//비밀번호 유효성 검사 및 이벤트 효과
function checkPasswordValidity(input) {
   var errorDiv = document.getElementById("passwordError");
   if (!input.value) {
      // 입력값이 없을 때 처리
      input.style.borderColor = ""; // 테두리 색상 초기화
      errorDiv.textContent = ""; // 에러 메시지 초기화
      return; // 유효성 검사 종료
   }
   if (input.value.length < 8) { // 입력값의 길이가 8보다 작을 경우
      input.style.borderColor = "#da1e28"; // 테두리 색상을 빨간색으로 변경합니다.
      errorDiv.textContent = "비밀번호는 최소 8자 이상이어야 합니다."; // 에러 메시지를 표시합니다.
      return false; // 유효성 검사 실패를 반환합니다.
   } else {
      input.style.borderColor = ""; // 유효성 검사를 통과하면 테두리 색상을 초기화합니다.
      errorDiv.textContent = ""; // 에러 메시지를 초기화합니다.
      return true; // 유효성 검사 성공을 반환합니다.
   }
}

//비밀번호 확인 일치 여부 검사 및 이벤트 효과
function checkConfirmPasswordValidity(confirmPasswordInput) {
   var passwordInput = document.getElementById("password");
   var errorDiv = document.getElementById("confirmPasswordError");
   if (!confirmPasswordInput.value) {
      // 입력값이 없을 때 처리
      confirmPasswordInput.style.borderColor = ""; // 테두리 색상 초기화
      errorDiv.textContent = ""; // 에러 메시지 초기화
      return; // 유효성 검사 종료
   }
   if (passwordInput.value !== confirmPasswordInput.value) { // 비밀번호와 비밀번호 확인 값이 일치하지 않을 경우
      confirmPasswordInput.style.borderColor = "#da1e28"; // 테두리 색상을 빨간색으로 변경합니다.
      errorDiv.textContent = "비밀번호가 일치하지 않습니다."; // 에러 메시지를 표시합니다.
      return false; // 유효성 검사 실패를 반환합니다.
   } else {
      confirmPasswordInput.style.borderColor = ""; // 일치하면 테두리 색상을 초기화합니다.
      errorDiv.textContent = ""; // 에러 메시지를 초기화합니다.
      return true; // 유효성 검사 성공을 반환합니다.
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


function checkUserIdValidity(input) {
   var errorDiv = document.getElementById("userIdError");
   var regex = /^[a-zA-Z0-9]+$/; // 영문 대소문자와 숫자 입력 패턴을 확인하는 정규식
   if (!input.value) {
      // 입력값이 없을 때 처리
      input.style.borderColor = ""; // 테두리 색상 초기화
      errorDiv.textContent = ""; // 에러 메시지 초기화
      return; // 유효성 검사 종료
   }
   if (!regex.test(input.value)) {
     input.style.borderColor = "#da1e28";
     errorDiv.innerHTML = "아이디는 영문 대소문자와 숫자로만 입력해주세요.";
     return false; // 유효하지 않음을 나타내는 false 반환
   } else {
     input.style.borderColor = "#ced4da";
     errorDiv.innerHTML = "";
     return true; // 유효함을 나타내는 true 반환
   }
}

// 닉네임 유효성 검사 및 이벤트 효과
function checkNickNameValidity(input) {
   var errorDiv = document.getElementById("nickNameError");
   var regex = /^[가-힣0-9]+$/; // 한글과 숫자 입력 패턴을 확인하는 정규식
   if (!input.value) {
      // 입력값이 없을 때 처리
      input.style.borderColor = ""; // 테두리 색상 초기화
      errorDiv.textContent = ""; // 에러 메시지 초기화
      return; // 유효성 검사 종료
   }
   if (!regex.test(input.value)) {
     input.style.borderColor = "#da1e28";
     errorDiv.innerText = "닉네임은 한글과 숫자로만 입력해주세요.";
     return false; // 유효하지 않음을 나타내는 false 반환
   } else {
     input.style.borderColor = "#ced4da";
     errorDiv.innerText = "";
     return true; // 유효함을 나타내는 true 반환
   }
}
 

 function checkDuplicateId() {
    let userId = $("#userId").val();   
    var errorDiv = document.getElementById("userIdError");

      let url = "${pageContext.request.contextPath}/member/userIdCheck";
      let query = "userId=" + userId;
      
      $.ajax({
         type:"POST"
         ,url:url
         ,data:query
         ,dataType:"json"
         ,success:function(data) {
            let passed = data.passed;
            if(passed === "true") {
               let str = "<span style='color:blue; font-weight: bold;'>" + userId + " 아이디는 사용가능 합니다.</span>";
               $("#userIdError").html(str);
            } else {
               let str = "<span style='color:red; font-weight: bold;'>" + userId + " 아이디는 사용할수 없습니다.</span>";
               $("#userIdError").html(str);
               $("#userId").val("");
               $("#userId").focus();
            }
         }
      });
      
 }

 // 닉네임 중복 검사 함수
 function checkDuplicateNickname() {
    let nickName = $("#nickName").val();

      let url = "${pageContext.request.contextPath}/member/userNicknameCheck";
      let query = "nickName=" + nickName;
      
      $.ajax({
         type:"POST"
         ,url:url
         ,data:query
         ,dataType:"json"
         ,success:function(data) {
            let passed = data.passed;
            if(passed === "true") {
               let str = "<span style='color:blue; font-weight: bold;'>" + nickName + " 닉네임은 사용 가능 합니다.</span>";
               $("#nickNameError").html(str);
            } else {
               let str = "<span style='color:red; font-weight: bold;'>" + nickName + " 닉네임은 사용할 수 없습니다.</span>";
               $("#nickNameError").html(str);
               $("#nickName").val("");
               $("#nickName").focus();
            }
         }
      });
	      
 }
 
function updateSignupButton() {
	var usernameInput = document.getElementById("username");
	var userIdInput = document.getElementById("userId");
	var nickNameInput = document.getElementById("nickName");
	var emailInput = document.getElementById("email");
	var passwordInput = document.getElementById("password");
	var confirmPasswordInput = document.getElementById("confirmPassword");
	
	var usernameValid = checkUsernameValidity(usernameInput);
	var userIdValid = checkUserIdValidity(userIdInput);
	var nickNameValid = checkNickNameValidity(nickNameInput);
	var emailValid = checkEmailValidity(emailInput);
	var passwordValid = checkPasswordValidity(passwordInput);
	var confirmPasswordValid = checkConfirmPasswordValidity(confirmPasswordInput);
	
	var signupButton = document.getElementById("signupButton");
	
	if (usernameValid && userIdValid && nickNameValid && emailValid && passwordValid && confirmPasswordValid) {
	   signupButton.disabled = false; // 버튼 활성화
	} else {
	   signupButton.disabled = true; // 버튼 비활성화
	}
}

function updateNicknameButton() {
	var nickNameInput = document.getElementById("nickName");

	var nickNameValid = checkNickNameValidity(nickNameInput);
	
	var nickNameButton = document.getElementById("nickNameButton");
	
	if (nickNameValid) {
		nickNameButton.disabled = false; // 버튼 활성화
	} else {
		nickNameButton.disabled = true; // 버튼 비활성화
	}
}

function updateIdButton() {
	var userIdInput = document.getElementById("userId");

	var userIdValid = checkUserIdValidity(userIdInput);
	
	var idButton = document.getElementById("idButton");
	
	if (userIdValid) {
		idButton.disabled = false; // 버튼 활성화
	} else {
		idButton.disabled = true; // 버튼 비활성화
	}
}

</script>