package com.rowell.sifa.service.homepage;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.common.utils.WorkDayUtils;
import com.rowell.sifa.mapper.homepage.WorkRemindMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.dailymgr.DailyReportLast;
import com.rowell.sifa.pojo.dailymgr.OutOfPrison;
import com.rowell.sifa.pojo.endcorrect.FinishRedress;
import com.rowell.sifa.pojo.homepage.WorkRemind;
import com.rowell.sifa.pojo.inculprit.ExitEntryReport;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.pojo.rewardspunishment.RevokeOutOfPrison;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.AskLeaveService;
import com.rowell.sifa.service.dailymgr.DailyReportLastService;
import com.rowell.sifa.service.dailymgr.OutOfPrisonService;
import com.rowell.sifa.service.endcorrect.FinishRedressService;
import com.rowell.sifa.service.inculprit.ExitEntryReportService;
import com.rowell.sifa.service.monitoring.TerminalService;
import com.rowell.sifa.service.rewardspunishment.RevokeOutOfPrisonService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.service.sys.SysGroupService;

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
	@Autowired
	private TerminalService terminalService;
	@Autowired
	private SysGroupService sysGroupService;
	@Autowired
	private AskLeaveService askLeaveService;
	
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
			}else if(Constants.WORK_REMIND_10.equals(key)){//未按时销假
				AskLeave askLeave=new AskLeave();
				askLeave.setDicStatusKey(Constants.ASKLEAVE_STATUS_WXJ);//未销假
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DAY_OF_MONTH, -1);//当前时间+1天未销假则为未按时销假
				askLeave.setSearchEndDate(cal.getTime());
				List<AskLeave> askLeaveList=askLeaveService.findAll(askLeave);
				if(!askLeaveList.isEmpty()){
					WorkRemind workRemind=null;
					for(AskLeave a:askLeaveList){
						workRemind=new WorkRemind();
						workRemind.setDicType(Constants.WORK_REMIND_10);
						workRemind.setRecordId(a.getId());
						//避免重复插入相同的数据
						workRemind.setDelFlag(null);
						List<WorkRemind> workRemind1 = this.findAll(workRemind);
						if(workRemind1.isEmpty()){
							workRemind.setDelFlag(0);
							workRemind.setCulpritId(a.getCulpritId());
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
			}else if(Constants.WORK_REMIND_26.equals(key)){//查看定位手机数
				
			
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
		int amount=0;
		if(Constants.WORK_REMIND_26.equals(workRemind.getDicType())){//查看手機數及手環數
			Terminal terminal=new Terminal();
			if (StringUtils.isBlank(terminal.getGroupId())) {
				terminal.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
			}
			List<Terminal> TerminalList = terminalService.findAll(terminal);
			amount=TerminalList.size();
		}else{
				amount=dao.findAmountByDicId(workRemind);
		}
		return amount;
	}
	//项目启动时计算待处理数量
	public int findAllAmount() {
		WorkRemind workRemind=new WorkRemind();
		int allAmount=0;
		SysDic sysDic=new SysDic();
		sysDic.setParentKey(Constants.TO_BE_Processed);
		sysDic.setOrderStr("DIC_SORT asc");
		List<SysDic> list = sysDicService.findAll(sysDic);
		if (StringUtils.isBlank(workRemind.getGroupId())) {
			workRemind.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		for(SysDic s:list){
			workRemind.setDicType(s.getKey());
			allAmount+=findAmountByDicId(workRemind);
		}
		return allAmount;
	}
	
	
	//跳转list路径
	public String findUrlById(String key,Model model) {
		String str="";
		if(Constants.WORK_REMIND_4.equals(key)|| Constants.WORK_REMIND_5.equals(key)|| Constants.WORK_REMIND_6.equals(key)){
			str= "modules/homepage/workRemind/list1_6";
		}else if(Constants.WORK_REMIND_10.equals(key)){
			str= "modules/homepage/workRemind/list10";
		}else if(Constants.WORK_REMIND_11.equals(key)|| Constants.WORK_REMIND_12.equals(key)){
			str= "modules/homepage/workRemind/list11";
		}else if(Constants.WORK_REMIND_13.equals(key)|| Constants.WORK_REMIND_14.equals(key)){
			str= "modules/homepage/workRemind/list13";
		}else if(Constants.WORK_REMIND_23.equals(key)){
			str= "modules/homepage/workRemind/list23";
		}else if(Constants.WORK_REMIND_20.equals(key)){
			str= "modules/homepage/workRemind/list20";
		}else if(Constants.WORK_REMIND_26.equals(key)){//查看定位手机数
			List<WorkRemind> workRemindList=findChildTj();
			//合计
			int pgAmontAll=0;int pgAmontSjAll=0;int pgAmontShAll=0;
			int ygAmontAll=0;int ygAmontSjAll=0;int ygAmontShAll=0;
			int tsAmontAll=0;int tsAmontSjAll=0;int tsAmontShAll=0;
			int total=0;
			for(WorkRemind w:workRemindList){//合计
				pgAmontAll+=w.getPgAmont();
				pgAmontSjAll+=w.getPgAmontSj();
				pgAmontShAll+=w.getPgAmontSh();
				ygAmontAll+=w.getYgAmont();
				ygAmontSjAll+=w.getYgAmontSj();
				ygAmontShAll+=w.getYgAmontSh();
				tsAmontAll+=w.getTsAmont();
				tsAmontSjAll+=w.getTsAmontSj();
				tsAmontShAll+=w.getTsAmontSh();
				total+=w.getTotalAmont();
			}
			model.addAttribute("pgAmontAll",pgAmontAll);
			model.addAttribute("pgAmontSjAll",pgAmontSjAll);
			model.addAttribute("pgAmontShAll",pgAmontShAll);
			model.addAttribute("ygAmontAll",ygAmontAll);
			model.addAttribute("ygAmontSjAll",ygAmontSjAll);
			model.addAttribute("ygAmontShAll",ygAmontShAll);
			model.addAttribute("tsAmontAll",tsAmontAll);
			model.addAttribute("tsAmontSjAll",tsAmontSjAll);
			model.addAttribute("tsAmontShAll",tsAmontShAll);
			model.addAttribute("total",total);
			model.addAttribute("reportTime",new Date());
			model.addAttribute("workRemindList",workRemindList);
			str= "modules/homepage/workRemind/list26";
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
		}else if(Constants.WORK_REMIND_10.equals(key)){
			str= "modules/homepage/workRemind/auditDialog/audit10";
		}else if(Constants.WORK_REMIND_11.equals(key)||Constants.WORK_REMIND_12.equals(key)){
			str= "modules/homepage/workRemind/auditDialog/audit11";
		}else if(Constants.WORK_REMIND_13.equals(key)|| Constants.WORK_REMIND_14.equals(key)){
			str= "modules/homepage/workRemind/auditDialog/audit13";
		}else if(Constants.WORK_REMIND_20.equals(key)){
			str= "modules/homepage/workRemind/auditDialog/audit20";
		}
		else if(Constants.WORK_REMIND_27.equals(key)){
			str= "modules/homepage/workRemind/auditDialog/audit27";
		}
		return str;
	}	
	//查看子部门手机、手环数量统计
	public List<WorkRemind> findChildTj(){
		SysGroup sysGroup=new SysGroup();
		List<WorkRemind> workRemindList=new ArrayList<WorkRemind>();
		//该账户是司法所账号，则另外统计
		if(sysGroupService.findById(SysAccountUtils.getSysAccount().getGroupId()).getLevelNo()==2){
			int pgAmont=0;int pgAmontSj=0;int pgAmontSh=0;
			int ygAmont=0;int ygAmontSj=0;int ygAmontSh=0;
			int tsAmont=0;int tsAmontSj=0;int tsAmontSh=0;
			Terminal terminal=new Terminal();
			terminal.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
			List<Terminal> terminalList=terminalService.findAll(terminal);
			WorkRemind workRemind=new WorkRemind();
			workRemind.setGroupName(SysAccountUtils.getSysAccount().getGroupName());
			if(!terminalList.isEmpty()){
				for(Terminal t:terminalList){
					if("27003".equals(t.getDicMonitorGradeKey())){//普管
						if("手机".equals(t.getType())){
							pgAmontSj+=1;
						}else if("定位手环".equals(t.getType())){
							pgAmontSh+=1;
						}	
					}else if("27004".equals(t.getDicMonitorGradeKey())){//严管
						if("手机".equals(t.getType())){
							ygAmontSj+=1;
						}else if("定位手环".equals(t.getType())){
							ygAmontSh+=1;
						}	
					}else if("27005".equals(t.getDicMonitorGradeKey())){//特殊类
						if("手机".equals(t.getType())){
							tsAmontSj+=1;
						}else if("定位手环".equals(t.getType())){
							tsAmontSh+=1;
						}	
					}
				}	
			}
			pgAmont=pgAmontSj+pgAmontSh;
			ygAmont=ygAmontSj+ygAmontSh;
			tsAmont=tsAmontSj+tsAmontSh;
			workRemind.setPgAmont(pgAmont);
			workRemind.setPgAmontSh(pgAmontSh);
			workRemind.setPgAmontSj(pgAmontSj);
			workRemind.setYgAmont(ygAmont);
			workRemind.setYgAmontSh(ygAmontSh);
			workRemind.setYgAmontSj(ygAmontSj);
			workRemind.setTsAmont(tsAmont);
			workRemind.setTsAmontSj(tsAmontSj);
			workRemind.setTsAmontSh(tsAmontSh);
			workRemind.setTotalAmont(pgAmont+ygAmont+tsAmont);
			workRemindList.add(workRemind);
			return workRemindList;
		}
		sysGroup.setParentId(SysAccountUtils.getSysAccount().getGroupId());
		List<SysGroup> childGroups=sysGroupService.findAll(sysGroup);
		if(childGroups.size()>0){
			for(SysGroup childGroup:childGroups){
				int pgAmont=0;int pgAmontSj=0;int pgAmontSh=0;
				int ygAmont=0;int ygAmontSj=0;int ygAmontSh=0;
				int tsAmont=0;int tsAmontSj=0;int tsAmontSh=0;
				Terminal terminal=new Terminal();
				terminal.setGroupId(childGroup.getId());
				List<Terminal> terminalList=terminalService.findAll(terminal);
				WorkRemind workRemind=new WorkRemind();
				workRemind.setGroupName(childGroup.getName());
				if(!terminalList.isEmpty()){
					for(Terminal t:terminalList){
						if("27003".equals(t.getDicMonitorGradeKey())){//普管
							if("手机".equals(t.getType())){
								pgAmontSj+=1;
							}else if("定位手环".equals(t.getType())){
								pgAmontSh+=1;
							}	
						}else if("27004".equals(t.getDicMonitorGradeKey())){//严管
							if("手机".equals(t.getType())){
								ygAmontSj+=1;
							}else if("定位手环".equals(t.getType())){
								ygAmontSh+=1;
							}	
						}else if("27005".equals(t.getDicMonitorGradeKey())){//特殊类
							if("手机".equals(t.getType())){
								tsAmontSj+=1;
							}else if("定位手环".equals(t.getType())){
								tsAmontSh+=1;
							}	
						}
					}	
				}
				pgAmont=pgAmontSj+pgAmontSh;
				ygAmont=ygAmontSj+ygAmontSh;
				tsAmont=tsAmontSj+tsAmontSh;
				workRemind.setPgAmont(pgAmont);
				workRemind.setPgAmontSh(pgAmontSh);
				workRemind.setPgAmontSj(pgAmontSj);
				workRemind.setYgAmont(ygAmont);
				workRemind.setYgAmontSh(ygAmontSh);
				workRemind.setYgAmontSj(ygAmontSj);
				workRemind.setTsAmont(tsAmont);
				workRemind.setTsAmontSj(tsAmontSj);
				workRemind.setTsAmontSh(tsAmontSh);
				workRemind.setTotalAmont(pgAmont+ygAmont+tsAmont);
				workRemindList.add(workRemind);	
			}			
			
		}
		
		return workRemindList;
		
	}
	
	
	
}
