package com.hgkj.model.entity;

import java.util.List;

public class Customer {
    private Integer custid;

    private String custname;

    private String custpwd;

    private String custtel;

    private Double ye;

    private Customerinfo customerinfo;

    private Custpoint custpoint;

    private List<Orders> ordersList;

    private List<Car> carList;

    private List<Address> addressList;

    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    public Custpoint getCustpoint() {
        return custpoint;
    }

    public void setCustpoint(Custpoint custpoint) {
        this.custpoint = custpoint;
    }

    public Customerinfo getCustomerinfo() {
        return customerinfo;
    }

    public void setCustomerinfo(Customerinfo customerinfo) {
        this.customerinfo = customerinfo;
    }

    public Integer getCustid() {
        return custid;
    }

    public void setCustid(Integer custid) {
        this.custid = custid;
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname == null ? null : custname.trim();
    }

    public String getCustpwd() {
        return custpwd;
    }

    public void setCustpwd(String custpwd) {
        this.custpwd = custpwd == null ? null : custpwd.trim();
    }

    public String getCusttel() {
        return custtel;
    }

    public void setCusttel(String custtel) {
        this.custtel = custtel == null ? null : custtel.trim();
    }

    public List<Car> getCarList() {
        return carList;
    }

    public void setCarList(List<Car> carList) {
        this.carList = carList;
    }

    public List<Address> getAddressList() {
        return addressList;
    }

    public void setAddressList(List<Address> addressList) {
        this.addressList = addressList;
    }

    public Double getYe() {
        return ye;
    }

    public void setYe(Double ye) {
        this.ye = ye;
    }
}