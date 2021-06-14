package com.hgkj.controller.action.admin;

import com.hgkj.model.entity.Goods;
import com.hgkj.model.service.GoodsService;
import com.hgkj.model.service.OrderdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/", produces = "application/json; charset=utf-8")
public class AdminGoodsAction {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private OrderdetailService orderdetailService;

    /**
     * 查询所有商品的action并进行分页
     * @param session
     * @param pageadminIndex
     * @param type
     * @return
     */
    @RequestMapping("alladmingoods")
    public String alladmingoods(HttpSession session,Integer pageadminIndex,String type) {
        if(pageadminIndex==null){
            pageadminIndex=session.getAttribute("pageadminIndex")==null?1:Integer.parseInt(session.getAttribute("pageadminIndex").toString());
        }
        Goods goods = new Goods();
        goods.setGoodstypeid(101);
        List<Goods> goodsList1 = goodsService.allcuxiaogoodsservice(goods);
        goods.setGoodstypeid(102);
        List<Goods> goodsList2 = goodsService.allcuxiaogoodsservice(goods);
        goods.setGoodstypeid(103);
        List<Goods> goodsList3 = goodsService.allcuxiaogoodsservice(goods);
        goods.setGoodstypeid(104);
        List<Goods> goodsList4 = goodsService.allcuxiaogoodsservice(goods);
        int totleadminpage=(goodsList1.size()-1)/10+1;
        totleadminpage=((goodsList2.size()-1)/10+1)>=totleadminpage?(goodsList2.size()-1)/10+1:totleadminpage;
        totleadminpage=((goodsList3.size()-1)/10+1)>=totleadminpage?(goodsList3.size()-1)/10+1:totleadminpage;
        totleadminpage=((goodsList4.size()-1)/10+1)>=totleadminpage?(goodsList4.size()-1)/10+1:totleadminpage;
        if(pageadminIndex<1){
            pageadminIndex=1;
        }else if(pageadminIndex>totleadminpage){
            pageadminIndex=totleadminpage;
        }
        goods.setGoodstypeid(101);
        List<Goods> goodsListlike1 = goodsService.alladminlikegoodsservice(goods,(pageadminIndex-1)*10,10);
        goods.setGoodstypeid(102);
        List<Goods> goodsListlike2 = goodsService.alladminlikegoodsservice(goods,(pageadminIndex-1)*10,10);
        goods.setGoodstypeid(103);
        List<Goods> goodsListlike3 = goodsService.alladminlikegoodsservice(goods,(pageadminIndex-1)*10,10);
        goods.setGoodstypeid(104);
        List<Goods> goodsListlike4 = goodsService.alladminlikegoodsservice(goods,(pageadminIndex-1)*10,10);
        List<List<Goods>> goodsadminlistList = new ArrayList<>();
        goodsadminlistList.add(goodsListlike1);
        goodsadminlistList.add(goodsListlike2);
        goodsadminlistList.add(goodsListlike3);
        goodsadminlistList.add(goodsListlike4);
        session.setAttribute("goodsadminlistList", goodsadminlistList);
        session.setAttribute("totleadminpage", totleadminpage);
        session.setAttribute("pageadminIndex", pageadminIndex);
        session.setAttribute("adminurl", "alladmingoods.form?type="+type+"&pageadminIndex=");
        if(type.equals("sp")){
            return "adminjsp/Node/index";
        }else if(type.equals("jf")){
            return "adminjsp/Role/index";
        }else{
            return "adminjsp/User/index";
        }
    }

