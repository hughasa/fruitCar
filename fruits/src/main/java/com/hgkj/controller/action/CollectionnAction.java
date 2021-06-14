package com.hgkj.controller.action;

import com.hgkj.model.entity.Collectionn;
import com.hgkj.model.entity.Customer;
import com.hgkj.model.service.CollectionnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/", produces = "application/json; charset=utf-8")
public class CollectionnAction {
    @Autowired
    private CollectionnService collectionnService;

    /**
     * 添加收藏商品的信息的action
     * @param collectionn
     * @param session
     * @return
     */
    @RequestMapping("addcollectionn")
    @ResponseBody
    public String addcollectionn(Collectionn collectionn,HttpSession session) {
        String collectionnsc="ok";
        Customer customer= (Customer) session.getAttribute("customer");
        collectionn.setCustid(customer.getCustid());
        Collectionn collectionn1=collectionnService.onecollectionnservice(collectionn);
        if(collectionn1==null){
            collectionnService.addcollectionnservice(collectionn);
        }else {
            collectionnsc="no";
        }
        return collectionnsc;
    }

    /**
     * 删除收藏的信息的action
     * @param session
     * @param collectionn
     * @return
     */
    @RequestMapping("deletecollectionn")
    public String deletecollectionn(HttpSession session,Collectionn collectionn) {
        collectionnService.deletecollectionnservice(collectionn);
        return "redirect:allcollectionn.form";
    }

    /**
     * 查询收藏的商品的信息的action
     * @param session
     * @param pagescIndex
     * @return
     */
    @RequestMapping("allcollectionn")
    public String allcollectionn(HttpSession session,Integer pagescIndex) {
        Customer customer= (Customer) session.getAttribute("customer");
        Collectionn collectionn=new Collectionn();
        collectionn.setCustid(customer.getCustid());
        if(pagescIndex==null){
            pagescIndex=session.getAttribute("pagescIndex")==null?1:Integer.parseInt(session.getAttribute("pagescIndex").toString());
        }
        List<Collectionn> collectionnList1=collectionnService.allcollectionnservice(collectionn);
        int totlescpage=(collectionnList1.size()-1)/8+1;
        if(pagescIndex<=0){
            pagescIndex=1;
        }else if(pagescIndex>totlescpage){
            pagescIndex=totlescpage;
        }
        List<Collectionn> collectionnList=collectionnService.allfycollectionnservice(collectionn,(pagescIndex-1)*8,8);
        session.setAttribute("pagescIndex",pagescIndex);
        session.setAttribute("totlescpage",totlescpage);
        session.setAttribute("collectionnList",collectionnList);
        session.setAttribute("urlsc","/allcollectionn.form?pagescIndex=");
        return "user_Collect";
    }

    public void setCollectionnService(CollectionnService collectionnService) {
        this.collectionnService = collectionnService;
    }
}
