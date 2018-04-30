package com.qf.shop.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.shop.pojo.Book;
import com.qf.shop.pojo.Category;
import com.qf.shop.pojo.TbAdmin;
import com.qf.shop.pojo.User;
import com.qf.shop.pojo.dto.BookDTO;
import com.qf.shop.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminAction {
    @Autowired
    private IAdminService adminService;

  //判断用户是否登陆
    @RequestMapping(value="/index")
    public String index(HttpSession session){

        if (session.getAttribute("user")==null){
            return "login";
        }else{
            return "index";
        }
    }

    //管理员登陆模块
    @RequestMapping(value="/tologin",produces="plain/text;charset=UTF-8",method = RequestMethod.POST)
    @ResponseBody
    public String login(TbAdmin admin, HttpSession session){
        TbAdmin findAdmin = adminService.findAdmin(admin);
        if(findAdmin!=null){
            session.setAttribute("user", findAdmin);
            return "1";
        }else{
            return "0";
        }
    }

    //注销操作
    @RequestMapping(value="/logout")
    public String logout(HttpSession session){
            session.invalidate();
            return "/index";

    }

    //商品管理(查找所有商品)
    @RequestMapping(value = "/productList")
    public String findAll(HttpServletRequest request) {
        List<BookDTO> allBook = adminService.findAllBook();
        request.setAttribute("allBook",allBook);
        return "/pages/"+"productList";
    }
    //编辑商品
    @RequestMapping(value = "/editProduct")
    public String edit(String bid,HttpServletRequest request){
        Book findBookByBid = adminService.findBookByBid(bid);
        request.setAttribute("findBookByBid",findBookByBid);
        return "/pages/"+"editProduct";
    }
    //删除单个商品deleteProduct
    @RequestMapping(value = "/deleteProduct")
    public String delete(String bid){
        adminService.deleteProduct(bid);
        return "redirect:/productList";
    }
    //分类管理
    @RequestMapping(value = "/categoryList")
    public String categoryList(HttpServletRequest request){
        List<Category> categoryList= adminService.findCategory();
        request.setAttribute("categoryList",categoryList);
        return "pages/"+"categoryList";
    }
    //根据cid修改分类信息editCategory
    @RequestMapping(value = "/editCategory")
    public String editCategory(String id,HttpServletRequest request){
        int cid = Integer.parseInt(id);
        Category editCategoryByCid= adminService.editCategoryByCid(cid);
       request.setAttribute("editCategoryByCid",editCategoryByCid);
        return "pages/"+"editCategory";
    }
    //用户管理列表
    @RequestMapping(value = "/user")
    public String user(@RequestParam(value="pn", defaultValue="1")Integer pn, HttpServletRequest request){
        PageHelper.startPage(pn,10);
        List<User> userList=adminService.findAllUser();
        PageInfo page = new PageInfo(userList,5);
        request.setAttribute("pageInfo",page);
        return "pages/"+"userList";
    }

    //用户编辑
    @RequestMapping(value = "/editUser")
    public String editUser(User user,HttpServletRequest request){
        User editOneUser = adminService.editUser(user);
        request.setAttribute("editOneUser",editOneUser);
        return "pages/"+"editUser";
    }
    //提交用户信息修改
    @RequestMapping(value = "/submitUser")
    public String submitUser(User user,HttpServletRequest request){

     adminService.saveOneUser(user);
        User editOneUser = adminService.editUser(user);

        return "forward:/editUser";
    }

    //用户删除
    @RequestMapping(value = "/deleteUser")
    public String deleteUser(User user){
        adminService.deleteUser(user);

        return "redirect:/user";
    }

    @RequestMapping(value = "/submitAddUser")
    public String submitAddUser(User user,HttpServletRequest request){

        adminService.saveUser(user);

        return "forward:/addUser";
    }
}
