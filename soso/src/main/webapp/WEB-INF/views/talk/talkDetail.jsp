<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 채팅하기 시작 -->
<script type="text/javascript"src="${pageContext.request.contextPath}/js/message.js"></script>
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/talk/talk.css">
<!-- 채팅목록 시작 -->
<div class="page-main-talk">
<div id="talkDetail" class="talk">
   <div class="text-align-center"><span class="talk-title" onclick="location.href='talkList.do'">SoSoTalk</span></div> 	
			<div class="chat-name">
				<div class="chat-name-left">채팅방:</div>
				<div class="chat-name-right"><b>${talkRoomVO.talkroom_name}</b></div>
				<div class="bothclear"></div>
			</div>
			<div class="chat-members-left">
				채팅 멤버:
				<c:forEach var="talkVO" items="${list}" varStatus="status">										
					<c:if test="${status.last}">(${status.count}명)</c:if>
				</c:forEach>
			</div>
			<div class="chat-members">
				<c:forEach var="talkVO" items="${list}" varStatus="status">					
					<c:if test="${status.index >0}">, </c:if>
					${talkVO.mem_id}
				</c:forEach>
			</div>
			<div class="chat-exit">
					<span id="delete_talkroom"><br>채팅방 나가기</span>
			</div>
			<div class="bothclear"></div>
			<div id="chatting_message"></div>
			<form action="" method="post" id="detail_form">
				<input type="hidden" name="talkroom_num" id="talkroom_num" value="${talkRoomVO.talkroom_num}"> 
				<input type="hidden" name="mem_num" id="mem_num" value="${user.mem_num}">
				<ul class="chatform-bottom">
					<li>
						<label for="message"></label> 
						<textarea rows="5"cols="40" name="message" id="message" class="chatting_message_bottom"></textarea> 
					</li>
					<li>
						<input type="submit" value="전송" class="chat-submit-btn">
					</li>
				</ul>
			</form>
</div>
<!-- end of talk-->
</div>
<!-- end of page-main-talk -->
<!-- 채팅목록 끝 -->











