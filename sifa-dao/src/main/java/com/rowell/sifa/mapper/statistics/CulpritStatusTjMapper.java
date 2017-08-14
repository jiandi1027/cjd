/*
* ProcessDetailMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-18 created
*/
package com.rowell.sifa.mapper.statistics;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rowell.sifa.pojo.statistics.CulpritStatusTj;

public interface CulpritStatusTjMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.statistics.CulpritStatusTj> {
	//根据部门编号查找
	public CulpritStatusTj selectByGroupId(@Param("groupId")String groupId,@Param("reportDate")Date reportDate);
	
	/*//根据部门编号查找
	public CulpritStatusTj returnByGroupId(@Param("groupId")String groupId,@Param("reportDate")Date reportDate);*/
	//本月在册人数
	public int findByzcrs(String groupId);
	
	// 上月在册人数
	public String findSyzcrs(String groupId);

	//本月增加
	public int findChange_byzj(String groupId);

	//期满解除矫正
	public int findChange_qmjcjz(String groupId);

	//收监执行
	public int findChange_sjzx(String groupId);
	
	//死亡
	public int findChange_sw(String groupId);


	//类别
	public int findClass_lb(@Param("groupId")String groupId,@Param("key")String key);
	
	//犯罪类别
	public int findType_fzlb(@Param("groupId")String groupId,@Param("key")String key);
	
	//户口
	public int findType_hk(@Param("groupId")String groupId,@Param("key")String key);
	
	//其他户口
	public int findType_hkqt(String groupId);
	
	//性别
	public int findSex(@Param("groupId")String groupId,@Param("key")String key);
	
	//汉族
	public int findNation(@Param("groupId")String groupId,@Param("key")String key);
	
	//少数名族
	public int findNation_few(String groupId);

	
	/*//18以下
	public int findAge_u18(String groupId);

	//19-45
	public int findAge_19to45(String groupId);

	// 46-60
	public int findAge_46to60(String groupId);

	// 61岁以上
	public int findAge_61p(String groupId);*/
	
	//文化程度（初中，高中）
	public int findQualification(@Param("groupId")String groupId,@Param("key")String key);
	//小学及以下
	public int findQualification_primary(String groupId);
	//大专以上
	public int findQualification_junior(String groupId);

	//就业就学情况
	public int findWork(@Param("groupId")String groupId,@Param("key")String key);
	

	//受治安处罚
	public int findPraise_szacf(String groupId);
	
	//裁定减刑
	public int findPraise_cdjx(String groupId);
	
	// 社区矫正机构奖励
	public int findPraise_sqjl(String groupId);
	
	//社区矫正机构处处罚
	//public int findPraise_sqcf(@Param("tabName")String tabName,@Param("groupId")String groupId);
	//口头警告
	public int findPraise_ktjg(String groupId);
	//警告
	public int findPraise_jg(String groupId);
	//提请撤销缓刑
	public int findPraise_tqcxhx(String groupId);
	//提请撤销假释
	public int findPraise_tqcxjs(String groupId);
	//提请撤销监外执行
	public int findPraise_tqcxjwzx(String groupId);
	
	
	//本月重新犯罪
	public int find_zfxz(String groupId);
	
	// 截止本月脱管
	public int findJzbytg(String groupId);
	
	// 累计接收
	public int findTotal_accept(String groupId);
	
	//累计解除矫正
	public int findTotal_relieve(String groupId);
	
	//累计重新犯罪
	public int findTotal_crime_again(String groupId);

	//按照年龄统计
	List<Map<String,String>> groupByAge(@Param("groupId") String groupId,@Param("searchEndDate") Date searchEndDate);
	
}