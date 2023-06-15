<%@ page import="java.sql.*" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("utf-8");
  BoardRepository boardRepository = BoardRepository.getInstance();

  // URL에서 board_id 값을 가져옵니다.
  Integer boardId = request.getParameter("board_id");

  // boardId를 이용하여 해당 게시물의 정보를 조회합니다.
  Board board = boardRepository.getBoard(boardId);
%>
<html>
<head>
  <title>게시물 상세 정보</title>
</head>
<body>
<h1>게시물 상세 정보</h1>
<div>
  <h2><%= board.getTitle() %></h2>
  <p><%= board.getContent() %></p>

</div>
</body>
</html>
