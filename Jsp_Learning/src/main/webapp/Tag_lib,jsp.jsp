<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%--<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

user c:set var =="";
 --%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<c:set var="na" value="shivam" />
<c:out value="${na}"></c:out>

<c:if test="${4>2}">
	<c:out value="Yes "></c:out>
</c:if>
</body>
</html>