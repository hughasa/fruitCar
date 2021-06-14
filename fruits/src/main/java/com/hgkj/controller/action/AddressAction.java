package com.hgkj.controller.action;

import com.hgkj.model.entity.Address;
import com.hgkj.model.entity.Customer;
import com.hgkj.model.service.AddressService;
import com.hgkj.model.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/", produces = "application/json; charset=utf-8")
public class AddressAction {
    @Autowired
    private AddressService addressService;
    @Autowired
    private CustomerService customerService;

    /**
     * 添加地址的action
     * @param session
     * @param address
     * @param ordertype
     * @return
     */
    @RequestMapping("addaddress")
    public String addaddress(HttpSession session, Address address, String ordertype) {
        if ("addorder".equals(ordertype)) {
            session.setAttribute("ordertype", ordertype);
            return "user_address";
        } else {
            Customer customer = (Customer) session.getAttribute("customer");
            address.setCustid(customer.getCustid());
            addressService.addaddressservice(address);
        }
        return "redirect:alladdress.form";
    }

    /**
     * 查询地址的action
     * @param session
     * @return
     */
    @RequestMapping("alladdress")
    public String alladdress(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        customer = customerService.Logincustomerservice(customer);
        session.setAttribute("customer", customer);
        String ordertype = (String) session.getAttribute("ordertype");
        if ("addorder".equals(ordertype)) {
            session.removeAttribute("ordertype");
            return "Orders";
        } else if ("order".equals(ordertype)) {
            session.removeAttribute("ordertype");
            return "Orders";
        } else {
            return "user_address";
        }
    }

    /**
     * 删除订单的action
     * @param session
     * @param address
     * @param ordertype
     * @return
     */
    @RequestMapping("deleteaddress")
    public String deleteaddress(HttpSession session, Address address, String ordertype) {
        addressService.deleteaddressservice(address);
        session.setAttribute("ordertype", ordertype);
        return "redirect:alladdress.form";
    }

    /**
     * 修改地址的信息的action
     * @param session
     * @param address
     * @return
     */
    @RequestMapping("updateaddress")
    public String updateaddress(HttpSession session, Address address) {
        addressService.updateaddressservice(address);
        session.removeAttribute("address");
        return "redirect:alladdress.form";
    }

    /**
     * 查询单个的地址信息的action
     * @param session
     * @param address
     * @param ordertype
     * @return
     */
    @RequestMapping("oneaddress")
    public String oneaddress(HttpSession session, Address address, String ordertype) {
        address = addressService.oneaddressservice(address);
        session.setAttribute("address", address);
        session.setAttribute("ordertype", ordertype);
        return "user_address";
    }

    /**
     * 查询当个地址的ajax返回地址对象信息的action
     * @param session
     * @param address
     * @return
     */
    @RequestMapping("oneshowaddress")
    @ResponseBody
    public Object oneshowaddress(HttpSession session, Address address) {
        if (address.getAddressid() == null) {
            Customer customer = (Customer) session.getAttribute("customer");
            for (Address address1 : customer.getAddressList()) {
                address = address1;
                break;
            }
        } else {
            address = addressService.oneaddressservice(address);
        }
        return address;
    }

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }
}
