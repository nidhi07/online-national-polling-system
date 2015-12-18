

package com.hp.action;

import com.hp.pojo.City;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import org.hibernate.Session;

public class RegVoter0Action extends ActionSupport {
    
   private List<City> cities;
   Session s=HibernateUtil.getSessionFactory().openSession();

   @Override
    public String execute() throws Exception {
        cities=s.createCriteria(City.class).list();
        //parties=s.createCriteria(Politicalparty.class).list();
        s.close();
        return SUCCESS;
    }

    public List<City> getCities() {
        return cities;
    }

    public void setCities(List<City> cities) {
        this.cities = cities;
    }
}
