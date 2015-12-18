/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.hp.action;

import com.hp.pojo.Users;
import com.hp.pojo.Voter;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;

/**
 *
 * @author NIDHI
 */
public class LoginValidatorAction extends ActionSupport implements ServletRequestAware{
 
    HttpServletRequest request ;
    private int userId ;
    

    @Override
    public void validate() {
        
        if(userId == 0)
        {
            addFieldError("userId", "Enter Valid UserId");
        }
        if(password == null || password.equals(""))
        {
            addFieldError("password", "Enter Valid Password");
        }
        
        
        //To change body of generated methods, choose Tools | Templates.
    }
    private String password ;
    private String accountType ;

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }
    
    Session s=HibernateUtil.getSessionFactory().openSession();

   

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
            
    
    public void setServletRequest(HttpServletRequest hsr) {
       
        request = hsr ;        
    }

    @Override
    public String execute() throws Exception {
        HttpSession session=request.getSession(true);
     Users user = (Users)s.get(Users.class, userId);
    
     
     
      
     
    RequestDispatcher rd=null;
     
     if(user != null && user.getIsActive()== true)
     {
         if(user.getPassword().equals(password)) //&& user.getAccountType().equals(accountType)){
         {
             Voter v=(Voter)s.get(Voter.class,user.getVoterIdentityNumber());
             session.setAttribute("id",userId);
             session.setAttribute("name",v.getFname());
             s.close();
             if(user.getAccountType().equals("V"))
             return SUCCESS ;
             else
                 if(user.getAccountType().equals("C"))
                 return "cprofile";
             else
                     return "aprofile";
         }
         
          else
         {
             request.setAttribute("message", "Invalid Password");
             return ERROR ;
         }
         
         
     }
     else
     {
         request.setAttribute("message", "Account Is Invalid");
         return ERROR ;
     }
    
     
       //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    
    
    
}
