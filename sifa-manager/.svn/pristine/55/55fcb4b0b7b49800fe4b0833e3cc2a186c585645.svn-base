package com.rowell.sifa.service.monitoring;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.mapper.monitoring.OverAlarmMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.homepage.WorkRemind;
import com.rowell.sifa.pojo.monitoring.OverAlarm;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.AskLeaveService;
import com.rowell.sifa.service.homepage.WorkRemindService;
import com.rowell.sifa.service.sys.SysGroupService;

@Service
@Transactional(readOnly = true)
public class OverAlarmService  extends CrudService<OverAlarmMapper, OverAlarm> { 
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private SysGroupService sysGroupService;
	@Autowired
	private AskLeaveService askLeaveService;
	@Autowired
	private TerminalService terminalService;
	@Autowired
	private WorkRemindService workRemindService;
	
	public List<OverAlarm> findAllByRowone(OverAlarm overAlarm){
    	return dao.selectAllByRowone(overAlarm);
    }
	
	public OverAlarm addCulpritToOverAlarm(OverAlarm overAlarm){
		if(!StringUtils.isBlank(overAlarm.getCulpritId())){
			Culprit clist=culpritService.findById(overAlarm.getCulpritId());
			String s =clist.getGroupId();
			SysGroup s1=sysGroupService.findById(s);
			overAlarm.setGroupName(s1.getName());
			overAlarm.setCulpritName(clist.getName());
		}
		return overAlarm;
	}
	
	/**
	 * 
	 * @param x			经度
	 * @param y			纬度
	 * @param moible	定位号
	 * @param id		历史轨迹表id
	 */
	public void judgeOverAlarm(String x, String y, String mobile, String id, String msg){
		try {
			if (!StringUtils.isBlank(msg)) {
				OverAlarm overAlarm = new OverAlarm();
				
				Terminal terminal = new Terminal();
				terminal.setMobileNumber(mobile);
				//List<Culprit> culpritList = culpritService.findAll(culprit);
				List<Terminal> terminalList = terminalService.findAll(terminal);
				if (terminalList.size() > 0) {
					if (!StringUtils.isBlank(terminalList.get(0).getCulpritId())
							&& !StringUtils.isBlank(terminalList.get(0).getId())) {
						overAlarm.setCulpritId(terminalList.get(0).getCulpritId());
						
						AskLeave askLeave = new AskLeave();
						askLeave.setDicStatusKey(Constants.ASKLEAVE_STATUS_WXJ);
						askLeave.setCulpritId(terminalList.get(0).getCulpritId());
						List<AskLeave> askLeaveList = askLeaveService.findAll(askLeave);
						if (askLeaveList.size() > 0) {
							overAlarm.setAskLeaveId(askLeaveList.get(0).getId());
						}
						overAlarm.setNote(msg);
						overAlarm.setTerminalHisId(id);
						super.insertSelective(overAlarm);
						//防止重复插入数据
						WorkRemind workRemind=new WorkRemind();
						workRemind.setDicType(Constants.WORK_REMIND_17);//越界警告
						workRemind.setCulpritId(overAlarm.getCulpritId());
						/*//避免重复插入相同的数据
						workRemind.setDelFlag(null);*/
						List<WorkRemind> workRemind1 = workRemindService.findAll(workRemind);
						if(workRemind1.isEmpty()){
							workRemind.setDelFlag(0);
							workRemind.setCulpritId(overAlarm.getCulpritId());
							workRemind.setRecordId(overAlarm.getId());
							workRemind.setTaskDate(new Date());
							workRemindService.insert(workRemind);
						}else{
							workRemind.setTaskDate(new Date());
							workRemind.setId(workRemind1.get(0).getId());
							workRemindService.updateByIdSelective(workRemind);
						}
						System.out.println("over_alarm--insert");
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	//保存
	public CommonJsonResult saveOverAlarm(OverAlarm overAlarm){
		CommonJsonResult commonJsonResult = null;
		if (StringUtils.isBlank(overAlarm.getId())) {
			this.insert(overAlarm);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("上报成功");
		} else {
			this.updateByIdSelective(overAlarm);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("上报成功");
		}
		//删除待处理的记录
		WorkRemind workRemind=new WorkRemind();
		workRemind.setCulpritId(overAlarm.getCulpritId());
		workRemind.setDicType(Constants.WORK_REMIND_17);
		List<WorkRemind> list=workRemindService.findAll(workRemind);
		if(!list.isEmpty()){
			WorkRemind workRemind1=list.get(0);
			workRemind1.setDelFlag(1);//作废标记
			workRemindService.saveOrUpdate(workRemind1);
		}
		return commonJsonResult;
	}
	
	
	
}
