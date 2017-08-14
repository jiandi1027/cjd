package com.rowell.sifa.service.base;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.mapper.CrudDao;
import com.rowell.common.utils.Reflections;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.config.Global;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 * Service基类
 * @author marcle
 * @version 2015-07-8
 */
@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudDao<T>, T extends DataEntity<T>>  {
	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * 持久层对象
	 */
	@Autowired
	protected D dao;
	
	/**
	 * 根据主键删除数据
	 * @param id
	 * @return
	 */
	@Transactional(readOnly = false)
    public int deleteById(String id){
    	return dao.deleteByPrimaryKey(id);
    }
	
	/**
	 * 根据主键删除数据
	 * @param id
	 * @return
	 */
	@Transactional(readOnly = false)
    public int batchDelete(List<String> ids){
		try {
			if(ids!=null && ids.size()>0){
				for(String id:ids){
					dao.deleteByPrimaryKey(id);
				}
				return ids.size();
			}
			return 0;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
    }

    /**
     * 插入数据
     */
	@Transactional(readOnly = false)
    public int insert(T record){
    	Object obj = Reflections.getFieldValue(record, Global.CURRENT_USER);
    	if(obj==null&&SysAccountUtils.getSysAccount()!=null){
    		Reflections.setFieldValue(record, Global.CURRENT_USER, SysAccountUtils.getSysAccount());
    		
    	}
    	
    	record.preInsert();
    	return dao.insert(record);
    }

    /**
 	 *选择性的插入数据
     */
	@Transactional(readOnly = false)
    public int insertSelective(T record){
    	Object obj = Reflections.getFieldValue(record, Global.CURRENT_USER);
    	if(obj==null){
    		if(SysAccountUtils.getSysAccount()!=null){
    			Reflections.setFieldValue(record, Global.CURRENT_USER, SysAccountUtils.getSysAccount());
    		}
    		
    	}
    	record.preInsert();	
    	return dao.insertSelective(record);
    }

    /**
     *根据主键获取数据
     *
     */
    public T findById(String id){
    	return dao.selectByPrimaryKey(id);
    }
    /***
     * 根据实体对象条件进行查询
     * @param record
     * @return
     */
    public List<T> findAll(T record){
    	return dao.selectAll(record);
    }

    /**
     * 根据主键选择性的更新数据
     *
     */
    @Transactional(readOnly = false)
    public int updateByIdSelective(T record){
    	Object obj = Reflections.getFieldValue(record, Global.CURRENT_USER);
    	if(obj==null){
    		Reflections.setFieldValue(record, Global.CURRENT_USER, SysAccountUtils.getSysAccount());
    	}
    	record.preUpdate();
    	return dao.updateByPrimaryKeySelective(record);
    }

    /**
     * 根据主键更新数据
     *
     */
    @Transactional(readOnly = false)
    public int updateById(T record){
    	Object obj = Reflections.getFieldValue(record, Global.CURRENT_USER);
    	if(obj==null){
    		Reflections.setFieldValue(record, Global.CURRENT_USER, SysAccountUtils.getSysAccount());
    	}
    	
    	record.preUpdate();
    	return dao.updateByPrimaryKey(record);
    }
    
    @Transactional(readOnly = false)
	public int saveOrUpdate(T record){
		if(StringUtils.isBlank(record.getId())){

			return insert(record);
		}else{
			return updateById(record);
		}
		
	}
	
}
