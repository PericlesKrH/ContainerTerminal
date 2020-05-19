<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
      <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

   
   <script>$(document).ready( function () {
        $('#table_id').DataTable();
    } );</script>
    <title>Waybills</title>
    
</head>
<body style= "background-image: url(/images/waybill5.jpg); background-size:cover ">
    <div class="container-fluid">
    
    <br>

    <h1 style="text-align:center">Waybill(s)</h1>
    <br>
    <br>
    <table id="table_id" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%" style="background-color:rgb(231, 192, 119)">  
       
        <thead>
            <tr>
               
                <th>Booking Number</th>
                <th>Custom</th>
               
                <th>Container Number</th>
               
            </tr>
        </thead>
        <tbody>
            
            <c:forEach items="${kappa}" var="container">
                    <tr>
                          
                       <td>${ container.getBookingnumber()}</td>
                          <td>${ container.getCustom()}</td>
                        
                          <td>${ container.getContainerCollection().size()}</td>
                    </tr>
    </c:forEach>
                
                
        </tbody>
    </table>
    <br>
    <button type="button" class="btn btn-warning" onclick="history.back()"><i class="fa fa-arrow-circle-left"></i>Go back</button>
</div>

</body>




    




</html>