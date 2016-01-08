<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>The NeuBlue bootstrap Website Template | About :: w3layouts</title>
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		 <!-- Custom Theme files -->
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		 <!-- start-smoth-scrolling-->
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<link rel="stylesheet" href="css/circle.css">

		<script type="text/javascript">

			var Arr_ContName=[];
			var Arr_ContId=[];
			var Arr_ContType=[];
			var Arr_ContQuan=[];
			var rasp_id;

			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});


				resp=localStorage.getItem("container_details");
				resp=JSON.parse(resp);


				var size=resp.no_of_container;
				listsize=size;

				for(var i=1;i<=size;i++)
				{
					var came=resp['container'+i+'_name'];
					var rid=resp['rasp_serial_no];
					var cid=resp['container'+i+'_id'];
					var ctype=resp['container'+i+'_type'];
					var cquantity=resp['container'+i+'_quantity'];
                   //$("#rasp_table").append("<tr ><td style='vertical-align: middle;text-align: center' > <label ><input type='radio' name='rasp_button' value='"+i+"'  /></label></td><td onclick='getContainerDetails("+i+");'><img src='/images/raspberry_logo.png'/></td><td style='vertical-align: middle;text-align: center' id='rasp_name"+i+"' onclick='getContainerDetails("+i+");'>"+x+"</td><td style='vertical-align: middle;text-align: center' id='rasp_serial_no"+i+"' onclick='getContainerDetails("+i+");'>"+y+"</td></tr>");
					Arr_ContName[i]=cname;
					Arr_ContId[i]=cid;
					Arr_ContType[i]=ctype;
					Arr_ContQuan[i]=cquantity;
					rasp_id=rid;

					$("#rasp_table").append("<tr ><td style='vertical-align: middle;text-align: center' > <label ><input type='radio' name='rasp_button' value='"+i+"'  /></label></td><td onclick='getContainerDetails("+i+");'><img src='/images/raspberry_logo.png'/></td><td style='vertical-align: middle;text-align: center' id='rasp_name"+i+"' onclick='getContainerDetails("+i+");'>"+x+"</td><td style='vertical-align: middle;text-align: center' id='rasp_serial_no"+i+"' onclick='getContainerDetails("+i+");'>"+y+"</td></tr>");

				}



			});
		</script>
		 <!-- start-smoth-scrolling-->
		<!--webfonts-->
		<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700|Open+Sans:400italic,600italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Lora:400,700,900,400italic,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
		<!---//webfonts-->
		<!--start-top-nav-script-->
		<script>
			$(function() {
				var pull 		= $('#pull');
					menu 		= $('nav ul');
					menuHeight	= menu.height();
				$(pull).on('click', function(e) {
					e.preventDefault();
					menu.slideToggle();
				});
				$(window).resize(function(){
	        		var w = $(window).width();
	        		if(w > 320 && menu.is(':hidden')) {
	        			menu.removeAttr('style');
	        		}
	    		});
			});



		</script>
		<!--//End-top-nav-script-->
	</head>
	<body>
		<!-- start-header-->
			<div class="header-top">
					<div class="top-header">
						<div class="container">
						<div class="logo">
							<h1><a href="index.html"><img src="/images/logo1233.png" style="height: 50px;width:50px;"><img src="/images/groceberry-text.png" style="height: 90px;width:200px;"></a></h1>

						</div>
						<!--start-top-nav-->
						 <nav class="top-nav">
							<ul class="top-nav">
								<li><a href="index.jsp">Home</a></li>
								<li class="active"><a href="about.html">About</a></li>
								<li><a href="services.html">Services</a></li>
								<li><a href="work.html">Work</a></li>
								<li><a href="blog.html">blog</a></li>
								<li><a href="contact.html">Contact</a></li>
								<div class="clearfix"> </div>

							</ul>
							<a href="#" id="pull"><img src="images/menu-icon.png" title="menu" /></a>
						</nav>
						<div class="clearfix"> </div>
					</div>
				</div>
		</div>
		<div class="about-main">



			<div class="container">

				<img src="/images/ContainerImage_Coffee_Powder.png" class="img-responsive center-block" style="width: 400px;height: 300px;" >

				<br>
				<br><br><br>


				<table style="width: 60%">
					<tr><td>
				<h3 >Grocery Name:  <label>Hello</label></h3><td>
						<td><h3 align="right" style="float: right;">Quantity: </h3>
				<br/>
						</td><tr><td>
				<h3 >Grocery Type:  <label>Hello</label> </h3></td><tr><td>
				<br/>
				<h3 >Container Id:  <label>Hello</label></h3>
				<br/>

