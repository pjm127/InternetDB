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
  BoardRepository boardRepository = BoardRepository.getInstance();
  //세션에 저장된 member_id와 게시글에 저장된 memebr_id을 비교 후 같으면 수정
  // 달라도 member_id로 member.getUserStatus 조회 UserStauts ==ADMIN이면 수정 가능
%>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h2>게시글 수정</h2>


</body>
</html>
