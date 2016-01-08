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


		<script type="text/javascript">
			var user_id;
			var name;
			var email;
			var platform;
			var resp;
			var Arr_RaspName=[];
			var Arr_RaspId=[];
			var listsize=-1;
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});

				var showDel=localStorage.getItem("showSuccDelete");
				if(showDel=="1")
				{
					alert("Raspberry Pi Successfully Deleted");
				}
				localStorage.setItem("showSuccDelete","0");


				user_id=localStorage.getItem("user_id");
				name=localStorage.getItem("name");
				email=localStorage.getItem("email");
				platform=localStorage.getItem("platform");
				resp=localStorage.getItem("resp");
				resp=JSON.parse(resp);

				name=name.replace("%20"," ");
				$("#wel_name").html("Welcome "+name+",");

				var size=resp.no_of_raspberry;
				listsize=size;

				for(var i=1;i<=size;i++)
				{



					var x=resp['rasp'+i+'_name'];
					var y=resp['rasp'+i+'_serial_no'];
                   $("#rasp_table").append("<tr ><td style='vertical-align: middle;text-align: center' > <label ><input type='radio' name='rasp_button' value='"+i+"'  /></label></td><td onclick='getContainerDetails("+i+");'><img src='/images/raspberry_logo.png'/></td><td style='vertical-align: middle;text-align: center' id='rasp_name"+i+"' onclick='getContainerDetails("+i+");'>"+x+"</td><td style='vertical-align: middle;text-align: center' id='rasp_serial_no"+i+"' onclick='getContainerDetails("+i+");'>"+y+"</td></tr>");
					Arr_RaspName[i]=x;
					Arr_RaspId[i]=y;
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


			function checkEdit(){
				var index=$('input[name=rasp_button]:checked').val();
				//$('#edit_modal').modal('show');
				if(typeof index === "undefined"){
					alert('Select a row first');
					return;
				}

				$("#rasp_edit_name").val(Arr_RaspName[index]);
				$("#rasp_edit_id").val(Arr_RaspId[index]);
				$('#edit_modal').modal('show');

				alert(index);
			}

			function checkDelete(){
				var index=$('input[name=rasp_button]:checked').val();
				//$('#edit_modal').modal('show');
				if(typeof index === "undefined"){
					alert('Select a row first');
					return;
				}



				alert(index);
			}


			function Save_Edit_Details(){
				var index=$('input[name=rasp_button]:checked').val();
				var  rname=$("#rasp_edit_name").val();
				var  rid=$("#rasp_edit_id").val();
//				resp['rasp'+index+'_serial_no']
				editRaspberry(user_id,rid,rname);
				alert(user_id);
				alert(rid);
				alert(rname);
			}

			function editRaspberry(user_id,rasp_id,rasp_name){
				var url="https://grocberry-webserver.herokuapp.com/api/raspberry/editRaspberry";
				var dataUrl="user_id="+user_id+"&rasp_id="+rasp_id+"&rasp_name="+rasp_name;
				//alert(dataUrl);

				var index=$('input[name=rasp_button]:checked').val();
				if(rasp_name==$("#rasp_name"+index).val())
				{
					$("#editnew_errordiv").html("Name not modified!");
					$("#editnew_errordiv").show("slow").delay(4000).hide("slow");
					return;

				}
				$.ajax({
					type: "POST",
					url: url,
					data: dataUrl,
					async: true,
					crossDomain: true,
					success: function (data, Status, xhr) {
						//data is the response from the server

						if(data.message=="true")
						{

							$("#editnew_succdiv").html("Raspberry pi name successfully changed!");
							$("#editnew_succdiv").show("slow").delay(4000).hide("slow");
							var index=$('input[name=rasp_button]:checked').val();
							$("#rasp_name"+index).html(rasp_name);
						}
						else{
							$("#editnew_errordiv").html("Some error occurred please try again!");
							$("#editnew_errordiv").show("slow").delay(4000).hide("slow");
							// alert("Please make sure your raspberry pi is connected to internet and try again.";
						}
					}
				}).fail(function() {
					$("#editnew_errordiv").html("Some error occurred please try again!");
					$("#editnew_errordiv").show("slow").delay(4000).hide("slow");

				});
			}



			function Save_Add_Details(){
				var add_rasp_name= $("#rasp_add_name").val();
				var add_rasp_id= $("#rasp_add_id").val();
				addRaspberry(add_rasp_id,add_rasp_name);
				//alert(add_rasp_id);
				//alert(add_rasp_name);
		}



			function addRaspberry(rasp_id,rasp_name){
				var url="https://grocberry-webserver.herokuapp.com/api/raspberry/checkRaspberry?rasp_id="+rasp_id+"&rasp_name="+rasp_name;

				$.ajax({
					type: "GET",
					url: url,
					async:true,
					crossDomain:true,
					success: function(data, Status,xhr) {
						//data is the response from the server

						if(data.message=="true")
						{
							if(rasp_name.indexOf(" ") > -1)
							{
								rasp_name=rasp_name.replace(" ","%20");
							}

							var url = "https://grocberry-webserver.herokuapp.com/api/raspberry/addRaspberry";
							var dataUrl="user_id="+localStorage.getItem("user_id")+"&rasp_id="+rasp_id+"&rasp_name="+rasp_name;
							$.ajax({
								type: "POST",
								url: url,
								data:dataUrl,
								async:true,
								crossDomain:true,
								success: function(data, Status,xhr) {
									if(data.message=="true")
									{
										$("#addnew_succdiv").html("Raspberry Pi Successfully Added!");
										$("#addnew_succdiv").show("slow").delay(4000).hide("slow");

										$("#rasp_table").append("<tr><td style='vertical-align: middle;text-align: center'> <label ><input type='radio' name='rasp_button' value='"+(listsize+1)+"'  /></label></td><td onclick='getContainerDetails("+i+");'><img src='/images/raspberry_logo.png'/></td><td style='vertical-align: middle;text-align: center' id='rasp_name"+(listsize+1)+"' onclick='getContainerDetails("+i+");'>"+rasp_name+"</td><td style='vertical-align: middle;text-align: center' id='rasp_serial_no"+(listsize+1)+"' onclick='getContainerDetails("+i+");'>"+rasp_id+"</td></tr>");

										$("#rasp_add_name").val("");
										$("#rasp_add_id").val("");
										listsize++;
										Arr_RaspId[listsize]=rasp_id;
										Arr_RaspName[listsize]=rasp_name;
									}
									else
									{
										$("#addnew_errordiv").html("This Raspberry pi is already added to this account!");
										$("#addnew_errordiv").show("slow").delay(4000).hide("slow");;
									}
								}
							}).fail(function() {
								alert( "error" );
							});
						}
						else{
							$("#addnew_errordiv").html("Please make sure your raspberry pi is connected to internet and try again!");
							$("#addnew_errordiv").show("slow").delay(4000).hide("slow");
							// alert("Please make sure your raspberry pi is connected to internet and try again.";
						}
					}
				}).fail(function() {
					$("#addnew_errordiv").html("Some error occurred please try again!");
					$("#addnew_errordiv").show("slow").delay(4000).hide("slow");

				});
			}


			function getContainerDetails(index)
			{
				var url="https://grocberry-webserver.herokuapp.com/api/container/getAllContainerDetails?rasp_id="+Arr_RaspId[index];

				$.ajax({
					type: "GET",
					url: url,
					async: true,
					crossDomain: true,
					success: function (data, Status, xhr) {
						//data is the response from the server


						if(!(data.message=="no container added"))
						{
                          alert(JSON.stringify(data));

							localStorage.setItem("container_details",JSON.stringify(data));
							window.location ="container.jsp";
						}
						else{
							alert("error");
						}
					}
				}).fail(function() {
					$("#editnew_errordiv").html("Some error occurred please try again!");
					$("#editnew_errordiv").show("slow").delay(4000).hide("slow");

				});

			}



			var rowToDelete=-1;
			function deleteDetails(){
				rowToDelete=$('input[name=rasp_button]:checked').val();;
				$('#delete').modal({show: true});

			}

			function Delete(){
				var del_id=Arr_RaspId[rowToDelete];
				removeRaspberry(user_id,del_id);
			}



			function removeRaspberry(user_id,rasp_id){
				var url="https://grocberry-webserver.herokuapp.com/api/raspberry/removeRaspberry";
				var dataUrl="user_id="+user_id+"&rasp_id="+rasp_id;
				alert(dataUrl);

				$.ajax({
					type: "POST",
					url: url,
					data:dataUrl,
					async: true,
					crossDomain: true,
					success: function (data, Status, xhr) {
						//data is the response from the server

						if(data.message=="true")
						{
							var name=user_id;
							if(name.indexOf(" ") > -1)
							{
								name=name.replace(" ","%20");
							}
							var url="https://grocberry-webserver.herokuapp.com/api/user/checkUser?user_id="+user_id+"&name="+name+"&email="+email+"&platform="+platform;


							$.ajax({
								type: "GET",
								url: url,
								async:true,
								crossDomain:true,
								success: function(data, status, xhr) {

									if(data.message=="fetched")
									{
										localStorage.setItem("resp",JSON.stringify(data));
										location.reload();
										localStorage.setItem("showSuccDelete",1);
									}else{

										alert("Some error Occurred");
									}


								}
							}).fail(function() {
							});

						}
						else{
							alert("error");
						}
					}
				}).fail(function() {
					$("#editnew_errordiv").html("Some error occurred please try again!");
					$("#editnew_errordiv").show("slow").delay(4000).hide("slow");

				});
			}

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
			<div class="container" >


                <label id="wel_name"></label>

				<br><br>
				<button style="float: right;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#add_modal">Add New</button>
				<br><br><br>

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

				<button style="float: right;" type="button" class="btn btn-primary" onclick="deleteDetails();">Delete</button><%for(int i=0;i<10;i++){%>&nbsp<%}%><button style="float: right;margin-right: 30px" type="button" class="btn btn-primary" onclick="checkEdit();">Edit</button>
				<br><br><br>
			</div>
		</div>



		<!--/modal start-->
		<div id="edit_modal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">Edit Raspberry</h4>
					</div>
					<div class="modal-body" align="center">
						<div class="alert alert-success" role="alert" id="editnew_succdiv" style="display: none;"></div>
						<div class="alert alert-danger" role="alert" id="editnew_errordiv" style="display: none;"></div>
                    <img src="/images/raspberry.jpeg" height="230px" width="300px"/>

<br><br>
						<table>
							<tr style="height: 50px"><td>
						Raspberry Pi Name &nbsp;</td><td> <input type="text" name="rasp_edit_name" id="rasp_edit_name" width="70px" />
						</td></tr>
							<tr style="height: 60px"><td>
						Raspberry Pi Id &nbsp;</td><td> <input type="text" name="rasp_edit_id" id="rasp_edit_id" readonly />
							</td></tr>
							<tr><td> </td><td>
								<button type="button" class="btn btn-primary" style="float: right;" onclick="Save_Edit_Details();">Save</button>
							</td></tr>
						</table>

					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->






		<!--/modal start-->
		<div id="add_modal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">Add Raspberry</h4>
					</div>
					<div class="modal-body" align="center">

						<div class="alert alert-success" role="alert" id="addnew_succdiv" style="display: none;"></div>
						<div class="alert alert-danger" role="alert" id="addnew_errordiv" style="display: none;"></div>
						<img src="/images/addRaspberrypi.png" height="230px" width="300px"/>

						<br><br>
						<table>
							<tr style="height: 50px"><td>
								Raspberry Pi Name &nbsp;</td><td> <input type="text" name="rasp_edit_name" id="rasp_add_name" width="70px"  />
							</td></tr>
							<tr style="height: 60px"><td>
								Raspberry Pi Id &nbsp;</td><td> <input type="text" name="rasp_edit_id" id="rasp_add_id"  />
							</td></tr>
							<tr><td> </td><td>
								<button type="button" class="btn btn-primary" style="float: right;" onclick=" Save_Add_Details()">Save</button>
							</td></tr>
						</table>



					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->


		<div id="delete" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" align="center">Alert</h4>
					</div>
					<div class="modal-body" align="center">
						<p>Are you sure you want to delete this raspberry?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="Delete();">Delete</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
					</div>
				</div>

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