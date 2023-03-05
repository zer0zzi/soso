<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/talk/talk.css">
<!-- 채팅목록 시작 -->
<div class="page-main-talk">
<div class="talk">
<div class="talklist-head">&nbsp;Sosotalk</div>
	<form action="talkList.do" id="search_form" method="get">
      <div class="search">
        <input type="search" name="keyword" id="keyword" value="${param.keyword}" class="search-bar" placeholder="search">
<!--       	<input type="submit" value="go" class="search-btn"> -->
		<img src="">
      </div>                                
   </form>
   <c:if test="${empty list}">
   <div class="talklist-list text-align-center"><br><b>표시할 채팅방이 없습니다.</b></div>
   </c:if>
   <c:if test="${!empty list}">
   <div class="talklist-list">
      <c:forEach var="talk" items="${list}">
      <div class="talklist-box" onclick="location.href='talkDetail.do?talkroom_num=${talk.talkroom_num}'">
         <div class="box-left">
               <span style="color: darkblue;">
               <b>
               ${fn:substring(talk.talkroom_name,0,15)}
               <c:if test="${talk.room_cnt!=0}"><span style="color: red;">${talk.room_cnt}</span></c:if>               
               </b>
               </span>
               <br>                            
               <span style="color: lightslategray;">
               		<c:if test="${empty talk.talkVO.message}">새로운 채팅방에 초대되었습니다.</c:if>
               		<c:if test="${!empty talk.talkVO.message}">${fn:substring(talk.talkVO.message,0,16)}</c:if>
               </span>
         </div>
         <div class="box-right">
<%--            <span class="box-right-date">
               <c:if test="${!empty talk.talkVO.chat_date}">${talk.talkVO.chat_date}</c:if>
               <c:if test="${empty talk.talkVO.chat_date}">${talk.talkroom_date}</c:if>
            </span> 
--%>
         </div>
         <div class="bothclear"></div>
      </div>
      </c:forEach>
   </div>
   </c:if>
<div class="talklist-mypage-btn">
   	<input type="button" value="New Talk" class="bottom-btn" onclick="location.href='talkList.do'">
<!--    	<input type="button" value="My Page" class="bottom-btn" onclick="location.href='talkList.do'">   	
 --> </div> 

</div><!-- end of talk-->   
</div><!-- end of page-main-talk -->
<!-- 채팅목록 끝 -->











