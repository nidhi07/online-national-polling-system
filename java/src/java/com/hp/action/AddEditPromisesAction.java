/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.hp.action;

import com.hp.action.HibernateUtil;
import com.hp.pojo.Candidate;
import com.hp.pojo.Candidatepromises;
import com.hp.pojo.Users;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


public class AddEditPromisesAction extends ActionSupport implements ServletRequestAware{

    HttpServletRequest request ;
    
    private int cID ;
    private String candidateName ;
    private String promises ;
    private int promiseId;
   

    public String getPromises() {
        return promises;
    }

    public int getPromiseId() {
        return promiseId;
    }

    public void setPromiseId(int promiseId) {
        this.promiseId = promiseId;
    }

    public void setPromises(String promises) {
        this.promises = promises;
    }

    

   
    Session s=HibernateUtil.getSessionFactory().openSession();
   
    
    @Override
    public String execute() throws Exception {
         HttpSession session=request.getSession(false);
   
int id=(Integer)session.getAttribute("id");
Users u=(Users)s.get(Users.class,id);
int vid=u.getVoterIdentityNumber();
List<Candidate> cs=s.createCriteria(Candidate.class).add(Restrictions.eq("voterIdentityNumber", vid)).list();
for(Candidate c:cs)
cID=c.getCid();     
       Candidatepromises cp;
if(promiseId!=0){
    cp=(Candidatepromises)s.get(Candidatepromises.class,promiseId);
cp.setPromises(promises);
s.update(cp);
s.beginTransaction().commit();
s.close();
request.setAttribute("msg","promise edited successfully");
return SUCCESS;
}


            
    
            Candidatepromises cpromise = new Candidatepromises();
            cpromise.setCid(cID);
            
            cpromise.setPromises(promises);
            request.setAttribute("msg","promise added successfully");
            s.save(cpromise);
            
            s.beginTransaction().commit();
            s.close();
            return SUCCESS ;
        //}
        

      
        
//To change body of generated methods, choose Tools | Templates.
    }
    
    
    @Override
    public void validate() {
        if(promises==null||promises.equals(""))
        {
        addFieldError("promises","Enter promise");
        }
        
    }

    public void setServletRequest(HttpServletRequest hsr) {
       this.request = hsr ;
    }
    
    
}
