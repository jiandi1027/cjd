
package com.rowell.sifa.service.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.homepage.ToBeProcessedMapper;
import com.rowell.sifa.mapper.sys.TjbMapper;
import com.rowell.sifa.pojo.sys.Tjb;
import com.rowell.sifa.service.base.CrudService;


@Service
@Transactional(readOnly = true)
public class TjbService extends CrudService<TjbMapper, Tjb> {
	@Autowired
	private TjbMapper tjbMapper;
	
	
	
	public String findMax() 
	{
		return tjbMapper.findMax();
	}



	public List<Tjb> findLast() {
		
		return tjbMapper.findLast();
	}
	
	public void updatejihao(String jihao){
		tjbMapper.updatejihao(jihao);
	}
	public void deletejihao(String jihao){
		tjbMapper.deletejihao(jihao);
	}
}
