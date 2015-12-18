
package com.hp.action;

import com.hp.pojo.Politicalparty;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;

public class DeletePartiesAction extends ActionSupport implements ServletRequestAware{
  
    private String[] ch;
        private int pcode;
    private String pname;
    private File file;
    private String fileFileName;
    private String fileContentType;
    HttpServletRequest request;

    @Override
    public void validate() {
           ch=request.getParameterValues("ch");
       if(ch==null)
           addFieldError("ch","Check the party to be deleted");
    }

    @Override
    public String execute() throws Exception {
        Session s=HibernateUtil.getSessionFactory().openSession();
        ch=request.getParameterValues("ch");
        for(String c:ch)
        {
            int pid=new Integer(c);
        Politicalparty p=(Politicalparty)s.get(Politicalparty.class,pid);
        s.delete(p);
        s.beginTransaction().commit();
        }
        s.close();
        return SUCCESS; //To change body of generated methods, choose Tools | Templates.
    }
    
       public String[] getCh() {
        return ch;
    }

    public void setCh(String[] ch) {
        this.ch = ch;
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

    public void setServletRequest(HttpServletRequest hsr) {
    request=hsr;   
    }
    
    
    
}
