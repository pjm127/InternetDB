<%@ page import="domain.Member" %>
<%@ page import="repository.MemberRepository" %>
<%@ page import="java.util.Objects" %>
<%@ page import="config.Encrypt" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    MemberRepository memberRepository = MemberRepository.getInstance();
    Encrypt en = Encrypt.getInstance();

    Member member = new Member();
    member.setName(request.getParameter("name"));
    member.setStudentID(Integer.parseInt(request.getParameter("studentId")));
    member.setPassword(request.getParameter("password"));

    String password_confirm = request.getParameter("password_confirm");
    String password_confirm1 = request.getParameter("password");


%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>입력 완료된 회원 정보</h2>

<%
    // 중복 체크
    boolean isStudentIdDuplicate = memberRepository.findByStudentId(member.getStudentID());

    // 중복된 경우 에러 메시지 출력
    if (isStudentIdDuplicate) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 가입한 학번입니다.')");
        script.println("history.back()"); // 다시 로그인 페이지로 보낸다. 전 페이지
        script.println("</script>");
    } else {
        if (password_confirm1.equals(password_confirm)) {

            memberRepository.join(member);

            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href='main_unlog.jsp'"); // mainpage로 이동
            script.println("</script>");
        } else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력한 비밀번호가 불일치합니다.')");
            script.println("history.back()"); // 다시 로그인 페이지로 보낸다. 전 페이지
            script.println("</script>");
        }


    }

    // 비밀번호 확인

%>

</body>
</html>
