package com.rowell.sifa.service.dailymgr;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.dailymgr.DailyReportMapper;
import com.rowell.sifa.pojo.dailymgr.DailyReport;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class DailyReportService extends CrudService<DailyReportMapper, DailyReport> {

	
	
}
	
	