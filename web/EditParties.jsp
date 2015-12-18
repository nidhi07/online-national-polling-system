<%@page import="com.hp.pojo.Politicalparty"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%
Session s=HibernateUtil.getSessionFactory().openSession();
List<Politicalparty> ps=s.createCriteria(Politicalparty.class).list();

%>



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
              
             
          </div>
          
          <div class="col-md-4">
          </div>
          
          
      </div>
          
          
              <div class="party-box">
                  
                  
            
                
                  <form id="AP" name="AP" action="/ONPS/AP.action" class="form-horizontal" method="POST" enctype="multipart/form=data">
<fieldset>

<!-- Form Name -->
<center><legend></legend> </center>
<center><h2><strong>${sessionScope.name} </strong>| Add or Edit Parties</h2></center>


<div class="form-group">
     <label class="col-md-4 control-label" for="delete">Delete Parties</label>
    <div class="col-md-4">
        <h4></h4>
        <table border="1">
        <thead>
            <tr>
                <th>Party code</th>
                <th>Party name</th>
                <th>Party emblem</th>
                <th>Select</th>
            </tr>
        </thead>
        <tbody>
            <% for(Politicalparty p:ps)
            {        
            %>
            <tr>
                <td><%=p.getPcode()%></td>
                <td><%=p.getPname()%></td>
                <td></td>
                <td><input type=checkbox name="ch" value="<%=p.getPcode()%>"/></td>
            </tr>
            <%}%>
            
        </tbody>
    </table>
    </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="AP_delete"></label>
  <div class="col-md-4">
      <input type="submit" id="AP_2" name="delete" value="Delete"/>
  </div>
</div>



<div class="form-group">
     <label class="col-md-4 control-label" for=""></label>
    <div class="col-md-4">
        
    </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="AP_pcode">Party Code</label>  
  <div class="col-md-4">
  <input id="AP_pcode" name="pcode" placeholder="" class="form-control input-md" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="AP_pname">Party Name</label>  
  <div class="col-md-4">
  <input id="AP_pname" name="pname" placeholder="" class="form-control input-md" type="text">
    
  </div>
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="AP_file">Party Emblem</label>
  <div class="col-md-4">
    <input id="AP_file" name="file" class="input-file" type="file">
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="AP_add"></label>
  <div class="col-md-4">
      <input type="submit" id="AP_0" name="add" value="Add" formaction="DP"/>
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
        <script src="js/bootstrap.js"></script>
	
	<!--Footer Ends Here-->
	
  </body>
</html>









<%--



<s:form action="AP" method="post" enctype="multipart/form-data">
    
    <table border="1">
        <thead>
            <tr>
                <th>Party code</th>
                <th>Party name</th>
                <th>Party emblem</th>
                <th>Select</th>
            </tr>
        </thead>
        <tbody>
            <% for(Politicalparty p:ps)
            {        
            %>
            <tr>
                <td><%=p.getPcode()%></td>
                <td><%=p.getPname()%></td>
                <td></td>
                <td><input type=checkbox name="ch" value="<%=p.getPcode()%>"/></td>
            </tr>
            <%}%>
            
        </tbody>
    </table>

            <br><br>
            <s:textfield name="pcode" label="Party Code"/>
            
            <s:textfield name="pname" label="Party Name"/>
            
            <s:file name="file" label="Party Emblem"/> <br><br>
            
            <s:submit value="ADD PARTY"/>
    
            <s:submit value="DELETE PARTY" formaction="DP" />
</s:form>



--%>