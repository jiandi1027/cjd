package com.rowell.sifa.web.flow;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.engine.HistoryService;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.repository.ProcessDefinitionQuery;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Task;
import org.flowable.image.ProcessDiagramGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
 * <p>
 * Title: FlowAction
 * </p>
 * <p>
 * Description: 流程定义
 * </p>
 * <p>
 * Company: www.pango.com
 * </p>
 * 
 * @author marcle
 * @date 2016-12-20下午5:39:21
 * @version 1.0
 */
@Controller
@RequestMapping("/flow")
public class FlowController extends BaseController {

	@Autowired
	private RepositoryService repositoryService;

	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private HistoryService historyService;

	@Autowired
	private TaskService taskService;

	@Autowired
	ProcessEngineConfiguration processEngineConfiguration;

	// 流程定义部署页面
	@RequestMapping("/deployProcess")
	public String deployProcess(Model model) throws Exception {
		Deployment deployment = repositoryService.createDeployment()
				  .addClasspathResource("diagram/askLeave.bpmn20_2.xml")
				  .deploy();
		return "modules/flow/deployProcess";
	}

	// 流程定义部署提交
	@RequestMapping("/deployProcessSubmit")
	public String deployProcessSubmit(MultipartFile resource_bpmn, MultipartFile resource_png) throws Exception {
		// 第一步：上传文件
		// springmvc通过文件上传的参数解析器将页面提交 的file赋值给形参
		// resource_bpmn和resource_png存储了上传的文件

		// 第二步：调用activiti的service执行流程定义部署
		// 部署bpmn文件和png文件
		// bpmn文件名

		String resourceName_bpmn = resource_bpmn.getOriginalFilename();
		InputStream inputStream_bpmn = resource_bpmn.getInputStream();

		String resourceName_png = resource_png.getOriginalFilename();
		InputStream inputStream_png = resource_png.getInputStream();

		// 部署对象
		Deployment deployment = repositoryService.createDeployment().addInputStream(resourceName_bpmn, inputStream_bpmn)// 部署bpmn文件
				.addInputStream(resourceName_png, inputStream_png)// 部署png文件
				.deploy();

		// 部署对象id
		System.out.println("部署id：" + deployment.getId());

		System.out.println("部署时间：" + deployment.getDeploymentTime());

		// 返回到流程定义的查询页面
		return "redirect:queryProcessDefinition";
	}

	// 流程定义查询
	@RequestMapping("/queryProcessDefinition")
	public String queryProcessDefinition(Model model) throws Exception {

		// // 流程定义的key
		// String processDefinitionKey = ResourcesUtil.getValue(
		// "diagram.purchasingflow", "purchasingProcessDefinitionKey");// 采购流程标识
		// 创建查询对象
		ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();

		// 设置查询条件
		// 只查询采购流程的定义
		// processDefinitionQuery.processDefinitionKey(processDefinitionKey);

		// 查询列表
		List<ProcessDefinition> list = processDefinitionQuery.list();
		// 分页查询
		// processDefinitionQuery.listPage(firstResult, maxResults)
		// 根据流程定义的id查询一条记录
		// processDefinitionQuery.processDefinitionId(definitionId).singleResult();

		model.addAttribute("list", list);

		/*
		 * for (ProcessDefinition processDefinition : list) {
		 * System.out.println("================================");
		 * System.out.println("流程定义id：" + processDefinition.getId());
		 * System.out.println("流程定义部署id：" +
		 * processDefinition.getDeploymentId()); System.out.println("流程定义的key："
		 * + processDefinition.getKey()); System.out.println("流程定义的名称：" +
		 * processDefinition.getName()); System.out.println("bpmn资源名称：" +
		 * processDefinition.getResourceName()); System.out.println("png资源名称：" +
		 * processDefinition.getDiagramResourceName()); }
		 */

		return "modules/flow/queryProcessDefinition";
	}

	// 流程定义查询
	@RequestMapping("/processDefinitionList")
	@ResponseBody
	public EUDataGridResult processDefinitionList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		// // 流程定义的key
		// String processDefinitionKey = ResourcesUtil.getValue(
		// "diagram.purchasingflow", "purchasingProcessDefinitionKey");// 采购流程标识
		// 创建查询对象
		ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();

		// 设置查询条件
		// 只查询采购流程的定义
		// processDefinitionQuery.processDefinitionKey(processDefinitionKey);

		// 查询列表
		PageHelper.startPage(page, getPageSize());

		List<ProcessDefinition> list = processDefinitionQuery.list();

