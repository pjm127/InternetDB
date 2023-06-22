<%@ page import="repository.MemberRepository" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    int boardId = Integer.parseInt(request.getParameter("board_id"));
    BoardRepository boardRepository = BoardRepository.getInstance();
    boardRepository.delete(boardId);
    response.sendRedirect("main_log.jsp");
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 삭제</title>
    <style>
        body {
            background-color: #f2f2f2;
            color: #222;
        }
    </style>

</head>
<body>
<h1>삭제 되었습니다.</h1>
<a href="main_log.jsp" style="font-size: 25px">메인 페이지로 돌아가기</a>
</body>
</html>