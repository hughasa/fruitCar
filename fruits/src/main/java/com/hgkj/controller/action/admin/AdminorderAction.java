package com.hgkj.controller.action.admin;

import com.hgkj.model.entity.Admin;
import com.hgkj.model.entity.Customer;
import com.hgkj.model.entity.Orders;
import com.hgkj.model.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/", produces = "application/json; charset=utf-8")
public class AdminorderAction {
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private OrderdetailService orderdetailService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustpointService custpointService;

    /**
     * 查询所有订单的action并进行分页
     * @param session
     * @param pageorderIndex
     * @return
     */
    @RequestMapping("alladminorders")
    public String alladminorders(HttpSession session,Integer pageorderIndex) {
        if(pageorderIndex==null){
            pageorderIndex=session.getAttribute("pageorderIndex")==null?1:Integer.parseInt(session.getAttribute("pageorderIndex").toString());
        }
        int totleorderpage=(ordersService.allordersservice(0,0).size()-1)/10+1;
        if(pageorderIndex<=0){
            pageorderIndex=1;
        }else if(pageorderIndex>totleorderpage){
            pageorderIndex=totleorderpage;
        }
        List<Orders> ordersList=ordersService.allordersservice((pageorderIndex-1)*10,10);
        session.setAttribute("totleorderpage",totleorderpage);
        session.setAttribute("pageorderIndex",pageorderIndex);
        session.setAttribute("ordersList",ordersList);
        session.setAttribute("orderurl","alladminorders.form?pageorderIndex=");
        return "adminjsp/Menu/index";
    }

    /**
     * 修改订单状态的action
     * @param orders
     * @return
     */
    @RequestMapping("updateadminorders")
    public String updateadminorders(Orders orders) {
        ordersService.updateordersservice(orders);
        return "redirect:alladminorders.form";
    }

    /**
     * 查询订单的详情的action
     * @param session
     * @param ordersadmin
     * @return
     */
    @RequestMapping("oneadminorders")
    public String oneadminorders(HttpSession session,Orders ordersadmin) {
        ordersadmin=ordersService.oneordersservice(ordersadmin);
        session.setAttribute("ordersadmin",ordersadmin);
        return "adminjsp/Menu/edit";
    }

    /**
     * 删除订单的action
     * @param session
     * @param orders
     * @return
     */
    @RequestMapping("deleteadminorders")
    public String deleteadminorders(HttpSession session,Orders orders) {
        orders=ordersService.oneordersservice(orders);
        Customer customer=new Customer();
        customer.setCustid(orders.getCustid());
        customer=customerService.Logincustomerservice(customer);
        if(orders.getPaytypeid()==5){
            customer.setYe(customer.getYe()+orders.getOrderstotalpage());
            Integer pointnum=-orders.getPointget();
            customer.getCustpoint().setPointnum(customer.getCustpoint().getPointnum()+pointnum);
            customerService.updatecustomerservice(customer);
            custpointService.updatecustpointservice(customer.getCustpoint());
        }
        orderdetailService.deleteorderdetaoilservice(orders);
        ordersService.deleteordersservice(orders);
        return "redirect:alladminorders.form";
    }

    public void setOrdersService(OrdersService ordersService) {
        this.ordersService = ordersService;
    }

    public void setOrderdetailService(OrderdetailService orderdetailService) {
        this.orderdetailService = orderdetailService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public OrdersService getOrdersService() {
        return ordersService;
    }
}
