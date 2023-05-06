package com.ssm.controller;

import com.ssm.bean.User;
import com.ssm.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 用户信息Controller
 */
@Controller
@RequestMapping(value = "/ssm/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 查看用户信息
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(User user, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("userPage");
        //*获取user数据+搜索
        List<User> datalist = userService.findList(user);
        //页面展示
        mv.addObject("datalist", datalist).addObject("param", user);
        return mv;
    }

    @RequestMapping(value = "chat")
    public ModelAndView getChat() {
        ModelAndView view = new ModelAndView("chat");
        return view;
    }

    @RequestMapping(value = "tutorial")
    public ModelAndView tutorial() {
        ModelAndView view = new ModelAndView("tutorial");
        return view;
    }

    /**
     * 新增、修改信息跳转页面
     */
    @RequestMapping(value = "form")
    public ModelAndView form(HttpServletRequest request) {
        //*跳转新增+修改页面
        ModelAndView mv = new ModelAndView("userForm");
        //获取id
        String id = request.getParameter("id");
        User user = new User();
        user.setAuth("1");
        //判断有没有id，有id就是修改，没id或者id=0就是新增
        if (StringUtils.isNotBlank(id) && !"0".equals(id)) {
            //*修改数据页面显示
            user = userService.get(Integer.parseInt(id));
        }
        // 个人信息标志
        mv.addObject("flag", request.getParameter("flag"));
        //使修改的user数据展示出来
        mv.addObject("user", user);
        return mv;
    }

    /**
     * 新增、修改
     */
    @RequestMapping(value = "save")
    public String save(HttpServletRequest request, User user) {
        //*修改+添加页面核心
        userService.save(user);
        // 如果flag不为空的话，是从个人信息传入过来，需要清缓存，跳回个人信息页
        //有flag就是个人信息，没有flag就是用户信息(管理员专属)
        if (StringUtils.isNotBlank(request.getParameter("flag"))) {
            // 若为个人信息，则修改后重新将当前用户加入缓存
            user = userService.get(user.getId());
            request.getSession().setAttribute("currentUser", user);
            return "redirect:/ssm/user/person";
        } else {
            // flag为空的话，是从用户修改或新增页面过来，需要跳回用户列表
            return "redirect:/ssm/user/list";
        }
    }

    /**
     * 删除
     */
    @RequestMapping(value = "delete")
    public String delete(HttpServletRequest request) {
        //*删除
        userService.delete(request.getParameter("id"));
        return "redirect:/ssm/user/list";
    }

    /**
     * 跳转个人信息页面
     */
    //个人信息页面
    @RequestMapping(value = "person")
    public String person(HttpServletRequest request) {
        return "person";
    }
}