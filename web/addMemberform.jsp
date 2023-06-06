<%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-04-28
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
 <h2>회원의 정보 입력 폼</h2>
<form method="post" action="addMember.jsp">
    <table>
        <tr>
            <td> 이메일</td>
            <td> <input type="text" name="email" size="20" ></td>
        </tr>


        <tr>
            <td> 비밀번호</td>
            <td> <input type="text" name="password" size="20" ></td>
        </tr>
        <tr>
            <td> 비밀번호 다시 입력</td>
            <td> <input type="text" name="password1" size="20" ></td>
        </tr>




        <tr>
            <td> 학번 </td>
            <td> <input type="text" name="studentId" size="20" ></td>
        </tr>



        <tr>
            <td> <input type="submit" value="전송"> </td>
            <td> <input type="reset" value="취소"> </td>
        </tr>

    </table>
</form>
</body>
</html>
