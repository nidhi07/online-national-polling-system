
package com.hp.action;

import com.hp.pojo.Candidate;
import com.hp.pojo.Electionresult;
import com.opensymphony.xwork2.ActionSupport;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


public class UpdateAction extends ActionSupport{

    private List<Candidate> candidates;
    
    @Override
    public String execute() throws Exception {
        
              Date date = new Date();
       DateFormat dateFormat = new SimpleDateFormat("YYYY");
      
       String dateStr = dateFormat.format(date);
       
       int year = Integer.parseInt(dateStr);
        
       Session s=HibernateUtil.getSessionFactory().openSession();
       candidates=s.createCriteria(Candidate.class).add(Restrictions.eq("candidateStatus",Boolean.TRUE)).list();
       s.beginTransaction().commit();
       
       for(Candidate c:candidates)
       {
        Electionresult er=new Electionresult();
        er.setCandidateName(c.getCname());
        er.setCityCode(c.getCityCode());
        er.setElectionYear(year);
        er.setPcode(c.getPcode());
        er.setTotalVotes(c.getVotes());
        s.saveOrUpdate(er);
        s.beginTransaction().commit();
       }
       s.close();
       return SUCCESS;//To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
