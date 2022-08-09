<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Erroe Generating by user</title>
</head>
<body>
<% int aasd=3; %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="na" value="shivam" />
<c:set var="na2" value="shivam" />
<c:out value="${na}"></c:out>
<c:if test="${1>2}">
	<c:out value="Yes "></c:out>
</c:if>
</body>
</html> 