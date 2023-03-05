<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <link href="${pageContext.request.contextPath}/css/group/noticeWrite.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper p-t-45 p-b-50">
        <div class="wrapper wrapper--w800">
            <div class="card card-6">
                <div class="card-body">
                    <form:form action="/group/groupCalendarWrite.do" modelAttribute="groupCalendarVO" id="calendarWrite_form">
                    
                    <form:input path="stc_num" type="hidden" value="${stc_num}"/>
                    <form:errors element="div" cssClass="error-color"/>
                        <div class="form-row">
                            <div class="name">
								<label for="cal_date">날짜</label>
							</div>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="cal_date" class="input--style-6" type="date" id="dateTimeLocal" onchange="setMinValue()"/>
                                    <form:errors path="cal_date" cssClass="error-color"/>
                                </div>
                            </div>
                            
                            <script>
                            // 오늘보다 이전날짜 선택 불가능
                            let dateElement = document.getElementById('dateTimeLocal');
                            let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -14); //-14는 우리는 년,월,일만 필요해서 뒤에붙는 시간, 분, 초 등 14글자를 때려고 붙임.
                            dateElement.value = date;
                            dateElement.setAttribute("min", date);
                            console.log(date);

                            function setMinValue() {
                                if(dateElement.value < date) {
                                    alert('현재 시간보다 이전의 날짜는 설정할 수 없습니다.');
                                    dateElement.value = date;
                                }
                            }
                            </script>
                        
                        </div>
                        <div class="form-row">
                            <div class="name">
								<label for="cal_content">내용</label>
							</div>
                            <div class="value">
                                <div class="input-group">
                                    <form:textarea path="cal_content" class="textarea--style-6" placeholder="Please fill out the calendar." maxlength="60" />
                                    <form:errors path="cal_content" cssClass="error-color"/>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
							<form:button class="btn btn--radius-2 btn--blue-2 btn-width">전송</form:button>
						</div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/group/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/group/global.js"></script>
    

</body>
</html>