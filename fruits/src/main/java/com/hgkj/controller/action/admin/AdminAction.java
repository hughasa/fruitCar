package com.hgkj.controller.action.admin;

import com.hgkj.model.entity.Admin;
import com.hgkj.model.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/", produces = "application/json; charset=utf-8")
public class AdminAction {
    @Autowired
    private AdminService adminService;

    /**
     * 管理员登录的action
     * @param session
     * @param admin
     * @return
     */
    @RequestMapping("loginadmin")
    public String loginadmin(HttpSession session, Admin admin) {
        admin = adminService.Loginadminservice(admin);
        if (admin == null) {
            session.setAttribute("msg", "用户名或密码错误！！！");
            return "adminjsp/login";
        } else {
            session.removeAttribute("msg");
            session.setAttribute("admin", admin);
            return "adminjsp/index";
        }
    }

    /**
     * 退出管理员界面
     * @param session
     * @return
     */
    @RequestMapping("tuichuadmin")
    public String tuichuadmin(HttpSession session) {
        session.removeAttribute("admin");
        return "adminjsp/login";
    }



    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }
}
