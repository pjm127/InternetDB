<%@ page import="repository.HeartRepository" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-22
  Time: 오후 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int boardId = Integer.parseInt(request.getParameter("board_id"));
    int sessionId = (Integer) session.getAttribute("studentId");
    HeartRepository heartRepository = HeartRepository.getInstance();
    heartRepository.checkHeart(sessionId, boardId);
    String redirectUrl = "/view.jsp?board_id=" + boardId;
    response.sendRedirect(redirectUrl);
%>


<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
