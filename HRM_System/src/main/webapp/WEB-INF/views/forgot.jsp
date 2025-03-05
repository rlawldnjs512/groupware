<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- SweetAlert CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="css/forgot.css">
<title>비밀번호 재설정 화면</title>
</head>

<body>
<div>
    <h2>비밀번호 재설정</h2>
    <form action="/check.do" method="GET">
        <table>
            <tr>
                <td>이름</td>
                <!-- 이름 입력 값 유지 -->
                <td><input id="name" type="text" name="name" placeholder="이름" required value="${param.name}"></td>
            </tr>

            <tr>
                <td>사원번호</td>
                <!-- 사원번호 입력 값 유지 -->
                <td><input id="emp_id" type="text" name="emp_id" placeholder="사원번호" required value="${param.emp_id}"></td>
            </tr>
            
            <tr>
                <td colspan="2">
                    <input type="submit" value="인증" class="btn">
                </td>
            </tr>
        </table>
    </form>

    <!-- 이메일 필드: 사원번호가 일치할 경우에만 보여짐 -->
    <c:if test="${empIdExists}">
        <form action="/sendEmail.do" method="POST">
            <table>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" class="email" name="email"> @ 
                        <select name="emailDomain">
                            <option>naver.com</option>
                            <option>gmail.com</option>
                            <option>daum.net</option>
                            <option>nate.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="인증" class="btn">
                    </td>
                </tr>
            </table>
        </form>
    </c:if>
</div>

<script type="text/javascript">
    <!-- 페이지 로드 후 alert 메시지가 있을 경우 SweetAlert으로 띄우기 -->
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