		PageInfo<ProcessDefinition> pageInfo = new PageInfo<ProcessDefinition>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// 删除流程定义
	@RequestMapping("/deleteProcessDefinition")
	public String deleteProcessDefinition(String processDefinitionId) throws Exception {

		// 根据流程定义id查询流程定义对象
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
				.processDefinitionId(processDefinitionId).singleResult();
		// 流程定义所属部署id
		String deploymentId = processDefinition.getDeploymentId();

		// 级联删除
		repositoryService.deleteDeployment(deploymentId, true);

		// 返回到流程定义的查询页面
		return "redirect:queryProcessDefinition";
	}

	// 流程定义资源文件查看
	@RequestMapping("/forQueryProcessDefinitionResource")
	/**
	 * 
	 * <p>
	 * Title: queryProcessDefinitionResource
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param response
	 *            输出 对象
	 * @param processDefinitionId
	 *            流程定义id
	 * @param resourcesType
	 *            资源 文件类型（bpmn和png）
	 * @throws Exception
	 */
	public String forQueryProcessDefinitionResource(Model model, HttpServletResponse response,
			String processDefinitionId, String resourceType,String processDetailUrl) throws Exception {
		model.addAttribute("processDefinitionId", processDefinitionId);
		model.addAttribute("resourceType", resourceType);
		model.addAttribute("processDetailUrl", processDetailUrl);
		return "/modules/flow/showProcessPic";
	}

	// 流程定义资源文件查看
	@RequestMapping("/queryProcessDefinitionResource")
	/**
	 * 
	 * <p>
	 * Title: queryProcessDefinitionResource
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param response
	 *            输出 对象
	 * @param processDefinitionId
	 *            流程定义id
	 * @param resourcesType
	 *            资源 文件类型（bpmn和png）
	 * @throws Exception
	 */
	public void queryProcessDefinitionResource(Model model,HttpServletResponse response, String processDefinitionId,
			String resourceType) throws Exception {
		
		model.addAttribute("processDefinitionId", processDefinitionId);
//		response.setCharacterEncoding("UTF-8");
//
//		// 根据流程定义id获取流程定义对象
//		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
//				.processDefinitionId(processDefinitionId).singleResult();
//		// 部署id
//		String deploymentId = processDefinition.getDeploymentId();
//
//		// 资源 文件名称
//		String resourceName = null;
//
//		if (resourceType.equals("bpmn")) {
//			// bpmn资源文件名称
//			resourceName = processDefinition.getResourceName();
//
//		} else if (resourceType.equals("png")) {
//			// png资源文件名称
//			resourceName = processDefinition.getDiagramResourceName();
//
//		}
//		// 资源 文件输入流
//		InputStream inputStream = repositoryService.getResourceAsStream(deploymentId, resourceName);
//		BufferedImage result = null;
//
//		BufferedImage im = ImageIO.read(inputStream);
//
//		/* 原始图像的宽度和高度 */
//		int width = im.getWidth();
//		int height = im.getHeight();
//
//		// 压缩计算
//		float resizeTimes = 0.8f; /* 这个参数是要转化成的倍数,如果是1就是转化成1倍 */
//
//		/* 调整后的图片的宽度和高度 */
//		int toWidth = (int) (width * resizeTimes);
//		int toHeight = (int) (height * resizeTimes);
//
//		/* 新生成结果图片 */
//		result = new BufferedImage(toWidth, toHeight, BufferedImage.TYPE_INT_RGB);
//
//		result.getGraphics().drawImage(im.getScaledInstance(toWidth, toHeight, java.awt.Image.SCALE_SMOOTH), 0, 0,
//				null);
//
//		ByteArrayOutputStream os = new ByteArrayOutputStream();
//		ImageIO.write(result, "gif", os);
//		InputStream is = new ByteArrayInputStream(os.toByteArray());
//
//		// 流复制
//
//		byte[] b = new byte[1024];
//
//		int len = -1;
//		while ((len = is.read(b, 0, 1024)) != -1) {
//			response.getOutputStream().write(b, 0, len);
//		}

	}

