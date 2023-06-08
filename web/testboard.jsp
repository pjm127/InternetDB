<%@ page import="java.sql.*" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    BoardRepository boardRepository = BoardRepository.getInstance();

    List<Board> boardList = boardRepository.getBoard();

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

</div>
<%
    }
%>
</body>
</html>