
/**    
* @Title: SysCallBackmsgService.java  
* @Package com.rowell.sifa.service.sys  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年2月28日  
* @version V1.0    
*/

package com.rowell.sifa.service.sys;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.sys.SysCallBackmsgMapper;
import com.rowell.sifa.pojo.sys.SysCallBackmsg;
import com.rowell.sifa.service.base.CrudService;

/**
 * @ClassName: SysCallBackmsgService
 * @Description: 声纹回调信息service
 * @author xiaoguang
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class SysCallBackmsgService extends CrudService<SysCallBackmsgMapper, SysCallBackmsg> {

	/**
	 * 查询最新的回调信息
	 * @param telno
	 * @return
	 */
	public List<SysCallBackmsg> findMaxByTelno(String telno) {
		// TODO 自动生成的方法存根
		return dao.findMaxByTelno(telno);
	}
	
}
