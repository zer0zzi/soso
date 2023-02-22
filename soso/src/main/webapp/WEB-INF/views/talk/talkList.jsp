<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/talk/talk.css">
<!-- 채팅목록 시작 -->
<div class="page-main-talk">

<div class="talk">
	<div class="text-align-center"><span class="talk-title">채팅목록</span></div> 
	<form action="talkList.do" id="search_form"
	                                method="get">
		<div class="search">
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			    <input type="submit" value="찾기">
				<input type="button" value="목록"
				   onclick="location.href='talkList.do'">
				<input type="button" value="채팅방생성" onclick="location.href='talkRoomWrite.do'">				   
		</div>                                
	</form>
	<c:if test="${empty list}">
	<div class="result-display">표시할 채팅방이 없습니다.</div>
	</c:if>
	<c:if test="${!empty list}">
	<div class="talklist-list">
		<c:forEach var="talk" items="${list}">
		<div class="talklist-box" onclick="location.href='talkDetail.do?talkroom_num=${talk.talkroom_num}'">
			<div class="box-left">
					<span class="box-left-name">${fn:substring(talk.talkroom_name,0,15)}(${talk.room_cnt})</span>
					<br>                            
					<span class="box-left-message">${fn:substring(talk.talkVO.message,0,15)}</span>
			</div>
			<div class="box-right">
				<c:if test="${!empty talk.talkVO.chat_date}">${talk.talkVO.chat_date}</c:if>
				<c:if test="${empty talk.talkVO.chat_date}">${talk.talkroom_date}</c:if>
			</div>
			<div class="bothclear"></div>
		</div>
		</c:forEach>
	</div>
	</c:if>
</div><!-- end of talk-->	

</div><!-- end of page-main-talk -->


  <script src="${pageContext.request.contextPath}/js/talk/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/talk/popper.js"></script>
  <script src="${pageContext.request.contextPath}/js/talk/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/talk/main.js"></script>
<!-- 채팅목록 끝 -->












