package com.rowell.sifa.service.homepage;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.dailymgr.ReceiptMapper;
import com.rowell.sifa.pojo.homepage.Receipt;
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
public class ReceiptService extends CrudService<ReceiptMapper, Receipt> {
	
}
