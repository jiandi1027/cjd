package com.rowell.sifa.service.homepage;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.WorkDayUtils;
import com.rowell.sifa.mapper.homepage.WorkRemindMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.DailyReportLast;
import com.rowell.sifa.pojo.dailymgr.OutOfPrison;
import com.rowell.sifa.pojo.endcorrect.FinishRedress;
import com.rowell.sifa.pojo.homepage.WorkRemind;
import com.rowell.sifa.pojo.inculprit.ExitEntryReport;
import com.rowell.sifa.pojo.rewardspunishment.RevokeOutOfPrison;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.DailyReportLastService;
import com.rowell.sifa.service.dailymgr.OutOfPrisonService;
import com.rowell.sifa.service.endcorrect.FinishRedressService;
import com.rowell.sifa.service.inculprit.ExitEntryReportService;
import com.rowell.sifa.service.rewardspunishment.RevokeOutOfPrisonService;
import com.rowell.sifa.service.sys.SysDicService;

/**
 * @ClassName: ExaminationAndApprovalService
 * @Description: 待处理事项
 * @author yxb
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class WorkRemindService extends CrudService<WorkRemindMapper, WorkRemind> {
	@Autowired
	private SysDicService sysDicService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private OutOfPrisonService outOfPrisonService;
	@Autowired
	private RevokeOutOfPrisonService revokeOutOfPrisonService;
	@Autowired
	private FinishRedressService finishRedressService;
	@Autowired
	private ExitEntryReportService exitEntryReportService;
	@Autowired
	private DailyReportLastService dailyReportLastService;
	//每12小时插入该待处理

	public void insertWorkRemind() {
		
		SysDic sysDic=new SysDic();
		sysDic.setParentKey(Constants.TO_BE_Processed);
		sysDic.setOrderStr("DIC_SORT asc");
		List<SysDic> list = sysDicService.findAll(sysDic);
		for(SysDic s:list){
			String key=s.getKey();
			if(Constants.WORK_REMIND_4.equals(key)){//已到司法局报道,未到司法所报道(1-3天) 
				/*Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DAY_OF_MONTH, -3);
				Date searchCreatedStartDate = cal.getTime();*/
				Date searchCreatedStartDate=WorkDayUtils.reductionWorkDay(new Date(), 3);//
				Date  searchCreatedEndDate=new Date();
				Culprit culprit=new Culprit();
				culprit.setFinshInfo(0);
				culprit.setSearchCreatedEndDate(searchCreatedEndDate);
				culprit.setSearchCreatedStartDate(searchCreatedStartDate);
				List<Culprit> CulpritList=culpritService.findAllByGroupId(culprit);
				if(!CulpritList.isEmpty()){
					WorkRemind workRemind=null;
					for(Culprit c:CulpritList){
						workRemind=new WorkRemind();
						workRemind.setDicType(Constants.WORK_REMIND_4);
						workRemind.setRecordId(c.getId());
						//避免重复插入相同的数据
						workRemind.setDelFlag(null);
						List<WorkRemind> workRemind1 = this.findAll(workRemind);
						if(workRemind1.isEmpty()){
							workRemind.setDelFlag(0);
							workRemind.setCulpritId(c.getId());
							workRemind.setTaskDate(new Date());
							this.insert(workRemind);
						}	
					}
					
				}
			}else if(Constants.WORK_REMIND_5.equals(key)){//已到司法局报道,3日内未到司法所报道(4天以上) 
				/*Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DAY_OF_MONTH, -3);*/
				Date  searchCreatedEndDate=WorkDayUtils.reductionWorkDay(new Date(), 3);
				Culprit culprit=new Culprit();
				culprit.setFinshInfo(0);
				culprit.setSearchCreatedEndDate(searchCreatedEndDate);
				List<Culprit> CulpritList=culpritService.findAllByGroupId(culprit);
				if(!CulpritList.isEmpty()){
					WorkRemind workRemind=null;
					for(Culprit c:CulpritList){
						workRemind=new WorkRemind();
						workRemind.setDicType(Constants.WORK_REMIND_5);
						workRemind.setRecordId(c.getId());
						//避免重复插入相同的数据
						workRemind.setDelFlag(null);
						List<WorkRemind> workRemind1 = this.findAll(workRemind);
						if(workRemind1.isEmpty()){
							workRemind.setDelFlag(0);
							workRemind.setCulpritId(c.getId());
							workRemind.setTaskDate(new Date());
							this.insert(workRemind);
						}	
					}
					
				}
			}else if(Constants.WORK_REMIND_6.equals(key)){//人已到,法律文书未到
				Culprit culprit=new Culprit();
				culprit.setDicReportTypeKey("74002");
				List<Culprit> CulpritList=culpritService.findAllByGroupId(culprit);
				if(!CulpritList.isEmpty()){
					WorkRemind workRemind=null;
					for(Culprit c:CulpritList){
						workRemind=new WorkRemind();
						workRemind.setDicType(Constants.WORK_REMIND_6);
						workRemind.setRecordId(c.getId());
						//避免重复插入相同的数据
						workRemind.setDelFlag(null);
						List<WorkRemind> workRemind1 = this.findAll(workRemind);
						if(workRemind1.isEmpty()){
							workRemind.setDelFlag(0);
							workRemind.setCulpritId(c.getId());
							workRemind.setTaskDate(new Date());
							this.insert(workRemind);
						}	
					}
					
				}
			}else if(Constants.WORK_REMIND_11.equals(key)){//期满解矫的期限小于1个月
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.MONTH, +1);
				Date searchRedressStartDate = new Date();
				Date searchRedressEndDate=cal.getTime();
				Culprit culprit=new Culprit();
				culprit.setSearchRedressStartDate(searchRedressStartDate);
				culprit.setSearchRedressEndDate(searchRedressEndDate);
				culprit.setDicStatusKey(Constants.CULPRIT_STATUS_JZZ);
				List<Culprit> CulpritList=culpritService.findAllByGroupId(culprit);
				if(!CulpritList.isEmpty()){
					WorkRemind workRemind=null;
					for(Culprit c:CulpritList){
						//排除已走流程的人员
						FinishRedress finishRedress=new FinishRedress();
						finishRedress.setCulpritId(c.getId());
						List<FinishRedress> finishRedresslist = finishRedressService.findAll(finishRedress);
						if(finishRedresslist.isEmpty()){//期满解除内没有该记录
							workRemind=new WorkRemind();
							workRemind.setDicType(Constants.WORK_REMIND_11);
							workRemind.setRecordId(c.getId());
							//避免重复插入相同的数据
							workRemind.setDelFlag(null);
							List<WorkRemind> workRemind1 = this.findAll(workRemind);
							if(workRemind1.isEmpty()){
								workRemind.setDelFlag(0);
								workRemind.setCulpritId(c.getId());
								workRemind.setTaskDate(new Date());
								this.insert(workRemind);
							}	
						}
						
					}
					
				}
			}else if(Constants.WORK_REMIND_12.equals(key)){//未按期解矫
				Culprit culprit=new Culprit();
				culprit.setDicStatusKey(Constants.CULPRIT_STATUS_JZZ);
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DAY_OF_MONTH, -1);
				culprit.setSearchRedressEndDate(cal.getTime());//矫正期限结束时间在当前时间-1天之前
				List<Culprit> CulpritList=culpritService.findAllByGroupId(culprit);
				if(!CulpritList.isEmpty()){
					WorkRemind workRemind=null;
					for(Culprit c:CulpritList){
						//排除已走流程的人员
						FinishRedress finishRedress=new FinishRedress();
						finishRedress.setCulpritId(c.getId());
						List<FinishRedress> finishRedresslist = finishRedressService.findAll(finishRedress);
						if(finishRedresslist.isEmpty()){
							workRemind=new WorkRemind();
							workRemind.setDicType(Constants.WORK_REMIND_12);
							workRemind.setRecordId(c.getId());
							//避免重复插入相同的数据
							workRemind.setDelFlag(null);
							List<WorkRemind> workRemind1 = this.findAll(workRemind);
							if(workRemind1.isEmpty()){
								workRemind.setDelFlag(0);
								workRemind.setCulpritId(c.getId());
								workRemind.setTaskDate(new Date());
								this.insert(workRemind);
							}	
						}
					}
					
				}
			}else if(Constants.WORK_REMIND_13.equals(key)){//暂予监外执行期限小于3个月
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.MONTH, +3);
				Date searchRedressStartDate = new Date();
				Date searchRedressEndDate=cal.getTime();
				Culprit culprit=new Culprit();
				culprit.setSearchRedressStartDate(searchRedressStartDate);
				culprit.setSearchRedressEndDate(searchRedressEndDate);
				culprit.setDicStatusKey(Constants.CULPRIT_STATUS_JZZ);
				culprit.setDicPenalTypeKey("2004");//暂予监外执行
				List<Culprit> CulpritList=culpritService.findAllByGroupId(culprit);
				if(!CulpritList.isEmpty()){
					WorkRemind workRemind=null;
					for(Culprit c:CulpritList){
						//排除已走流程的人员
						FinishRedress finishRedress=new FinishRedress();//期满解矫
						finishRedress.setCulpritId(c.getId());
						List<FinishRedress> finishRedresslist = finishRedressService.findAll(finishRedress);
						
						OutOfPrison outofRriosn=new OutOfPrison();//延长监外执行
						outofRriosn.setCulpritId(c.getId());
						List<OutOfPrison> outofRriosnlist = outOfPrisonService.findAll(outofRriosn);
						
						RevokeOutOfPrison revokeOutOfPrison=new RevokeOutOfPrison();//延长监外执行
						revokeOutOfPrison.setCulpritId(c.getId());
						List<RevokeOutOfPrison> revokeOutOfPrisonlist =revokeOutOfPrisonService.findAll(revokeOutOfPrison);
						
						if(finishRedresslist.isEmpty() && outofRriosnlist.isEmpty() && revokeOutOfPrisonlist.isEmpty()){
							workRemind=new WorkRemind();
							workRemind.setDicType(Constants.WORK_REMIND_13);
							workRemind.setRecordId(c.getId());
							//避免重复插入相同的数据
							workRemind.setDelFlag(null);
							List<WorkRemind> workRemind1 = this.findAll(workRemind);
							if(workRemind1.isEmpty()){
								workRemind.setDelFlag(0);
								workRemind.setCulpritId(c.getId());
								workRemind.setTaskDate(new Date());
								this.insert(workRemind);
							}	
						}
						
					}
					
				}
			}else if(Constants.WORK_REMIND_14.equals(key)){//未按期办理延长暂予监外执行
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DAY_OF_MONTH, -1);
				Culprit culprit=new Culprit();
				culprit.setSearchRedressEndDate(cal.getTime());//矫正期限结束时间在当前时间-1天之前
				culprit.setDicStatusKey(Constants.CULPRIT_STATUS_JZZ);
				culprit.setDicPenalTypeKey("2004");//暂予监外执行
				List<Culprit> CulpritList=culpritService.findAllByGroupId(culprit);
				if(!CulpritList.isEmpty()){
					WorkRemind workRemind=null;
					for(Culprit c:CulpritList){
						//排除已走流程的人员
						FinishRedress finishRedress=new FinishRedress();//期满解矫
						finishRedress.setCulpritId(c.getId());
						List<FinishRedress> finishRedresslist = finishRedressService.findAll(finishRedress);
						
						OutOfPrison outofRriosn=new OutOfPrison();//延长监外执行
						outofRriosn.setCulpritId(c.getId());
						List<OutOfPrison> outofRriosnlist = outOfPrisonService.findAll(outofRriosn);
						
						RevokeOutOfPrison revokeOutOfPrison=new RevokeOutOfPrison();//延长监外执行
						revokeOutOfPrison.setCulpritId(c.getId());
						List<RevokeOutOfPrison> revokeOutOfPrisonlist =revokeOutOfPrisonService.findAll(revokeOutOfPrison);
						
						if(finishRedresslist.isEmpty() && outofRriosnlist.isEmpty() && revokeOutOfPrisonlist.isEmpty()){
							workRemind=new WorkRemind();
							workRemind.setDicType(Constants.WORK_REMIND_14);
							workRemind.setRecordId(c.getId());
							//避免重复插入相同的数据
							workRemind.setDelFlag(null);
							List<WorkRemind> workRemind1 = this.findAll(workRemind);
							if(workRemind1.isEmpty()){
								workRemind.setDelFlag(0);
								workRemind.setCulpritId(c.getId());
								workRemind.setTaskDate(new Date());
								this.insert(workRemind);
							}	
						}
						
					}
					
				}
			}else if(Constants.WORK_REMIND_20.equals(key)){//未按要求进行日常报到
				DailyReportLast dailyReportLast=new DailyReportLast();
				dailyReportLast.setDicReportStatusKey(Constants.DAILY_REPORT_NOT_ON_TIME);//未按时
				List<DailyReportLast> dailyReportLastList = dailyReportLastService.findAll(dailyReportLast);
				if(!dailyReportLastList.isEmpty()){
					WorkRemind workRemind=null;
					for(DailyReportLast d:dailyReportLastList){
						//排除已走流程的人员
							workRemind=new WorkRemind();
							workRemind.setDicType(Constants.WORK_REMIND_20);
							workRemind.setRecordId(d.getId());
							//避免重复插入相同的数据
							workRemind.setDelFlag(null);
							List<WorkRemind> workRemind1 = this.findAll(workRemind);
							if(workRemind1.isEmpty()){
								workRemind.setDelFlag(0);
								workRemind.setCulpritId(d.getCulpritId());
								workRemind.setTaskDate(new Date());
								this.insert(workRemind);
							}
						
					}
					
				}
			}else if(Constants.WORK_REMIND_23.equals(key)){//尚未完成出境报备（护照收缴）
				ExitEntryReport exitEntryReport=new ExitEntryReport();
				exitEntryReport.setDicBbztKey("61001");//报备中
				List<ExitEntryReport> exitEntryReportList = exitEntryReportService.findAll(exitEntryReport);
				if(!exitEntryReportList.isEmpty()){
					WorkRemind workRemind=null;
					for(ExitEntryReport e:exitEntryReportList){
						//排除已走流程的人员
						if(StringUtils.isBlank(e.getProcessInstanceId())){
							workRemind=new WorkRemind();
							workRemind.setDicType(Constants.WORK_REMIND_23);
							workRemind.setRecordId(e.getId());
							//避免重复插入相同的数据
							workRemind.setDelFlag(null);
							List<WorkRemind> workRemind1 = this.findAll(workRemind);
							if(workRemind1.isEmpty()){
								workRemind.setDelFlag(0);
								workRemind.setCulpritId(e.getCulpritId());
								workRemind.setTaskDate(new Date());
								this.insert(workRemind);
							}	
						}
						
					}
					
				}
			}else if(Constants.WORK_REMIND_27.equals(key)){//近期需要报道提醒(5工作日内)-日常报到
				DailyReportLast dailyReportLast=new DailyReportLast();
				dailyReportLast.setNextShouldReportDateStartDate(new Date());
				dailyReportLast.setNextShouldReportDateEndDate(WorkDayUtils.addWorkDay(new Date(), 5));
				List<DailyReportLast> dailyReportLastList = dailyReportLastService.findAll(dailyReportLast);
				if(!dailyReportLastList.isEmpty()){
					WorkRemind workRemind=null;
					for(DailyReportLast d:dailyReportLastList){
						//排除已走流程的人员
							workRemind=new WorkRemind();
							workRemind.setDicType(Constants.WORK_REMIND_27);
							workRemind.setRecordId(d.getId());
							//避免重复插入相同的数据
							workRemind.setDelFlag(null);
							List<WorkRemind> workRemind1 = this.findAll(workRemind);
							if(workRemind1.isEmpty()){
								workRemind.setDelFlag(0);
								workRemind.setCulpritId(d.getCulpritId());
								workRemind.setTaskDate(new Date());
								this.insert(workRemind);
							}
						
					}
					
				}
			}
			
			
			
			
			
			
		}
	}
	
	public int findAmountByDicId(WorkRemind workRemind) {
		int amount=dao.findAmountByDicId(workRemind);
		return amount;
	}
	
	
	//跳转list路径
	public String findUrlById(String key) {
		String str="";
		if(Constants.WORK_REMIND_4.equals(key)|| Constants.WORK_REMIND_5.equals(key)|| Constants.WORK_REMIND_6.equals(key)){
			str= "modules/homepage/workRemind/list1_6";
		}else if(Constants.WORK_REMIND_11.equals(key)|| Constants.WORK_REMIND_12.equals(key)){
			str= "modules/homepage/workRemind/list11";
		}else if(Constants.WORK_REMIND_13.equals(key)|| Constants.WORK_REMIND_14.equals(key)){
			str= "modules/homepage/workRemind/list13";
		}else if(Constants.WORK_REMIND_23.equals(key)){
			str= "modules/homepage/workRemind/list23";
		}else if(Constants.WORK_REMIND_27.equals(key)){
			str= "modules/homepage/workRemind/list27";
		}else if(Constants.WORK_REMIND_17.equals(key)){
			str= "modules/homepage/workRemind/list17";
		}
		
		return str;
	}	
	
	
	//根据key跳转不同的处理页面
	public String findAuditUrlByKey(String key) {
		String str="";
		if(Constants.WORK_REMIND_4.equals(key)|| Constants.WORK_REMIND_5.equals(key)){
			str= "modules/homepage/workRemind/auditDialog/audit2_5";
		}else if(Constants.WORK_REMIND_6.equals(key)){
			str= "modules/homepage/workRemind/auditDialog/audit6";
		}else if(Constants.WORK_REMIND_11.equals(key)||Constants.WORK_REMIND_12.equals(key)){
			str= "modules/homepage/workRemind/auditDialog/audit11";
		}else if(Constants.WORK_REMIND_13.equals(key)|| Constants.WORK_REMIND_14.equals(key)){
			str= "modules/homepage/workRemind/auditDialog/audit13";
		}else if(Constants.WORK_REMIND_27.equals(key)){
			str= "modules/homepage/workRemind/auditDialog/audit27";
		}
		return str;
	}	
	
}
