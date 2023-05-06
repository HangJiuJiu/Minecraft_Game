package com.ssm.controller;

import com.ssm.bean.Game;
import com.ssm.bean.GameVo;
import com.ssm.bean.User;
import com.ssm.service.GameService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 管理信息Controller
 */
@Controller
@RequestMapping(value = "/ssm/game")
public class GameController {

    @Autowired
    private GameService gameService;

    /**
     * 1、使用@RequestMapping注解来映射请求的URL
     * 2、使用ModelAndView类用来存储处理完后的结果数据，以及显示该数据的视图。
     * 3、game为查询参数
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(GameVo game, HttpServletRequest request, HttpServletResponse response) {
        // ModelAndView构造方法可以指定返回的页面名称-gamePage
        ModelAndView mv = new ModelAndView("gamePage");
        // 通过调取service获取管理信息列表
        User user = (User) request.getSession().getAttribute("currentUser");
        // 获取分页相关信息
        // 获取待查找的页码
        int pageNo = game.getPageNo();
        // （查询数据的总条数/每页的数量）+1 = 总共的页数
        int count = (gameService.countAll() / game.getPageSize()) + 1;
        // 查找的页码小于0 则查询第一页
        if (pageNo <= 0) {
            pageNo = 1;
        }
        // 查找的页码大于总页数 则查询最后一页
        if (pageNo > count) {
            pageNo = count;
        }
        // 计算从第几条数据开始查找  用于拼接sql中的 limit
        int pageSun = (pageNo - 1) * game.getPageSize();
        game.setPageNo(pageSun);
        // 如果当前用户是 普通 用户  就只查询状态为 1 的数据
        if ("1".equals(user.getAuth())) {
            game.setState("1");
        }

        //*显示全部+搜索+页面大小数据显示
        List<Game> datalist = gameService.findList(game);

        // 从新设置pageNo的值为页码 用于页面展示数据
        game.setPageNo(pageNo);
        // 使用addObject()设置需要返回的值
        //datalist mod数据库展示
        mv.addObject("datalist", datalist)
                //全展示
                .addObject("param", game)
                //页数展示
                .addObject("pages", count);
        // 让该ModelAndView返回Spring MVC框架去处理
        return mv;
    }

    /**
     * 跳转添加+修改页面
     */
    @RequestMapping(value = "form")
    public ModelAndView form(HttpServletRequest request) {
        //*跳转添加+修改页面
        ModelAndView mv = new ModelAndView("gameForm");
        // 获取请求中的参数
        //请求你所选数据的id
        String id = request.getParameter("id");
        Game game = new Game();
        // *如果id不为空，则获取管理信息，从而进行修改
        if (StringUtils.isNotBlank(id)) {
            //*根据数据id，存入里面的数据，修改显示
            game = gameService.get(id);
        }
        //将collect这条根据id数据在页面中进行展示
        // 让该ModelAndView返回Spring MVC框架去处理
        mv.addObject("game", game);
        return mv;
    }

    /**
     * 添加+修改
     */
    @RequestMapping(value = "save")
    public String save(HttpServletRequest request, Game game) {
        User user = (User) request.getSession().getAttribute("currentUser");
        //*实现修改+添加
        gameService.save(game, user);
/*        //如果数据为null就是新增
        if (game.getId() == null || game.getId() == 0) {
            return "redirect:/ssm/game/index";
        }*/
        // 重定向到指定页面
        return "redirect:/ssm/game/list";
    }

    /**
     * 删除
     */
    @RequestMapping(value = "delete")
    public String delete(HttpServletRequest request) {
        //*根据id进行删除
        gameService.delete(request.getParameter("id"));
        return "redirect:/ssm/game/list";
    }

    /**
     * 跳转审核页面
     */
    @RequestMapping(value = "view")
    public ModelAndView view(HttpServletRequest request) {
        //展示模组信息审核页面
        ModelAndView mv = new ModelAndView("gameView");
        //请求模组的id
        String id = request.getParameter("id");
        //*根据id来查出game数据库里面的一条数据
        Game game = gameService.get(id);
        //显示模组信息审核页面的数据
        mv.addObject("game", game);
        return mv;
    }

    /**
     * 审核
     */
    @RequestMapping(value = "updateState")
    public String updateState(HttpServletRequest request) {
        //id对应的一条数据库信息
        Game game = gameService.get(request.getParameter("id"));
        //请求是1还是2，是1就是通过，2就是驳回
        game.setState(request.getParameter("state"));
        //*将审核数据保存，不然按按批准不会有任何作用
        gameService.save(game, new User());
        return "redirect:/ssm/game/list";
    }

    /**
     * 上传
     */
    @RequestMapping(value = "/index")
    public ModelAndView index(GameVo game, HttpServletRequest request, HttpServletResponse response) {
        // ModelAndView构造方法可以指定返回的页面名称-gamePage
        ModelAndView mv = new ModelAndView("gameIndex");
        // 通过调取service获取管理信息列表
        User user = (User) request.getSession().getAttribute("currentUser");
        //获取上传用户的id Createid=id
        game.setCreateid(user.getId());
        //*将数据打包起来
        List<Game> datalist = gameService.findList(game);
        //datalist用于展示上传模组页面的数据展示
        mv.addObject("datalist", datalist).addObject("param", game);
        // 让该ModelAndView返回Spring MVC框架去处理
        return mv;
    }
}