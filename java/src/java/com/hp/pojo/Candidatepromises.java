package com.hp.pojo;
// Generated Aug 14, 2014 6:05:37 PM by Hibernate Tools 3.6.0



/**
 * Candidatepromises generated by hbm2java
 */
public class Candidatepromises  implements java.io.Serializable {


     private Integer promId;
     private Integer cid;
     private String promises;

    public Candidatepromises() {
    }

	
    public Candidatepromises(String promises) {
        this.promises = promises;
    }
    public Candidatepromises(Integer cid, String promises) {
       this.cid = cid;
       this.promises = promises;
    }
   
    public Integer getPromId() {
        return this.promId;
    }
    
    public void setPromId(Integer promId) {
        this.promId = promId;
    }
    public Integer getCid() {
        return this.cid;
    }
    
    public void setCid(Integer cid) {
        this.cid = cid;
    }
    public String getPromises() {
        return this.promises;
    }
    
    public void setPromises(String promises) {
        this.promises = promises;
    }




}

