  
    /**    
    * @Title: FileUploadController.java  
    * @Package com.rowell.sifa.web.sys  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年4月17日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.web.sys;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.Date;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.RandomUtils;
import org.joda.time.DateTime;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.gson.Gson;
import com.rowell.common.pojo.PicUploadResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.config.Global;
import com.rowell.sifa.pojo.sys.MultipartFileParam;
import com.rowell.sifa.sys.utils.MultipartFileUploadUtil;

/**  
    * @ClassName: FileUploadController  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author xiaoguang  
    * @date 2017年4月17日  
    *    
    */
@Controller
@RequestMapping("/fileUpload")
public class FileUploadController {
	private static AtomicLong counter = new AtomicLong(0L);


    @RequestMapping(method = {RequestMethod.POST}, value = {"/upload"})
    @ResponseBody
    public PicUploadResult uploadv2(HttpServletRequest request, HttpServletResponse resp) throws Exception {

        String prefix = "req_count:" + counter.incrementAndGet() + ":";
        System.out.println(prefix + "start !!!");
     // 封装Result对象，并且将文件的byte数组放置到result对象中
     		PicUploadResult fileUploadResult = new PicUploadResult();
        //使用 工具类解析相关参数，工具类代码见下面
        MultipartFileParam param = MultipartFileUploadUtil.parse(request);
        System.out.println(prefix + "chunks= " + param.getChunks());
        System.out.println(prefix + "chunk= " + param.getChunk());
        System.out.println(prefix + "chunkSize= " + param.getParam().get("chunkSize"));
        //这个必须与前端设定的值一致
        long chunkSize = 512 * 1024;

        if (param.isMultipart()) {

            String finalDirPath = "D:/data0/uploads/";
            String tempDirPath = finalDirPath + param.getId();
            String tempFileName = param.getFileName() + "_tmp";
            File confFile = new File(tempDirPath, param.getFileName() + ".conf");
            File tmpDir = new File(tempDirPath);
            File tmpFile = new File(tempDirPath, tempFileName);
            if (!tmpDir.exists()) {
                tmpDir.mkdirs();
            }

            RandomAccessFile accessTmpFile = new RandomAccessFile(tmpFile, "rw");
            RandomAccessFile accessConfFile = new RandomAccessFile(confFile, "rw");

            long offset = chunkSize * param.getChunk();
            //定位到该分片的偏移量
            accessTmpFile.seek(offset);
            //写入该分片数据
            accessTmpFile.write(param.getFileItem().get());

            //把该分段标记为 true 表示完成
            System.out.println(prefix + "set part " + param.getChunk() + " complete");
            accessConfFile.setLength(param.getChunks());
            accessConfFile.seek(param.getChunk());
            accessConfFile.write(Byte.MAX_VALUE);

            //completeList 检查是否全部完成,如果数组里是否全部都是(全部分片都成功上传)
            byte[] completeList = FileUtils.readFileToByteArray(confFile);
            byte isComplete = Byte.MAX_VALUE;
            for (int i = 0; i < completeList.length && isComplete==Byte.MAX_VALUE; i++) {
                //与运算, 如果有部分没有完成则 isComplete 不是 Byte.MAX_VALUE
                isComplete = (byte)(isComplete & completeList[i]);
                System.out.println(prefix + "check part " + i + " complete?:" + completeList[i]);
            }

            if (isComplete == Byte.MAX_VALUE) {
            	fileUploadResult.setOriginName(param.getFileName());
    			fileUploadResult.setUrl(finalDirPath);
    			fileUploadResult.setError(0);
    			//fileUploadResult.setFileName(filePath.substring(filePath.lastIndexOf(File.separator) + 1));
                System.out.println(prefix + "upload complete !!");
            }
            accessTmpFile.close();
            accessConfFile.close();
        }
        System.out.println(prefix + "end !!!");
        return fileUploadResult;
    }
    
	/**
	 * 单个文件同步接口
	 * 
	 * @param request
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/upload2", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String photoUpload(@RequestParam(value = "file", required = false) MultipartFile uploadFile,
			HttpServletRequest request, HttpServletResponse response)
			throws JsonGenerationException, JsonMappingException, IOException {

		// 封装Result对象，并且将文件的byte数组放置到result对象中
		PicUploadResult fileUploadResult = new PicUploadResult();
		if (request.getParameter("chunk") == null) {
			//
			// String realPath = request.getSession().getServletContext()
			// .getRealPath("/Upload/");
			String fileName = uploadFile.getOriginalFilename();
			String filePath = getFilePath(fileName);

			File newFile = new File(Global.getConfig("pic.store.path") + filePath);

			// 写文件到磁盘

			// 写文件到磁盘
			uploadFile.transferTo(newFile); // 小文件，直接拷贝
			fileUploadResult.setOriginName(fileName);
			fileUploadResult.setUrl(filePath);
			fileUploadResult.setFileSize(uploadFile.getSize()/1024.0);
			fileUploadResult.setError(0);
			fileUploadResult.setFileName(filePath.substring(filePath.lastIndexOf(File.separator) + 1));
			Gson gson = new Gson();

			return gson.toJson(fileUploadResult);
		} else {
			int chunk = Integer.parseInt(request.getParameter("chunk")); // 当前分片
			int chunks = Integer.parseInt(request.getParameter("chunks")); // 分片总计

			// String realPath = request.getSession().getServletContext()
			// .getRealPath("/Upload/");

			String fileName = uploadFile.getOriginalFilename();
			String filePath = getFilePath(fileName);

			File newFile = new File(Global.getConfig("pic.store.path") + filePath);
			OutputStream outputStream = new FileOutputStream(newFile, true);
			InputStream inputStream = uploadFile.getInputStream();

			byte buffer[] = new byte[1024];
			int len = 0;
			while ((len = inputStream.read(buffer)) > 0) {
				outputStream.write(buffer, 0, len);
			}
			inputStream.close();
			outputStream.close();

			fileUploadResult.setOriginName(fileName);
			fileUploadResult.setUrl(filePath);
			fileUploadResult.setError(0);
			fileUploadResult.setFileName(filePath.substring(filePath.lastIndexOf(File.separator) + 1));
			Gson gson = new Gson();

			return gson.toJson(fileUploadResult);
		}

	}
	
	  //E:\\1110\\taotao-upload\\images\\2015\\11\\13\\20151113111111111.jpg
    private String getFilePath(String sourceFileName) {
       // String baseFolder = Global.getConfig("pic.store.path");
        		//"E:\\0114\\taotao-upload" + File.separator + "images";
        Date nowDate = new Date();
        // yyyy/MM/dd
        String fileFolder = new DateTime(nowDate).toString("yyyy")
                + File.separator + new DateTime(nowDate).toString("MM") + File.separator
                + new DateTime(nowDate).toString("dd");
        File file = new File(Global.getConfig("pic.store.path")+fileFolder);
        if (!file.isDirectory()) {
            // 如果目录不存在，则创建目录
            file.mkdirs();
        }
        // 生成新的文件名
        String fileName = new DateTime(nowDate).toString("yyyyMMddhhmmssSSSS")
                + RandomUtils.nextInt(100, 9999) + "." + StringUtils.substringAfterLast(sourceFileName, ".");
        return fileFolder + File.separator + fileName;
    }
    


}
