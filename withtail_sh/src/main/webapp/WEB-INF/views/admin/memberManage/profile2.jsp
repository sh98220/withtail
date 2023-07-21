<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!-- 정지모달시작 -->		
   <div id="modal" class="modal-overlay">
        <div class="modal-window" >
            <form id="insertstop" name="insertstop" method="post">
            <div class="content">회원 아이디 :&nbsp;&nbsp;${dto.userId }
            </div>
            <div class="content">정지 일자 : 
                    <input type="date" id="profile2date" name="stRegDate" value="${dto.stRegDate }" class="modalinput"> 
            </div>
            <div class="content">정지 사유 : 
                        <select  class="modalinput" name="stateCode">
                           <option value="1">패스워드 5회이상 실패</option>
                           <option value="2">불법적인 방법으로 로그인</option>
                           <option value="3">불건전 게시물 등록</option>
                           <option value="4">다른 유저 비방</option>
                           <option value="5">타계정 도용</option>
                           <option value="6">기타 약관 위반</option>
                           <option value="7">1년 이상 로그인하지 않음</option>
                        </select>
            </div>
            <div class="content">
            	<div>메모 :</div> <textarea name="memo" style="width: 260px; height: 76px;">없음</textarea>
            </div>
            </form>
        </div>
    </div>
    <!-- 정지모달 끝 -->