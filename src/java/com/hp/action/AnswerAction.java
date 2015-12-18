

package com.hp.action;

import com.hp.pojo.Questionanswer;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;

public class AnswerAction extends ActionSupport implements ServletRequestAware {
    
    private String answer;
    private String b[];
    HttpServletRequest request;

    @Override
    public void validate() {
        b=request.getParameterValues("ch");
       if(answer==null||answer.equals(""))
       {
       addFieldError("answer","Answer Here");
       }
       
       if(b==null)
           addFieldError("ch","Select a question");
    }

    @Override
    public String execute() throws Exception {
        Session s=HibernateUtil.getSessionFactory().openSession();
         b=request.getParameterValues("ch");
         
         for(String a:b){
         int quesid=new Integer(a);
         Questionanswer qa=(Questionanswer)s.get(Questionanswer.class,quesid);
         qa.setAnswer(answer);
         s.save(qa);
         s.beginTransaction().commit();
         }
        s.close();
        return SUCCESS;
    }
    
    
    
    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String[] getB() {
        return b;
    }

    public void setB(String[] b) {
        this.b = b;
    }

    public void setServletRequest(HttpServletRequest hsr) {
    request=hsr;    
    }
    
    
}
