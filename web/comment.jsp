<%@ page import="repository.CommentRepository" %>
<%@ page import="repository.MemberRepository" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-16
  Time: 오후 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    request.setCharacterEncoding("utf-8");
    CommentRepository commentRepository = CommentRepository.getInstance();
    MemberRepository memberRepository = MemberRepository.getInstance();
    int boardId = Integer.parseInt(request.getParameter("board_id"));

    int sessionId = (Integer) session.getAttribute("studentId");
    int memberId = memberRepository.getMemberIdByStudentId(sessionId);

    String content = request.getParameter("content");
    commentRepository.save(content, memberId, boardId);
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("location.href='view.jsp?board_id=" + boardId + "'");
    script.println("</script>");
%>


<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
