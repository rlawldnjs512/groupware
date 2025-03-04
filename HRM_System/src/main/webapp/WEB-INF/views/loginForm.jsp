<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/7.0.0/normalize.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/loginform.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div class="login">
  <div class="form">
    <h2>Sign In</h2>
    <form action="./login.do" method="POST">
      <div class="form-field">
        <label for="login-mail"><i class="fa fa-user"></i></label>
        <input id="emp_id" type="text" name="emp_id" placeholder="사원번호" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
        <svg>
          <use href="#svg-check" />
        </svg>
      </div>
      <div class="form-field">
        <label for="login-password"><i class="fa fa-lock"></i></label>
        <input id="password" type="password" name="password" placeholder="비밀번호" pattern=".{6,}" required>
        <svg>
          <use href="#svg-check" />
        </svg>
      </div>
      <button type="submit" class="button">
        <div class="arrow-wrapper">
          <span class="arrow"></span>
        </div>
        <p class="button-text">Login</p>
      </button>
    </form>
  </div>
  <div class="finished">
    <svg>
      <use href="#svg-check" />
    </svg>
  </div>
</div>

<!-- //--- ## SVG SYMBOLS ############# -->
<svg style="display:none;">
  <symbol id="svg-check" viewBox="0 0 130.2 130.2">
    <polyline points="100.2,40.2 51.5,88.8 29.8,67.5 "/>
  </symbol>
</svg>


</body>
</html>
