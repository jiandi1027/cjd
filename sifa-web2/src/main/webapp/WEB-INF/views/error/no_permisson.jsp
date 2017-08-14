<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>拒绝访问</title>
<link rel="stylesheet" href="${ctx}/css/reset.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/css/default.css" type="text/css" />
<script src="${ctx}/js/jquery-1.7.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".more").click(function(){
  $(".detailed").toggle();
  $(this).toggleClass("on");
  });
});
</script>
</head>

<body class="rBody">
	<div class="error">
    	<div class="eBox">
        	<h3>拒绝访问</h3>
            <div class="con">
            	<div class="summary">
                    <h4>信息：</h4>
                    <p>• 请先登录，再访问！</p>
                </div>
            </div>
        </div>
    	<span class="ico"></span>
        <cite class="tl">&nbsp;</cite><cite class="tr">&nbsp;</cite><cite class="bl">&nbsp;</cite><cite class="br">&nbsp;</cite>
    </div>
</body>
</html>
