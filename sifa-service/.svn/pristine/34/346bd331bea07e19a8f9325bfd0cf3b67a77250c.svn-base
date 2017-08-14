
package com.rowell.sifa.service.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.sys.KqbMapper;

import com.rowell.sifa.pojo.sys.Kqb;

import com.rowell.sifa.service.base.CrudService;


@Service
@Transactional(readOnly = true)
public class KqbService extends CrudService<KqbMapper, Kqb> {
	@Autowired
	private KqbMapper kqbMapper;
	
	
	
	public String findMax() 
	{
		return kqbMapper.findMax();
	}
	public String findJihao() 
	{
		return kqbMapper.findJihao();
	}



	public List<Kqb> findLast(){
		return kqbMapper.findLast();
	}
}
