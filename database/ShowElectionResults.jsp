<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<s:form action="aq">
    
 
  
    <table border="1">
        <thead>
            <tr>
                <th>Cid</th>
                <th>Candidate Name</th>
                <th>City</th>
                <th>Party</th>
                <th>Total Votes</th>
                
            </tr>
        </thead>
        <tbody>
            <%Session s=HibernateUtil.getSessionFactory().openSession();
               List list=s.createQuery("select c.cid,v.fname,p.pname,ct.cityName,c.votes "
                       + "from com.hp.pojo.Candidate c,com.hp.pojo.Voter v,com.hp.pojo.Politicalparty p,com.hp.pojo.City ct "
                  + "where c.voterIdentityNumber=v.voterIdentityNumber  and c.pcode=p.pcode and c.cityCode=ct.cityCode and "
                       + "c.pcode="+request.getAttribute("pcode")+"and c.cityCode="+request.getAttribute("cityCode")).list();
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
                <td><%=ob[4]%></td>
               
            </tr>
           <%}
           s.close();%>
        </tbody>
    </table>

    
    
</s:form>
