package com.rowell.sifa.service.monitoring;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.dailymgr.TerminalAreaMapper;
import com.rowell.sifa.mapper.monitoring.TerminalActivityMapper;
import com.rowell.sifa.mapper.monitoring.TerminalMapper;
import com.rowell.sifa.pojo.dailymgr.TerminalArea;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.pojo.monitoring.TerminalActivity;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class TerminalAreaService  extends CrudService<TerminalAreaMapper, TerminalArea> { 

}
