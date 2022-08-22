<%@ include file="menu.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
<title>Project Mapping</title>
<link href="css/select@2.4.1.0.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>

<body>


	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 offest-3">

				<div class="card-body">
					<form action="assignprojectsave" method="POST">
						<div class="form-group mb-3">
							<label for="">Select Employee</label> <select name="brandlist[]"
								multiple id="brandlist1[]" class="form-control">
								<c:forEach items="${empList}" var="empName" varStatus="loop">
									<option value="${empName.getEmpId()}">${empName.getEmpName()}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group mb-3">
							<label for="">Select Project</label> <select name="brandlist2[]"
								multiple id="brandlist2[]" class="form-control">
								<c:forEach items="${projectList}" var="projectName"
									varStatus="loop">
									<option value="${projectName.getProjectid()}">${projectName.getProjectname()}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<button type="submit" onclick="show()" name="save_multi_select"
								class="btn btn-primary">Assign Project</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="js/select2@4.1.0.min.js"></script>
	<script>
		$(".js-example-basic-multiple-limit").select2({
			maximumSelectionLength : 2
		});
		$('select').select2({
			placeholder : 'This is my placeholder',
			allowClear : true
		});
		function show() {
			console.log($("#brandlist").val());
		}
	</script>
	<div class="row">
				<div class="col-xs-5">
					<select name="from" id="undo_redo" class="form-control" size="13" multiple="multiple">
						<c:forEach items="${projectList}" var="projectName"	varStatus="loop">
							<option value="${projectName.getProjectid()}">${projectName.getProjectname()}</option>
						</c:forEach>
					</select>
				</div>
				
				<div class="col-xs-2">
					<button type="button" id="undo_redo_undo" class="btn btn-primary btn-block">undo</button>
					<button type="button" id="undo_redo_rightAll" class="btn btn-default btn-block"><i class="glyphicon glyphicon-forward"></i></button>
					<button type="button" id="undo_redo_rightSelected" class="btn btn-default btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
					<button type="button" id="undo_redo_leftSelected" class="btn btn-default btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
					<button type="button" id="undo_redo_leftAll" class="btn btn-default btn-block"><i class="glyphicon glyphicon-backward"></i></button>
					<button type="button" id="undo_redo_redo" class="btn btn-warning btn-block">redo</button>
				</div>
				
				<div class="col-xs-5">
					<select name="to" id="undo_redo_to" class="form-control" size="13" multiple="multiple"></select>
				</div>
			</div>
</div>
<script src="js/multiselect.js"></script>
<script type="text/javascript">
	$(document).ready(function() {


		$('#undo_redo').multiselect();
	});
	
	</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>

</html>