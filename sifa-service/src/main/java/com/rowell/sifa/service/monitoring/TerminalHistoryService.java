package com.rowell.sifa.service.monitoring;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.monitoring.TerminalHistoryMapper;
import com.rowell.sifa.pojo.monitoring.TerminalHistory;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class TerminalHistoryService  extends CrudService<TerminalHistoryMapper, TerminalHistory> {
	
	public List<TerminalHistory>  findHisByTime(Date startTime,Date endTime,String mobileNumber){
		return dao.findHisByTime(startTime, endTime, mobileNumber);
	}
}
