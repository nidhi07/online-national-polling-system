<%-- 
    Document   : RegisterVoter
    Created on : Aug 4, 2014, 5:19:22 AM
    Author     : prakush
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>
      <link href="css/shift.css" rel="stylesheet" type="text/css">
    <link href='css/font.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
      <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/style.css">
      
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
                    <li cssClass="dropdown"><a href="#" cssClass="dropdown-toggle" data-toggle="dropdown">
                            Register
                            <b class="caret"></b>
                        </a>
            <ul class="dropdown-menu">
               <li><a href="RV0">As Voter</a></li>
               <li><a href="RegisterCandidate.jsp">As Candidate</a></li>
               <li><a href="#">As Political Party</a></li>
            </ul>
                    </li>
                    <li ><a href="index.jsp">Login</a></li>
					
                </ul>
            </nav>
        </div>
    </header>
	
      <div class="registration-box">
      
          <form id="RV" action="/ONPS/RV.action" class="form-horizontal" method="POST" enctype="multipart/form-data">
<fieldset>

<!-- Form Name -->
<center><legend></legend> </center>
<center><h2> Voter Registration Form </h2></center>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_fname">First Name</label>  
  <div class="col-md-4">
      <input id="RV_fname" name="fname" type="text" placeholder="" class="form-control input-md" />
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_mname">Middle Name</label>  
  <div class="col-md-4">
  <input id="RV_mname" name="mname" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_lname">Last Name</label>  
  <div class="col-md-4">
  <input id="RV_lname" name="lname" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_mother">Mother's Name</label>  
  <div class="col-md-4">
  <input id="RV_mother" name="mother" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_father">Father's Name</label>  
  <div class="col-md-4">
  <input id="RV_father" name="father" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_gender">Gender</label>
  <div class="col-md-4">
      <select name="gender" id="RV_gender">
          <option value="M">M</option>
          <option value="F">F</option>
          <option value="O">O</option>
      </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_dateOfBirth">Date Of Birth</label>  
  <div class="col-md-4">
  <input id="RV_dateOfBirth" name="dateOfBirth" type="text" placeholder="YYYY-MM-DD" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_email">E-Mail</label>  
  <div class="col-md-4">
  <input id="RV_email" name="email" type="text" placeholder="john@example.com" class="form-control input-md">
    
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_citycode">City</label>
  <div class="col-md-4">
    <select id="RV_citycode" name="citycode" class="form-control">
    <option value="1" selected="selected">Varanasi</option>
    <option value="2">Bareilly</option>
    <option value="3">Gorakhpur</option>
    <option value="4">Lucknow</option>
    <option value="5">Jaipur</option>
    <option value="6">Delhi</option>
    <option value="7">Ambala</option>
    <option value="8">Haridwar</option>
    <option value="9">Ghaziabad</option>
    <option value="10">Sultanpur</option>
    </select>
  </div>
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_file">Voter Identity Card</label>
  <div class="col-md-4">
    <input id="RV_file" name="file" class="input-file" type="file">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_voterid">Voter Identity Number</label>  
  <div class="col-md-4">
  <input id="RV_voterid" name="voterid" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_pass">Password</label>
  <div class="col-md-4">
    <input id="RV_pass" name="pass" type="password" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_confpass">Confirm Password</label>
  <div class="col-md-4">
    <input id="RV_confpass" name="confpass" type="password" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="RV_register"></label>
  <div class="col-md-4">
      <input type="submit" id="RV_0" name="register" class="btn btn-primary" />
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
