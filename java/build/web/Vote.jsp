<%@page import="com.hp.pojo.Voter"%>
<%@page import="com.hp.pojo.Users"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%--Welcome ${sessionScope.name} <a href="LOGOUT">Logout</a> --%>

<%
Session s=HibernateUtil.getSessionFactory().openSession();
int id=(Integer)session.getAttribute("id");
Users u=(Users)s.get(Users.class,id);
Voter v=(Voter)s.get(Voter.class,u.getVoterIdentityNumber());
List canparty=s.createQuery("select c.cid,c.cname,p.pname from com.hp.pojo.Candidate c,com.hp.pojo.Politicalparty p"
               + " where c.pcode=p.pcode and c.candidateStatus=TRUE and c.cityCode="+v.getCityCode()).list();

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
                    <li ><a href="VoteLogin.jsp">Logout</a></li>
					
                </ul>
            </nav>
        </div>
    </header>
      
      
      <div class="voter-box">
      
      <div class="row">
          
          <div class="col-md-4">
          </div>
          
          <div id="welcome-message" class="col-md-4">
             <h2><strong>${sessionScope.name} </strong>| Select A Candidate</h2>
             
          </div>
          
          <div class="col-md-4">
          </div>
          
          
      </div>
          
    
              <div class="row">
                  
                  <div class="col-md-3"></div>
                  
                  <div class="col-md-6">
                      
                      <s:form action="V">

<p>
    <%Iterator i=canparty.iterator();
    while(i.hasNext())
    {
        Object[] ob=(Object[])i.next();
    
    %>
  <label>
      <input type="radio" name="cid1" value="<%=ob[0]%>" />
      <%=ob[1]+" "+ob[2]%><img src="parties/<%=ob[2]%>.jpg" height=100 width="100" alt="<%=ob[2]%>"/>
   </label>
  <br/>
  <br />
   <%}%>
</p>
    

<s:submit value="VOTE" cssClass="btn btn-primary"/>

</s:form>

                      
                      
                      
                  </div>
                  
                  
                  
                  <div class="col-md-3"></div>
                  
                  
                  
                  
              </div>
          
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



<s:form action="V">


<h3>Choose a candidate to vote</h3>

<p>
    <%Iterator i=canparty.iterator();
    while(i.hasNext())
    {
        Object[] ob=(Object[])i.next();
    
    %>
  <label>
      <input type="radio" name="cid1" value="<%=ob[0]%>" />
      <%=ob[1]+" "+ob[2]%>
   </label>
  <br/>
  <br />
   <%}%>
</p>
    

<s:submit value="VOTE"/>

</s:form>


--%>