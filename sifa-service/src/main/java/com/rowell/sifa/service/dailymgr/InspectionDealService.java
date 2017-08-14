
/**    
* @Title: InspectionService.java  
* @Package com.rowell.sifa.service.dailymgr  
* @Description: TODO(用一句话描述该文件做什么)  
* @author pkx  
* @date 2017年4月6日  
* @version V1.0    
*/

package com.rowell.sifa.service.dailymgr;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.DateUtils;
import com.rowell.sifa.mapper.dailymgr.InspectionDealMapper;
import com.rowell.sifa.pojo.dailymgr.Inspection;
import com.rowell.sifa.pojo.dailymgr.InspectionDeal;
import com.rowell.sifa.pojo.dailymgr.InspectionSub;
import com.rowell.sifa.pojo.sys.IfaceRecord;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.sys.IfaceRecordService;

/**
 * @ClassName: InspectionService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author pkx
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class InspectionDealService extends CrudService<InspectionDealMapper, InspectionDeal> {
	@Autowired
	private IfaceRecordService ifaceRecordService;
	@Autowired
	private InspectionService inspectionService;
	@Autowired
	private InspectionSubService inspectionSubService;
	
	@Transactional(readOnly = false)
	public void updateDeal(List<InspectionDeal> inspectionDealList){
		try {
			//日常报到
			
			//
			InspectionSub inspectionSub = inspectionSubService.findById(inspectionDealList.get(0).getInspectionSubId());
			Inspection inspection = inspectionService.findById(inspectionSub.getInspectionId());
			
			IfaceRecord ifaceRecord = new IfaceRecord();
			ifaceRecord.setCheckTime(new Date());
			ifaceRecord.setDealStatus(0);
			ifaceRecord.setSearchStartDate(inspection.getCheckStartTime());		//排除早到的
			int realCount = 0;
			int lateCount = 0;
			int disCount = 0;
			
			
			for (InspectionDeal inspectionDeal : inspectionDealList) {
				ifaceRecord.setCulpritId(inspectionDeal.getCulpritId());
				List<IfaceRecord> ifaceList = ifaceRecordService.findAll(ifaceRecord);	//获取考勤记录
				if (ifaceList.size() > 0) {
					IfaceRecord record = ifaceList.get(0);
					if (DateUtils.compareDate(inspection.getCheckStartTime(), record.getCheckTime()) && 
							DateUtils.compareDate(record.getCheckTime(), inspection.getCheckEndTime())) {		//按时
						inspectionDeal.setDicCheckStatusKey("1520002");
						inspectionDeal.setDicIsRegisterKey("1");
						realCount ++;
					}
					else if (!DateUtils.compareDate(record.getCheckTime(), inspection.getCheckEndTime())) {	//迟到
						inspectionDeal.setDicCheckStatusKey("1520003");
						inspectionDeal.setDicIsRegisterKey("1");
						inspectionDeal.setDicIsLateKey("1");
						lateCount ++;
					}
					record.setDealStatus(1);
					ifaceRecordService.updateByIdSelective(record);		//更新考勤对象记录
				}
				else {																							//未到
					inspectionDeal.setDicCheckStatusKey("1520004");
					inspectionDeal.setDicIsRegisterKey("0");
					disCount ++;
				}
				super.updateByIdSelective(inspectionDeal);				//更新集中点验司法所抽查对象记录
			}
			
			inspectionSub.setRealCount(realCount + lateCount);
			inspectionSub.setLateCount(lateCount);
			inspectionSub.setDisCount(disCount);
			inspectionSubService.updateByIdSelective(inspectionSub);	//更新集中点验记录分表(储存每个司法所对应的记录)
			
			if (inspection.getRealCount() == null) {
				inspection.setRealCount(realCount);
			} 
			else inspection.setRealCount(inspection.getRealCount() + realCount);
			if (inspection.getLateCount() == null) {
				inspection.setLateCount(lateCount);
			}
			else inspection.setLateCount(inspection.getLateCount() + lateCount);
			if (inspection.getDisCount() == null) {
				inspection.setDisCount(disCount);
			}
			else inspection.setDisCount(inspection.getDisCount() + disCount);
			inspectionService.updateByIdSelective(inspection);			//更新集中点验记录总表
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
