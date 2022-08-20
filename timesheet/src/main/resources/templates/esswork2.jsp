<!DOCTYPE html>
<html>

<head>
<title>test page</title>
<link rel="stylesheet" href=
"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src=
"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
</script>
<script src=
"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
</script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
    $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>



<script>
 $(function () {

    $("#datepicker").datepicker();

    

});


	$(document).ready(function () {

	// Denotes total number of rows
	var rowIdx = 0;

	// jQuery button click event to add a row
	$('#addBtn').on('click', function () {

		// Adding a row inside the tbody.
		$('#tbody').append(`<tr id="R${++rowIdx}">
		
			
			<td class="row-index text-center">
	
			<p><input type="date" name="datepicker" id="datepicker" autofocus>			
                         
			 
			</p>
			</td>
			
			<td>
				<input id="p1" type="text">
			</td>
			<td>
				<input id="p1" type="text">
			</td>
			<td>
				<legend>
             
            <input type="time" name="time">
        </legend>
  
			</td>
			<td>
				<legend>
             
			 <input type="time" name="time">
		 </legend>
   </td>
			<td class="text-center">
				<button class="btn btn-danger remove"
				type="button">Remove</button>
				</td>
			</tr>`);
	});


 
	// jQuery button click event to remove a row.
	$('#tbody').on('click', '.remove', function () {

		// Getting all the rows next to the row
		// containing the clicked button
		var child = $(this).closest('tr').nextAll();

		// Iterating across all the rows
		// obtained to change the index
		child.each(function () {

		// Getting <tr> id.
		var id = $(this).attr('id');

		// Getting the <p> inside the .row-index class.
		var idx = $(this).children('.row-index').children('p');

		// Gets the row number from <tr> id.
		var dig = parseInt(id.substring(1));

		// Modifying row index.
		idx.html(`Row ${dig - 1}`);

		// Modifying row id.
		$(this).attr('id', `R${dig - 1}`);
		});

		// Removing the current row.
		$(this).closest('tr').remove();

		// Decreasing total number of rows by 1.
		rowIdx--;
	});
	});
</script>
</head>


<body>
<style>
table,th, td {
  border: 1px solid black;
  
  border-style:solid;
  border-color: #96D4D4;

}


div {
    background: linear-gradient(to bottom, #ffffff 0%, #ccccff 100%);
}


thead {
    background: linear-gradient(to bottom, #00ccff 0%, #00ccff 100%);
}

#para {
    border: solid;
    border-style: solid;
    border-color: gray;
    border-width:medium;

    
}

p1 {
  font-family: "Times New Roman", Times, serif;
}


table.center {
  margin-left: auto;
  margin-right: auto;
}


	
		
th {
    background: linear-gradient(to bottom, #99ccff 0%, #99ccff 100%);

}
#para {
  padding: 15px;
}

		
		</style>
		
		<script>
$(function(){
    $("#datepicker").datepicker({
        dateFormat: "yy-mm-dd"
    });
});
</script>
<div class="container pt-4">
	<div class="table-responsive">
	<p>
       <table align="center" border=1>
       <tr>
         <div class="container">
         <span class="glyphicon glyphicon-user"></span></div>
               <td><b>   Employee Name:   </b><input type="text" id=ename </td>
               <td><b>User Id:</b>  <input type="text" id=userid</td>              
              </tr>
               <tr>
              <td><b>Reporting Manager:</b> <input type="text" id=rname></td>
               <td><b>Month:</b>
               <select id="mid">
               <option>may</option>
               <option>june</option>
               <option>july</option>
               <option>august</option>
           
               </select>
               </td> 
               </tr>
       
       </table>
        <br><br>
	<table id="para" class="table table-bordered" border="black" >
              
		<thead>
		<tr>
		     
			<th class="text-center">Activity Date </th>
			<th class="text-center">Project name</th>
             <th class="text-center">Project Description</th>
             <th class="text-center">Start Time</th>
             <th class="text-center">End time</th>
			<th class="text-center">Delete Row</th>


		</tr>
		</thead>
		<tbody id="tbody">



		</tbody>
	</table>
	</div>
	<button class="btn btn-md btn-dark"
	id="addBtn" type="button">
		Add new Row
	</button>
</div>
</div>
</p>
</body>

</html>

