package com.rowell.sifa.service.dailymgr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.mapper.dailymgr.InterviewMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.Interview;
import com.rowell.sifa.pojo.dailymgr.Talk;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.SysGroupService;

@Service
@Transactional(readOnly = true)
public class InterviewService extends CrudService<InterviewMapper, Interview> {
	@Autowired
	private AreaService areaService;
	
	@Autowired
	CulpritService culpritService;
	@Autowired
	SysGroupService sysGroupService;
	public Interview addCulpritToInterview(Interview interview){
		if(!StringUtils.isBlank(interview.getCulpritId())){
			Culprit clist=culpritService.findById(interview.getCulpritId());
			String s =clist.getGroupId();
			SysGroup s1=sysGroupService.findById(s);
			interview.setGroupName(s1.getName());
			interview.setCulpritName(clist.getName());
		}
		return interview;
	}
	
	//对申请区域的数据处理
	@Transactional(readOnly = false)
	public Interview Areaformate(Interview interview){
		String areaProName="";
		String areaCityName="";
		String areaCountryName="";
		String areaStreet="";
		String areaDetail="";
		String area=interview.getInterviewPlace();
		String[] falg=area.split(",");
		if(StringUtils.isNumber(falg[0])){//判断省份是否为数字
			areaProName=areaService.findById(falg[0]).getAreaName();
		}else{
			areaProName=falg[0];
		}
		interview.setAddressPro(falg[0]);
		
		if(StringUtils.isNumber(falg[1])){//判断市是否为数字
			areaCityName=areaService.findById(falg[1]).getAreaName();
		}else{
			areaCityName=falg[1];
		}
		interview.setAddressCity(falg[1]);
		
		if(StringUtils.isNumber(falg[2])){//判断县是否为数字
			areaCountryName=areaService.findById(falg[2]).getAreaName();
		}else{
			areaCountryName=falg[2];
		}	
		interview.setAddressCountry(falg[2]);
		if(falg.length>3){
			areaStreet=falg[3];
		}
		if(falg.length>4){
			areaDetail=falg[4];
		}
		interview.setAddressStreet(areaStreet);
		interview.setAddressDetail(areaDetail);
		area=areaProName+areaCityName+areaCountryName+areaStreet+areaDetail;
		interview.setInterviewPlace(area);
		return interview;
	}
	
	
	
	
}
	
	