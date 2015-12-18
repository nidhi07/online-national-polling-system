

package com.hp.action;

import com.hp.pojo.City;
import com.hp.pojo.Politicalparty;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import org.hibernate.Session;

public class CpyDataAction extends ActionSupport {

private static List<City> cities;
private List<Politicalparty> parties;
Session s=HibernateUtil.getSessionFactory().openSession();

    @Override
    public String execute() throws Exception {
        cities=s.createCriteria(City.class).list();
        parties=s.createCriteria(Politicalparty.class).list();
        s.close();
        return SUCCESS;
    }

    public List<City> getCities() {
        return cities;
    }

    public void setCities(List<City> cities) {
        CpyDataAction.cities = cities;
    }

    public List<Politicalparty> getParties() {
        return parties;
    }

    public void setParties(List<Politicalparty> parties) {
        this.parties = parties;
    }



}
