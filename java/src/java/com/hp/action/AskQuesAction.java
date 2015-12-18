
package com.hp.action;

import com.hp.pojo.Candidate;
import com.hp.pojo.Questionanswer;
import com.hp.pojo.Users;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;

public class AskQuesAction extends ActionSupport implements ServletRequestAware {
   
    
  
    private String Question;
       HttpServletRequest request;
    private String[] b;

   
 
    Session s=HibernateUtil.getSessionFactory().openSession();

    @Override
    public void validate() {
        b=request.getParameterValues("ch");
        if(b==null)
            addFieldError("ch","check the candidate to be questioned");
        
        if(Question==null||Question.equals(""))
            addFieldError("Question","Enter Question");
        //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String execute() throws Exception {
HttpSession session=request.getSession(false);
b=request.getParameterValues("ch");
for(String a:b){
    Integer cid=new Integer(a);
Questionanswer qa=new Questionanswer();
        Candidate c=(Candidate)s.get(Candidate.class,cid);
        int id= (Integer)session.getAttribute("id");
        Users u=(Users)s.get(Users.class,id);
int vid=u.getVoterIdentityNumber();
       
        
        
        qa.setQuestion(Question);
        qa.setCid(cid);
        qa.setStatus("U");
        qa.setVoterIdentityNumber(vid);
        qa.setAnswer(" ");
        
        //c.getQuestionanswers().add(qa);
       // v.getQuestionanswers().add(qa);
        
        
        s.save(qa);
        //s.save(v);
        //s.save(c);
        s.beginTransaction().commit();
}
        s.close();
      return SUCCESS;
      
    }
    
    

 

    public String getQuestion() {
        return Question;
    }

    public void setQuestion(String Question) {
        this.Question = Question;
    }

   
    public void setServletRequest(HttpServletRequest hsr) {
        request=hsr;
    }
    
    
}


