<%@page import="com.hp.pojo.City"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.action.HibernateUtil"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<h1>VOTER REGISTRATION FORM</h1>

<s:head/>

<s:form action="RV" method="post" enctype="multipart/form-data" >
   
<s:textfield name="fname" label="FirstName*"/>

<s:textfield name="mname" label="MiddleName"/>  

<s:textfield name="lname" label="LastName"/>

<s:textfield name="mother" label="MotherName*"/>

<s:textfield name="father" label="FatherName*"/>

<s:select list="{'M','F','O'}" name="gender" label="Gender*" value="M"/>


<s:textfield name="dateOfBirth"  label="DateOfBirth*"/><s:label label="date in yyyy-mm-dd"/>

<s:textfield name="email" label="email*"/>

<s:select list="cities" listKey="cityCode" listValue="cityName" name="citycode" label="Choose ur city"  value="1"/>


<s:file name="file" label="Voter Identity Card*"/>

<s:textfield name="voterid" label="Voter Identity Number"/>

<s:password name="pass" label="Password*"/>

<s:password name="confpass" label="Confirm Password*"/>

    <s:submit value="REGISTER"/>
</s:form>

