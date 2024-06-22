<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%request.getRequestDispatcher(request.getContextPath()+"/initShopping").forward(request,response);%>
</body>
</html>
