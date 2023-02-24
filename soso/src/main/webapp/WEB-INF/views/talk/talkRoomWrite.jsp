<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/message.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/talk/talk.css">
<!-- 채팅방 생성 시작 -->
<div class="page-main-talk">    
<div class="talk">
   <div class="text-align-center"><span class="talk-title" onclick="location.href='talkList.do'">SoSoTalk</span></div> 	
   <div class="talk-make-body">
	<form action="talkRoomWrite.do" method="post" id="talk_form">
		<input type="hidden" name="members" id="user"
		 data-id="${user.mem_id}" value="${user.mem_num}">
		<ul>
			<li>
				<label>채팅방 이름</label>
				<input type="hidden" 
				  name="talkroom_name" id="talkroom_name">
				<span id="name_span"></span>
				<input type="checkbox" checked 
				 id="name_checked">(자동생성)  
			</li>
			<li>
				<label>채팅회원검색</label>
				<input type="text" id="member_search" autocomplete="off">
				<ul id="search_area"></ul>
				<div id="talk_member"></div>   
			</li>
		</ul>
		<div class="talk-make-btn">
			<input type="submit" value="만들기">
			<input type="button" value="목록" onclick="location.href='talkList.do'">
		</div>       
	</form>
	</div>
</div>
</div><!-- end of page-main-talk -->
<!-- 채팅방 생성 끝 --> 




