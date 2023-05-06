package com.ssm.interceptor;

import com.ssm.bean.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    private static final String[] IGNORE_URI = {"register", "adminlogin", "admindologin", "adminlogout", "doRegister", "dologin", "login", "logout"};

    @Override
    public void afterCompletion(HttpServletRequest arg0,
                                HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
                           Object arg2, ModelAndView arg3) throws Exception {

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object arg2) throws Exception {
        //flag变量用于判断用户是否登录，默认为false 
        boolean flag = false;
        //获取请求的路径进行判断(@control的路径,如"/fore/addGoods")
        String servletPath = request.getServletPath();
        servletPath = servletPath.substring(servletPath.lastIndexOf("/") + 1, servletPath.length());
        //判断请求是否需要拦截
        for (String uri : IGNORE_URI) {
            if (uri.equals(servletPath)) {
                flag = true;
                break;
            }
        }


        //拦截请求
        if (!flag) {
            //1.获取session中的用户
            User user = (User) request.getSession().getAttribute("currentUser");
            //2.判断用户是否已经登录
            if (user == null) {
                //验证还未登录，跳转至登录界面
                response.sendRedirect("/ssm/login");
            } else {
                //如果用户已经登录，则验证通过，放行
                flag = true;
            }
        }
        return flag;

    }

}