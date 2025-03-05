<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="text/css" href="./css/forgot.css">
<title>비밀번호 재설정 화면</title>

</head>

<body>
    <div class="login">
       <div class="form">
    <h2>비밀번호 재설정</h2>
    
    <div class="form-field">
        <label for="name"><i class="fa fa-user"></i></label>
        <input id="name" type="text" name="name" placeholder="이름" required>
    </div>
    
    <div class="form-field">
        <label for="emp_id">
            <i class="fa fa-id-card"></i>
        </label>
        <input id="emp_id" type="text" name="emp_id" placeholder="사원번호" pattern="\d{8}" required>
    </div>

    <button type="button" class="button" onclick="checkEmpId()" >
        <div class="arrow-wrapper">
            <span class="arrow"></span>
        </div>
        <p class="button-text">인증</p>
    </button>
</div>

    </div>
    
    
    
    
    
    <script type="text/javascript">
    function checkEmpId() {
        // 사원번호를 input에서 가져옵니다.
        const empId = document.getElementById('emp_id').value;

        // 사원번호가 비어있는 경우
        if (empId === '') {
            alert('사원번호를 입력해주세요.');
            return;
        }

        // URLSearchParams를 사용하여 쿼리 파라미터를 만듭니다.
        const params = new URLSearchParams();
        params.append("emp_id", empId); // emp_id를 파라미터로 추가

        // GET 요청으로 사원번호를 URL 파라미터로 전송
        fetch(`/check.do?${params.toString()}`, {
            method: "GET"
        })
        .then((response) => response.json())
        .then(data => {
            if (data.exists) {
                alert('사원번호가 확인되었습니다.');
            } else {
                alert('사원번호가 없습니다.');
            }
        })
        .catch((error) => {
            console.error('Error:', error);
            alert('서버 오류가 발생했습니다.');
        });
    }




    
    
    </script>
</body>









</html>
