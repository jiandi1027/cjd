package com.rowell.sifa.web.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.util.Date;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.tools.ant.util.DateUtils;

import com.google.gson.Gson;
import com.rowell.common.pojo.PicUploadResult;
import com.rowell.common.utils.FileUtil;
import com.rowell.common.utils.IdGen;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.config.Global;
import com.rowell.sifa.pojo.sys.MultipartFileParam;
import com.rowell.sifa.sys.utils.MultipartFileUploadUtil;

@SuppressWarnings("serial")
public class FileUploadServlet extends HttpServlet {
	private Logger logger = Logger.getLogger(this.getClass());
	private static AtomicLong counter = new AtomicLong(0L);

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		try {
			
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
		        String extName="";
		        if (param.isMultipart()) {

		            String finalDirPath = Global.getConfig("file.upload.temppath");
		            String tempDirPath = finalDirPath+ param.getId();
		         // 扩展名格式：
					if (param.getFileName().lastIndexOf(".") >= 0) {
						extName = param.getFileName().substring(param.getFileName().lastIndexOf("."));
					}
		            String tempFileName =  param.getFileName() ;
		            		//+ "_tmp";
		            File confFile = new File(tempDirPath, tempFileName + ".conf");
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
		            	String newFilePath = finalDirPath+"/"+DateUtils.format(new Date(), "yyyy/MM/dd");
		            	String newFileName = IdGen.uuid()+param.getFileName().substring(param.getFileName().lastIndexOf("."));
		            	FileUtil.moveFile(tempDirPath, newFilePath, tempFileName, newFileName);
		            	fileUploadResult.setOriginName(param.getFileName());
		            	fileUploadResult.setFileName(newFileName);
		    			fileUploadResult.setUrl(DateUtils.format(new Date(), "yyyy/MM/dd"));
		    			fileUploadResult.setError(0);
		    			//fileUploadResult.setFileName(tempFileName);
		                System.out.println(prefix + "upload complete !!");
		            }
		            accessTmpFile.close();
		            accessConfFile.close();
		        }
		        System.out.println(prefix + "end !!!");
//			String result = "{\"originalName\":\"" + originalName + "\",\"tempName\":\"" + name
//					+ extName + "\"}";
			Gson gson = new Gson();

			outPrint(gson.toJson(fileUploadResult), response);
		} catch (Exception e) {
			response.getWriter().print("error");
			logger.error(e);
		}
	}

	public static PrintWriter outPrint(String content, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Pragma", "No-Cache");
		response.addHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();

		if (!StringUtils.isBlank(content))
			out.print(content);

		return out;
	}
}
