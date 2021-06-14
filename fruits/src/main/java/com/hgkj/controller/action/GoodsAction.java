package com.hgkj.controller.action;

import com.hgkj.model.entity.Comment;
import com.hgkj.model.entity.Goods;
import com.hgkj.model.service.CommentService;
import com.hgkj.model.service.GoodsService;
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
public class GoodsAction {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private CommentService commentService;

    /**
     * 首页的数据查询并分页的action
     *
     * @param session
     * @return
     */
    @RequestMapping("allcuxiaogoods")
    public String allcuxiaogoods(HttpSession session) {
        Goods goods = new Goods();
        goods.setEndtime(new Timestamp(System.currentTimeMillis()));
        List<Goods> goodsList = goodsService.allcuxiaogoodsservice(goods);
        Goods goods1 = new Goods();
        goods1.setGoodstypeid(101);
        List<Goods> goodsList1 = goodsService.allcuxiaogoodsservice(goods1);
        goods1.setGoodstypeid(102);
        List<Goods> goodsList2 = goodsService.allcuxiaogoodsservice(goods1);
        goods1.setGoodstypeid(103);
        List<Goods> goodsList3 = goodsService.allcuxiaogoodsservice(goods1);
        goods1.setGoodstypeid(104);
        List<Goods> goodsList4 = goodsService.allcuxiaogoodsservice(goods1);
        List<List<Goods>> goodslistList = new ArrayList<>();
        goodslistList.add(goodsList1);
        goodslistList.add(goodsList2);
        goodslistList.add(goodsList3);
        goodslistList.add(goodsList4);
        session.setAttribute("goodsList", goodsList);
        session.setAttribute("goodslistList", goodslistList);
        return "index";
    }

    /**
     * 素菜馆的数据查询并分页的action
     *
     * @param session
     * @param pageIndex
     * @return
     */
    @RequestMapping("allfygoods")
    public String allfygoods(HttpSession session, Integer pageIndex) {
        if (pageIndex == null) {
            pageIndex = session.getAttribute("pageIndex") == null ? 1 : Integer.parseInt(session.getAttribute("pageIndex").toString());
        }
        Goods goods = new Goods();
        goods.setGoodstypeid(102);
        List<Goods> goodsguoshuList1 = goodsService.allcuxiaogoodsservice(goods);
        int totlepage = (goodsguoshuList1.size() - 1) / 8 + 1;
        if (pageIndex <= 0) {
            pageIndex = 1;
        } else if (pageIndex > totlepage) {
            pageIndex = totlepage;
        }
        List<Goods> goodsguoshuList = goodsService.allfygoodsservice(goods, (pageIndex - 1) * 8, 8);
        List<Goods> goodsxlList = goodsService.allxlgoodsservice(goods);
        session.setAttribute("totlepage", totlepage);
        session.setAttribute("pageIndex", pageIndex);
        session.setAttribute("goodsguoshuList", goodsguoshuList);
        session.setAttribute("goodsxlList", goodsxlList);
        session.setAttribute("url", "/allfygoods.form?pageIndex=");
        return "Product-List";
    }

    /**
     * 水果馆的数据查询并分页的action
     *
     * @param session
     * @param pagejfIndex
     * @return
     */
    @RequestMapping("allfyshuiguogoods")
    public String allfyshuiguogoods(HttpSession session, Integer pagejfIndex) {
        if (pagejfIndex == null) {
            pagejfIndex = session.getAttribute("pagejfIndex") == null ? 1 : Integer.parseInt(session.getAttribute("pagejfIndex").toString());
        }
        Goods goods = new Goods();
        goods.setPointbuy(1);
        List<Goods> goodsjfList1 = goodsService.allcuxiaogoodsservice(goods);
        int totlejfpage = (goodsjfList1.size() - 1) / 10 + 1;
        if (pagejfIndex <= 0) {
            pagejfIndex = 1;
        } else if (pagejfIndex > totlejfpage) {
            pagejfIndex = totlejfpage;
        }
        List<Goods> goodsjfList = goodsService.alljfgoodsservice(goods, (pagejfIndex - 1) * 10, 10);
        session.setAttribute("totlejfpage", totlejfpage);
        session.setAttribute("pagejfIndex", pagejfIndex);
        session.setAttribute("goodsjfList", goodsjfList);
        session.setAttribute("urljf", "/allfyshuiguogoods.form?pagejfIndex=");
        return "integral";
    }

