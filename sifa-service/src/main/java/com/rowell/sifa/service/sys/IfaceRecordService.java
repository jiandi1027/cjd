  
    /**    
    * @Title: IfaceRecordService.java  
    * @Package com.rowell.sifa.service.sys  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.sys.IfaceRecordMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.IfaceRecord;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.dailymgr.AskLeaveService;
import com.rowell.sifa.service.dailymgr.DailyReportLastService;
import com.rowell.sifa.service.dailymgr.InspectionService;

/**  
    * @ClassName: IfaceRecordService  
    * @Description: 考勤机记录表service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class IfaceRecordService extends CrudService<IfaceRecordMapper, IfaceRecord> {
	@Autowired
	private DailyReportLastService dailyReportLastService;
	@Autowired
	private AskLeaveService askLeaveService;
	@Autowired
	private InspectionService inspectionService;
	
	public void ifaceRecordJob(){
		IfaceRecord ifaceRecord=new IfaceRecord();
		ifaceRecord.setDealStatus(0);
		List<IfaceRecord> IfaceRecordList=dao.selectAll(ifaceRecord);
		if(IfaceRecordList!=null){
			for(IfaceRecord ifaceRecordTemp:IfaceRecordList){
				Culprit culprit=new Culprit();
				culprit.setId(ifaceRecordTemp.getCulpritId());
				culprit.setReportDate(ifaceRecordTemp.getCheckTime());
				if(askLeaveService.xj(culprit)==0){
					dailyReportLastService.save(culprit);
					inspectionService.saveInspectionRecord(culprit);
				}
				ifaceRecordTemp.setDealStatus(1);
				dao.updateByPrimaryKey(ifaceRecordTemp);
			}
		}
	}

}
