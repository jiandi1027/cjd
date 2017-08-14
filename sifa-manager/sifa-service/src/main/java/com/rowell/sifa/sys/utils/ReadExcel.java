package com.rowell.sifa.sys.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import org.apache.poi.ss.util.RegionUtil;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.rowell.sifa.pojo.sys.Kqb;
import com.rowell.sifa.sys.utils.Customer;

/**
 * @author wkr
 * @Date 2016-11-18 工具类读取Excel类中内容
 */
public class ReadExcel {
	// 总行数
	private int totalRows = 0;
	// 总条数
	private int totalCells = 0;
	// 错误信息接收器
	private String errorMsg;

	// 构造方法
	public ReadExcel() {
	}

	
	
	
	
	// 获取总行数
	public int getTotalRows() {
		return totalRows;
	}

	// 获取总列数
	public int getTotalCells() {
		return totalCells;
	}

	// 获取错误信息-暂时未用到暂时留着
	public String getErrorInfo() {
		return errorMsg;
	}

	// 创建HSSFWorkbook对象(excel的文档对象)
	HSSFWorkbook wb = new HSSFWorkbook();
	// 建立新的sheet对象（excel的表单）
	HSSFSheet sheet = wb.createSheet("考勤统计表");


	/**
	 * 读EXCEL文件，获取客户信息集合
	 * 
	 * @param fielName
	 * @return
	 */
	public List<Customer> getExcelInfo(MultipartFile Mfile,String lujing) {
		
		// 把spring文件上传的MultipartFile转换成CommonsMultipartFile类型
		CommonsMultipartFile cf = (CommonsMultipartFile) Mfile; // 获取本地存储路径
		File file = new File(lujing);
		// 创建一个目录 （它的路径名由当前 File 对象指定，包括任一必须的父路径。）
		if (!file.exists())
			file.mkdirs();
		// 新建一个文件
		File file1 = new File(lujing + new Date().getTime() + ".xls");
		// 将上传的文件写入新建的文件中
		try {
			cf.getFileItem().write(file1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 初始化客户信息的集合
		List<Customer> customerList = new ArrayList<Customer>();
		// 初始化输入流
		FileInputStream is = null;
		Workbook wb = null;
		try {
			// 根据新建的文件实例化输入流
			is = new FileInputStream(file1);
			// 根据excel里面的内容读取客户信息

			// 当excel是2003时
			wb = new HSSFWorkbook(is);
			// 当excel是2007时
			// wb = new XSSFWorkbook(is);

			// 读取Excel里面客户的信息
			customerList = readExcelValue(wb);
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			file1.delete();
			if (is != null) {
			
				try {
					is.close();
				} catch (IOException e) {
					is = null;
					e.printStackTrace();
				}
			}
		}
		return customerList;
	}

	/**
	 * 读取Excel里面客户的信息
	 * 
	 * @param wb
	 * @return
	 */
	private List<Customer> readExcelValue(Workbook wb) {
		// 得到第一个shell
		Sheet sheet = wb.getSheetAt(0);

		// 得到Excel的行数
		this.totalRows = sheet.getPhysicalNumberOfRows();

		// 得到Excel的列数(前提是有行数)
		if (totalRows >= 1 && sheet.getRow(0) != null) {// 判断行数大于一，并且第一行必须有标题（这里有bug若文件第一行没值就完了）
			this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
		} else {
			this.totalCells = sheet.getRow(1).getPhysicalNumberOfCells();
		}

		List<Customer> customerList = new ArrayList<Customer>();// 声明一个对象集合
		Customer customer;// 声明一个对象

		// 循环Excel行数,从第二行开始。标题不入库
		for (int r = 1; r < totalRows; r++) {
			Row row = sheet.getRow(r);
			if (row == null)
				continue;
			customer = new Customer();

			// 循环Excel的列
			for (int c = 0; c < this.totalCells; c++) {
				Cell cell = row.getCell(c);
				if (null != cell) {
					if (c == 0) {
						customer.setCustomer1(getValue(cell));// 得到行中第一个值

					} else if (c == 1) {
						customer.setCustomer2(getValue(cell));// 得到行中第二个值

					} else if (c == 2) {
						customer.setCustomer3(getValue(cell));// 得到行中第三个值

					} else if (c == 3) {
						customer.setCustomer4(getValue(cell));// 得到行中第三个值

					} else if (c == 4) {
						customer.setCustomer5(getValue(cell));// 得到行中第三个值

					} else if (c == 5) {
						customer.setCustomer6(getValue(cell));// 得到行中第三个值
					} else if (c == 6) {
						customer.setCustomer7(getValue(cell));// 得到行中第三个值
					} else if (c == 7) {
						customer.setCustomer8(getValue(cell));// 得到行中第三个值
					} else if (c == 8) {
						customer.setCustomer9(getValue(cell));// 得到行中第三个值
					} else if (c == 9) {
						customer.setCustomer10(getValue(cell));// 得到行中第三个值
					}else if (c == 10) {
						customer.setCustomer11(getValue(cell));// 得到行中第三个值
					}else if (c == 11) {
						customer.setCustomer12(getValue(cell));// 得到行中第三个值
					}else if (c == 12) {
						customer.setCustomer13(getValue(cell));// 得到行中第三个值
					}else if (c == 13) {
						customer.setCustomer14(getValue(cell));// 得到行中第三个值
					}else if (c == 14) {
						customer.setCustomer15(getValue(cell));// 得到行中第三个值
					}
				}
			}
			// 添加对象到集合中
			customerList.add(customer);
		}
		return customerList;
	}

	/**
	 * 得到Excel表中的值
	 * 
	 * @param cell
	 *            Excel中的每一个格子
	 * @return Excel中每一个格子中的值
	 */
	@SuppressWarnings({ "static-access", "unused" })
	private String getValue(Cell cell) {
		if (cell.getCellType() == cell.CELL_TYPE_BOOLEAN) {
			// 返回布尔类型的值
			return String.valueOf(cell.getBooleanCellValue());
		} else if (cell.getCellType() == cell.CELL_TYPE_NUMERIC) {
			// 返回数值类型的值
			return String.valueOf(cell.getNumericCellValue());
		} else {
			// 返回字符串类型的值
			return String.valueOf(cell.getStringCellValue());
		}
	}

	//读取List内容 生成Excel表导出到服务器lujing→桌面
	public void setExcelInfo(List<Kqb> list,String lujing) throws IOException {

		HSSFFont fontStyle = wb.createFont();
		HSSFFont fontStyle2 = wb.createFont();
		HSSFFont fontStyle3 = wb.createFont();
		HSSFCellStyle cellstyle = wb.createCellStyle();
		HSSFCellStyle cellstyle2 = wb.createCellStyle();
		HSSFCellStyle cellstyle3 = wb.createCellStyle();
		
		 HSSFPrintSetup ps = sheet.getPrintSetup();
	        ps.setLandscape(true); //打印方向，true:横向，false:纵向
	        ps.setPaperSize(HSSFPrintSetup.A4_PAPERSIZE); //纸张
	        sheet.setMargin(HSSFSheet.BottomMargin, (double)0.3); //页边距（下）
	        sheet.setMargin(HSSFSheet.LeftMargin, (double)0.3); //页边距（左）
	        sheet.setMargin(HSSFSheet.RightMargin, (double)0.3); //页边距（右）
	        sheet.setMargin(HSSFSheet.TopMargin, (double)0.3); //页边距（上）
	        sheet.setHorizontallyCenter(true); //设置打印页面为水平居中
	       // sheet.setVerticallyCenter(true); //设置打印页面为垂直居中
		
		// 在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
		HSSFRow row0 = sheet.createRow(0);
		HSSFRow row1 = sheet.createRow(1);
		HSSFRow row2 = sheet.createRow(2);
		HSSFRow row3 = sheet.createRow(3);
		HSSFRow row4 = sheet.createRow(4);
		
		// 创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个
		HSSFCell cell = row0.createCell(0);
		
		// 设置单元格内容
		cell.setCellValue("考勤统计表");
		
		
		//自动换行
		cellstyle.setWrapText(true);
		//居中
		cellstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		cellstyle2.setWrapText(true);
		cellstyle2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		cellstyle3.setWrapText(true);
		cellstyle3.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		cellstyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框    
		cellstyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框    
		cellstyle.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框    
		cellstyle.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框   
		cellstyle2.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框    
		cellstyle2.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框    
		cellstyle2.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框    
		cellstyle2.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框   
		cellstyle3.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框    
		cellstyle3.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框    
		cellstyle3.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框    
		cellstyle3.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框   
		
		
		
		
		fontStyle2.setFontName("宋体");
		fontStyle2.setFontHeightInPoints((short) 10);// 设置字体大小

		fontStyle3.setFontName("宋体");
		fontStyle3.setFontHeightInPoints((short) 10);// 设置字体大小
		fontStyle3.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		
		//0-17列设置cellstyle2
		cellstyle2.setFont(fontStyle2);
		cellstyle3.setFont(fontStyle3);
		
	
		/*for (int i = 0; i < 15; i++) 
		{
			sheet.setDefaultColumnStyle(i, cellstyle2);
		}*/

		fontStyle.setFontName("宋体");
		fontStyle.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		fontStyle.setFontHeightInPoints((short) 16);// 设置字体大小
		cellstyle.setFont(fontStyle);
		cell.setCellStyle(cellstyle);

	
		CellRangeAddress cra1 =new CellRangeAddress(0, 1, 0, 15);
		CellRangeAddress cra2 =new CellRangeAddress(2, 4, 0, 0);
		CellRangeAddress cra3 =new CellRangeAddress(2, 4, 1, 1);
		CellRangeAddress cra4 =new CellRangeAddress(2, 4, 2, 2);
		
		CellRangeAddress cra5 =new CellRangeAddress(2, 2, 3, 13);
		
		CellRangeAddress cra6 =new CellRangeAddress(3, 4, 3, 3);
		CellRangeAddress cra7 =new CellRangeAddress(3, 4, 4, 4);
		CellRangeAddress cra8 =new CellRangeAddress(3, 4, 5, 5);
		
		CellRangeAddress cra9 =new CellRangeAddress(3, 3, 6, 10);
		
		CellRangeAddress cra10 =new CellRangeAddress(3, 4, 11, 11);
		CellRangeAddress cra11 =new CellRangeAddress(3, 4, 12, 12);
		CellRangeAddress cra14 =new CellRangeAddress(3, 4, 13, 13);
		
		CellRangeAddress cra12=new CellRangeAddress(2, 4, 14, 14);
		CellRangeAddress cra13 =new CellRangeAddress(2, 4, 15, 15);
		
	
		// 合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列
		sheet.addMergedRegion(cra1);
		sheet.addMergedRegion(cra2);
		sheet.addMergedRegion(cra3);
		sheet.addMergedRegion(cra4);

		sheet.addMergedRegion(cra5);

		sheet.addMergedRegion(cra6);
		sheet.addMergedRegion(cra7);
		sheet.addMergedRegion(cra8);

		sheet.addMergedRegion(cra9);

		sheet.addMergedRegion(cra10);
		sheet.addMergedRegion(cra11);
		sheet.addMergedRegion(cra14);

		
		sheet.addMergedRegion(cra12);
		sheet.addMergedRegion(cra13);

		
		
		
		// 创建单元格并设置单元格内容
		row2.createCell(0).setCellValue("序号");
		row2.getCell(0).setCellStyle(cellstyle3);
		row2.createCell(1).setCellValue("姓名");
		row2.getCell(1).setCellStyle(cellstyle3);
		row2.createCell(2).setCellValue("部门");
		row2.getCell(2).setCellStyle(cellstyle3);
		row2.createCell(3).setCellValue("出勤记录");
		row2.getCell(3).setCellStyle(cellstyle3);
		row2.createCell(14).setCellValue("打卡(次)");
		row2.getCell(14).setCellStyle(cellstyle3);
		row2.createCell(15).setCellValue("备注");
		row2.getCell(15).setCellStyle(cellstyle3);
		
		
		
		row3.createCell(3).setCellValue("实际上班(天)");
		row3.getCell(3).setCellStyle(cellstyle3);
		row3.createCell(4).setCellValue("休息日(天)");
		row3.getCell(4).setCellStyle(cellstyle3);
		row3.createCell(5).setCellValue("加班(天)");
		row3.getCell(5).setCellStyle(cellstyle3);
		row3.createCell(6).setCellValue("请休假(天)");
		row3.getCell(6).setCellStyle(cellstyle3);

		row3.createCell(11).setCellValue("迟到(次)");
		row3.getCell(11).setCellStyle(cellstyle3);
		row3.createCell(12).setCellValue("早退(次)");
		row3.getCell(12).setCellStyle(cellstyle3);
		row3.createCell(13).setCellValue("缺卡(次)");
		row3.getCell(13).setCellStyle(cellstyle3);

		
		row4.createCell(6).setCellValue("事假");
		row4.getCell(6).setCellStyle(cellstyle3);
		row4.createCell(7).setCellValue("病假");
		row4.getCell(7).setCellStyle(cellstyle3);
		row4.createCell(8).setCellValue("工伤假");
		row4.getCell(8).setCellStyle(cellstyle3);
		row4.createCell(9).setCellValue("产假");
		row4.getCell(9).setCellStyle(cellstyle3);
		row4.createCell(10).setCellValue("其他");
		row4.getCell(10).setCellStyle(cellstyle3);
		
		
			for(int i=5;i<list.size()+5;i++)
			{
				HSSFRow ttt = sheet.createRow(i);
				
			}
			
			
			/*this.setcusone(customerList1);
			this.setcustwo(customerList2);
*/
			int i = 5;
			for (Kqb kqb :list ) 
			{
				
				sheet.getRow(i).createCell(0).setCellValue(kqb.getxuhao());		
				sheet.getRow(i).createCell(1).setCellValue(kqb.getname());
				sheet.getRow(i).createCell(2).setCellValue(kqb.getdepartment());
				sheet.getRow(i).createCell(3).setCellValue(kqb.getworkday());
				sheet.getRow(i).createCell(4).setCellValue(kqb.getrestday());
				sheet.getRow(i).createCell(5).setCellValue(kqb.getoverday());
				sheet.getRow(i).createCell(6).setCellValue(kqb.getthingrest());
				sheet.getRow(i).createCell(7).setCellValue(kqb.getillrest());
				sheet.getRow(i).createCell(8).setCellValue(kqb.getinjurrest());
				sheet.getRow(i).createCell(9).setCellValue(kqb.getbirthrest());
				sheet.getRow(i).createCell(10).setCellValue(kqb.getotherrest());
				sheet.getRow(i).createCell(11).setCellValue(kqb.getovertime());
				sheet.getRow(i).createCell(12).setCellValue(kqb.getearlytime());
				sheet.getRow(i).createCell(13).setCellValue(kqb.getabsenteeismtime());
				sheet.getRow(i).createCell(14).setCellValue(kqb.getdakacishu());
				sheet.getRow(i).createCell(15).setCellValue("");
				//给下面的单元格设置字体边框
				for(int j=0;j<16;j++)
				{
					sheet.getRow(i).getCell(j).setCellStyle(cellstyle2);
				}
				
				i++;
			}
			//事假病假工伤假产假设置边框
			sheet.getRow(4).getCell(7).setCellStyle(cellstyle3);
			sheet.getRow(4).getCell(8).setCellStyle(cellstyle3);
			sheet.getRow(4).getCell(9).setCellStyle(cellstyle3);
			sheet.getRow(4).getCell(10).setCellStyle(cellstyle3);
			
			//设置列宽 单位为（ 字符/256）
			sheet.setColumnWidth(0,1200); 
			sheet.setColumnWidth(1,2200); 
			sheet.setColumnWidth(2,2200); 
			sheet.setColumnWidth(3,2200); 
			sheet.setColumnWidth(4,2200); 
			sheet.setColumnWidth(5,1500); 
			sheet.setColumnWidth(6,1500); 
			sheet.setColumnWidth(7,1500); 
			sheet.setColumnWidth(8,1800); 
			sheet.setColumnWidth(9,1500); 
			sheet.setColumnWidth(10,1500); 
			sheet.setColumnWidth(11,1500); 
			sheet.setColumnWidth(12,1500); 
			sheet.setColumnWidth(13,1500); 
			sheet.setColumnWidth(14,1500); 
			sheet.setColumnWidth(15,3500); 
			//给合并的单元格加边框 如果不放最后会被覆盖
			this.bk(cra1);
			this.bk(cra2);
			this.bk(cra3);
			this.bk(cra4);
			this.bk(cra5);
			this.bk(cra6);
			this.bk(cra7);
			this.bk(cra8);
			this.bk(cra9);
			this.bk(cra10);
			this.bk(cra11);
			this.bk(cra12);
			this.bk(cra13);
			this.bk(cra14);
			
			// 输出Excel文件
			FileOutputStream output = new FileOutputStream(lujing+"考勤统计表.xls");
			wb.write(output);
			output.close();
			
		

	}
	public void bk(CellRangeAddress cra)
	{

		RegionUtil.setBorderBottom(1, cra,  sheet, wb); // 下边框
		RegionUtil.setBorderLeft(1, cra, sheet, wb); // 左边框
		RegionUtil.setBorderRight(1, cra, sheet, wb); // 有边框
		RegionUtil.setBorderTop(1, cra, sheet, wb); // 上边框
	}

	
}
