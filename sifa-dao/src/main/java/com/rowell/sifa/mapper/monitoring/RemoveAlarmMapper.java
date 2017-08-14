/*
* RemoveAlarmMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-08-08 created
*/
package com.rowell.sifa.mapper.monitoring;

import java.util.List;

import com.rowell.sifa.pojo.monitoring.RemoveAlarm;

public interface RemoveAlarmMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.monitoring.RemoveAlarm> {

	List<RemoveAlarm> selectAllByRowone(RemoveAlarm removeAlarm);
}