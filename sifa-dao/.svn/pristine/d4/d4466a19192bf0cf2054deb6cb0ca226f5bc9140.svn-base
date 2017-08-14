/*
* TerminalctivityMapper.java
* Copyright(C) 2009-2016 融威科技有限公司
* 2017-03-24 created
*/
package com.rowell.sifa.mapper.monitoring;

import java.util.Date;
import java.util.List;

import com.rowell.common.mapper.CrudDao;
import com.rowell.sifa.pojo.monitoring.TerminalHistory;
public interface TerminalHistoryMapper extends CrudDao<TerminalHistory> {
	public List<TerminalHistory> findHisByTime(Date startTime,Date endTime,String mobileNumber);
}