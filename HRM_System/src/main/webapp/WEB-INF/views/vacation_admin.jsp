<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>직원 휴가 관리</title>
	<link rel="stylesheet" href="./css/vacation_admin.css">
</head>
<%@ include file="sidebar.jsp" %>
<body>
	<div class="content" id="content">
	<%@ include file="header.jsp" %>
		<div class="main-content">
			<table class="table table-striped table-hover">
				<thead class="table-light">
					<tr>
						<th>번호</th>
						<th>사원번호</th>
						<th>휴가 유형</th>
						<th>기간</th>
					</tr>
				</thead>
				<tbody>
			    	<c:forEach var="leave" items="${leaveLists}" varStatus="status">
				        <tr>
				            <td>${status.index + 1}</td>
				            <td>${leave.EMP_ID}</td>
				            <td>${leave.TYPE}</td>
				            <td>
				            	<fmt:formatDate value="${leave.LEAVE_START}" pattern="yyyy-MM-dd" /> 
				            	 ~ 
				            	<fmt:formatDate value="${leave.LEAVE_END}" pattern="yyyy-MM-dd" />
				            </td>
				        </tr>
				    </c:forEach>   
			    </tbody>
			</table>
			
			<div class="pagination-container text-center">
                <c:if test="${page.totalPage > 1}">
                    <ul class="pagination pagination-lg">
                        <c:if test="${page.page > 1}">
                            <li><a href="./vacation_admin?page=${page.page - 1}">&laquo;</a></li>
                        </c:if>

                        <c:forEach var="i" begin="${page.stagePage}" end="${page.endPage}" step="1">
                            <li class="${i == page.page ? 'active' : ''}">
                                <a href="./vacation_admin?page=${i}">${i}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${page.page < page.totalPage}">
                            <li><a href="./vacation_admin?page=${page.page + 1}">&raquo;</a></li>
                        </c:if>
                    </ul>
                </c:if>
            </div> <!-- 페이징 -->
            
		</div> <!-- main-content -->
	</div> <!-- content -->
</body>
</html>