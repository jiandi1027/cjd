
/**    
* @Title: CallCheckService.java  
* @Package com.rowell.sifa.service.dailymgr  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年2月28日  
* @version V1.0    
*/

package com.rowell.sifa.service.dailymgr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.dailymgr.CallCheckMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.CallCheck;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;

/**
 * @ClassName: CallCheckService
 * @Description: 声纹认证service
 * @author xiaoguang
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class CallCheckService extends CrudService<CallCheckMapper, CallCheck> {
	@Autowired
	private CulpritService culpritService;
	
	/**
	 * 添加声纹抽查信息
	 * @param operateid
	 * @param telno
	 * @param fileurl
	 * @param dicRegisterId
	 * @param dicCheckStateId
	 */
	public void addCheck(String operateid, String telno, String fileurl, String dicRegisterId, String dicCheckStateId){
		CallCheck callCheck = new CallCheck();
		callCheck.setLogicId(operateid);
		callCheck.setCallee(telno);
		callCheck.setFilepath(fileurl);
		callCheck.setDicRegisterId(dicRegisterId);
		callCheck.setDicCheckStateId(dicCheckStateId);
		
		Culprit culprit = new Culprit();
		culprit.setMobileNumber(telno);
		List<Culprit> list = culpritService.findAll(culprit);
		if (list.size() > 0) {
			Culprit record = list.get(0);
			callCheck.setCulpritId(record.getId());
		}
		
		super.insert(callCheck);
	}
}
