<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="repository.MemberRepository" %>
<html>
<head>
    <title>게시물 수정</title>
</head>
<body>
<%

    request.setCharacterEncoding("utf-8");
    int boardId = Integer.parseInt(request.getParameter("board_id"));

    // 세션에서 학생 ID 가져오기
    String sessionStudentId = (String) session.getAttribute("student_id");

    // MemberRepository 인스턴스 생성 및 회원 ID 및 권한 가져오기
    MemberRepository memberRepository = MemberRepository.getInstance();
    BoardRepository boardRepository = BoardRepository.getInstance();
    // int sessionMemberId = memberRepository.getMemberIdByStudentId(sessionStudentId); // 세션 학번으로 member_id
    // String memRoleByStudentId = memberRepository.getMemRoleByStudentId(sessionStudentId); // 세션 학번으로 권한

    // 게시물의 작성자 회원 ID 가져오기
    int boardMemberId = boardRepository.getMemberIdByBoardId(boardId);

%>
</body>
</html>
