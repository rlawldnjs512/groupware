<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>비밀번호 재설정</title>
    <style type="text/css">
        /* 전체 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* 카드 스타일 */
        .card {
            width: 100%;
            max-width: 500px;
            margin: 20px auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: white;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .card-header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            font-size: 1.8rem;
            font-weight: bold;
            text-align: center;
        }

        .card-body {
            padding: 30px;
        }

        /* 폼 그룹 스타일 */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 1.1rem;
            font-weight: 600;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            outline: none;
            background-color: #f9f9f9;
        }

        .form-group input:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
        }

        /* 버튼 스타일 */
        .btn {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-size: 1.1rem;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn:active {
            background-color: #003f7d;
        }

        /* 반응형 디자인 */
        @media (max-width: 600px) {
            .card {
                margin: 10px;
            }

            .card-header {
                font-size: 1.5rem;
            }
        }
    </style>
</head>

<body>
    <div class="content" id="content">
        <div class="main-content">
            <div class="card">
                <div class="card-header">
                    비밀번호 재설정
                </div>
                <div class="card-body">
                    <form action="/updatePassword.do" method="POST" onsubmit="return checkPassword();">
                        <div class="form-group">
                            <label for="newPassword">새 비밀번호:</label>
                            <input type="password" id="newPassword" name="newPassword" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">새 비밀번호 확인:</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" required>
                        </div>
                        <button type="submit" class="btn">변경</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>








<script type="text/javascript">
        // 비밀번호 유효성 검사 함수
        function checkPassword() {
        	
        
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            
            
            var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
            
            if (!passwordRegex.test(newPassword)) {
                // 유효성 검사 실패 시 경고 메시지
                Swal.fire({
                    text: "비밀번호는 영문자와 숫자를 포함하여 최소 8자리 이상이어야 합니다.",
                    icon: 'error',
                    confirmButtonColor: '#FF0000'
                });
                return false; // 폼 제출을 막음
            }
            
            if(newPassword !== confirmPassword){
            	  Swal.fire({
                      text: "비밀번호가 일치하지 않습니다",
                      icon: 'error',
                      confirmButtonColor: '#FF0000'
                  });
            	
            	return false;
            }
            return true;
        }

    </script>
</html>
