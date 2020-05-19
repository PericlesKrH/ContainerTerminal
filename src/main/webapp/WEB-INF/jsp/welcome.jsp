<!DOCTYPE html>
<html lang="en">

    <head>
          <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
        <link rel="stylesheet" type="text/css" href="css/stylewelcome.css">  


        <title>Welcome</title>
    </head>

    <body>

        <div id="fullscreen_bg" class="fullscreen_bg">

             <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-12 col-sm-8 col-xs-9 bhoechie-tab-container">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 bhoechie-tab-menu">
                            <ul class="list-group">
                                <a href="#" class="list-group-item active">
                                    <br/><br/><i class="glyphicon glyphicon-user"></i> User<br/><br/>
                                </a>
                                <a href="#" class="list-group-item ">
                                    <br/><br/><i class="glyphicon glyphicon-tasks"></i> Waybills<br/><br/>
                                </a>  
                                <a href="#" class="list-group-item ">
                                    <br/><br/><i class="glyphicon glyphicon-search"></i> Search Booking Number<br/><br/>
                                </a>
                                    <a href="#" class="list-group-item ">
                                    <br/><br/><i class="glyphicon glyphicon-envelope"></i> Contact<br/><br/>
                                </a>  
                                
                                <a href="#" class="list-group-item">
                                    <br/><br/><h4 class="glyphicon glyphicon-log-out"></h4> Logout<br/><br/>
                                </a>
                            </ul>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 bhoechie-tab">
                            <div class="bhoechie-tab-content active">
                                <center>
                                    <h1 class="glyphicon glyphicon-user" style="font-size:14em;color:#00001a"></h1>
                                    <h2 style="margin-top: 0;color:#00001a">Welcome</h2>
                                    <h3 style="margin-top: 0;color:#00001a">${user.username}</h3>
                                    <div style="margin-top: 0;color:#00001a">${user.address}</div>
                                    <div style="margin-top: 0;color:#00001a">${user.afm}</div>
                                    <div style="margin-top: 0;color:#00001a">${user.doy}</div>
                                </center>
                            </div>


                            <div class="bhoechie-tab-content">
                                <center>
                                    <h3 style="margin-top: 0;color:#00001a">My Waybills</h3>
                                    <br>
                                    <h1 class="glyphicon glyphicon-list-alt" style="font-size:12em;color:#00001a"></h1>
                                    <h2 style="margin-top: 0;color:#00001a;margin:20px;"><a href="/history" class="btn btn-sm btn-primary btn-block" role="button">History</a></h2>

                                </center>
                            </div>


                            <div class="bhoechie-tab-content">
                                <center>
                                    <h3 style="margin-top: 0;color:#00001a">Booking Number</h3>
                                    <h1 class="glyphicon glyphicon-file" style="font-size:12em;color:#00001a"></h1>
                                    <nav class="navbar navbar-light bg-light">
                                        <form class="form-inline" method="post" action="/search">
                                            <input class="form-control form-control-lg" type="search" name="search" placeholder="Booking Number" aria-label="Search">
                                            <button class="btn btn-primary" type="submit" >Search</button>
                                        </form>
                                        
                                    </nav>
                                </center>
                            </div>

                                     <div class="bhoechie-tab-content">
                                <center>
                                    <h3 style="margin-top: 0;color:#00001a">Contact</h3>
                                    <br>
                                    <h1 class="glyphicon glyphicon-envelope" style="font-size:12em;color:#00001a"></h1>
                                    <h2 style="margin-top: 0;color:#00001a;margin:20px;"><a href="/goToSeeChat" class="btn btn-sm btn-primary btn-block" role="button">Ask your Question</a></h2>

                                </center>
                            </div>

                                
                                
                            <div class="bhoechie-tab-content">
                                <center>
                                    <h3 style="margin-top: 0;color:#00001a">Logout</h3>
                                    <h1 class="glyphicon glyphicon-log-out" style="font-size:12em;color:#00001a"></h1>
                                    <h2 style="margin-top: 0;color:#00001a"><a href="/login" class="btn btn-sm btn-primary btn-block" role="button">Logout</a></h2>

                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $("div.bhoechie-tab-menu>ul.list-group>a").click(function (e) {
                    e.preventDefault();
                    $(this).siblings('a.active').removeClass("active");
                    $(this).addClass("active");
                    var index = $(this).index();
                    $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
                    $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
                });
            });

        </script>
    </body>

</html>