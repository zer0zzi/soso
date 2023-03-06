<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/group/main.css">

<!-- 메인 시작 -->
<div class="page-main">

	<p class="cursor-d">공지사항</p>
	<div class="member-main">
        <table class="member-table h-40">
        	<tr class="member-table-header cursor-dd">
                <th class="no1">공지사항</th>
                <th class="no2">제목</th>
                <th class="no3">등록일</th>
                <th class="no4"></th>
            </tr>
            <c:forEach var="notice" items="${rule}">
            <tr style="border-bottom: none !important">
	            <td class="no1"></td>
	            <td class="no2"><a href="/group/groupNoticeDetail.do?grp_num=${notice.grp_num}&&stc_num=${notice.stc_num}">${notice.grp_title}</a></td>
	            <td class="no3" style="cursor: default;">${notice.grp_date}</td>
	            <td class="no4"></td>
            </tr>
            </c:forEach>
        </table>
    </div>
	
	<p class="cursor-d">오늘의 일정</p>
	<div class="member-main">
        <table class="member-table h-40">
        	<tr class="member-table-header cursor-dd">
                <th style="width: 99%" style="border-bottom: 3px solid rgb(242,240,240);">일정</th>
                <th class="no4"></th>
            </tr>
            <c:forEach var="today" items="${todayList}">
            <tr class="cursor-ddd">
                <td style="width: 99%; border-bottom: 3px solid rgb(242, 240, 240);">${today.cal_content}</td>
                <td class="no4"></td>
            </tr>
            </c:forEach>
        </table>
    </div>
	
	<p class="cursor-d">그룹 회원</p>
	<div class="member-main">
        <table class="member-table h-70">
            <tr class="member-table-header cursor-dd">
                <th class="no1">프로필</th>
                <th class="no2">이름</th>
                <th class="no3">이메일</th>
                <th class="no4"></th>
            </tr>
            
            <c:if test="${count > 0}">
            	<c:forEach var="member" items="${memberList}">
            	<tr class="cursor-ddd">
	         		<td class="no1">
	         			<img src="/member/viewProfile.do?mem_num=${member.mem_num}" class="std-memimage" width="70px" height="70px">
	         		</td>
	                <td class="no2">${member.mem_name}</td>
	                <td class="no3">${member.mem_email}</td>
	                <td class="no4"></td>
            	</tr>
            	</c:forEach>
            </c:if>
            
        </table>
    </div>
</div>
<!-- 메인 끝 -->