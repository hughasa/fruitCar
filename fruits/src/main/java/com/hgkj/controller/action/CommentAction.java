package com.hgkj.controller.action;

import com.hgkj.model.entity.*;
import com.hgkj.model.service.CommentService;
import com.hgkj.model.service.CustomerService;
import com.hgkj.model.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/", produces = "application/json; charset=utf-8")
public class CommentAction {
    @Autowired
    private CommentService commentService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private CustomerService customerService;

    /**
     * 查询商品评论的信息的action
     * @param comment
     * @param session
     * @param pagecomIndex
     * @return
     */
    @RequestMapping("allcomment")
    @ResponseBody
    public Object allcomment(Comment comment, HttpSession session,Integer pagecomIndex) {
        if(pagecomIndex==null){
            pagecomIndex=session.getAttribute("pagecomIndex")==null?1:Integer.parseInt(session.getAttribute("pagecomIndex").toString());
        }
        int totlecompage=(commentService.allcommentservice(comment,null,0).size()-1)/10+1;
        if(pagecomIndex<=0){
            pagecomIndex=1;
        }else if(pagecomIndex>totlecompage){
            pagecomIndex=totlecompage;
        }
        List<Comment> commentList=commentService.allcommentservice(comment,(pagecomIndex-1)*10,10);
        session.setAttribute("pagecomIndex",pagecomIndex);
        session.setAttribute("totlecompage",totlecompage);
        session.setAttribute("commentList",commentList);
        session.setAttribute("comurl","allcomment.form?goodsid="+comment.getGoodsid()+"&pagecomIndex=");
        List list=new ArrayList();
        list.add(commentList);
        list.add(pagecomIndex);
        list.add(totlecompage);
        return list;
    }

    /**
     * 添加商品评论的action
     * @param comment
     * @param orders
     * @param session
     * @return
     */
    @RequestMapping("addcomment")
    public String addcomment(Comment comment, Orders orders, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        comment.setCommenttime(new Timestamp(System.currentTimeMillis()));
        ordersService.updateordersservice(orders);
        orders=ordersService.oneordersservice(orders);
        for (Orderdetail orderdetail:orders.getOrderdetailList()) {
            comment.setGoodsid(orderdetail.getGoodsid());
            comment.setCustid(customer.getCustid());
            commentService.addcommentservice(comment);
        }

        customer=customerService.Logincustomerservice(customer);
        session.setAttribute("customer",customer);
        return "user";
    }

    public void setOrdersService(OrdersService ordersService) {
        this.ordersService = ordersService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }
}
