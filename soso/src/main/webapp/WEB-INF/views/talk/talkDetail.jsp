<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 채팅하기 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/message.js"></script>
<div id="talkDetail" class="page-main">
	<h2>${talkRoomVO.talkroom_name} 채팅방</h2>
	<div class="align-right">
		<input type="button" value="목록" onclick="location.href='talkList.do'">
		<input type="button" value="채팅방 나가기" id="delete_talkroom">
	</div>
	<p>
		채팅 멤버: 
		<c:forEach var="talkVO" items="${list}" varStatus="status">
			<c:if test="${status.index >0}">,</c:if>
			${talkVO.mem_id}
			<c:if test="${status.last}">(${status.count}명)</c:if>
		</c:forEach>
	</p>
	<div id="chatting_message"></div>
	<form action="" method="post" id="detail_form">
		<input type="hidden" name="talkroom_num" id="talkroom_num" value="${talkRoomVO.talkroom_num}">
		<input type="hidden" name="mem_num" id="mem_num" value="${user.mem_num}">
		<ul>
			<li>
				<label for="message">내용</label>
				<textarea rows="5" cols="40" name="message" id="message"></textarea>
				<input type="submit" value="전송">
			</li>
		</ul>
	</form>
</div>
<!-- 채팅하기 시작 -->













