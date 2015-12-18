

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
      
      
      <div class="row">
          
          <div class="col-md-4">
          </div>
          
          <div id="welcome-message" class="col-md-4">
              <h2><strong>${sessionScope.name} </strong>| Admin</h2>
             
          </div>
          
          <div class="col-md-4">
          </div>
          
          
      </div>
          
          
          
          
          
          
          <div class="row">
              
              <div class="col-md-1"></div>
              
              <div class="col-md-2" >
                  <h4>Approve Voter</h4>
                  <a href="ApproveVoters.jsp" class="thumbnail">
                      
                     <img src="img/approve-voter.png">
                 </a>
 
              </div>
              
              
              <div class="col-md-2">
                  <h4>Edit Parties</h4>
                  <a href="EditParties.jsp" class="thumbnail">
                     
                      <img src="img/edit.png">
                 </a>
 
 
              </div>
              
              
              <div class="col-md-2">
                  <h4>Approve Candidate</h4>
                  <a href="ApproveCandidates.jsp" class="thumbnail">
                     
                      <img src="img/approve-candidate.png">
                 </a>
 
 
              </div>
              
              
              <div class="col-md-2">
                  <h4>Register As Voter</h4>
                  <a href="RV0" class="thumbnail">
                     
                      <img src="img/register-voter.png">
                 </a>
 
 
              </div>
              
              
              <div class="col-md-2">
                  <h4>Register As Candidate</h4>
                  <a href="RegisterCandidate.jsp" class="thumbnail">
                     
                      <img src="img/register-candidate.png">
                 </a>
 
 
              </div>
              
              
              <div class="col-md-1"></div>
              
              
          </div>
              
              
              
              <div class="row">
                  
                  <div class="col-md-2"></div>
                  
                  
                  <div class="col-md-2">
                      <h4>View Voters</h4>
                      <a href="AdminViewVoters.jsp" class="thumbnail">
                     
                          <img src="img/view-voter.png">
                 </a>
 
                  </div>
                  
                  <div class="col-md-2">
                      <h4>View Candidates</h4>
                      <a href="AdminViewCandidates.jsp" class="thumbnail">
                     
                          <img src="img/view-candidate.png">
                 </a>
 
                  </div>
                  
                  
                  <div class="col-md-2">
                      <h4>Update Results</h4>
                    <a href="Update" class="thumbnail">
                     
                        <img src="img/update.png">
                 </a>
 
                  </div>
                  
                  
                  <div class="col-md-2">
                      <h4>Set Election Date</h4>
                    <a href="SetElectionDate.jsp" class="thumbnail">
                     
                        <img src="img/calender.png">
                 </a>
 
                  </div>
                  
                  
                  
                  
                  <div class="col-md-2"></div>
                  
                  
                  
                  
                  
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







<%--



<a href="ApproveVoters.jsp">Approve Voters</a>

<a href="EditParties.jsp">Edit Parties</a>

<a href="ApproveCandidates.jsp">Approve Candidates</a>

<a href="RV0">Register a voter</a>

<a href="RegCandidate.jsp">Register a candidate</a>

<a href="AdminViewCandidates.jsp">View Candidates (with password)</a>

<a href="AdminViewVoters.jsp">View Voters (with password)</a>

<a href="Update">Update</a>

<a href="LOGOUT">Logout</a>



--%>