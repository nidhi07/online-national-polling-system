

package com.hp.action;

import com.hp.pojo.Politicalparty;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.RandomAccessFile;
import org.hibernate.Session;

public class AddPartiesAction extends ActionSupport{
    
    private int pcode;
    private String pname;
    private File file;
    private String fileFileName;
    private String fileContentType;



    @Override
    public String execute() throws Exception {
        Session s=HibernateUtil.getSessionFactory().openSession();
        
        RandomAccessFile f = new RandomAccessFile(file, "r");
        byte[] b = new byte[(int) f.length()];
        f.read(b);
        
        Politicalparty p=new Politicalparty(pcode,pname,b);
        s.save(p);
        s.beginTransaction().commit();
        s.close();
        return SUCCESS;
         //To change body of generated methods, choose Tools | Templates.
    }
    
    

    public int getPcode() {
        return pcode;
    }

    public void setPcode(int pcode) {
        this.pcode = pcode;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
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
    
        @Override
    public void validate() {
      
        if(pcode<=0)
            addFieldError("pcode","Enter valid pcode");

        if(pname==null||pname.equals(""))
            addFieldError("pname","Enter party name");
        
        if(file == null)
            addFieldError("file","Upload an image");
//To change body of generated methods, choose Tools | Templates.
    }
    
}
