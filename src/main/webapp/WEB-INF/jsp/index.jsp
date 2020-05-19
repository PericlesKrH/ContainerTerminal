
<!DOCTYPE html>
<html lang="en">
<head>
<title>Containers Website</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css">
<!-- //font -->
<script src="script/jquery-1.11.1.min.js"></script>
<script src="script/bootstrap.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script> 

</head>
<body>
	<!-- banner -->
	<div class="banner">
		<div class="header-top">
			<div class="container">
				<div class="header-top-left">
					<ul>
						<li><i class="fa fa-location-arrow" aria-hidden="true"></i> Akti Miaouli, Piraeus Greece</li>
						<li><i class="fa fa-phone" aria-hidden="true"></i> (+30) 210-1000000</li>
					</ul>
				</div>
				<div class="agileinfo-social-grids">
					<ul>
						<li><a href="/login" class="btn btn-success" role="button" style="color:white; " >Login</a></li>
						
					</ul>
				</div>
			</div>
		</div>
		<div class="header">
			<div class="container">
				<div class="header-left">
					<div class="w3layouts-logo">
						<h1>
							<a href="/">Containers </a>
						</h1>
					</div>
				</div>
				<div class="header-right">
					<div class="top-nav">
						<nav class="navbar navbar-default">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
							</div>
							<!--navbar-header-->
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
									<li><a href="/" class="active">Home</a></li>
									<li><a href="/about">About</a></li>
									<li><a href="/gallery">Gallery</a></li>
									
								</ul>	
								<div class="clearfix"> </div>	
							</div>
						</nav>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="w3layouts-banner-slider">
			<div class="container">
				<div class="slider">
					<div class="callbacks_container">
						<ul class="rslides callbacks callbacks1" id="slider4">
							<li>
								<div class="agileits-banner-info">
									<h3>Management <span>Integrated</span></h3>
									<div class="w3-button">
										<a href="/contact">Contact us</a>
									</div>
								</div>
							</li>
							<li>
								<div class="agileits-banner-info">
									<h3>Software <span>System</span></h3>
									<div class="w3-button">
										<a href="/contact">Contact us</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<script src="script/responsiveslides.min.js"></script>
					<script>
						// You can also use "$(window).load(function() {"
						$(function () {
						  // Slideshow 4
						  $("#slider4").responsiveSlides({
							auto: true,
							pager:true,
							nav:true,
							speed: 500,
							namespace: "callbacks",
							before: function () {
							  $('.events').append("<li>before event fired.</li>");
							},
							after: function () {
							  $('.events').append("<li>after event fired.</li>");
							}
						  });
					
						});
					 </script>
					<!--banner Slider starts Here-->
				</div>
			</div>
		</div>
	</div>
	<!-- //banner -->
	<!-- welcome -->
	
</body>	
</html>