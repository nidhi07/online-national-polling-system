<%-- 
    Document   : UpdateCprofile
    Created on : Aug 13, 2014, 12:56:33 PM
    Author     : prakush
--%>

<%@taglib prefix="s" uri="/struts-tags" %>



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
               <li><a href="RegisterCandidate.jsp">As Candidate</a></li>
               <li><a href="#">As Political Party</a></li>
            </ul>
                    </li>
                    <li ><a href="LOGOUT">Logout</a></li>
					
                </ul>
            </nav>
        </div>
    </header>
      
      
      
 <div class="update-profile">
      
      <form id="uvp" action="/ONPS/uvp.action" class="form-horizontal" method="POST">
<fieldset>

<!-- Form Name -->
<center><legend></legend> </center>
<center><h2><strong> ${sessionScope.name} </strong>| Change Your Password </h2></center>
<center><h3> ${requestScope.msg} </h3></center>


 <div class="row">
     
              <div class="col-md-1">
              </div>
              
              <div class="col-md-2">
                  <a href="UpdateVprofile.jsp" class="thumbnail">
                      <img src="img/settings.png">
                  </a>
              </div>
              
              <div class="col-md-2">
                  <a href="AskQues.jsp" class="thumbnail">
                      <img src="img/quora.png">
                  </a>
                  
              </div>
              
              <div class="col-md-2">
                  <a href="cpydata" class="thumbnail">
                      <img src="img/election.jpg">
                  </a>
              </div>
              
              <div class="col-md-2">
                  <a href="ViewCandidates.jsp" class="thumbnail">
                      <img src="img/candidate.jpg">
                  </a>
              </div>
     
     <div   class="col-md-2">
         <a href="AddEditPromises.jsp" class="thumbnail">
                <img src="img/promise.jpg">
                  </a>
     </div>
              
              <div class="col-md-1">
              </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="uvp_oldpassword">Old Password</label>
  <div class="col-md-4">
    <input id="uvp_oldpassword" name="oldpassword" placeholder="" class="form-control input-md" required="" type="password">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="uvp_newpassword">New Password</label>
  <div class="col-md-4">
    <input id="uvp_newpassword" name="newpassword" placeholder="" class="form-control input-md" type="password">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="uvp_confirmpassword">Confirm New Password</label>
  <div class="col-md-4">
    <input id="uvp_confirmpassword" name="confirmpassword" placeholder="" class="form-control input-md" type="password">
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="uvp_changepassword"></label>
  <div class="col-md-4">
      <input type="submit" id="uvp_0" name="changepassword"  value="Change Password" class="btn btn-primary" />
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
			<p><a href="#">Learn more about Voter rights .</a></p>
	      </div>
		  <div class="col-md-4">
			<h3>Candidate</h3>
			<p>We maintain the full list of the candidates in the coming elections. Their profile , promises and rants ! </p>
			<p><a href="#">Learn more about Candidates duties .</a></p>
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
        <script src="js/bootstrap.js"></script>
	
	<!--Footer Ends Here-->
	
  </body>
</html>
