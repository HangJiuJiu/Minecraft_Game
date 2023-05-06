package com.ssm.mapper;

import com.ssm.bean.Game;
import com.ssm.bean.GameVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Pone
 * @date 2022/6/14 19:59
 */
@Mapper
public interface MaterialMapper {
    public Game get(@Param("id") String id);

    public List<Game> findList(@Param("game") GameVo entity);

    public int insert(Game entity);

    public int update(Game entity);

    public int delete(@Param("id") String id);

    int countAll();
}
