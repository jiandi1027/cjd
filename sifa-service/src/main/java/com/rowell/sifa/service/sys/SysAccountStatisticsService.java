  
    /**    
    * @Title: SysDicService.java  
    * @Package com.rowell.sifa.service.sys  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.sys;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.sys.SysAccountStatisticsMapper;
import com.rowell.sifa.mapper.sys.SysDicMapper;
import com.rowell.sifa.pojo.sys.SysAccountStatistics;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: SysDicService  
    * @Description: 数据字典service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class SysAccountStatisticsService extends CrudService<SysAccountStatisticsMapper, SysAccountStatistics> {
	
	/**
	 * 获取用户统计图
	 * @return
	 */
	public SysAccountStatistics getStatistics(){
		SysAccountStatistics sysAccountStatistics=new SysAccountStatistics();
		sysAccountStatistics.setCreater(SysAccountUtils.getSysAccount().getId());
		List<SysAccountStatistics> statisticsList=super.findAll(sysAccountStatistics);
		if(statisticsList!=null&&!statisticsList.isEmpty()&&statisticsList.get(0)!=null){
			return statisticsList.get(0);
		}else{
			initialization();
			statisticsList=super.findAll(sysAccountStatistics);
			return statisticsList.get(0);
		}
	}
	
	/**
	 * 初始化统计图
	 */
	private void initialization(){
		SysAccountStatistics sysAccountStatistics=new SysAccountStatistics();
		sysAccountStatistics.setCurrentSysUser(SysAccountUtils.getSysAccount());
		sysAccountStatistics.setCreater(SysAccountUtils.getSysAccount().getId());
		sysAccountStatistics.setStatistics1(Constants.STATISTICS_MONTH_STATUS);
		sysAccountStatistics.setStatistics2(Constants.STATISTICS_FZLX);
		sysAccountStatistics.setStatistics3(Constants.STATISTICS_JZJCQK);
		sysAccountStatistics.setStatistics4(Constants.STATISTICS_XFZXLB);
		super.insert(sysAccountStatistics);
	}
	
	/**
	 * 更新用户统计图
	 * @param statisticsType
	 * @param count
	 */
	public void updateStatistics(String statisticsType,String count){
		SysAccountStatistics sysAccountStatistics=new SysAccountStatistics();
		sysAccountStatistics.setCreater(SysAccountUtils.getSysAccount().getId());
		List<SysAccountStatistics> statisticsList=super.findAll(sysAccountStatistics);
		if(statisticsList!=null&&!statisticsList.isEmpty()&&statisticsList.get(0)!=null){
			sysAccountStatistics=(SysAccountStatistics)statisticsList.get(0);
			if("1".equals(count)){
				sysAccountStatistics.setStatistics1(statisticsType);
	    	}
			if("2".equals(count)){
				sysAccountStatistics.setStatistics2(statisticsType);		
			}
			if("3".equals(count)){
				sysAccountStatistics.setStatistics3(statisticsType);	
			}
			if("4".equals(count)){
				sysAccountStatistics.setStatistics4(statisticsType);	
	    	}
			dao.updateByPrimaryKey(sysAccountStatistics);
		}
		
		
	}

}
