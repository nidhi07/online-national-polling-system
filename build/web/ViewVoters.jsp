<%@taglib prefix="s" uri="/struts-tags" %>



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
                    <li ><a href="index.jsp">Login</a></li>
					
                </ul>
            </nav>
        </div>
    </header>
      
  
      <div class="list-box">    
      
      
      
      <form id="VVA1" name="VVA1" action="/ONPS/VVA1.action" class="form-horizontal" method="POST">
<fieldset>

<!-- Form Name -->
<center><legend></legend> </center>
<center><h2> Voter / Candidate List </h2></center>
<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="VVA1_cityCode">Choose City</label>
  <div class="col-md-4">
    <select id="VVA1_cityCode" name="cityCode" class="form-control">
    <option value="1">Varanasi</option>
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

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="VVA1_voterlist"></label>
  <div class="col-md-4">
      <input type="submit" id="VVA1_0" name="voterlist" value="Voter List" class="btn btn-primary" />
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="VVA1_candidatelist"></label>
  <div class="col-md-4">
      <input type="submit" id="VVA1_candidatelist" name="candidatelist" value="Candidate List" class="btn btn-primary" />
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




<%--



<s:form action="VVA1">
    <s:select name="cityCode" list="cities" listKey="cityCode" listValue="cityName"/>
    <s:submit value="View Voter List"/>
    <s:submit value="View Candidates list" formaction="VCA1"/>
</s:form>



--%>