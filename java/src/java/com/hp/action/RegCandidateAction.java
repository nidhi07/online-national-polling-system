

package com.hp.action;

import com.hp.pojo.Candidate;
import com.hp.pojo.Users;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;


public class RegCandidateAction extends ActionSupport implements ServletRequestAware {
    
    private int cityCode;
    private int pcode;
    private int voterid;
    private String cname;
    private String currentPosition;
    private String pass;
    private String confpass;
    HttpServletRequest request;

    @Override
    public void validate() {
        if(cityCode==0)
            addFieldError("cityCode","Enter city code");
        
       if(pcode<=0)
           addFieldError("pcode","Enter party");
       if(voterid<=0)
           addFieldError("voterid","Enter Voterid");
       if(cname==null||cname.equals(""))
           addFieldError("cname","Enter cname");
       if(currentPosition==null||currentPosition.equals(""))
           addFieldError("currentPosition","Enter curr. position");
       if(pass==null||pass.equals(""))
           addFieldError("pass","Enter password");
       if(confpass==null||confpass.equals(""))
           addFieldError("confpass","Passwords do not match");
    
    }
    
    
  Users u=new Users();
    @Override
    public String execute() throws Exception {
        Session s=HibernateUtil.getSessionFactory().openSession();
        
        Candidate cd=new Candidate();
       cd.setCityCode(cityCode);
       cd.setVoterIdentityNumber(voterid);
       cd.setCname(cname);
       cd.setPcode(pcode);
       cd.setVotes(0);
       cd.setCandidateStatus(Boolean.FALSE);
       cd.setCurrentPosition(currentPosition);
       
     
       u.setAccountType("C");
       u.setIsActive(Boolean.FALSE);
       u.setPassword(pass);
       u.setVoterIdentityNumber(voterid);
       
       
       s.save(cd);
       s.save(u);
       request.setAttribute("id",u.getUserId());
       s.beginTransaction().commit();
       s.close();
       return SUCCESS;
    }
    
    

    
    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCurrentPosition() {
        return currentPosition;
    }

    public void setCurrentPosition(String currentPosition) {
        this.currentPosition = currentPosition;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getCityCode() {
        return cityCode;
    }

    public void setCityCode(int cityCode) {
        this.cityCode = cityCode;
    }

    public String getConfpass() {
        return confpass;
    }

    public void setConfpass(String confpass) {
        this.confpass = confpass;
    }


    public int getPcode() {
        return pcode;
    }

    public void setPcode(int pcode) {
        this.pcode = pcode;
    }

    public int getVoterid() {
        return voterid;
    }

    public void setVoterid(int voterid) {
        this.voterid = voterid;
    }

    public void setServletRequest(HttpServletRequest hsr) {
        request=hsr;
    }
    
    
}
