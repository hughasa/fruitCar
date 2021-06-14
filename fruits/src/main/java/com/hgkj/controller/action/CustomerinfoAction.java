package com.hgkj.controller.action;

import com.hgkj.model.entity.Customer;
import com.hgkj.model.entity.Customerinfo;
import com.hgkj.model.service.CustomerService;
import com.hgkj.model.service.CustomerinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping(value = "/", produces = "application/json; charset=utf-8")
public class CustomerinfoAction {
    @Autowired
    private CustomerinfoService customerinfoService;
    @Autowired
    private CustomerService customerService;

    /**
     * 添加用户详情的action
     * @param uploadfile
     * @param customerinfo
     * @param customer
     * @param session
     * @param request
     * @return
     */
    @RequestMapping("addcustomerinfo")
    public String addcustomerinfo(@RequestParam("filename") List<MultipartFile> uploadfile,Customerinfo customerinfo,Customer customer,HttpSession session, HttpServletRequest request) {
        Customer customer1= (Customer) session.getAttribute("customer");
        customer.setCustid(customer1.getCustid());
        customerService.updatecustomerservice(customer);
        customerinfo.setCustid(customer1.getCustid());
        if(uploadfile.get(0).getSize()>0){
            String originalFilename=handleFormUpload(uploadfile,request);
            customerinfo.setCustpic(originalFilename);
        }
        if(customer1.getCustomerinfo()==null){
            customerinfoService.addcustomerinfoservice(customerinfo);
        }else {
            customerinfo.setCustinfoid(customer1.getCustomerinfo().getCustinfoid());
            customerinfoService.updatecustomerinfoservice(customerinfo);
        }
        customer=customerService.Logincustomerservice(customer);
        session.setAttribute("customer",customer);
        return "user_info";
    }

    /**
     * 文件上传的方法
     * @param uploadfile
     * @param request
     * @return
     */
    public String handleFormUpload(List<MultipartFile> uploadfile, HttpServletRequest request) {
        // 判断所上传文件是否存在
        if (!uploadfile.isEmpty() && uploadfile.size() > 0) {
            //循环输出上传的文件
            String originalFilename="";
            for (MultipartFile file : uploadfile) {
                // 获取上传文件的原始名称
                originalFilename = file.getOriginalFilename();
                // 设置上传文件的保存地址目录
                String dirPath = request.getServletContext().getRealPath("/customerimg/");
                File filePath = new File(dirPath);
                // 如果保存文件的地址不存在，就先创建目录
                if (!filePath.exists()) {
                    filePath.mkdirs();
                }
                String newFilename =originalFilename;
                try {
                    // 使用MultipartFile接口的方法完成文件上传到指定位置
                    file.transferTo(new File(dirPath + newFilename));
                } catch (Exception e) {
                    e.printStackTrace();
                    return"error";
                }
            }
            // 跳转到成功页面
            return "/customerimg/"+originalFilename;
        }else{
            return null;
        }
    }

    public void setCustomerinfoService(CustomerinfoService customerinfoService) {
        this.customerinfoService = customerinfoService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }
}
