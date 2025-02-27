<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 페이지</title>
</head>
<body>
	<ul class="nav flex-column">
  <li class="nav-item">
    <a class="nav-link" href="#">마이페이지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">사원조회</a>
  </li>
  ${loginVo}
</ul>
</body>
</html>