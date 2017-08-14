  
    /**    
    * @Title: CulpritLawService.java  
    * @Package com.rowell.sifa.service.culpritinfo  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.culpritinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.mapper.culpritinfo.CulpritLawMapper;
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.sys.SysFileService;

/**  
    * @ClassName: CulpritLawService  
    * @Description: 依据的法律文书相关信息service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class CulpritLawService extends CrudService<CulpritLawMapper, CulpritLaw> {
	@Autowired
	private SysFileService sysFileService;
	public CommonJsonResult saveCulpritLaw(CulpritLaw culpritLaw,List<SysFile> fileList) {
		CommonJsonResult commonJsonResult = null;
		if (StringUtils.isBlank(culpritLaw.getId())) {
			this.saveOrUpdate(culpritLaw);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功");
		} else {
			this.updateByIdSelective(culpritLaw);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("修改成功");
		}
		//保存法律文书
		sysFileService.saveFiles(fileList, Constants.FILE_TABLE_CULPRITlAW, culpritLaw.getCulpritId(), Constants.FILE_CULPRITlAW_DOC_PATH);
		return commonJsonResult;
	}
	
	
}
