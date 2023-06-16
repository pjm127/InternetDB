<%@ page import="domain.Member" %>
<%@ page import="repository.MemberRepository" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    BoardRepository boardRepository = BoardRepository.getInstance();

    String savePath = "C:\\Users\\mikey\\Desktop\\InternetDBHw\\web\\img";
    String file = "";
    String oriFile = "";
    int sizeLimit = 5 * 1024 * 1024;

    MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
    String title = multi.getParameter("title");
    String content = multi.getParameter("content");
    Board board = new Board(title, content);
    Enumeration files = multi.getFileNames();
    if (files.hasMoreElements()) {
        String name = (String) files.nextElement();
        file = multi.getFilesystemName(name);
        oriFile = multi.getOriginalFileName(name);
        board.setFilepath(file);
    }

    // 유튜브 URL 처리
    String youtubeUrl = multi.getParameter("youtubeUrl");
    board.setYoutube(youtubeUrl);

    // 게시글 저장
    boardRepository.save(board, 666);


    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("location.href='main_log.jsp'"); // mainpage로 이동
    script.println("</script>");
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%=application.getContextPath()%>
<%= request.getSession().getServletContext().getRealPath("/")%>
<%--<h2>입력 완료된 회원 정보</h2>--%>
<%--<p>제목: <%= board.getTitle() %>--%>
<%--</p>--%>
<%--<p>내용: <%= board.getContent() %>--%>
<%--</p>--%>

<%--<p>파일 이름: <%= board.getFilepath() %>--%>
<%--</p>--%>

<%--<p>유튜브 URL: <%= board.getYoutube() %>--%>
</p>
</body>
</html>
