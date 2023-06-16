<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="repository.MemberRepository" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<html>
<head>
    <title>게시물 수정</title>
</head>
<body>
<%

    request.setCharacterEncoding("utf-8");
    int boardId = Integer.parseInt(request.getParameter("board_id"));
    BoardRepository boardRepository = BoardRepository.getInstance();
    int sessionId = (Integer) session.getAttribute("studentId");


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
    boardRepository.update(board, boardId);


    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("location.href='main_log.jsp'"); // mainpage로 이동
    script.println("</script>");

%>
</body>
</html>
