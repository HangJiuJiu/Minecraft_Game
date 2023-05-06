package com.ssm.controller;

import com.ssm.bean.User;
import com.ssm.service.UserService;
import com.ssm.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/ssm")
public class LoginController {

    @Autowired
    private UserService userService;

    /**
     * 首页页面
     *
     * @return
     */
    @RequestMapping(value = "/index")
    public String index() {
        return "index";
    }

    /**
     * 登录：跳转到登录页面
     *
     * @return
     */
    @RequestMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("login");
        // 选择的角色传到login页面
        mv.addObject("auth", request.getParameter("auth"));
        return mv;
    }

    /**
     * 普通用户登录
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/dologin")
    @ResponseBody
    public JsonMsg dologin(HttpServletRequest request) {
        String number = request.getParameter("username");
        String password = request.getParameter("password");
        String auth = request.getParameter("auth");
        //*登录
        User user = userService.identity(number, password, auth);
        if (user == null || user.getId() == null) {
            return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
        }
        request.getSession().setAttribute("userid", user.getName());
        request.getSession().setAttribute("currentUser", user);
        return JsonMsg.success().addInfo(user);
    }

    /**
     * 退出登录：从主页面跳转到登录页面
     *
     * @return
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("currentUser");
        return "login";
    }

    /**
     * 注册页面
     *
     * @return
     */
    @RequestMapping(value = "/register")
    public String register() {
        return "register";
    }

    /**
     * 注册
     *
     * @return
     */
    @RequestMapping(value = "/doRegister")
    @ResponseBody
    public JsonMsg doRegister(User user, HttpServletRequest request) {
        try {
            User param = new User();
            param.setName(user.getName());
            List<User> list = userService.findList(param);
            if (list != null && !list.isEmpty()) {
                return JsonMsg.fail("该账号已存在，请重新收入");
            }
            //*注册
            userService.save(user);
            return JsonMsg.success();
        } catch (Exception e) {
            e.printStackTrace();
            return JsonMsg.fail("注册失败");
        }
    }

}
