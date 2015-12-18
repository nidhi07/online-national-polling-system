package com.hp.pojo;
// Generated Aug 14, 2014 6:05:37 PM by Hibernate Tools 3.6.0



/**
 * Users generated by hbm2java
 */
public class Users  implements java.io.Serializable {


     private Integer userId;
     private Integer voterIdentityNumber;
     private String password;
     private Boolean isActive;
     private String accountType;

    public Users() {
    }

	
    public Users(String password, String accountType) {
        this.password = password;
        this.accountType = accountType;
    }
    public Users(Integer voterIdentityNumber, String password, Boolean isActive, String accountType) {
       this.voterIdentityNumber = voterIdentityNumber;
       this.password = password;
       this.isActive = isActive;
       this.accountType = accountType;
    }
   
    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public Integer getVoterIdentityNumber() {
        return this.voterIdentityNumber;
    }
    
    public void setVoterIdentityNumber(Integer voterIdentityNumber) {
        this.voterIdentityNumber = voterIdentityNumber;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Boolean getIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }
    public String getAccountType() {
        return this.accountType;
    }
    
    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }




}


