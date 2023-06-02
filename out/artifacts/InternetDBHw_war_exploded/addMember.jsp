<%@ page import="domain.Member" %>
<%@ page import="repository.MemberRepository" %>
<%@ page import="java.util.Objects" %>
<%@ page import="config.Encrypt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    MemberRepository memberRepository = MemberRepository.getInstance();
    Encrypt en = Encrypt.getInstance();

    String username = request.getParameter("username");
    String studentId = request.getParameter("studentId");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String s = en.getSalt();
    String re_pas = en.getEnc(password, s);
    String password1 = request.getParameter("password1");

%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>입력 완료된 회원 정보</h2>
<%
    // 중복 체크
    boolean isIdDuplicate = memberRepository.findByid(id);
    boolean isStudentIdDuplicate = memberRepository.findByStudentId(studentId);

    // 중복된 경우 에러 메시지 출력
    if (isIdDuplicate) {
        out.println("이미 사용 중인 사용자명.");
    } else if (isStudentIdDuplicate) {
        out.println("이미 사용 중인 학번.");
    } else {
        // 비밀번호가 일치할 경우 회원 가입 로직 수행
        Member member = new Member(id, username, password, studentId);
        memberRepository.join(member);
        out.println("회원 가입이 완료되었습니다");
    }

    if (Objects.equals(password, password1)) {
        // 비밀번호가 일치할 경우 회원 가입 로직 수행
        out.println("회원 가입이 완료되었습니다.");
    } else {
        // 비밀번호가 일치하지 않을 경우 에러 메시지 출력
        out.println("비밀번호가 일치하지 않습니다.");
    }
%>
</body>
</html>
