<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/talk/talk.css">
<!-- 채팅목록 시작 -->
<div class="page-main-talk">
<div class="talk">
   <div class="text-align-center"><span class="talk-title" onclick="location.href='talkList.do'">SoSoTalk</span></div> 	
   <form action="talkList.do" id="search_form"
                                   method="get">
      <div class="search">
            <input type="search" name="keyword" id="keyword" value="${param.keyword}">
            <input type="submit" value="찾기" class="search-btn">
      </div>                                
   </form>
   <c:if test="${empty list}">
   <div class="talklist-list text-align-center"><br>표시할 채팅방이 없습니다.</div>
   </c:if>
   <c:if test="${!empty list}">
   <div class="talklist-list">
      <c:forEach var="talk" items="${list}">
      <div class="talklist-box" onclick="location.href='talkDetail.do?talkroom_num=${talk.talkroom_num}'">
         <div class="box-left">
               <span>
               <b>
               ${fn:substring(talk.talkroom_name,0,15)}
               <c:if test="${talk.room_cnt!=0}"><span style="color: red;">${talk.room_cnt}</span></c:if>               
               </b>
               </span>
               <br>                            
               <span>${fn:substring(talk.talkVO.message,0,15)}</span>
         </div>
         <div class="box-right">
            <span class="box-right-date">
               <c:if test="${!empty talk.talkVO.chat_date}">${talk.talkVO.chat_date}</c:if>
               <c:if test="${empty talk.talkVO.chat_date}">${talk.talkroom_date}</c:if>
            </span>
         </div>
         <div class="bothclear"></div>
      </div>
      </c:forEach>
   </div>
   </c:if>
   <hr size="1" width="100%">
   <div class="talklist-mypage-btn">
   	<input type="button" value="NewTalk" class="bottom-btn" onclick="location.href='talkRoomWrite.do'">
   	<input type="button" value="MyPage" class="bottom-btn" onclick="location.href='talkList.do'">   	
   </div>
</div><!-- end of talk-->   
</div><!-- end of page-main-talk -->
<!-- 채팅목록 끝 -->











