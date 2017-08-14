package com.rowell.sifa.service.dailymgr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.mapper.dailymgr.TalkMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.SpecialArea;
import com.rowell.sifa.pojo.dailymgr.Talk;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.SysGroupService;

@Service
@Transactional(readOnly = true)
public class TalkService extends CrudService<TalkMapper, Talk> {
	@Autowired
	CulpritService culpritService;
	@Autowired
	SysGroupService sysGroupService;
	@Autowired
	private AreaService areaService;
	public Talk addCulpritToTalk(Talk talk){
		if(!StringUtils.isBlank(talk.getCulpritId())){
			Culprit clist=culpritService.findById(talk.getCulpritId());
			String s =clist.getGroupId();
			SysGroup s1=sysGroupService.findById(s);
			talk.setGroupName(s1.getName());
			talk.setCulpritName(clist.getName());
		}
		return talk;
	}
	
	//对申请区域的数据处理
		@Transactional(readOnly = false)
		public Talk Areaformate(Talk talk){
			String areaProName="";
			String areaCityName="";
			String areaCountryName="";
			String areaStreet="";
			String areaDetail="";
			String area=talk.getPlace();
			String[] falg=area.split(",");
			if(falg[0]!=null&&StringUtils.isNumber(falg[0])&&areaService.findById(falg[0])!=null){//判断省份是否为数字
				areaProName=areaService.findById(falg[0]).getAreaName();
			}else{
				areaProName=falg[0];
			}
			talk.setAddressPro(falg[0]);
			
			if(falg[1]!=null&&StringUtils.isNumber(falg[1])&&areaService.findById(falg[1])!=null){//判断市是否为数字
				areaCityName=areaService.findById(falg[1]).getAreaName();
			}else{
				areaCityName=falg[1];
			}
			talk.setAddressCity(falg[1]);
			
			if(falg[2]!=null&&StringUtils.isNumber(falg[2])&&areaService.findById(falg[2])!=null){//判断县是否为数字
				areaCountryName=areaService.findById(falg[2]).getAreaName();
			}else{
				areaCountryName=falg[2];
			}	
			talk.setAddressCountry(falg[2]);
			if(falg.length>3){
				areaStreet=falg[3];
			}
			if(falg.length>4){
				areaDetail=falg[4];
			}
			talk.setAddressStreet(areaStreet);
			talk.setAddressDetail(areaDetail);
			area=areaProName+areaCityName+areaCountryName+areaStreet+areaDetail;
			talk.setPlace(area);
			return talk;
		}
	
	
	
}

