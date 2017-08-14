
    /**    
    * @Title: CulpritLawService.java  
    * @Package com.rowell.sifa.service.culpritinfo  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.culpritinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.druid.sql.visitor.functions.Insert;
import com.rowell.common.utils.DateUtils;
import com.rowell.sifa.mapper.culpritinfo.CulpritLawMapper;
import com.rowell.sifa.mapper.culpritinfo.CulpritSupervisorMapper;
import com.rowell.sifa.mapper.culpritinfo.CulpritUpdateInfoMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.pojo.culpritinfo.CulpritSupervisor;
import com.rowell.sifa.pojo.culpritinfo.CulpritUpdateInfo;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.sys.utils.SysDicUtils;

/**
 * 
    * @ClassName: CulpritUpdateInfoService  
    * @Description: 存储矫正信息更新记录  
    * @author dell  
    * @date 2017年4月18日  
    *
 */
@Service
@Transactional(readOnly = true)
public class CulpritUpdateInfoService extends CrudService<CulpritUpdateInfoMapper, CulpritUpdateInfo> {
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private CulpritLawService culpritLawService;
	//假如空属性赋值
	private	static String NULLATTRIBUT ="空";
	
	public void saveCulpritUpdateInfo (Culprit culprit,CulpritJudgment culpritJudgment,CulpritLaw culpritLaw,SysAccount sysAccount){
		
		String updateInfo = "补录数据更新对象基本信息接收对象："+ culprit.getName()+ "，修改人："+sysAccount.getAccountname()+  "；";
		
		Culprit old=culpritService.findById(culprit.getId());
		//判断是否存在刑罚信息	(存在为true)
		boolean isJudg = false;
		boolean isLaw =false;
		CulpritJudgment oldCulpritJudgment =new CulpritJudgment();
		
		CulpritLaw oldCulpritLaw=new CulpritLaw();
		oldCulpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> oldCulpritLawList=culpritLawService.findAll(oldCulpritLaw);
		if(oldCulpritLawList.size()>0){
			isLaw=true;
			oldCulpritLaw=oldCulpritLawList.get(0);
		}
		
		if(old.getCulpritJudgment()!=null){
			isJudg = true;
			oldCulpritJudgment=old.getCulpritJudgment();
		}
		
		if(culprit.getGroupId()!=null&&culprit.getGroupId()!=""){
			if(!culprit.getGroupId().equals(old.getGroupId())){
				updateInfo +="修改部门信息，原司法所："+old.getGroupName()+ "；";				
			}
		}
		if(culprit.getImage()!=null&&culprit.getImage()!=""){
			if(!culprit.getImage().equals(old.getImage())){
				updateInfo += "修改头像信息；";
			}
		}
		if(culprit.getHomePlace()!=null&&culprit.getHomePlace()!=""){
			if(!culprit.getHomePlace().equals(old.getHomePlace())){
				updateInfo += "修改出生地信息，原值："+old.getHomePlace()+ "；";
			}
		}
		if(culprit.getDicWhcdKey()!=null&&culprit.getDicWhcdKey()!=""){
			if(!culprit.getDicWhcdKey().equals(old.getDicWhcdKey())){
				String whcd=SysDicUtils.getSysDicValueByKey("common_table", "whcd", old.getDicWhcdKey(), "");
				updateInfo += "修改文化程度，原值："+whcd+ "；";
			}
		}
		if(culprit.getDicHyzkKey()!=null&&culprit.getDicHyzkKey()!=""){
			if(!culprit.getDicHyzkKey().equals(old.getDicHyzkKey())){
				String hyzk=SysDicUtils.getSysDicValueByKey("common_table", "hyzk", old.getDicHyzkKey(), "");
				updateInfo += "修改婚姻状况信息，原值:"+hyzk+ "；";
			}
		}
		if(culprit.getContactPhone()!=null&&culprit.getContactPhone()!=""){
			if(!culprit.getContactPhone().equals(old.getContactPhone())){
				updateInfo += "修改联系电话，原值:"+old.getContactPhone()+ "；";
			}
		}
		if(culprit.getIdentification()!=null&&culprit.getIdentification()!=""){
			if(!culprit.getIdentification().equals(old.getIdentification())){
				updateInfo += "修改身份证信息，原值："+old.getIdentification()+ "；";
			}
		}
		if(culprit.getDicHklxKey()!=null&&culprit.getDicHklxKey()!=""){
			if(!culprit.getDicHklxKey().equals(old.getDicHklxKey())){
				String hklx=SysDicUtils.getSysDicValueByKey("common_table", "hklx",old.getDicHklxKey(), "");
				updateInfo += "修改户籍性质，原值："+hklx+"；";
			}
		}
		if(culprit.getOrigin()!=null&&culprit.getOrigin()!=""){
			if(!culprit.getOrigin().equals(old.getOrigin())){
				updateInfo += "修改籍贯，原值："+old.getOrigin()+ "；";
			}
		}
		if(culprit.getNation()!=null&&culprit.getNation()!=""){
			if(!culprit.getNation().equals(old.getNation())){
				String nation=SysDicUtils.getSysDicValueByKey("common_table", "nation",old.getNation(), "");
				updateInfo += "修改民族，原值："+nation+"；";
			}
		}
		if(culprit.getBirthday()!=null){
			if(culprit.getBirthday().compareTo(old.getBirthday())!=0){
				updateInfo += "修改出生日期，原值："+old.getBirthday()+ "；";
			}	
		}
		if(culprit.getJobPhone()!=null && culprit.getJobPhone()!=""){
			if(!culprit.getJobPhone().equals(old.getJobPhone())){
				updateInfo += "修改单位联系号码，原值："+old.getJobPhone()+ "；";
			}
		}
		if(culprit.getAddress()!=null && culprit.getAddress()!=""){
			if(!culprit.getAddress().equals(old.getAddress())){
				updateInfo += "修改固定居住地明细，原值："+old.getAddress()+ "；";
			}
		}
		if(culprit.getRegResidence()!=null && culprit.getRegResidence()!=""){
			if(!culprit.getRegResidence().equals(old.getRegResidence())){
				updateInfo += "修改户口所在地，原值："+old.getAddress()+ "；";
			}
		}
		
//		if(culprit.getDicPenalTypeKey()!=null&&culprit.getDicPenalTypeKey()!=""){
//			String penalType=SysDicUtils.getSysDicValueByKey("sf_investigate", "entrust_type_id",old.getDicPenalTypeKey(), "");
//			updateInfo += "修改刑罚执行类别,原值:"+penalType+";";
//		}
		if(culpritJudgment.getDicPenalTypeKey()!=null&&culpritJudgment.getDicPenalTypeKey()!=""){
			if(isJudg){
				if(oldCulpritJudgment.getDicPenalTypeKey()!=null){
					if(!culpritJudgment.getDicPenalTypeKey().equals(oldCulpritJudgment.getDicPenalTypeKey())){
						updateInfo += "修改刑罚执行类别，原值："+oldCulpritJudgment.getDicPenalTypeKey()+"；";
					}
				}
			}else{
				updateInfo += "修改刑罚执行类别，原值：空"+"；";
			}

		}
		if(culpritJudgment.getAdjudgeOrg()!=null&&culpritJudgment.getAdjudgeOrg()!=""){
			if(isJudg){
				if(oldCulpritJudgment.getAdjudgeOrg()!=null){
					if(!culpritJudgment.getAdjudgeOrg().equals(oldCulpritJudgment.getAdjudgeOrg())){
						updateInfo += "修改判决机关，原值："+oldCulpritJudgment.getAdjudgeOrg()+"；";
					}
				}
			}else{
				updateInfo += "修改判决机关，原值：空"+"；";
			}

		}
		if(culpritLaw.getCheckOrg()!=null&&culpritLaw.getCheckOrg()!=""){
			if(isLaw){
				if(oldCulpritLaw.getCheckOrg()!=null){
					if(!culpritLaw.getCheckOrg().equals(oldCulpritLaw.getCheckOrg())){
						updateInfo += "修改检查机关，原值："+oldCulpritLaw.getCheckOrg()+"；";
					}
				}
			}else{
				updateInfo += "修改检查机关，原值：空"+"；";
			}
		}
		if(culpritJudgment.getDicYpxfKey()!=null&&culpritJudgment.getDicYpxfKey()!=""){
			if(isJudg){
				if(oldCulpritJudgment.getDicYpxfKey()!=null){
					if(!culpritJudgment.getDicYpxfKey().equals(oldCulpritJudgment.getDicYpxfKey())){
						String ypxf=SysDicUtils.getSysDicValueByKey("culpritJudgment", "dicYpxfKey",oldCulpritJudgment.getDicYpxfKey(), "");
						updateInfo += "修改原判刑罚类型，原值："+ypxf+"；";
					}
				}
			}else{
				updateInfo += "修改原判刑罚类型，原值：空"+"；";
			}

		}
		if(culpritJudgment.getAdjudgeEndTime()!=null){
			if(isJudg){
				if(oldCulpritJudgment.getAdjudgeEndTime()!=null){
					if(culpritJudgment.getAdjudgeEndTime().compareTo(oldCulpritJudgment.getAdjudgeEndTime())!=0){
						updateInfo += "修改刑期结束时间，原值："+oldCulpritJudgment.getAdjudgeEndTime()+"；";
					}
				}
			}else{
				updateInfo += "修改刑期结束时间，原值：空"+"；";
			}

		}
		if(culpritJudgment.getAdjudgeRedressOrg()!=null&&culpritJudgment.getAdjudgeRedressOrg()!=""){
			if(isJudg){
				if(oldCulpritJudgment.getAdjudgeRedressOrg()!=null){
					if(!culpritJudgment.getAdjudgeRedressOrg().equals(oldCulpritJudgment.getAdjudgeRedressOrg())){
						updateInfo += "修改社矫决定机关，原值："+oldCulpritJudgment.getAdjudgeRedressOrg()+"；";
					}
				}
			}else{
				updateInfo += "修改社矫决定机关，原值：空"+"；";
			}

		}
		if(culpritJudgment.getRedressStartDate()!=null){
			if(isJudg){
				if(oldCulpritJudgment.getRedressStartDate()!=null){
					if(culpritJudgment.getRedressStartDate().compareTo(oldCulpritJudgment.getRedressStartDate())!=0){
						updateInfo += "修改矫正开始时间，原值:"+oldCulpritJudgment.getRedressStartDate()+";";
					}
				}
			}else{
				updateInfo += "修改矫正开始时间，原值：空"+"；";
			}

		}
		if(culpritJudgment.getRedressPeriod()!=null&&culpritJudgment.getRedressPeriod()!=""){
			if(isJudg){
				if(oldCulpritJudgment.getRedressPeriod()!=null){
					if(!culpritJudgment.getRedressPeriod().equals(oldCulpritJudgment.getRedressPeriod())){
						updateInfo += "修改矫正期限，原值："+oldCulpritJudgment.getRedressPeriod()+"；";
					}
				}
			}else{
				updateInfo += "修改矫正期限，原值：空"+"；";
			}

		}
		if(culpritLaw.getDicWslxKey()!=null&&culpritLaw.getDicWslxKey()!=""){
			if(isLaw){
				if(oldCulpritLaw.getDicWslxKey()!=null){
					if(!culpritLaw.getDicWslxKey().equals(oldCulpritLaw.getDicWslxKey())){
						String wslx=SysDicUtils.getSysDicValueByKey("sf_culpritLaw", "dicWslxKey",oldCulpritLaw.getDicWslxKey(), "");
						updateInfo += "修改法律文书类型，原值："+oldCulpritLaw.getDicWslxKey()+"；";
					}
				}
			}else{
				updateInfo += "修改法律文书类型，原值：空；";
			}
		}

		/*if(!(old.getAddressProId()!=null?old.getAddressProId():NULLATTRIBUT).equals(culprit.getAddressProId())
				||!(old.getAddressCityId()!=null?old.getAddressCityId():NULLATTRIBUT).equals(culprit.getAddressCityId())
				||!(old.getAddressCountryId()!=null?old.getAddressCountryId():NULLATTRIBUT).equals(culprit.getAddressCountryId())
				||!(old.getAddressStreet()!=null?old.getAddressStreet():NULLATTRIBUT).equals(culprit.getAddressStreet())
				||!(old.getAddressDetail()!=null?old.getAddressDetail():NULLATTRIBUT).equals(culprit.getAddressDetail())){
			updateInfo += "修改家庭住址信息，原值："+old.getAddressPro()+old.getAddressCity()+old.getAddressCountry()
												 +old.getAddressStreet()+old.getAddressDetail();	
		}
		if(!(old.getRegResidenceProId()!=null?old.getRegResidenceProId():NULLATTRIBUT).equals(culprit.getRegResidenceProId())
				||!(old.getRegResidenceCityId()!=null?old.getRegResidenceCityId():NULLATTRIBUT).equals(culprit.getRegResidenceCityId())
				||!(old.getRegResidenceCountryId()!=null?old.getRegResidenceCountryId():NULLATTRIBUT).equals(culprit.getRegResidenceCountryId())
				||!(old.getRegResidenceStreet()!=null?old.getRegResidenceStreet():NULLATTRIBUT).equals(culprit.getRegResidenceStreet())
				||!(old.getRegResidenceDetail()!=null?old.getRegResidenceDetail():NULLATTRIBUT).equals(culprit.getRegResidenceDetail())){
			updateInfo += "修改户籍信息，原值："+old.getRegResidencePro()+old.getRegResidenceCity()+old.getRegResidenceCountry()
											 +old.getRegResidenceStreet()+old.getRegResidenceDetail();	
		}*/
		if(culpritJudgment.getRedressStartDate()!=null){
			if(isJudg){
				if(oldCulpritJudgment.getRedressStartDate()!=null){
					if(culpritJudgment.getRedressStartDate().compareTo(oldCulpritJudgment.getRedressStartDate())!=0){
						updateInfo += "修改矫正开始时间，原值："+oldCulpritJudgment.getRedressStartDate()+"；";
					}
				}	
			}else{
				updateInfo += "修改矫正开始时间，原值：空"+"；";
			}

		}
		CulpritUpdateInfo culpritUpdateInfo = new CulpritUpdateInfo();
		culpritUpdateInfo.setCulpritId(culprit.getId());
		culpritUpdateInfo.setUpdateInfo(updateInfo);
		culpritUpdateInfo.setGroupId(culprit.getGroupId());
		culpritUpdateInfo.setNote("补录数据更新对象基本信息接收对象："+culprit.getName()+",id："+culprit.getId());
		insert(culpritUpdateInfo);
		
	}
}

