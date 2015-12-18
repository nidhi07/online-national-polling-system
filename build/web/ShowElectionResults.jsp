<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<s:form action="aq">
    
 
  
    <table border="1">
        <thead>
            <tr>
                
                <th>Candidate Name</th>
                <th>City</th>
                <th>Party</th>
                <th>Total Votes</th>
                
            </tr>
        </thead>
        <tbody>
            <%Session s=HibernateUtil.getSessionFactory().openSession();
               List list=s.createQuery("select e.candidateName,c.cityName,p.pname,e.totalVotes "
                       + "from com.hp.pojo.Electionresult e,com.hp.pojo.City c,com.hp.pojo.Politicalparty p "
                       + "where e.cityCode=c.cityCode and e.pcode=p.pcode and "
                       + "e.pcode="+request.getAttribute("pcode")+" and e.cityCode="+request.getAttribute("cityCode")+" and e.electionYear="+request.getAttribute("year")).list();
            Iterator i=list.iterator();
            while(i.hasNext())
            { 
                Object[] ob=(Object[])i.next();
            %>
            <tr>
                <td><%=ob[0]%></td>
                <td><%=ob[1]%></td>
                <td><%=ob[2]%></td>
                <td><%=ob[3]%></td>
                
               
            </tr>
           <%}
           s.close();%>
        </tbody>
    </table>

    
    
</s:form>