</td><td></td>
					</tr>
					<div class="c100 p50 big" style="float: right">
						<span>50%</span>
						<div class="slice">
							<div class="bar"></div>
							<div class="fill"></div>
						</div>
					</div>
				</table>










				<table class="table table-hover" >
					<thead>
					<tr>
						<th></th>
						<th></th>
						<th style="vertical-align: middle;text-align: center">Raspberry Name</th>
						<th style="vertical-align: middle;text-align: center">Raspberry Id</th>
					</tr>
					</thead>

					<tbody id="rasp_table">

					<tbody>
				</table>
				</div>
			</div>







		<!--footer-->
			<div class="footer-top">
							<div class="container">
								<div class="footer-section">
									<div class="col-md-3 footer-grid">
								 		<h3>Wthat we offer</h3>
								 		<div class="list styled arrow-list2">
											<ul>
												<li><a href="#"><img src="images/bb1.png" alt="">Web Design & Development</a></li>
												<li><a href="#"><img src="images/bb1.png" alt="">CMS Wordpress&Development</a></li>
												<li><a href="#"><img src="images/bb1.png" alt="">E-commerce</a></li>
												<li><a href="#"><img src="images/bb1.png" alt="">PHP / My SQL</a></li>
												<li><a href="#"><img src="images/bb1.png" alt="">Branding &CID </a></li>
											</ul>
										</div>
						 			</div>
									<div class="col-md-3 footer-grid bor">
								 		<h3>Frends & Partners</h3>
								 		<div class="list styled arrow-list3">
											<ul>
												<li><a href="#"><img src="images/bb1.png" alt="">Lorem-ipsum.com</a></li>
												<li><a href="#"><img src="images/bb1.png" alt="">Dolor-sit.com</a></li>
												<li><a href="#"><img src="images/bb1.png" alt="">Adobe.com</a></li>
												<li><a href="#"><img src="images/bb1.png" alt="">Forrest.com</a></li>
												<li><a href="#"><img src="images/bb1.png" alt=""> Dribble.com</a></li>
											</ul>
											</div>
						 			</div>
						 			<div class="col-md-3 footer-grid bor">
								 		<h3>Meet us social networks</h3>
								 		<div class="list styled arrow-list4">
											<ul class="soc_icons2">
											<li><a href="#"><i class="icon_4"></i><span>Facebook</a></span></li>
											<li><a href="#"><i class="icon_5"></i><span>Twitter</a></span></li>
											<li><a href="#"><i class="icon_6"></i><span>Behance</a></span></li>
											<li><a href="#"><i class="icon_7"></i><span>Dribble</a> </span></li>
											<li><a href="#"><i class="icon_8"></i><span>Forrest</a> </span></li>
										</ul>
									</div>

											</div>
						 			</div>
						 			<div class="col-md-3 footer-grid">
								 		<h3>Madrid</h3>
								 		<div class="list styled arrow-list5">
											<ul class="soc_icons3">
											<li><a href="#"><i class="icon_41"></i><span>Flicker</a></span></li>
											<li><a href="#"><i class="icon_51"></i><span>Linkedln</a></span></li>
											<li><a href="#"><i class="icon_61"></i><span>Youtube</a></span></li>
											<li><a href="#"><i class="icon_71"></i><span>Rss</a> </span></li>
											<li><a href="#"><i class="icon_81"></i><span>Pinterest</a></span></li>
										</ul>
									</div>

						 			</div>
								<div class="clearfix"> </div>
							</div>			
					</div>
				</div>
				<!--/start-footer-->
				<div class="footer">
						<div class="container">
							<div class="footer-content">

							</div>	
						</div>	
						<div class="clearfix"> </div>  							
					</div>

	<!-- //End-footer-->
				<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
					<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>		