    /**
     * 模糊水果馆的数据查询并分页的action
     *
     * @param session
     * @param goods
     * @param pagejfIndex
     * @return
     */
    @RequestMapping("allfyshuiguolikegoods")
    public String allfyshuiguolikegoods(HttpSession session, Goods goods, Integer pagejfIndex) {
        if (pagejfIndex == null) {
            pagejfIndex = 1;
        }
        goods.setPointbuy(1);
        List<Goods> goodsjfList1 = goodsService.allcuxiaogoodsservice(goods);
        int totlejfpage = (goodsjfList1.size() - 1) / 10 + 1;
        if (pagejfIndex <= 0) {
            pagejfIndex = 1;
        } else if (pagejfIndex > totlejfpage) {
            pagejfIndex = totlejfpage;
        }
        List<Goods> goodsjfList = goodsService.alljflikegoodsservice(goods, (pagejfIndex - 1) * 10, 10);
        session.setAttribute("totlejfpage", totlejfpage);
        session.setAttribute("pagejfIndex", pagejfIndex);
        session.setAttribute("goodsjfList", goodsjfList);
        session.setAttribute("urljf", "/allfyshuiguolikegoods.form?goodsname=" + goods.getGoodsname() + "&pagejfIndex=");
        return "integral";
    }

    /**
     * 模糊素菜馆的数据查询并分页的action
     *
     * @param session
     * @param goods
     * @param pageIndex
     * @return
     */
    @RequestMapping("alllikegoods")
    public String alllikegoods(HttpSession session, Goods goods, Integer pageIndex) {
        if (pageIndex == null) {
            pageIndex = 1;
        }
        List<Goods> goodslikeList = goodsService.allcuxiaogoodsservice(goods);
        int totlepage = (goodslikeList.size() - 1) / 8 + 1;
        if (pageIndex <= 0) {
            pageIndex = 1;
        } else if (pageIndex > totlepage) {
            pageIndex = totlepage;
        }
        goods.setGoodstypeid(102);
        List<Goods> goodsguoshuList = goodsService.alllikegoodsservice(goods, (pageIndex - 1) * 8, 8);
        List<Goods> goodsxlList = goodsService.allxlgoodsservice(goods);
        session.setAttribute("totlepage", totlepage);
        session.setAttribute("pageIndex", pageIndex);
        session.setAttribute("goodsguoshuList", goodsguoshuList);
        session.setAttribute("goodsxlList", goodsxlList);
        session.setAttribute("url", "/alllikegoods.form?goodsname=" + goods.getGoodsname() + "&pageIndex=");
        return "Product-List";
    }

