package com.rowell.sifa.service.dailymgr;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.mapper.culpritinfo.CulpritMapper;
import com.rowell.sifa.mapper.dailymgr.StudyCulpritMapper;
import com.rowell.sifa.mapper.dailymgr.StudyMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.Study;
import com.rowell.sifa.pojo.dailymgr.StudyCulprit;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class StudyService extends CrudService<StudyMapper, Study> {
	@Autowired
	private StudyCulpritMapper studyCulpritMapper;
	@Autowired
	private StudyCulpritService studyCulpritService;
	@Autowired
	private CulpritMapper culpritMapper;
	
	/**
	 * 获取学习教育以及相关人员的表现
	 * @param id
	 * @param sysAccount
	 * @return
	 */
	public Study findById(String id,SysAccount sysAccount){
		Study study=null;
		List<String> studyCulpritIdList=new ArrayList<String>();
		if(!StringUtils.isBlank(id)){
			study=super.findById(id);
			StudyCulprit studyCulprit=new StudyCulprit();
			studyCulprit.setGroupstudyId(id);
			
			//优秀表现的对象列表
			studyCulprit.setStatusId(Constants.STUDY_CULPRIT_STATUS_EXCELLENT);
			study.setExcellentList(studyCulpritService.findAll(studyCulprit));
			study.setExcellents(setStudyCulprit(studyCulprit,study.getExcellentList(),studyCulpritIdList));
			
			//良好表现的对象列表
			studyCulprit.setStatusId(Constants.STUDY_CULPRIT_STATUS_GOOD);
			study.setGoodList(studyCulpritService.findAll(studyCulprit));
			study.setGoods(setStudyCulprit(studyCulprit,study.getGoodList(),studyCulpritIdList));
			
			//一般表现的对象列表
			studyCulprit.setStatusId(Constants.STUDY_CULPRIT_STATUS_COMMONLY);
			study.setCommonlyList(studyCulpritService.findAll(studyCulprit));
			study.setCommonlys(setStudyCulprit(studyCulprit,study.getCommonlyList(),studyCulpritIdList));
			
			//差表现的对象列表
			studyCulprit.setStatusId(Constants.STUDY_CULPRIT_STATUS_DIFFERENCE);
			study.setDifferenceList(studyCulpritService.findAll(studyCulprit));
			study.setDifferences(setStudyCulprit(studyCulprit,study.getDifferenceList(),studyCulpritIdList));
		}else{
			study=new Study();
		}
		
		List<Culprit> culpritList=culpritMapper.findCulpritBySysAccount(sysAccount.getGroupId());
		
		//没有选择的对象列表
		List<Culprit> newCulpritList=new ArrayList<Culprit>();
		if(culpritList!=null&&!culpritList.isEmpty()){
			if(studyCulpritIdList!=null&&!studyCulpritIdList.isEmpty()){
				for(Culprit culprit:culpritList){
					if(!studyCulpritIdList.contains(culprit.getId())){
						newCulpritList.add(culprit);
					}
				}
			}else{
				newCulpritList.addAll(culpritList);
			}
			
		}
		
		study.setCulpritList(newCulpritList);
		return study;
	}
	
	public Study findStudy(String id){
		if(!StringUtils.isBlank(id)){
			Study study=super.findById(id);
			StudyCulprit studyCulprit=new StudyCulprit();
			studyCulprit.setGroupstudyId(id);
			List<StudyCulprit> studyCulpritList=studyCulpritService.findAll(studyCulprit);
			if(studyCulpritList!=null&&!studyCulpritList.isEmpty()&&studyCulpritList.get(0)!=null){
				studyCulprit=(StudyCulprit)studyCulpritList.get(0);
				study.setCulpritId(studyCulprit.getCulpritId());
				study.setStatusId(studyCulprit.getStatusId());
			}
			return study;
		}else{
			return new Study();
		}
		
	}
	
	//获取各表现，并存入字符串
	private String setStudyCulprit(StudyCulprit studyCulprit,List<StudyCulprit> culpritList,List<String> culpritIdList){
		String culprits="";
		if(culpritList!=null&&!culpritList.isEmpty()){
			for(StudyCulprit culprit:culpritList){
				culprits=culprits+","+culprit.getCulpritId();
				culpritIdList.add(culprit.getCulpritId());
			}
		}
		return culprits;
	}
	
	public void save(Study study,SysAccount sysAccount ){
		this.saveOrUpdate(study);
		//删除该学习教育所有对象的表现
		studyCulpritMapper.deleteByGroupstudyId(study.getId());
		
		
		
		if("1".equals(study.getStudyType())){
			//保存优秀的表现
			if(!StringUtils.isBlank(study.getExcellents())){
				String[] status=study.getExcellents().split(",");
				for(String excellent:status){
					if(!StringUtils.isBlank(excellent)){
						StudyCulprit studyCulprit=new StudyCulprit();
						studyCulprit.setGroupstudyId(study.getId());
						studyCulprit.setStatusId(Constants.STUDY_CULPRIT_STATUS_EXCELLENT);
						studyCulprit.setCulpritId(excellent);
						studyCulprit.setCurrentSysUser(sysAccount);
						studyCulpritService.insert(studyCulprit);
					}
				}
			}
			
			//保存良好的表现
			if(!StringUtils.isBlank(study.getGoods())){
				String[] status=study.getGoods().split(",");
				for(String good:status){
					if(!StringUtils.isBlank(good)){
						StudyCulprit studyCulprit=new StudyCulprit();
						studyCulprit.setGroupstudyId(study.getId());
						studyCulprit.setStatusId(Constants.STUDY_CULPRIT_STATUS_GOOD);
						studyCulprit.setCulpritId(good);
						studyCulprit.setCurrentSysUser(sysAccount);
						studyCulpritService.insert(studyCulprit);
					}
				}
			}
			
			//保存一般的表现
			if(!StringUtils.isBlank(study.getCommonlys())){
				String[] status=study.getCommonlys().split(",");
				for(String commonly:status){
					if(!StringUtils.isBlank(commonly)){
						StudyCulprit studyCulprit=new StudyCulprit();
						studyCulprit.setGroupstudyId(study.getId());
						studyCulprit.setStatusId(Constants.STUDY_CULPRIT_STATUS_COMMONLY);
						studyCulprit.setCulpritId(commonly);
						studyCulprit.setCurrentSysUser(sysAccount);
						studyCulpritService.insert(studyCulprit);
					}
				}
			}
			
			//保存差的表现
			if(!StringUtils.isBlank(study.getDifferences())){
				String[] status=study.getDifferences().split(",");
				for(String difference:status){
					if(!StringUtils.isBlank(difference)){
						StudyCulprit studyCulprit=new StudyCulprit();
						studyCulprit.setGroupstudyId(study.getId());
						studyCulprit.setStatusId(Constants.STUDY_CULPRIT_STATUS_DIFFERENCE);
						studyCulprit.setCulpritId(difference);
						studyCulprit.setCurrentSysUser(sysAccount);
						studyCulpritService.insert(studyCulprit);
					}
				}
			}
		}
		
		if("2".equals(study.getStudyType())){
			if(study.getCulpritId()!=null&&study.getStatusId()!=null){
				StudyCulprit studyCulprit=new StudyCulprit();
				studyCulprit.setGroupstudyId(study.getId());
				studyCulprit.setStatusId(study.getStatusId());
				studyCulprit.setCulpritId(study.getCulpritId());
				studyCulprit.setCurrentSysUser(sysAccount);
				studyCulpritService.insert(studyCulprit);
			}
		}
		
	}
	
	
}
	
	