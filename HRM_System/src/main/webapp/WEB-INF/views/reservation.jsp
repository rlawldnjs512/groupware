<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/reservation.js"></script>
<link rel="stylesheet" href="./css/reservation.css">

</head>
 <%@ include file="sidebar.jsp" %>
<body>
	<div class="content" id="content">
	<%@ include file="header.jsp" %>
	<div class="main-content">
		<div id="dateFrom">
			<input type="date" id="rev_date"  >
		</div>
    	<div id="revContent">
			<c:forEach var="room" items="${lists}">
				<div id="${room.room_id}">
				    <h3>${room.room_name}</h3>
				    <div class="reservation-container">
				        <c:forEach var="rev" items="${room.reservation}">
				            <span class="btn_bg ${rev.emp_id eq '예약가능' ? 'nocheck': 'check'}"  name="${rev.slot}" >${rev.range}</span>
				        </c:forEach>
				    </div>
			    </div>
			</c:forEach>
		</div>
		
		</div>
	</div>
		
	<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">회의실예약</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="#" >
        	<div class="form-group">
        <label for="room">회의실</label>
        <input id="room" name="room" type="text" value="" readonly>
        <label for="name">이름</label>
        <input id="name" name="name" type="text" value="" readonly>
        <label for="date">날짜</label>
        <input id="date" name="date" type="text" value="" readonly>
        <label for="time">시간</label>
        <input id="time" name="time" type="text" value="" readonly>

        <p>예약하시겠습니까?</p>
    </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
        <button type="button" class="btn btn-primary" id="revSubmit">예약하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>