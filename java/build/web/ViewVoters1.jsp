<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="com.hp.pojo.Voter"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
Session s=HibernateUtil.getSessionFactory().openSession();
    List<Voter> voters;
       voters=s.createCriteria(Voter.class).add(Restrictions.eq("cityCode",request.getAttribute("cityCode"))).add(Restrictions.eq("voterStatus", Boolean.TRUE)).list();
%>
${requestScope.cityCode}

<table border="1">
    <thead>
        <tr>
            <th>Voter Id</th>
            <th>First Name</th>
            <th>middle Name</th>
            <th>Last Name</th>
            <th>Father's name</th>
            <th>email id</th>
            <th>Voter id card</th>
        </tr>
    </thead>
    <tbody>
        <%
       for(Voter v:voters ){
        %>
    
        <tr>
            <td><%=v.getVoterIdentityNumber()%></td>
            <td><%=v.getFname()%></td>
            <td><%=v.getMname()%></td>
            <td><%=v.getLname()%></td>
            <td><%=v.getFathersName()%></td>
            <td><%=v.getEmail()%></td>
            <td><%=v.getVoterIdentityCard()%> </td>
        </tr>
         <%}%>
    </tbody>
</table>

<a href="index.jsp">return to home</a>