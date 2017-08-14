package com.rowell.sifa.service.dailymgr;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.mapper.culpritinfo.CulpritMapper;
import com.rowell.sifa.mapper.dailymgr.WorkFreeCulpritMapper;
import com.rowell.sifa.mapper.dailymgr.WorkfreeMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.Study;
import com.rowell.sifa.pojo.dailymgr.StudyCulprit;
import com.rowell.sifa.pojo.dailymgr.WorkFreeCulprit;
import com.rowell.sifa.pojo.dailymgr.Workfree;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class WorkfreeService extends CrudService<WorkfreeMapper, Workfree> {
	@Autowired
	private WorkfreeMapper workfreeMapper;
	@Autowired
	private WorkFreeCulpritMapper workfreeCulpritMapper;
	@Autowired
	private WorkfreeCulpritService workfreeCulpritService;
	@Autowired
	private CulpritMapper culpritMapper;
	
	/**
	 * 获取社区服务以及相关人员的表现
	 * @param id
	 * @param sysAccount
	 * @return
	 */
	public Workfree findById(String id,SysAccount sysAccount){
		Workfree workfree=null;
		List<String> workfreeCulpritIdList=new ArrayList<String>();
		if(!StringUtils.isBlank(id)){
			workfree=super.findById(id);
			WorkFreeCulprit workfreeCulprit=new WorkFreeCulprit();
			workfreeCulprit.setWorkfreeId(id);
			
			//优秀表现的对象列表
			workfreeCulprit.setDicStatusKey(Constants.WORKFREE_CULPRIT_STATUS_EXCELLENT);
			workfree.setExcellentList(workfreeCulpritService.findAll(workfreeCulprit));
			workfree.setExcellents(setWorkfreeCulprit(workfreeCulprit,workfree.getExcellentList(),workfreeCulpritIdList));
			
			//良好表现的对象列表
			workfreeCulprit.setDicStatusKey(Constants.WORKFREE_CULPRIT_STATUS_GOOD);
			workfree.setGoodList(workfreeCulpritService.findAll(workfreeCulprit));
			workfree.setGoods(setWorkfreeCulprit(workfreeCulprit,workfree.getGoodList(),workfreeCulpritIdList));
			
			//一般表现的对象列表
			workfreeCulprit.setDicStatusKey(Constants.WORKFREE_CULPRIT_STATUS_COMMONLY);
			workfree.setCommonlyList(workfreeCulpritService.findAll(workfreeCulprit));
			workfree.setCommonlys(setWorkfreeCulprit(workfreeCulprit,workfree.getCommonlyList(),workfreeCulpritIdList));
			
			//差表现的对象列表
			workfreeCulprit.setDicStatusKey(Constants.WORKFREE_CULPRIT_STATUS_DIFFERENCE);
			workfree.setDifferenceList(workfreeCulpritService.findAll(workfreeCulprit));
			workfree.setDifferences(setWorkfreeCulprit(workfreeCulprit,workfree.getDifferenceList(),workfreeCulpritIdList));
		}else{
			workfree=new Workfree();
		}
		
		List<Culprit> culpritList=culpritMapper.findCulpritBySysAccount(sysAccount.getGroupId());
		
		//没有选择的对象列表
		List<Culprit> newCulpritList=new ArrayList<Culprit>();
		if(culpritList!=null&&!culpritList.isEmpty()){
			if(workfreeCulpritIdList!=null&&!workfreeCulpritIdList.isEmpty()){
				for(Culprit culprit:culpritList){
					if(!workfreeCulpritIdList.contains(culprit.getId())){
						newCulpritList.add(culprit);
					}
				}
			}else{
				newCulpritList.addAll(culpritList);
			}
			
		}
		
		workfree.setCulpritList(newCulpritList);
		return workfree;
	}
	
	
	public Workfree findStudy(String id){
		if(!StringUtils.isBlank(id)){
			Workfree workfree=super.findById(id);
			WorkFreeCulprit workfreeCulprit=new WorkFreeCulprit();
			workfreeCulprit.setWorkfreeId(id);
			List<WorkFreeCulprit> workfreeCulpritList=workfreeCulpritService.findAll(workfreeCulprit);
			if(workfreeCulpritList!=null&&!workfreeCulpritList.isEmpty()&&workfreeCulpritList.get(0)!=null){
				workfreeCulprit=(WorkFreeCulprit)workfreeCulpritList.get(0);
				workfree.setCulpritId(workfreeCulprit.getCulpritId());
				workfree.setStatusId(workfreeCulprit.getDicStatusKey());
			}
			return workfree;
		}else{
			return new Workfree();
		}
		
	}
	
	//获取各表现，并存入字符串
	private String setWorkfreeCulprit(WorkFreeCulprit workfreeCulprit,List<WorkFreeCulprit> culpritList,List<String> culpritIdList){
		String culprits="";
		if(culpritList!=null&&!culpritList.isEmpty()){
			for(WorkFreeCulprit culprit:culpritList){
				culprits=culprits+","+culprit.getCulpritId();
				culpritIdList.add(culprit.getCulpritId());
			}
		}
		return culprits;
	}
	
	public void save(Workfree workfree,SysAccount sysAccount ){
		this.saveOrUpdate(workfree);
		//删除该学习教育所有对象的表现
		workfreeCulpritMapper.deleteByWordfeenId(workfree.getId());
		
		if("1".equals(workfree.getWorkfreeType())){
			//保存优秀的表现
			if(!StringUtils.isBlank(workfree.getExcellents())){
				String[] status=workfree.getExcellents().split(",");
				for(String excellent:status){
					if(!StringUtils.isBlank(excellent)){
						WorkFreeCulprit workfreeCulprit=new WorkFreeCulprit();
						workfreeCulprit.setWorkfreeId(workfree.getId());
						workfreeCulprit.setDicStatusKey(Constants.WORKFREE_CULPRIT_STATUS_EXCELLENT);
						workfreeCulprit.setCulpritId(excellent);
						workfreeCulprit.setCurrentSysUser(sysAccount);
						workfreeCulpritService.insert(workfreeCulprit);
					}
				}
			}
			
			//保存良好的表现
			if(!StringUtils.isBlank(workfree.getGoods())){
				String[] status=workfree.getGoods().split(",");
				for(String good:status){
					if(!StringUtils.isBlank(good)){
						WorkFreeCulprit workfreeCulprit=new WorkFreeCulprit();
						workfreeCulprit.setWorkfreeId(workfree.getId());
						workfreeCulprit.setDicStatusKey(Constants.WORKFREE_CULPRIT_STATUS_GOOD);
						workfreeCulprit.setCulpritId(good);
						workfreeCulprit.setCurrentSysUser(sysAccount);
						workfreeCulpritService.insert(workfreeCulprit);
					}
				}
			}
			
			//保存一般的表现
			if(!StringUtils.isBlank(workfree.getCommonlys())){
				String[] status=workfree.getCommonlys().split(",");
				for(String commonly:status){
					if(!StringUtils.isBlank(commonly)){
						WorkFreeCulprit workfreeCulprit=new WorkFreeCulprit();
						workfreeCulprit.setWorkfreeId(workfree.getId());
						workfreeCulprit.setDicStatusKey(Constants.WORKFREE_CULPRIT_STATUS_COMMONLY);
						workfreeCulprit.setCulpritId(commonly);
						workfreeCulprit.setCurrentSysUser(sysAccount);
						workfreeCulpritService.insert(workfreeCulprit);
					}
				}
			}
			
			//保存差的表现
			if(!StringUtils.isBlank(workfree.getDifferences())){
				String[] status=workfree.getDifferences().split(",");
				for(String difference:status){
					if(!StringUtils.isBlank(difference)){
						WorkFreeCulprit workfreeCulprit=new WorkFreeCulprit();
						workfreeCulprit.setWorkfreeId(workfree.getId());
						workfreeCulprit.setDicStatusKey(Constants.WORKFREE_CULPRIT_STATUS_DIFFERENCE);
						workfreeCulprit.setCulpritId(difference);
						workfreeCulprit.setCurrentSysUser(sysAccount);
						workfreeCulpritService.insert(workfreeCulprit);
					}
				}
			}
		}
		
		if("2".equals(workfree.getWorkfreeType())){
			if(workfree.getCulpritId()!=null&&workfree.getStatusId()!=null){
				WorkFreeCulprit workfreeCulprit=new WorkFreeCulprit();
				workfreeCulprit.setWorkfreeId(workfree.getId());
				workfreeCulprit.setDicStatusKey(workfree.getStatusId());
				workfreeCulprit.setCulpritId(workfree.getCulpritId());
				workfreeCulprit.setCurrentSysUser(sysAccount);
				workfreeCulpritService.insert(workfreeCulprit);
			}
		}
		
	}
	
	
}
	
	