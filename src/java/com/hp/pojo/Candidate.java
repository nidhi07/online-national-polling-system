package com.hp.pojo;
// Generated Aug 14, 2014 6:05:37 PM by Hibernate Tools 3.6.0



/**
 * Candidate generated by hbm2java
 */
public class Candidate  implements java.io.Serializable {


     private Integer cid;
     private int voterIdentityNumber;
     private String cname;
     private int pcode;
     private int cityCode;
     private String currentPosition;
     private int votes;
     private Boolean candidateStatus;

    public Candidate() {
    }

	
    public Candidate(int voterIdentityNumber, String cname, int pcode, int cityCode, String currentPosition, int votes) {
        this.voterIdentityNumber = voterIdentityNumber;
        this.cname = cname;
        this.pcode = pcode;
        this.cityCode = cityCode;
        this.currentPosition = currentPosition;
        this.votes = votes;
    }
    public Candidate(int voterIdentityNumber, String cname, int pcode, int cityCode, String currentPosition, int votes, Boolean candidateStatus) {
       this.voterIdentityNumber = voterIdentityNumber;
       this.cname = cname;
       this.pcode = pcode;
       this.cityCode = cityCode;
       this.currentPosition = currentPosition;
       this.votes = votes;
       this.candidateStatus = candidateStatus;
    }
   
    public Integer getCid() {
        return this.cid;
    }
    
    public void setCid(Integer cid) {
        this.cid = cid;
    }
    public int getVoterIdentityNumber() {
        return this.voterIdentityNumber;
    }
    
    public void setVoterIdentityNumber(int voterIdentityNumber) {
        this.voterIdentityNumber = voterIdentityNumber;
    }
    public String getCname() {
        return this.cname;
    }
    
    public void setCname(String cname) {
        this.cname = cname;
    }
    public int getPcode() {
        return this.pcode;
    }
    
    public void setPcode(int pcode) {
        this.pcode = pcode;
    }
    public int getCityCode() {
        return this.cityCode;
    }
    
    public void setCityCode(int cityCode) {
        this.cityCode = cityCode;
    }
    public String getCurrentPosition() {
        return this.currentPosition;
    }
    
    public void setCurrentPosition(String currentPosition) {
        this.currentPosition = currentPosition;
    }
    public int getVotes() {
        return this.votes;
    }
    
    public void setVotes(int votes) {
        this.votes = votes;
    }
    public Boolean getCandidateStatus() {
        return this.candidateStatus;
    }
    
    public void setCandidateStatus(Boolean candidateStatus) {
        this.candidateStatus = candidateStatus;
    }




}

