/*
* TerminalctivityMapper.java
* Copyright(C) 2009-2016 融威科技有限公司
* 2017-03-24 created
*/
package com.rowell.sifa.mapper.monitoring;

import java.util.List;

import com.rowell.common.mapper.CrudDao;
import com.rowell.sifa.pojo.monitoring.SfArea;

public interface SfAreaMapper extends CrudDao<SfArea> {
	 List<SfArea> selectAll1(SfArea sfArea);
}