<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<!-- 후기 글수정 시작 -->
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
	<form:form action="reviewUpdate.do" id="reviewUpdate_form" modelAttribute="reviewVO" enctype="multipart/form-data">
		<form:hidden path="review_num"/>
		<input type="hidden" name="review_name" value="후기">
		<c:if test="${!empty user && user.mem_auth==9}">
		<input type="hidden" name="review_stc_name" id="changeInput" value="관리자">
		</c:if>
		<ul>
			<li>
				<label>닉네임 (아이디)</label>
				<c:if test="${!empty user.mem_nick}">
				</c:if>
				<input type="text" value="${user.mem_nick} ( ${user.mem_id} )" class="insert-id" readonly/>
			</li>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li>
				<label>스터디명</label>
				<select onchange="selectBoxChange(this.value)" id="studyName" class="studyName" name="studyName">
					<option value="" disabled selected>참여 스터디</option>
					<c:forEach var="study" items="${studyList}">
						<option>${study.stc_title}</option>
					</c:forEach>
				</select>
				<%-- <input type="text" name="review_stc_name" value="${review_stc_name}" id="1changeInput" required> --%>
				<form:input path="review_stc_name" id="changeInput" class="insert-studyName"/>
				<script type="text/javascript">
					var selectBoxChange = function(value){
						console.log("값변경테스트 : " + value);
						$('#changeInput').val(value);
					}
				</script>
			</li>
			<li>
				<label for="review_title">제목</label>
				<form:input path="review_title" class="insert-title"/>
				<form:errors path="review_title" cssClass="error-color"/>
			</li>
			</c:if>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li>
				<label>평점</label>
				<div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="review_rating" value="5" <c:if test="${reviewVO.review_rating==5}">checked="checked"</c:if>/>
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="review_rating" value="4" <c:if test="${reviewVO.review_rating==4}">checked="checked"</c:if>/>
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="review_rating" value="3" <c:if test="${reviewVO.review_rating==3}">checked="checked"</c:if>/>
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="review_rating" value="2" <c:if test="${reviewVO.review_rating==2}">checked="checked"</c:if>/>
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="review_rating" value="1" <c:if test="${reviewVO.review_rating==1}">checked="checked"</c:if>/>
					<label for="1-star" class="star">★</label>
				</div>
			</li>
			</c:if>
			<li>
				<label for="review_content">본문</label>
				<form:textarea path="review_content" class="insert-content"/>
				<form:errors path="review_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="upload">업로드</label>
				<input type="file" name="upload" id="upload">
				<c:if test="${!empty reviewVO.review_filename}">
				<div id="review_file_detail">
					(${reviewVO.review_filename})파일이 등록되어 있습니다.
					<input type="button" value="파일삭제" id="review_file_del">
				</div>
				<script type="text/javascript">
					$(function(){
						$('#review_file_del').click(function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								$.ajax({
									url:'reviewFile.do',
									data:{review_num:${reviewVO.review_num}},
									type:'post',
									dataType:'json',
									success:function(param){
										if(param.result=='logout'){
											alert('로그인 후 사용하세요.');
										}else if(param.result=='success'){
											$('#review_file_detail').hide(); // 안 보여지게 가린다.
										}else{
											alert('파일 삭제 오류 발생');
										}
									},
									error:function(){
										alert('네트워크 오류 발생');
									}
								});
							}
						});
					});
				</script>
				</c:if>
			</li>
		</ul>
		<div class="align-left">
			<form:button class="insert-btn">수정</form:button>
			<input type="button" value="상세" onclick="location.href='reviewDetail.do?review_num=${reviewVO.review_num}'" class="detail-btn">
			<input type="button" value="목록" onclick="location.href='reviewList.do'" class="list-btn">
		</div>
	</form:form>
	</div>
</div>
<!-- 후기 글수정 끝 -->