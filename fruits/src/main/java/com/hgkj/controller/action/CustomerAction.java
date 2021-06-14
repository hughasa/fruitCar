package com.hgkj.controller.action;

import com.hgkj.model.entity.Customer;
import com.hgkj.model.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/", produces = "application/json; charset=utf-8")
public class CustomerAction {
    @Autowired
    private CustomerService customerService;

    /**
     * 用户登录的action
     *
     * @param customer
     * @param session
     * @return
     */
    @RequestMapping("Login")
    public String Logincustomer(Customer customer, HttpSession session) {
        String Login = "Login";
        customer = customerService.Logincustomerservice(customer);
        if (customer != null) {
            session.removeAttribute("msg");
            Login = "redirect:allcuxiaogoods.form";
            session.setAttribute("customer", customer);
        } else {
            session.setAttribute("msg", "用户名或密码错误！！！");
        }
        return Login;
    }

    /**
     * ‘
     * 注册用户的action
     *
     * @param customer
     * @return
     */
    @RequestMapping("regis")
    public String regiscustomer(Customer customer) {
        customer.setYe(0.0);
        customerService.addcustomerservice(customer);
        return "Login";
    }

    /**
     * 判断用户名和电话重复的问题的action
     *
     * @param customer
     * @return
     */
    @RequestMapping("cfcustnameortel")
    @ResponseBody
    public String cfcustname(Customer customer) {
        String cf = "ok";
        customer = customerService.Logincustomerservice(customer);
        if (customer != null) {
            cf = "no";
        }
        return cf;
    }

    /**
     * 判断验证码的正确性的action
     *
     * @param yzm
     * @param session
     * @return
     */
    @RequestMapping("yzm")
    @ResponseBody
    public String yzm(String yzm, HttpSession session) {
        String data = "ok";
        String verifyCodeValue = (String) session.getAttribute("verifyCodeValue");
        if (!verifyCodeValue.equalsIgnoreCase(yzm)) {
            data = "no";
        }
        return data;
    }

    /**
     * 修改用户密码的action
     *
     * @param customer
     * @param session
     * @return
     */
    @RequestMapping("updatepwd")
    public String updatepwd(Customer customer, HttpSession session) {
        Customer customer1 = (Customer) session.getAttribute("customer");
        customer.setCustid(customer1.getCustid());
        customerService.updatecustomerservice(customer);
        session.invalidate();
        return "Login";
    }

    /**
     * 退出用户登录的action
     *
     * @param session
     * @return
     */
    @RequestMapping("tuichucustomer")
    public String tuichucustomer(HttpSession session) {
        session.invalidate();
        return "Login";
    }

    /**
     * 验证有没有登录
     * @param session
     * @return
     */
    @RequestMapping("loginzunzai")
    @ResponseBody
    public String loginzunzai(HttpSession session) {
        String loginzunzai = "ok";
        Customer customer= (Customer) session.getAttribute("customer");
        if(customer==null){
            loginzunzai="no";
        }
        return loginzunzai;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }
}
