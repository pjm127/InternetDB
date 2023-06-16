<%@ page import="repository.MemberRepository" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    int boardId = Integer.parseInt(request.getParameter("board_id"));

    // 세션에서 학생 ID 가져오기
    int sessionStudentId = (int) session.getAttribute("student_id");

    // MemberRepository 인스턴스 생성 및 회원 ID 및 권한 가져오기
    MemberRepository memberRepository = MemberRepository.getInstance();
    BoardRepository boardRepository = BoardRepository.getInstance();
    int sessionMemberId = memberRepository.getMemberIdByStudentId(sessionStudentId); // 세션 학번으로 member_id
    String memRoleByStudentId = memberRepository.getMemRoleByStudentId(sessionStudentId); // 세션 학번으로 권한

    // 게시물의 작성자 회원 ID 가져오기
    int boardMemberId = boardRepository.getMemberIdByBoardId(boardId);

    if (sessionMemberId == boardMemberId || "ADMIN".equals(memRoleByStudentId)) {
        // 회원 ID가 일치하거나 권한이 ADMIN인 경우에만 삭제 처리
        try {
            boardRepository.delete(boardId);
            // 삭제 성공 시 처리할 내용
            response.sendRedirect("main_unlog.jsp"); // 삭제 후 게시물 목록 페이지로 이동하거나 원하는 페이지로 리다이렉트
        } catch (SQLException e) {
            // 삭제 실패 시 처리할 내용
            out.println("게시물 삭제에 실패했습니다.");
            e.printStackTrace();
        }
    } else {
        // 삭제 권한이 없는 경우에 대한 처리
        out.println("게시물을 삭제할 권한이 없습니다.");
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
    <style>
        body {
            background-color: #f2f2f2;
            color: #222;
        }
    </style>

</head>
<body>
<h1>삭제 되었습니다.</h1>
<a href="main_log.jsp" style="font-size: 25px">메인 페이지로 돌아가기</a>
</body>
</html>