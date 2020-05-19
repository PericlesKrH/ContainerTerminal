<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Edit Container</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
        type="text/javascript"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css"
              rel="stylesheet" type="text/css" />
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="/css/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
		
		<!-- STYLE CSS -->
		<link rel="stylesheet" href="/css/styleupdatecon.css">
	</head>

	<body>

		<div class="wrapper">
			<div class="inner">
                            <form action="/updatedCon" method="POST">
					<h3>Edit Container</h3>
					<br>
					<label class="form-group">
						<input type="hidden" class="form-control" name="uid" value="${con.getContainerid()}">
					</label>
                    <label class="form-group">
						<input type="hidden" name="bn" value="${con.getContainername()}">
                    </label>
                    <label class="form-group">
						<input type="hidden" name="type" value="${con.getType()}">
                    </label>
                    <label class="form-group">
						<input type="hidden" name="dis" value="1">
                    </label>
                    <label class="form-group">
						<input type="hidden" name="billId" value="${con.getOrdernumber().getId()}">
					</label>
					
					
					<label class="form-group">
                        <input type="text" id="cName" class="form-control" value="${con.getContainername()}">
						<span for="">Container Name</span>
						<span class="border"></span>
					</label>
					<label class="form-group" >
						<input type="text"  id="cType" class="form-control" value="${con.getType()}">
						<span for="">Container Type</span>
						<span class="border"></span>
					</label>
					
						<label class="form-group" >
						<input type="date" name="disDate"  id="datepicker" class="form-control" >
						<span for="">Discharged</span>
						<span class="border"></span>
					</label>
					<label class="form-group" >
						<input type="text" id="cbill" class="form-control" value="${con.getOrdernumber().getBookingnumber()}">
						<span for="">Booking Number</span>
						<span class="border"></span>
					</label>
						<button>Submit 
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		</div>
	</body>
</html>