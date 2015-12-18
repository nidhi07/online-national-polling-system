<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%@page import="com.hp.pojo.Users" %>



You have successfully registered.<br>

User id
        ${requestScope.id}