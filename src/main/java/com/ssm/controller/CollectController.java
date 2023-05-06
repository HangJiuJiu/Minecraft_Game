package com.ssm.controller;

import com.ssm.bean.Collect;
import com.ssm.bean.User;
import com.ssm.service.CollectService;
import com.ssm.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 我的收藏Controller
 */
@Controller
@RequestMapping(value = "/ssm/collect")
public class CollectController {

    // 注入spring容器中的bean
    //让我们可以直接使用 不用去new对象
    @Autowired
    private CollectService collectService;

    /**
     * 1、使用@RequestMapping注解来映射请求的URL
     * 2、使用ModelAndView类用来存储处理完后的结果数据，以及显示该数据的视图。
     * 3、collect为查询参数
     */
    /**
     * @param collect  我的收藏类
     * @param request  http请求信息
     * @param response http响应信息
     * @return ModelAndView 视图与模型封装类 用于携带数据并跳转指定的页面
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(Collect collect, HttpServletRequest request, HttpServletResponse response) {
        // ModelAndView构造方法可以指定返回的页面名称-collectPage
        ModelAndView mv = new ModelAndView("collectPage");
        // 从session中获取当前登录的用户信息
        User user = (User) request.getSession().getAttribute("currentUser");
        //来根据当前用户id，显示出我的收藏数据库数据，如果没有将会将其他用户的收藏内容一起显示
        collect.setUserid(user.getId());
        // *通过调取service获取我的收藏列表
        List<Collect> datalist = collectService.findList(collect);
        // 使用addObject()设置需要返回的值
        //可以将值传给jsp让他去显示
        mv.addObject("datalist", datalist).addObject("param", collect);
        // 让该ModelAndView返回Spring MVC框架去处理
        return mv;
    }

    /**
     * 跳转新增/修改页面
     */
/*    @RequestMapping(value = "form")
    public ModelAndView form(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("collectForm");
        // 获取请求中的参数
        //请求你所选数据的id
        String id = request.getParameter("id");
        Collect collect = new Collect();
        // 如果id不为空，则获取我的收藏，从而进行修改
        //StringUtils.isNotBlank(id)判断id是否为空，不为空就执行
        if (StringUtils.isNotBlank(id)) {
            //根据数据id，存入里面的数据
            collect = collectService.get(id);
        }
        //将collect这条根据id数据在页面中进行展示
        mv.addObject("collect", collect);
        return mv;
    }*/

    /**
     * 新增 我的收藏
     *
     * @param request
     * @param collect 接受前端提交过来的收藏信息
     * @return
     */
    @RequestMapping(value = "save")
    public String save(HttpServletRequest request, Collect collect) {
        // 从session中获取当前登录的用户信息
        User user = (User) request.getSession().getAttribute("currentUser");
        // 向收藏类中 设置用户的id 以及收藏的时间
        //*获取收藏的用户id存入到数据库
        //如果不写，userid就为空，所以不会显示，但是其他数据会存储到数据库
        collect.setUserid(user.getId());
        //获取收藏的时间存入到数据库
        collect.setTime(DateUtils.getDateTime());
        // *调用service层执行保存方法，点击收藏按钮即可收藏核心
        collectService.save(collect);
        // 从定向到指定页面
        return "redirect:/ssm/collect/list";
    }

    /**
     * 删除
     */
    @RequestMapping(value = "delete")
    public String delete(HttpServletRequest request) {
        // 调用service层的删除方法
        collectService.delete(request.getParameter("id"));
        return "redirect:/ssm/collect/list";
    }

}