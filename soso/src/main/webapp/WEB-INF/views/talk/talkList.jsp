<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 채팅목록 시작 -->
<div class="page-main">
	<h2>채팅목록</h2>
	<form action="talkList.do" id="search_form"
	                                method="get">
		<ul class="search">
			<li>
				<input type="search" name="keyword"
				 id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="찾기">
				<input type="button" value="목록"
				   onclick="location.href='talkList.do'">
			</li>
		</ul>                                
	</form>
	<div class="align-right">
		<input type="button" value="채팅방생성"
		      onclick="location.href='talkRoomWrite.do'">
	</div>
	<c:if test="${empty list}">
	<div class="result-display">표시할 채팅방이 없습니다.</div>
	</c:if>
	<c:if test="${!empty list}">
	<table class="striped-table">
		<c:forEach var="talk" items="${list}">
		<tr>
			<td style="text-align: left;">
				<a href="talkDetail.do?talkroom_num=${talk.talkroom_num}">
					<span>${talk.talkroom_name}(${talk.room_cnt})</span>
					<br>
					<span>${fn:substring(talk.talkVO.message,0,45)}</span>
				</a>
			</td>
			<td>
				<c:if test="${!empty talk.talkVO.chat_date}">${talk.talkVO.chat_date}</c:if>
				<c:if test="${empty talk.talkVO.chat_date}">${talk.talkroom_date}</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
</div>
<!-- 채팅목록 끝 -->












