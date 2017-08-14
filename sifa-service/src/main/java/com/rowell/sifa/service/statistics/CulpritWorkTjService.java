package com.rowell.sifa.service.statistics;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.mapper.statistics.CulpritWorkTjMapper;
import com.rowell.sifa.pojo.statistics.CulpritWorkTj;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.sys.SysGroupService;
/**
 * 
    * @ClassName: CulpritWorkTjService  
    * @Description:  社区矫正统计报表（季表）
    * @author DELL  
    * @date 2017年4月13日  
    *
 */
@Service
@Transactional(readOnly = true)
public class CulpritWorkTjService extends CrudService<CulpritWorkTjMapper,CulpritWorkTj>  {
	@Autowired
	private SysGroupService sysGroupService;
	@Autowired
	private CulpritWorkTjMapper culpritWorkTjMapper;
	
	public List<CulpritWorkTj>findChildTj(CulpritWorkTj culpritWorkTj){
		//找出所有子部门
		String groupId=culpritWorkTj.getGroupId();
		SysGroup sysGroup=new SysGroup();  
		sysGroup.setParentId(groupId);
		List<SysGroup> childGroups=sysGroupService.findAll(sysGroup);
		List<CulpritWorkTj> childList=new ArrayList<CulpritWorkTj>();
		CulpritWorkTj c=new CulpritWorkTj();
		Integer sfsgzryzs=0;
		Integer sfxzbz=0;
		Integer dfxzbz=0;
		Integer sybz=0;
		Integer pyry=0;
		Integer allPersons=0;
		Integer outPersons=0;
		if(childGroups.size()>0){
			for(SysGroup childGroup:childGroups){
				c=culpritWorkTjMapper.selectByGroupId(childGroup.getId(),culpritWorkTj.getYear(),culpritWorkTj.getJd());
					if("91801".equals(c.getDicState())||"91804".equals(c.getDicState())){//删选已上报的部门
						sfsgzryzs+=c.getSfsgzryzs();
						sfxzbz+=c.getSfxzbz();
						dfxzbz+=c.getDfxzbz();
						sybz+=c.getSybz();
						pyry+=c.getPyry();
						allPersons+=c.getAllPersons();
						outPersons+=c.getOutPersons();
					}
				childList.add(c);
			}
			if(culpritWorkTj.getAllPersons()==0){//若总人数空，则执行运算
				culpritWorkTj.setSfsgzryzs(sfsgzryzs);
				culpritWorkTj.setSfxzbz(sfxzbz);
				culpritWorkTj.setDfxzbz(dfxzbz);
				culpritWorkTj.setSybz(sybz);
				culpritWorkTj.setPyry(pyry);
				culpritWorkTj.setAllPersons(allPersons);
				culpritWorkTj.setOutPersons(outPersons);
			}
		}
		
		return childList;
		
	}
	
	

	public void timerInsert(){
		Calendar c = Calendar.getInstance();
		int month = c.get(Calendar.MONTH) + 1;
		if(month>=1&&month<=3){//当前月份是1月，则为4季度
			c.set(Calendar.YEAR,c.get(Calendar.YEAR)-1);
			c.set(Calendar.MONTH, 3);
		}else if(month>=4&&month<=6){
			c.set(Calendar.MONTH, 0);
		}else if(month>=7&&month<=9){
			c.set(Calendar.MONTH, 1);
		}else if(month>=10&&month<=12){
			c.set(Calendar.MONTH, 2);
		}
        Date reportDate =c.getTime();
        //防止重复生成数据
        CulpritWorkTj culpritWorkTj1=new CulpritWorkTj();
        //统计年份
		culpritWorkTj1.setYear(c.get(Calendar.YEAR)+"");
		//统计季度
		culpritWorkTj1.setJd((c.get(Calendar.MONTH))+1+"");
		List<CulpritWorkTj>list1=findAll(culpritWorkTj1);
		if(list1.size()>0){
			return;
		}
		List<SysGroup>list=sysGroupService.findAll(new SysGroup());
		CulpritWorkTj culpritWorkTj=new CulpritWorkTj();
		for(SysGroup sysGroup:list){
			String groupId=sysGroup.getId();
				culpritWorkTj.setGroupId(groupId);
				culpritWorkTj.setDicState("91802");//未上报
				culpritWorkTj.setCurrentSysUser(new SysAccount());
				//统计年月
				culpritWorkTj.setReportDate(reportDate);
				//统计年份
				culpritWorkTj.setYear(c.get(Calendar.YEAR)+"");
				//统计季度
				culpritWorkTj.setJd((c.get(Calendar.MONTH))+1+"");
				//司法所工作人员编制统计
				List<Map<String, String>> rybzList=culpritWorkTjMapper.getRybzCount(groupId);
				if(rybzList!=null){
					Map<String, String> rybzMap=rybzList.get(0);
					Object obj1=rybzMap.get("TOTALCOUNT");
					Object obj2=rybzMap.get("SFXZBZ");
					Object obj3=rybzMap.get("DFXZBZ");
					Object obj4=rybzMap.get("SYBZ");
					Object obj5=rybzMap.get("PYRY");
					Integer sfsgzryzs=Integer.parseInt(obj1.toString());
					Integer sfxzbz=Integer.parseInt(obj2.toString());
					Integer dfxzbz=Integer.parseInt(obj3.toString());
					Integer sybz=Integer.parseInt(obj4.toString());
					Integer pyry=Integer.parseInt(obj5.toString());
					culpritWorkTj.setSfsgzryzs(sfsgzryzs);
					culpritWorkTj.setSfxzbz(sfxzbz);
					culpritWorkTj.setDfxzbz(dfxzbz);
					culpritWorkTj.setSybz(sybz);
					culpritWorkTj.setPyry(pyry);
				}
				int allPersons=culpritWorkTjMapper.getAllCulprits(groupId);//矫正对象总人数
				culpritWorkTj.setAllPersons(allPersons);
				
				//未销假
				String dicStatusKey1=Constants.ASKLEAVE_STATUS_WXJ;
				int wxj= culpritWorkTjMapper.getAskLeave(groupId, dicStatusKey1,new Date());
				//已销假
				String dicStatusKey2=Constants.ASKLEAVE_STATUS_YXJ;
				int yxj=culpritWorkTjMapper.getAskLeave(groupId, dicStatusKey2,new Date());
				if(yxj>=0){
					culpritWorkTj.setNote(yxj+"人已销假");
				}
				
				int outPersons=wxj+yxj;//外出人数
				culpritWorkTj.setOutPersons(outPersons);
				this.insert(culpritWorkTj);//自动插入CulpritWorkTj对象
			}
		System.out.println(month+"月工作人员季表插入完毕");
			
	}
	
	//市局完成统计更新所有部门的报表状态
	public void updateDicStatusById(CulpritWorkTj culpritWorkTj){
		this.updateById(culpritWorkTj);
		List<SysGroup> groups=sysGroupService.findAll(new SysGroup());//获取所有部门
		CulpritWorkTj c=new CulpritWorkTj();
		for(SysGroup group:groups){
			c=culpritWorkTjMapper.selectByGroupId(group.getId(),culpritWorkTj.getYear(),culpritWorkTj.getJd());
			c.setDicState("91804");//报表状态更改为完成统计
			culpritWorkTjMapper.updateByPrimaryKeySelective(c);
		}
	}

}









