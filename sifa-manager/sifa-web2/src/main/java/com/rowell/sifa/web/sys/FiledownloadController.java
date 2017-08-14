
/**    
* @Title: FiledownloadController.java  
* @Package com.rowell.sifa.web.sys  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年6月5日  
* @version V1.0    
*/

package com.rowell.sifa.web.sys;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.sifa.common.config.Global;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: FiledownloadController
 * @Description: 文件下载controller
 * @author xiaoguang
 * @date 2017年6月5日
 * 
 */
@Controller
@RequestMapping("/sys/file")
public class FiledownloadController extends BaseController {
	@Autowired
	private SysFileService sysFileService;

	/***
	 * 
	 * @Title: download @Description: 文件下载 @param @param id
	 * 文件id @param @return @param @throws UnsupportedEncodingException
	 * 参数 @return ResponseEntity<byte[]> 返回类型 @throws
	 */
	@RequestMapping(value = "download", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public void download(@RequestParam(value = "id") String id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		String finalDirPath = Global.getConfig("file.upload.temppath");

		SysFile sysFile = sysFileService.findById(id);

		String path = (finalDirPath + sysFile.getPath() + "/" + sysFile.getName()).replace("/", File.separator);
	
		// File file=new File(path);
		// 上传的文件都是保存在/WEB-INF/upload目录下的子目录当中

		// 设置响应头，控制浏览器下载该文件
		response.setHeader("content-disposition",
				"attachment;filename=" + URLEncoder.encode(sysFile.getOriginName(), "UTF-8"));
		// 读取要下载的文件，保存到文件输入流
		FileInputStream in = new FileInputStream(path);
		// 创建输出流
		OutputStream out = response.getOutputStream();
		// 创建缓冲区
		byte buffer[] = new byte[1024];
		int len = 0;
		// 循环将输入流中的内容读取到缓冲区当中
		while ((len = in.read(buffer)) > 0) {
			// 输出缓冲区的内容到浏览器，实现文件下载
			out.write(buffer, 0, len);
		}
		// 关闭文件输入流
		in.close();
		// 关闭输出流
		out.close();
	}

	@RequestMapping(value = "xiazai", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public void xiazai( HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		
	
		// File file=new File(path);
		// 上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
		FileInputStream in=null;
		OutputStream out=null;
		try {
			String path = "C:/Users/DELL/Desktop/考勤统计表.xls";
			// 设置响应头，控制浏览器下载该文件
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("考勤统计表.xls", "UTF-8"));
			// 读取要下载的文件，保存到文件输入流
			in = new FileInputStream(path);
			// 创建输出流
			out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中c
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally
		{
				// 关闭文件输入流
						in.close();
						// 关闭输出流
						out.close();
		}
	}
	
	
	
	
	/***
	 * 
	 * @Title: delete @Description: 删除附件 @param @param investigate @param @param
	 * redirectAttributes @param @return 参数 @return CommonJsonResult
	 * 返回类型 @throws
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public CommonJsonResult delete(@RequestParam(value = "id") String id, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysFileService.deleteById(id);

			commonJsonResult = CommonJsonResult.build(200, "删除成功", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}

		return commonJsonResult;
	}
}
