  
    /**    
    * @Title: ImprisonService.java  
    * @Package com.rowell.sifa.service.endcorrect  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月16日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.endcorrect;


import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.mapper.endcorrect.ImprisonMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.endcorrect.Imprison;
import com.rowell.sifa.pojo.rewardspunishment.RevokeOutOfPrison;
import com.rowell.sifa.pojo.rewardspunishment.RevokeParole;
import com.rowell.sifa.pojo.rewardspunishment.RevokeProbation;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;

/**  
    * @ClassName: ImprisonService  
    * @Description:收监执行service
    * @author xiaoguang  
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class ImprisonService extends CrudService<ImprisonMapper, Imprison> {
	@Autowired
	private CulpritService culpritService;
	//自动生成数据(撤销缓刑)
	public void insertRevokeProbation(RevokeProbation record) {
		Imprison imprison=new Imprison();
		imprison.setCulpritId(record.getCulpritId());
		Culprit culprit=culpritService.findById(record.getCulpritId());
		culprit.setDicStatusKey(Constants.CULPRIT_STATUS_CXHX);//矫正类别为撤销缓刑
		culpritService.updateByIdSelective(culprit);
		imprison.setRecordId(record.getId());
		imprison.setApplyDate(record.getCreated());
		imprison.setDicReasonTypeKey(record.getReasonTypeId());
		imprison.setNote(record.getNote());
		imprison.setDetailInfo(record.getDetailInfo());
		imprison.setWritNum(record.getWritNum());
		imprison.setDicImprisonTypeKey("91301");//收监类型
		imprison.setProcessInstanceId(record.getProcessInstanceId());
		imprison.setImprisonDealResult("91406");//处理结果默认为待处理
		imprison.setDicJudgeResultKey("91503");//裁定结果默认为待处理
		imprison.setConcreteFacts(record.getConcreteFacts());
		this.insert(imprison);
	}
	//提请撤销假释
	public void insertRevokeParole(RevokeParole record) {
		Imprison imprison=new Imprison();
		imprison.setCulpritId(record.getCulpritId());
		imprison.setRecordId(record.getId());
		Culprit culprit=culpritService.findById(record.getCulpritId());
		culprit.setDicStatusKey(Constants.CULPRIT_STATUS_CXJS);//矫正类别为撤销假释
		culpritService.updateByIdSelective(culprit);
		imprison.setApplyDate(record.getCreated());
		imprison.setDicReasonTypeKey(record.getDicReasonTypeKey());
		imprison.setNote(record.getNote());
		imprison.setDetailInfo(record.getDetailInfo());
		imprison.setWritNum(record.getWritNum());
		imprison.setDicImprisonTypeKey("91302");
		imprison.setProcessInstanceId(record.getProcessInstanceId());
		imprison.setImprisonDealResult("91406");//处理结果默认为待处理
		imprison.setDicJudgeResultKey("91503");//裁定结果默认为待处理
		imprison.setConcreteFacts(record.getConcreteFacts());
		this.insert(imprison);
		
		
	}
	//提请撤销监外执行
	public void insertRevokeOutOfPrison(RevokeOutOfPrison record) {
		Imprison imprison=new Imprison();
		imprison.setCulpritId(record.getCulpritId());
		imprison.setRecordId(record.getId());
		Culprit culprit=culpritService.findById(record.getCulpritId());
		culprit.setDicStatusKey(Constants.CULPRIT_STATUS_CXJWZX);//矫正类别为撤销监外执行
		culpritService.updateByIdSelective(culprit);
		imprison.setApplyDate(record.getCreated());
		imprison.setDicReasonTypeKey(record.getDicReasonTypeKey());
		imprison.setNote(record.getNote());
		imprison.setDetailInfo(record.getDetailInfo());
		imprison.setWritNum(record.getWritNum());
		imprison.setDicImprisonTypeKey("91303");
		imprison.setProcessInstanceId(record.getProcessInstanceId());
		imprison.setImprisonDealResult("91406");//处理结果默认为待处理
		imprison.setDicJudgeResultKey("91503");//裁定结果默认为待处理
		imprison.setConcreteFacts(record.getFact());
		this.insert(imprison);
		
		
		
	}
}











