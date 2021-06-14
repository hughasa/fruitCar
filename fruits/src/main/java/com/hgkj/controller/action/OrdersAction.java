package com.hgkj.controller.action;

import com.hgkj.model.entity.*;
import com.hgkj.model.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/", produces = "application/json; charset=utf-8")
public class OrdersAction {
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private OrderdetailService orderdetailService;
    @Autowired
    private CarService carService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustpointService custpointService;
    @Autowired
    private GoodsService goodsService;

    /**
     * 添加订单的action
     * @param session
     * @param carids
     * @param car
     * @param custpoint
     * @return
     */
    @RequestMapping("addorder")
    public String addorder(HttpSession session, String[] carids, Car car, Custpoint custpoint) {
        Customer customer = (Customer) session.getAttribute("customer");
        List<Car> carorderList = new ArrayList<>();
        if (car.getGoodsnum() != null) {
            Goods goods = new Goods();
            goods.setGoodsid(car.getGoodsid());
            goods = goodsService.onegoodsservice(goods);
            if (car.getTotalprice() == null) {
                double totleprice = 0;
                if (goods.getTeambuy() == 1 && goods.getBegintime().getTime() < new Date().getTime()) {
                    totleprice = goods.getTeambuyprice() * car.getGoodsnum();
                } else {
                    totleprice = goods.getGoodsprice() * car.getGoodsnum();
                }
                car.setTotalprice(totleprice);
                car.setCustid(customer.getCustid());
                car.setGoods(goods);
                carorderList.add(car);
            } else {
                car.setCustid(customer.getCustid());
                car.setGoods(goods);
                carorderList.add(car);
                session.setAttribute("custpoint", custpoint);
            }
        } else {
            for (Car car1 : customer.getCarList()) {
                for (int i = 0; i < carids.length; i++) {
                    if (String.valueOf(car1.getCarid()).equals(carids[i])) {
                        carorderList.add(car1);
                        break;
                    }
                }
            }
        }
        session.setAttribute("carorderList", carorderList);
        return "Orders";
    }

    /**
     * 确认订单的生成的action
     * @param session
     * @param orders
     * @return
     */
    @RequestMapping("addqrorder")
    public String addqrorder(HttpSession session, Orders orders) {
        Customer customer = (Customer) session.getAttribute("customer");
        orders.setCustid(customer.getCustid());
        orders.setOrderscreatetime(new Timestamp(System.currentTimeMillis()));
        if (orders.getInvoice() == null) {
            orders.setInvoice(0);
        }
        Custpoint custpoint = (Custpoint) session.getAttribute("custpoint");
        List<Car> carList = (List<Car>) session.getAttribute("carorderList");
        if (custpoint != null) {
            orders.setPointget(-custpoint.getPointnum());
            orders.setOrderstatetypeid(1);
            ordersService.addorderservice(orders);
            for (Car car : carList) {
                Orderdetail orderdetail = new Orderdetail();
                orderdetail.setGoodsid(car.getGoodsid());
                orderdetail.setOrderfruitnum(car.getGoodsnum());
                orderdetail.setOrderfruitmoney(car.getTotalprice());
                orderdetail.setOrdersid(orders.getOrdersid());
                orderdetailService.addorderdetailservice(orderdetail);
            }
            Custpoint custpoint1 = customer.getCustpoint();
            custpoint1.setPointnum(custpoint1.getPointnum() - custpoint.getPointnum());
            custpointService.updatecustpointservice(custpoint1);
        } else {
            orders.setPointget((int) (orders.getOrderstotalpage() * 10));
            orders.setOrderstatetypeid(1);
            ordersService.addorderservice(orders);
            double price = 0;
            for (Car car : carList) {
                price += car.getTotalprice();
            }
            price = price - orders.getOrderstotalpage();
            if (price > 0) {
                price = price / carList.size();
            }
            for (Car car : carList) {
                Orderdetail orderdetail = new Orderdetail();
                orderdetail.setGoodsid(car.getGoodsid());
                orderdetail.setOrderfruitnum(car.getGoodsnum());
                if (price > 0) {
                    orderdetail.setOrderfruitmoney(car.getTotalprice() - price);
                } else {
                    orderdetail.setOrderfruitmoney(car.getTotalprice());
                }
                orderdetail.setOrdersid(orders.getOrdersid());
                orderdetailService.addorderdetailservice(orderdetail);
            }
            Goods goods = new Goods();
            for (Car car : carList) {
                goods.setGoodsid(car.getGoodsid());
                goods.setGoodssales(car.getGoodsnum() + car.getGoods().getGoodssales());
                goodsService.updategoodsservice(goods);
                if (car.getCarid() != null) {
                    carService.deletecarservice(car);
                }
            }
            if (customer.getCustpoint() == null) {
                custpoint = new Custpoint();
                custpoint.setCustid(customer.getCustid());
                custpoint.setPointnum(orders.getPointget());
                custpointService.addcustpointservice(custpoint);
            } else {
                custpoint = customer.getCustpoint();
                custpoint.setPointnum(custpoint.getPointnum() + orders.getPointget());
                custpointService.updatecustpointservice(custpoint);
            }
        }
        if(orders.getPaytypeid()==5){
            customer.setYe(customer.getYe()-orders.getOrderstotalpage());
            customerService.updatecustomerservice(customer);
        }
        customer = customerService.Logincustomerservice(customer);
        session.setAttribute("customer", customer);
        return "user";
    }

