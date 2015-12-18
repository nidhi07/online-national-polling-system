

package com.hp.action;

import com.hp.pojo.Users;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;

public class UpdateVProfileAction extends ActionSupport implements ServletRequestAware {
    
    private String oldpassword;
    private String newpassword;
    private String confirmpassword;
    HttpServletRequest request;
    
    Session s=HibernateUtil.getSessionFactory().openSession();
    @Override
    public String execute() throws Exception {
        HttpSession session=request.getSession(false);
        int id=(Integer)session.getAttribute("id");
        Users u=(Users)s.get(Users.class,id);
        
        if(u.getPassword().equals(oldpassword)){
        
        u.setPassword(newpassword);
        s.update(u);
        s.beginTransaction().commit();
        s.close();
        request.setAttribute("msg","Password Changed Successfully");
          return SUCCESS;
        }
        
        else{
            request.setAttribute("msg","Incorrect Old password");
        return ERROR;
        }
        
      
        //To change body of generated methods, choose Tools | Templates.
    }
    

    public String getOldpassword() {
        return oldpassword;
    }

    @Override
    public void validate() {
        if(oldpassword==null||oldpassword.equals(""))
        {
        addFieldError("oldpassword","Enter old password");
        }
        
        if(newpassword==null||newpassword.equals(""))
        {
        addFieldError("newpassword","Enter new password");
        }
        
        if(confirmpassword.equals(newpassword)==false)
        {
        addFieldError("confirmPassword","Password's don't match");
        }
        //To change body of generated methods, choose Tools | Templates.
    }

    public void setOldpassword(String oldpassword) {
        this.oldpassword = oldpassword;
    }

    public String getNewpassword() {
        return newpassword;
    }

    public void setNewpassword(String newpassword) {
        this.newpassword = newpassword;
    }

    public String getConfirmpassword() {
        return confirmpassword;
    }

    public void setConfirmpassword(String confirmpassword) {
        this.confirmpassword = confirmpassword;
    }

    public void setServletRequest(HttpServletRequest hsr) {
    
    request=hsr;
    }
    
    
}
