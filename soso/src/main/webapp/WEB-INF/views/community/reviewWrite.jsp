<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<script type="text/javascript">
	$(function(){
		$('#reviewWrite_form').submit(function(){
			if($('#review_title').val().trim()==''){
				alert('제목을 입력하지 않았습니다.');
				$('#review_title').val('').focus();
				return false;
			}
			if($('#review_content').val().trim()==''){
				alert('내용을 입력하지 않았습니다.');
				$('#review_content').val('').focus();
				return false;
			}
			if($('#changeInput').val().trim()==''){
				alert('참여한 스터디명을 선택하세요.');
				$('#changeInput').val('').focus();
				return false;
			}
		});
	});
</script>
<style> /* 밑으로 드랍다운 했을 때, option 텍스트가 안 보이게 설정 */
	select option[value=""][disabled]{
	display:none;
	}
</style>
<!-- 글작성 영역 시작 -->
<div class="community-page-main">

	<span class="full-insert-title">
	<a href='reviewList.do' style="color:white"><b>
		후기게시판
		<%-- <c:if test="${!empty user && user.mem_auth==9}">&nbsp;공지작성</c:if>
		<c:if test="${!empty user && user.mem_auth<9}">&nbsp;글작성</c:if> --%>
	</b></a>
	</span>
	
	<!-- 작성 폼 시작 -->
	<div class="full-insert">
	<form:form action="reviewWrite.do" name="reviewWrite_form" id="reviewWrite_form" modelAttribute="reviewVO" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<input type="hidden" name="review_name" value="후기">
		<c:if test="${!empty user && user.mem_auth==9}">
		<input type="hidden" name="review_stc_name" id="changeInput" value="관리자">
		</c:if>
		<ul>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li>
				<label>닉네임 (아이디)</label>
				<c:if test="${!empty user.mem_nick}">
				</c:if>
				<input type="text" value="${user.mem_nick} ( ${user.mem_id} )" class="insert-id" readonly/>
			</li>
			<li>
				<label>게시판 타입</label>
				<select title="" onchange="if(this.value) location.href=(this.value);">
					<option value="freeWrite.do">자유게시판</option>
					<option value="promoWrite.do">홍보게시판</option>
					<option value="reviewWrite.do" selected>후기게시판</option>
				</select>
			</li>
			<li>
				<label>스터디명</label>
				<select onchange="selectBoxChange(this.value)" id="studyName" class="studyName" name="studyName">
					<option value="" disabled selected>참여 스터디</option>
					<c:forEach var="study" items="${studyList}">
						<option>${study.stc_title}</option>
					</c:forEach>
				</select>
				<!-- <input type="text" name="review_stc_name" id="1changeInput" placeholder="참여한 스터디를 선택해주세요." required> -->
				<form:input path="review_stc_name" id="changeInput" width="500px" class="insert-studyName" placeholder="참여한 스터디를 선택해주세요." readonly="true"/>
				<script type="text/javascript">
					var selectBoxChange = function(value){
						console.log("값변경테스트 : " + value);
						$('#changeInput').val(value);
					}
				</script>
			</li>
			</c:if>
			
			<li>
				<label for="review_title">제목</label>
				<form:input path="review_title" class="insert-title"/>
				<form:errors path="review_title" cssClass="error-color"/>
			</li>
			<li>
				<label>평점</label>
				<div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="review_rating" value="5"/>
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="review_rating" value="4"/>
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="review_rating" value="3"/>
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="review_rating" value="2"/>
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="review_rating" value="1"/>
					<label for="1-star" class="star">★</label>
				</div>
			</li>
			<li>
				<label for="review_content">본문</label>
				<form:textarea path="review_content" id="review_content" class="insert-content"/>
				<form:errors path="review_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="upload">업로드</label>
				<input type="file" name="upload" id="upload">
			</li>
			
			<c:if test="${!empty user && user.mem_auth==9}">
			<li style="display:none;">
					<label for="review_fixed">상단 고정</label>
					<input type="number" name="review_fixed" id="review_fixed1" value="1" readonly/>
			</li>
			</c:if>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li style="display:none;">
					<label for="review_fixed">일반 게시글</label>
					<input type="number" name="review_fixed" id="review_fixed2" value="2" readonly/>
			</li>
			</c:if>
			
		</ul>
		<div class="align-left">
			<input type="submit" value="등록" class="insert-btn">
			<input type="button" value="취소" onclick="location.href='reviewList.do'" class="delete-btn">
		</div>
	</form:form>
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->