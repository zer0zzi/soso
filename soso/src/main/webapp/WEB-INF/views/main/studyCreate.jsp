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
	<h1 class="sixth"><b>STUDY</b></h1><br>
	
	<form id="create_form" action="studyCreate.do" method="post" enctype="multipart/form-data">
		
		<ul>
			<li class="form1">
				<select id="stc_filter" name="stc_filter">
					<option value="프로그래밍">프로그래밍</option>
					<option value="데이터사이언스">데이터사이언스</option>
					<option value="어학">어학</option>
					<option value="디자인">디자인</option>
					<option value="영상">영상</option>
					<option value="마케팅">마케팅</option>
				</select>
				<label class="stcradio">
					<input id="stc_state1" name="stc_state" checked="checked" type="radio" value="모집중"/><span>모집중</span>
				</label>
				<label class="stcradio">
					<input id="stc_state2" name="stc_state" type="radio" value="모집완료"/><span>모집완료</span>
				</label>
				<input id="stc_per" name="stc_per" min="1" max="999" placeholder="모집인원" type="number" value="모집인원" value="0"/>
			</li>
			<li class="form2">
				<label class="stcradio-gray">
					<input id="stc_way1" name="stc_way" checked="checked" type="radio" value="온라인"/><span>온라인</span>
				</label>
				<label class="stcradio-gray">
					<input id="stc_way2" name="stc_way" type="radio" value="오프라인"/><span>오프라인</span>
				</label>
			</li>
			<li class="form3">
				<label class="stcradio">
					<input id="stc_period1" name="stc_period" checked="checked" type="radio" value="상시"/><span>상시</span>
				</label>
				<label class="stcradio">
					<input id="stc_period2" name="stc_period" type="radio" value="기간"/><span>기간</span>
				</label>
				<input id="stc_pedate" name="stc_pedate" placeholder="모집기간" type="text" value=""/>
			</li>
			<li>
				<input id="stc_title" name="stc_title" placeholder="제목" type="text" value=""/> 
			</li>
			<li>
				<textarea id="stc_content" name="stc_content" placeholder="내용"></textarea>
			</li>
			<li>
				<input type="file" name="upload" id="upload">
			</li>
		</ul>
		<div class="stc_button">
			<button type="submit" value="Submit">전송</button>
			<input type="button" value="목록" onclick="location.href='main.do'">
		</div>
	</form>
</div>
<!-- 중앙 컨텐츠 끝 -->