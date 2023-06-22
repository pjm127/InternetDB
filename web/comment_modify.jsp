<%@ page import="repository.CommentRepository" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="domain.Comment" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-21
  Time: 오전 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    int comment_id = Integer.parseInt(request.getParameter("comment_id"));

    CommentRepository commentRepository = CommentRepository.getInstance();
    String content = request.getParameter("content");
    System.out.println("content = " + content);
    int boardIdByCommentId = commentRepository.getBoardIdByCommentId(comment_id);
    Comment commentByCommentId = commentRepository.getCommentByCommentId(comment_id);
    commentByCommentId.setContent(content);
    System.out.println("commentByCommentId.getContent() = " + commentByCommentId.getContent());

    // 데이터베이스 업데이트 메서드 호출
    commentRepository.updateComment(comment_id, commentByCommentId.getContent());

    response.sendRedirect("view.jsp?board_id=" + boardIdByCommentId);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
