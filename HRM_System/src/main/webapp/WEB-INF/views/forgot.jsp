<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="text/css" href="./css/forgot.css">
<!-- SweetAlert CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<title>비밀번호 재설정 화면</title>
</head>

<body>

    <table>
        <tr>
            <td><h2>비밀번호 재설정</h2></td>
        </tr>
        <form action="/check.do" method="GET">
            <tr>
            <td>이름</td>
            </tr>
            <tr>
            <td><input id="name" type="text" name="name" placeholder="이름" required></td>
            </tr>

            <tr>
            <td>사원번호</td>
            </tr>
            <tr>
            <td><input id="emp_id" type="text" name="emp_id" placeholder="사원번호" required></td>
            </tr>
            <tr>
                <td>
                  <tr>
                  <td><input type="submit" value="인증" class="btn"></td>
                  </tr>
                </td>
            </tr>
        </form>

        <!-- 이메일 필드: 사원번호가 일치할 경우에만 보여짐 -->
        <c:if test="${empIdExists}">
            <tr><td>이메일</td></tr>
            <tr>
                <td><input type="text" class="email"> @ 
                    <select>
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>daum.net</option>
                        <option>nate.com</option>
                    </select>
                </td>
            </tr>
            <tr><td><input type="submit" value="인증" class="btn" onclick="alert('확인해주세요')"></td></tr>
        </c:if>
        
        </table>

	<script type="text/javascript">
    <!--// 페이지 로드 후에 alert 메시지가 있을 경우 SweetAlert으로 띄우기  -->
    <c:if test="${not empty alertMessage}">
        Swal.fire({
            
            text: '${alertMessage}', // Controller에서 전달된 alertMessage
            icon: '${alertType}',  // 'success' or 'error'를 받아서 알림의 타입을 설정
            
            confirmButtonColor: '#4CAF50'  // 버튼 색상 변경
        });
    </c:if>
    </script>


</body>
</html>