	// 动态图形
	// 当前运行流程中当前结点图形
	@RequestMapping("/queryActivityMap")
	public String queryActivityMap(Model model, String processInstanceId,String processDetailUrl) throws Exception {

		// 根据 流程实例的id查询出流程实例 的对象，从对象 中获取processDefinitionId。
		// 将流程定义 id传到页面，用于图形显示
				model.addAttribute("processInstanceId", processInstanceId);
				model.addAttribute("processDetailUrl", processDetailUrl);
//		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
//				.processInstanceId(processInstanceId).singleResult();
//
//		String processDefinitionId = processInstance.getProcessDefinitionId();
//
//		// 将流程定义 id传到页面，用于图形显示
//		model.addAttribute("processDefinitionId", processDefinitionId);
//
//		// 根据流程实例 id processInstanceId，获取当前结点
//		String activityId = processInstance.getActivityId();
//
//		// 根据 流程定义 id查询流程定义 实体对象
//		ProcessDefinitionEntity processDefinitionEntity = (ProcessDefinitionEntity) repositoryService
//				.getProcessDefinition(processDefinitionId);
//
//		// 从流程定义 实体对象查询结点的坐标和宽高
//		// ActivityImpl activityImpl =
//		// processDefinitionEntity.findActivity(activityId);
//		BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
//		Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).active().singleResult();
//		//
//		GraphicInfo graphicInfo = bpmnModel.getGraphicInfo(task.getTaskDefinitionKey());
//
//		// 从流程定义 实体对象查询结点的坐标和宽高
//		Double activity_x = graphicInfo.getX();// 坐标
//		Double activity_y = graphicInfo.getY();// 坐标
//		Double activity_width = graphicInfo.getWidth();// 宽
//		Double activity_height = graphicInfo.getHeight();// 高
//		//
//		model.addAttribute("activity_x", activity_x);
//		model.addAttribute("activity_y", activity_y);
//		model.addAttribute("activity_width", activity_width);
//		model.addAttribute("activity_height", activity_height);

		return "modules/flow/showProcessPic";

	}

	// 动态图形
	// 当前运行流程中当前结点图形
	@RequestMapping("/queryActivityMap2")
	public String queryActivityMap2(Model model, String processInstanceId) throws Exception {
		model.addAttribute("processInstanceId", processInstanceId);
		return "modules/flow/showProcessPic";
	}

	@RequestMapping("/ceateProcessImage")
	public void ceateProcessImage(Model model, String processInstanceId,String processDefinitionId) throws Exception {
		// 根据 流程实例的id查询出流程实例 的对象，从对象 中获取processDefinitionId。
		String taskDefinitionKey="";
		if(!StringUtils.isBlank(processInstanceId)){
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
					.processInstanceId(processInstanceId).active().singleResult();
			
			Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).active().singleResult();
			taskDefinitionKey = task.getTaskDefinitionKey();
			
			processDefinitionId = processInstance.getProcessDefinitionId();
		}
		
		
		// 获取流程图
		BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);

		ProcessDiagramGenerator diagramGenerator = processEngineConfiguration.getProcessDiagramGenerator();
		ProcessDefinitionEntity definitionEntity = (ProcessDefinitionEntity) repositoryService
				.getProcessDefinition(processDefinitionId);

		List<HistoricActivityInstance> highLightedActivitList = historyService.createHistoricActivityInstanceQuery()
				.processInstanceId(processInstanceId).list();
		// 高亮环节id集合
		List<String> highLightedActivitis = new ArrayList<String>();
		// 高亮线路id集合
		List<String> highLightedFlows = new ArrayList<String>();
		// getHighLightedFlows(definitionEntity,highLightedActivitList);

//		for (HistoricActivityInstance tempActivity : highLightedActivitList) {
//			String activityId = tempActivity.getActivityId();
//			highLightedActivitis.add(activityId);
//		}
		if(!StringUtils.isBlank(taskDefinitionKey)){
			highLightedActivitis.add(taskDefinitionKey);
		}
		
		
		// processInstance.getActivityId()
		// 中文显示的是口口口，设置字体就好了
		InputStream imageStream = diagramGenerator.generateDiagram(bpmnModel, "png", highLightedActivitis,
				highLightedFlows, processEngineConfiguration.getActivityFontName(), processEngineConfiguration.getLabelFontName(), processEngineConfiguration.getAnnotationFontName(), processEngineConfiguration.getClassLoader(), 1.0);
		// InputStream imageStream = diagramGenerator.generateDiagram(bpmnModel,
		// "png", highLightedActivitis,0.8);
		// 单独返回流程图，不高亮显示
		// InputStream imageStream =
		// diagramGenerator.generatePngDiagram(bpmnModel);
		// 输出资源内容到相应对象
		byte[] b = new byte[1024];
		int len;
		while ((len = imageStream.read(b, 0, 1024)) != -1) {
			response.getOutputStream().write(b, 0, len);
		}
		
		

	}

}
