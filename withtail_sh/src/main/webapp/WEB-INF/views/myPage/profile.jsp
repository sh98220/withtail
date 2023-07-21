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

.profile-setting {
    align-items: flex-start;
    background-color: white;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 100%;
    padding: 30px 0;
}

.profile-setting-title {
    color: black;
    font-size: 24px;
    font-weight: 700;
    margin-top: -1px;
    text-align: center;
    width: fit-content;
}

.profile-edit-container {
    align-items: flex-start;
    align-self: stretch;
    background-color: white;
    border: 1px solid;
    border-color: rgb(219 219 219);
    border-radius: 5px;
    display: flex;
    flex-direction: column;
    gap: 5px;
    justify-content: center;
    padding: 5px 0px;
}

.profile-edit-list {
    align-items: center;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 10px;
    justify-content: center;
}

.profile-edit-text-layout {
    align-items: center;
    border: 1px none;
    display: flex;
    flex: 1;
    gap: 10px;
    padding: 15px 25px;
}

.profile-edit-name {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 100px;
    align-self: start;
}

.profile-edit-name-text {
    margin-top: -1px;
    width: fit-content;
    color: var(--aloy-black);
    font-size: var(--font-size-16px);
    font-weight: 500;
    font-style: normal;
}

.valign-text-middle {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.profile-edit-value {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    flex: 1;
}

.profile-edit-value-text {
    color: rgb(91 91 91);
    font-size: 15px;
    font-weight: 400;
    font-style: normal;
    flex: 1;
    margin-top: -1px;
}

hr {
	width: 100%; 
	margin-bottom: 0px;
	margin-top: 0px;
}

.bottom-min-text {
    display: flex;
    flex-direction: row;
    gap: 15px;
    padding-left: 10px;
}
.text-logout {
    display: flex;
    font-size: 12px;
    font-weight: 300;
    font-style: normal;
    color: rgb(139 139 139);
}

.icon1-edit-layout {
    align-items: flex-end;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    gap: 10px;
    justify-content: center;
    padding: 20px 20px 20px 0px;
    width: fit-content;
}

.minimal-text-btn {
    align-items: flex-start;
    border: 1px none;
    display: flex;
    gap: 10px;
    padding: 2px;
    width: fit-content;
}

.text {
    margin-top: -1px;
    text-align: center;
    width: fit-content;
    color: rgb(139 139 139);
    font-size: 12px;
    font-weight: 400;
    font-style: normal;
}

.profile-edit-value.expanded {
    flex-direction: column;
    gap: 5px;
}

.text-input {
    align-items: flex-end;
    align-self: stretch;
    border: 1px none;
    display: flex;
    flex-direction: column;
    justify-content: center;
    flex: 1 1 auto;
    max-width: 100%;
    position: relative;
    margin: 0;
    padding: 0;
    margin-top: 0px !important;
    margin-bottom: 4px;
}

.inp5 {
    width: 100%;
    height: 50px;
    border-radius: 5px;
    border: solid 1px #e1e1e1;
}

.profile-edit-button-layout {
    align-items: flex-start;
    align-self: stretch;
    border: 1px none;
    display: flex;
    gap: 10px;
}

.btn20 {
    width: 188px;
    height: 50px;
    border-radius: 5px;
    border: none;
    color: white;
    background-color: #82ae46;
}

.btn22 {
    width: 188px;
    height: 50px;
    border-radius: 5px;
    border: solid 1px #82ae46;
    color: #82ae46;
    background-color: white;
}

.charCount {
	text-align: right;
    font-size: 12px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: flex-end;
}

.btn20:hover {
	background-color: #629817;
}

.shcus {
	width: 100%;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

input:focus {
	outline: solid 1px #82ae46;
}

input::placeholder {
	padding-left: 10px;
}

.inp7 {
	margin: 13px;
    border-radius: 5px;
    border: solid 1px #b0a8a8;
    height: 41px;
}


</style>

<script>
$(function() {
	var preUserName = '';
	var preNickName = '';
	
	$('#edit').click(function(e) {
		preUserName = $("#userName").val();
		
		$('#profile').hide();
		$('#editbutton').hide();
 
	    $('#profile-edit').show();
	});
	  
	$('#btn22-1').click(function() {
		// 프로필 값 표시(취소)
		$("#userName").val(preUserName);
		
		$('#profile').show();
		$('#editbutton').show();
		
		$('#profile-edit').hide();
	});
	
	
	
	$('#edit1').click(function(e) {
		preNickName = $("#nickName").val();
		
		$('#profile1').hide();
		$('#editbutton1').hide();
 
	    $('#profile-edit1').show();
	});
	  
	$('#btn22-2').click(function() {
		// 프로필 값 표시(취소)
		$("#nickName").val(preNickName);
		
		$('#profile1').show();
		$('#editbutton1').show();
		
		$('#profile-edit1').hide();
	});
	
	
	$('#edit2').click(function(e) {
		preEmail = $("#email").val();
		
		$('#profile2').hide();
		$('#editbutton2').hide();
 
	    $('#profile-edit2').show();
	});
	  
	$('#btn22-3').click(function() {
		// 프로필 값 표시(취소)
		$("#email").val(preEmail);
		
		$('#profile2').show();
		$('#editbutton2').show();
		
		$('#profile-edit2').hide();
	});


	$('#btn20-1, #btn20-2, #btn20-3').click(function() {
		let userName = $('#userName').val();
		let nickName = $('#nickName').val();
		let email = $('#email').val();
	
		if(! userName || !/^[가-힣]+$/.test(userName)) {
			$('#userName').focus();
			return;
		} 
		
		if(! nickName || nickName > 20) {
			$('#nickName').focus();
			return;			
		}
		
		
		updateName(userName, nickName, email);
		
		
	});
	
	function updateName(userName, nickName, email) {
		$.ajax({
			url: '${pageContext.request.contextPath}/myPage/updateProfileName',
	        type: 'POST',
	        data: { userName: userName,  nickName: nickName, email : email}, 
	        dataType: 'JSON',
	        success: function(data) {
	  		
	        	$(".profile-userName").text(userName);
	        	$(".profile-nickName").text(nickName);
	        	$(".profile-email").text(email);
	   	
	        	
	    		$('#profile').show();
	    		$('#editbutton').show();
	    		$('#profile-edit').hide();	   
	    		
	    		$('#profile1').show();
	    		$('#editbutton1').show();
	    		$('#profile-edit1').hide();		    		
        	
	    		$('#profile2').show();
	    		$('#editbutton2').show();
	    		$('#profile-edit2').hide();	
	      	
	        },
	        error: function(xhr, status, error) {
	  
	          alert('실패');
	        }
	      });
	}
});


$(function() {
	$('#updatePwd').click(function() {
		var currentPwd = $('#currentPwd').val();	
		var currentPwd1 = $('#currentPwd1').val();
		var confirmPasswordError = $('#confirmPasswordError');
		var userPwd = $('#newPwd').val();
		var confirmPwd = $('#confirmPwd').val();
		var confirmPasswordError1 =$('#confirmPasswordError1');
		
		
		if(currentPwd != currentPwd1) {
			confirmPasswordError.text("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		if(userPwd != confirmPwd) {
			confirmPasswordError1.text("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.");
			return;
		}
		
		updatePwd(userPwd);
	});
	
	function updatePwd(userPwd) {
		$.ajax({
		      url: "${pageContext.request.contextPath}/myPage/updatePwd",
		      type: "POST", 
		      data: { userPwd : userPwd },
		      dataType: "JSON",
		      success: function(data) {
		        console.log("비밀번호 변경 성공");
		        $('#exampleModal').modal('hide'); // 모달 숨기기
		        window.location.reload(); 
		      },
		      error: function(xhr, status, error) {
		       
		        console.error("비밀번호 변경 실패");
		      
		      }
		    });
	}
	
});

$(function() {
    $('#exampleModal').on('hidden.bs.modal', function () {
 
        $('#currentPwd').val('');
        $('#newPwd').val('');
        $('#confirmPwd').val('');
        $('#confirmPasswordError').text('');
        $('#confirmPasswordError1').text('');
    });
});


</script>

<div class="container -min">
	<div class="submenu-layout">
	  <ul>
	    <li><a class="submenu active" href="${pageContext.request.contextPath}/myPage/myPage">내 계정</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/orders">주문조회</a></li>
	    <li><a class="submenu" href="${pageContext.request.contextPath}/myPage/favorite">즐겨찾기</a></li>
	  </ul>
	</div>
	
	<div class="profile-setting">
		<p class="profile-setting-title">프로필</p>	
		<div class="profile-edit-container">
			<div class="profile-edit-list">
				<div class="profile-edit-text-layout">
					<div class="profile-edit-name">
						<div class="profile-edit-name-text valign-text-middle">
							이름
						</div>
					</div>
					
					<div class="profile-edit-value" id="profile">
						<div class="profile-edit-value-text valign-text-middle profile-userName">
							${dto1.userName}
						</div>
					</div>
					
				
					<form name="nameForm" class="profile-edit-value expanded">
						<div class="shcus" id="profile-edit" style="display: none;">
							<div class="text-input">
								<input type="text" class="inp5" id="userName"  onkeyup="checkUsernameValidity(); updateCharacterCount1(this);" maxlength="20" value="${dto1.userName}">
								<div id="characterCount1" class="charCount">0/20</div>
							</div>
							 <div id="usernameError" style="color: #da1e28; margin-top: -18px;"></div>
							<div class="profile-edit-button-layout">
								<button type="button" class="btn20" id="btn20-1">수정</button>
								<button type="button" class="btn22" id="btn22-1">취소</button>
							</div>
						</div>
					</form>
										
				</div>
		
				
				<div class="icon1-edit-layout" id="editbutton">
					<div class="minimal-text-btn">
						<a class="text valign-text-middle" id="edit" href="#">수정</a>
					</div>
				</div>
				
			</div>
			<hr>
			<div class="profile-edit-list" id="profile">
				<div class="profile-edit-text-layout">
					<div class="profile-edit-name">
						<div class="profile-edit-name-text valign-text-middle">
							닉네임
						</div>
					</div>
					
					
					<div class="profile-edit-value" id="profile1">
						<div class="profile-edit-value-text valign-text-middle profile-nickName">
							${dto1.nickName}
						</div>
					</div>
					
					
					<form name="nickNameForm" class="profile-edit-value expanded" >
						<div class="shcus" style="display: none;" id="profile-edit1">
							<div class="text-input">
								<input type="text" class="inp5" id="nickName" name="nickName"  onkeyup="updateCharacterCount2(this);" maxlength="20" value="${dto1.nickName}">
								<div id="characterCount2" class="charCount">0/20</div>
							</div>
							 <div id="phoneError" style="color: #da1e28; margin-top: -18px;"></div>
							<div class="profile-edit-button-layout">
								<button type="button" class="btn20" id="btn20-2">수정</button>
								<button type="button" class="btn22" id="btn22-2">취소</button>
							</div>
						</div>
					</form>	 
					
				</div>
				
				<div class="icon1-edit-layout" id="editbutton1">
					<div class="minimal-text-btn">
						<a class="text valign-text-middle" href="#" id="edit1">수정</a>
					</div>
				</div>
				 
			</div>
			<hr>
			<div class="profile-edit-list">
				<div class="profile-edit-text-layout">
					<div class="profile-edit-name">
						<div class="profile-edit-name-text valign-text-middle">
							이메일
						</div>
					</div>
					<div class="profile-edit-value" id="profile2">
						<div class="profile-edit-value-text valign-text-middle profile-email">
							${dto1.email}
						</div>
					</div>
					
					<form name="emailForm" class="profile-edit-value expanded" >
						<div class="shcus" style="display: none;" id="profile-edit2">
							<div class="text-input">
								<input type="text" class="inp5" id="email" name="email" value="${dto1.email}">
							</div>
							<div class="profile-edit-button-layout">
								<button type="button" class="btn20" id="btn20-3">수정</button>
								<button type="button" class="btn22" id="btn22-3">취소</button>
							</div>
						</div>
					</form>
					
				</div>
				
				<div class="icon1-edit-layout" id="editbutton2">
					<div class="minimal-text-btn">
						<a class="text valign-text-middle" href="#" id="edit2">수정</a>
					</div>
				</div>
				
			</div>	
			<hr>
			<div class="profile-edit-list">
				<div class="profile-edit-text-layout">
					<div class="profile-edit-name">
						<div class="profile-edit-name-text valign-text-middle">
							비밀번호
						</div>
					</div>
					<div class="profile-edit-value" id="profile3">
						<div class="profile-edit-value-text valign-text-middle ">
							**********
						</div>
					</div>					
				</div>
				
				<div class="icon1-edit-layout">
					<div class="minimal-text-btn">
						<a class="text valign-text-middle" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#">
						  수정
						</a>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" style="width: 355px;">
				    <div class="modal-content">
				      <div class="modal-header" style="border-bottom: none;">
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body" style="text-align: center; padding-bottom: 0px; font-size: 17px;">
				        비밀번호를 수정하시겠어요?
				      </div>
				      <input type="hidden" id="currentPwd1" value="${dto1.userPwd}">				     
				      <input type="password" placeholder="현재 비밀번호" class="inp7" id="currentPwd">
				      <div id="confirmPasswordError" style="color: #da1e28; margin-left: 17px;"></div>
				     
				      <input type="password" placeholder="새 비밀번호" class="inp7" id="newPwd">
				     
				      <input type="password" placeholder="새 비밀번호 확인" class="inp7" id="confirmPwd">			
				   	  <div id="confirmPasswordError1" style="color: #da1e28; margin-left: 17px;"></div>
				     
				      <div class="modal-footer" style="justify-content: center; border-top: none;">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 150px; height: 62px; border-radius: 5px; background-color: white; color: gray;">아니요</button>
				        <button type="button" class="btn btn-primary" style="width: 150px; height: 62px; border-radius: 5px;" id="updatePwd">예</button>
				      </div>
				    </div>
				  </div>
				</div>
											
			</div>
			
		</div>
		<div class="bottom-min-text">
			<a class="text-logout" href="${pageContext.request.contextPath}/myPage/unregister">회원탈퇴</a>
			<p class="text-logout"> | </p>
			<a class="text-logout" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>	
		</div>
	</div>
</div>

<script>
function updateCharacterCount1(input) {
    var maxLength = input.getAttribute("maxlength");
    var currentLength = input.value.length;
    var characterCountElement = document.getElementById("characterCount1");

    characterCountElement.textContent = currentLength + "/" + maxLength;
}

//이름 유효성 검사 및 이벤트 효과
function checkUsernameValidity() {
    var input = document.getElementById("userName");
    var errorDiv = document.getElementById("usernameError");
    var regex = /^[가-힣]+$/; // 정규식을 사용하여 한글 입력 패턴을 확인합니다.
    
    if (!regex.test(input.value)) { 
        input.style.borderColor = "#da1e28"; 
        errorDiv.textContent = "한글만 입력 가능합니다."; 
    } else {
        input.style.borderColor = ""; 
        errorDiv.textContent = ""; 
    }
}

function updateCharacterCount2(input) {
    var maxLength = input.getAttribute("maxlength");
    var currentLength = input.value.length;
    var characterCountElement = document.getElementById("characterCount2");

    characterCountElement.textContent = currentLength + "/" + maxLength;
}

</script>