    /**
     * 查询订单的价格的action
     * @param session
     * @return
     */
    @RequestMapping("oneorderprice")
    @ResponseBody
    public Object oneorderprice(HttpSession session) {
        List<Car> carList = (List<Car>) session.getAttribute("carorderList");
        double totleprice = 0;
        double youhuiprice = 0;
        double shifuprice = 0;
        for (Car car : carList) {
            totleprice += car.getGoods().getGoodsprice() * car.getGoodsnum();
            shifuprice += car.getTotalprice();
        }
        youhuiprice = shifuprice - totleprice;
        List<Double> doubleList = new ArrayList<>();
        doubleList.add(totleprice);
        doubleList.add(youhuiprice);
        doubleList.add(shifuprice);
        return doubleList;
    }

    /**
     * 修改订单的状态的action
     * @param orders
     * @param session
     * @return
     */
    @RequestMapping("updateorders")
    public String updateorders(Orders orders, HttpSession session) {
        ordersService.updateordersservice(orders);
        Customer customer = (Customer) session.getAttribute("customer");
        customer = customerService.Logincustomerservice(customer);
        session.setAttribute("customer", customer);
        return "user";
    }

    /**
     * 删除订单的action
     * @param orders
     * @param session
     * @return
     */
    @RequestMapping("deleteorders")
    public String deleteorders(Orders orders, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        orders=ordersService.oneordersservice(orders);
        if(orders.getPaytypeid()==5){
            customer.setYe(customer.getYe()+orders.getOrderstotalpage());
            Integer pointnum=-orders.getPointget();
            customer.getCustpoint().setPointnum(customer.getCustpoint().getPointnum()+pointnum);
            customerService.updatecustomerservice(customer);
            custpointService.updatecustpointservice(customer.getCustpoint());
        }
        orderdetailService.deleteorderdetaoilservice(orders);
        ordersService.deleteordersservice(orders);
        customer = customerService.Logincustomerservice(customer);
        session.setAttribute("customer", customer);
        return "user";
    }

    public void setOrdersService(OrdersService ordersService) {
        this.ordersService = ordersService;
    }

    public void setOrderdetailService(OrderdetailService orderdetailService) {
        this.orderdetailService = orderdetailService;
    }

    public void setCarService(CarService carService) {
        this.carService = carService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public void setCustpointService(CustpointService custpointService) {
        this.custpointService = custpointService;
    }

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }
}
