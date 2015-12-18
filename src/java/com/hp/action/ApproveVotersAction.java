

package com.hp.action;

import com.hp.pojo.Users;
import com.hp.pojo.Voter;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


public class ApproveVotersAction extends ActionSupport implements ServletRequestAware{
    
    private String b[];
    HttpServletRequest request;

    @Override
    public String execute() throws Exception {
        int uid=0;
        Session s=HibernateUtil.getSessionFactory().openSession();
        b=request.getParameterValues("ch");
        for(String a:b)
        {
        int vid=new Integer(a);
        Voter v=(Voter)s.get(Voter.class,vid);
        
        
        List<Users> us=s.createCriteria(Users.class).add(Restrictions.eq("voterIdentityNumber", vid)).add(Restrictions.eq("accountType","V")).list();
        for(Users u:us)
        {
        u.setIsActive(Boolean.TRUE);
        s.update(u);
        }
        
        v.setVoterStatus(Boolean.TRUE);
        s.update(v);
        s.beginTransaction().commit();
        }
       return SUCCESS;
    }
    
    
    
    public void setServletRequest(HttpServletRequest hsr) {
    request=hsr;  
    }
    
    
    
}
