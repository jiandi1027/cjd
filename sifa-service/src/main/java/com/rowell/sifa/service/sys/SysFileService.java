  
    /**    
    * @Title: SysAccountService.java  
    * @Package com.rowell.sifa.service.sys  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.sys;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.sys.SysFileMapper;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: SysAccountService  
    * @Description:  帐号表service 
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
public class SysFileService extends CrudService<SysFileMapper, SysFile> {
	
	
	/**
	 * 保存附件
	 * @param fileList
	 * @param tableName
	 * @param tableId
	 * @param fileType
	 */
	public void saveFiles(List<SysFile> fileList,String tableName,String tableId,String fileType){
		try{
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			if(fileList!=null){
				for(SysFile file:fileList){
					file.setTableName(tableName);
					file.setTableId(tableId);
					file.setFileType(fileType);
					file.setCurrentSysUser(sysAccount);
					file.preInsert();
					dao.insert(file);
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}

	}
	

	  




	    


	  

}
