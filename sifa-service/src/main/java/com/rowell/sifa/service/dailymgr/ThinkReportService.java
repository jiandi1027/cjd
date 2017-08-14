package com.rowell.sifa.service.dailymgr;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.dailymgr.ThinkReportMapper;
import com.rowell.sifa.pojo.dailymgr.ThinkReport;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class ThinkReportService extends CrudService<ThinkReportMapper, ThinkReport> {
	
}
	
	