
package com.hp.action;

import com.hp.pojo.Candidate;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import org.hibernate.Session;


    
    



import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import org.hibernate.Session;

public class CData1Action extends ActionSupport {
      private static List<Candidate> candidates;
      
      public String getAllCandidates()
      {
          
          Session s=HibernateUtil.getSessionFactory().openSession();
          candidates=s.createCriteria(Candidate.class).list();
          s.close();
     return SUCCESS;
     
      }

    public List<Candidate> getCandidates() {
        return candidates;
    }

    public void setCandidates(List<Candidate> candidates) {
        CData1Action.candidates = candidates;
    }
    
}

    

