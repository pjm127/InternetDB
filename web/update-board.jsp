<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-03
  Time: 오후 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("utf-8");
  BoardRepository boardRepository = BoardRepository.getInstance();
  String title = request.getParameter("title");
  String content = request.getParameter("content");
  String youtube = request.getParameter("Youtube");
  String image = request.getParameter("image");

  System.out.println("image = " + title);
  System.out.println("image = " + content);


  Board board = new Board(title, content,youtube,image);
  Integer studentId = (Integer) session.getAttribute("studentId");
  boardRepository.save(board,studentId);
%>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h2>게시글 수정</h2>


</body>
</html>
