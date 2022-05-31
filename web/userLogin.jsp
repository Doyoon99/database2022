<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>영화 평가 사이트</title>
    <!--부트스트랩-->
    <link rel="stylesheet" href="./CSS/bootstrap.min.css">
    <!--커스텀 css-->
    <link rel="stylesheet" href="./CSS/custom.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.jsp">영화평가 웹 사이트</a>
    <button class="navbar-toggle" data-toggle="collapse" data-target="#resNav" aria-controls="resNav" aria-expanded="false" aria-label="resNav">
        <span class="navbar-toggle-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="resNav">
        <ul class="navbar-nav nav">
            <li class="nav-item">
                <a class="nav-link active" href="#">메인<span class="sr-only">current</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">회원관리</a>
                <div class="dropdown-menu" aria-labelledby="dropdown">
                    <a class="dropdown-item" href="userLogin.jsp">로그인</a>
                    <a class="dropdown-item" href="userJoin.jsp">회원가입</a>
                    <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
                </div>
            </li>
        </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
            </form>
    </div>
</nav>
<section class="container mt-3" style="max-width: 560px;">
        <form method="post" action="./userLoginAction.jsp">
            <div class="form-group">
                <label>아이디</label>
                <input type="text" name="userID" class="form-control">
            </div>
            <div class="form-group">
                <label>비밀번호</label>
                <input type="password" name="userPassword" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">로그인</button>
        </form>
</section>
<footer class="bg-dark mt-4 p-5 text-center" style="color: #ffffff;">
        Copyright &copy; 2022 박도윤 All Rights Reserved.
</footer>
    <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="./JS/jquery.min.js"></script>
    <!-- 파퍼 자바스크립트 추가하기 -->
    <script src="./JS/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./JS/bootstrap.min.js"></script>
</body>
</html>
