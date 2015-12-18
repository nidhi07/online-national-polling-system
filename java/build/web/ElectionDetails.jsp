<%@page import="com.hp.action.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.pojo.Electiondetails"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">

.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-large;
	color: #0000CC;
}
.style2 {font-size: 24px}
.style3 {
	font-size: 36px;
	color: #990000;
}

</style>
</head>

<body>
    <% Session s=HibernateUtil.getSessionFactory().openSession();
        Electiondetails e=(Electiondetails)s.get(Electiondetails.class,2014);%>
<div align="center" class="style1">ELECTION DETAILS</div>
<p class="style2">Elections are on <%=e.getElectiondate()%>.</p>
<p class="style3">How to Vote?</p>
<p class="style2">1.Click on MENU button in menubar.</p>
<p class="style2">2.Go to link CAST YOUR VOTE.</p>
<p class="style2">3.  Login with your user id and password which you got at the time of voter registration.</p>
<p class="style2">4.Select the  candidate of your choice and click on vote button.</p>
<p class="style2">5.Remember!you can vote only once.. so cast your vote meticulously. </p>
<p class="style3">As a Voter</p>
<p class="style2">1.You can vote.</p>
<p class="style2">2.You can ask questions to any candidate.</p>
<p class="style2">3.You can view every candidate's promises.</p>
<p class="style2">4.You can view election results.</p>
<p class="style3">As a Candidate</p>
<p class="style2">1.You can answer questions asked by voters.</p>
<p class="style2">2.You can ask questions to any candidate.</p>
<p class="style2">3.You can view every candidate's promises.</p>
<p class="style2">4.You can view election results.</p>
<p class="style2">5.You can add/edit promises. </p>
</body>
</html>
