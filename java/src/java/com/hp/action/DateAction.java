

package com.hp.action;

import com.hp.pojo.Electiondetails;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;
import java.text.SimpleDateFormat;
import org.hibernate.Session;

public class DateAction extends ActionSupport{
    
int year;
String ElectionDate;

    @Override
    public void validate() {
        if(year==0)
            addFieldError("year","Enter year");

        if(ElectionDate==null)
            addFieldError("ElectionDate","Enter the election date");
//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String execute() throws Exception {
        
        Session s=HibernateUtil.getSessionFactory().openSession();
        Electiondetails e=(Electiondetails) s.get(Electiondetails.class,year);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date Edate=(Date) sdf.parse(ElectionDate);
        e.setElectiondate(Edate);
        s.saveOrUpdate(e);
        s.beginTransaction().commit();
        return SUCCESS;
    }



    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getElectionDate() {
        return ElectionDate;
    }

    public void setElectionDate(String ElectionDate) {
        this.ElectionDate = ElectionDate;
    }


}
