  
    /**    
    * @Title: CulpritDocService.java  
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
import com.rowell.sifa.mapper.culpritinfo.CulpritDocMapper;
import com.rowell.sifa.pojo.culpritinfo.CulpritDoc;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.sys.SysFileService;

/**  
    * @ClassName: CulpritDocService  
    * @Description: 文档service层  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class CulpritDocService extends CrudService<CulpritDocMapper, CulpritDoc> {
	@Autowired
	private SysFileService sysFileService;
	//保存文档
	public CommonJsonResult saveCulpritDoc(CulpritDoc culpritDoc,List<SysFile> fileList){
		CommonJsonResult commonJsonResult = null;
		if (StringUtils.isBlank(culpritDoc.getId())) {
			this.saveOrUpdate(culpritDoc);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功!");
		} else {
			this.updateByIdSelective(culpritDoc);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("修改成功!");
		}
		//安置帮教协议书
		sysFileService.saveFiles(fileList, Constants.FILE_TABLE_CULPRITDOC,culpritDoc.getCulpritId(), Constants.FILE_CULPRIT_DOC_AZBJ);
		return commonJsonResult;
	}
	
	
}
