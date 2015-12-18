<%-- 
    Document   : AddEditPromises
    Created on : Jul 25, 2014, 12:27:25 AM
    Author     : prakush
--%>

<%@page import="com.hp.pojo.Candidatepromises"%>
<%@page import="java.util.List"%>
<%@page import="com.hp.pojo.Candidate"%>
<%@page import="com.hp.pojo.Users"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
    int cid=0;
      Session s=HibernateUtil.getSessionFactory().openSession();
int id=(Integer)session.getAttribute("id");
Users u=(Users)s.get(Users.class,id);
int vid=u.getVoterIdentityNumber();
List<Candidate> cs=s.createCriteria(Candidate.class).add(Restrictions.eq("voterIdentityNumber", vid)).list();
for(Candidate c:cs)
cid=c.getCid();
List<Candidatepromises> cps=s.createCriteria(Candidatepromises.class).add(Restrictions.eq("cid", cid)).list();

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
              <h2><strong>${sessionScope.name} </strong>| Answer Questions</h2>
              <h3><strong><a href="CandidateProfile.jsp">Return To Home</a></strong></h3>
          </div>
          
          <div class="col-md-4">
          </div>
          
          
      </div>
          
          
          
          <div class="row">
     
              <div class="col-md-1">
              </div>
              
              <div class="col-md-2">
                  <a href="UpdateVprofile.jsp" class="thumbnail">
                      <img src="img/settings.png" title="Change your password">
                  </a>
              </div>
              
              <div class="col-md-2">
                  <a href="Answer.jsp" class="thumbnail">
                      <img src="img/quora.png" title="ask questions">
                  </a>
                  
              </div>
              
              <div class="col-md-2">
                  <a href="cpydata" class="thumbnail">
                      <img src="img/election.jpg" title="View election results">
                  </a>
              </div>
              
              <div class="col-md-2">
                  <a href="ViewCandidates.jsp" class="thumbnail">
                      <img src="img/candidate.jpg" title="View candidates profile">
                  </a>
              </div>
              
              <div class="col-md-2">
                  <a href="AddEditPromises.jsp" class="thumbnail">
                      <img src="img/promise.jpg" title="add/edit your promises">
                  </a>
              </div>
              
              <div class="col-md-1">
              </div>
</div>
          
          
          <div class="row">
              
              <div class="col-md-3"></div>
              
              <div class="col-md-6">
                  
                                        <center>

                  <table border="1">
                      
    <thead>
        <tr>
            <th>Promise Id</th>
            <th>PROMISES</th>
        </tr>
    </thead>
    
    <tbody>
        <%


        if(cps!=null)
        for(Candidatepromises cp:cps)
{
%>
        <tr>
            <td><%=cp.getPromId()%></td>
            <td><%=cp.getPromises()%></td>
        </tr>
        <%} s.close();%>
    </tbody>
</table>

        </center>
    <br><br>

<center>
    
    
    
    <form id="PromiseValidator" name="PromiseValidator" action="/ONPS/PromiseValidator.action" class="form-horizontal" method="POST">
<fieldset>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="PromiseValidator_promiseId">Promise ID</label>  
  <div class="col-md-4">
  <input id="PromiseValidator_promiseId" name="promiseId" placeholder="Only For Existing Promises" class="form-control input-md" type="text">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="PromiseValidator_promises">Promises</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="PromiseValidator_promises" name="promises"></textarea>
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="PromisesValidator_promiseaction"></label>
  <div class="col-md-4">
      <input type="submit" id="PromisesValidator_0" name="promiseaction" value="Add/Edit Promises"/>
  </div>
</div>

</fieldset>
</form>
    
<%--  
    
<s:form action="PromisesValidator" method="POST" >
    Write promise Id if u want to edit existing promise...
    <s:textfield name="promiseId" label="Promise Id"/><br><br>
   
    <s:textarea name="promises" label="Promises " cols="50" rows="10"/><br><br>
   
    <s:submit value="Add/Edit Promises" />

</s:form>
    


--%>
    
 </center>    
    
    ${requestScope.msg}
                  
               
              </div>
              
              
              <div class="col-md-3"></div>
              
              
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



<table border="1">
    <thead>
        <tr>
            <th>Promise Id</th>
            <th>PROMISES</th>
        </tr>
    </thead>
    
    <tbody>
        <%


        if(cps!=null)
        for(Candidatepromises cp:cps)
{
%>
        <tr>
            <td><%=cp.getPromId()%></td>
            <td><%=cp.getPromises()%></td>
        </tr>
        <%} s.close();%>
    </tbody>
</table>



<center>
    
<s:form action="PromisesValidator" method="POST" >
    Write promise Id if u want to edit existing promise...
    <s:textfield name="promiseId" label="Promise Id"/>
   
    <s:textarea name="promises" label="Promises " cols="50" rows="10"/>
   
    <s:submit value="Add/Edit Promises" />

</s:form>
    
    <a href="CandidateProfile.jsp">Return to home</a>
    
    
 </center>    
    
    ${requestScope.msg}
    
    

--%>