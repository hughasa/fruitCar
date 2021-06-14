package com.hgkj.model.entity;

public class Customerinfo {
    private Integer custinfoid;

    private String custpic;

    private String custtname;

    private String custsex;

    private String custemail;

    private Integer custid;

    public Integer getCustinfoid() {
        return custinfoid;
    }

    public void setCustinfoid(Integer custinfoid) {
        this.custinfoid = custinfoid;
    }

    public String getCustpic() {
        return custpic;
    }

    public void setCustpic(String custpic) {
        this.custpic = custpic == null ? null : custpic.trim();
    }

    public String getCusttname() {
        return custtname;
    }

    public void setCusttname(String custtname) {
        this.custtname = custtname == null ? null : custtname.trim();
    }

    public String getCustsex() {
        return custsex;
    }

    public void setCustsex(String custsex) {
        this.custsex = custsex == null ? null : custsex.trim();
    }

    public String getCustemail() {
        return custemail;
    }

    public void setCustemail(String custemail) {
        this.custemail = custemail == null ? null : custemail.trim();
    }

    public Integer getCustid() {
        return custid;
    }

    public void setCustid(Integer custid) {
        this.custid = custid;
    }
}