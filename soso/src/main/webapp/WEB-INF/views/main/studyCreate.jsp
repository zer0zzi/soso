<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/stcmain.css">
<script type="text/javascript">
	$(function(){
		$("#stc-ing").attr("checked","checked");
		
		$('#create_form').submit(function(){
			if($('#stc_title').val().trim()==''){
				alert('제목을 입력하세요');
				$('#stc_title').val('').focus();
				return false;
			}
			if($('#stc_content').val().trim()==''){
				alert('내용을 입력하세요');
				$('#stc_content').val('').focus();
				return false;
			}
		});
	})
</script>
<div class="stc-main">
<h2 class="align-center">STUDY</h2>
	<form:form action="studyCreate.do" id="create_form"
		modelAttribute="studyVO" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color" />
		<ul>
			<li>
				<form:radiobutton path="stc_state" value="모집중" id="stc-ing"/>모집중
				<form:radiobutton path="stc_state" value="모집완료"/>모집완료
			</li>
			<li>
				<form:select path="stc_period">
					<form:option value="상시"/>
					<form:option value="기간"/>
				</form:select>
				<form:input path="stc_per" id="stc_per" value="모집인원" placeholder="모집인원" type='number' min='1' max='999'/>
			</li>
			<li>
				<form:select path="stc_way">
					<form:option value="온라인"/>
					<form:option value="오프라인"/>
				</form:select>
				<form:select path="stc_filter">
					<form:option value="프로그래밍"/>
					<form:option value="데이터사이언스"/>
					<form:option value="어학"/>
					<form:option value="디자인"/>
					<form:option value="영상"/>
					<form:option value="마케팅"/>
				</form:select>
			</li>
			<li>
				<form:input path="stc_title" id="stc_title" placeholder="제목"/> 
				<form:errors path="stc_title" cssClass="error-color"/>
			</li>
			<li>
				<form:textarea path="stc_content" id="stc_content" placeholder="내용"/>
				<form:errors path="stc_content" cssClass="error-color"/>
			</li>
			<li>
				<input type="file" name="upload" id="upload">
			</li>
		</ul>
		<div class="stc_button">
			<form:button>전송</form:button>
			<input type="button" value="목록" onclick="location.href='main.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->