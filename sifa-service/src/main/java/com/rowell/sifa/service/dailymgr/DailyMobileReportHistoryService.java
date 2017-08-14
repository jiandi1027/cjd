
/**    
* @Title: DailyMobileReportHistoryService.java  
* @Package com.rowell.sifa.service.dailymgr  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年2月28日  
* @version V1.0    
*/

package com.rowell.sifa.service.dailymgr;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.dailymgr.DailyMobileReportHistoryMapper;
import com.rowell.sifa.pojo.dailymgr.DailyMobileReportHistory;
import com.rowell.sifa.service.base.CrudService;

/**
 * @ClassName: DailyMobileReportHistoryService
 * @Description: 电话报到历史记录service
 * @author xiaoguang
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class DailyMobileReportHistoryService extends CrudService<DailyMobileReportHistoryMapper, DailyMobileReportHistory> {
	
}
