package com.hgkj.model.entity;

public class Address {
    private Integer addressid;

    private String addressrecname;

    private String addressareas;

    private String addressareashi;

    private String addressareaqu;

    private String addresscity;

    private Integer addressemail;

    private String addresstel;

    private String addressphone;

    private Integer custid;

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public String getAddressrecname() {
        return addressrecname;
    }

    public void setAddressrecname(String addressrecname) {
        this.addressrecname = addressrecname == null ? null : addressrecname.trim();
    }

    public String getAddressareas() {
        return addressareas;
    }

    public void setAddressareas(String addressareas) {
        this.addressareas = addressareas;
    }

    public String getAddressareashi() {
        return addressareashi;
    }

    public void setAddressareashi(String addressareashi) {
        this.addressareashi = addressareashi;
    }

    public String getAddressareaqu() {
        return addressareaqu;
    }

    public void setAddressareaqu(String addressareaqu) {
        this.addressareaqu = addressareaqu;
    }

    public String getAddresscity() {
        return addresscity;
    }

    public void setAddresscity(String addresscity) {
        this.addresscity = addresscity == null ? null : addresscity.trim();
    }

    public Integer getAddressemail() {
        return addressemail;
    }

    public void setAddressemail(Integer addressemail) {
        this.addressemail = addressemail;
    }

    public String getAddresstel() {
        return addresstel;
    }

    public void setAddresstel(String addresstel) {
        this.addresstel = addresstel == null ? null : addresstel.trim();
    }

    public String getAddressphone() {
        return addressphone;
    }

    public void setAddressphone(String addressphone) {
        this.addressphone = addressphone == null ? null : addressphone.trim();
    }

    public Integer getCustid() {
        return custid;
    }

    public void setCustid(Integer custid) {
        this.custid = custid;
    }
}