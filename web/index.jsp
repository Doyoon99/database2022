<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.userDAO" %>

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
        <a class="navbar-brand" href="#">영화평가 웹 사이트</a>
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
    <section class="container">
        <form method="get" action="./index.jsp" class="form-inline mt-3 mb-5">
            <select name="MovieDivide" class="form-control mx-1 mt-2 mb-3">
                <option value="전체">전체</option>
                <option value="로맨스">로맨스</option>
                <option value="스릴러">스릴러</option>
                <option value="드라마">드라마</option>
                <option value="기타">기타</option>
            </select>
            <input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
            <button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
            <a class="btn btn-primary mx-1 mt-2" data-toggle="modal" data-target="#registerModal">등록하기</a>
        </form>
        <!--실제로 평가를 등록했을 때 화면 1-->
        <div class="card bg-light mt-5">
            <div class="card-header bg-light">
                <div class="row">
                    <div class="col-10 text-left"><b>인터스텔라</b>&nbsp;<small>크리스토퍼 놀란</small></div>
                    <div class="col-4 text-right">
                        별점 <span sytle="color: red;">5</span>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <h5 class="card-title">
                    우주를 물씬 느낄 수 있습니다.&nbsp;<small>2014년 관람</small>
                </h5>
                <p class="card-text">a열에 앉아서 봐서 목이 아팠지만 저도 우주에 있는 경험이었어요!</p>
                <div class="col-9 text-left">
                    <span style="color: green;">(추천: 15)</span>
                </div>
                <div class="col-3 text-right">
                    <a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
                    <a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
                </div>
            </div>
        </div>
        <!--실제로 평가를 등록했을 때 화면 2-->
        <div class="card bg-light mt-5">
            <div class="card-header bg-light">
                <div class="row">
                    <div class="col-10 text-left"><b>삼진그룹 영어토익반</b>&nbsp;<small>이종필</small></div>
                    <div class="col-4 text-right">
                        별점 <span sytle="color: red;">5</span>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <h5 class="card-title">
                    반전에 반전을 거듭하는 짜릿함.&nbsp;<small>2020년 관람</small>
                </h5>
                <p class="card-text">어제의 너 보다 오늘 더 성장했는데~? ㅋㅋ 명대사! 너무재밌었어요!! +_+ 기대이상이었습니다~</p>
                <div class="col-9 text-left">
                    <span style="color: green;">(추천: 102)</span>
                </div>
                <div class="col-3 text-right">
                    <a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
                    <a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modalEX" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEX">평가 등록</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="./evaluationRegisterAction.jsp" method="post">
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label>영화명</label>
                                <input type="text" name="MovieName" class="form-control" maxlength="20">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>감독명</label>
                                <input type="text" name="DirectorName" class="form-control" maxlength="20">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label>연도</label>
                                <select name="MovieYear" class="form-control">
                                    <option value="2000년이전">2000년 이전</option>
                                    <option value="2000년대">2000년대</option>
                                    <option value="2010년대">2010년대</option>
                                    <option value="2020년대" selected>2020년대</option>
                                </select>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>별점</label>
                                <select name="MovieStar" class="form-control">
                                    <option value="5" selected>5</option>
                                    <option value="4">4</option>
                                    <option value="3">3</option>
                                    <option value="2">2</option>
                                    <option value="1">1</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>한줄평</label>
                            <input type="text" name="evaluationTime" class="form-control" maxlength="30">
                        </div>
                        <div class="form-group">
                            <label>상세평가</label>
                            <textarea name="evaluationContent" class="form-control" maxlength="2048" style="height: 180px"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary">등록하기</button>
                </div>
            </div>
        </div>
    </div>
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
