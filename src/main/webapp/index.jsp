<%--
  Created by IntelliJ IDEA.
  User: Voodoo
  Date: 25/11/15
  Time: 7:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>The NeuBlue bootstrap Website Template | Home :: w3layouts</title>
  <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
  <link href="css/style.css" rel='stylesheet' type='text/css' />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <script src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/move-top.js"></script>
  <script type="text/javascript" src="js/easing.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <link href='css/fonts.css' rel='stylesheet' type='text/css'>
  <link href='css/indexpage.css' rel='stylesheet' type='text/css'>
 <%-- <script src="https://apis.google.com/js/platform.js" async defer></script>--%>
  <%--<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>--%>

<%--
  <meta name="google-signin-scope" content="profile email">
  <meta name="google-signin-client_id" content="897653746525-fkvthkdfn9cgifef5uedk68ntc7llg5j.apps.googleusercontent.com">
--%>

  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  <script src="https://apis.google.com/js/api:client.js"></script>
<%--  <script src="https://apis.google.com/js/platform.js" async defer></script>--%>
  <script type="text/javascript">

    $(document).ready(function(){

      var loc=window.location.href;
      if(loc.indexOf("https")==-1 && loc.indexOf("localhost")==-1)
      {
        loc=loc.replace("http","https");
        window.location.href = loc;
      }


      var progress = setInterval(function() {
        var $bar = $('.bar');

        if ($bar.width()>=400) {
          clearInterval(progress);
          $('.progress').removeClass('active');
        } else {
          $bar.width($bar.width()+40);
        }
        $bar.text($bar.width()/4 + "%");
      }, 800);

    });


    jQuery(document).ready(function($) {
      $(".scroll").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
      });
    });

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




    function facebook_checkLoginState() {
      FB.getLoginStatus(function(response) {
        facebook_statusChangeCallback(response);
      });
    }
  </script>
  <script>

    //google login

    var googleUser = {};
    var show_googlebutton = function() {
      gapi.load('auth2', function(){
        // Retrieve the singleton for the GoogleAuth library and set up the client.
        auth2 = gapi.auth2.init({
          client_id: '897653746525-fkvthkdfn9cgifef5uedk68ntc7llg5j.apps.googleusercontent.com',
          cookiepolicy: 'single_host_origin',
          // Request scopes in addition to 'profile' and 'email'
          //scope: 'additional_scope'
        });
        attachSignin(document.getElementById('googleBtn'));
      });
    };

    function attachSignin(element) {
      console.log(element.id);
      auth2.attachClickHandler(element, {},
              function(googleUser) {
                document.getElementById('google_buttonText').innerHTML= "Signed in: " + google_onSignIn(googleUser);
              }, function(error) {
                alert(JSON.stringify(error, undefined, 2));
              });
    }

    function google_onSignIn(googleUser) {

      alert("signed in");

      var url="https://grocberry-webserver.herokuapp.com/api/user/checkuser?user_id=12345&name=sachin&email=sachinnair92@gmail.com&platform=google";
      $.ajax({
        type: "GET",
        url: url,
        async:true,
        dataType : 'json',   //you may use jsonp for cross origin request
        crossDomain:true,
        success: function(data, status, xhr) {
          alert("success");
        }
      }).fail(function() {
        alert( "error" );
      });















     /* var profile = googleUser.getBasicProfile();
      alert('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
      alert('Name: ' + profile.getName());
      alert('Image URL: ' + profile.getImageUrl());
      alert('Email: ' + profile.getEmail());
      return(profile.getName());*/
    }

    function google_onFailure(error) {
      console.log(error);
    }
  </script>

  <script>

    //facebook login

    function fb_onSignIn(response) {

      FB.api('/me?fields=name,email', function(response) {
        var det = JSON.stringify(response);
        alert(det);
        alert(response.email);
        alert("Logged in - Name is "+response.name);
      });
    }


    window.fbAsyncInit = function() {
      FB.init({
        appId      : '194392467564233',
        xfbml      : true,
        version    : 'v2.5'
      });
    };

    (function(d, s, id){
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) {return;}
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function fb_login() {
      FB.login(function(response) {
        if (response.authResponse) {
          fb_onSignIn();
        } else {
          alert('Authorization failed');
        }
      }, {scope: 'public_profile,email'});
    }



  </script>

</head>
<body>
<div id="home" class="header">
  <div class="top-header">
    <div class="container">
      <div class="logo">
        <h1><a href="index.html">Neu<lable>Blue</lable></a></h1>
      </div>
      <nav class="top-nav">
        <ul class="top-nav">
          <li class="active"><a href="index.html">Home</a></li>
          <li><a href="about.html">About</a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="work.html">Work</a></li>
          <li><a href="blog.html">blog</a></li>
          <li><a href="#" data-toggle="modal" data-target="#login_modal">Login</a></li>
          <div class="clearfix"> </div>
        </ul>
        <a href="#" id="pull"><img src="images/menu-icon.png" title="menu" /></a>
      </nav>
      <div class="clearfix"> </div>
    </div>
  </div>
  <div class="header-banner">
    <div class="container">
      <div class="container">
        <div class ="inner-content">
          <div class ="banner-text">
            <h2>We create <span>Modern&beatifull</span> websites !</h2>
            <p>Suspendisse mi,Curabitur elementum placerate diam.Sed egestas convallis leo.Fuse sedligulaid sem suscipit mollis.</p>
          </div>
          <div class ="banner-img">
            <!-- Slideshow 4 -->
            <div class="slide-show">
              <div  id="top" class="callbacks_container">
                <ul class="rslides" id="slider4">
                  <li>
                    <div class="slider-top">
                      <img src="images/s1.png" title="" />
                    </div>
                  </li>
                  <li>
                    <div class="slider-top">
                      <img src="images/s2.png" title="" />
                    </div>
                  </li>
                  <li>
                    <div class="slider-top">
                      <img src="images/s1.png" title="" />
                    </div>
                  </li>
                </ul>
              </div>
              <div class="clearfix"> </div>
            </div>
          </div>
        </div>
        <div class="clearfix"> </div>
      </div>
    </div>
  </div>
</div>
<script src="js/responsiveslides.min.js"></script>
<script>
  // You can also use "$(window).load(function() {"
  $(function () {
    // Slideshow 4
    $("#slider4").responsiveSlides({
      auto: true,
      pager: true,
      nav: true,
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
<!--//End-slider-script-->
<div class="we-offer-section">
  <div class="container">
    <div class="we-offer-top">
      <div class="col-md-3 we-offer-text">
        <h3>WE OFFER PERSONAL SERVICES & PRODUCT FOR YOUR BUSSINESS</h3>
      </div>
      <div class="col-md-8 offer-grids">
        <div class="col-md-3 offer-grid1">
          <img src="images/w2.png" title="" />
          <div class="sale-box">
            <span class="on_sale title_shop">Few</span>
          </div>
          <h4>Website Template & Development</h4>
          <a class="offer-btn" href="#"><span></span>more info</a>
        </div>
        <div class="col-md-3 offer-grid1">
          <img src="images/w1.png" title="" />
          <div class="sale-box">
            <span class="on_sale title_shop">New</span>
          </div>
          <h4>Word Press Template & Development</h4>
          <a class="offer-btn" href="#"><span></span>more info</a>
        </div>
        <div class="col-md-3 offer-grid1">
          <img src="images/w3.png" title="" />
          <div class="sale-box">
            <span class="on_sale title_shop">New</span>
          </div>
          <h4>Grafic & Print design & Development</h4>
          <a class="offer-btn" href="#"><span></span>more info</a>
        </div>
        <div class="col-md-3 offer-grid1">
          <img src="images/w4.png" title="" />
          <div class="sale-box">
            <span class="on_sale title_shop">New</span>
          </div>
          <h4>E-Commers & Custom CMS Soolutions</h4>
          <a class="offer-btn" href="#"><span></span>more info</a>
        </div>
        <div class="clearfix"> </div>
      </div>
      <div class="clearfix"> </div>
    </div>
  </div>
</div>
<!--blog-->
<div class="blog">
  <div class="container">
    <div class="blog-section">
      <div class="col-md-3 blog-small-text">
        <h3>From our blog</h3>
        <div class="list styled arrow-list">
          <ul>
            <li><a href="#"><img src="images/bb.png" alt="">Rss Feed</a></li>
            <li><a href="#"><img src="images/bb.png" alt="">Subscribe to News latter</a>
          </ul>
        </div>
      </div>
      <div class="col-md-5 blog-middle-text">
        <div class="blog-inner-text">
          <h4>New additon to our porfotfolio</h4>
          <h5>28.4.2014 <span> John Doe</span></h5>
          <p>Morbi nunc odio, gravida at, cursus nec, luctus a, lorem. Maecenas tristique orci ac sem.<a class="offer-btn" href="#"><lable></lable>more info</a></p>
        </div>
        <div class="blog-inner-text">
          <h4>New team Member:John Doe</h4>
          <h5>28.4.2014 <span> John Doe</span></h5>
          <p>Morbi nunc odio, gravida at, cursus nec, luctus a, lorem. r ips dol consec.<a class="offer-btn" href="#"><lable></lable>more info</a></p>
        </div>
        <div class="blog-inner-text">
          <h4>Photogallery from our team-building weekend</h4>
          <h5>28.4.2014 <span> John Doe</span></h5>
          <p>Morbi nunc odio, gravida at, cursus nec, luctus a, lorem. Maecenas tristique orci ac sem.ime<a class="offer-btn" href="#"><lable></lable>more info</a></p>
        </div>
        <div class="blog-button">
          <a class="blog-btn" href="#">Read more our Blog </a></p>
        </div>
        <div class="clearfix"> </div>
      </div>
      <div class="col-md-4 blog-request-text">
        <div class="blog-button1">
          <a class="blog-btn1" href="#">Request A Quote </a></p>
        </div>
        <h4>What are your client saying?</h4>
        <div class="client-gride1">
          <p>Aliquam mattis massa at urna tincidunt ultrices.Curabitur lobortis ante vulputate, imperdiet felisa, adipiscing odio aliquam pharetra molestie mauris</p>
          <div class ="grid-text">
            <h4>John Doe</h4><h5>Adode.com</h5>
            <div class="clearfix"> </div>
          </div>
          <span class="arrow-one"> </span>
        </div>
        <div class="list styled bb-list">
          <h4>Frequently Asked Questions?</h4>
          <ul>
            <li><a href="#"><img src="images/bb.png" alt="">How much does it cost?</a></li>
            <li><a href="#"><img src="images/bb.png" alt="">What is "Wordpress"?</a>
            <li><a href="#"><img src="images/bb.png" alt="">What is Stands for"CMS"?</a></li>
            <li><a href="#"><img src="images/bb.png" alt="">Can you registgar me a domain? </a>
              <div class="clearfix"> </div>
          </ul>
        </div>
        <div class="clearfix"> </div>
      </div>
    </div>
  </div>
  <div class="tweests">
    <div class="container">
      <div class="twitter-main">
        <div class="col-md-3 tweests-tw">
          <h5>twitter feed</h5>
        </div>
        <div class="col-md-9 tweests-text">
          <h6>New cartoon on SmashingMag Responsive Design <span>About 11 hours ago</span></h6>
        </div>
        <div class="clearfix"> </div>
      </div>
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
            <li><a href="#"><i class="icon_4"></i><span>Facebook</span></a></li>
            <li><a href="#"><i class="icon_5"></i><span>Twitter</span></a></li>
            <li><a href="#"><i class="icon_6"></i><span>Behance</span></a></li>
            <li><a href="#"><i class="icon_7"></i><span>Dribble</span></a> </li>
            <li><a href="#"><i class="icon_8"></i><span>Forrest</span></a></li>
          </ul>
        </div>

      </div>
    </div>
    <div class="col-md-3 footer-grid">
      <h3>Madrid</h3>
      <div class="list styled arrow-list5">
        <ul class="soc_icons3">
          <li><a href="#"><i class="icon_41"></i><span>Flicker</span></a></li>
          <li><a href="#"><i class="icon_51"></i><span>Linkedln</span></a></li>
          <li><a href="#"><i class="icon_61"></i><span>Youtube</span></a></li>
          <li><a href="#"><i class="icon_71"></i><span>Rss</span></a></li>
          <li><a href="#"><i class="icon_81"></i><span>Pinterest</span></a></li>
        </ul>
      </div>

    </div>
    <div class="clearfix"> </div>
  </div>
</div>
</div>


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




<!--/modal start-->
<div id="login_modal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Login into Grocberry</h4>
      </div>
      <div class="modal-body" align="center">
        <%--<div class="g-signin2" data-onsuccess="onSignIn"></div>--%>
          <%--<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>--%>
       <%-- <div id="google-signin"></div>--%>

          <div id="gSignInWrapper">
            <div id="googleBtn" class="customGPlusSignIn">
              <span class="google_icon"></span>
              <span id="google_buttonText" class="google_buttonText">LOG IN WITH GOOGLE</span>
            </div>
          </div>



          <hr>

<%--
          <fb:login-button scope="public_profile,email" fb_login() data-size="xlarge" data-max-rows="5" > Log in with Facebook
          </fb:login-button>
--%>
          <div id="fbSignInWrapper">
            <div id="fbBtn" class="customfbSignIn">
              <span class="fb_icon"></span>
              <span id="fb_buttonText" class="fb_buttonText" onclick="fb_login();">LOG IN WITH FACEBOOK</span>
            </div>
          </div>


          <hr>
          <br/>
          <label style="font-size: 15px;font-family: 'Roboto', sans-serif;font-size: 14px;font-weight: bold;">By logging in, you agree to Grocberry's Terms of Service, Privacy Policy and Content Policies.</label>

          <div id="status">
          </div>


      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="container">
  <div class="progress progress-striped active">
    <div class="bar" style="width: 0%;"></div>
  </div>
</div>

<script>
  show_googlebutton();
</script>

</body>
</html>
