package com.rowell.common.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
/**
 * 操作文件工具类
 * @author Administrator
 *
 */
public class FileUtil {
	/**
	 * 读取文件中的内容
	 * @param is
	 * @return
	 */
	public static String readerFileContent(InputStream is){
		
		StringBuffer sb = new StringBuffer();
		String temp;
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			while((temp=br.readLine())!=null){
				sb.append(temp);
			}
			br.close();
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return sb.toString();
	}
	public static void storeFile(InputStream inputStream,String fullPath){
		fullPath = fullPath.replace("/", File.separator);
		String filePath=fullPath.substring(0,fullPath.lastIndexOf(File.separator));
		String fileName = fullPath.substring(fullPath.lastIndexOf(File.separator)+1);
		storeFile(inputStream,filePath,fileName);
	}
	
	public static void renameFile(String oldFilePath,String changeFilePath,String oldName,String newFileName){
		File changeFile = new File(changeFilePath);
		if(!changeFile.exists()){
			changeFile.mkdirs();
		}
		
		 File oldfile=new File(oldFilePath+"/"+oldName); 
         File newfile=new File(changeFilePath+"/"+newFileName); 
         if(!oldfile.exists()){
             return;//重命名文件不存在
         }
         if(newfile.exists())//若在该目录下已经有一个文件和新文件名相同，则不允许重命名 
             System.out.println(newFileName+"已经存在！"); 
         else{ 
             Boolean isSuccess = oldfile.renameTo(newfile); 
             System.out.println(isSuccess);
             oldfile.delete();
         } 
		
	}
	
	 /** 
     * 复制单个文件 
     * @param oldPath String 原文件路径 如：c:/fqf.txt 
     * @param newPath String 复制后路径 如：f:/fqf.txt 
     * @return boolean 
     */ 
   public static void copyFile(String oldPath, String newPath) { 
       try { 
           int bytesum = 0; 
           int byteread = 0; 
           File oldfile = new File(oldPath); 
           if (oldfile.exists()) { //文件存在时 
               InputStream inStream = new FileInputStream(oldPath); //读入原文件 
               FileOutputStream fs = new FileOutputStream(newPath); 
               byte[] buffer = new byte[1444]; 
               int length; 
               while ( (byteread = inStream.read(buffer)) != -1) { 
                   bytesum += byteread; //字节数 文件大小 
                   System.out.println(bytesum); 
                   fs.write(buffer, 0, byteread); 
               } 
               inStream.close(); 
               fs.close();
           } 
       } 
       catch (Exception e) { 
           System.out.println("复制单个文件操作出错"); 
           e.printStackTrace();

       }

   }
   /** 
    * 删除文件 
    * @param filePathAndName String 文件路径及名称 如c:/fqf.txt 
    * @param fileContent String 
    * @return boolean 
    */ 
  public static void delFile(String filePathAndName) { 
      try { 
          String filePath = filePathAndName; 
          filePath = filePath.toString(); 
          java.io.File myDelFile = new java.io.File(filePath); 
          myDelFile.delete();
          

      } 
      catch (Exception e) { 
          System.out.println("删除文件操作出错"); 
          e.printStackTrace();

      }

  }
	
	 /** 
     * 移动文件到指定目录 
     * @param oldPath String 如：c:/fqf.txt 
     * @param newPath String 如：d:/fqf.txt 
     */ 
   public static void moveFile(String oldFilePath,String changeFilePath,String oldName,String newFileName) { 
	   File changeFile = new File(changeFilePath);
		if(!changeFile.exists()){
			changeFile.mkdirs();
		}
		//拷贝文件
       copyFile(oldFilePath+"/"+oldName, changeFilePath+"/"+newFileName); 
       //删除原文件
       delFile(oldFilePath+"/"+oldName);
   }
	public static void storeFile(InputStream inputStream,String filePath,String fileName){
		try {
			byte[] datas = new byte[1024];
			int len=-1;
			File file = new File(filePath);
			if(!file.exists()){
				file.mkdirs();
			}
			FileOutputStream output = new FileOutputStream(new File(filePath
					,fileName));
			while((len=inputStream.read(datas))!=-1){
				output.write(datas,0,len);
			}
			inputStream.close();
			output.close();
		} catch (Exception e) {
			throw new RuntimeException("error.material.saveAttachment");
		} 
	}
	
	public static void downloadAttach(String filePath, String fileName, HttpServletResponse response) throws IOException {
		if (!StringUtils.isBlank(filePath)) {
			// 下载本地文件
			// 读到流中
			InputStream inStream = new FileInputStream(filePath);// 文件的存放路径
			// 设置输出的格式
			response.reset();
			response.setContentType("bin");
			response.addHeader("Content-Disposition",
					"attachment; filename=\"" + java.net.URLEncoder.encode(fileName, "UTF-8") + "\"");
			// 循环取出流中的数据
			byte[] b = new byte[100];
			int len;

			while ((len = inStream.read(b)) > 0)
				response.getOutputStream().write(b, 0, len);
			inStream.close();
		}
		
	}
	
	/**
	 * 一行一行地文件的写入
	 * 
	 * @param filePath
	 * @param args
	 * @param encode
	 * @throws IOException
	 */
	public static void writeLineFile(String filePath, List<String> args, String encode) throws IOException {
		FileOutputStream fos = null;
		Writer out = null;
		try {
			
			String fileRootPath = filePath.substring(0,filePath.lastIndexOf("/"));
			File file = new File(fileRootPath);
			if(!file.exists()){
				file.mkdirs();
			}
			
			fos = new FileOutputStream(filePath,true);
			out = new OutputStreamWriter(fos, encode);
			StringBuffer content = new StringBuffer();
			for (Iterator<String> it = args.iterator(); it.hasNext();) {
				content.append(it.next() + "\r\n");
			}
			out.write(content.toString());

		} catch (IOException e) {
			throw e;
		} finally {
			if (out != null) {
				out.close();
				out = null;
			}
			if (fos != null) {
				fos.close();
				fos = null;
			}
		}

	}
	
	public static void main(String[] args) {
		String path = "F:\\反扒资料\\excelImort\\ksls.doc";
		String filePath=path.substring(0,path.lastIndexOf(File.separator));
		String fileName = path.substring(path.lastIndexOf(File.separator)+1);
		System.out.println(filePath+"==="+fileName);
	}

}

