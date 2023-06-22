<%@ page import="repository.CommentRepository" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-18
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    int comment_id = Integer.parseInt(request.getParameter("comment_id"));
    CommentRepository commentRepository = CommentRepository.getInstance();
    int boardIdByCommentId = commentRepository.getBoardIdByCommentId(comment_id);
    commentRepository.deleteComment(comment_id);

    String redirectUrl = "/view.jsp?board_id=" + boardIdByCommentId;
    response.sendRedirect(redirectUrl);
%>


<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
