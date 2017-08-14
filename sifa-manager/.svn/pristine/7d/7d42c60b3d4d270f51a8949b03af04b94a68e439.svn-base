  
    /**    
    * @Title: SysDicService.java  
    * @Package com.rowell.sifa.service.sys  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.sys;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.sys.SysDicMapper;
import com.rowell.sifa.mapper.sys.SysGroupMapper;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.sys.utils.SysDicUtils;

/**  
    * @ClassName: SysDicService  
    * @Description: 数据字典service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class SysDicService extends CrudService<SysDicMapper, SysDic> {
	@Autowired
	private SysGroupMapper sysGroupMapper;
	
	
	/**
	 * 获取首页统计的统计项
	 * @return
	 */
	public List<SysDic> getStatisticsSysDicList(){
		List<SysDic> statisticsList=SysDicUtils.getSysDicList("common_table","statisticsType","157000");
		List<SysDic> newStatisticsList=new ArrayList<SysDic>();
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		SysGroup sysGroup=sysGroupMapper.selectByPrimaryKey(sysAccount.getGroupId());
		for(SysDic sysDic:statisticsList){
			if(Constants.STATISTICS_AREA.equals(sysDic.getKey())&&sysGroup.getLevelNo()!=0){
				continue;
			}
			newStatisticsList.add(sysDic);
		}
		return newStatisticsList;
	}

}
