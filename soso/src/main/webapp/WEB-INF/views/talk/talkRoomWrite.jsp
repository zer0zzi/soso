<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/message.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/talk/talk.css">
<!-- 채팅방 생성 시작 -->
<div class="page-main-talk">    
<div class="talk">
<div class="talklist-head">&nbsp;Make a room</div>
   <div class="talk-make-body">
	<form action="talkRoomWrite.do" method="post" id="talk_form">
		<input type="hidden" name="members" id="user"
		 data-id="${user.mem_id}" value="${user.mem_num}">
		<div class="makeroom-word">방 만들기</div>
		<div class="make-nameNmem">
			<div class="inputform-a">
				<input type="text" name="talkroom_name" id="talkroom_name" class="inputform" autocomplete="off" placeholder="Room Name">
			</div>
			<div>	
				<input type="checkbox" id="name_checked" class="chatauto"><span class="auto-word">자동생성</span>	
			</div>	
			<div class="inputform-b">
				<input type="text" id="member_search" class="inputform" autocomplete="off" placeholder="Member search">			   
			</div>
			<div id="search_area"></div>
			<div class="member-word">Member</div>
			<div>
				<div id="talk_member"></div>
			</div>	
		</div>
		<div class="make-btn-box">
			<input type="submit" value="Create!" class="bottom-btn-2">
 		</div>       
	</form>
	</div>
</div>
</div><!-- end of page-main-talk -->
<!-- 채팅방 생성 끝 --> 




