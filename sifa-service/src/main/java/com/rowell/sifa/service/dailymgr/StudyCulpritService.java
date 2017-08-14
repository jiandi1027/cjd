package com.rowell.sifa.service.dailymgr;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.dailymgr.StudyCulpritMapper;
import com.rowell.sifa.pojo.dailymgr.StudyCulprit;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class StudyCulpritService extends CrudService<StudyCulpritMapper, StudyCulprit> {

}
	
	