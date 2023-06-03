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
    <h3><a href="board.jsp?id=<%= board.getId() %>"><%= board.getTitle() %></a></h3>
    <p><%= board.getContent() %></p>
    <p><%= board.getId() %></p>
    <p>작성일: <%= board.getCreate_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %></p>
</div>
<%
    }
%>
</body>
</html>