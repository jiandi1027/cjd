  
    /**    
    * @Title: CulpritService.java  
    * @Package com.rowell.sifa.service.culpritinfo  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.culpritinfo;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EasyUITreeNode;
import com.rowell.common.pojo.echarts.EchartsJsonResult;
import com.rowell.common.pojo.echarts.LineEchartsJsonResult;
import com.rowell.common.utils.DateUtils;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SpringContextHolder;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.culpritinfo.CulpritMapper;
import com.rowell.sifa.mapper.dailymgr.AskLeaveMapper;
import com.rowell.sifa.mapper.endcorrect.DeathMapper;
import com.rowell.sifa.mapper.endcorrect.FinishRedressMapper;
import com.rowell.sifa.mapper.endcorrect.ImprisonMapper;
import com.rowell.sifa.mapper.endcorrect.OutOfMapper;
import com.rowell.sifa.mapper.endcorrect.RecidivismMapper;
import com.rowell.sifa.mapper.rewardspunishment.RevokeParoleMapper;
import com.rowell.sifa.mapper.rewardspunishment.RevokeProbationMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.endcorrect.Death;
import com.rowell.sifa.pojo.endcorrect.FinishRedress;
import com.rowell.sifa.pojo.endcorrect.Imprison;
import com.rowell.sifa.pojo.endcorrect.OutOf;
import com.rowell.sifa.pojo.endcorrect.Recidivism;
import com.rowell.sifa.pojo.inculprit.ExitEntryReport;
import com.rowell.sifa.pojo.inculprit.MoveIn;
import com.rowell.sifa.pojo.investigate.Investigate;
import com.rowell.sifa.pojo.rewardspunishment.RevokeParole;
import com.rowell.sifa.pojo.rewardspunishment.RevokeProbation;
import com.rowell.sifa.pojo.sys.Area;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.inculprit.ExitEntryReportService;
import com.rowell.sifa.service.inculprit.MoveInService;
import com.rowell.sifa.service.investigate.InvestigateService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.SysFileService;

/**  
    * @ClassName: CulpritService  
    * @Description: TODO矫正对象service层 
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class CulpritService extends CrudService<CulpritMapper, Culprit> {
	@Autowired
   	private AskLeaveMapper askLeaveMapper;
	@Autowired
   	private FinishRedressMapper finishRedressMapper;
	@Autowired
   	private OutOfMapper outOfMapper;
	@Autowired
   	private RevokeProbationMapper revokeProbationMapper;
	@Autowired
   	private RevokeParoleMapper revokeParoleMapper;
	@Autowired
   	private ImprisonMapper imprisonMapper;
	@Autowired
   	private DeathMapper deathMapper;
	@Autowired
	private InvestigateService investigateService;
	@Autowired
	private MoveInService moveInService;
	@Autowired
	private CulpritJudgmentService culpritJudgmentService;
	@Autowired
	private CulpritLawService culpritLawService;
	@Autowired
   	private RecidivismMapper recidivismMapper;
	@Autowired
	private AreaService areaService;
	@Autowired
	private CulpritSupervisorService culpritSupervisorService;
	@Autowired
	private ExitEntryReportService exitEntryReportService;
	@Autowired
	private CulpritUpdateInfoService culpritUpdateInfoService;
	@Autowired
	private SysFileService sysFileService;
	@Transactional(readOnly = false)
	public CommonJsonResult saveCulprit(Culprit culprit,CulpritJudgment culpritJudgment,CulpritLaw culpritLaw,String flag,List<SysFile> fileList1,List<SysFile> fileList2) {
		CommonJsonResult commonJsonResult = null;
		Area regResidencePro=areaService.findById(culprit.getRegResidenceProId());
		Area regResidenceCity=areaService.findById(culprit.getRegResidenceCityId());
		Area regResidenceCountry=areaService.findById(culprit.getRegResidenceCountryId());
		if(regResidencePro!=null && regResidenceCity!=null && regResidenceCountry!=null){
			if(culprit.getRegResidenceStreet()==null){
				culprit.setRegResidenceStreet("");
			}
			if(culprit.getRegResidenceDetail()==null){
				culprit.setRegResidenceDetail("");
			}
			String regResidence=regResidencePro.getAreaName()+regResidenceCity.getAreaName()
					+regResidenceCountry.getAreaName()+culprit.getRegResidenceStreet()+culprit.getRegResidenceDetail();
			culprit.setRegResidence(regResidence);
			
		}
		//固定居住详细
		Area addressPro=areaService.findById(culprit.getAddressProId());
		Area addressCity=areaService.findById(culprit.getAddressCityId());
		Area addressCountry=areaService.findById(culprit.getAddressCountryId());
		if(addressPro!=null && addressCity!=null && addressCountry!=null){
			if(culprit.getRegResidenceStreet()==null){
				culprit.setRegResidenceStreet("");
			}
			if(culprit.getRegResidenceDetail()==null){
				culprit.setRegResidenceDetail("");
			}
			String address=addressPro.getAreaName()+addressCity.getAreaName()
					+addressCountry.getAreaName()+culprit.getAddressStreet()+culprit.getAddressDetail();
			culprit.setAddress(address);
		}
		if("1".equals(culprit.getDicReportInfoKey())){
			culprit.setDicReportTypeKey("");
		}
		if (StringUtils.isBlank(culprit.getId())) {
			culprit.setFinshInfo(0);
			this.saveOrUpdate(culprit);
			String id=culprit.getId();
			culpritJudgment.setCulpritId(id);
			culpritJudgment.setId(null);
			String adjudgeRedressOrg=culpritJudgment.getAdjudgeRedressOrg();
			if(adjudgeRedressOrg.endsWith("法院")){
				culpritJudgment.setDicAdjudgeRedressOrgKey("85001");
			}else if(adjudgeRedressOrg.endsWith("公安")){
				culpritJudgment.setDicAdjudgeRedressOrgKey("85004");
			}else if(adjudgeRedressOrg.endsWith("监狱")){
				culpritJudgment.setDicAdjudgeRedressOrgKey("85002");
			}else if(adjudgeRedressOrg.endsWith("检察院")){
				culpritJudgment.setDicAdjudgeRedressOrgKey("85003");
			}
			culpritJudgmentService.saveOrUpdate(culpritJudgment);

			culpritLaw.setCulpritId(id);
			culpritLaw.setId(null);
			culpritLawService.saveOrUpdate(culpritLaw);
			
			//出入境报备增加数据
			ExitEntryReport exitEntryReport=new ExitEntryReport();
			exitEntryReport.setCulpritId(id);
			exitEntryReport.setGroupId(culprit.getGroupId());
			exitEntryReport.setDicBbztKey("61001");//报备中
			exitEntryReport.setDicIsCollectKey("0");//未收缴
			exitEntryReport.setFillStartDate(culprit.getCreated());//报备开始时间
			//报备结束时间为首次报到截至时间+1天
			if(culpritJudgment.getLimitDate()!=null){
				Calendar c = Calendar.getInstance();
				c.setTime(culpritJudgment.getLimitDate());
				c.add(Calendar.DAY_OF_MONTH,1);
				Date date=c.getTime();
				exitEntryReport.setFillEndDate(date);
			}
			exitEntryReportService.saveOrUpdate(exitEntryReport);
			
			commonJsonResult = CommonJsonResult.build(200, "保存成功！");
		} else {
			SysAccount sysAccount=SysAccountUtils.getSysAccount();
			if(flag==null){
				culpritUpdateInfoService.saveCulpritUpdateInfo(culprit, culpritJudgment, culpritLaw, sysAccount);
			}
			this.updateByIdSelective(culprit);
			
			String adjudgeRedressOrg=culpritJudgment.getAdjudgeRedressOrg();
			if(!StringUtils.isBlank(adjudgeRedressOrg)){
				if(adjudgeRedressOrg.endsWith("法院")){
					culpritJudgment.setDicAdjudgeRedressOrgKey("85001");
				}else if(adjudgeRedressOrg.endsWith("公安")){
					culpritJudgment.setDicAdjudgeRedressOrgKey("85004");
				}else if(adjudgeRedressOrg.endsWith("监狱")){
					culpritJudgment.setDicAdjudgeRedressOrgKey("85002");
				}else if(adjudgeRedressOrg.endsWith("检察院")){
					culpritJudgment.setDicAdjudgeRedressOrgKey("85003");
				}
			}
			CulpritJudgment findJudg = new CulpritJudgment();
			findJudg.setCulpritId(culprit.getId());
			List<CulpritJudgment> judgList=culpritJudgmentService.findAll(findJudg);
			if(judgList.size()>0){
				culpritJudgment.setId(judgList.get(0).getId());
				culpritJudgmentService.updateByIdSelective(culpritJudgment);
			}else{
				String id=culprit.getId();
				culpritJudgment.setCulpritId(id);
				culpritJudgment.setId(null);
				culpritJudgmentService.saveOrUpdate(culpritJudgment);
			}
			CulpritLaw findLaw = new CulpritLaw();
			findLaw.setCulpritId(culprit.getId());
			List<CulpritLaw> lawList=culpritLawService.findAll(findLaw);
			if(lawList.size()>0){
				culpritLaw.setId(lawList.get(0).getId());
				culpritLawService.updateByIdSelective(culpritLaw);
			}else{
				String id=culprit.getId();
				culpritLaw.setCulpritId(id);
				culpritLaw.setId(null);
				culpritLawService.saveOrUpdate(culpritLaw);
			}
			//出入境报备修改数据
			ExitEntryReport findExitEntryReport=new ExitEntryReport();
			findExitEntryReport.setCulpritId(culprit.getId());
			findExitEntryReport.setGroupId(culprit.getGroupId());
			List<ExitEntryReport> exitEntryList=exitEntryReportService.findAll(findExitEntryReport);
			if(exitEntryList.size()>0){
				findExitEntryReport.setFillStartDate(culprit.getCreated());//报备开始时间
				findExitEntryReport.setId(exitEntryList.get(0).getId());
				if(culpritJudgment.getLimitDate()!=null){//报备截止时间
					Calendar c = Calendar.getInstance();
					c.setTime(culpritJudgment.getLimitDate());
					c.add(Calendar.DAY_OF_MONTH,1);
					Date date=c.getTime();
					findExitEntryReport.setFillEndDate(date);
				}
				exitEntryReportService.updateByIdSelective(findExitEntryReport);
			}else{
				findExitEntryReport.setDicBbztKey("61001");//报备中
				findExitEntryReport.setDicIsCollectKey("0");//未收缴
				findExitEntryReport.setFillStartDate(culprit.getCreated());//报备开始时间
				//报备结束时间为首次报到截至时间+1天
				if(culpritJudgment.getLimitDate()!=null){
					Calendar c = Calendar.getInstance();
					c.setTime(culpritJudgment.getLimitDate());
					c.add(Calendar.DAY_OF_MONTH,1);
					Date date=c.getTime();
					findExitEntryReport.setFillEndDate(date);
				}
				exitEntryReportService.saveOrUpdate(findExitEntryReport);
			}
			commonJsonResult = CommonJsonResult.build(200, "修改成功！");
		}
		//保存照片
		sysFileService.saveFiles(fileList1, Constants.FILE_TABLE_CULPRITIMAGE,culprit.getId(), Constants.FILE_CULPRIT_IMAGE_PATH);
		//保存法律文书
		sysFileService.saveFiles(fileList2, Constants.FILE_TABLE_CULPRITlAW, culprit.getId(), Constants.FILE_CULPRITlAW_DOC_PATH);
		return commonJsonResult;
	}
	
	
	
	public List<EasyUITreeNode> findNames() {
		List<EasyUITreeNode> list=dao.findNames();
		return list;
	}
	
	public Integer findNumByGroupId(String groupId){
		return dao.findNumByGroupId(groupId);
	}
	//根据登录账号查询该账号所在部门下所有犯人
	public List<Culprit> findCulpritBySysAccount(String groupId){
		return dao.findCulpritBySysAccount(groupId);
	};
	
	public List<Culprit> findAllWithTerminal(Culprit culprit){
		return dao.selectAllWithTerminal(culprit);
	};
	
	//根据登录账号查询该账号所在部门下所有犯人(含查询功能)
		public List<Culprit> findAllByGroupId(Culprit culprit){
			return dao.selectAllByGroupId(culprit);
		};
	 public String getCulpritNo(int num,String groupId){
		 Calendar a=Calendar.getInstance();
		 a.get(Calendar.YEAR);
		 Integer a1 = num;//转换为包装类Integer
		 int numLength=a1.toString().length();
		 String str=num+"";
		 int idLength = groupId.length();
		 String str2=groupId;
		 while(numLength<4){
			 str="0"+str;
			 numLength++;
		 }
		 while(idLength<4){
			 str2="0"+str2;
			 idLength++;
		 }
		 return a.get(Calendar.YEAR)+str2+str;
	 }
	 
	 public List<Culprit> selectAllSimple(Culprit culprit){
		return  dao.selectAllSimple(culprit);
	 }
	 
	 public List<Map<String,String>> groupBySex(String groupId,String dicStatusKey,Date searchStartDate,Date searchEndDate){
		 return dao.groupBySex(groupId,dicStatusKey,searchStartDate,searchEndDate);
	 }
	 public List<Map<String,String>> groupByAge(String groupId,String dicStatusKey,Date searchStartDate,Date searchEndDate){
		 return dao.groupByAge(groupId,dicStatusKey,searchStartDate,searchEndDate);
	 }

	 public List<Map<String,String>> groupByPenalType(String groupId,String dicStatusKey,Date searchStartDate,Date searchEndDate){
		 return dao.groupByPenalType(groupId,dicStatusKey,searchStartDate,searchEndDate);
	 }
	 
	 public List<Map<String,String>> groupByHklx(String groupId,String dicStatusKey,Date searchStartDate,Date searchEndDate){
		 return dao.groupByHjlx(groupId,dicStatusKey,searchStartDate,searchEndDate);
	 }
	 
	 public List<Map<String,String>> groupByCrimeType(String groupId,String dicStatusKey,Date searchStartDate,Date searchEndDate){
		 return dao.groupByCrimeType(groupId,dicStatusKey,searchStartDate,searchEndDate);
	 }


	 public List<Culprit> findByGroupIdAndRandom(String groupId, String amount, Date checkStartTime, Date checkEndTime){
			return dao.findByGroupIdAndRandom(groupId, amount, checkStartTime, checkEndTime);
		};
		

		/***
		 * 
		    * @Title: selectOnlyCulpritInfo  
		    * @Description: 查询仅返回矫正对象信息
		    * @param @param culprit
		    * @param @return    参数  
		    * @return List<Culprit>    返回类型  
		    * @throws
		 */
		public List<Culprit> selectOnlyCulpritInfo(Culprit culprit){
			return dao.selectOnlyCulpritInfo(culprit);
		}
		
		/**
		 * 按年统计人员
		 * @param culprit
		 * @return
		 */
		public List<Culprit> statisticsCulpritByYear(Culprit culprit){
			return dao.statisticsCulpritByYear(culprit);
		}
			
		/**
		 * 按月统计人员
		 * @param culprit
		 * @return
		 */
		@SuppressWarnings("unchecked")
		public EchartsJsonResult<Integer> statisticsCulpritByMonth(Culprit culprit){
			List<Map<String,Object>> results = dao.statisticsCulpritByMonth(culprit);
			EchartsJsonResult<Integer> echartsJsonResult = new LineEchartsJsonResult();
			echartsJsonResult.fillEchartsJsonResultData(echartsJsonResult, results);
			return echartsJsonResult;
		}
		
		/**
		 * 按刑罚执行类别统计
		 * @return
		 */
		public List<Culprit> statisticsPenalType(Culprit culprit){
			return dao.statisticsPenalType(culprit);
		}
		
		/**
		 * 按犯罪类型统计
		 * @return
		 */
		public List<Culprit> statisticsCrimeType(Culprit culprit){
			return dao.statisticsCrimeType(culprit);
		}
		
		/**
		 * 按户籍情况统计
		 * @return
		 */
		public List<Culprit> statisticsCulpritByHjqk(Culprit culprit){
			return dao.statisticsCulpritByHjqk(culprit);
		}
		
		/**
		 * 按婚姻统计
		 * @return
		 */
		public List<Culprit> statisticsCulpritByHyzk(Culprit culprit){
			return dao.statisticsCulpritByHyzk(culprit);
		}
		
		/**
		 * 按政治面貌统计
		 * @return
		 */
		public List<Culprit> statisticsCulpritByYzzmm(Culprit culprit){
			return dao.statisticsCulpritByYzzmm(culprit);
		}
		
		/**
		 * 按监管等级统计
		 * @return
		 */
		public List<Culprit> statisticsCulpritByMonitorGradeKey(Culprit culprit){
			return dao.statisticsCulpritByMonitorGradeKey(culprit);
		}
		
		/**
		 * 按性别统计
		 * @return
		 */
		public List<Culprit> statisticsCulpritBySex(Culprit culprit){
			return dao.statisticsCulpritBySex(culprit);
		}
		
		/**
		 * 文化程度
		 * @return
		 */
		public List<Culprit> statisticsCulpritByWhcd(Culprit culprit){
			return dao.statisticsCulpritByWhcd(culprit);
		}
		     
		/**
		 * 按地区统计
		 * @return
		 */
		public List<Culprit> statisticsCulpritByArea(Culprit culprit){
			return dao.statisticsCulpritByArea(culprit);
		}
		
		/**
		 * 按矫正对象状态统计
		 * @return
		 */
		public List<Culprit> statisticsCulpritByStatus(Culprit culprit){
			return dao.statisticsCulpritByStatus(culprit);
		}
		
		/**
		 * 30天内需解矫人数
		 * @return
		 */
		public int getFinishCountBy30Day(){
			return dao.getFinishCountBy30Day();
		}
		
		/**
		 * 本月入矫人数
		 * @return
		 */
		public int getStartCountByThisMonth(){
			return dao.getStartCountByThisMonth();
		}
		
		/**
		 * 昨日入娇人数
		 * @return
		 */
		public int getStartCountByYesterday(){
			return dao.getStartCountByYesterday();
		}
		
		/**
		 * 在矫人数
		 * @param culprit
		 * @return
		 */
		public int getCulpritByStatus(Culprit culprit){
			return dao.getCulpritByStatus(culprit);
		}
		
		/**
		 * 按接收方式统计
		 * @return
		 */
		public List<Culprit> statisticsCulpritByJsfs(Culprit culprit){
			return dao.statisticsCulpritByJsfs(culprit);
		}
		
		
		public List<Culprit> statisticsFinishByLastMonth(){
			List<Culprit> culpritList=new ArrayList<Culprit>();
			
			Date searchStartDate=DateUtils.getLastMonthFirstDay();
			Date searchEndDate=DateUtils.getLastMonthLastDay();
			
			long count=0;
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			
			Culprit culprit=new Culprit();
			AskLeave askLeave=new AskLeave();
			askLeave.setGroupId(sysAccount.getGroupId());
			askLeave.setSearchStartDate(searchStartDate);
			askLeave.setSearchEndDate(searchEndDate);
			count=new Long(askLeaveMapper.getCount(askLeave));
			if(count>0){
				culprit.setCount(count);
				culprit.setTypeName("外出请假");
				culpritList.add(culprit);
			}
			
			
			
			culprit=new Culprit();
			FinishRedress finishRedress=new FinishRedress();
			finishRedress.setGroupId(sysAccount.getGroupId());
			finishRedress.setSearchStartDate(searchStartDate);
			finishRedress.setSearchEndDate(searchEndDate);
			count=new Long(finishRedressMapper.getCount(finishRedress));
			if(count>0){
				culprit.setCount(count);
				culprit.setTypeName("期满解矫");
				culpritList.add(culprit);
			}

			
			culprit=new Culprit();
			OutOf outOf=new OutOf();
			outOf.setGroupId(sysAccount.getGroupId());
			outOf.setStarMoveTime(searchStartDate);
			outOf.setEndMoveTime(searchEndDate);
			count=new Long(outOfMapper.getCount(outOf));
			if(count>0){
				culprit.setCount(count);
				culprit.setTypeName("迁居迁出");
				culpritList.add(culprit);
			}

			
			culprit=new Culprit();
			RevokeProbation revokeProbation=new RevokeProbation();
			revokeProbation.setGroupId(sysAccount.getGroupId());
			revokeProbation.setStartCreateDate(searchStartDate);
			revokeProbation.setEndCreateDate(searchEndDate);
			count=new Long(revokeProbationMapper.getCount(revokeProbation));
			if(count>0){
				culprit.setCount(count);
				culprit.setTypeName("撤销缓刑");
				culpritList.add(culprit);
			}

			
			culprit=new Culprit();
			RevokeParole revokeParole=new RevokeParole();
			revokeParole.setGroupId(sysAccount.getGroupId());
			revokeParole.setSearchStartDate(searchStartDate);
			revokeParole.setSearchEndDate(searchEndDate);
			count=new Long(revokeParoleMapper.getCount(revokeParole));
			if(count>0){
				culprit.setCount(count);
				culprit.setTypeName("撤销假释");
				culpritList.add(culprit);
			}
			
			culprit=new Culprit();
			Imprison imprison=new Imprison();
			imprison.setGroupId(sysAccount.getGroupId());
			imprison.setSearchStartDate(searchStartDate);
			imprison.setSearchEndDate(searchEndDate);
			count=new Long(imprisonMapper.getCount(imprison));
			if(count>0){
				culprit.setCount(count);
				culprit.setTypeName("收监执行");
				culpritList.add(culprit);
			}
			
			culprit=new Culprit();
			Death death=new Death();
			death.setGroupId(sysAccount.getGroupId());
			death.setSearchStartDate(searchStartDate);
			death.setSearchEndDate(searchEndDate);
			count=new Long(deathMapper.getCount(death));
			if(count>0){
				culprit.setCount(count);
				culprit.setTypeName("死亡登记");
				culpritList.add(culprit);
			}
			
			culprit=new Culprit();
			Recidivism recidivism=new Recidivism();
			recidivism.setGroupId(sysAccount.getGroupId());
			recidivism.setSearchStartDate(searchStartDate);
			recidivism.setSearchEndDate(searchEndDate);
			count=new Long(recidivismMapper.getCount(recidivism));
			if(count>0){
				culprit.setCount(count);
				culprit.setTypeName("再犯新罪");
				culpritList.add(culprit);
			}
			
			return culpritList;
			
		}
		
		/**
		 * 根据身份证查找调查评估与迁入管理数据
		 * @return
		 */
		public CommonJsonResult matchInvestigateAndMoveIn(String identification){
			CommonJsonResult commonJsonResult = null;
			//迁入结束流程且并未完成入矫
			MoveIn moveIn=new MoveIn();
			moveIn.setCedentialsNumber(identification);
			List<MoveIn> moveInlist=moveInService.findAll(moveIn);
			if(moveInlist.size()>0){
				MoveIn MoveIn1=moveInlist.get(0);
				ProcessInstance rpi = SpringContextHolder.getApplicationContext().getBean(RuntimeService.class)//
						.createProcessInstanceQuery()// 创建流程实例查询对象
						.processInstanceId(MoveIn1.getProcessInstanceId()).singleResult();
				if(rpi!=null){
					return CommonJsonResult.build(500,"迁入流程未结束!","");
				}else{
					Culprit culprit=new Culprit();
					culprit.setFinshInfo(0);
					culprit.setIdentification(moveIn.getCedentialsNumber());
					culprit.setDicFirstReportGetKey(Constants.FIRST_REPORT_KEY_MOVEIN);
					List<Culprit> culpritList=this.findAll(culprit);
					if(culpritList.size()>0){//迁入已结束且数据已插入，则重新加载页面数据
						Map<String,Object> map=new HashMap<String,Object>();
						map.put("culprit", culpritList.get(0));
						CulpritJudgment culpritJudgment=new CulpritJudgment();
						culpritJudgment.setCulpritId(culpritList.get(0).getId());
						List<CulpritJudgment> CulpritJudgmentList=culpritJudgmentService.findAll(culpritJudgment);
						if(!CulpritJudgmentList.isEmpty()){
							map.put("culpritJudgment", CulpritJudgmentList.get(0));
						}
						
						CulpritLaw culpritLaw=new CulpritLaw();
						culpritLaw.setCulpritId(culpritList.get(0).getId());
						List<CulpritLaw> culpritLawList=culpritLawService.findAll(culpritLaw);
						if(!culpritLawList.isEmpty()){
							map.put("culpritLaw", culpritLawList.get(0));
						}
						return CommonJsonResult.build(200,"同步成功",map);
					}
				}
					
			}
			
			//调查评估结束流程并未完成入矫
			Investigate investigate=new Investigate();
			investigate.setRelevantNumber(identification);
			List<Investigate> investigatelist=investigateService.findAll(investigate);
			if(investigatelist.size()>0){
				Investigate investigate1=investigatelist.get(0);
				ProcessInstance rpi = SpringContextHolder.getApplicationContext().getBean(RuntimeService.class)//
						.createProcessInstanceQuery()// 创建流程实例查询对象
						.processInstanceId(investigate1.getProcessInstanceId()).singleResult();
				if(rpi!=null){
					commonJsonResult = CommonJsonResult.build(500,"调查评估未结束!","");
				}else{
					Culprit culprit=new Culprit();
					culprit.setFinshInfo(0);
					culprit.setIdentification(investigate.getRelevantNumber());
					culprit.setDicFirstReportGetKey(Constants.FIRST_REPORT_KEY_SQDC);
					List<Culprit> culpritList=this.findAll(culprit);
					if(culpritList.size()>0){//调查评估已结束且数据已插入，则重新加载页面数据
						Map<String,Object> map=new HashMap<String,Object>();
						map.put("culprit", culpritList.get(0));
						CulpritJudgment culpritJudgment=new CulpritJudgment();
						culpritJudgment.setCulpritId(culpritList.get(0).getId());
						List<CulpritJudgment> CulpritJudgmentList=culpritJudgmentService.findAll(culpritJudgment);
						if(!CulpritJudgmentList.isEmpty()){
							map.put("culpritJudgment", CulpritJudgmentList.get(0));
						}
						
						CulpritLaw culpritLaw=new CulpritLaw();
						culpritLaw.setCulpritId(culpritList.get(0).getId());
						List<CulpritLaw> culpritLawList=culpritLawService.findAll(culpritLaw);
						if(!culpritLawList.isEmpty()){
							map.put("culpritLaw", culpritLawList.get(0));
						}
						commonJsonResult = CommonJsonResult.build(200,"同步成功",map);
					}
				}
					
			}
			return commonJsonResult;

		}
		
	/**
	 * 检测调查评估、迁入管理、首次报到是否已存在该身份证号码
	 * @param idCard
	 * @param flagTable
	 * @return
	 */
	public CommonJsonResult isIdCardExist(String idCard, String flagTable){
		CommonJsonResult commonJsonResult = null;
		commonJsonResult = CommonJsonResult.build(200,"匹配正常","");
		//调查评估investigate
		if (flagTable != "investigate") {
			Investigate record = new Investigate();
			record.setRelevantNumber(idCard);
			List<Investigate> list = investigateService.findAll(record);
			if (list != null && list.size() > 0) {
				commonJsonResult = CommonJsonResult.build(500,"已存在该身份证的调查评估信息!","");
			}
		}
		//迁入管理moveIn
		if (flagTable != "moveIn") {
			MoveIn record = new MoveIn();
			record.setCedentialsNumber(idCard);
			List<MoveIn> list = moveInService.findAll(record);
			if (list != null && list.size() > 0) {
				commonJsonResult = CommonJsonResult.build(500,"已存在该身份证的迁入管理信息!","");
			}
		}
		//首次报到culprit
		if (flagTable != "culprit") {
			Culprit record = new Culprit();
			record.setIdentification(idCard);
			List<Culprit> list = super.findAll(record);
			if (list != null && list.size() > 0) {
				commonJsonResult = CommonJsonResult.build(500,"已存在该身份证的矫正对象信息!","");
			}
		}
		
		return commonJsonResult;
	}
		
}