    /**
     * 模糊查询所有商品的action并进行分页
     * @param session
     * @param pageadminIndex
     * @param goods
     * @param type
     * @return
     */
    @RequestMapping("alladminlikegoods")
    public String alladminlikegoods(HttpSession session,Integer pageadminIndex,Goods goods,String type) {
        if(pageadminIndex==null){
            pageadminIndex=1;
        }
        goods.setGoodstypeid(101);
        List<Goods> goodsList1 = goodsService.allcuxiaogoodsservice(goods);
        goods.setGoodstypeid(102);
        List<Goods> goodsList2 = goodsService.allcuxiaogoodsservice(goods);
        goods.setGoodstypeid(103);
        List<Goods> goodsList3 = goodsService.allcuxiaogoodsservice(goods);
        goods.setGoodstypeid(104);
        List<Goods> goodsList4 = goodsService.allcuxiaogoodsservice(goods);
        int totleadminpage=(goodsList1.size()-1)/10+1;
        totleadminpage=((goodsList2.size()-1)/10+1)>=totleadminpage?(goodsList2.size()-1)/10+1:totleadminpage;
        totleadminpage=((goodsList3.size()-1)/10+1)>=totleadminpage?(goodsList3.size()-1)/10+1:totleadminpage;
        totleadminpage=((goodsList4.size()-1)/10+1)>=totleadminpage?(goodsList4.size()-1)/10+1:totleadminpage;
        if(pageadminIndex<1){
            pageadminIndex=1;
        }else if(pageadminIndex>totleadminpage){
            pageadminIndex=totleadminpage;
        }
        goods.setGoodstypeid(101);
        List<Goods> goodsListlike1 = goodsService.alladminlikegoodsservice(goods,(pageadminIndex-1)*10,10);
        goods.setGoodstypeid(102);
        List<Goods> goodsListlike2 = goodsService.alladminlikegoodsservice(goods,(pageadminIndex-1)*10,10);
        goods.setGoodstypeid(103);
        List<Goods> goodsListlike3 = goodsService.alladminlikegoodsservice(goods,(pageadminIndex-1)*10,10);
        goods.setGoodstypeid(104);
        List<Goods> goodsListlike4 = goodsService.alladminlikegoodsservice(goods,(pageadminIndex-1)*10,10);
        List<List<Goods>> goodsadminlistList = new ArrayList<>();
        goodsadminlistList.add(goodsListlike1);
        goodsadminlistList.add(goodsListlike2);
        goodsadminlistList.add(goodsListlike3);
        goodsadminlistList.add(goodsListlike4);
        session.setAttribute("goodsadminlistList", goodsadminlistList);
        session.setAttribute("totleadminpage", totleadminpage);
        session.setAttribute("pageadminIndex", pageadminIndex);
        session.setAttribute("adminurl", "alladminlikegoods.form?type="+type+"&goodsname="+goods.getGoodsname()+"&pageadminIndex=");
        if(type.equals("sp")){
            return "adminjsp/Node/index";
        }else if(type.equals("jf")){
            return "adminjsp/Role/index";
        }else{
            return "adminjsp/User/index";
        }
    }

    /**
     * 添加商品的action
     * @param uploadfile
     * @param request
     * @param goods
     * @return
     */
    @RequestMapping("addadmingoods")
    public String alladmingoods(@RequestParam("filename") List<MultipartFile> uploadfile, HttpServletRequest request, Goods goods) {
        int goodstypeid = goods.getGoodstypeid();
        String path = "";
        if (goodstypeid == 101) {
            path = "fruit/";
        } else if (goodstypeid == 102) {
            path = "vegtables/";
        } else if (goodstypeid == 103) {
            path = "Nuts/";
        } else if (goodstypeid == 104) {
            path = "";
        }
        String goodspic = handleFormUpload(uploadfile, request, path);
        goods.setGoodspic(goodspic);
        goods.setGoodscreatetime(new Timestamp(System.currentTimeMillis()));
        goods.setPointbuy(0);
        goods.setGoodssales(0);
        goods.setGoodsinventory(9999);
        goods.setPointbuyprice(0);
        goodsService.addgoodsservice(goods);
        return "redirect:alladmingoods.form?type=sp";
    }

