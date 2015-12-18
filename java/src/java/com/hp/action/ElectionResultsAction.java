
package com.hp.action;

import com.hp.pojo.Electionresult;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class ElectionResultsAction extends ActionSupport implements ServletRequestAware 
{
   
    private int cityCode;
    private int year;
    private int pcode;
    Session s=HibernateUtil.getSessionFactory().openSession();
    HttpServletRequest request;
    List<Electionresult> er;

    public int getCityCode() {
        return cityCode;
    }

    public void setCityCode(int cityCode) {
        this.cityCode = cityCode;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getPcode() {
        return pcode;
    }

    public void setPcode(int pcode) {
        this.pcode = pcode;
    }

    @Override
    public String execute() throws Exception {
        
        
        request.setAttribute("cityCode",cityCode);
        request.setAttribute("year",year);
        request.setAttribute("pcode",pcode);
        
        System.out.println(""+cityCode+year+pcode);
        er=s.createCriteria(Electionresult.class).add(Restrictions.eq("electionYear",year)).add(Restrictions.eq("pcode", pcode)).add(Restrictions.eq("cityCode",cityCode)).list();
        
        return SUCCESS;
        //To change body of generated methods, choose Tools | Templates.
    }

    public void setServletRequest(HttpServletRequest hsr) {
    request=hsr;    
    }
    
    

    
}
