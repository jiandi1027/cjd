
package com.rowell.sifa.service.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.rowell.sifa.mapper.sys.QxjbMapper;
import com.rowell.sifa.pojo.sys.Qxjb;
import com.rowell.sifa.pojo.sys.Tjb;
import com.rowell.sifa.service.base.CrudService;


@Service
@Transactional(readOnly = true)
public class QxjbService extends CrudService<QxjbMapper, Qxjb> {
	@Autowired
	private QxjbMapper qxjbMapper;
	
	
	
	public String findMax() 
	{
		return qxjbMapper.findMax();
	}



	public List<Qxjb> findLast(){
		return qxjbMapper.findLast();
	}
	
	public void updatejihao(String jihao){
		qxjbMapper.updatejihao(jihao);
	}
	
	public void deletejihao(String jihao)
	{
		qxjbMapper.deletejihao(jihao);
	}
}