    /**
     * 修改商品的action
     * @param session
     * @param type
     * @param updateadmingoods
     * @return
     */
    @RequestMapping("updateadmingoods")
    public String updateadmingoods(HttpSession session,String type, Goods updateadmingoods) {
        updateadmingoods = goodsService.onegoodsservice(updateadmingoods);
        session.setAttribute("updateadmingoods", updateadmingoods);
        if(type.equals("sp")){
            return "adminjsp/Node/edit";
        }else if(type.equals("jf")){
            return "adminjsp/Role/edit";
        }else{
            return "adminjsp/User/edit";
        }
    }

    /**
     * 删除商品的action
     * @param goods
     * @return
     */
    @RequestMapping("deleteadmingoods")
    public String deleteadmingoods(Goods goods) {
        if(orderdetailService.oneorderdetailservice(goods)==null){
            goodsService.deletegoodsservice(goods);
        }
        return "redirect:alladmingoods.form?type=sp";
    }

    /**
     * 修改商品的图片以及商品的信息的action
     * @param uploadfile
     * @param request
     * @param session
     * @param type
     * @param goods
     * @return
     */
    @RequestMapping("updateqradmingoodsimg")
    public String updateqradmingoodsimg(@RequestParam("filename") List<MultipartFile> uploadfile,HttpServletRequest request,HttpSession session,String type, Goods goods) {
        if(uploadfile.get(0).getSize()>0){
            String path = "";
            int goodstypeid = goods.getGoodstypeid();
            if (goodstypeid == 101) {
                path = "fruit/";
            } else if (goodstypeid == 102) {
                path = "vegtables/";
            } else if (goodstypeid == 103) {
                path = "Nuts/";
            } else if (goodstypeid == 104) {
                path = "";
            }
            String goodspic = handleFormUpload(uploadfile, request, path);
            goods.setGoodspic(goodspic);
        }
        goodsService.updategoodsservice(goods);
        session.removeAttribute("updateadmingoods");
        return "redirect:alladmingoods.form?type="+type;
    }

    /**
     * 修改商品的信息不修改图片的action
     * @param session
     * @param type
     * @param goods
     * @return
     */
    @RequestMapping("updateqradmingoods")
    public String updateqradmingoods(HttpSession session,String type, Goods goods) {
        goodsService.updategoodsservice(goods);
        session.removeAttribute("updateadmingoods");
        return "redirect:alladmingoods.form?type="+type;
    }

    /**
     * 判断文件是不是图片格式的action
     * @param filename
     * @return
     */
    @RequestMapping("adminjsp/Node/adminimg")
    @ResponseBody
    public String adminimg(String filename){
        String[] imggs = new String[]{"jpg", "png", "jpeg", "gif", "psd", "pdd", "pdf"};
        String[] imggs1=filename.split("\\.");
        String img="no";
        for (int i = 0; i < imggs.length; i++) {
            if(imggs[i].equals(imggs1[imggs1.length-1])){
                img="ok";
                break;
            }
        }
        return img;
    }

    /**
     * 文件上传方法
     * @param uploadfile
     * @param request
     * @param path
     * @return
     */
    public String handleFormUpload(List<MultipartFile> uploadfile, HttpServletRequest request, String path) {
        // 判断所上传文件是否存在
        if (!uploadfile.isEmpty() && uploadfile.size() > 0) {
            //循环输出上传的文件
            String originalFilename = "";
            for (MultipartFile file : uploadfile) {
                // 获取上传文件的原始名称
                originalFilename = file.getOriginalFilename();
                // 设置上传文件的保存地址目录
                String dirPath = request.getServletContext().getRealPath("/images/" + path);
                File filePath = new File(dirPath);
                // 如果保存文件的地址不存在，就先创建目录
                if (!filePath.exists()) {
                    filePath.mkdirs();
                }
                String newFilename = originalFilename;
                try {
                    // 使用MultipartFile接口的方法完成文件上传到指定位置
                    file.transferTo(new File(dirPath + newFilename));
                } catch (Exception e) {
                    e.printStackTrace();
                    return "error";
                }
            }
            // 跳转到成功页面
            return path + originalFilename;
        } else {
            return null;
        }
    }

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }
}
