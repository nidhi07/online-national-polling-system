
package com.hp.action;

import static com.opensymphony.xwork2.Action.SUCCESS;

import com.opensymphony.xwork2.ActionSupport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

public class LogoutAction extends ActionSupport implements ServletRequestAware{
 
    HttpSession session;
    HttpServletRequest request;
    public String execute()
    {
     session=request.getSession(false);
      /*if(session==null)
      {
          System.out.println("Session is null");
      }
      else
            System.out.println("Session is not null");
         if(session.getAttribute("id")==null)
      {
          System.out.println("Sessionid is null");
      }
      else
            System.out.println("Sessionid is not null");
     */
     
     session.removeAttribute("id");
     session.invalidate(); 
    
     
     /*   if(session==null)
      {
          System.out.println("Session is null");
      }
      else
            System.out.println("Session is not null");
     
       if(session.getAttribute("id")==null)
      {
          System.out.println("Sessionid is null");
      }
      else
            System.out.println("Sessionid is not null");
     
      */  
return SUCCESS;
    }

    public void setServletRequest(HttpServletRequest hsr) {
    request=hsr;    
    }
    
}
