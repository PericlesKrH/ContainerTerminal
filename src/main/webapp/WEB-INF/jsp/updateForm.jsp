
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Edit Waybill</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="/css/material-design-iconic-font/material-design-iconic-font.min.css">
		
		<!-- STYLE CSS -->
		<link rel="stylesheet" href="/css/styleupdateform.css">
	</head>

	<body>

		<div class="wrapper">
			<div class="inner">
                            <form action="/updatedForm"  method="POST">
					<h3>Edit Waybill</h3>
					<br>
					<label class="form-group">
						<input type="hidden" name="uid" id="id" class="form-control" value="${sea.getId()}">
					</label>
					<label class="form-group">
						<input type="text" name="bn" id="bnumber" class="form-control" value="${sea.getBookingnumber()}" >
						<span for="">Booking Number</span>
						<span class="border"></span>
					</label>
					<label class="form-group" >
						<input type="text" name="custom" id="custom" class="form-control" value="1">
						<span for="">Custom</span>
						<span class="border"></span>
					</label>
				
					<label class="form-group" >
						<input type="hidden" name="userid" id="userid" class="form-control" value="${sea.getUserid().getUserid()}" >
					</label>
					<button>Submit 
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		
                </div>
    
                                        
			</body>
</html>