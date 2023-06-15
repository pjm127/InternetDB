<%@ page import="java.sql.*" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    BoardRepository boardRepository = BoardRepository.getInstance();

    List<Board> boardList = boardRepository.getBoardList();
%>
<html>
<head>
    <title>게시판</title>
</head>
<body>
<%
    for (Board board : boardList) {
%>
<div>
    <!-- 게시글 제목을 클릭하면 해당 게시물의 상세 페이지로 이동합니다. -->
    <%= board.getId() %>">
    <%= board.getTitle() %>
    <%= board.getContent() %>
    <%= board.getFilepath() %>
</div>
<%
    }
%>
</body>
</html>
