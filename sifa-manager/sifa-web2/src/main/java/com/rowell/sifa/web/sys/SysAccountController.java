package com.rowell.sifa.web.sys;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.security.MD5;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.commons.shiro.ShiroDbRealm;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  帐号Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/sysAccount")
public class SysAccountController extends BaseController {

	@Autowired
	private SysAccountService sysAccountService;
	@Autowired
	private ShiroDbRealm shiroDbRealm;


	@ModelAttribute("sysAccount")
	public SysAccount get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return sysAccountService.findById(id);
		} else {
			return new SysAccount();
		}
	}

	// @RequiresPermissions("sys:sysDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SysAccount sysAccount, Model model, HttpServletRequest request) {
		return "modules/sys/sysAccountList";
	}

	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(@ModelAttribute("sysAccount")SysAccount sysAccount,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(sysAccount.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(sysAccount.getOrderStr());
		}

		List<SysAccount> list = sysAccountService.findAll(sysAccount);

		PageInfo<SysAccount> pageInfo = new PageInfo<SysAccount>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:sysAccount:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("sysAccount") SysAccount sysAccount, Model model) {

		return "modules/sys/sysAccountForm";
	}

	// @RequiresPermissions("sys:sysAccount:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(SysAccount sysAccount, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, sysAccount)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
//			if (!StringUtils.isBlank(sysAccount.getPassword())) {
//				sysAccount.setPassword(MD5.code(sysAccount.getPassword(), 16));
//			}

			if (StringUtils.isBlank(sysAccount.getId())) {
				if (!StringUtils.isBlank(sysAccount.getAccount()) && StringUtils.isBlank(sysAccount.getAccountname())) {
					sysAccount.setAccountname(sysAccount.getAccount());
				}
				sysAccountService.saveOrUpdate(sysAccount);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存用户" + sysAccount.getAccountname() + "成功");
			} else {
				sysAccountService.updateByIdSelective(sysAccount);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改用户" + sysAccount.getAccountname() + "成功");
			}
			//清空用户缓存
			shiroDbRealm.removeUserCache(sysAccount.getAccount());
			SysAccountUtils.clearSysAccountCache(sysAccount);
			
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(sysAccount.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存用户" + sysAccount.getAccountname() + "失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改用户" + sysAccount.getAccountname() + "失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}

	// @RequiresPermissions("sys:sysAccount:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(SysAccount sysAccount, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (SysAccountUtils.getSysAccount().getId().equals(sysAccount.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "不允许删除当前用户！", true);
			} else {
				sysAccountService.deleteById(sysAccount.getId());
				commonJsonResult = CommonJsonResult.build(200, "删除用户成功！", false);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除用户失败！", true);
		}
		return commonJsonResult;
	}

	// @RequiresPermissions("sys:sysAccount:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(SysAccount sysAccount, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			boolean isCurrentUser = false;
			if (sysAccount.getIds() != null) {
				for (String id : sysAccount.getIds()) {
					if (SysAccountUtils.getSysAccount().getId().equals(id)) {
						isCurrentUser = true;
						break;
					}

				}
			}

			if (isCurrentUser) {
				commonJsonResult = CommonJsonResult.build(505, "不允许删除当前用户！", true);
			} else {
				sysAccountService.batchDelete(sysAccount.getIds());
				commonJsonResult = CommonJsonResult.build(200, "删除用户成功！", false);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除用户失败！", true);
		}
		return commonJsonResult;
	}

	@RequestMapping(value = "editPassword")
	public String editPassword(@ModelAttribute("sysAccount") SysAccount sysAccount, Model model) {
		return "modules/sys/sysAccountRePassword";
	}
	
	@RequestMapping(value = "checkAccount")
	public void checkAccount(@ModelAttribute("sysAccount") SysAccount sysAccount, Model model,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		SysAccount sysAccountEntity = sysAccountService.selectByAccount(sysAccount.getAccount());
		if(StringUtils.isBlank(sysAccount.getId())){
			if(sysAccountEntity!=null){
				out.print(false);
			}else{
				
				out.print(true);
			}
		}else{
			if(sysAccountEntity!=null&&sysAccountEntity.getAccount().equals(sysAccount.getAccount())){
				out.print(true);
			}else{
				if(sysAccountEntity==null){
					out.print(true);
				}else{
					out.print(false);
				}
			}
		}
		
	}
	
	@RequestMapping(value = "findSysAccount")
	@ResponseBody
	public List<SysAccount> list(SysAccount sysAccount, Model model) {
		List<SysAccount> sysAccountList=sysAccountService.findAll(sysAccount);
		return sysAccountList;
	}
	@RequestMapping(value = "roleName")
	public void roleName(SysAccount sysAccount, Model model,HttpServletResponse response) throws Exception {
		 response.setCharacterEncoding("utf-8"); 
		 PrintWriter out = response.getWriter();
		 String roleName = sysAccount.getRoleName();
		 if( !"".equals(roleName) && roleName != null){
			 out.print(roleName);
			 out.flush();
			 out.close();
		 }
		
	}
}
