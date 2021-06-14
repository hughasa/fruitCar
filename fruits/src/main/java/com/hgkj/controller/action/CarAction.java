package com.hgkj.controller.action;

import com.hgkj.model.entity.Car;
import com.hgkj.model.entity.Customer;
import com.hgkj.model.entity.Goods;
import com.hgkj.model.service.CarService;
import com.hgkj.model.service.CustomerService;
import com.hgkj.model.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping(value = "/", produces = "application/json; charset=utf-8")
public class CarAction {
    @Autowired
    private CarService carService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private CustomerService customerService;

    /**
     * 添加购物车信息的action
     * @param car
     * @param session
     * @return
     */
    @RequestMapping("addcar")
    @ResponseBody
    public String addcar(Car car, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        car.setCustid(customer.getCustid());
        Car car1 = carService.onecarservice(car);
        Goods goods = new Goods();
        goods.setGoodsid(car.getGoodsid());
        goods = goodsService.onegoodsservice(goods);
        if (car1 == null) {
            double totleprice = 0;
            if (goods.getTeambuy() == 1 && goods.getBegintime().getTime()<new Date().getTime()) {
                totleprice = goods.getTeambuyprice();
            } else {
                totleprice = goods.getGoodsprice();
            }
            car.setTotalprice(totleprice * car.getGoodsnum());
            carService.addcarservice(car);
        } else {
            int goodsnum = car1.getGoodsnum();
            car1.setGoodsnum(goodsnum + car.getGoodsnum());
            double totleprice = 0;
            if (goods.getTeambuy() == 1 && goods.getBegintime().getTime()<new Date().getTime()) {
                totleprice = goods.getTeambuyprice();
            } else {
                totleprice = goods.getGoodsprice();
            }
            car1.setTotalprice(totleprice * (goodsnum + car.getGoodsnum()));
            carService.updatecarservice(car1);
        }
        customer = customerService.Logincustomerservice(customer);
        session.setAttribute("customer", customer);
        String carshuliang = String.valueOf(customer.getCarList().size());
        return carshuliang;
    }

    /**
     * 查询用户购物车的信息的action
     * @param session
     * @return
     */
    @RequestMapping("allcar")
    public String allcar(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        customer = customerService.Logincustomerservice(customer);
        session.setAttribute("customer", customer);
        return "shopping_cart";
    }

    /**
     * 修改购物车信息的商品的数量的action
     * @param car
     * @param session
     * @return
     */
    @RequestMapping("updategoodsnum")
    @ResponseBody
    public Object updategoodsnum(Car car, HttpSession session) {
        Car car1 = carService.onecarservice(car);
        double price = car1.getTotalprice() / car1.getGoodsnum();
        car.setTotalprice(price * car.getGoodsnum());
        carService.updatecarservice(car);
        car = carService.onecarservice(car);
        allcar(session);
        return car;
    }

    /**
     * 查询单个购物车的信息的action
     * @param car
     * @return
     */
    @RequestMapping("onecar")
    @ResponseBody
    public Object onecar(Car car) {
        car = carService.onecarservice(car);
        return car;
    }

    /**
     * 删除购物车的信息的action
     * @param car
     * @param session
     * @return
     */
    @RequestMapping("deletecar")
    @ResponseBody
    public String deletecar(Car car, HttpSession session) {
        carService.deletecarservice(car);
        allcar(session);
        Customer customer = (Customer) session.getAttribute("customer");
        return String.valueOf(customer.getCarList().size());
    }

    /**
     * 返回歌词的信息的总计的action
     * @param session
     * @param carids
     * @return
     */
    @RequestMapping("cartotleprice")
    @ResponseBody
    public String cartotleprice(HttpSession session,String[] carids) {
        Customer customer = (Customer) session.getAttribute("customer");
        double totleprice = 0;
        for (Car car : customer.getCarList()) {
            for (int i = 0; i < carids.length; i++) {
                if (String.valueOf(car.getCarid()).equals(carids[i])) {
                    totleprice += car.getTotalprice();
                    break;
                }
            }
        }
        return String.valueOf(totleprice);
    }

    public void setCarService(CarService carService) {
        this.carService = carService;
    }

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }
}
