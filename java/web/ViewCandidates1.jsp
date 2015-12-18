<%@page import="com.hp.pojo.Politicalparty"%>
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
    List<Candidate> candidates;
       candidates=s.createCriteria(Candidate.class).add(Restrictions.eq("cityCode",request.getAttribute("cityCode"))).add(Restrictions.eq("candidateStatus", Boolean.TRUE)).list();
%>

<table border="1">
    <thead>
        <tr>
            <th>Candidate Id</th>
            <th>Name</th>
            <th>City</th>
            <th>Party</th>
            <th>Voter id</th>
            <th>email id</th>
        </tr>
    </thead>
    <tbody>
        <%
       for(Candidate c:candidates ){
            Voter v=(Voter)s.get(Voter.class,c.getVoterIdentityNumber());
        City ct=(City)s.get(City.class,c.getCityCode());
        Politicalparty p=(Politicalparty)s.get(Politicalparty.class,c.getPcode());
        %>
    
        <tr>
            <td><%=c.getCid()%></td>
            <td><%=c.getCname()%></td>
            <td><%=ct.getCityName()%></td>
            <td><%=p.getPname()%></td>
            <td><%=c.getVoterIdentityNumber()%></td>
            <td><%=v.getEmail()%></td>
        </tr>
         <%} s.close();%>
    </tbody>
</table>

<a href="index.jsp">return to home</a>