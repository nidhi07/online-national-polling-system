<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
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
      
      
      <div class="row">
          
          <div class="col-md-4">
          </div>
          
          <div id="welcome-message" class="col-md-4">
              <h2><strong>${sessionScope.name} </strong>| Ask Questions</h2>
          </div>
          
          <div class="col-md-4">
          </div>
          
          
      </div>
      
          <div class="voter-dashboard">
      
          <div class="row">
              
              <div class="col-md-2">
                  
              </div>
              
              <center>
              <div class="col-xs-6 col-md-8">
                  
                <s:form action="aq">
   
    <table border="1">
  
            
            <thead>
            <tr>
            <div id=""><th>Cid</th></div>  
            <div id="">   <th>Cname</th></div>
            <div id="">  <th>Party</th> </div>
            <div id="">   <th>City</th> </div>
            <div id="">   <th>Select</th></div>
            </tr>
        </thead>
            


        <tbody>
            <%Session s=HibernateUtil.getSessionFactory().openSession();
               List list=s.createQuery("select c.cid,v.fname,p.pname,ct.cityName from com.hp.pojo.Candidate c,com.hp.pojo.Voter v,com.hp.pojo.Politicalparty p,com.hp.pojo.City ct "
                  + "where c.voterIdentityNumber=v.voterIdentityNumber  and c.pcode=p.pcode and c.cityCode=ct.cityCode").list();
            Iterator i=list.iterator();
            while(i.hasNext())
            { 
                Object[] ob=(Object[])i.next();
            %>
            <tr>
                <td id=""><%=ob[0]%></td>
                <td id=""><%=ob[1]%></td>
                <td id=""><%=ob[2]%></td>
                <td id=""><%=ob[3]%></td>
                <td id=""><input type="checkbox" name="ch" value="<%=ob[0]%>" ></td>
            </tr>
           <%}
           s.close();%>
        </tbody>
      
    </table>
        


           <center>  <s:textarea name="Question"  cols="50" rows="10"/> </center><br>
    
           <center>    <s:submit value="Send"/> </center>
    
</s:form>
           
               </div>
              
              
                  
              </div>
              
                  </center>
              <div class="col-md-2">
                  
              </div>
              
          </div>
          
     
      
  
      
      
 <!--    
      
      <div class="voter-profile"  >
 Welcome ${sessionScope.name}  
<a href="UpdateVprofile.jsp">Update My Profile</a>

<a href="AskQues.jsp">Ask questions</a>

 <%--  <s:a action="/ONPS/cpydata.action">Election Results</s:a> --%>
 
<a href="ViewCandidates.jsp">View Candidates</a>
          
          
      </div>
 
 -->

    
    
	
    
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
			<p><a href="AskQues.jsp">Ask Questions .</a></p>
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

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<s:form action="aq">
    
 
    <div id="table-wrapper"> 
        
    <table border="1">
        <div id="header">
            
            <thead>
            <tr>
            <div id="head1"><th>Cid</th></div>  
            <div id="head2">   <th>Cname</th></div>
            <div id="head3">  <th>Party</th> </div>
            <div id="head4">   <th>City</th> </div>
            <div id="head5">   <th>Select</th></div>
            </tr>
        </thead>
            
            
        </div>
        
        <div id="tbody">
        <tbody>
            <%Session s=HibernateUtil.getSessionFactory().openSession();
               List list=s.createQuery("select c.cid,v.fname,p.pname,ct.cityName from com.hp.pojo.Candidate c,com.hp.pojo.Voter v,com.hp.pojo.Politicalparty p,com.hp.pojo.City ct "
                  + "where c.voterIdentityNumber=v.voterIdentityNumber  and c.pcode=p.pcode and c.cityCode=ct.cityCode").list();
            Iterator i=list.iterator();
            while(i.hasNext())
            { 
                Object[] ob=(Object[])i.next();
            %>
            <tr>
                <td id="td1"><%=ob[0]%></td>
                <td id="td2"><%=ob[1]%></td>
                <td id="td3"><%=ob[2]%></td>
                <td id="td4"><%=ob[3]%></td>
                <td id="td5"><input type="checkbox" name="ch" value="<%=ob[0]%>" ></td>
            </tr>
           <%}
           s.close();%>
        </tbody>
        </div>
    </table>
        
    </div>

    <s:textarea name="Question"  cols="50" rows="10"/>
    
    <s:submit value="Send"/>
    
</s:form>


--%>