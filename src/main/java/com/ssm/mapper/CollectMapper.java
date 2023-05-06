package com.ssm.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ssm.bean.Collect;

/**
 * 我的收藏DAO接口
 */
public interface CollectMapper {

	public Collect get(@Param("id") String id);
	
	public List<Collect> findList(@Param("collect") Collect entity);
	
	public int insert(Collect entity);
	
	public int update(Collect entity);
	
	public int delete(@Param("id") String id);
	
}