<%@ page import="domain.Member" %>
<%@ page import="repository.MemberRepository" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-04-28
  Time: 오후 2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    BoardRepository boardRepository = BoardRepository.getInstance();
    String title = request.getParameter("title");
    String content = request.getParameter("content");


    Board board = new Board(title,content, LocalDateTime.now());
    boardRepository.save(board);

%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>입력 완료된 회원 정보</h2>

</body>
</html>
