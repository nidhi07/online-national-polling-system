package com.hp.action;

import com.hp.pojo.City;
import com.hp.pojo.Users;
import com.hp.pojo.Voter;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.RandomAccessFile;
//import java.util.Date;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;

public class RegVoterAction extends ActionSupport implements ServletRequestAware {

    private int userid;
    private String fname;
    private String mname;
    private String lname;
    private String mother;
    private String father;
    private String gender;
    private String dateOfBirth;
    private String email;
    private int citycode;
    private int voterid;
    private String pass;
    private String confpass;
    private File file;
    private String fileFileName;
    private String fileContentType;
    HttpServletRequest request;

    Session s = HibernateUtil.getSessionFactory().openSession();
Users u = new Users();
   

    @Override
    public String execute() throws Exception {

        /*   String path=request.getSession().getServletContext().getRealPath("/").concat("imgupload");
         File f=new File(path,fileFileName);
         FileUtils.copyFile(this.file,f);*/
         City c = (City)s.get(City.class,citycode);
        System.out.println(citycode);
            
        RandomAccessFile f = new RandomAccessFile(file, "r");
        byte[] b = new byte[(int) f.length()];
        f.read(b);

        Voter v = new Voter();
        Date date = Date.valueOf(dateOfBirth);

        v.setFname(fname);
        v.setMname(mname);
        v.setLname(lname);
        v.setDob(date);
        v.setCityCode(citycode);
        v.setFathersName(father);
        v.setMothersName(mother);
        v.setVoterIdentityNumber(voterid);
        v.setGender(gender);
        v.setVoterIdentityCard(b);
        v.setVoterStatus(Boolean.FALSE);
        v.setEmail(email);
      
      
        
        u.setAccountType("V");
        u.setPassword(pass);
        u.setVoterIdentityNumber(voterid);
        u.setIsActive(Boolean.FALSE);

       
        s.save(v);
        //  s.beginTransaction().commit();
        s.save(u);
       userid=u.getUserId();
        s.beginTransaction().commit();
        request.setAttribute("id",userid);
        s.close();
        return SUCCESS;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCitycode() {
        return citycode;
    }

    public void setCitycode(int citycode) {
        this.citycode = citycode;
    }

    @Override
    public void validate() {
         City c = (City)s.get(City.class,citycode);
        
        System.out.println(c.getCityName());
        if (fname == null || fname.equals("")) {
            addFieldError("fname", "Enter fname");
        }

        if (mother == null || mother.equals("")) {
            addFieldError("mother", "Enter mother's name");
        }

        if (father == null || father.equals("")) {
            addFieldError("father", "Enter father's name");
        }
        
        if(email==null)
        {
        addFieldError("email", "Enter email");
        }
        if (c == null) {
            addFieldError("citycode", "Enter city's code");
        }

        if (voterid == 0) {
            addFieldError("voterid", "Enter voterId");
        }

        if (dateOfBirth == null || dateOfBirth.equals("")) {
            addFieldError("dateOfBirth", "Enter DateOfBirth");
        }

        if (pass == null || pass.equals("")) {
            addFieldError("pass", "Enter password");
        }

        if (file == null) {
            addFieldError("file", "Upload your voter id card");
        }

        if (confpass.equals(pass) == false) {
            addFieldError("confpass", "Passwords do not match");
        }
        //if()
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getMother() {
        return mother;
    }

    public void setMother(String mother) {
        this.mother = mother;
    }

    public String getFather() {
        return father;
    }

    public void setFather(String father) {
        this.father = father;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

   

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getConfpass() {
        return confpass;
    }

    public void setConfpass(String confpass) {
        this.confpass = confpass;
    }

    public File getFile() {
        return file;
    }

    public int getVoterid() {
        return voterid;
    }

    public void setVoterid(int voterid) {
        this.voterid = voterid;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

}
