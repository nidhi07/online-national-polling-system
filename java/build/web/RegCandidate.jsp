<%@taglib prefix="s" uri="/struts-tags" %>

<s:form action="RegCandidate">    
    
<s:textfield name="voterid" label="Voter Identity Number"/>

<s:textfield name="cname" label="Candidate Name"/>

<s:textfield name="pcode" label="PartyCode"/>

<s:textfield name="cityCode" label="cityCode"/>

<s:textfield name="currentPosition" label="Current Position"/>

<s:password name="pass" label="Password*"/>

<s:password name="confpass" label="Confirm Password*"/>

<s:submit value="Register"/>

</s:form>