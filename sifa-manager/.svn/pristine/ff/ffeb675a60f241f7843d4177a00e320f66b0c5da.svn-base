package com.rowell.sifa.web.sys;

import java.util.ArrayList;

import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rowell.sifa.web.base.BaseController;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;

import com.rowell.sifa.pojo.sys.Kqb;
import com.rowell.sifa.pojo.sys.Qxjb;
import com.rowell.sifa.pojo.sys.Tjb;
import com.rowell.sifa.service.sys.KqbService;
import com.rowell.sifa.service.sys.QxjbService;
import com.rowell.sifa.service.sys.TjbService;
import com.rowell.sifa.sys.utils.Customer;
import com.rowell.sifa.sys.utils.ReadExcel;

@Controller
@RequestMapping(value = "/sys/biaoge")
public class BiaogeController extends BaseController
{

	@Autowired
	private TjbService tjbService;
	@Autowired
	private QxjbService qxjbService;
	@Autowired
	private KqbService kqbService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Model model, HttpServletRequest request)
	{
		return "modules/sys/biaogeList";
	}

	@RequestMapping(value = "list1", method = RequestMethod.GET)
	public String forList1(Model model, HttpServletRequest request)
	{
		return "modules/sys/tjbList";
	}

	@RequestMapping(value = "list2", method = RequestMethod.GET)
	public String forList2(Model model, HttpServletRequest request)
	{
		return "modules/sys/qxjbList";
	}

	@RequestMapping(value = "list3", method = RequestMethod.GET)
	public String forList3(Model model, HttpServletRequest request)
	{
		return "modules/sys/kqbList";
	}

	@RequestMapping(value =
	{ "list1", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list1(Tjb tjb, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "biaoji", required = false, defaultValue = "1") String biaoji,
			HttpServletRequest request, HttpServletResponse response)
	{

		try
		{

			PageHelper.startPage(page, getPageSize());
			List<Tjb> list = null;
			// 如果正常导入
			if (biaoji.equals("1"))
			{
				// 找到导入数据库的最后一条
				tjb.setZuida("-1");
				list = tjbService.findAll(tjb);
			} else if (biaoji.equals("2"))// 搜索框
			{
				tjb.setJihao("-1");// 找到所有存入的数据
				list = tjbService.findAll(tjb);
			}

			PageInfo<Tjb> pageInfo = new PageInfo<Tjb>(list);

			// 创建一个返回值对象
			EUDataGridResult result = new EUDataGridResult();
			result.setRows(list);
			// 取记录总条数
			result.setTotal(pageInfo.getTotal());
			return result;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}

	@RequestMapping(value =
	{ "list2", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list2(Qxjb qxjb,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			@RequestParam(value = "biaoji", required = false, defaultValue = "1") String biaoji,
			HttpServletResponse response)
	{

		try
		{

			PageHelper.startPage(page, getPageSize());
			List<Qxjb> list = null;
			// 如果正常导入
			if (biaoji.equals("1"))
			{
				// 找到导入数据库的最后一条
				qxjb.setZuida("-1");
				list = qxjbService.findAll(qxjb);
			} else if (biaoji.equals("2"))// 搜索框
			{
				qxjb.setJihao("-1");// 找到所有存入的数据
				list = qxjbService.findAll(qxjb);
			}

			PageInfo<Qxjb> pageInfo = new PageInfo<Qxjb>(list);
			// 创建一个返回值对象
			EUDataGridResult result = new EUDataGridResult();
			result.setRows(list);
			// 取记录总条数
			result.setTotal(pageInfo.getTotal());
			return result;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;

	}

	@RequestMapping(value =
	{ "list3", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list3(Kqb kqb, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "biaoji", required = false, defaultValue = "1") String biaoji,
			HttpServletRequest request, HttpServletResponse response)
	{

		try
		{

			PageHelper.startPage(page, getPageSize());
			// 四假
			String tt = kqb.getthingrest();

			if ("事假".equals(tt))
			{
				kqb.setthingrest("0");
			} else if ("病假".equals(tt))
			{
				kqb.setthingrest("");
				kqb.setillrest("0");
			} else if ("工伤假".equals(tt))
			{
				kqb.setthingrest("");
				kqb.setinjurrest("0");
			} else if ("产假".equals(tt))
			{
				kqb.setthingrest("");
				kqb.setbirthrest("0");
			}

			List<Kqb> list = null;
			// 如果正常导入
			if (biaoji.equals("1"))
			{
				// 找到导入数据库的最后一条
				kqb.setZuida("-1");
				list = kqbService.findAll(kqb);
			} else if (biaoji.equals("2"))// 搜索框搜索
			{
				kqb.setJihao("-1");// 找到所有存入的数据
				list = kqbService.findAll(kqb);
			}

			// String jihao=kqbService.findJihao();

			for (int i = 1; i < list.size() + 1; i++)
			{
				list.get(i - 1).setxuhao(i + "");
			}

			PageInfo<Kqb> pageInfo = new PageInfo<Kqb>(list);
			// 创建一个返回值对象
			EUDataGridResult result = new EUDataGridResult();
			result.setRows(list);
			// 取记录总条数
			result.setTotal(pageInfo.getTotal());
			return result;
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return null;
	}

	// 判断是否存在该月份考勤表
	@RequestMapping(value = "panduan", method = RequestMethod.POST)
	@ResponseBody
	public CommonJsonResult panduan(@RequestParam(value = "yuefen") String yuefen, HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
		CommonJsonResult commonJsonResult = null;

		Kqb kqb = new Kqb();
		kqb.setTime(yuefen);

		if (kqbService.findAll(kqb).isEmpty())
		{
			commonJsonResult = CommonJsonResult.build(200, "没有该月份记录");
			commonJsonResult.setData(yuefen);
		} else
		{
			commonJsonResult = CommonJsonResult.build(550, "已存在该月份记录");
		}

		return commonJsonResult;
	}

	// 把考勤表添加到数据库 生成到服务器桌面
	@RequestMapping(value = "batchimport", method = RequestMethod.POST)
	@ResponseBody
	public CommonJsonResult batchimport(@RequestParam(value = "fugai", required = false, defaultValue = "-1") int fugai,
			@RequestParam(value = "yuefen", required = false, defaultValue = "1") String yuefen,
			HttpServletRequest request, HttpServletResponse response) throws IOException
	{

		CommonJsonResult commonJsonResult = null;
		// 获取桌面路径
		File desktopDir = FileSystemView.getFileSystemView().getHomeDirectory();
		String desktopPath = desktopDir.getAbsolutePath();
		String lujing = desktopPath.replace("\\", "/");
		lujing = lujing + "/";

		ReadExcel readExcel = new ReadExcel();
		List<Kqb> kqblist = new ArrayList();

		List<Tjb> customerList1 = null;
		// 找到导入数据库的最后一条
		Tjb tjb = new Tjb();
		tjb.setZuida("-1");
		customerList1 = tjbService.findAll(tjb);

		List<Qxjb> customerList2 = null;
		// 找到导入数据库的最后一条
		Qxjb qxjb = new Qxjb();
		qxjb.setZuida("-1");
		customerList2 = qxjbService.findAll(qxjb);

		// 对表一表二的数据进行处理 生成考勤表的数据
		Vector vec = new Vector();

		int i = 1;
		// 取出行
		for (Tjb tjblist1 : customerList1)
		{
			Kqb kqb = new Kqb();

			// 如果集合内没有该姓名
			if (!vec.contains(tjblist1.getname()))
			{
				vec.add(tjblist1.getname());
				kqb.setxuhao(i + ""); // 序号
				kqb.setname(tjblist1.getname());// 姓名
				kqb.setdepartment(tjblist1.getdepartment());// 部门
				kqb.setworkday("0"); // 实际上班 迟到早退打卡都先设置0
				kqb.setovertime("0");
				kqb.setearlytime("0");
				kqb.setdakacishu("0");
				kqb.setabsenteeismtime("0");

				if (tjblist1.getdakashijian() == null || tjblist1.getdakacishu() == "0"
						|| tjblist1.getdakacishu() == null)
				{

				} else
				{
					// 设置实际上班为 打卡/3 保留两位小数
					double day = Double.parseDouble(tjblist1.getdakacishu()) / 3;
					kqb.setworkday(new java.text.DecimalFormat("#0.00").format(day) + "");
					// 把获取到的打卡时间和迟到早退范围比较 如果迟到早退设置为1
					DateFormat df = new SimpleDateFormat("HH:mm:ss");// 创建日期转换对象HH:mm:ss为时分秒，年月日为yyyy-MM-dd
					String[] time = tjblist1.getdakashijian().split(",");
					int zong = time.length;

					Date dakashijian = null;
					Date qishi1 = null;// 迟到范围
					Date jieshu1 = null;

					Date qishi2 = null;// 早退范围
					Date jieshu2 = null;

					try
					{
						qishi1 = df.parse("08:30:00");
						jieshu1 = df.parse("12:00:00");
						qishi2 = df.parse("15:00:00");
						jieshu2 = df.parse("17:30:00");
						kqb.setovertime("0");
						kqb.setearlytime("0");

						for (int c = 0; c < time.length; c++)
						{
							dakashijian = df.parse(time[c]);

							// 如果迟到 设置1
							if (dakashijian.getTime() > qishi1.getTime() && dakashijian.getTime() < jieshu1.getTime())
							{
								kqb.setovertime("1");
							}
							if (dakashijian.getTime() > qishi2.getTime() && dakashijian.getTime() < jieshu2.getTime())
							{
								kqb.setearlytime("1");
							}
						}
					} catch (ParseException e)
					{

						e.printStackTrace();
					}
					// 设置打卡
					// 因为获取的Excel数据有可能是3.0不能直接转换成3 所以先转换成double再转int
					int daka = (int) Double.parseDouble(tjblist1.getdakacishu());
					// 打卡次数

					if (daka == 1)
					{
						kqb.setabsenteeismtime("2");
					} else if (daka == 2)
					{
						kqb.setabsenteeismtime("1");
					} else if (daka == 0)
					{
						kqb.setabsenteeismtime("3");
					}

					kqb.setdakacishu(daka + "");

				}

				// 对表格二处理 设置几个假期和休息日
				double shangban = 0;
				double xiuxi = 0;
				double shijia = 0;
				double bingjia = 0;
				double gongshangjia = 0;
				double chanjia = 0;
				double qita = 0;

				for (Qxjb qxjblist1 : customerList2)
				{
					if (qxjblist1.getname().equals(tjblist1.getname()) && qxjblist1.getleavetype() != null
							&& qxjblist1.gettotalday() != null)
					{
						if (qxjblist1.getleavetype().equals("节假日") || qxjblist1.getleavetype().equals("补休")
								|| qxjblist1.getleavetype().equals("双休"))
						{
							xiuxi += Double.parseDouble(qxjblist1.gettotalday());
						}
						if (qxjblist1.getleavetype().equals("事假"))
						{
							shijia += Double.parseDouble(qxjblist1.gettotalday());
						}
						if (qxjblist1.getleavetype().equals("病假"))
						{
							bingjia += Double.parseDouble(qxjblist1.gettotalday());
						}
						if (qxjblist1.getleavetype().equals("工伤假"))
						{
							gongshangjia += Double.parseDouble(qxjblist1.gettotalday());
						}
						if (qxjblist1.getleavetype().equals("产假"))
						{
							chanjia += Double.parseDouble(qxjblist1.gettotalday());
						}
						if (qxjblist1.getleavetype().equals("公出") || qxjblist1.getleavetype().equals("出差")
								|| qxjblist1.getleavetype().equals("其他"))
						{
							qita += Double.parseDouble(qxjblist1.gettotalday());
						}
					}
				}
				kqb.setrestday(xiuxi + "");
				kqb.setthingrest(shijia + "");
				kqb.setillrest(bingjia + "");
				kqb.setinjurrest(gongshangjia + "");
				kqb.setbirthrest(chanjia + "");
				kqb.setotherrest(qita + "");
				// 传入月份
				/*
				 * customer.setCustomer15(yuefen);
				 */
				// 把处理完的表格添加到list
				kqblist.add(kqb);
				i++;
			} else
			{
				for (int t = 0; t < kqblist.size(); t++)
				{
					// 如果取出的人的名字和存入LIST中的人名字匹配
					if (kqblist.get(t).getname().equals(tjblist1.getname()))
					{

						if (tjblist1.getdakashijian() == null || tjblist1.getdakacishu() == "0"
								|| tjblist1.getdakacishu() == null)
						{
							// 打卡次数或时间为0为空 缺卡+3
							int a = Integer.valueOf(kqblist.get(t).getabsenteeismtime().toString());
							a += 3;
							kqblist.get(t).setabsenteeismtime(a + "");
						} else
						{

							int aa = Integer.valueOf(kqblist.get(t).getdakacishu());
							// 因为获取的Excel数据有可能是3.0不能直接转换成3 所以先转换成double再转int
							int bb = (int) Double.parseDouble(tjblist1.getdakacishu());
							int cc = aa + bb;

							double day1 = Double.parseDouble(tjblist1.getdakacishu()) / 3;
							// 获取实际上班天
							double day2 = Double.parseDouble(kqblist.get(t).getworkday());
							double day = day1 + day2;

							kqblist.get(t).setworkday(new java.text.DecimalFormat("#.00").format(day) + "");
							kqblist.get(t).setworkday(cc + "");

							DateFormat df = new SimpleDateFormat("HH:mm:ss");// 创建日期转换对象HH:mm:ss为时分秒，年月日为yyyy-MM-dd
							String[] time = tjblist1.getdakashijian().split(",");

							Date dakashijian = null;
							Date qishi1 = null;// 迟到范围
							Date jieshu1 = null;

							Date qishi2 = null;// 早退范围
							Date jieshu2 = null;
							int cishu1 = (int) Double.parseDouble(tjblist1.getdakacishu());
							int cishu2 = Integer.valueOf(kqblist.get(t).getdakacishu());
							int cishu = cishu1 + cishu2;
							kqblist.get(t).setdakacishu(cishu + "");

							if (cishu1 == 1)
							{
								int a = Integer.valueOf(kqblist.get(t).getabsenteeismtime().toString());
								a += 2;
								kqblist.get(t).setabsenteeismtime(a + "");
							} else if (cishu1 == 2)
							{
								int a = Integer.valueOf(kqblist.get(t).getabsenteeismtime().toString());

								a += 1;
								kqblist.get(t).setabsenteeismtime(a + "");
							}

							try
							{

								qishi1 = df.parse("08:30:00");
								jieshu1 = df.parse("12:00:00");
								qishi2 = df.parse("15:00:00");
								jieshu2 = df.parse("17:30:00");

								for (int c = 0; c < time.length; c++)
								{
									dakashijian = df.parse(time[c]);
									if (dakashijian.getTime() > qishi1.getTime()
											&& dakashijian.getTime() < jieshu1.getTime())
									{
										int a = Integer.valueOf(kqblist.get(t).getovertime().toString());
										a++;
										kqblist.get(t).setovertime(a + "");
									}
									if (dakashijian.getTime() > qishi2.getTime()
											&& dakashijian.getTime() < jieshu2.getTime())
									{
										int a = Integer.valueOf(kqblist.get(t).getearlytime());
										a++;

										kqblist.get(t).setearlytime(a + "");
									}
								}
							} catch (ParseException e)
							{

								e.printStackTrace();
							}

						}
					}
				}
			}
		}

		// 生成表并把表导出到服务器的桌面
		readExcel.setExcelInfo(kqblist, lujing);

		// 如果需要覆盖数据 删除数据库已存在的表
		if (fugai == 1)
		{
			// 根据月份找到考勤表
			Kqb kqb2 = new Kqb();
			kqb2.setTime(yuefen);
			List<Kqb> aaa = kqbService.findAll(kqb2);
			// 获取考勤表的记号
			String jihao = aaa.get(0).getJihao();

			Tjb tjb1 = new Tjb();
			tjb1.setJihao(jihao);
			List tjblist = tjbService.findAll(tjb1);
			for (int c = 0; c < tjblist.size(); c++)
			{

			}

			for (int x = 0; x < aaa.size(); x++)
			{

				kqbService.deleteById(aaa.get(x).getId());

			}
			Qxjb qxjb2 = new Qxjb();
			qxjb2.setJihao(jihao);
			List<Qxjb> bbb = qxjbService.findAll(qxjb2);
			for (int x = 0; x < bbb.size(); x++)
			{
				qxjbService.deleteById(bbb.get(x).getId());
			}
			Tjb tjb2 = new Tjb();
			tjb2.setJihao(jihao);
			List<Tjb> ccc = tjbService.findAll(tjb2);
			for (int x = 0; x < ccc.size(); x++)
			{
				tjbService.deleteById(ccc.get(x).getId());
			}
		}

		if (fugai == 1 || fugai == -1) // 如果已存在数据 又不覆盖 就不添加
		{
			// 把新数据存进数据库

			String zuida = null;
			zuida = kqbService.findMax();

			int t1 = 1;

			try
			{
				t1 = Integer.valueOf(zuida) + 1;
			} catch (Exception e)
			{

			}

			String jihao = null;
			jihao = kqbService.findJihao();
			int t2 = 1;

			try
			{
				t2 = Integer.valueOf(jihao) + 1;
			} catch (Exception e)
			{

			}

			for (Kqb kqb : kqblist)
			{

				kqb.setZuida(t1 + "");
				kqb.setJihao(t2 + "");
				kqb.setTime(yuefen);

				// 把考勤表加到数据库
				kqbService.insert(kqb);
			}
			// 另外两张表的最后一张打上记号和考勤表绑定
			qxjbService.updatejihao(t2 + "");
			tjbService.updatejihao(t2 + "");

		}
		if (fugai == 0)
		{
			commonJsonResult = CommonJsonResult.build(200, "生成Excel成功");
		} else if (fugai == -1)
		{
			commonJsonResult = CommonJsonResult.build(200, "生成Excel成功");
		} else if (fugai == 1)
		{
			commonJsonResult = CommonJsonResult.build(200, "覆盖数据成功");
		}

		// 删除无用的表 标记记号为0的
		qxjbService.deletejihao("0");
		tjbService.deletejihao("0");
		commonJsonResult.setData(kqblist);
		return commonJsonResult;

	}

	@RequestMapping(value = "file", method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult view(@RequestParam(value = "filename1") MultipartFile file1,
			@RequestParam(value = "filename2") MultipartFile file2, @RequestParam(value = "biaoshi") String biaoshi,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{

		ReadExcel readExcel = new ReadExcel();
		// 取得桌面路径
		File desktopDir = FileSystemView.getFileSystemView().getHomeDirectory();
		String desktopPath = desktopDir.getAbsolutePath();
		String lujing = desktopPath.replace("\\", "/");
		lujing = lujing + "/";
		PageHelper.startPage(page, getPageSize());

		if (biaoshi.equals("1"))
		{
			// 把读取的文件存到桌面（lujing） 然后读取file1的数据 再删除读取的桌面文件
			List<Customer> customerList = readExcel.getExcelInfo(file1, lujing);
			if (customerList.get(0).getCustomer1().equals("部门名称"))
			{
				customerList.remove(0);

			}
			// 把统计表存进数据库
			Tjb tjb = new Tjb();
			String zuida = null;
			zuida = tjbService.findMax();

			int b = 1;

			try
			{
				b = Integer.valueOf(zuida) + 1;
			} catch (Exception e)
			{

			}

			for (Customer customer : customerList)
			{

				tjb.setdepartment(customer.getCustomer1());
				tjb.setbianhao(customer.getCustomer2());
				tjb.setname(customer.getCustomer3());
				tjb.setdatetime(customer.getCustomer4());
				int cishu = 0;

				if (customer.getCustomer5() != null)
				{
					cishu = (int) Double.parseDouble(customer.getCustomer5());
				}

				tjb.setdakacishu(cishu + "");
				tjb.setdakashijian(customer.getCustomer6());
				tjb.setZuida(b + "");
				tjb.setJihao("0");
				tjbService.insert(tjb);
			}

			PageInfo<Customer> pageInfo = new PageInfo<Customer>(customerList);

			EUDataGridResult result = new EUDataGridResult();
			result.setRows(customerList);
			// 取记录总条数
			result.setTotal(pageInfo.getTotal());
			return result;

		} else if (biaoshi.equals("2"))
		{
			// 把读取的文件存到桌面（lujing） 然后读取file1的数据 再删除读取的桌面文件
			List<Customer> customerList = readExcel.getExcelInfo(file2, lujing);
			if (customerList.get(0).getCustomer1().equals("填表日期"))
			{
				customerList.remove(0);

			}

			// 把统计表存进数据库
			Qxjb qxjb = new Qxjb();
			String zuida = null;
			zuida = qxjbService.findMax();

			int b = 1;

			try
			{
				b = Integer.valueOf(zuida) + 1;
			} catch (Exception e)
			{

			}

			for (Customer customer : customerList)
			{

				qxjb.setdatetime(customer.getCustomer1());
				qxjb.setname(customer.getCustomer2());
				qxjb.setdepartment(customer.getCustomer3());
				qxjb.setleavetype(customer.getCustomer4());
				qxjb.setstarttime1(customer.getCustomer5());
				qxjb.setstarttime2(customer.getCustomer6());
				qxjb.setendtime1(customer.getCustomer7());
				qxjb.setendtime2(customer.getCustomer8());
				qxjb.settotalday(customer.getCustomer9());
				qxjb.setreason(customer.getCustomer10());

				qxjb.setZuida(b + "");
				// 打上记号为0 如果没和考勤表绑定就删除
				qxjb.setJihao("0");
				qxjbService.insert(qxjb);
			}

			PageInfo<Customer> pageInfo = new PageInfo<Customer>(customerList);

			EUDataGridResult result = new EUDataGridResult();
			result.setRows(customerList);
			// 取记录总条数
			result.setTotal(pageInfo.getTotal());
			return result;

			// return customerList;
		}

		return null;
	}

}
