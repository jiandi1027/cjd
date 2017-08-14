package com.rowell.sifa.service.monitoring;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.monitoring.RemoveAlarmMapper;
import com.rowell.sifa.pojo.monitoring.RemoveAlarm;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class RemoveAlarmService  extends CrudService<RemoveAlarmMapper, RemoveAlarm> { 
	
	public List<RemoveAlarm> findAllByRowone(RemoveAlarm removeAlarm){
    	return dao.selectAllByRowone(removeAlarm);
    }
}
