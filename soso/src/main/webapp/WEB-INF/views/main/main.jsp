<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 메인 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/main.css">
<div class="main-page">
	<!-- 메인 타이틀, 배너 시작 -->
	<h2 class="align-center">STUDY</h2>
	<div class="main-banner">
		<!-- 랜덤 스터디................... -->
		<p class="align-center">랜덤 스터디(아직 설정 전) 임시 태그</p>
	</div>
	<br>
	<!-- 메인 타이틀, 배너 끝 -->
	
	<!-- 스터디 모집 글작성 버튼(예비-수정 예정) 시작 -->
	<c:if test="${!empty user}">
	<div class="align-right">
		<input type="button" value="스터디모집" onclick="location.href='studyCreate.do'">
	</div>
	</c:if>
	<!-- 스터디 모집 글작성 버튼(예비-수정 예정) 끝 -->
	
	<!-- 스터디 필터 목록(+선택 정렬) 시작 - 임시 -->
	<div class="align-center">
		<a href="#">Programming</a> &nbsp;&nbsp;
		<a href="#">Data science</a> &nbsp;&nbsp;
		<a href="#">Design</a> &nbsp;&nbsp;
		<a href="#">Video</a> &nbsp;&nbsp;
		<a href="#">Language</a> &nbsp;&nbsp;
		<a href="#">Marketing</a>
	</div>
	<!-- 스터디 필터 목록(+선택 정렬) 끝 -->
	
	<!-- 스터디 switch 시작 -->
	<!-- 스터디 switch 끝 -->
	
	<!-- 스터디 목록 시작 -->
	<script type="text/javascript">
	$(function(){
		$('#search_form').on('submit',function(){
			if($('#keyword').val().trim()==''){
				alert('검색어를 입력하세요');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
	</script>
	<div class="study-main">
		<form id="search_form" action="studyList.do" method="get">
			<ul class="search">
				<li>
					<select name="keyfield">
						<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>제목</option>
						<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>내용</option>
						<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>제목+내용</option>
					</select>
				</li>
				<li>
					<input type="search" size="16" name="keyword" id="keyword" value="${param.keyword}">
				</li>
				<li>
					<input type="submit" value="검색">
				</li>
			</ul>                                  
		</form>
		<c:if test="${count == 0}">
		<div>모집중인 스터디가 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
		<div class="study-list">
			<c:forEach var="study" items="${list}">
			<div class="horizontal-area">
				<a href="${pageContext.request.contextPath}/study/studyView.do?stc_num=${study.stc_num}">
					<c:if test="${!empty stc_filename}">
						<img src="imageView.do?stc_num=${study.stc_num}&stc_type=2">
					</c:if>
					<span class="filter">${study.stc_filter}</span>
					<br>
					<span>${study.stc_title}</span>
					<span>- <fmt:formatDate value="${study.stc_date}" pattern="MM.dd / yyyy"/></span>
					<br>
					<span>[${study.stc_way}]</span>
					<br>
				</a>
					<!-- 프로필사진 넣기 --><div class="list-mem"><b>${study.mem_nick}</b></div>
					<div class="per">${study.stc_per}명</div>
			</div>
			</c:forEach>
		</div>
		<div class="align-center float-clear">${page}</div>
		</c:if>
	</div>
	<!-- 스터디 목록 끝 -->
</div>
<!-- 메인 끝 -->