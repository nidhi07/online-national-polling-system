
package com.hp.action;

import com.hp.pojo.Candidate;
import com.hp.pojo.Users;
import com.hp.pojo.Voter;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;

public class VoteAction extends ActionSupport implements ServletRequestAware{
 
    private int yourCandidate;
    HttpServletRequest request;  
    private int cid1;
     int totalVotes;
    
    public String execute()
    {
        cid1=new Integer(request.getParameter("cid1"));
        System.out.println(cid1);
        System.out.println(yourCandidate);
        HttpSession session=request.getSession(false);
        Session s=HibernateUtil.getSessionFactory().openSession();
        Candidate c=(Candidate)s.get(Candidate.class,cid1);
       
        int id=(Integer)session.getAttribute("id");
        Users u=(Users)s.get(Users.class,id);
        
        Voter v=(Voter)s.get(Voter.class,u.getVoterIdentityNumber());
        
        if(c!=null&&!v.getHasVoted())//!v.getHasVoted() added ( changes made )
        {   System.out.println(c.getCid());
            totalVotes=c.getVotes();
            totalVotes++;
            c.setVotes(totalVotes);
            v.setVoterStatus(Boolean.TRUE);
            v.setHasVoted(Boolean.TRUE); //changes made
            s.update(v);
            s.update(c);
            
            s.beginTransaction().commit();
            s.close();
              return SUCCESS;
        }
        
        return ERROR;
      
    }

    public int getYourCandidate() {
        return yourCandidate;
    }

    public void setYourCandidate(int yourCandidate) {
        this.yourCandidate = yourCandidate;
    }

    public void setServletRequest(HttpServletRequest hsr) 
    {
    request=hsr;   
    }
    
    
}
