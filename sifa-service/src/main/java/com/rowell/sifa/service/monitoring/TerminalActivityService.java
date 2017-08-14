package com.rowell.sifa.service.monitoring;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.monitoring.TerminalActivityMapper;
import com.rowell.sifa.pojo.monitoring.TerminalActivity;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class TerminalActivityService  extends CrudService<TerminalActivityMapper, TerminalActivity> { 

}
