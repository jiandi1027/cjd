package com.rowell.sifa.service.policeCheck;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.policeCheck.ExceptionInfoMapper;
import com.rowell.sifa.pojo.policeCheck.ExceptionInfo;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class ExceptionInfoService extends CrudService<ExceptionInfoMapper, ExceptionInfo> {

	
	
}
	
	