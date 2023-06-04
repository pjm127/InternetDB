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
    <p><h2>제목</h2><%= board.getTitle() %></p>
    <p><h2>내용</h2><%= board.getContent() %></p>
    <p><h2>id</h2><%= board.getId() %></p>
    <p><h2>작성자</h2><%= board.getWriter() %></p>
    <p>작성일: <%= board.getCreate_date().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %></p>
</div>
<%
    }
%>
</body>
</html>