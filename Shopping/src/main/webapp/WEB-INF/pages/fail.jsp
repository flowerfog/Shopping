<%--
  Created by IntelliJ IDEA.
  User: 好
  Date: 2023/6/25
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    window.onload=function(){
        if("${addRes}"){
            alert("${addRes}")
            <%
            session.removeAttribute("addRes");
            %>
        }
    }
</script>
<body>
fail
</body>
</html>
