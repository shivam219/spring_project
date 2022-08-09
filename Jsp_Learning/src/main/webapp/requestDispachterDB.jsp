<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <title>Request Dispatcher DB</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 </head>
<body>


<%
RequestDispatcher rd = request.getRequestDispatcher("requestDispachter.jsp");
out.print("<h1 class='bg-danger text-primary' >Error </h1>");
//out.print(" <script> alert('you have already apply for leave');  </script>  ");
//out.print(" <script> confirm('You have aleady apply for this leave')</script> ");
rd.include(request, response);
//rd.forward(request, response);
try{
//Thread.sleep(5000);	
//response.sendRedirect("requestDispachter.jsp");
//rd.forward(request, response);
}catch(Exception e){
	
}
%> 
</body>
</html>