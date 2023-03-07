<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 메인 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/main.css">
<script src="${pageContext.request.contextPath}/js/main/main.js"></script>
<script type="text/javascript">
	let result = "${result}";
	if(result == 'success'){
		alert('글 작성이 완료되었습니다.');
	}
</script>
<div class="main-page">
	<!-- 배너 시작 -->
	<div class="main-banner">
		<img src="${pageContext.request.contextPath}/images/examplebanner.png">
	</div>
	<br>
	<!-- 배너 끝 -->
	
	<!-- 스터디 모집 글작성 버튼(예비-수정 예정) 시작 -->
	<c:if test="${!empty user}">
	<div class="study-create">
		<a id="std-a" href="studyCreate.do">
			<span id="study" data-attr="study">Study</span><span id="create" data-attr="Create">Create</span>
		</a>
	</div>
	</c:if>
	
	<!-- 스터디 모집 글작성 버튼(예비-수정 예정) 끝 -->
	
	<!-- 스터디 필터 목록 시작 -->
	<div class="filter">
		<ul>
			<li>
				<a href="main.do?filter=all">
				<img src="${pageContext.request.contextPath}/images/exampleicon.png" class="filter-icon">
				<br>
				필터다
				</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="main.do?filter=programming">
				<img src="${pageContext.request.contextPath}/images/exampleicon.png" class="filter-icon">
				<br>
				프래밍
				</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="main.do?filter=datascience">
				<img src="${pageContext.request.contextPath}/images/exampleicon.png" class="filter-icon">
				<br>
				데언스</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="main.do?filter=design">
				<img src="${pageContext.request.contextPath}/images/exampleicon.png" class="filter-icon">
				<br>디자인</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="main.do?filter=video">
				<img src="${pageContext.request.contextPath}/images/exampleicon.png" class="filter-icon">
				<br>
				비디오
				</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="main.do?filter=language">
				<img src="${pageContext.request.contextPath}/images/exampleicon.png" class="filter-icon">
				<br>
				어언어
				</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="main.do?filter=marketing">
				<img src="${pageContext.request.contextPath}/images/exampleicon.png" class="filter-icon">
				<br>
				마케팅
				</a>
			</li>
		</ul>
	</div>
	<!-- 스터디 필터 목록(+선택 정렬) 끝 -->
	
	<!-- 스터디 switch 시작 -->
	<!-- 
	<div>
		<input type="checkbox" id="stc-state" th:field="{*stc-state}" checked="checked">
	</div>
	 -->
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
	<div class="studylist-main">
		<form id="search_form" action="main.do" method="get">
			<ul class="study-search">
				<li>
					<select name="keyfield" class="search1">
						<option value="1" class="search1-1" <c:if test="${param.keyfield==1}">selected</c:if>>제목</option>
						<option value="2" class="search1-1" <c:if test="${param.keyfield==2}">selected</c:if>>내용</option>
						<option value="3" class="search1-1" <c:if test="${param.keyfield==3}">selected</c:if>>제목+내용</option>
					</select><input type="search" size="16" name="keyword" id="keyword" class="search2" value="${param.keyword}"><input type="submit" class="search3" value="검색">
				</li>
			</ul>                                  
		</form>
		
		<c:if test="${count == 0}">
		<div>모집중인 스터디가 없습니다.</div>
		</c:if>
		
		<c:if test="${count > 0}">
		<div class="studylist">
			<c:forEach var="study" items="${list}">
			<div class="card" onclick="location.href='${pageContext.request.contextPath}/study/studyView.do?stc_num=${study.stc_num}'">
				<ul>
					<li>
						<c:if test="${empty study.stc_filename}">
							<img src="${pageContext.request.contextPath}/images/example.png" class="std-image">
						</c:if>
						<c:if test="${!empty study.stc_filename}">
							<img src="stcView.do?stc_num=${study.stc_num}" class="std-image">
						</c:if>
					</li>
					<li>
						<c:if test="${study.stc_state=='모집중'}">
							<label class="std-state1"><span class="std-label">🔥${study.stc_state}</span></label>
						</c:if>
						<c:if test="${study.stc_state=='모집완료'}">
							<label class="std-state2"><span class="std-label">🤍${study.stc_state}</span></label>
						</c:if>
						
						<c:if test="${study.stc_filter=='프로그래밍'}">
							<label class="std-filter1"><span class="std-label">${study.stc_filter}</span></label>
						</c:if>
						<c:if test="${study.stc_filter=='데이터사이언스'}">
							<label class="std-filter2"><span class="std-label">${study.stc_filter}</span></label>
						</c:if>
						<c:if test="${study.stc_filter=='디자인'}">
							<label class="std-filter3"><span class="std-label">${study.stc_filter}</span></label>
						</c:if>
						<c:if test="${study.stc_filter=='영상'}">
							<label class="std-filter4"><span class="std-label">${study.stc_filter}</span></label>
						</c:if>
						<c:if test="${study.stc_filter=='어학'}">
							<label class="std-filter5"><span class="std-label">${study.stc_filter}</span></label>
						</c:if>
						<c:if test="${study.stc_filter=='마케팅'}">
							<label class="std-filter6"><span class="std-label">${study.stc_filter}</span></label>
						</c:if>
					</li>
					<li class="std-title">
						<b>${study.stc_title}</b>
					</li>
					<li class="std-wdate">
						[${study.stc_way}] <span class="std-date">
						- <fmt:formatDate value="${study.stc_date}" pattern="MM.dd / yyyy"/></span>
					</li>
					<li class="std-mem">
						<img src="/member/viewProfile.do?mem_num=${study.mem_num}" class="std-memimage">
						 &nbsp;<b class="std-nick">${study.mem_nick}</b>
					</li>
					<li>
						<label class="std-perlabel"><span class="std-per">${study.stc_per}명</span></label>
					</li>
				</ul>
			</div>
			</c:forEach>	
		</div>
		<div class="align-center float-clear" style="padding-top: 20px;">${page}</div>
		</c:if>
	</div>
	<!-- 스터디 목록 끝 -->
</div>
<!-- 메인 끝 -->