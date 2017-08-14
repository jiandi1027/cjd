/*
* SysCallBackmsgMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-05-02 created
*/
package com.rowell.sifa.mapper.sys;

import java.util.List;

import com.rowell.sifa.pojo.sys.SysCallBackmsg;

public interface SysCallBackmsgMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.sys.SysCallBackmsg> {

	List<SysCallBackmsg> findMaxByTelno(String telno);
}