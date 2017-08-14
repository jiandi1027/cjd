  
    /**    
    * @Title: MultipartFileUploadUtil.java  
    * @Package com.rowell.sifa.sys.utils  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年4月17日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.sys.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.math.NumberUtils;

import com.rowell.sifa.pojo.sys.MultipartFileParam;

/**  
    * @ClassName: MultipartFileUploadUtil  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author xiaoguang  
    * @date 2017年4月17日  
    *    
    */

public class MultipartFileUploadUtil {
	 /**
     * 在HttpServletRequest中获取分段上传文件请求的信息
     * @param request
     * @return
     */
    public static MultipartFileParam parse(HttpServletRequest request) throws Exception {
        MultipartFileParam param = new MultipartFileParam();

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        param.setMultipart(isMultipart);
        if(isMultipart){
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            // 得到所有的表单域，它们目前都被当作FileItem
            List<FileItem> fileItems = upload.parseRequest(request);
            for (FileItem fileItem : fileItems) {
                System.out.println("field name has:"+fileItem.getFieldName());
                if (!"file".equals(fileItem.getFieldName())){
                    System.out.println("field val has:"+fileItem.getString());
                }

                if (fileItem.getFieldName().equals("id")) {
                    param.setId(fileItem.getString());
                } else if (fileItem.getFieldName().equals("name")) {
                    param.setFileName(new String(fileItem.getString().getBytes(
                            "ISO-8859-1"), "UTF-8"));
                } else if (fileItem.getFieldName().equals("chunks")) {
                    param.setChunks(NumberUtils.toInt(fileItem.getString()));
                } else if (fileItem.getFieldName().equals("chunk")) {
                    param.setChunk(NumberUtils.toInt(fileItem.getString()));
                } else if (fileItem.getFieldName().equals("file")) {
                    param.setFileItem(fileItem);
                    param.setSize(fileItem.getSize());
                } else{
                    param.getParam().put(fileItem.getFieldName(), fileItem.getString());
                }
            }
        }

        return param;
    }


}
