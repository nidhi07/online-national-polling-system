<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="com.hp.pojo.Politicalparty"%>
<%@page import="com.hp.pojo.Users"%>
<%@page import="com.hp.pojo.City"%>
<%@page import="com.hp.pojo.Candidate"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="com.hp.pojo.Voter"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
Session s=HibernateUtil.getSessionFactory().openSession();
    List candidates;
    
   
    candidates=s.createQuery("select c.cityCode,max(c.votes) "
            + "from com.hp.pojo.Candidate c group by c.cityCode").list();
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
                    <li ><a href="index.jsp">Login</a></li>
					
                </ul>
            </nav>
        </div>
    </header>
      
      
      <div class="row">
          
          <div class="col-md-4">
          </div>
          
          <div id="welcome-message" class="col-md-4">
              <h2><strong>View Results</strong></h2>
             
          </div>
          
          <div class="col-md-4">
          </div>
          
          
      </div>
          
        
      <div class="row">
          <div class="col-md-3"></div>
          
          <div class="col-md-6">
              <table border="1">
    <thead>
        <tr>
            <th>Candidate Id</th>
            <th>Name</th>
            <th>City</th>
            <th>Party</th>
            <th>Total votes</th>
            
        </tr>
    </thead>
    <tbody>
        <%
 List<Candidate> cds;
 int cid=0;
     Iterator i=candidates.iterator();
     while(i.hasNext())
        {
            Object[] ob=(Object[])i.next();
             cds=s.createCriteria(Candidate.class)
                     .add(Restrictions.eq("cityCode",ob[0])).add(Restrictions.eq("votes",ob[1])).list();
             for(Candidate c:cds)
             {   
             
          Voter v=(Voter)s.get(Voter.class,c.getVoterIdentityNumber());
        City ct=(City)s.get(City.class,c.getCityCode());
        Politicalparty p=(Politicalparty)s.get(Politicalparty.class,c.getPcode());
        %>
    
        <tr>
            <td><%=c.getCid()%></td>
            <td><%=c.getCname()%></td>
            <td><%=ct.getCityName()%></td>
            <td><%=p.getPname()%></td>
            <td><%=c.getVotes()%></td>
           
        </tr>
         <%} }
     s.close();%>
    </tbody>
</table>
            
              
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


<table border="1">
    <thead>
        <tr>
            <th>Candidate Id</th>
            <th>Name</th>
            <th>City</th>
            <th>Party</th>
            <th>Total votes</th>
            
        </tr>
    </thead>
    <tbody>
        <%
 List<Candidate> cds;
 int cid=0;
     Iterator i=candidates.iterator();
     while(i.hasNext())
        {
            Object[] ob=(Object[])i.next();
             cds=s.createCriteria(Candidate.class)
                     .add(Restrictions.eq("cityCode",ob[0])).add(Restrictions.eq("votes",ob[1])).list();
             for(Candidate c:cds)
             {   
             
          Voter v=(Voter)s.get(Voter.class,c.getVoterIdentityNumber());
        City ct=(City)s.get(City.class,c.getCityCode());
        Politicalparty p=(Politicalparty)s.get(Politicalparty.class,c.getPcode());
        %>
    
        <tr>
            <td><%=c.getCid()%></td>
            <td><%=c.getCname()%></td>
            <td><%=ct.getCityName()%></td>
            <td><%=p.getPname()%></td>
            <td><%=c.getVotes()%></td>
           
        </tr>
         <%} }
     s.close();%>
    </tbody>
</table>

--%>