    /**
     * 所有果蔬的数据查询并分页的action
     *
     * @param session
     * @param pageflIndex
     * @return
     */
    @RequestMapping("allflgoods")
    public String allflgoods(HttpSession session, Integer pageflIndex) {
        if (pageflIndex == null) {
            pageflIndex = session.getAttribute("pageflIndex") == null ? 1 : Integer.parseInt(session.getAttribute("pageflIndex").toString());
        }
        List<Goods> goodslikeList = null;
        Goods goods = new Goods();
        goods.setGoodstypeid(101);
        goodslikeList = goodsService.allcuxiaogoodsservice(goods);
        int totleflpage1 = (goodslikeList.size() - 1) / 8 + 1;
        goods.setGoodstypeid(102);
        goodslikeList = goodsService.allcuxiaogoodsservice(goods);
        int totleflpage2 = (goodslikeList.size() - 1) / 8 + 1;
        goods.setGoodstypeid(103);
        goodslikeList = goodsService.allcuxiaogoodsservice(goods);
        int totleflpage3 = (goodslikeList.size() - 1) / 8 + 1;
        int totleflpage = 0;
        if (totleflpage1 > totleflpage2) {
            if (totleflpage1 > totleflpage3) {
                totleflpage = totleflpage1;
            } else {
                totleflpage = totleflpage3;
            }
        } else if (totleflpage1 > totleflpage3) {
            totleflpage = totleflpage2;
        } else if (totleflpage2 > totleflpage3) {
            totleflpage = totleflpage2;
        } else {
            totleflpage = totleflpage3;
        }
        if (pageflIndex <= 0) {
            pageflIndex = 1;
        } else if (pageflIndex > totleflpage) {
            pageflIndex = totleflpage;
        }
        goods.setGoodstypeid(101);
        List<Goods> goodsflshuguoList = goodsService.allfygoodsservice(goods, (pageflIndex - 1) * 10, 10);
        goods.setGoodstypeid(102);
        List<Goods> goodsflguoshuList = goodsService.allfygoodsservice(goods, (pageflIndex - 1) * 10, 10);
        goods.setGoodstypeid(103);
        List<Goods> goodsflganguoList = goodsService.allfygoodsservice(goods, (pageflIndex - 1) * 10, 10);
        session.setAttribute("totleflpage", totleflpage);
        session.setAttribute("pageflIndex", pageflIndex);
        session.setAttribute("goodsflshuguoList", goodsflshuguoList);
        session.setAttribute("goodsflguoshuList", goodsflguoshuList);
        session.setAttribute("goodsflganguoList", goodsflganguoList);
        session.setAttribute("urlfl", "/allflgoods.form?pageflIndex=");
        return "Products";
    }

    /**
     * 模糊所有果蔬的数据查询并分页的action
     *
     * @param session
     * @param goods
     * @param pageflIndex
     * @return
     */
    @RequestMapping("allfllikegoods")
    public String allfllikegoods(HttpSession session, Goods goods, Integer pageflIndex) {
        if (pageflIndex == null) {
            pageflIndex = 1;
        }
        List<Goods> goodslikeList = null;
        goods.setGoodstypeid(101);
        goodslikeList = goodsService.allcuxiaogoodsservice(goods);
        int totleflpage1 = (goodslikeList.size() - 1) / 8 + 1;
        goods.setGoodstypeid(102);
        goodslikeList = goodsService.allcuxiaogoodsservice(goods);
        int totleflpage2 = (goodslikeList.size() - 1) / 8 + 1;
        goods.setGoodstypeid(103);
        goodslikeList = goodsService.allcuxiaogoodsservice(goods);
        int totleflpage3 = (goodslikeList.size() - 1) / 8 + 1;
        int totleflpage = 0;
        if (totleflpage1 > totleflpage2) {
            if (totleflpage1 > totleflpage3) {
                totleflpage = totleflpage1;
            } else {
                totleflpage = totleflpage3;
            }
        } else if (totleflpage1 > totleflpage3) {
            totleflpage = totleflpage2;
        } else if (totleflpage2 > totleflpage3) {
            totleflpage = totleflpage2;
        } else {
            totleflpage = totleflpage3;
        }
        if (pageflIndex <= 0) {
            pageflIndex = 1;
        } else if (pageflIndex > totleflpage) {
            pageflIndex = totleflpage;
        }
        goods.setGoodstypeid(101);
        List<Goods> goodsflshuguoList = goodsService.alllikegoodsservice(goods, (pageflIndex - 1) * 10, 10);
        goods.setGoodstypeid(102);
        List<Goods> goodsflguoshuList = goodsService.alllikegoodsservice(goods, (pageflIndex - 1) * 10, 10);
        goods.setGoodstypeid(103);
        List<Goods> goodsflganguoList = goodsService.alllikegoodsservice(goods, (pageflIndex - 1) * 10, 10);
        session.setAttribute("totleflpage", totleflpage);
        session.setAttribute("pageflIndex", pageflIndex);
        session.setAttribute("goodsflshuguoList", goodsflshuguoList);
        session.setAttribute("goodsflguoshuList", goodsflguoshuList);
        session.setAttribute("goodsflganguoList", goodsflganguoList);
        session.setAttribute("urlfl", "/allfllikegoods.form?goodsname=" + goods.getGoodsname() + "&pageflIndex=");
        return "Products";
    }

