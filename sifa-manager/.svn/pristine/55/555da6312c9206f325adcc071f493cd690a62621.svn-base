package com.rowell.sifa.service.homepage;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.homepage.ExaminationAndApprovalMapper;
import com.rowell.sifa.pojo.endcorrect.Detached;
import com.rowell.sifa.pojo.homepage.ExaminationAndApproval;
import com.rowell.sifa.service.base.CrudService;

/**
 * @ClassName: ExaminationAndApprovalService
 * @Description: 待审批事项
 * @author yxb
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class ExaminationAndApprovalService extends CrudService<ExaminationAndApprovalMapper, ExaminationAndApproval> {
	//启动流程时插入数据
	public void insertProcess(String recordId,String culpritId,String ProcessId,String type) {
		ExaminationAndApproval examinationAndApproval=new ExaminationAndApproval();
		String groupName = SysAccountUtils.getSysAccount().getGroupName();
		examinationAndApproval.setTaskDate(new Date());
		examinationAndApproval.setRecordId(recordId);
		examinationAndApproval.setJudicialOffices(groupName);
		examinationAndApproval.setCulpritId(culpritId);
		examinationAndApproval.setProcessInstanceId(ProcessId);
		examinationAndApproval.setType(type);
		this.insert(examinationAndApproval);
	}
	
}
