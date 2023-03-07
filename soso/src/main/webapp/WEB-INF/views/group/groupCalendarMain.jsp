<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/group/calendar.css">
</head>
 <body>
		<!-- 메인 시작 -->
		<div class="page-main">
		<p>그룹 캘린더</p>
			<section>
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="content">
							<div class="calendar-container">
							  <div class="calendar"> 
								<div class="year-header"> 
								  <span class="left-button fa fa-chevron-left" id="prev"> </span> 
								  <span class="year" id="label"></span> 
								  <span class="right-button fa fa-chevron-right" id="next"> </span>
								</div> 
								<table class="months-table w-50"> 
								  <tbody>
									<tr class="months-row">
									  <td class="month">Jan</td> 
									  <td class="month">Feb</td> 
									  <td class="month">Mar</td> 
									  <td class="month">Apr</td> 
									  <td class="month">May</td> 
									  <td class="month">Jun</td> 
									  <td class="month">Jul</td>
									  <td class="month">Aug</td> 
									  <td class="month">Sep</td> 
									  <td class="month">Oct</td>          
									  <td class="month">Nov</td>
									  <td class="month">Dec</td>
									</tr>
								  </tbody>
								</table> 
								
								<table class="days-table w-50"> 
								  <td class="day">Sun</td> 
								  <td class="day">Mon</td> 
								  <td class="day">Tue</td> 
								  <td class="day">Wed</td> 
								  <td class="day">Thu</td> 
								  <td class="day">Fri</td> 
								  <td class="day">Sat</td>
								</table> 
								<div class="frame"> 
								  <table class="dates-table"> 
								  <tbody class="tbody">             
								  </tbody>
								  </table>
								  <c:if test="${master==stc_num}">
								  <div class="writebutton">
								    <button class="btn-main" id="add-button" onclick="location.href=
								    '${pageContext.request.contextPath}/group/groupCalendarWrite.do?stc_num=${stc_num}'">일정 추가</button>
								  </div>
								  </c:if>
								</div> 
							  </div>
							</div>
							
							
							<div class="calendar-list">
								<div class="calendar-list-form">
									<div class="form-data">
									
									
									<table class="notice-table">
									<c:forEach var="calendar" items="${list}">
							            <c:if test="${calendar.stc_num==stc_num}">
							            <tr>
								            <td><p>${calendar.cal_date} : ${calendar.cal_content}</p></td>
							            </tr>
							            </c:if>
							            </c:forEach>
							        </table>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			</section>
		</div>
<!-- 메인 끝 -->
<script src="${pageContext.request.contextPath}/js/group/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/group/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/group/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/group/main.js"></script>
</body>
</html>