    /**
     * 活动专区的数据查询并分页的action
     *
     * @param session
     * @param pagetgIndex
     * @return
     */
    @RequestMapping("alltggoods")
    public String alltggoods(HttpSession session, Integer pagetgIndex) {
        if (pagetgIndex == null) {
            pagetgIndex = session.getAttribute("pagetgIndex") == null ? 1 : Integer.parseInt(session.getAttribute("pagetgIndex").toString());
        }
        Goods goods = new Goods();
        goods.setTeambuy(1);
        goods.setEndtime(new Timestamp(System.currentTimeMillis()));
        List<Goods> goodstgList1 = goodsService.allcuxiaogoodsservice(goods);
        int totletgpage = (goodstgList1.size() - 1) / 8 + 1;
        if (pagetgIndex <= 0) {
            pagetgIndex = 1;
        } else if (pagetgIndex > totletgpage) {
            pagetgIndex = totletgpage;
        }
        List<Goods> goodstgList = goodsService.alltggoodsservice(goods, (pagetgIndex - 1) * 8, 8);
        session.setAttribute("totletgpage", totletgpage);
        session.setAttribute("pagetgIndex", pagetgIndex);
        session.setAttribute("goodstgList", goodstgList);
        session.setAttribute("urltg", "/alltggoods.form?pagetgIndex=");
        return "Group_buy";
    }

    /**
     * 模糊活动专区的数据查询并分页的action
     *
     * @param session
     * @param goods
     * @param pagetgIndex
     * @return
     */
    @RequestMapping("alltglikegoods")
    public String alltglikegoods(HttpSession session, Goods goods, Integer pagetgIndex) {
        if (pagetgIndex == null) {
            pagetgIndex = 1;
        }
        goods.setTeambuy(1);
        goods.setEndtime(new Timestamp(System.currentTimeMillis()));
        List<Goods> goodstgList1 = goodsService.allcuxiaogoodsservice(goods);
        int totletgpage = (goodstgList1.size() - 1) / 8 + 1;
        if (pagetgIndex <= 0) {
            pagetgIndex = 1;
        } else if (pagetgIndex > totletgpage) {
            pagetgIndex = totletgpage;
        }
        List<Goods> goodstgList = goodsService.alltglikegoodsservice(goods, (pagetgIndex - 1) * 8, 8);
        session.setAttribute("totletgpage", totletgpage);
        session.setAttribute("pagetgIndex", pagetgIndex);
        session.setAttribute("goodstgList", goodstgList);
        session.setAttribute("urltg", "/alltglikegoods.form?goodsname=" + goods.getGoodsname() + "&pagetgIndex=");
        return "Group_buy";
    }

    /**
     * 活动专区的查询活动的商品信息的action
     *
     * @param session
     * @return
     */
    @RequestMapping("allajaxtggoods")
    @ResponseBody
    public Object allajaxtggoods(HttpSession session) {
        List<Goods> goodstgList = (List<Goods>) session.getAttribute("goodstgList");
        return goodstgList;
    }

    /**
     * 查询单个的商品信息的action
     *
     * @param session
     * @param goods
     * @return
     */
    @RequestMapping("onegoods")
    public String onegoods(HttpSession session, Goods goods) {
        goods = goodsService.onegoodsservice(goods);
        session.setAttribute("goods", goods);
        Comment comment = new Comment();
        comment.setGoodsid(goods.getGoodsid());
        int comsize = commentService.allcommentservice(comment, null, 0).size();
        session.setAttribute("comsize", comsize);
        allfygoods(session, null);
        return "Product-detailed";
    }

    /**
     * 展示购物车的商品信息的ajax的action
     *
     * @param session
     * @param goods
     * @return
     */
    @RequestMapping("showcargoods")
    @ResponseBody
    public String showcargoods(HttpSession session, Goods goods) {
        List<Goods> goodstgList = (List<Goods>) session.getAttribute("goodstgList");
        return "ok";
    }

    @RequestMapping("updategoodshd")
    public String updategoodshd(Goods goods) {
        goodsService.updategoodsservice(goods);
        return "redirect:alltggoods.form";
    }

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }
}
