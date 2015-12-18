
package com.hp.action;

import com.hp.pojo.City;
import com.hp.pojo.Voter;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class ViewVotersAction extends ActionSupport implements ServletRequestAware{
    
    private int cityCode;
    private static List<Voter> voters;
 HttpServletRequest request;
    

    @Override
    public String execute() throws Exception {
        Session s=HibernateUtil.getSessionFactory().openSession();
       request.setAttribute("cityCode",cityCode);
       voters=s.createCriteria(Voter.class).add(Restrictions.eq("cityCode",cityCode)).add(Restrictions.eq("voterStatus", Boolean.TRUE)).list();
        
        return SUCCESS; //To change body of generated methods, choose Tools | Templates.
    }

    public static List<Voter> getVoters() {
        return voters;
    }

    public static void setVoters(List<Voter> voters) {
        ViewVotersAction.voters = voters;
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
