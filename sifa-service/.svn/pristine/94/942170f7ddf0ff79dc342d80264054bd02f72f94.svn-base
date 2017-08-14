package com.rowell.sifa.service.statistics;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.statistics.CulpritStatusTjMapper;
import com.rowell.sifa.pojo.statistics.CulpritStatusTj;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.sys.SysGroupService;
/**
 * 
    * @ClassName: CulpritTjService  
    * @Description: 社区矫正对象情况统计表
    * @author DELL  
    * @date 2017年4月13日  
    *
 */
@Service
@Transactional(readOnly = true)
public class CulpritStatusTjService extends CrudService<CulpritStatusTjMapper,CulpritStatusTj>  {
	@Autowired
	private SysGroupService sysGroupService;
	@Autowired
	private CulpritStatusTjMapper culpritStatusTjMapper;
	@Autowired
	CulpritService culpritService;

	public List<CulpritStatusTj>findChildTj(CulpritStatusTj culpritStatusTj){
		//找出所有子部门
		String groupId=culpritStatusTj.getGroupId();
		SysGroup sysGroup=new SysGroup();
		sysGroup.setParentId(groupId);
		List<SysGroup> childGroups=sysGroupService.findAll(sysGroup);
		List<CulpritStatusTj> childList=new ArrayList<CulpritStatusTj>();
		CulpritStatusTj c=new CulpritStatusTj();
		Integer byzcrs=0;Integer syzcrs=0;Integer change_byzj=0;
		Integer change_qmjcjz=0;Integer change_sjzx=0;Integer change_sw=0;
		Integer change_qtyy=0;Integer class_gz=0;Integer class_hx=0;
		Integer class_js=0;Integer class_zyjwzx=0;Integer class_bdzzql=0;
		Integer type_whgjaqz=0;Integer type_whggaqz=0;Integer type_phshzyz=0;
		Integer type_qfgmrsqlz=0;Integer type_qfccz=0;Integer type_fhshglzxz=0;
		Integer type_twhlz=0;Integer type_dzz=0;Integer type_other=0;
		Integer reg_city=0;Integer reg_village=0;Integer reg_other=0;
		Integer sex_male=0;Integer sex_female=0;Integer nation_han=0;
		Integer nation_few=0;Integer age_u18=0;Integer age_19to45=0;
		Integer age_46to60=0;Integer age_61p=0;Integer qualification_junior=0;
		Integer qualification_senior=0;Integer qualification_middle=0;Integer qualification_primary=0;
		Integer work_study=0;Integer work_on=0;Integer work_nojob=0;
		Integer praise_sqjl=0;Integer praise_sqcf=0;Integer praise_cdjx=0;
		Integer praise_szacf=0;Integer jzbytg=0;Integer zfxz=0;
		Integer total_accept=0;Integer total_relieve=0;Integer total_crime_again=0;
		if(childGroups.size()>0){
			for(SysGroup childGroup:childGroups){
				c=culpritStatusTjMapper.selectByGroupId(childGroup.getId(),culpritStatusTj.getReportDate());
				if("91801".equals(c.getDicState())||"91804".equals(c.getDicState())){//删选已上报的部门
					byzcrs+=c.getByzcrs();
					syzcrs+=c.getSyzcrs();
					change_byzj+=c.getChange_byzj();
					change_qmjcjz+=c.getChange_qmjcjz();
					change_sjzx+=c.getChange_sjzx();
					change_sw+=c.getChange_sw();
					change_qtyy+=c.getChange_qtyy();
					class_gz+=c.getClass_gz();
					class_hx+=c.getClass_js();
					class_js+=c.getClass_js();
					class_zyjwzx+=c.getClass_zyjwzx();
					class_bdzzql+=c.getClass_bdzzql();
					type_whgjaqz+=c.getType_whgjaqz();
					type_whggaqz+=c.getType_whggaqz();
					type_phshzyz+=c.getType_phshzyz();
					type_qfgmrsqlz+=c.getType_qfgmrsqlz();
					type_qfccz+=c.getType_qfccz();
					type_fhshglzxz+=c.getType_fhshglzxz();
					type_twhlz+=c.getType_twhlz();
					type_dzz+=c.getType_dzz();
					type_other+=c.getType_other();
					reg_city+=c.getReg_city();
					reg_village+=c.getReg_village();
					reg_other+=c.getReg_other();
					sex_male+=c.getSex_male();
					sex_female+=c.getSex_female();
					nation_han+=c.getNation_han();
					nation_few+=c.getNation_few();
					age_u18+=c.getAge_u18();
					age_19to45+=c.getAge_19to45();
					age_46to60+=c.getAge_46to60();
					age_61p+=c.getAge_61p();
					qualification_junior+=c.getQualification_junior();
					qualification_senior+=c.getQualification_senior();
					qualification_middle+=c.getQualification_middle();
					qualification_primary+=c.getQualification_primary();
					work_study+=c.getWork_study();
					work_on+=c.getWork_on();
					work_nojob+=c.getWork_nojob();
					praise_sqjl+=c.getPraise_sqjl();
					praise_sqcf+=c.getPraise_sqcf();
					praise_cdjx+=c.getPraise_cdjx();
					praise_szacf+=c.getPraise_szacf();
					jzbytg+=c.getJzbytg();
					zfxz+=c.getZfxz();
					total_accept+=c.getTotal_accept();
					total_relieve+=c.getTotal_relieve();
					total_crime_again+=c.getTotal_crime_again();
				}
				
				childList.add(c);
			}
			if(culpritStatusTj.getByzcrs()==0){//若本月在册人数为0，则执行运算
				culpritStatusTj.setByzcrs(byzcrs);culpritStatusTj.setSyzcrs(syzcrs);
				culpritStatusTj.setChange_byzj(change_byzj);culpritStatusTj.setChange_qmjcjz(change_qmjcjz);
				culpritStatusTj.setChange_sjzx(change_sjzx);culpritStatusTj.setChange_sw(change_sw);
				culpritStatusTj.setChange_qtyy(change_qtyy);culpritStatusTj.setClass_gz(class_gz);
				culpritStatusTj.setClass_hx(class_hx);culpritStatusTj.setClass_js(class_js);
				culpritStatusTj.setClass_zyjwzx(class_zyjwzx);culpritStatusTj.setClass_bdzzql(class_bdzzql);
				culpritStatusTj.setType_whgjaqz(type_whgjaqz);culpritStatusTj.setType_whggaqz(type_whggaqz);
				culpritStatusTj.setType_phshzyz(type_phshzyz);culpritStatusTj.setType_qfgmrsqlz(type_qfgmrsqlz);
				culpritStatusTj.setType_qfccz(type_qfccz);culpritStatusTj.setType_fhshglzxz(type_fhshglzxz);
				culpritStatusTj.setType_twhlz(type_twhlz);culpritStatusTj.setType_dzz(type_dzz);
				culpritStatusTj.setType_other(type_other);culpritStatusTj.setReg_city(reg_city);
				culpritStatusTj.setReg_village(reg_village);culpritStatusTj.setReg_other(reg_other);
				culpritStatusTj.setSex_male(sex_male);culpritStatusTj.setSex_female(sex_female);
				culpritStatusTj.setNation_han(nation_han);culpritStatusTj.setNation_few(nation_few);
				culpritStatusTj.setAge_u18(age_u18);culpritStatusTj.setAge_19to45(age_19to45);
				culpritStatusTj.setAge_46to60(age_46to60);culpritStatusTj.setAge_61p(age_61p);
				culpritStatusTj.setQualification_junior(qualification_junior);culpritStatusTj.setQualification_senior(qualification_senior);
				culpritStatusTj.setQualification_middle(qualification_middle);
				culpritStatusTj.setQualification_primary(qualification_primary);
				culpritStatusTj.setWork_study(work_study);
				culpritStatusTj.setWork_on(work_on);
				culpritStatusTj.setWork_nojob(work_nojob);
				culpritStatusTj.setPraise_sqjl(praise_sqjl);
				culpritStatusTj.setPraise_sqcf(praise_sqcf);
				culpritStatusTj.setPraise_cdjx(praise_cdjx);
				culpritStatusTj.setPraise_szacf(praise_szacf);
				culpritStatusTj.setJzbytg(jzbytg);
				culpritStatusTj.setZfxz(zfxz);
				culpritStatusTj.setTotal_accept(total_accept);
				culpritStatusTj.setTotal_relieve(total_relieve);
				culpritStatusTj.setTotal_crime_again(total_crime_again);
			}
			
		}
		
		return childList;
		
	}
	
