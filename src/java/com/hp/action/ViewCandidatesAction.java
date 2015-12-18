
package com.hp.action;

import com.hp.pojo.Candidate;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class ViewCandidatesAction extends ActionSupport implements ServletRequestAware{
  
     private int cityCode;
    private static List<Candidate> candidates;
 HttpServletRequest request;
    

    @Override
    public String execute() throws Exception {
        Session s=HibernateUtil.getSessionFactory().openSession();
       request.setAttribute("cityCode",cityCode);
       candidates=s.createCriteria(Candidate.class).add(Restrictions.eq("cityCode",cityCode)).add(Restrictions.eq("candidateStatus", Boolean.TRUE)).list();
        
        return SUCCESS; //To change body of generated methods, choose Tools | Templates.
    }

    public static List<Candidate> getCandidates() {
        return candidates;
    }

    public static void setCandidates(List<Candidate> candidates) {
        ViewCandidatesAction.candidates = candidates;
    }

   
 

    
    public int getCityCode() {
        return cityCode;
    }

    public void setCityCode(int cityCode) {
        this.cityCode = cityCode;
    }

    public void setServletRequest(HttpServletRequest hsr) {
    request=hsr;   
    }
}
