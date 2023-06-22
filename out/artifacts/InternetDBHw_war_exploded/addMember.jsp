<%@ page import="domain.Member" %>
<%@ page import="repository.MemberRepository" %>
<%@ page import="java.util.Objects" %>
<%@ page import="config.Encrypt" %>
<%@ page import="domain.UserStatus" %>
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
    response.sendRedirect("main_unlog.jsp");

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
        out.println("이미 사용 중인 학번.");
    } else {

        memberRepository.join(member);
        out.println("회원 가입이 완료되었습니다");
    }

    //비밀번호 확인
    if (Objects.equals(member.getPassword(), password_confirm)) {

        out.println("비밀번호 일치");
    } else {

        out.println("비밀번호가 일치하지 않습니다.");
    }
%>
</body>
</html>
