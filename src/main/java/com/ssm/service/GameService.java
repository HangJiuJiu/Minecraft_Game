package com.ssm.service;

import com.ssm.bean.Game;
import com.ssm.bean.GameVo;
import com.ssm.bean.User;
import com.ssm.mapper.GameMapper;
import com.ssm.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 管理信息Service
 */
@Service
public class GameService {

    @Autowired
    private GameMapper gameMapper;

    //查询页数总数据
    public int countAll() {
        return gameMapper.countAll();
    }

    // 根据id获取一条数据
    public Game get(String id) {
        return gameMapper.get(id);
    }

    // 通过参数获取Game列表
    //搜索
    public List<Game> findList(GameVo game) {
        return gameMapper.findList(game);
    }

    //上传/保存
    public int save(Game game, User user) {
        //判断是修改还是添加，如果是添加那么有id值，如果是修改就无
        if (game.getId() == null || game.getId() == 0) {
            // 当id为空时，操作为新增，获取唯一标识id
            game.setCreateid(user.getId());
            game.setCreatename(user.getName());
            game.setCreatetime(DateUtils.getDateTime());
            return gameMapper.insert(game);
        } else {
            // 当id不为空是，操作为修改
            return gameMapper.update(game);
        }
    }

    //删除
    public int delete(String id) {
        return gameMapper.delete(id);
    }

}