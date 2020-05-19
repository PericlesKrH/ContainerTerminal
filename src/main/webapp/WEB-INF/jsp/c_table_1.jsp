<!DOCTYPE html>
<html lang="en">
<head>
   <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
   <script>$(document).ready( function () {
        $('#table_id').DataTable();
    } );</script>
    <title>Containers</title>
    
</head>
<body style="background-image: url(/images/container.jpg);">
   <div class="container-fluid">
  
    <br>
    <h1 style="text-align:center">Container(s)</h1>
    <br>
    <br>
    <table id="table_id" class="display" style="background-color:rgb(233, 161, 93)">
        <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Type</th>
                <th>Discharged</th>
                <th>Date</th>
                <th>Booking Number</th>
            </tr>
        </thead>
        <tbody>
             <c:forEach items="${containers}" var="container">
                    <tr>
                        <td>${ container.getContainerid()}</td>
                        <td>${ container.getContainername()}</td>
                        <td>${ container.getType()}</td>
                        <td>
                        
                        <c:choose>
    <c:when test="${ container.getDischarged()==0}">
       ${"No"}
        <br />
    </c:when>    
    <c:otherwise>
        ${"Yes"} 
        <br />
    </c:otherwise>
</c:choose>
                        </td>
                         <td>${container.getDate()}</td>
                        <td>${  container.getOrdernumber().getBookingnumber()}</td>
                       



                    </tr>
                </c:forEach>

            
            
            
        </tbody>
    </table>
    <br>
    <div style="text-align: center;"><a class="btn btn-warning btn-lg" href="/payment" role="button" >Payment preview</a></div>
<br>
    <div style="text-align:left;"><button type="button" class="btn btn-warning" onclick="history.back()"><i class="fa fa-arrow-circle-left"></i>Go back</button></div>
</div>


</body>
</html>