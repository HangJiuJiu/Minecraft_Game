package com.ssm.service;

import com.ssm.bean.Game;
import com.ssm.bean.GameVo;
import com.ssm.bean.User;
import com.ssm.mapper.MaterialMapper;
import com.ssm.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Pone
 * @date 2022/6/14 19:58
 */
@Service
public class MaterialService {
    @Autowired
    private MaterialMapper materialMapper;

    // 通过id获取Game
    public Game get(String id) {
        return materialMapper.get(id);
    }

    // 通过参数获取Game列表
    public List<Game> findList(GameVo game) {
        return materialMapper.findList(game);
    }

    public int save(Game game, User user) {
        if (game.getId() == null || game.getId() == 0) {
            // 当id为空时，操作为新增，获取唯一标识id
            game.setCreateid(user.getId());
            game.setCreatename(user.getName());
            game.setCreatetime(DateUtils.getDateTime());
            return materialMapper.insert(game);
        } else {
            // 当id不为空是，操作为修改
            return materialMapper.update(game);
        }
    }

    public int delete(String id) {
        return materialMapper.delete(id);
    }

    public int countAll() {
        return materialMapper.countAll();
    }
}
