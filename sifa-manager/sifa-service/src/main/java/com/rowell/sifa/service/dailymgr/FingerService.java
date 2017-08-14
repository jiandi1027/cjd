
/**    
* @Title: FingerService.java  
* @Package com.rowell.sifa.service.dailymgr  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年2月28日  
* @version V1.0    
*/

package com.rowell.sifa.service.dailymgr;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.dailymgr.AskLeaveMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.sys.IfaceMachine;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.sys.IfaceMachineService;

/**
 * @ClassName: FingerService
 * @Description: 指纹service
 * @author xiaoguang
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class FingerService extends CrudService<AskLeaveMapper, AskLeave> {
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private IfaceMachineService ifaceMachineService;
	
	
	public String newIface(String culpritId, SysAccount sysAccount) {
		String result = "";
		Culprit cp = culpritService.findById(culpritId);
		if (cp.getIfaceSn() != null && cp.getIfaceSn().length() > 0) {
			IfaceMachine record = new IfaceMachine();
			record.setMacSn(cp.getIfaceSn());
			List<IfaceMachine> imList = ifaceMachineService.findAll(record);
			if (imList.size() > 0) {
				IfaceMachine im = imList.get(0);
				if(im!=null)
				{
					result = im.getMacName();
					
//					IFacePc2Machines ipm = new IFacePc2Machines();
//					ipm.setAccountId(account.getId());
//					ipm.setCreatedTime(DateUtils.getNowTimestamp());
//					ipm.setCulpritId(culpritId);
//					ipm.setFlag(false);
//					pc2MachineDao.create(ipm);
//					ipm.setMacId(Integer.valueOf("" + ipm.getId()));
//					ipm.setMacSn(im.getMacSn());
//					ipm.setOrderContent("C:" + ipm.getId() + ":DATA USER PIN="
//							+ culpritId + "\tName=" + cp.getName()
//							+ "\tPri=0\tPasswd=\tCard=[]\tGrp=\tTZ=");
//
//					 //"DELETE USERINFO PIN=%d"
//					ipm.setOrderTime(DateUtils.getNowTimestamp());

//					if(cp.getCulpritReportDate()==null)
//					{
//						cp.setCulpritReportDate(new Date());//设置到司法所报到时间
						cp.setFingerFaceTime(new Date());
//					}
					culpritService.updateByIdSelective(cp);
				}
			}
		} else {
			IfaceMachine record = new IfaceMachine();
			record.setGroupId(cp.getGroupId());
			List list = ifaceMachineService.findAll(record);
			if (list != null && list.size() > 0) {
				if(list.size()==1)
				{
					IfaceMachine ifm = null;
					for (int i = 0; i < list.size(); i++) {
						IfaceMachine tmp = (IfaceMachine) list.get(i);
						if (tmp != null
								&& (Integer.valueOf(tmp.getUserCount()) < Integer
										.valueOf(tmp.getMaxUserCount()))) {
							ifm = tmp;
							break;
						}
					}
					if (ifm != null) {
//						IFacePc2Machines ipm = new IFacePc2Machines();
//						ipm.setAccountId(account.getId());
//						ipm.setCreatedTime(DateUtils.getNowTimestamp());
//						ipm.setCulpritId(culpritId);
//						ipm.setFlag(false);
//						pc2MachineDao.create(ipm);
//						ipm.setMacId(Integer.valueOf("" + ipm.getId()));
//						ipm.setMacSn(ifm.getMacSn());
//						ipm.setOrderContent("C:" + ipm.getId() + ":DATA USER PIN="
//								+ culpritId + "\tName=" + cp.getName()
//								+ "\tPri=0\tPasswd=\tCard=[]\tGrp=\tTZ=");
//						ipm.setOrderTime(DateUtils.getNowTimestamp());
						result = ifm.getMacName();
						cp.setIfaceSn(ifm.getMacSn());
						cp.setFingerFaceTime(new Date());
//						if(cp.getCulpritReportDate()==null)
//						{
//							cp.setCulpritReportDate(DateUtils.getNowTimestamp());//设置到司法所报到时间
//						}
						culpritService.updateByIdSelective(cp);
					}
				}
				else {
					result+="more,";
					for(int i=0;i<list.size();i++)
					{
						IfaceMachine tmp = (IfaceMachine) list.get(i);
						if (tmp != null
								&& (Integer.valueOf(tmp.getUserCount()) < Integer
										.valueOf(tmp.getMaxUserCount()))) {
							result +=tmp.getId()+"*"+tmp.getMacName()+",";
							//break;
						}
					}
				}
			}
		}
//		// 判断矫正人员报到的时间是否超时
////		createTime = DateUtils.getNowTimestamp();
//		if(cp.getLimitDate()!=null)
//		{
//			createTime=this.getCreateTime(culpritId, account);
//			if (createTime.after(cp.getLimitDate())) {
//				WorkRemind wr = new WorkRemind();// 提醒记录
//				Calendar cal = Calendar.getInstance();
//				int month = cal.get(Calendar.MONTH) + 1;
//				int year = cal.get(Calendar.YEAR);
//				int dayMonth = cal.get(Calendar.DAY_OF_MONTH);
//				wr.setCulpritId(cp.getId());
//				wr.setYear(year);
//				wr.setMonth(month);
//				wr.setDay(dayMonth);
//				wr.setGroupId(cp.getGroupId());
//				wr.setRemindTypeId(HierInfoConstants.SIFA_WORK_REMIND_5);
//				// wr.setPunishId(HierInfoConstants.SIFA_PUNISH_TYPE_5);
//				wr.setCreatedTime(DateUtils.getNowTimestamp());
//				workRemindDao.create(wr);
//				Long idLong = wr.getId();
//				result += ",超时";
//				result += "," + idLong;
//			}
//		}
		return result;
	}
	
	
	
	public String newIfaceToCp(String culpritId, String macId, SysAccount account) {
		String temp="";
		IfaceMachine im = ifaceMachineService.findById(macId);
		if(im!=null)
		{
			Culprit cp = culpritService.findById(culpritId);
//			IFacePc2Machines ipm = new IFacePc2Machines();
//			ipm.setAccountId(account.getId());
//			ipm.setCreatedTime(DateUtils.getNowTimestamp());
//			ipm.setCulpritId(culpritId);
//			ipm.setFlag(false);
//			pc2MachineDao.create(ipm);
//			ipm.setMacId(Integer.valueOf("" + ipm.getId()));
//			ipm.setMacSn(im.getMacSn());
//			ipm.setOrderContent("C:" + ipm.getId() + ":DATA USER PIN="
//					+ culpritId + "\tName=" + cp.getName()
//					+ "\tPri=0\tPasswd=\tCard=[]\tGrp=\tTZ=");
//
//			// "DELETE USERINFO PIN=%d"
//			ipm.setOrderTime(DateUtils.getNowTimestamp());
			cp.setIfaceSn(im.getMacSn());
			cp.setFingerFaceTime(new Date());
//			cp.setCulpritReportDate(DateUtils.getNowTimestamp());//设置到司法所报到时间
			culpritService.updateByIdSelective(cp);
		}
		else {
			temp="no";
		}
		return temp;
	}
	
	
	
	
}
