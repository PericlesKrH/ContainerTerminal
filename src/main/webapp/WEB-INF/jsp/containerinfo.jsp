<%-- 
    Document   : containerinfo
    Created on : Apr 14, 2020, 7:23:56 PM
    Author     : mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Container info!</h1>

       
                                  
               
 
       <table style="width:100%" border="1">
  <tr>
    <th>Container Name</th>
    <th>Date</th> 
    <th>Discharged</th>
    <th>Order Number</th>
    <th>Type</th>
  </tr>
 
     <c:forEach items="${containers}" var="container">
                    <tr>
                        <td>${ container.getContainername()}</td>
                        <td>${ container.getDate()}</td>
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
                        <td>${  container.getOrdernumber().getBookingnumber()}</td>
                        <td>${container.getType()}</td>



                    </tr>
                </c:forEach>

 
 </table> 
        <a href="/payment">Pay</a>
  
    </body>
</html>
