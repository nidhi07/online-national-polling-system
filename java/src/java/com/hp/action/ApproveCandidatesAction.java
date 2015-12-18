

package com.hp.action;

import com.hp.pojo.Candidate;
import com.hp.pojo.Electionresult;
import com.hp.pojo.Users;
import com.hp.pojo.Voter;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


public class ApproveCandidatesAction  extends ActionSupport implements ServletRequestAware {
    
       
    private String b[];
    HttpServletRequest request;

    @Override
    public String execute() throws Exception {
        int uid=0;
        Session s=HibernateUtil.getSessionFactory().openSession();
        b=request.getParameterValues("ch");
        
   
       
        for(String a:b)
        {
        int cid=new Integer(a);
        Candidate c=(Candidate)s.get(Candidate.class,cid);
        c.setCandidateStatus(Boolean.TRUE);
        int vid=c.getVoterIdentityNumber();
       
        
        
        List<Users> us=s.createCriteria(Users.class).add(Restrictions.eq("voterIdentityNumber", vid)).add(Restrictions.eq("accountType","C")).list();
        for(Users u:us)
        {
        u.setIsActive(Boolean.TRUE);
        s.update(u);
        }
        
        
        s.update(c);
        s.beginTransaction().commit();
        }
       return SUCCESS;
    }
    
    
    
    public void setServletRequest(HttpServletRequest hsr) {
    request=hsr;  
    }
    
    
    
}
