
/**    
* @Title: InspectionService.java  
* @Package com.rowell.sifa.service.dailymgr  
* @Description: TODO(用一句话描述该文件做什么)  
* @author pkx  
* @date 2017年4月6日  
* @version V1.0    
*/

package com.rowell.sifa.service.dailymgr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.dailymgr.InspectionDealMapper;
import com.rowell.sifa.mapper.dailymgr.InspectionMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.Inspection;
import com.rowell.sifa.pojo.dailymgr.InspectionDeal;
import com.rowell.sifa.pojo.dailymgr.InspectionSub;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.sys.SysGroupService;

/**
 * @ClassName: InspectionService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author pkx
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class InspectionService extends CrudService<InspectionMapper, Inspection> {
	@Autowired
	private SysGroupService sysGroupService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private InspectionSubService inspectionSubService;
	@Autowired
	private InspectionDealService inspectionDealService;
	@Autowired
	private InspectionDealMapper inspectionDealMapper;

	@Override
	@Transactional(readOnly = false)
	public int insert(Inspection inspection){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
//		if (inspection.getAmount() == null || inspection.getAmount() == 0) {
//			inspection.setAmount(5000);
//		}
		inspection.setCheckGroupId(sysAccount.getGroupId());
//		inspection.setLateCount(0);
//		inspection.setRealCount(0);
//		inspection.setDisCount(0);
		
		String []idStrings = inspection.getGroupidsStr().split(",");
		
		String parentIdString ="";
		for (int i = 0; i < idStrings.length; i++) {
			SysGroup sysGroup = sysGroupService.findById(idStrings[i]);
			if (sysGroup.getLevelNo() == 2) {// 司法所
				String tempIdString = "(" + sysGroup.getParentId() + ")";
				if (parentIdString.indexOf(tempIdString) >= 0) {
					// do nothing
				} else {
					parentIdString += "(" + sysGroup.getParentId() + "),";
				}
			} else if (sysGroup.getLevelNo() == 1) {// 县局
				parentIdString += "(" + sysGroup.getId() + "),";
				
			}
		}
		if (!StringUtils.isBlank(parentIdString)) {
			parentIdString = parentIdString.substring(0, parentIdString.length() - 1);
		}
		inspection.setGroupidsStrXj(parentIdString);
		int result = super.insert(inspection);
		
		//分表inspectionSub记录
		int amountCount = 0;	//总人数
		for (int i = 0; i < idStrings.length; i++) {
			InspectionSub inspectionSub = new InspectionSub();
			inspectionSub.setInspectionId(inspection.getId());
			inspectionSub.setGroupId(idStrings[i]);
//			inspectionSub.setLateCount(0);
//			inspectionSub.setRealCount(0);
//			inspectionSub.setDisCount(0);
			
			Culprit culprit = new Culprit();
			culprit.setGroupId(idStrings[i]);
			List<Culprit> culpritList = culpritService.findAll(culprit);
			int amount = culpritList.size();
			if (amount > 100 && inspection.getAmount().toString().equals("1")) {	//部分抽查超过100人的按照100人来算
				amount = 100;
			}
			
			List<Culprit> list = culpritService.findByGroupIdAndRandom(idStrings[i], amount +"", inspection.getCheckStartTime(), inspection.getCheckEndTime());
			int amountCountSub = 0;		//sub 人数
			inspectionSubService.insert(inspectionSub);
			String inspectionSubId = inspectionSub.getId();
			for (int j = 0; j < list.size(); j++) {
				Culprit cul = list.get(j);
				String culpritId = cul.getId();
				/**
				 * 生成司法所记录对应的每个需要报道的矫正对象的记录
				 */
				InspectionDeal inspectionDeal = new InspectionDeal();
				inspectionDeal.setCulpritId(culpritId);
				inspectionDeal.setInspectionSubId(inspectionSubId);
				inspectionDeal.setDicCheckStatusKey("0");

//				// 判断该人员是否处于请假期间
//				if (askLeaveService.findIsAskLeave(culpritId, inspection.getCheckTime()).size() > 0) {
//					// 不管
//				} else {
				inspectionDealService.insert(inspectionDeal);
				amountCountSub++;
//				}
			}
			amountCount += amountCountSub;
			inspectionSub.setAmount(amountCountSub);
			inspectionSubService.updateByIdSelective(inspectionSub);
			
		}
		inspection.setAmount(amountCount);
		super.updateByIdSelective(inspection);
		
		return result;
	}
	
	public void saveInspectionRecord(Culprit culprit){
		InspectionDeal inspectionDeal=new InspectionDeal();
		inspectionDeal.setCulpritId(culprit.getId());
		inspectionDeal.setDicCheckStatusKey("0");
		List<InspectionDeal> inspectionDealList=inspectionDealMapper.selectAll(inspectionDeal);
		if(inspectionDealList!=null){
			for(InspectionDeal inspectionDealTemp:inspectionDealList){
				if(inspectionDealTemp.getCheckStartTime()!=null&&inspectionDealTemp.getCheckEndTime()!=null){
					if(culprit.getReportDate().getTime()>=inspectionDealTemp.getCheckStartTime().getTime()&&culprit.getReportDate().getTime()<=inspectionDealTemp.getCheckStartTime().getTime()){
						inspectionDealTemp.setDicCheckStatusKey("1");
					}else if(culprit.getReportDate().getTime()>inspectionDealTemp.getCheckEndTime().getTime()){
						inspectionDealTemp.setDicCheckStatusKey("2");
					}
				}
				
				inspectionDealMapper.updateByPrimaryKey(inspectionDealTemp);
			}
		}
		
		
	}
}
