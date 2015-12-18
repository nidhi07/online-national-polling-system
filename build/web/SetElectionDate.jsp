<%@taglib prefix="s" uri="/struts-tags" %>


<s:form action="SetDate">
    
    <s:textfield name="year" label="Year" />
    
    <s:textfield name="ElectionDate" label="Election Date" placeholder="yyyy-MM-dd" />
    
    <s:submit value="SET ELECTION DATE"/>
    
</s:form>