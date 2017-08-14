package com.rowell.common.mapper;

import java.util.List;

/**
 * DAO支持类实现
 * 
 * @author marcle
 * @version 2015-07-8
 * @param <T>
 */
public interface CrudDao<T> extends BaseDao {

	/**
	 * 根据主键删除数据
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(String id);
      
    /**
     * 插入数据
     */
    int insert(T record);

    /**
 	 *选择性的插入数据
     */
    int insertSelective(T record);

    /**
     *根据主键获取数据
     *
     */
    T selectByPrimaryKey(String id);
    /***
     * 根据实体对象条件进行查询
     * @param record
     * @return
     */
    List<T> selectAll(T record);

    /**
     * 根据主键选择性的更新数据
     *
     */
    int updateByPrimaryKeySelective(T record);

    /**
     * 根据主键更新数据
     *
     */
    int updateByPrimaryKey(T record);
    /***
     * 批量删除
     * @return
     */
    int batchDelete(T record);

}