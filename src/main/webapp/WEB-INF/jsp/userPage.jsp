<%-- 
    Document   : userPage
    Created on : Apr 13, 2020, 7:36:25 PM
    Author     : mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${user.username} !</h1>
        
        
        <a href="/history">History</a>
       
        <form method="post" action="/search">
               <label for="search">Search :</label><br>
               <input type="text"  name="search"><br>

            <input type="submit"> 
        </form>
        
        
        
    </body>
</html>
