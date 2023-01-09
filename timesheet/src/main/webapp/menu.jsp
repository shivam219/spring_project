<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<!DOCTYPE html>
<html> 
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- CSS-5.0.2  | JS-5.0.2 | -->
	<link href="css/bootstrap.min.css" rel="stylesheet"> 
	<link href="css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<!--Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=nihilPoppins:wght@100;200;400;500;600;700&family=Tai+Heritage+Pro:wght@700&display=swap" rel="stylesheet">
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.0.min.js"></script>
	<!-- <script src="js/select2.min.js"></script> -->
	<!--Font awesome icon -->
	<script src="https://kit.fontawesome.com/70c55b67fa.js" crossorigin="anonymous"></script>
	<link rel='icon' type='image/ico' href='images/esslogo.png' />
	<script src="css/sweetalert.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body> 
	<div class="container-fluid">
		<div class="row">
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #fff;border-bottom: 2px solid #e6f2fb;">
		<div class="container-fluid">  
			<a class="navbar-brand p-0" href="home"> <img src="images/esslogo.png" width="120" height="50" class="d-inline-block align-text-top"></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">	 <span class="navbar-toggler-icon">	</span></button> 	
			<div class="collapse navbar-collapse justify-content-md-end " id="navbarNavDropdown">
				<div class="justify-content-md-end">
					<ul class="navbar-nav">
						<c:forEach items="${menus}"  var="menu" >  
							<c:if test="${menu[0] == null }">
								<li	 class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="dropdown-menu" role="button" data-bs-toggle="dropdown" aria-expanded="false"> ${menu[2]} </a>
									<ul class="dropdown-menu" id="dropdown-menu">
										<c:forEach items="${menus}" var="submenu">  
										 
											<c:if test="${menu[1] == submenu[0]}"> 
												<li><a class="dropdown-item" href="${submenu[3]}">${submenu[2]} </a>
													<ul class="dropdown-menu dropdown-submenu menuSub">	
														<c:forEach items="${menus}" var="subinmenu">
														
															<c:if test="${submenu[1] == subinmenu[0]}"> 		
																<li> <a class="dropdown-item" href="${subinmenu[3]}">  ${subinmenu[2]}  </a> </li>
															</c:if>
														</c:forEach>  
													</ul> 
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</li>	 
							</c:if>
						</c:forEach>  

						<li class="nav-item dropdown justify-content-end">
							<a class="nav-link dropdown-toggle " href="dropdown-menu" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-circle-user ms-me-1"></i> ${empName} </a>
							<ul class="dropdown-menu text-center" id="dropdown-menu">
								<li><a class="dropdown-item" href="change-password">Change Password </a></li>
								<li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt fa-sm fa-fw text-dark-400"></i> Logout</a></li>
							</ul>
						</li>		 						
					</ul>
				</div>
			</div>
		</div>
	</nav>

	</div>
	</div>

	<script>
		$(".menuSub ").each(function (i,data) {
			if($(".menuSub").eq(i).find("li").length==0){
				$(".menuSub").eq(i).addClass("d-none");
			}
		})
	</script>
</body>


</html>