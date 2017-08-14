package com.rowell.sifa.service.homepage;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.homepage.SenderMapper;
import com.rowell.sifa.pojo.homepage.Sender;
import com.rowell.sifa.service.base.CrudService;

/**
 * @ClassName: AskLeaveService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author yxb
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class SenderService extends CrudService<SenderMapper, Sender> {
	
}
