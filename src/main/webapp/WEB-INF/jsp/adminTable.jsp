<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
                $('#table_id1').DataTable();
            });
        </script>
        <title>Waybill history</title>

    </head>
     <body style="background-color: rgb(241, 241, 213);">
        <br>
        <h1 style="text-align:center">Waybills</h1>
        <br>
        <br>
      <table id="table_id" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%" style="background-color: rgb(241, 241, 158);">
        <!-- class:display -->
            <thead>
                <tr>

                    <th>Booking Number</th>
                    <th>Custom</th>
                   
                    <th>Container Numbers</th>
                    <th>Action</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items="${all}" var="bill">
                    <tr>

                        <td>${ bill.getBookingnumber()}</td>


                        <c:set var="custom" scope="session" value="${bill.getCustom()}"/>


                        <c:if test="${custom==1}">
                            <td><span class="material-icons">done</span></td>
                        </c:if>
                        <c:if test="${custom==0}">                    
                            <td><span class="material-icons">schedule</span></td>
                        </c:if>
                      
                        <td>${ bill.getContainerCollection().size()}</td>
                        <c:set var="paid" value="${ bill.getCustom()}"/>
                        <c:if test="${paid==0}">
                            <td><a href="preupdate/${bill.getId()}"><span class="material-icons">
                                        input
                                    </span></a></td>
                                </c:if>
                                <c:if test="${paid==1}">                        
                            <td><span class="material-icons">done</span></td>                       
                        </c:if>                
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <br>

        <br>
        <h1 style="text-align:center">Container Info</h1>
        <br>
        <br>
        <table id="table_id1" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%" style="background-color: rgb(241, 241, 158);" >
        
        <!-- class:display -->
            <thead>
                <tr>

                    <th>Container Name</th>
                    <th>Type</th>
                    <th>Discharged</th>
                    <th>Booking Numbers</th>
                    <th>Action</th>


                </tr>
            </thead>
            <tbody>
                <c:forEach items="${containers}" var="con">
                    <tr>

                        <td>${ con.getContainername()}</td>
                        <td>${ con.getType()}</td>

                        <c:set var="discharged" scope="session" value="${con.getDischarged()}"/>

                        <c:if test="${discharged==0}">
                            <td><span class="material-icons">schedule</span></td>
                        </c:if>
                        <c:if test="${discharged==1}">
                            <td>${con.getDate()}</td>                                    
                        </c:if>



                        <td>${con.getOrdernumber().getBookingnumber()}</td>                        
                        <td>
                            <c:if test="${discharged==0}">
                                <a href="preUpdateCon/${con.getContainerid()}">
                                    <span class="material-icons">play_for_work</span>                                    
                                </a>
                            </c:if>
                            <c:if test="${discharged==1}">
                                <a>
                                    <span class="material-icons">done</span>
                                </a>
                            </c:if>

                        </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
        <br>
         <div style="text-align:center;"> <button type="button" class="btn btn-warning" onclick="history.back()"><i class="fa fa-arrow-circle-left"></i> Go back</button></div>
    </body>








</html>