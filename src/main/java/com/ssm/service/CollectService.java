package com.ssm.service;

import com.ssm.bean.Collect;
import com.ssm.mapper.CollectMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * 我的收藏Service
 */
@Service
public class CollectService {

    @Autowired
    private CollectMapper collectMapper;

    // 通过id获取Collect
    public Collect get(String id) {
        return collectMapper.get(id);
    }

    // 通过参数获取Collect列表
    public List<Collect> findList(Collect collect) {
        // 调用Dao层 方法 执行SQL操作
        return collectMapper.findList(collect);
    }

    public int save(Collect collect) {
        if (StringUtils.isBlank(collect.getId())) {
            // 当收藏类的id为空时，操作为新增，获取唯一标识id
            collect.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
            return collectMapper.insert(collect);
        } else {
            // 当id不为空是，操作为修改
            return collectMapper.update(collect);
        }
    }

    public int delete(String id) {
        return collectMapper.delete(id);
    }

}