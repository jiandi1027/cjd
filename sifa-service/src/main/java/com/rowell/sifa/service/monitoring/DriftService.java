package com.rowell.sifa.service.monitoring;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.monitoring.DriftMapper;
import com.rowell.sifa.pojo.monitoring.Drift;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class DriftService  extends CrudService<DriftMapper, Drift> { 

}
