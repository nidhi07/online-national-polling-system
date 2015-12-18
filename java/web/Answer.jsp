<%@page import="com.hp.pojo.Candidate"%>
<%@page import="com.hp.pojo.Users"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@page import="com.hp.pojo.Questionanswer"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<% 
    int cid=0;
   Session s=HibernateUtil.getSessionFactory().openSession();
int id=(Integer)session.getAttribute("id");
Users u=(Users)s.get(Users.class,id);
int vid=u.getVoterIdentityNumber();
List<Candidate> cs=s.createCriteria(Candidate.class).add(Restrictions.eq("voterIdentityNumber", vid)).list();
for(Candidate c:cs)
cid=c.getCid();
List<Questionanswer> qa=s.createCriteria(Questionanswer.class).add(Restrictions.eq("cid", cid)).list();

%>




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
                  
                  
                  <s:form action="Ans">

<table border="1">
    <thead>
        <tr>
            <th>Question</th>
            <th>Answer</th>
            <th>Select</th>
        </tr>
    </thead>
    
    <tbody>
        <%for(Questionanswer q:qa){%>
        <tr>
            <td><%=q.getQuestion()%></td>
            <td><%=q.getAnswer()%></td>
            <td><input type="checkbox" name="ch" value="<%=q.getQuesId()%>"/></td>
        </tr>
        <%} 
        s.close();
        %>
    </tbody>
</table>
    <br><br>
    <s:textarea cols="100" rows="15" name="answer" placeholder="Answer Here....."/>
        <br><br>
        <s:submit value="ANSWER"/>
        
</s:form>

                  
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

<s:form action="Ans">

<table border="1">
    <thead>
        <tr>
            <th>Question</th>
            <th>Answer</th>
            <th>Select</th>
        </tr>
    </thead>
    
    <tbody>
        <%for(Questionanswer q:qa){%>
        <tr>
            <td><%=q.getQuestion()%></td>
            <td><%=q.getAnswer()%></td>
            <td><input type="checkbox" name="ch" value="<%=q.getQuesId()%>"/></td>
        </tr>
        <%} 
        s.close();
        %>
    </tbody>
</table>
    <br><br>
        <s:textarea name="answer" value="Answer Here....."/>
        <br><br>
        <s:submit value="ANSWER"/>
        
</s:form>


--%>