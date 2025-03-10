<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
<script type="text/javascript" src="./js/calendar.js"></script>
<link rel="stylesheet" href="./css/calendar.css">
</head>
<style>
	

</style>

 <%@ include file="sidebar.jsp" %>
<body>
	<input type="hidden" id="emp_name" value="${sessionScope.loginVo.name}">
	<input type="hidden" id="emp_id" value="${sessionScope.loginVo.emp_id}">
	<div class="content" id="content">
		<%@ include file="header.jsp"%>
		
		<div class="main-content">
			<div id='calendar'></div>
		
		</div>
	</div>

</body>
</html>