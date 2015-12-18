

package com.hp.action;

import com.hp.pojo.Candidate;
import com.hp.pojo.Electiondetails;
import com.hp.pojo.Politicalparty;
import com.hp.pojo.Users;
import com.hp.pojo.Voter;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Calendar;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class VoteLoginAction extends ActionSupport implements ServletRequestAware{
    
    private int Userid;
    private String pass;
    HttpServletRequest request;
    private List<Candidate> candidates;
    private List<Politicalparty> parties;
    private List canparty;
   

    public List getCanparty() {
        return canparty;
    }

    public void setCanparty(List canparty) {
        this.canparty = canparty;
    }

    public List<Politicalparty> getParties() {
        return parties;
    }

    public void setParties(List<Politicalparty> parties) {
        this.parties = parties;
    }
    
    public List<Candidate> getCandidates() {
        return candidates;
    }

    public void setCandidates(List<Candidate> candidates) {
        this.candidates = candidates;
    }

    
    @Override
    public void validate() {
        if(Userid<=0)
            addFieldError("Userid","Enter user id");

        if(pass==null||pass.equals(""))
            addFieldError("pass","Enter password");
//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String execute() throws Exception {
        HttpSession session=request.getSession(true);
       Session s=HibernateUtil.getSessionFactory().openSession();
        Users u=(Users)s.get(Users.class,Userid);
       Electiondetails e=(Electiondetails)s.get(Electiondetails.class,2014);
       /*java.util.Date now=new java.util.Date();
       java.sql.Date currdate = new java.sql.Date(now.getTime());*/
       Date date = new Date();                      // timestamp now
Calendar cal = Calendar.getInstance();       // get calendar instance
cal.setTime(date);                           // set cal to date
cal.set(Calendar.HOUR_OF_DAY, 0);            // set hour to midnight
cal.set(Calendar.MINUTE, 0);                 // set minute in hour
cal.set(Calendar.SECOND, 0);                 // set second in minute
cal.set(Calendar.MILLISECOND, 0);            // set millis in second
Date curdate = cal.getTime(); 
       
       
       java.sql.Date electdate=(java.sql.Date)e.getElectiondate();
       java.sql.Date currdate = new java.sql.Date(curdate.getTime());
    
       System.out.println("Current Date"+currdate);
        System.out.println("Election Date"+electdate);
       
        if(currdate.before(electdate)){
            
       request.setAttribute("msg", "Psss!!!Elections have not started yet.Go to Help/ElectionDetails link in MENU.");
           return ERROR;
       }
        
         if(currdate.after(electdate)){
            
       request.setAttribute("msg", "Sorry!!!Elections are over");
           return ERROR;
       }
        if(u!=null)
        {
             Voter v=(Voter)s.get(Voter.class,u.getVoterIdentityNumber());
             parties=s.createCriteria(Politicalparty.class).list();
     candidates=s.createCriteria(Candidate.class).add(Restrictions.eq("cityCode",v.getCityCode())).add(Restrictions.eq("candidateStatus",Boolean.TRUE)).list();
       canparty=s.createQuery("select c.cid,c.cname,p.pname from com.hp.pojo.Candidate c,com.hp.pojo.Politicalparty p"
               + " where c.pcode=p.pcode").list();
             if(u.getPassword().equals(pass) && u.getIsActive()== Boolean.TRUE)
        {
        session.setAttribute("id",Userid);
        session.setAttribute("name", v.getFname());
        session.setAttribute("cityCode", v.getCityCode());
        s.close();
        if(v.getHasVoted()==Boolean.FALSE)
        return SUCCESS;
        else{
        request.setAttribute("msg","You have already Voted");
        return ERROR;
        }
        }
         else{
        request.setAttribute("msg","Invalid UserId/password");
        return ERROR;
        }
        
        }
        else
        {
            request.setAttribute("msg","Wrong userid");
        return ERROR;
        } 
    }
    
    

    public int getUserid() {
        return Userid;
    }

    public void setUserid(int Userid) {
        this.Userid = Userid;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setServletRequest(HttpServletRequest hsr) {
    request=hsr;    
    }
    
    
}
