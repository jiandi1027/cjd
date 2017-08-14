  
    /**    
    * @Title: MxCheckService.java  
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

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.mapper.sys.MxCheckMapper;
import com.rowell.sifa.pojo.sys.MxCheck;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: MxCheckService  
    * @Description: 明细评分service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class MxCheckService extends CrudService<MxCheckMapper, MxCheck> {
	
	/**
	 * 添加扣分信息，状态为未启用，信息在流程处理时更换成启用状态
	 * @param check
	 * @param checktype
	 */
	public void saveMore(MxCheck check, String checktype){
		try {
			String reason = check.getDetailReason();
			check.setIsUse(0);
			check.setDelFlag(0);
			check.setDetailReason(null);
			deleteMore(check);
//			List<MxCheck> mxCheckList = super.findAll(check);
//			for (MxCheck record : mxCheckList) {
//				super.deleteById(record.getId());
//			}
			
			if (!StringUtils.isBlank(checktype)) {
				String []checklist = checktype.split(",");
				for (int i = 0; i < checklist.length; i++) {
					MxCheck mxCheck = new MxCheck();
					mxCheck.setIsUse(0);
					mxCheck.setProcessInstanceId(check.getProcessInstanceId());
					mxCheck.setInfoType(check.getInfoType());
					String [] list = checklist[i].split("-");
					if (list.length > 2) {
						mxCheck.setDicChecktypeId(list[0]);
						mxCheck.setAmount(Integer.valueOf(list[1]));
						mxCheck.setDeduction(list[2]);
						if (list[0].equals(Constants.ASSESS_MX_SRZL_QTQK) || list[0].equals(Constants.ASSESS_MX_ZFZL_QTQK)) {
							mxCheck.setDetailReason(reason);
						}
					}
					
					super.insert(mxCheck);
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	/**
	 * 将删除标志改为1
	 * @param check
	 * @param checktype
	 */
	public void deleteFlagMore(MxCheck check){
		try {
			List<MxCheck> mxCheckList = super.findAll(check);
			for (MxCheck record : mxCheckList) {
				record.setDelFlag(1);
				super.updateByIdSelective(record);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	

	/**
	 * 删除
	 * @param check
	 * @param checktype
	 */
	public void deleteMore(MxCheck check){
		try {
			List<MxCheck> mxCheckList = super.findAll(check);
			for (MxCheck record : mxCheckList) {
				super.deleteById(record.getId());
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void updateIsUse(MxCheck mxCheck){
		dao.updateIsUse(mxCheck);
	}
}
