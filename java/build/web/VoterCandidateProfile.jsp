<%@page import="com.hp.pojo.Candidatepromises"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="com.hp.pojo.Questionanswer"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<h1>CANDIDATE PROFILE</h1>

<h3>Question/Answers</h3>

<% 
    int cid=new Integer(request.getParameter("ch"));
   Session s=HibernateUtil.getSessionFactory().openSession();

List<Questionanswer> qa=s.createCriteria(Questionanswer.class).add(Restrictions.eq("cid", cid)).list();

%>


<table border="1">
    <thead>
        <tr>
            <th>Question</th>
            <th>Answer</th>
            
        </tr>
    </thead>
    
    <tbody>
        <% for(Questionanswer q:qa){%>
        <tr>
            <td><%=q.getQuestion()%></td>
            <td><%=q.getAnswer()%></td>
            
        </tr>
        <%} 
        
        %>
    </tbody>
</table>
    
    
    <h3>CANDIDATE PROMISES</h3>
    
    
    

<%
    

List<Candidatepromises> cps=s.createCriteria(Candidatepromises.class).add(Restrictions.eq("cid", cid)).list();

%>




<table border="1">
    <thead>
        <tr>
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
            <td><%=cp.getPromises()%></td>
        </tr>
        <%} s.close();%>
    </tbody>
</table>
