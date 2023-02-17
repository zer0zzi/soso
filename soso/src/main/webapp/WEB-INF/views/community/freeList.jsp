<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css">
<script type="text/javascript">
	// 검색 유효셩 체크
	$(function(){
		$('#f_search_form').submit(function(){
			if($('#keyword').val().trim()==''){
				alert('검색어 입력 후 검색이 가능합니다.');
				$('#keyword').val('').focus();
				return false;
			}
		});
	}); // end of 검색 유효성 체크
</script>
<div class="f-page-main">
	<div class="main-menu">
		<h2>
			<a href='#'>커뮤니티</a>
			 / 
			<a href='${pageContext.request.contextPath}/community/freeList.do'>자유게시판</a>
		</h2>
	</div>
	
	<!-- 서브 메뉴 시작 -->
	<div class="sub-menu">
		<ul>
			<li><a href='#'>전체게시판</a></li>
			<li><a href='${pageContext.request.contextPath}/community/freeList.do'>자유</a></li>
			<li><a href='#'>홍보</a></li>
			<li><a href='#'>후기</a></li>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li>
				<input type="button" value="글작성" onclick="location.href='freeWrite.do'">
			</li>
			</c:if>
			<c:if test="${!empty user && user.mem_auth==9}">
			<li>
				<input type="button" value="공지작성" onclick="location.href='freeWrite.do'">
			</li>
			</c:if>
		</ul>
	</div>
	<!-- 서브 메뉴 끝 -->
	
	<!-- 홍보게시판으로 옮기기 -->
	<!-- 모집중/모집 마감 시작 -->
	<div class="free-wanted">
		<input type="button" value="모집중">
	</div>
	<!-- 모집중/모집 마감 끝 -->
	
	<!-- 정렬 영역 시작 -->
	<div class="free-sort">
		<select id="sort_post" name="sort_post" class="sort-post" onchange="sortPost()">
			<option value="1">최신순</option>
			<option value="2">조회순</option>
			<option value="3">좋아요순</option>
			<option value="4">댓글순</option>
		</select>
	</div>
	<!-- 정렬 영역 끝 -->
	
	<!-- 검색 영역 시작 -->
	<form action="freeList.do" id="f_search_form" method="get">
		<ul class="f-search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>전체</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>제목</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>내용</option>
					<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>작성자</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색">
				<input type="button" value="목록" onclick="location.href='freeList.do'">
			</li>
			<li>
				<c:if test="${mem_auth==9}">
					<input type="hidden" name="free_fixed" id="free_fixed" value="${free_fixed==1}">
				</c:if>
			</li>
		</ul>
	</form>
	<!-- 검색 영역 끝 -->
	
	<!-- 목록 영역 시작 -->
	<c:if test="${count==0}">
	<div class="f-result-display">작성된 게시글이 없습니다.</div>
	</c:if>
	
	<c:if test="${count>0}">
	<div class="free-fixed-1">
		<table>
			<tr>
				<th>번호</th>
				<th width="400">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요수</th>
				<th>댓글수</th>
				<th>free_fixed==1</th>
			</tr>
			<c:forEach var="free" items="${freeList}">
			<input type="hidden" name="free_fixed" id="free_fixed" value="${free.free_fixed}">
			<c:if test="${free.free_fixed==1}">
			<tr>
				<td>${free.free_num}</td>
				<td><a href="freeDetail.do?free_num=${free.free_num}">${free.free_title}</a></td>
				<td>
					<c:if test="${empty free.mem_nick}">${free.mem_id}</c:if>
					<c:if test="${!empty free.mem_nick}">${free.mem_nick}</c:if>
				</td>
				<td>${free.free_regdate}</td>
				<td>${free.free_hit}</td>
				<td>${free.free_fixed}</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="free-fixed-2">
		<table>
			<tr>
				<th>번호</th>
				<th width="400">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요수</th>
				<th>댓글수</th>
				<th>free_fixed==2</th>
			</tr>
			<c:forEach var="free" items="${freeList}">
			<input type="hidden" name="free_fixed" id="free_fixed" value="${free.free_fixed}">
			<c:if test="${free.free_fixed==2}">
			<tr>
				<td>${free.free_num}</td>
				<td><a href="freeDetail.do?free_num=${free.free_num}">${free.free_title}</a></td>
				<td>
					<c:if test="${empty free.mem_nick}">${free.mem_id}</c:if>
					<c:if test="${!empty free.mem_nick}">${free.mem_nick}</c:if>
				</td>
				<td>${free.free_regdate}</td>
				<td>${free.free_hit}</td>
				<td>${free.free_fixed}</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
	</c:if>
	
	<!-- 페이징 영역 시작 -->
	<div class="free-paging">${page}</div>
	<!-- 페이징 영역 끝 -->
</div>