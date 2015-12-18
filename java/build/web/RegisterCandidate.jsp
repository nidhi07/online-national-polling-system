<%-- 
    Document   : RegisterCandidate
    Created on : Aug 4, 2014, 5:55:04 AM
    Author     : prakush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

  <head>
      <link href="css/shift.css" rel="stylesheet" type="text/css">
    <link href='css/font.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
      <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/main.css">
      
      <style>
         
          .jumbotron {
              
              background-image: url("img/jumbotron.jpg");
              height: 500px;
              
              
          }
      
      </style>
    
  </head>

  <body>

  
   <div class="menu">
  
        <div class="icon-close">
        <img src="img/close.png">
      </div>
   
  
        <ul >
          <li><a href="index.html">Home</a></li>
          <li><a href="VVA">Voters/Candidates List</a></li>
		  <li><a href="VoteLogin.jsp">Cast Your Vote</a></li>
                  <li><a href="Update.jsp">Election Result Status</a></li>
                  <li><a href="ViewResults1.jsp">View Results</a></li>
		  <li><a href="#">About</a></li>
        </ul>
</div>
  
  
  
    <header class="top" role="header">
        <div class="container">
            <nav class="navbar-collapse collapse" role="navigation">
                <ul class="navbar-nav nav">
                    <li class="icon-menu"><a href="#">Menu</a></li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            Register
                            <b class="caret"></b>
                        </a>
            <ul class="dropdown-menu">
               <li><a href="RV0">As Voter</a></li>
               <li><a href="RegCandidate.jsp">As Candidate</a></li>
               <li><a href="#">As Political Party</a></li>
            </ul>
                    </li>
                    <li ><a href="index.jsp">Login</a></li>
					
                </ul>
            </nav>
        </div>
    </header>
	
      <div class="registration-box">
          
          <form id="RegCandidate" action="/ONPS/RegCandidate.action" class="form-horizontal" method="POST">
<fieldset>

<!-- Form Name -->
<center><legend></legend> </center>
<center><h2> Candidate Registration Form </h2></center>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RegCandidate_voterid">Voter Identity Number</label>  
  <div class="col-md-4">
  <input id="RegCandidate_voterid" name="voterid" type="text" placeholder="" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RegCandidate_cname">Candidate Name</label>  
  <div class="col-md-4">
  <input id="RegCandidate_cname" name="cname" type="text" placeholder="" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RegCandidate_pcode">Party Code</label>  
  <div class="col-md-4">
  <input id="RegCandidate_pcode" name="pcode" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RegCandidate_cityCode">City Code</label>
  <div class="col-md-4">
    <input id="RegCandidate_cityCode" name="cityCode" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RegCandidate_currentPosition">Current Position</label>  
  <div class="col-md-4">
  <input id="RegCandidate_currentPosition" name="currentPosition" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RegCandidate_pass">Password</label>
  <div class="col-md-4">
    <input id="RegCandidate_pass" name="pass" type="password" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RegCandidate_confpass">Confirm Password</label>
  <div class="col-md-4">
    <input id="RegCandidate_confpass" name="confpass" type="password" placeholder="" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="RegCandidate_singlebutton"></label>
  <div class="col-md-4">
      <input type="submit" id="RegCandidate_0" name="register" class="btn btn-primary" value="Register"/>
  </div>
</div>

</fieldset>
</form>
          
      </div>
    
    
    <!--Footer Starts Here -->

    <div class="learn-more">
	  <div class="container">
		<div class="row">
	      <div class="col-md-4">
			<h3>Voter</h3>
			<p>From casting the votes at one click to providing the best voting experience . We Are Here !</p>
			<p><a href="votersRight.htm">Learn more about Voter rights .</a></p>
	      </div>
		  <div class="col-md-4">
			<h3>Candidate</h3>
			<p>We maintain the full list of the candidates in the coming elections. Their profile , promises and rants ! </p>
			<p><a href="votersRight.htm">Learn more about Candidates duties .</a></p>
		  </div>
		  <div class="col-md-4">
			<h3>Questions and Answers</h3>
			<p>You can ask any candidate any question . And He'll be notified of your question in no time .</p>
			<p><a href="#">Ask Questions .</a></p>
		  </div>
	    </div>
	  </div>
	</div>
	
	
	<script src="js/jquery.min.js"></script>
    <script src="js/app.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<!--Footer Ends Here-->
	
  </body>
</html>