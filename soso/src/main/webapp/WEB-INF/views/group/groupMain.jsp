<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/group/main.css">

<!-- 메인 시작 -->
<div class="page-main">

	<p>NOTICE</p>
	<div class="member-main">
        <table class="member-table">
        	<tr class="member-table-header">
                <th class="no1">notice</th>
                <th class="no2">title</th>
                <th class="no3">content</th>
                <th class="no4"></th>
            </tr>
            <c:forEach var="notice" items="${rule}">
            <tr style="border-bottom: none !important">
	            <td class="no1"></td>
	            <td class="no2"><a href="/group/groupNoticeDetail.do?grp_num=${notice.grp_num}">${notice.grp_title}</a></td>
	            <c:if test="${empty notice.grp_mdate}">
	            <td class="no3">${notice.grp_date}</td>
	            </c:if>
	            <td class="no3">${notice.grp_mdate}</td>
	            <td class="no4"></td>
            </tr>
            </c:forEach>
        </table>
    </div>
	
	<p>TODAY</p>
	<div class="member-main">
        <table class="member-table">
        	<tr class="member-table-header">
                <th style="width: 99%">content</th>
                <th class="no4"></th>
            </tr>
            <c:forEach var="today" items="${todayList}">
            <tr>
                <td style="width: 99%">${today.cal_content}</td>
                <td class="no4"></td>
            </tr>
            </c:forEach>
        </table>
    </div>
	
	<p>MEMBERS</p>
	<div class="member-main">
        <table class="member-table">
            <tr class="member-table-header">
                <th class="no1">profile</th>
                <th class="no2">name</th>
                <th class="no3">email</th>
                <th class="no4"></th>
            </tr>
            
            <c:if test="${count > 0}">
            	<c:forEach var="member" items="${memberList}">
            	<tr>
	                <td class="no1">나중에 사진 첨부</td>
	                <td class="no2">${member.mem_name}</td>
	                <td class="no3">${member.mem_email}</td>
	                <td class="no4"></td>
            	</tr>
            	</c:forEach>
            </c:if>

            
            <!-- 
             -->
            
        </table>
    </div>
</div>
<!-- 메인 끝 -->