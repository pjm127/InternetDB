<%@ page import="domain.Member" %>
<%@ page import="repository.MemberRepository" %>
<%@ page import="java.util.Objects" %>
<%@ page import="config.Encrypt" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-04-28
  Time: 오후 2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    MemberRepository memberRepository = MemberRepository.getInstance();
    Encrypt en = Encrypt.getInstance();


    System.out.println("ssave");
    String username = request.getParameter("username");
    String studentId = request.getParameter("studentId");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String s = en.getSalt();
    String re_pas = en.getEnc(password,s);
    System.out.println("re_pas = " + re_pas);
    String password1 = request.getParameter("password1");


    Member member = new Member(id,username,password,studentId);
    memberRepository.saveMember(member);

%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>입력 완료된 회원 정보</h2>
<%
    if (Objects.equals(password, password1)) {
        // 비밀번호가 일치할 경우 회원 가입 로직 수행
        // 여기에 필요한 코드를 추가하세요
        out.println("<p>회원 가입이 완료되었습니다.</p>");
    } else {
        // 비밀번호가 일치하지 않을 경우 에러 메시지 출력
        out.println("<p>비밀번호가 일치하지 않습니다.</p>");
    }
%>
</body>
</html>