	//每月1日生成司法所统计表记录
	public void timerInsert() throws ParseException{
		Calendar calendar = Calendar.getInstance();
		calendar.add(calendar.MONTH, -1);//上个月份
		String str=new SimpleDateFormat("yyyy-MM").format(calendar.getTime());
        Date reportDate =new SimpleDateFormat("yyyy-MM").parse(str);
        //防止1号重复插入数据
        CulpritStatusTj culpritStatusTj1=new CulpritStatusTj();
        culpritStatusTj1.setReportDate(reportDate);
        List<CulpritStatusTj> list1=this.findAll(culpritStatusTj1);
        if(list1.size()>0){
        	return;
        }
		List<SysGroup>list=sysGroupService.findAll(new SysGroup());
		CulpritStatusTj culpritStatusTj=new CulpritStatusTj();
		for(SysGroup sysGroup:list){
			String groupId=sysGroup.getId();
			culpritStatusTj.setGroupId(groupId);
			culpritStatusTj.setDicState("91802");//未上报
			culpritStatusTj.setDicWdmcId("91701");//文档名称
			culpritStatusTj.setCurrentSysUser(new SysAccount());
			//统计年月
			culpritStatusTj.setReportDate(reportDate);
			//本月在册人数
			int byzcrs=culpritStatusTjMapper.findByzcrs(groupId);
			culpritStatusTj.setByzcrs(byzcrs);
			//上月在册人数
			int syzcrs=0;
			if(culpritStatusTjMapper.selectAll(culpritStatusTj).size()!=0){
				//System.out.println(culpritStatusTjMapper.findSyzcrs(groupId));
				syzcrs=Integer.parseInt(culpritStatusTjMapper.findSyzcrs(groupId));
			}
			culpritStatusTj.setSyzcrs(syzcrs);
			/**
			 * 本月减少
			 */
			//本月增加
			/*int byzj=culpritStatusTjMapper.findChange_byzj(groupId);*/
			int byzj=byzcrs-syzcrs;
			culpritStatusTj.setChange_byzj(byzj);
			//期满解除矫正
			int qmjcjz=culpritStatusTjMapper.findChange_qmjcjz(groupId);
			culpritStatusTj.setChange_qmjcjz(qmjcjz);
			//收监执行
			int sjzx=culpritStatusTjMapper.findChange_sjzx(groupId);
			culpritStatusTj.setChange_sjzx(sjzx);
			//死亡
			int sw=culpritStatusTjMapper.findChange_sw(groupId);
			culpritStatusTj.setChange_sw(sw);
			//其他原因
			int qtyy=syzcrs+byzj-byzcrs-qmjcjz-sjzx-sw;
			if(qtyy<=0){
				qtyy=0;
			}
			culpritStatusTj.setChange_qtyy(qtyy);
			/**
			 * 类别
			 */
			//管制
			culpritStatusTj.setClass_gz(culpritStatusTjMapper.findClass_lb(groupId,"20001"));
			//缓刑
			culpritStatusTj.setClass_hx(culpritStatusTjMapper.findClass_lb(groupId,"20002"));
			//假释
			culpritStatusTj.setClass_js(culpritStatusTjMapper.findClass_lb(groupId,"20003"));
			//暂予监外执行
			culpritStatusTj.setClass_zyjwzx(culpritStatusTjMapper.findClass_lb(groupId,"20004"));
			//剥夺政治权利
			culpritStatusTj.setClass_bdzzql(culpritStatusTjMapper.findClass_lb(groupId,"20005"));
			
			
			/**
			 * 犯罪类型
			 */
			//危害国家安全
			culpritStatusTj.setType_whgjaqz(culpritStatusTjMapper.findType_fzlb(groupId,"26001"));
			//危害公共安全
			culpritStatusTj.setType_whggaqz(culpritStatusTjMapper.findType_fzlb(groupId,"26002"));
			//破坏社会主义市场经济秩序
			culpritStatusTj.setType_phshzyz(culpritStatusTjMapper.findType_fzlb(groupId,"26003"));
			//侵犯公民人身权利
			culpritStatusTj.setType_qfgmrsqlz(culpritStatusTjMapper.findType_fzlb(groupId,"26004"));
			//侵犯财产
			culpritStatusTj.setType_qfccz(culpritStatusTjMapper.findType_fzlb(groupId,"26005"));
			//妨害社会管理秩序
			culpritStatusTj.setType_fhshglzxz(culpritStatusTjMapper.findType_fzlb(groupId,"26006"));
			//贪污贿赂
			culpritStatusTj.setType_twhlz(culpritStatusTjMapper.findType_fzlb(groupId,"26007"));
			//渎职
			culpritStatusTj.setType_dzz(culpritStatusTjMapper.findType_fzlb(groupId,"26008"));
			//其他
			culpritStatusTj.setType_other(culpritStatusTjMapper.findType_fzlb(groupId,"26009"));
			
			/**
			 * 户籍
			 */
			//城镇户口
			culpritStatusTj.setReg_city(culpritStatusTjMapper.findType_hk(groupId, "12001"));
			//农村户口
			culpritStatusTj.setReg_village(culpritStatusTjMapper.findType_hk(groupId, "12002"));
			//其他户口
			culpritStatusTj.setReg_other(culpritStatusTjMapper.findType_hkqt(groupId));
			
			/**
			 * 性别
			 */
			//男
			culpritStatusTj.setSex_male(culpritStatusTjMapper.findSex(groupId, "10001"));
			//女
			culpritStatusTj.setSex_female(culpritStatusTjMapper.findSex(groupId, "10002"));
			
			
			/**
			 * 年龄统计
			 */
			
			List<Map<String,String>> ageMap = culpritStatusTjMapper.groupByAge(groupId, new Date());
			if(ageMap.size()>0){
				Map<String,String> map=ageMap.get(0);
				Object ob1=map.get("AGE18");
				Object ob2=map.get("AGE45");
				Object ob3=map.get("AGE60");
				Object ob4=map.get("AGEUP");
				String AGE18=ob1.toString();
				String AGE45=ob2.toString();
				String AGE60=ob3.toString();
				String AGEUP=ob4.toString();
				Integer age_u18=Integer.parseInt(AGE18);
				Integer age_19to45=Integer.parseInt(AGE45);
				Integer age_46to60=Integer.parseInt(AGE60);
				Integer age_61p=Integer.parseInt(AGEUP);
				culpritStatusTj.setAge_u18(age_u18);
				culpritStatusTj.setAge_19to45(age_19to45);
				culpritStatusTj.setAge_46to60(age_46to60);
				culpritStatusTj.setAge_61p(age_61p);
			}
			
			/**
			 * 名族
			 */
			//汉族
			culpritStatusTj.setNation_han(culpritStatusTjMapper.findNation(groupId, "104001"));
			//少数名族
			culpritStatusTj.setNation_few(culpritStatusTjMapper.findNation_few(groupId));
			
			/**
			 * 文化程度
			 */
			//大专及以上
			culpritStatusTj.setQualification_junior(culpritStatusTjMapper.findQualification_junior(groupId));
			//高中
			culpritStatusTj.setQualification_senior(culpritStatusTjMapper.findQualification(groupId, "19002"));
			//初中
			culpritStatusTj.setQualification_middle(culpritStatusTjMapper.findQualification(groupId, "19001"));
			//小学及以下
			culpritStatusTj.setQualification_primary(culpritStatusTjMapper.findQualification_primary(groupId));
			
			/**
			 * 就业情况
			 */
			//无业
			culpritStatusTj.setWork_nojob(culpritStatusTjMapper.findWork(groupId, "142003"));
			//已就业
			culpritStatusTj.setWork_on(culpritStatusTjMapper.findWork(groupId, "142002"));
			//在校就读
			culpritStatusTj.setWork_study(culpritStatusTjMapper.findWork(groupId, "142001"));
			
			/**
			 * 奖惩情况
			 */
			// 受治安处罚
			culpritStatusTj.setPraise_szacf(culpritStatusTjMapper.findPraise_szacf(groupId));
			//裁定减刑
			culpritStatusTj.setPraise_cdjx(culpritStatusTjMapper.findPraise_cdjx(groupId));
			//社区矫正机构奖励
			culpritStatusTj.setPraise_sqjl(culpritStatusTjMapper.findPraise_sqjl(groupId));
			//社区矫正机构处处罚
			//1.口头警告
			int ktjg=culpritStatusTjMapper.findPraise_ktjg(groupId);
			//2.警告
			int jg=culpritStatusTjMapper.findPraise_jg(groupId);
			//3.提请撤销缓刑
			int tqcxhx=culpritStatusTjMapper.findPraise_tqcxhx(groupId);
			//4.提请撤销假释
			int tqcxjs=culpritStatusTjMapper.findPraise_tqcxjs(groupId);
			//5.提请撤销监外执行
			int tqcxjwzx=culpritStatusTjMapper.findPraise_tqcxjwzx(groupId);
			
			culpritStatusTj.setPraise_sqcf(ktjg+jg+tqcxhx+tqcxjs+tqcxjwzx);
			/**
			 * 截至本月脱管
			 */
			culpritStatusTj.setJzbytg(culpritStatusTjMapper.findJzbytg(groupId));
			
			/**
			 * 本月重新犯罪
			 */
			culpritStatusTj.setZfxz(culpritStatusTjMapper.findTotal_crime_again(groupId));
			/**
			 * 项目累计
			 */
			//累计接收
			culpritStatusTj.setTotal_accept(culpritStatusTjMapper.findTotal_accept(groupId));
			//累计解除矫正
			culpritStatusTj.setTotal_relieve(culpritStatusTjMapper.findTotal_relieve(groupId));
			//累计重新犯罪
			culpritStatusTj.setTotal_crime_again(culpritStatusTjMapper.findTotal_crime_again(groupId));
			
			this.insert(culpritStatusTj);//自动插入CulpritStatusTj对象
		}
		
		System.out.println("插入完毕");
	}

	//市局完成统计更新所有部门的报表状态
		public void updateDicStatusById(CulpritStatusTj culpritStatusTj){
			this.updateById(culpritStatusTj);
			List<SysGroup> groups=sysGroupService.findAll(new SysGroup());//获取所有部门
			CulpritStatusTj c=new CulpritStatusTj();
			for(SysGroup group:groups){
				c=culpritStatusTjMapper.selectByGroupId(group.getId(),culpritStatusTj.getReportDate());
				c.setDicState("91804");//报表状态更改为完成统计
				culpritStatusTjMapper.updateByPrimaryKeySelective(c);
			}
		}
	
	
}









