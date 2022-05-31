<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="evaluation.EvaluationDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userID = null;
    if(session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    if(userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 해주세요.');");
        script.println("location.href = 'userLogin.jsp';");
        script.println("</script>");
        script.close();
        return;
    }

    String movieName = null;
    String directorName = null;
    int movieYear = 0;
    String movieDivide = null;
    String evaluationTitle = null;
    String evaluationContent = null;
    String movieStar = null;

    if(request.getParameter("movieName") != null) {
        movieName = request.getParameter("movieName");
    }

    if(request.getParameter("directorName") != null) {
        directorName = request.getParameter("directorName");
    }

    if(request.getParameter("movieYear") != null) {
        try {
            movieYear = Integer.parseInt(request.getParameter("movieYear"));
        } catch (Exception e) {
            System.out.println("강의 연도 데이터 오류");
        }
    }

    if(request.getParameter("movieDivide") != null) {
        movieDivide = request.getParameter("movieDivide");
    }

    if(request.getParameter("evaluationTitle") != null) {
        evaluationTitle = request.getParameter("evaluationTitle");
    }

    if(request.getParameter("evaluationContent") != null) {
        evaluationContent = request.getParameter("evaluationContent");
    }

    if(request.getParameter("movieStar") != null) {
        movieStar = request.getParameter("movieStar");
    }

    //입력이 안된 사항이 있을 때
    if (movieName == null || directorName == null || movieYear == 0 || movieDivide == null || evaluationTitle == null || evaluationContent == null || movieStar == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.');");
        script.println("history.back()");
        script.println("</script>");
        script.close();
        return;
    }

    //강의평가 등록 함수
    EvaluationDAO evaluationDAO = new EvaluationDAO();
    int result = evaluationDAO.write(new EvaluationDTO(0, userID, movieName, directorName, movieYear, movieDivide, evaluationTitle, evaluationContent, movieStar, 0));
    if (result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('강의 평가 등록에 실패했습니다.');");
        script.println("history.back()");
        script.println("</script>");
        script.close();
        return;
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'index.jsp'");
        script.println("</script>");
        script.close();
        return;
    }
%>