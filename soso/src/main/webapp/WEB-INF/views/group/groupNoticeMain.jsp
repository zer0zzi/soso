<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/group/notice.css">
    
<!-- 메인 시작 -->
<div class="page-main">
	<p>GROUP NOTICE</p>
	<div class="notice-main">
        <table class="notice-table">
            <tr class="notice-table-header">
                <th class="no1">no.</th>
                <th class="no2">title</th>
                <th class="no3">name</th>
                <th class="no4">date</th>
            </tr>
            <tr>
	            <td class="no1">나중에 사진 첨부</td>
	            <td class="no2">나중에 사진 첨부</td>
	            <td class="no3">나중에 사진 첨부</td>
	            <td class="no4">나중에 사진 첨부</td>
            </tr>
            <tr>
	            <td class="no1">나중에 사진 첨부</td>
	            <td class="no2">나중에 사진 첨부</td>
	            <td class="no3">나중에 사진 첨부</td>
	            <td class="no4">나중에 사진 첨부</td>
            </tr>
        </table>
    </div>
    <button onclick="location.href='${pageContext.request.contextPath}/group/groupNoticeWrite.do?stc_num=1'">write</button>
</div>
<!-- 메인 끝 -->