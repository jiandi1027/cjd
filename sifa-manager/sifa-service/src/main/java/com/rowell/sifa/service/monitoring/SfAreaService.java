package com.rowell.sifa.service.monitoring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.monitoring.SfAreaMapper;
import com.rowell.sifa.pojo.monitoring.SfArea;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class SfAreaService extends CrudService<SfAreaMapper, SfArea>  {
	@Autowired
	protected SfAreaMapper sfAreaMapper;
	 public List<SfArea> findAll1(SfArea record){
	    	return sfAreaMapper.selectAll1(record);
	    }
}

